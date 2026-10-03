#!/usr/bin/env python3
"""symlane.py — the SYM receipt of the project PASS rule (bytes 0 diffs AND exact SYM records).

    python tools/symlane.py recon/psxsrc/gman.cpp [FN,FN...]      # default: every function the TU defines

Pipeline (PsyQ 4.0 compiler/assembler/linker, native vendor symbol compactor):
    cc1plus <lane flags> -g  ->  .s (CRLF, cfront-name rewrites)  ->  ASPSX 2.56 -q -g  ->  .obj
    PSYLINK 2.52 /c /m (TU object + auto stub for its externals)  ->  .sym  ->  dumpsym  ->  text
Overlay TUs use MAP-derived OVER groups, PSYLINK /v, then original SYMMUNGE /i.
This reproduces retail's cross-overlay static-record ordering before comparison.
then every function's debug records are compared with rom/DIABPSX-SYM.txt:
    header   fsize / mask / maskoffs / fp / retreg
    records  in order: class, type (+tag), size, dims, name, and the location
             (REG/REGPARM register number, AUTO/ARG stack offset; STAT addresses are not compared)
    blocks   nesting + address relative to the function start
Line numbers (SLD, block `line =`, function line) are NOT compared (rule: fix later).
Prints `SYM ok` / `SYM DIFF` per function with the first differing record."""
import hashlib, json, os, re, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import build as B

PSYQ = Path("C:/Temp/nfs3-clean/psyq400/PSYQ")
ASPSX = Path(os.environ.get("DIAB_ASPSX", PSYQ / "ASPSX.EXE"))
PSYLINK = Path(os.environ.get("DIAB_PSYLINK", PSYQ / "PSYLINK.EXE"))
DUMPSYM = Path(os.environ.get("DIAB_DUMPSYM", "C:/Temp/claud/dumpsym_clean/dumpsym_src/dumpsym.exe"))
SYMMUNGE = Path(os.environ.get("DIAB_SYMMUNGE", "C:/Temp/psq45/BIN/SYMMUNGE.EXE"))
SYMMUNGE_SHA256 = "bd51481d903a5d8b55a2f30e7fede023772a5b6e656f50aa242a4663a4e60630"
RETAIL = ROOT / "rom" / "DIABPSX-SYM.txt"
OUT = ROOT / "build" / "sn"
ENV = dict(os.environ, MSYS2_ARG_CONV_EXCL="*")

def embedded_text_tables():
    out = {}
    p = ROOT / "configs" / "embedded_text_tables.txt"
    if p.is_file():
        for raw in p.read_text(encoding="utf-8").splitlines():
            line = raw.split("#", 1)[0].strip()
            if line:
                fields = line.split()
                fn, start, count = fields[:3]
                pad_before = fields[3] if len(fields) > 3 else "0"
                out[fn] = (int(start, 0), int(count, 0), int(pad_before, 0))
    return out

EMBEDDED_TEXT_TABLES = embedded_text_tables()

def crlf(p: Path):
    b = p.read_bytes().replace(b"\r\n", b"\n").replace(b"\n", b"\r\n"); p.write_bytes(b)

