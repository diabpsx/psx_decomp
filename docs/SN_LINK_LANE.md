# SN-native link lane (PSYLINK 2.52) — feasibility check, 2026-09-26

Question: can the NFS4 "Route C" build (slink Beta 3.0 + factory PsyQ libs + a reconstructed .LNK script)
be reused for Diablo?

## Verdict

* **slink itself: no.** `DIABPSX.MAP` is in **PSYLINK** format — it has the `Program entry point : 00000000`
  line and two spaces between address and name in the symbol table (slink writes neither), and the build
  (1998-05-29) predates slink Beta 3.0 (1999-01). Object chunks are 4-aligned, no dead stripping.
* **The Route C *method*: yes, and it is easier here than for NFS4/NFS2.** PsyQ 4.0 ships Win32
  `PSYLINK.EXE` (v2.52) and `ASPSX.EXE` (v2.56) that run natively on this machine — no DOS emulation.
  A probe link of GMAN reproduced the retail MAP layout byte-for-byte in format:

```
    Start     Stop   Length      Obj Group            Section name
 80010010 800134BB 000034AC 80010010 text             .GMAN_text
 800134BC 8001434B 00000E90 800134BC text             .GMAN_data
 8001434C 8001437F 00000034 8001434C text             .GMAN_rdata
 80014380 800143BB 0000003C 80014380 text             .GMAN_sdata
```

## What the probe established

| fact | how |
|---|---|
| per-object section names (`.GMAN_text`, `.GMAN_rdata`, …) are plain section renames | cc1plus `.text/.data/.rdata/.sdata` → `.section .GMAN_text` etc. in the `.s`; ASPSX 2.56 accepts it, PSYLINK groups them with `section .GMAN_text,text` |
| ASPSX 2.56 assembles the gate's cc1plus output directly (no maspsx) | `ASPSX -q -G8 -o gman.obj gman.cpp.s` — input must be **CRLF** |
| PSYLINK .LNK syntax | directives INDENTED (`\torg\t$80010000`), group names at column 0 (`text\tgroup`), `\tsection\t<name>,<group>`, `\tinclude\t<obj>` (backslash paths), CRLF file; run with `MSYS2_ARG_CONV_EXCL='*'` from bash or the `/c` switch becomes `C:/` |
| `/e` with a long equate list crashes PSYLINK 2.52 (Win32) | satisfy externals with a stub object instead |
| MAP + SYM + CPE come from one link | `psylink /c /m @x.lnk,x.cpe,x.sym,x.map` |

Probe files: `build/sn/` (gman_r.s / gman_r.obj / stub.s / probe.lnk / probe.map / probe.sym).

## Why it is worth building (later)

1. **SYM compare per function** — link with `-g` objects and diff our SYM against `DIABPSX.SYM`
   (fsize, register/stack assignment of every local, block nesting) exactly like the NFS4 debug-SYM
   compare: a stronger per-function oracle than bytes alone for local naming/scoping.
2. **Factory PsyQ members via `inclib`** for the lib region (LIBGPU/LIBETC/LIBAPI/LIBC…/LIBPRESS in the FMV
   overlay) instead of INCLUDE_ASM scaffolds.
3. **Overlays the retail way**: `frontend group over(text),file(FRONTEND.BIN)` … the MAP's `frontend_text /
   pregame_text / game_text / fmv_text` groups, all at 0x80139BF8, and the id word `$<group>_text` first.

## What a full DIABPSX.LNK needs (all derivable from the MAP / configs)

* `org $80010000`; groups in MAP order: `(default)` (the 8-byte header code), `boot_text`, `text`,
  `startup_text` (overlay $4), `data`, `rdata`, `sdata`, `sbss`, `bss`, then the four overlay groups.
* `section .<OBJ>_text,text` … for every object (order = `configs/sections.json`), Sony members through
  `inclib LIB*.LIB` (PsyQ 4.0), the startup object and the `.boot_text` word.
* The section-rename step in the build (`.text` → `.<OBJ>_text` …) for every compiled/assembled object.

The GNU-ld lane (`tools/link.py`, byte-identical today) stays the day-to-day gate; the SN lane is the
retail-fidelity check to add when the lib region and SYM compare are tackled.
