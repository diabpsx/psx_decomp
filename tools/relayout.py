#!/usr/bin/env python3
"""Lay a TU out on retail's source lines (the SLD line map + block records of rom/DIABPSX-SYM.txt).

For every function of the TU whose bytes match retail, our SLD points and retail's pair up by
offset; each of our code lines therefore has a retail target line.  The tool rewrites the TU so
that each function gets one `#line` anchor before its signature and every statement ends on its
retail line, using ordinary layout only:
  - blank lines are inserted (or removed) between statements;
  - a statement we split over two lines that retail kept on one (`if (c)` / `x;`) is joined, and
    the reverse split applied, when the SLD says so;
  - single-line statements are reordered when retail's line order differs (the bytes gate proves
    the reorder is the same program).
Functions whose SLD cannot be reproduced by those moves (retail had more or fewer statements)
are reported and left untouched, for a manual pass.

usage: relayout.py <recon/.../x.cpp> [--dump build/sn/<seg>_g.sym.txt] [--apply] [-v] [--only NAME ...]
The default dump is the whole-program build/native_program/link/diabpsx.munged.sym.txt.
"""
import re, sys, collections, pathlib, argparse

ROOT = pathlib.Path(__file__).resolve().parents[1]
RETAIL = ROOT / 'rom' / 'DIABPSX-SYM.txt'
REC = re.compile(r'^([0-9a-f]+): \$([0-9a-f]{8}) (\S+)(.*)$')
BS = chr(92)


def load(path):
    recs = []
    for raw in open(path, encoding='latin-1'):
        m = REC.match(raw)
        if m:
            recs.append([int(m.group(2), 16), m.group(3), m.group(4).strip(), []])
        elif recs and raw.strip():
            recs[-1][3].append(raw.strip())
    return recs


def functions(recs):
    """name -> dict(start, end, line, file, points[(off, line)], blocks[(off, rel_line, kind)])"""
    pts = []; line = None; file = None; out = {}; cur = None
    for a, t, txt, extra in recs:
        if t == '88':
            m = re.search(r'line (\d+) of file (.*)$', txt)
            line = int(m.group(1)); file = m.group(2).split(BS)[-1].upper()
        elif t in ('80', '82', '84'):
            line = int(re.search(r'\(to (\d+)\)', txt).group(1))
        elif t == '86':
            line = int(re.search(r'to (\d+)', txt).group(1))
        if t in ('80', '82', '84', '86', '88'):
            pts.append((a, line, file))
        if t == '8c':
            d = {k.strip(): v.strip() for k, _, v in (e.partition('=') for e in extra)}
            cur = d['name']
            out[cur] = dict(start=a, end=None, line=int(d['line']), file=d['file'].split(BS)[-1].upper(),
                            points=[], blocks=[])
        elif t in ('90', '92') and cur:
            out[cur]['blocks'].append((a - out[cur]['start'], int(re.search(r'line = (\d+)', txt).group(1)), t))
        elif t == '8e' and cur:
            out[cur]['end'] = a; cur = None
    for f in out.values():
        seen = {}
        for a, ln, fl in pts:
            if f['start'] <= a < f['end'] and fl == f['file']:
                seen.setdefault(a - f['start'], ln)   # first record at an offset wins (stream order)
        f['points'] = sorted(seen.items())
    return out


# ---------------------------------------------------------------- source model
class Source:
    def __init__(self, path):
        self.path = pathlib.Path(path)
        raw = self.path.read_bytes(); self.crlf = b'\r\n' in raw
        self.lines = raw.decode('latin-1').replace('\r\n', '\n').split('\n')
        self.name = self.path.name.upper()

    def logical(self):
        """physical index (0-based) -> logical line number (after #line directives)."""
        out = []; cur = 1
        for l in self.lines:
            m = re.match(r'\s*#\s*line\s+(\d+)', l)
            out.append(cur)
            cur = int(m.group(1)) if m else cur + 1
        return out

    def physical_of(self, logical_line, logical=None):
        lg = logical or self.logical()
        return [i for i, v in enumerate(lg) if v == logical_line and not re.match(r'\s*#\s*line', self.lines[i])]

    def save(self):
        t = '\n'.join(self.lines)
        self.path.write_bytes(t.replace('\n', '\r\n').encode('latin-1') if self.crlf else t.encode('latin-1'))