def compile_g(src: Path, assembler=None) -> Path:
    """cc1/cc1plus with the lane flags + -g, SN-ready .s"""
    rel = src.resolve().relative_to(ROOT)
    OUT.mkdir(parents=True, exist_ok=True)
    stem = OUT / rel.name
    i_file = stem.with_suffix(".i")
    is_cpp = src.suffix.lower() != ".c"
    cpp = [B.CPP, "-x", "c", *(["-D__cplusplus=1"] if is_cpp else []), *B.CPP_FLAGS, src, "-o", i_file]
    r = subprocess.run([str(c) for c in cpp], capture_output=True, text=True, cwd=ROOT)
    if r.returncode: sys.exit(f"[cpp] {rel}\n{r.stderr}")
    flags = B.per_tu_flags(src); g = str(flags.get("g_value", B.G_VALUE))
    base = B.CC1PL_FLAGS if is_cpp else B.CC1_FLAGS
    cc1_flags = [f"-G{g}" if f == f"-G{B.G_VALUE}" else f for f in base] + flags.get("extra", []) + ["-g"]
    s_file = stem.with_suffix(".g.s")
    r = subprocess.run([str(B.CC1PL if is_cpp else B.CC1), *cc1_flags, str(i_file), "-o", str(s_file)],
                       capture_output=True, text=True, cwd=ROOT, env=B._cc1_env())
    if r.returncode: sys.exit(f"[cc1] {rel}\n{r.stdout}{r.stderr}")
    txt = s_file.read_text().replace("_._", "___").replace("_GLOBAL_.I.", "_GLOBAL__I_").replace("_GLOBAL_.D.", "_GLOBAL__D_")
    s_file.write_text(txt); crlf(s_file)
    obj = stem.with_suffix(".g.obj")
    # -0: no div/rem zero-divide guard expansion (retail form; guard expansion is ASPSX's default)
    r = subprocess.run([str(ASPSX if assembler is None else assembler), "-q", "-g", "-0", f"-G{g}", "-o", str(obj), str(s_file)], capture_output=True, text=True, cwd=ROOT, env=ENV)
    if r.returncode or not obj.exists(): sys.exit(f"[aspsx] {rel}\n{r.stdout}{r.stderr}")
    return obj

def overlay_group(source):
    """Identify overlay text from the retail MAP inventory, including diagnostic TUs."""
    if source is None:
        return None
    section = '.' + Path(source).stem.upper() + '_text'
    rows = json.loads((ROOT / 'configs/sections.json').read_text())
    groups = {r['group'] for r in rows if r['name'] == section and r['len']}
    overlays = groups & {'frontend_text', 'pregame_text', 'game_text', 'fmv_text'}
    if len(overlays) > 1:
        raise ValueError('ambiguous overlay ownership for ' + section)
    return next(iter(overlays), None)


def overlay_sections(source, group):
    """Place pools with code only where native receipts/MAP establish that home."""
    if not group:
        return set()
    segment = Path(source).stem.lower()
    image = group.removesuffix('_text')
    registry = json.loads((ROOT / 'configs/native_recon_link.json').read_text())
    spec = registry.get(segment, {})
    rows = json.loads((ROOT / 'configs/sections.json').read_text())
    result = {'.text'}
    for section in ('.rdata', '.data'):
        native = spec.get('sections', {}).get(section)
        if native:
            if native.get('image', spec.get('image')) == image:
                result.add(section)
        elif not any(r['name'] == '.' + segment.upper() + '_' + section[1:] and r['len'] for r in rows):
            # E.g. FMV's large data/pool prefix is part of .FMV_text in MAP.
            result.add(section)
    return result


