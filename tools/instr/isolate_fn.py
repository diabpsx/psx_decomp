#!/usr/bin/env python3
"""isolate_fn.py [--drop-only] <src.cpp> <FuncName[,FuncName...]> <out.cpp>
By default, blank every top-level function body except the named target.
With --drop-only, blank only the named function body and preserve the rest of
the TU.  The latter is useful when one earlier function ICEs but compiler state
from the other preceding functions must be retained for a faithful trace.

Blanked bodies become prototypes, keeping types/globals/callee declarations.
Heuristic: column-0 '{' ... matching column-0 '}' is one top-level block; the
preceding non-blank lines back to the last ';' or '}' are the signature."""
import sys, re
from pathlib import Path

drop_only = len(sys.argv) > 1 and sys.argv[1] == "--drop-only"
args = sys.argv[2:] if drop_only else sys.argv[1:]
if len(args) != 3:
    raise SystemExit(__doc__)
src = Path(args[0]); targets = args[1].split(","); out = Path(args[2])
text = src.read_text(encoding="latin-1")
lines = text.split("\n")

# find column-0 '{' positions (top-level blocks: functions, but also namespace/extern "C" -- rare here)
out_lines = []
i = 0
n = len(lines)
while i < n:
    line = lines[i]
    if line == "{" or (line.rstrip() == "{"):
        # find matching column-0 '}'
        depth = 1
        j = i + 1
        while j < n and depth > 0:
            if lines[j] == "}" :
                depth -= 1
                if depth == 0:
                    break
            elif lines[j].startswith("{") and lines[j] == "{":
                depth += 1
            j += 1
        block = lines[i:j+1]
        # signature = the preceding few lines (walk back to blank line or previous '}'/';')
        sig_start = len(out_lines)
        k = sig_start - 1
        while k >= 0 and out_lines[k].strip() != "" and not out_lines[k].rstrip().endswith("}") and not out_lines[k].rstrip().endswith(";"):
            k -= 1
        sig_text = "\n".join(out_lines[k+1:sig_start])
        is_target = any(re.search(r"\b" + re.escape(target) + r"\b\s*\(", sig_text) is not None
                        for target in targets)
        keep_body = not is_target if drop_only else is_target
        if keep_body:
            out_lines.extend(block)
        else:
            # turn into a prototype: keep signature, replace body with ';'
            out_lines.append(";")
        i = j + 1
        continue
    out_lines.append(line)
    i += 1

out.write_text("\n".join(out_lines), encoding="latin-1")
print("wrote", out, len(out_lines), "lines")