def strip_comments(l):
    l = re.sub(r'/\*.*?\*/', '', l)
    l = re.sub(r'//.*$', '', l)
    return l


def code_only(lines):
    """Every line with its comments removed (block comments spanning lines too); line count kept."""
    out = []; in_c = False
    for l in lines:
        res = ''; j = 0
        while j < len(l):
            if in_c:
                k = l.find('*/', j)
                if k < 0: j = len(l)
                else: in_c = False; j = k + 2
            elif l.startswith('/*', j):
                in_c = True; j += 2
            elif l.startswith('//', j):
                j = len(l)
            else:
                res += l[j]; j += 1
        out.append(res)
    return out


def is_blank(l):
    return strip_comments(l).strip() == '' and not re.match(r'\s*#', l)


def is_comment_only(l):
    s = l.strip()
    return bool(s) and strip_comments(l).strip() == '' and not s.startswith('#')


def find_function_end(lines, open_idx):
    """index of the `}` closing the first `{` on lines[open_idx] (lines = comment-free text)."""
    depth = 0; in_str = None; started = False
    for i in range(open_idx, len(lines)):
        l = lines[i]; j = 0
        while j < len(l):
            c = l[j]
            if in_str:
                if c == BS: j += 1
                elif c == in_str: in_str = None
            elif c in '"' + "'": in_str = c
            elif c == '{': depth += 1; started = True
            elif c == '}':
                depth -= 1
                if started and depth == 0: return i
            j += 1
    return None


SPLIT = re.compile(r'^(\s*(?:\}\s*)?(?:else\s+)?(?:if|while|for)\s*\(.*\))\s+(\S.*;\s*)$')
SPLIT_ELSE = re.compile(r'^(\s*(?:\}\s*)?else)\s+(\S.*;\s*)$')
MANUAL = []


def manual(name, why):
    MANUAL.append((name, why)); return None


def relayout(src, retail, ours, apply=False, verbose=False, only=None, safe=False):
    report = collections.Counter(); notes = []
    logical = src.logical(); code = code_only(src.lines)
    mine = {n: f for n, f in ours.items() if f['file'] == src.name and n in retail and retail[n]['file'] == src.name}
    if only:
        mine = {n: f for n, f in mine.items() if n in only}
    order = sorted(mine.items(), key=lambda kv: -kv[1]['line'])   # bottom-up: earlier indexes stay valid
    bound = len(src.lines)   # lines at or past an applied anchor carry new logical numbers: look above it
    for name, o in order:
        r = retail[name]
        if (r['points'] == o['points'] and r['line'] == o['line']
                and [b[1:] for b in r['blocks']] == [b[1:] for b in o['blocks']]):
            report['already exact'] += 1; continue
        hits = [i for i in src.physical_of(o['line'], logical) if i < bound]
        if len(hits) != 1 or '{' not in code[hits[0]]:
            report['cannot locate'] += 1; notes.append((name, 'cannot locate the { line', o['line'])); continue
        open_i = hits[0]; close_i = find_function_end(code, open_i)
        if close_i is None:
            report['cannot locate'] += 1; notes.append((name, 'unbalanced braces')); continue
        res = relayout_function(src, name, r, o, open_i, close_i, logical, code, safe)
        if res is None:
            report['manual'] += 1; continue
        kind, new_lines, anchor_i, anchor_val, *preface = res
        preface = preface[0] if preface else []
        report[kind] += 1
        if verbose:
            print(f'  {kind:12s} {name}')
        if apply:
            src.lines[anchor_i:close_i + 1] = preface + [f'#line {anchor_val}'] + new_lines
            logical = src.logical(); code = code_only(src.lines); bound = anchor_i
    return report, notes