def link(obj: Path, source=None) -> Path:
    """PSYLINK one object plus stubs; source selects the authentic overlay SYM route.

    No source requests a resident diagnostic link. Production callers pass the
    source so MAP-owned overlay TUs also run the original symbol compactor.
    """
    name = obj.stem.replace(".", "_")
    lnk = OUT / f"{name}.lnk"
    overlay = overlay_group(source)
    in_overlay = overlay_sections(source, overlay)
    if overlay and (not SYMMUNGE.is_file() or
                    hashlib.sha256(SYMMUNGE.read_bytes()).hexdigest() != SYMMUNGE_SHA256):
        sys.exit('[symmunge] overlay SYM requires the verified original SYMMUNGE 1.56 executable; '
                 'set DIAB_SYMMUNGE to its path')
    def write_lnk(with_stub):
        lines = ["\torg\t$80010000", "text\tgroup"]
        if not overlay:
            lines += ["\tsection\t.text,text"]
        sections = ('.rdata', '.data', '.sdata', '.sbss', '.bss', '.ctors', '.dtors')
        lines += [f'\tsection {section},text' for section in sections if section not in in_overlay]
        if overlay:
            # OVER plus /v is essential: ORG/OBJ alone never emits overlay
            # switches. The empty anchor reserves PsyQ's four-byte overlay ID.
            # Keep the diagnostic image in one CPE so the bytes gate reads the
            # very same link; retail splits these groups into separate files.
            lines += ['overlay_anchor group org($80139BF8)', f'{overlay} group over(overlay_anchor)']
            lines += [f'\tsection {section},{overlay}' for section in ('.rdata', '.data', '.text')
                      if section in in_overlay]
        lines += [f"\tinclude\t{obj.name}"] + ([f"\tinclude\t{name}_stub.obj"] if with_stub else [])
        lnk.write_bytes(("\r\n".join(lines) + "\r\n").encode())
    def run():
        sym_name = f'{name}.raw.sym' if overlay else f'{name}.sym'
        return subprocess.run([str(PSYLINK), "/c", "/m", *(['/v'] if overlay else []), f"@{lnk.name},{name}.cpe,{sym_name},{name}.map"],
                              capture_output=True, text=True, cwd=OUT, env=ENV)
    write_lnk(False); r = run()
    undef = sorted(set(re.findall(r"Symbol '([^']+)' not defined", r.stdout + r.stderr)))
    if undef:
        stub = OUT / f"{name}_stub.s"
        stub.write_bytes(("\t.text\r\n" + "".join(f"\t.globl {n}\r\n{n}:\r\n\tnop\r\n" for n in undef)).encode())
        r2 = subprocess.run([str(ASPSX), "-q", "-o", str(OUT / f"{name}_stub.obj"), str(stub)], capture_output=True, text=True, cwd=ROOT, env=ENV)
        write_lnk(True); r = run()
    if "0 error(s)" not in r.stdout:
        sys.exit(f"[psylink] {name}\n{r.stdout}{r.stderr}")
    sym = OUT / f"{name}.sym"
    txt = OUT / f"{name}.sym.txt"
    if overlay:
        raw = OUT / f'{name}.raw.sym'
        dump = subprocess.run([str(DUMPSYM), str(raw)], capture_output=True, text=True, cwd=OUT)
        (OUT / f'{name}.raw.sym.txt').write_text(dump.stdout, encoding='utf-8', errors='replace')
        if dump.returncode or ' overlay length ' not in dump.stdout or ' set overlay' not in dump.stdout:
            sys.exit('[psylink] missing real overlay records before SYMMUNGE')
        cpe = OUT / f'{name}.cpe'
        before = hashlib.sha256(cpe.read_bytes()).hexdigest()
        r = subprocess.run([str(SYMMUNGE), '/i', str(raw), str(sym)],
                           capture_output=True, text=True, cwd=OUT, env=ENV)
        (OUT / f'{name}.symmunge.log').write_text(r.stdout + r.stderr)
        if r.returncode or 'Symbol file compacted OK' not in r.stdout or not sym.is_file():
            sys.exit(f'[symmunge] {name}\n{r.stdout}{r.stderr}')
        if hashlib.sha256(cpe.read_bytes()).hexdigest() != before:
            sys.exit('[symmunge] linked bytes changed unexpectedly')
    r = subprocess.run([str(DUMPSYM), str(sym)], capture_output=True, text=True, cwd=OUT)
    if r.returncode:
        sys.exit(f'[dumpsym] {name}\n{r.stdout}{r.stderr}')
    txt.write_text(r.stdout, encoding="utf-8", errors="replace")
    return txt

# ---- record model ---------------------------------------------------------------------------
REC = re.compile(r"^[0-9a-f]+: \$([0-9a-f]{8}) (9[46]) Def2? class (\w+) type (.*?) size (\d+)(?: dims (\d+)((?: \d+)*))?(?: tag (\S*))? name (\S+)$")

