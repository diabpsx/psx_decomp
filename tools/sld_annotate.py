"""sld_annotate.py -- print a retail oracle with the SLD source line of every instruction.

    python tools/sld_annotate.py control DrawSpellCel__FllUclUcc [--summary] [--lines 590-660]
    python tools/sld_annotate.py asm/nonmatchings/padfuncs/DrawObjSelector__FiP12PlayerStruct.s --file PADFUNCS.CPP

The SYM's SLD stream (records 0x80..0x8a in rom/DIABPSX-SYM.txt) gives the original source line of
every retail instruction.  Reading it beside the oracle shows the ORIGINAL statement order, which
lines carry no code (comments, blank lines, folded tests, removed beta calls) and how many statements
retail had -- the method that cracked DrawMenu, DrawSpinner, DialogPrint, DrawAutomap and others.

Each file-set record (0x88 "Set SLD to line N of file PATH") starts the line run of one source file.
Overlays alias virtual addresses, so a function's lines are taken only from its own TU's run: the run
is chosen by --file, or inferred from the oracle's segment directory (control -> CONTROL.CPP), and
when several runs of that name exist the one covering the function's address range wins.

Output: `index VA LINE insn`, with `*` before LINE on the first instruction of each new line, labels
in between; --summary adds instructions-per-line in line order and the code-free lines inside the
function's line span.  Nothing is written; this is a read-only diagnostic.
"""
import argparse, re, sys
from collections import OrderedDict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SYM = ROOT / "rom" / "DIABPSX-SYM.txt"

SLD_RE = re.compile(r"^[0-9a-f]+: \$([0-9a-f]{8}) (8[0-9a-f]) (.*)$")
INSN_RE = re.compile(r"^\s*/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s+[0-9A-Fa-f]{8}\s*\*/\s*(.*?)\s*$")
LABEL_RE = re.compile(r"^\s*(\.L[0-9A-Fa-f]+:|glabel \S+|endlabel \S+)\s*$")


def parse_sym(lines):
    """[(va, line, file)] for every line-bearing SLD record, in SYM order.

    `file` is the upper-cased basename of the most recent 0x88 file-set record ('' before any).
    0x8a (End SLD info) ends a run.  Records without a line number (bare 'Inc SLD linenum') are
    ignored, which never happens in this SYM (every 0x80/0x82/0x84 carries '(to N)')."""
    out, cur_file = [], ""
    for ln in lines:
        m = SLD_RE.match(ln)
        if not m:
            continue
        va, kind, rest = int(m.group(1), 16), m.group(2), m.group(3)
        if kind == "88":
            fm = re.match(r"Set SLD to line (\d+) of file (.+?)\s*$", rest)
            if not fm:
                continue
            cur_file = Path(fm.group(2).replace("\\", "/")).name.upper()
            out.append((va, int(fm.group(1)), cur_file))
        elif kind == "8a":
            cur_file = ""
        elif kind in ("80", "82", "84", "86"):
            lm = re.search(r"to (\d+)\)?\s*$", rest)
            if lm:
                out.append((va, int(lm.group(1)), cur_file))
    return out


def parse_oracle(text):
    """[(va, insn_text)] and [(position, label_text)] from a splat-format oracle .s."""
    ins, labels = [], []
    for ln in text.splitlines():
        m = INSN_RE.match(ln)
        if m:
            ins.append((int(m.group(1), 16), m.group(2)))
            continue
        lm = LABEL_RE.match(ln)
        if lm and lm.group(1).startswith(".L"):
            labels.append((len(ins), lm.group(1)))
    return ins, labels


def select_run(recs, lo, hi, file_name=None):
    """Records of the one source-file run that covers [lo, hi].

    file_name (upper-cased basename or stem) restricts the candidate runs; among runs of the same
    file the one with the most records inside [lo, hi] wins.  Returns (records, file)."""
    runs = OrderedDict()
    key = 0
    prev_file = None
    for va, line, f in recs:
        if f != prev_file:
            key += 1
            prev_file = f
        runs.setdefault((key, f), []).append((va, line))
    want = file_name.upper() if file_name else None
    best, best_n = None, -1
    for (k, f), items in runs.items():
        if want and f != want and Path(f).stem != want and Path(f).stem != Path(want).stem:
            continue
        n = sum(1 for va, _ in items if lo <= va <= hi)
        if n > best_n:
            best, best_n = (k, f), n
    if best is None or best_n <= 0:
        return [], None
    items = sorted(runs[best])
    return items, best[1]