def comment_unit(lines, lead):
    """indexes into `lead` of one droppable comment: a `//` line, a one-line `/* */`, or a whole block
    comment (its `/*` line through its `*/` line); None when lead holds no complete comment."""
    for a in range(len(lead)):
        s = lines[lead[a]].strip()
        if s.startswith('//') or (s.startswith('/*') and s.endswith('*/')):
            return [a]
        if s.startswith('/*'):
            for b in range(a, len(lead)):
                if '*/' in lines[lead[b]]:
                    return list(range(a, b + 1))
            return None
    return None


STMT = re.compile(r'^\s*(?:[A-Za-z_][\w.>\[\]-]*\s*(?:[-+*/|&^%]|<<|>>)?=\s*[^;]+|[A-Za-z_][\w.>-]*\([^;]*\)(?:\s*\.\s*\w+)?|[A-Za-z_][\w.>\[\]-]*(?:\+\+|--))\s*;\s*$')
DECL = re.compile(r'^\s*(?:(?:static|const|unsigned|signed|register|volatile|struct|class|enum)\s+)*[A-Za-z_]\w*(?:\s*<[^;=]*>)?(?:\s*\*+\s*|\s+)&?[A-Za-z_]\w*(?:\s*\[[^;]*\])*\s*(?:=[^;]*)?(?:,[^;]*)?;\s*$')
CONTROL = re.compile(r'(if|while|for|else|do|switch|return|case|default|goto|break|continue)\b')


def movable_statement(code, lines, j, out, slack_at):
    """A footprint-less plain assignment or call that may be hoisted into the blank slack before the
    previous statement: never a bare `;`, a brace, a control head or its body, never after a control
    head without braces (it would become that head's body)."""
    s = code[j].strip()
    if not STMT.match(s) or CONTROL.match(s) or DECL.match(s):
        return False
    k = slack_at - 1
    while k >= 0 and not out[k][1]: k -= 1
    if k < 0: return False
    prev = out[k][0].strip()
    return prev.endswith((';', '{', '}')) and not re.match(r'(if|while|for|else|do|switch)\b', prev)


PLAIN_DECL = re.compile(r'^(\s*)((?:(?:static|const|unsigned|signed|register)\s+)*[A-Za-z_]\w*(?:\s*\*+)?)\s+([A-Za-z_]\w*(?:\[[^;]*\])?(?:,\s*[A-Za-z_]\w*(?:\[[^;]*\])?)*);\s*$')


def decl_pair(lines, lead, merged):
    """Two consecutive lead lines declaring plain (uninitialised) variables of one spelled type:
    returns (index of the first, merged text) or None.  Earlier merges are honoured."""
    texts = dict(merged)
    for a in range(len(lead) - 1):
        m1 = PLAIN_DECL.match(texts.get(lead[a], lines[lead[a]])); m2 = PLAIN_DECL.match(lines[lead[a + 1]])
        if m1 and m2 and m1.group(2) == m2.group(2) and lead[a + 1] not in texts:
            return a, f'{m1.group(1)}{m1.group(2)} {m1.group(3)}, {m2.group(3)};'
    return None


HEAD_BRACE = re.compile(r'^(\s*(?:\}\s*)?(?:(?:else\s+)?(?:if|while|for)\s*\(.*\)|else))\s*\{\s*$')
SIMPLE_STMT = re.compile(r'^(?:return\b[^;]*|break|continue)\s*;$')


def single_statement_block(code, open_i, stmt_i, close_i):
    """`head {` at open_i, one statement at stmt_i, its `}` directly after (blank lines allowed):
    returns the index of the closing line or None."""
    if not HEAD_BRACE.match(code[open_i]): return None
    for j in range(open_i + 1, stmt_i):
        if code[j].strip(): return None
    k = stmt_i + 1
    while k <= close_i and code[k].strip() == '': k += 1
    if k > close_i or not re.match(r'^\s*\}(\s*else\b.*)?$', code[k].rstrip()): return None
    return k