def functions(txt: str, every=False):
    """{name: {hdr:{}, start, recs:[...], blocks:[(rel_addr, kind)]}} from a dumpsym text
    (every=True: {name: [copy, ...]} -- header inlines are emitted out of line once per TU, so the
    retail SYM holds several same-named functions at different VAs)"""
    out, cur = {}, None
    for ln in txt.splitlines():
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) 8c Function start", ln)
        if m: cur = dict(start=int(m[1], 16), hdr={}, recs=[], blocks=[]); continue
        if cur is None: continue
        m = re.match(r"\s+(\w+) = (.*)", ln)
        if m: cur["hdr"][m[1]] = m[2].strip(); continue
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) (90|92) Block (start|end)\s+line = (\d+)", ln)
        if m:
            cur["blocks"].append((int(m[1], 16) - cur["start"], m[3])); cur.setdefault("blines", []).append(int(m[4]))
            cur.setdefault("seq", []).append(("B", m[3], int(m[1], 16) - cur["start"])); continue
        m = REC.match(ln)
        if m:
            val, _, cls, typ, size, ndim, dims, tag, name = m.groups()
            v = int(val, 16)
            if cls in ("REG", "REGPARM"): loc = f"${v}"
            elif cls in ("AUTO", "ARG"): loc = f"sp{(v - (1 << 32)) if v >= 1 << 31 else v:+d}"
            elif cls == "STAT": loc = "static"
            else: loc = ""
            cur["recs"].append((cls, typ.strip(), int(size), (dims or "").strip(), (tag or ""), name, loc))
            cur.setdefault("seq", []).append(("R", name)); continue
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) 8e Function end", ln)
        if m:
            cur["end"] = int(m[1], 16) - cur["start"]
            if every: out.setdefault(cur["hdr"].get("name"), []).append(cur)
            else: out.setdefault(cur["hdr"].get("name"), cur)
            cur = None
    return out

def oracle_va(seg: str, board: str):
    """start VA of this segment's copy of `board` (from its asm/nonmatchings oracle), or None"""
    p = ROOT / "asm" / "nonmatchings" / seg / (board + ".s")
    if not p.is_file():
        # Default TU audits use compiler names, while header-copy oracles carry
        # address suffixes. Resolve only one copy in this TU, never the first
        # same-named function from another TU or a misspelled explicit suffix.
        if re.sub(r'_(?:[0-9a-f]{8}|ci)$', '', board) != board:
            return None
        copies = [q for q in p.parent.glob('*.s')
                  if re.sub(r'_(?:[0-9a-f]{8}|ci)$', '', q.stem) == board]
        if len(copies) != 1:
            return None
        p = copies[0]
    m = re.search(r"/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s", p.read_text())
    return int(m.group(1), 16) if m else None

def norm_tag(t):
    return re.sub(r"^\._\d+$", "<anon>", t)

def show(f):
    d = 0; out = []
    for (a, k), ln in zip(f["blocks"], f.get("blines", [])):
        if k == "end": d -= 1
        out.append("  " * d + ("{" if k == "start" else "}") + f"+{a:x}/L{ln}")
        if k == "start": d += 1
    return " ".join(out)

