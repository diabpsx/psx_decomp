# Toolchain identity — DIABPSX.BIN (SLPS-01416, 1998-05-29)

## Evidence
1. **Library version = PsyQ 4.0.** Exact byte search of every PsyQ library function blob (extracted
   from `PSX/LIB/*.LIB` with `tools/psyq_extract.py`) against the image: PsyQ 4.0 = 27 hits,
   PsyQ 4.3 = 16 hits. The discriminating set — `AddPrim, AddPrims, CatPrim, GetClut, GetTPage,
   NextPrim, IsEndPrim, TermPrim, SetDrawLoad, SetDrawTPage, SetLineG3, SetLineG4` (LIBGPU) —
   matches the 4.0 bytes and NOT the 4.3 bytes. (Most lib functions carry relocations, so an exact
   search only ever finds the relocation-free ones; a reloc-masked comparison is the follow-up.)
2. **Compiler = the PsyQ 4.0 cc1/cc1plus (gcc 2.7.2.SN32.3.7).** First compiled functions
   (`GMAN.CPP`: `TextDat::TextDat`, `OnceOnlyInit`, `InitData`) byte-match through
   `CC1PLPSX.EXE -quiet -O2 -G8` + maspsx + GNU as.
3. **Language lanes.** `SOURCE/*.CPP` and `PSXSRC/*.CPP` = C++ (gcc-2.x cfront-style mangling
   `Name__7TextDat`, dtors `_._7TextDat` → spelled `___7TextDat` by SN's assembler);
   `GLIBDEV/SOURCE/*.C` (GAL/TASKER/GSYS/…) = C. `PSXSRC/*.MIP` = hand-written MIPS assembly.
4. **Diablo does NOT use PsyQ libgte** — the `GTE_*` functions at the start of `.text` are Climax's
   own GLIB layer (`GTE_SetTransXYZ` @0x8001000C …). PsyQ libgpu/libspu/libcd/libcard/libpad/libc/
   libsn are linked from the 4.0 archives.

## Memory map (from DIABPSX.MAP)
| range | what |
|---|---|
| 80010000–8003017B | `(default)` 8 B + `.boot_text` + unnamed `.text` = GLIB + PsyQ libraries |
| 8003017C–800B031B | per-TU `.NAME_text` sections (game + PSX layer) |
| 800B031C–800B0CFF | `startup_text` (overlay ids 4/5, inside the image) + `.ctors/.dtors` |
| 800B0D00–8010DBAB | `.data` (+ per-TU `.NAME_data`) |
| 8010DBAC–8011A77F | `.rdata` |
| 8011A780–8011C603 | `.sdata`  (**$gp = 0x8011A780** = .sdata start, from the boot code) |
| 8011C604–80139BF3 | Runtime `.sbss` + `.bss`; the raw file instead has a four-byte additive checksum at its 8011C604 boundary (see `tools/image_trailer.py`) |
| 80139BF8+ | overlays b–e: pregame / frontend / game / fmv (+libpress) — separate binaries in LUMP.BIN |

## Open items
* `-G` value (default 8 assumed) and ASPSX version (2.56 assumed) — to be settled by the gp-rel
  census + gates on functions touching small globals.
* Overlay binaries (791 SYM functions live at 80139BF8+) — extract with `divination`'s `dstream`.

## Linux lane
`sh tools/linux_setup.sh && . /home/user/tc/env.sh` builds an equivalent gate lane on Linux (PsyQ 4.0 exes under
wibo, bare-metal `mipsel-none-elf` as/objdump from binutils 2.42, psx_mnd_sym as DUMPSYM) and exports the
`DIAB_*` overrides that build.py / verify_asm.py / symlane.py read. Checked 2026-09-27: `tools/status.py` reproduces
the Windows board function-for-function (2406/2702 excluding the `scratch` segment, whose oracle
`asm/nonmatchings/scratch/` is caught by the `scratch/` .gitignore rule and is not in the repo).
Use the `*-elf` binutils, not Ubuntu's `mips-linux-gnu`: its gas pads `.text` to 16 bytes, which fails the last
function of every TU on a trailing nop.
