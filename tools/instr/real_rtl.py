#!/usr/bin/env python3
"""Dump one function's RTL using the real project compiler, without changing gate flags.

Example: python tools/instr/real_rtl.py recon/psxsrc/gpanel.cpp GPanel::DrawDurThingy --dump loop
Artifacts remain in build/rtl/<TU>-<unique-id> for inspection. Compilation failure,
a missing dump, and an absent or ambiguous function all produce a nonzero exit.
"""
import argparse
from pathlib import Path
import re
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B

DUMPS = {"greg": ("-dg", ".greg"), "lreg": ("-dl", ".lreg"),
         "loop": ("-dL", ".loop"), "flow": ("-df", ".flow")}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("function", help="exact RTL function heading, or an unambiguous bare name")
    parser.add_argument("--dump", choices=DUMPS, default="greg")
    args = parser.parse_args()
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
    option, extension = DUMPS[args.dump]
    result = B.run([B.CC1PL if cpp else B.CC1, *flags, *overrides.get("extra", []),
                    option, preprocessed, "-o", output / "output.s"], cwd=output)
    if result.returncode:
        sys.exit(f"compiler failed; artifacts: {output}\n" + result.stdout + result.stderr)
    dump = Path(str(preprocessed) + extension)
    if not dump.is_file():
        sys.exit(f"compiler did not produce {dump}")
    text = dump.read_text(errors="replace")
    headings = list(re.finditer(r"^;; Function (.+)\r?$", text, re.M))
    matches = [(index, match) for index, match in enumerate(headings)
               if match.group(1).strip() == args.function]
    if not matches:
        requested = args.function.rsplit("::", 1)[-1]
        matches = [(index, match) for index, match in enumerate(headings)
                   if match.group(1).strip().rsplit("::", 1)[-1] == requested]
    if len(matches) != 1:
        sys.exit(f"expected one heading for {args.function}, found {len(matches)} in {dump}")
    index, match = matches[0]
    end = headings[index + 1].start() if index + 1 < len(headings) else len(text)
    print(f"Real compiler RTL: {dump}")
    print(text[match.start():end].rstrip())


if __name__ == "__main__":
    main()