def closing_rewrite(line):
    """`}` -> dropped (None); `} else {` -> `else {`; `} else if (..) {` -> `else if (..) {`."""
    m = re.match(r'^(\s*)\}\s*(else\b.*)?$', line.rstrip())
    if m is None or m.group(2) is None: return None
    return m.group(1) + m.group(2)


def lis_keep(values):
    """indexes of a longest non-decreasing subsequence of `values` (the lines that need not move)."""
    n = len(values); best = [1] * n; prev = [-1] * n
    for i in range(n):
        for j in range(i):
            if values[j] <= values[i] and best[j] + 1 > best[i]:
                best[i] = best[j] + 1; prev[i] = j
    k = max(range(n), key=lambda i: best[i]) if n else -1
    keep = set()
    while k >= 0:
        keep.add(k); k = prev[k]
    return keep


def relayout_function(src, name, r, o, open_i, close_i, logical, code, safe=False):
    lines = src.lines
    blank = lambda i: lines[i].strip() == ''
    comment_only = lambda i: code[i].strip() == '' and lines[i].strip() != '' and not lines[i].strip().startswith('#')
    decl_like = lambda i: bool(DECL.match(code[i]))
    # signature: the contiguous lines above `{` up to a blank, comment-only, directive or statement end
    sig_i = open_i
    while (sig_i - 1 >= 0 and not blank(sig_i - 1) and not comment_only(sig_i - 1)
           and not re.match(r'\s*#', lines[sig_i - 1])
           and not code[sig_i - 1].rstrip().endswith(('}', ';'))):
        sig_i -= 1
    if name.startswith('_GLOBAL_.'):
        return manual(name, 'compiler-generated static-initialiser thunk')
    if sig_i == open_i and code[open_i].split('{')[0].strip() == '':
        return manual(name, 'no signature line above {')
    # drop a stale anchor directly above the signature (re-runs)
    anchor_i = sig_i
    if anchor_i - 1 >= 0 and re.match(r'\s*#\s*line\s+\d+\s*$', lines[anchor_i - 1]):
        anchor_i -= 1
    if close_i == open_i:
        # the whole function sits on one line (an in-class method): the anchor alone places it
        if all(ln == r['line'] for _, ln in r['points']):
            return 'same-line', lines[sig_i:open_i + 1], anchor_i, r['line'] - (open_i - sig_i)
        return manual(name, 'one-line function whose retail SLD spans several lines')
    rp = dict(r['points']); op = dict(o['points'])
    tgt = {}; joins = set(); splits = {}
    for off, ln in op.items():
        if off in rp:
            if tgt.setdefault(ln, rp[off]) != rp[off]:
                return manual(name, f'our line {ln} maps to retail {tgt[ln]} and {rp[off]} (retail has more statements)')
    roff = sorted(rp); ooff = sorted(op)
    # two of our code lines on one retail line: the later one is joined onto the earlier (`for (..) x;`)
    by_target = collections.defaultdict(list)
    for ln, t in tgt.items(): by_target[t].append(ln)
    for t, lns in by_target.items():
        lns.sort()
        for ln in lns[1:]:
            if ln - lns[0] > 3: return manual(name, f'our lines {lns} all end on retail line {t}')
            joins.add(ln)
    for off in ooff:
        if off in rp: continue
        prev = max((x for x in roff if x < off), default=None)
        if prev is None: return manual(name, 'our point before the first retail point')
        ln = op[off]; want = rp[prev]
        before = [x for x in ooff if x < off]
        pline = op[before[-1]] if before else None
        if pline is None or tgt.get(pline, want) != want or tgt.get(ln, want) != want:
            return manual(name, f'our statement at +{off:#x} (line {ln}) has no retail counterpart')
        tgt[ln] = want; joins.add(ln)
    for off in roff:
        if off in op: continue
        before = [x for x in ooff if x < off]
        if not before: return manual(name, 'retail point before our first point')
        ln = op[before[-1]]
        if ln in joins: return manual(name, f'line {ln}: split and join on the same line')
        if ln in splits: return manual(name, f'line {ln} would need two splits')
        phys = src.physical_of(ln, logical)
        if len(phys) != 1 or not (SPLIT.match(lines[phys[0]]) or SPLIT_ELSE.match(lines[phys[0]])):
            return manual(name, f'retail has a statement boundary inside our line {ln}')
        splits[ln] = rp[off]
    if len(r['blocks']) != len(o['blocks']): return manual(name, 'block record counts differ')
    btgt = {}
    for (ro_, rl, rk), (oo_, ol, ok) in zip(r['blocks'], o['blocks']):
        if rk != ok: return manual(name, 'block record kinds differ')
        # block record lines are 1-based relative to the function's `{` line: a block start is its `{`
        # line, a block end the line of the block's last statement (not the `}`)
        btgt.setdefault(o['line'] + ol - 1, r['line'] + rl - 1)
    body = list(range(open_i, close_i + 1))
    phys_target = {}
    for i in body:
        lg = logical[i]
        if lg in tgt: phys_target[i] = tgt[lg]
    for lg, t in btgt.items():
        ph = [i for i in src.physical_of(lg, logical) if open_i <= i <= close_i]
        if len(ph) == 1 and ph[0] not in phys_target: phys_target[ph[0]] = t
    phys_target[open_i] = r['line']
    # a one-line function: retail put signature, `{`, the statement and `}` on one line
    if (all(t == r['line'] for t in phys_target.values()) and close_i == open_i + 2
            and STMT.match(code[open_i + 1].strip()) and code[open_i].strip() == '{' and code[close_i].strip() == '}'
            and len(lines[sig_i:open_i]) == 1):
        one = lines[sig_i].rstrip() + ' { ' + lines[open_i + 1].strip() + ' }'
        return 'one-liner', [one], anchor_i, r['line']
    seq = [(i, phys_target[i]) for i in body if i in phys_target]
    moved = False
    if [t for _, t in seq] != sorted(t for _, t in seq):
        if safe:
            return manual(name, 'statement order differs (deferred: unsafe mode only)')
        keep = lis_keep([t for _, t in seq])
        for k, (i, _) in enumerate(seq):
            if k in keep or i == open_i: continue
            l = code[i].strip()
            if (not STMT.match(l) or CONTROL.match(l) or DECL.match(l) or logical[i] in joins or logical[i] in splits):
                return manual(name, f'statement order differs and line {logical[i]} is not a movable one-line statement')
            if i - 1 >= open_i and not (blank(i - 1) or comment_only(i - 1) or code[i - 1].rstrip().endswith((';', '{', '}'))):
                return manual(name, f'statement order differs and line {logical[i]} continues a statement')
            # the statement must not cross a declaration on its way to its retail position
            lo = min(i, next(j for j, t in seq if t > phys_target[i]) if any(t > phys_target[i] for j, t in seq) else i)
            hi = max(i, max((j for j, t in seq if t < phys_target[i]), default=i))
            if any(decl_like(j) for j in range(lo, hi + 1) if j != i):
                return manual(name, f'statement order differs and line {logical[i]} would cross a declaration')
        moved = True
    # out: [text, is_code]; blank-line slack inserted before a statement may later host a footprint-less
    # statement that would otherwise push the next statement past its retail line
    out = []; rewrites = {}; dropped = []   # out: [text, is_code, physical index or None]; rewrites: index -> text / None (drop)
    sig_lines = lines[sig_i:open_i]
    anchor_val = r['line'] - len(sig_lines)
    cur = r['line'] - 1
    items = []; pending = []
    for i in body:
        if i in phys_target:
            items.append((phys_target[i], pending + [i])); pending = []
        else:
            pending.append(i)
    trailing = pending
    if moved:
        items.sort(key=lambda it: it[0])
    slack_at = None   # index in out of the first blank inserted before the previous statement, and how many
    slack_n = 0
    invisible_moves = 0
    for target, group in items:
        last_i = group[-1]; lg_last = logical[last_i]
        if lg_last in joins:
            stmt = lines[last_i].strip(); stmt_code = code[last_i].strip()
            k = len(out) - 1
            while k >= 0 and not out[k][1]: k -= 1
            if k < 0: return manual(name, 'join target missing')
            kj = out[k][2]
            head = (rewrites.get(kj) if kj is not None and kj in rewrites else out[k][0]) or ''
            head_code = strip_comments(head).rstrip()
            simple = STMT.match(stmt_code) or SIMPLE_STMT.match(stmt_code)
            joined = None
            if simple and head_code.endswith('{') and kj is not None:
                # `head {` / stmt / `}`: retail kept the single-statement block brace-less on the head line
                close_k = single_statement_block(code, kj, last_i, close_i)
                if close_k is not None:
                    joined = head_code[:-1].rstrip() + ' ' + stmt
                    rewrites[close_k] = closing_rewrite(lines[close_k])
            if joined is None and simple and not safe and STMT.match(head_code.strip()) \
                    and not any(not blank(j) and not comment_only(j) for j in group[:-1]):
                # two statements on one retail line (user ruling 2026-10-17): same-value assignments chain
                # (`sx1 = sy1 = 0;`), anything else sits as two statements on the line; the gate decides
                a = re.match(r'^(\s*)([A-Za-z_][\w.>\[\]-]*)\s*=\s*([^;=]+);\s*$', head_code)
                b = re.match(r'^([A-Za-z_][\w.>\[\]-]*)\s*=\s*([^;=]+);\s*$', stmt_code)
                if a and b and a.group(3).strip() == b.group(2).strip():
                    joined = f'{a.group(1)}{a.group(2)} = {b.group(1)} = {a.group(3).strip()};'
                else:
                    joined = head_code + ' ' + stmt
            if joined is None:
                # only a complete simple statement joins, and only onto a control head (`for (..)`, `else`)
                if (not simple or not (head_code.endswith(')') or head_code.endswith('else'))
                        or any(not blank(j) and not comment_only(j) for j in group[:-1])):
                    return manual(name, f'line {lg_last} would have to share retail line {target} with another statement')
                joined = head_code + ' ' + stmt
            out[k][0] = joined
            if kj is not None and kj in rewrites: rewrites[kj] = joined   # the line was itself a rewritten `} else {`
            continue
        lead = list(group[:-1])
        need = target - (cur + len(lead) + 1)
        merged_decls = []   # (index in lead, text) replacements from declaration merges
        while need < 0:
            idx = next((j for j in range(len(lead)) if blank(lead[j])), None)
            if idx is not None:
                lead.pop(idx); need += 1; continue
            # a comment: drop a whole comment (a block comment spans lines; never leave a half)
            unit = comment_unit(lines, lead)
            if unit is not None:
                dropped.extend(lines[lead[j]] for j in unit)   # re-emitted above the anchor
                for j in reversed(unit): lead.pop(j)
                need += len(unit); continue
            # two plain declarations of one type on consecutive lines: `int c;` `int i;` -> `int c, i;`
            pair = decl_pair(lines, lead, merged_decls)
            if pair is None: break
            a, text = pair
            merged_decls.append((lead[a], text)); lead.pop(a + 1); need += 1
        brace_join = None
        if need < 0 and lead and (STMT.match(code[last_i].strip()) or SIMPLE_STMT.match(code[last_i].strip())):
            close_k = single_statement_block(code, lead[-1], last_i, close_i)
            if close_k is not None and rewrites.get(lead[-1], lines[lead[-1]]) is not None:
                # `} else {` / stmt / `}` where retail wrote `} else stmt;`: the block loses its braces
                head_i = lead.pop()
                head_text = rewrites.get(head_i, lines[head_i])   # it may itself be a rewritten `} else {`
                brace_join = (head_i, strip_comments(head_text).rstrip()[:-1].rstrip() + ' ' + lines[last_i].strip())
                rewrites[close_k] = closing_rewrite(lines[close_k]); need += 1
                rewrites[head_i] = brace_join[1]
        while need < 0 and lead and slack_n > 0 and not safe and movable_statement(code, lines, lead[0], out, slack_at):
            # a plain statement with no SLD footprint: it can only be placed where the budget allows; use
            # the blank slack before the previous statement (one statement per line; the bytes gate
            # proves the order is immaterial)
            j = lead.pop(0); out[slack_at] = [lines[j], True, j]; slack_at += 1; slack_n -= 1; need += 1
            invisible_moves += 1
        if need < 0:
            return manual(name, f'line {lg_last} cannot reach retail line {target} ({-need} too many lines before it)')
        slack_at = len(out); slack_n = need
        out.extend([['', False, None] for _ in range(need)])
        merged = dict(merged_decls)
        out.extend([[merged.get(j, lines[j]), not blank(j) and not comment_only(j), j] for j in lead])
        last = lines[last_i]
        if brace_join is not None:
            out.append([brace_join[1], True, brace_join[0]]); cur = target
            slack_at = None; slack_n = 0
            continue
        if lg_last in splits:
            m = SPLIT.match(last) or SPLIT_ELSE.match(last)
            head, tail = m.group(1), m.group(2).strip()
            indent = re.match(r'\s*', head).group(0) + '    '
            out.append([head.rstrip(), True, last_i]); cur = target
            gap = splits[lg_last] - cur - 1
            if gap < 0: return manual(name, 'split tail would go backwards')
            out.extend([['', False, None] for _ in range(gap)]); out.append([indent + tail, True, None]); cur = splits[lg_last]
            slack_at = None; slack_n = 0
            continue
        out.append([last, True, last_i]); cur = target
    # the closing braces of blocks made brace-less: dropped, or `} else ...` -> `else ...`
    out_lines = []
    for text, _, j in out:
        if j is not None and j in rewrites:
            if rewrites[j] is None: continue
            text = rewrites[j]
        out_lines.append(text)
    for i in trailing:
        if i in rewrites:
            if rewrites[i] is None: continue
            out_lines.append(rewrites[i])
        else:
            out_lines.append(lines[i])
    kind = 'reordered' if moved else ('joined/split' if (joins or splits) else 'relaid')
    if invisible_moves: kind = 'relaid+moved'
    preface = [] if not dropped else [d.strip() if i == 0 else d for i, d in enumerate(dropped)]
    return kind, sig_lines + out_lines, anchor_i, anchor_val, dropped


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('source')
    ap.add_argument('--dump', default=str(ROOT / 'build/native_program/link/diabpsx.munged.sym.txt'))
    ap.add_argument('--apply', action='store_true'); ap.add_argument('-v', action='store_true')
    ap.add_argument('--only', nargs='*'); ap.add_argument('--safe', action='store_true', help='no statement reorders or hoists')
    a = ap.parse_args()
    src = Source(a.source)
    retail = functions(load(RETAIL)); ours = functions(load(a.dump))
    report, notes = relayout(src, retail, ours, apply=a.apply, verbose=a.v, only=a.only, safe=a.safe)
    for n, why in MANUAL: print(f'  manual  {n}: {why}')
    for n in notes: print('  note   ', n)
    print(f'{src.name}: {dict(report)}' + ('  [applied]' if a.apply else ''))
    if a.apply: src.save()


if __name__ == '__main__':
    main()
