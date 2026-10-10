#!/usr/bin/env python3
"""symlane.py — the SYM receipt of the project PASS rule (bytes 0 diffs AND exact SYM records).

    python tools/symlane.py recon/psxsrc/gman.cpp [FN,FN...]      # default: every function the TU defines

Pipeline (PsyQ 4.0 by default; reviewed per-TU historical GLIB overrides,
native vendor assembler/linker and symbol compactor):
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
import hashlib, json, os, re, shutil, subprocess, sys, tempfile
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
GLIB_CC1 = Path(os.environ.get("DIAB_GLIB_CC1", "C:/Temp/windows-gcc-psx/gcc-2.6.3-psx/cc1.exe"))
DOSBOX = Path(os.environ.get("DIAB_DOSBOX", "C:/Temp/diablo-psx-tool-probes/dosbox/dosbox-staging-v0.83.0/dosbox.exe"))

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

# Reviewed per-TU C compiler lanes (toolchain identity, docs/TOOLCHAIN.md): name -> (executable, runs under DOSBox).
# "gcc-2.6.3"  : FSF gcc 2.6.3 cc1 stand-in for the Climax GLIB objects (PsyQ 3.x era, ASPSX 2.34 behaviour).
# "psyq36-dos" : PsyQ 3.6 DOS CC1PSX ("2.7.2.SN.1") for the EA Canada EACLIB objects (ASPSX 2.56 default guards).
PSYQ36_CC1 = Path(os.environ.get("DIAB_PSYQ36_CC1", "C:/Temp/diablo-psx-tool-probes/psyq36/CC1PSX.EXE"))
COMPILER_LANES = {"gcc-2.6.3": (GLIB_CC1, False), "psyq36-dos": (PSYQ36_CC1, True)}


def compiler_lane(src: Path, is_cpp=False):
    """(compiler executable, runs-under-DOSBox) for a source; None lane = the PsyQ 4.0 cc1/cc1plus."""
    lane = B.per_tu_flags(src).get("compiler")
    if lane is None:
        return (B.CC1PL if is_cpp else B.CC1), False
    if lane not in COMPILER_LANES or is_cpp:
        raise ValueError("unreviewed per-TU compiler lane")
    return COMPILER_LANES[lane]


def compiler_for(src: Path, is_cpp=False) -> Path:
    return compiler_lane(src, is_cpp)[0]


def compile_dos_cc1(compiler: Path, flags, i_file: Path, s_file: Path):
    """Run a DOS-only cc1 (PsyQ 3.6 CC1PSX) under DOSBox: 8.3 names, TMP inside the work dir."""
    if any(not re.fullmatch(r"-[A-Za-z0-9=_-]+", flag) for flag in flags):
        raise ValueError("unsafe DOS cc1 flag")
    with tempfile.TemporaryDirectory(prefix="cc1dos-", dir=OUT) as directory:
        work = Path(directory)
        shutil.copyfile(compiler, work / "CC1PSX.EXE")
        shutil.copyfile(i_file, work / "IN.I")
        command = "cc1psx " + " ".join(flags) + " IN.I -o OUT.S > CC.LOG"
        run = subprocess.run([str(DOSBOX), "--noprimaryconf", "--nolocalconf", "--noautoexec",
                              "--set", "output=texture", "--set", "texture_renderer=software",
                              "--set", "mididevice=none", "--set", "cpu_cycles=max",
                              "-c", "mount c " + str(work), "-c", "c:",
                              "-c", "set TMP=C:" + chr(92), "-c", "set TEMP=C:" + chr(92),
                              "-c", command, "-c", "exit"],
                             capture_output=True, text=True, cwd=work,
                             env=dict(os.environ, SDL_VIDEODRIVER="dummy", SDL_AUDIODRIVER="dummy"),
                             timeout=300, creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
        log = (work / "CC.LOG").read_text(encoding="latin-1") if (work / "CC.LOG").is_file() else ""
        if run.returncode or not (work / "OUT.S").is_file() or re.search(r"(?:^|\W)error", log, re.I):
            return subprocess.CompletedProcess(run.args, run.returncode or 1, run.stdout, run.stderr + log)
        s_file.write_text((work / "OUT.S").read_text(encoding="latin-1").replace("\r\n", "\n"))
        return subprocess.CompletedProcess(run.args, 0, run.stdout, run.stderr + log)


def assemble_native(assembler: Path, flags, source: Path, obj: Path, dos=False):
    """Run a reviewed native ASPSX, including DOS-only historical releases."""
    assembler, source, obj = Path(assembler), Path(source), Path(obj)
    if not dos:
        return subprocess.run([str(assembler), *flags, "-o", str(obj), str(source)],
                              capture_output=True, text=True, cwd=ROOT, env=ENV)
    if any(not re.fullmatch(r"-[A-Za-z0-9]+", flag) for flag in flags):
        raise ValueError("unsafe DOS ASPSX flag")
    obj.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="aspsx-", dir=OUT) as directory:
        work = Path(directory)
        shutil.copyfile(assembler, work / "ASPSX.EXE")
        shutil.copyfile(source, work / "IN.S")
        command = "aspsx " + " ".join(flags) + " IN.S -o OUT.OBJ > AS.LOG"
        run = subprocess.run([str(DOSBOX), "--noprimaryconf", "--nolocalconf", "--noautoexec",
                              "--set", "output=texture", "--set", "texture_renderer=software",
                              "--set", "mididevice=none", "--set", "cpu_cycles=max",
                              "-c", "mount c " + str(work), "-c", "c:", "-c", command, "-c", "exit"],
                             capture_output=True, text=True, cwd=work,
                             env=dict(os.environ, SDL_VIDEODRIVER="dummy", SDL_AUDIODRIVER="dummy"),
                             timeout=90, creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
        log = (work / "AS.LOG").read_text(encoding="latin-1") if (work / "AS.LOG").is_file() else ""
        if (run.returncode or not (work / "OUT.OBJ").is_file()
                or re.search(r"(?:^|\W)Errors?(?:\W|$)", log, re.I)):
            return subprocess.CompletedProcess(run.args, run.returncode or 1, run.stdout, run.stderr + log)
        shutil.copyfile(work / "OUT.OBJ", obj)
        return subprocess.CompletedProcess(run.args, 0, run.stdout, run.stderr + log)


def compile_g(src: Path, assembler=None, assembler_dos=False, assembler_flags=None,
              section_prefixes=None) -> Path:
    """cc1/cc1plus with the lane flags + -g, SN-ready .s"""
    rel = src.resolve().relative_to(ROOT)
    OUT.mkdir(parents=True, exist_ok=True)
    stem = OUT / rel.name
    i_file = stem.with_suffix(".i")
    is_cpp = src.suffix.lower() != ".c"
    flags = B.per_tu_flags(src)
    cpp = [B.CPP, "-x", "c", *(["-D__cplusplus=1"] if is_cpp else []),
           *B.CPP_FLAGS, *flags.get("cpp_extra", []), src, "-o", i_file]
    r = subprocess.run([str(c) for c in cpp], capture_output=True, text=True, cwd=ROOT)
    if r.returncode: sys.exit(f"[cpp] {rel}\n{r.stderr}")
    g = str(flags.get("g_value", B.G_VALUE))
    base = B.CC1PL_FLAGS if is_cpp else B.CC1_FLAGS
    cc1_flags = [f"-G{g}" if f == f"-G{B.G_VALUE}" else f for f in base] + flags.get("extra", []) + ["-g"]
    s_file = stem.with_suffix(".g.s")
    compiler, compiler_dos = compiler_lane(src, is_cpp)
    if compiler_dos:
        r = compile_dos_cc1(compiler, cc1_flags, i_file, s_file)
    else:
        r = subprocess.run([str(compiler), *cc1_flags, str(i_file), "-o", str(s_file)],
                           capture_output=True, text=True, cwd=ROOT, env=B._cc1_env())
    if r.returncode: sys.exit(f"[cc1] {rel}\n{r.stdout}{r.stderr}")
    txt = s_file.read_text().replace("_._", "___").replace("_GLOBAL_.I.", "_GLOBAL__I_").replace("_GLOBAL_.D.", "_GLOBAL__D_")
    section_prefixes = {} if section_prefixes is None else section_prefixes
    if not isinstance(section_prefixes, dict) or any(
            not re.fullmatch(r"\.[A-Za-z_][A-Za-z0-9_.]*", section)
            or not isinstance(payload, bytes) or not payload
            for section, payload in section_prefixes.items()):
        raise ValueError("invalid native section prefix")
    merged_sections = flags.get("merge_sections_into_text", [])
    if (not isinstance(merged_sections, list)
            or len(merged_sections) != len(set(merged_sections))
            or any(section not in (".rdata", ".data") for section in merged_sections)):
        raise ValueError("invalid merged-section registry")
    for section in merged_sections:
        txt = re.sub(r"^[ \t]*" + re.escape(section) + r"[ \t]*$", "\t.text", txt, flags=re.M)
    occurrence_renames = flags.get("section_occurrence_renames", [])
    if not isinstance(occurrence_renames, list):
        raise ValueError("invalid section-occurrence rename registry")
    for row in occurrence_renames:
        if (not isinstance(row, dict) or set(row) != {"section", "occurrence", "as"}
                or type(row["occurrence"]) is not int or row["occurrence"] <= 0
                or any(not re.fullmatch(r"\.[A-Za-z_][A-Za-z0-9_.]*", row[key])
                       for key in ("section", "as"))):
            raise ValueError("invalid section-occurrence rename")
        matches = list(re.finditer(r"^[ \t]*" + re.escape(row["section"]) + r"[ \t]*$", txt, re.M))
        if len(matches) < row["occurrence"]:
            raise ValueError("section-occurrence rename target is absent")
        match = matches[row["occurrence"] - 1]
        indent = re.match(r"[ \t]*", match[0])[0]
        txt = txt[:match.start()] + indent + ".section " + row["as"] + txt[match.end():]
    if compiler_dos:
        # CC1PSX 2.7.2.SN.1 honours `__attribute__((section(".text.lib")))` only until its first inline
        # jump table and then returns to `.text`, so ASPSX would split one TU's code over two sections.
        # The retail EA objects are plain `.text`; route the attribute there (the attribute exists only
        # to let the GNU lane place lib code in its own output section).
        txt = re.sub(r"^\s*\.section\s+\.text\.\w+[^\n]*$", "\t.text", txt, flags=re.M)
    # Insert borrowed carriers after the section merge, so the prefix lands in the member's real section.
    for section, payload in section_prefixes.items():
        match = re.search(r"^[ \t]*" + re.escape(section) + r"[ \t]*$", txt, re.M)
        if match is None:
            raise ValueError("native section-prefix target is absent")
        assembly = "\n".join("\t.byte\t" + ",".join(str(value) for value in payload[offset:offset + 16])
                             for offset in range(0, len(payload), 16))
        txt = txt[:match.end()] + "\n" + assembly + txt[match.end():]
    s_file.write_text(txt); crlf(s_file)
    obj = stem.with_suffix(".g.obj")
    # PsyQ 4.0 game objects use -0; the reviewed PsyQ 3.5 GLIB lane keeps
    # ASPSX 2.34's default divide expansion and old li-as-ori behavior.
    extra_as = ["-0"] if assembler_flags is None else list(assembler_flags)
    assembler_g = str(flags.get("assembler_g_value", g))   # the assembler's small-data threshold (.lcomm/.comm homes)
    if not re.fullmatch(r"[0-9]+", assembler_g):
        raise ValueError("invalid assembler -G value")
    r = assemble_native(ASPSX if assembler is None else assembler,
                        ["-q", "-g", *extra_as, f"-G{assembler_g}"], s_file, obj, assembler_dos)
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


def require_symmunge():
    if not SYMMUNGE.is_file() or hashlib.sha256(SYMMUNGE.read_bytes()).hexdigest() != SYMMUNGE_SHA256:
        sys.exit('[symmunge] overlay SYM requires the verified original SYMMUNGE 1.56 executable; '
                 'set DIAB_SYMMUNGE to its path')


def compact_overlay_sym(raw: Path, final: Path, payloads):
    """Original vendor compaction; preserve raw evidence and every linked payload."""
    require_symmunge()
    dump = subprocess.run([str(DUMPSYM), str(raw)], capture_output=True, text=True, cwd=raw.parent)
    raw.with_suffix('.sym.txt').write_text(dump.stdout, encoding='utf-8', errors='replace')
    if dump.returncode or ' overlay length ' not in dump.stdout or ' set overlay' not in dump.stdout:
        sys.exit('[psylink] missing real overlay records before SYMMUNGE')
    before = {p: hashlib.sha256(p.read_bytes()).hexdigest() for p in payloads}
    result = subprocess.run([str(SYMMUNGE), '/i', str(raw), str(final)],
                            capture_output=True, text=True, cwd=raw.parent, env=ENV)
    final.with_suffix('.symmunge.log').write_text(result.stdout + result.stderr)
    if result.returncode or 'Symbol file compacted OK' not in result.stdout or not final.is_file():
        sys.exit(f'[symmunge] {raw.name}\n{result.stdout}{result.stderr}')
    if any(hashlib.sha256(p.read_bytes()).hexdigest() != digest for p,digest in before.items()):
        sys.exit('[symmunge] linked bytes changed unexpectedly')
    return dump.stdout


def link(obj: Path, source=None) -> Path:
    """PSYLINK one object plus stubs; source selects the authentic overlay SYM route.

    No source requests a resident diagnostic link. Production callers pass the
    source so MAP-owned overlay TUs also run the original symbol compactor.
    """
    name = obj.stem.replace(".", "_")
    lnk = OUT / f"{name}.lnk"
    overlay = overlay_group(source)
    in_overlay = overlay_sections(source, overlay)
    if overlay:
        require_symmunge()
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
        compact_overlay_sym(raw, sym, [OUT / f'{name}.cpe'])
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
    out, cur, overlay = {}, None, 0
    for ln in txt.splitlines():
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) set overlay", ln)
        if m: overlay = int(m[1], 16); continue   # PSYLINK overlay id in force for the records that follow
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) 8c Function start", ln)
        if m: cur = dict(start=int(m[1], 16), hdr={}, recs=[], blocks=[], ovl=overlay); continue
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
    if ours.get("ovl", 0) != retail.get("ovl", 0):
        return False, f"overlay context: ours ${ours.get('ovl', 0):x} retail ${retail.get('ovl', 0):x}"
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
