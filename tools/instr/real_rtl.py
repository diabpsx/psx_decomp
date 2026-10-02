#!/usr/bin/env python3
"""Dump one function's RTL using the real project compiler, without changing gate flags.

Example: python tools/instr/real_rtl.py recon/psxsrc/gpanel.cpp GPanel::DrawDurThingy --dump loop
Focused multi-pass example:
  python tools/instr/real_rtl.py recon/psxsrc/biglump.cpp BL_AsyncReadFile \
      --dump greg,sched2,dbr --around TSK_Sleep --context 18
Artifacts remain in build/rtl/<TU>-<unique-id> for inspection. Compilation failure,
a missing dump, an absent or ambiguous function, and an unmatched focus expression
all produce a nonzero exit.
"""
import argparse
from pathlib import Path
import re
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B

DUMPS = {"rtl": ("-dr", ".rtl"), "jump": ("-dj", ".jump"), "jump2": ("-dJ", ".jump2"),
         "greg": ("-dg", ".greg"), "lreg": ("-dl", ".lreg"),
         "loop": ("-dL", ".loop"), "flow": ("-df", ".flow"),
         "sched": ("-dS", ".sched"), "sched2": ("-dR", ".sched2"),
         "dbr": ("-dd", ".dbr"), "cse": ("-ds", ".cse"),
         "cse2": ("-dt", ".cse2"), "combine": ("-dc", ".combine")}


def parse_dumps(value):
    names = []
    for raw in value.split(","):
        name = raw.strip()
        if not name:
            raise ValueError("empty dump name")
        if name not in DUMPS:
            raise ValueError("unknown dump %r (choose from %s)" %
                             (name, ", ".join(sorted(DUMPS))))
        if name not in names:
            names.append(name)
    return names


def extract_function(text, requested):
    headings = list(re.finditer(r"^;; Function (.+)\r?$", text, re.M))
    matches = [(index, match) for index, match in enumerate(headings)
               if match.group(1).strip() == requested]
    if not matches:
        bare = requested.rsplit("::", 1)[-1]
        matches = [(index, match) for index, match in enumerate(headings)
                   if match.group(1).strip().rsplit("::", 1)[-1] == bare]
    if len(matches) != 1:
        raise ValueError("expected one heading for %s, found %d" %
                         (requested, len(matches)))
    index, match = matches[0]
    end = headings[index + 1].start() if index + 1 < len(headings) else len(text)
    return text[match.start():end].rstrip()


def focused_windows(text, expression, context):
    try:
        pattern = re.compile(expression)
    except re.error as exc:
        raise ValueError("invalid --around expression: %s" % exc)
    lines = text.splitlines()
    hits = [index for index, line in enumerate(lines) if pattern.search(line)]
    if not hits:
        raise ValueError("--around expression %r did not match" % expression)
    ranges = []
    for hit in hits:
        start, end = max(0, hit - context), min(len(lines), hit + context + 1)
        if ranges and start <= ranges[-1][1]:
            ranges[-1] = (ranges[-1][0], max(ranges[-1][1], end))
        else:
            ranges.append((start, end))
    chunks = []
    for start, end in ranges:
        chunks.append(";; focused lines %d-%d / %d\n%s" %
                      (start + 1, end, len(lines), "\n".join(lines[start:end])))
    return "\n;; ...\n".join(chunks)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("function", help="exact RTL function heading, or an unambiguous bare name")
    parser.add_argument("--dump", default="greg",
                        help="one dump or a comma-separated list: %s" % ",".join(DUMPS))
    parser.add_argument("--around", metavar="REGEX",
                        help="print only merged windows around matching RTL lines")
    parser.add_argument("--context", type=int, default=12,
                        help="lines on either side of --around matches (default: 12)")
    parser.add_argument("--output-path-only", action="store_true",
                        help="validate the function but print only the retained dump path")
    args = parser.parse_args()
    try:
        dump_names = parse_dumps(args.dump)
    except ValueError as exc:
        parser.error(str(exc))
    if args.context < 0:
        parser.error("--context must be nonnegative")
    source = args.source.resolve()
    if not source.is_file():
        parser.error(f"source does not exist: {source}")
    try:
        source.relative_to(B.ROOT)
    except ValueError:
        parser.error("source must be inside the project")
    directory = B.BUILD / "rtl"
    directory.mkdir(parents=True, exist_ok=True)
    output = Path(tempfile.mkdtemp(prefix=source.stem + "-", dir=directory))
    preprocessed = output / "input.i"
    cpp = source.suffix.lower() != ".c"
    result = B.run([B.CPP, "-x", "c", *(["-D__cplusplus=1"] if cpp else []),
                    *B.CPP_FLAGS, source, "-o", preprocessed])
    if result.returncode:
        sys.exit("preprocessing failed:\n" + result.stderr)
    overrides = B.per_tu_flags(source)
    g = str(overrides.get("g_value", B.G_VALUE))
    flags = [f"-G{g}" if flag == f"-G{B.G_VALUE}" else flag
             for flag in (B.CC1PL_FLAGS if cpp else B.CC1_FLAGS)]
    result = B.run([B.CC1PL if cpp else B.CC1, *flags, *overrides.get("extra", []),
                    *(DUMPS[name][0] for name in dump_names),
                    preprocessed, "-o", output / "output.s"], cwd=output)
    if result.returncode:
        sys.exit(f"compiler failed; artifacts: {output}\n" + result.stdout + result.stderr)
    for name in dump_names:
        dump = Path(str(preprocessed) + DUMPS[name][1])
        if not dump.is_file():
            sys.exit(f"compiler did not produce {dump}")
        try:
            body = extract_function(dump.read_text(errors="replace"), args.function)
            if args.around:
                body = focused_windows(body, args.around, args.context)
        except ValueError as exc:
            sys.exit(f"{exc} in {dump}")
        print(f"Real compiler RTL [{name}]: {dump}")
        if not args.output_path_only:
            print(body)


if __name__ == "__main__":
    main()