def annotate(ins, run):
    """[(va, line, insn)] -- the line in force at each instruction (None before the first record)."""
    out, k, cur = [], 0, None
    for va, text in ins:
        while k < len(run) and run[k][0] <= va:
            cur = run[k][1]
            k += 1
        out.append((va, cur, text))
    return out


def summary(rows):
    """(ordered {line: count}, [code-free lines inside the span])"""
    counts = OrderedDict()
    for _, line, _ in rows:
        if line is None:
            continue
        counts[line] = counts.get(line, 0) + 1
    if not counts:
        return counts, []
    lo, hi = min(counts), max(counts)
    free = [n for n in range(lo, hi + 1) if n not in counts]
    return counts, free


def render(rows, labels, lines=None):
    out, li = [], 0
    prev = object()
    for i, (va, line, text) in enumerate(rows):
        while li < len(labels) and labels[li][0] <= i:
            if lines is None or (line is not None and lines[0] <= line <= lines[1]):
                out.append(labels[li][1])
            li += 1
        if lines is not None and (line is None or not (lines[0] <= line <= lines[1])):
            prev = line
            continue
        star = "*" if line != prev else ""
        out.append(f"{i:4d} {va:08x} {star + str(line if line is not None else '?'):>5}  {text}")
        prev = line
    return "\n".join(out)


def resolve_oracle(args):
    if len(args) == 1 and args[0].lower().endswith(".s"):
        p = Path(args[0])
        return p if p.is_absolute() else ROOT / p
    if len(args) == 2:
        return ROOT / "asm" / "nonmatchings" / args[0] / (args[1] + ".s")
    raise SystemExit("usage: sld_annotate.py <segment> <Function> | <oracle.s>  [--file NAME.CPP] [--summary] [--lines A-B]")


def main(argv=None):
    ap = argparse.ArgumentParser(add_help=True)
    ap.add_argument("target", nargs="+")
    ap.add_argument("--sym", default=str(DEFAULT_SYM))
    ap.add_argument("--file", help="source file of the TU (basename, e.g. CONTROL.CPP); default: inferred from the segment")
    ap.add_argument("--summary", action="store_true")
    ap.add_argument("--lines", help="only print instructions whose line is in A-B")
    a = ap.parse_args(argv)
    oracle = resolve_oracle(a.target)
    if not oracle.is_file():
        raise SystemExit(f"no oracle: {oracle}")
    ins, labels = parse_oracle(oracle.read_text(errors="replace"))
    if not ins:
        raise SystemExit(f"no instructions parsed from {oracle}")
    recs = parse_sym(Path(a.sym).read_text(errors="replace").splitlines())
    file_name = a.file or (oracle.parent.name.upper() + ".CPP")
    run, chosen = select_run(recs, ins[0][0], ins[-1][0], file_name)
    if not run and not a.file:
        run, chosen = select_run(recs, ins[0][0], ins[-1][0], oracle.parent.name.upper() + ".C")
    if not run:
        raise SystemExit(f"no SLD run for {file_name} covers {ins[0][0]:08x}-{ins[-1][0]:08x}; pass --file")
    rows = annotate(ins, run)
    lines = None
    if a.lines:
        lo, hi = a.lines.split("-")
        lines = (int(lo), int(hi))
    print(f"; {oracle.name}: {len(ins)} insns, SLD run {chosen}, lines "
          f"{min(l for _, l, _ in rows if l is not None)}-{max(l for _, l, _ in rows if l is not None)}")
    print(render(rows, labels, lines))
    if a.summary:
        counts, free = summary(rows)
        print("; insns per line (source order):")
        print("; " + " ".join(f"{l}:{n}" for l, n in sorted(counts.items())))
        print(f"; code-free lines inside the span: {' '.join(map(str, free)) if free else '(none)'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