def compare(ours, retail):
    """(ok, message) for one function"""
    for k in ("fsize", "mask", "maskoffs", "fp", "retreg"):
        if ours["hdr"].get(k) != retail["hdr"].get(k):
            return False, f"header {k}: ours {ours['hdr'].get(k)} retail {retail['hdr'].get(k)}"
    if ours.get("end") != retail.get("end"):
        return False, f"length: ours 0x{ours.get('end', 0):x} retail 0x{retail.get('end', 0):x}"
    a, b = ours["recs"], retail["recs"]
    for i in range(max(len(a), len(b))):
        x = a[i] if i < len(a) else None; y = b[i] if i < len(b) else None
        if x is None or y is None:
            return False, f"record {i}: ours {x} retail {y}"
        xa, ya = list(x), list(y); xa[4] = norm_tag(xa[4]); ya[4] = norm_tag(ya[4])
        if xa != ya:
            return False, f"record {i} ({y[5]}): ours {x} retail {y}"
    if ours.get("seq") != retail.get("seq") and ours["blocks"] == retail["blocks"]:
        return False, "record/level membership differs: ours " + " ".join((x[1] if x[0] == "R" else ("{" if x[1] == "start" else "}")) for x in ours.get("seq", [])) + "  retail " + " ".join((x[1] if x[0] == "R" else ("{" if x[1] == "start" else "}")) for x in retail.get("seq", []))
    if ours["blocks"] != retail["blocks"]:
        return False, "blocks differ" + chr(10) + "      ours:   " + show(ours) + chr(10) + "      retail: " + show(retail)
    return True, "SYM ok"

def normalize_embedded_text_table(f, fn):
    """Return a retail receipt with inline table bytes removed from code-relative offsets."""
    spec = EMBEDDED_TEXT_TABLES.get(fn)
    if not spec:
        return f
    start, count, pad_before = spec
    cut_hi = (start + count) * 4
    delta = (count + pad_before) * 4
    def shifted(a):
        return a - delta if a >= cut_hi else a
    out = dict(f)
    out["end"] = f.get("end", 0) - delta
    out["blocks"] = [(shifted(a), k) for a, k in f.get("blocks", [])]
    out["seq"] = [(x[0], x[1], shifted(x[2])) if x[0] == "B" else x for x in f.get("seq", [])]
    return out

def main():
    src = ROOT / sys.argv[1]
    want = sys.argv[2].split(",") if len(sys.argv) > 2 else None
    obj = compile_g(src)
    txt = link(obj, source=src)
    ours = functions(txt.read_text(encoding="utf-8", errors="replace"))
    retail_all = functions(RETAIL.read_text(encoding="latin-1"), every=True)
    retail = {k: v[0] for k, v in retail_all.items()}
    names = want or [n for n in ours if not n.startswith("__maspsx")]
    n_ok = 0
    for n0 in names:
        n = re.sub(r"_(?:[0-9a-f]{8}|ci)$", "", n0)      # board names carry the dup-copy suffix; the object/SYM name does not
        if n not in ours: print(f"  {n0}: NOT IN OBJECT"); continue
        rn = n if n in retail else ("_._" + n[3:] if n.startswith("___") and ("_._" + n[3:]) in retail else None)   # cfront dtor spelling
        if rn is None and re.fullmatch(r'_GLOBAL__[ID]_\w+', n):
            candidate = n.replace('_GLOBAL__I_', '_GLOBAL_.I.').replace('_GLOBAL__D_', '_GLOBAL_.D.')
            if candidate in retail:
                rn = candidate
        if rn is None: print(f"  {n0}: NO RETAIL SYM"); continue
        rf = retail[rn]
        if len(retail_all[rn]) > 1:     # same-named copies: take the one at this segment's oracle VA
            va = oracle_va(src.stem.lower(), n0)
            copies = [c for c in retail_all[rn] if c['start'] == va]
            if len(copies) != 1:
                print(f'  {n0}: NO RETAIL SYM (missing or ambiguous TU copy)'); continue
            rf = copies[0]
        rf = normalize_embedded_text_table(rf, n)
        ok, msg = compare(ours[n], rf)
        if os.environ.get("SYM_BLOCKS"):
            msg += chr(10) + "      ours:   " + show(ours[n]) + chr(10) + "      retail: " + show(rf)
        n_ok += ok
        print(f"  {n0}: {'SYM ok' if ok else 'SYM DIFF — ' + msg}")
    print(f"SYM: {n_ok}/{len(names)} ok  ({txt})")
    return 0 if names and n_ok == len(names) else 1

if __name__ == "__main__":
    sys.exit(main())
