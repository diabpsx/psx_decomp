#!/usr/bin/env python3
"""isolate_fn.py <src.cpp> <FuncName> <out.cpp>
Blank out every top-level (column-0-brace) function BODY except the target's,
turning them into bodyless prototypes -- keeps types/globals/decls intact so
the target function still compiles (and any callee prototypes resolve), while
sidestepping earlier-function ICEs in a huge TU. Heuristic: column-0 '{' ...
matching column-0 '}' is one top-level block; the preceding non-blank line(s)
back to the last ';' or '}' is the signature."""
import sys, re
from pathlib import Path

src = Path(sys.argv[1]); target = sys.argv[2]; out = Path(sys.argv[3])
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
        is_target = re.search(r"\b" + re.escape(target) + r"\b\s*\(", sig_text) is not None
        if is_target:
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
