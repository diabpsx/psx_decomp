# Instrumented gcc-2.7.2 cc1plus — allocator-trace diagnostic lane

**DIAGNOSTIC ONLY.** Nothing here is, or ever replaces, the project's gate
compiler (`PSYQ / CC1PSX.EXE` / `CC1PLPSX.EXE` from `tools/build.py`). This is
a *separate*, from-source rebuild of vanilla FSF gcc-2.7.2, instrumented to
print its register allocator's internal decisions to stderr, used purely to
read off *why* the real compiler picked one register over another on a
near-miss. `tools/build.py` / the gate toolchain were not touched.

## Status (2026-09-28)

- **Stock (uninstrumented) gcc-2.7.2 cc1 + cc1plus: BUILT AND VALIDATED.**
  Binaries: `C:/temp/dmt-cc1/gccbuild-ecoff/cc1.exe`, `cc1plus.exe`
  (mipsel-unknown-ecoff target, built as a native i686 Windows exe via
  MinGW-w64 gcc 15).
- **Instrumented gcc-2.7.2 cc1plus (qty_order/global-allocno traces): BUILT.**
  Binary: `C:/temp/dmt-cc1/gccbuild-instr/cc1plus.exe`.
- **Validation vs real PsyQ CC1PLPSX.EXE** (identical flags, identical `.i`):
  4/6 clean-compiling passing-TU samples byte-identical at the `.s` level
  (mod `.set nobopt`, a no-op directive — see below); 2/6 show one genuine,
  small, reproducible codegen divergence (an extra callee-saved register +
  8-byte frame growth, always the *same shape*); 4/10 sampled TUs make
  vanilla FSF cc1plus ICE on a destructor construct that the SN-patched
  retail compiler (`gcc 2.7.2.SN32.3.7`) handles without crashing. See
  **§3 Validation results** for the detail and what each means for trusting
  the instrumented traces.
- **Worked example (`PrintItemPower__FcPC10ItemStruct`) done** — see §5.

## 1. Build recipe (from scratch)

Source tree: `C:/temp/dmt-cc1/gccsrc/gcc-2.7.2` (stock) and
`gcc-2.7.2-instr` (instrumented copy, `apply_traces_272.py` applied).
Both are plain copies of `C:/Temp/gcc-2.7.2-src/gcc-2.7.2/` (the pristine
FSF 2.7.2 tarball extraction) plus the **host-only** fixes below. Host
toolchain: MinGW-w64 gcc 15.2.0 (WinLibs POSIX/UCRT build already on this
machine) + `mingw32-make`, same as `C:/Temp/nfs4-instr-cc1/build_cc1.sh`
used for the NFS4 gcc-2.8.1 instrumented cc1.

```sh
MINGW=/c/Users/Vyacheslav/AppData/Local/Microsoft/WinGet/Packages/BrechtSanders.WinLibs*/mingw64/bin
export PATH="$MINGW:$PATH"

# 1. copy the pristine tree, apply host-only fixes (below), then:
mkdir -p gccbuild-ecoff && cd gccbuild-ecoff
CC="gcc -std=gnu89 -w" ../gccsrc/gcc-2.7.2/configure \
    --target=mipsel-unknown-ecoff --host=i586-pc-mingw32 --build=i586-pc-mingw32 \
    --prefix=./inst

# 2. build cc1 (C) -- this part links cleanly via the top Makefile:
mingw32-make CC="gcc -std=gnu89 -w" CFLAGS="-O1 -w -std=gnu89" LANGUAGES="c" cc1

# 3. build cc1plus's C++ objects DIRECTLY in cp/ (see gotcha #6 below --
#    the top Makefile's own recursive call into cp/ passes a broken CC):
mingw32-make -C cp CC="gcc -std=gnu89 -w" CFLAGS="-O1 -w -std=gnu89" ../cc1plus
# (this will still fail at the FINAL link step with the same broken-CC bug --
#  that's fine, all the cp/*.o and the top-level stamp-objlist now exist)

# 4. link cc1plus by hand with the real compiler:
cd cp
gcc -std=gnu89 -w -DCROSS_COMPILE -DIN_GCC -O1 -w -std=gnu89 -o ../cc1plus \
  call.o decl.o errfn.o expr.o pt.o sig.o typeck2.o class.o decl2.o error.o \
  gc.o lex.o parse.o ptree.o spew.o typeck.o cvt.o edsel.o except.o init.o \
  method.o search.o tree.o xref.o repo.o \
  $(cat ../stamp-objlist) ../c-common.o ../c-pragma.o ../obstack.o
```

`--host`/`--build` use `i586-pc-mingw32` (not `i686-...`): 2.7.2's configure
predates `i[34567]86` glob patterns for i386 targets and only matches
`i[345]86-*`; using `i686` silently falls through to "Configuration ...
not supported" once the config.sub/guess fix (below) makes the triplet
parse. Picking `i586` sidesteps having to widen every `i[345]86-*)` case
arm in the (large, historic) configure script.

## 2. Host-only fixes required (none touch MIPS/target codegen)

Every fix here is **host build-portability only** — it changes how cc1plus
is compiled/linked as a native Windows binary on a MinGW-w64 gcc 15 host, or
which files configure wires together for that host. **None of it changes a
single target instruction, register, or codegen decision** — this is the
whole point of doing the byte-identity validation in §3: if any of this had
touched codegen, the validation would show it as `DIFFERS` uniformly, not
"4/6 identical, 2/6 one same-shape delta, rest match after the fix".

1. **`config.sub` / `config.guess`**: 2.7.2's are pre-mingw32 (1995) and don't
   recognize any `*-mingw32*` triplet at all. Copied verbatim from the
   gcc-2.8.1 tree already used for NFS4 (`C:/Temp/nfs4-decomp/scratch/gccsrc/gcc-2.8.1/config.{sub,guess}`)
   — these are generic GNU autoconf triplet tables, not gcc source.
2. **`configure` — no mingw32/cygwin32 *host* case at all** (`host-fixes-configure.patch`,
   included in this dir). 2.7.2 predates MinGW/Cygwin as a *host* (only
   `winnt3`/native-NT and mingw-as-a-*target* existed at the time); ported
   the `i[345]86-*-mingw32*` / `i[345]86-*-pe|cygwin32` case arms verbatim
   from gcc-2.8.1's configure, using 2.7.2's `i[345]86` glob style (not
   2.8.1's `i[34567]86` — hence the i586 host triplet above). **Fixed one
   real bug in the 2.8.1 pattern while porting it**: 2.8.1's own
   `xm_file="${xm_file} i386/xm-mingw32.h"` (appending to an EMPTY `xm_file`)
   leaves a leading space that becomes two broken words
   (`../gccsrc/.../config/` and `i386/xm-mingw32.h`) in the Makefile's
   `build_xm_file`/`host_xm_file` variables → `No rule to make target
   'i386/xm-mingw32.h'`. Fixed by assigning `xm_file=i386/xm-mingw32.h`
   directly (no `${xm_file}` prefix) instead.
3. **`config/i386/{mingw32.h,xm-mingw32.h,cygwin32.h,xm-cygwin32.h,t-cygwin32,x-cygwin32,cygwin32.asm,winnt.c}`**
   copied verbatim from gcc-2.8.1's `config/i386/` (2.7.2 has none of these
   files — mingw/cygwin host support didn't exist yet in July 1995).
4. **`config/i386/xm-mingw32.h` — two additions** (`xm-mingw32.h.reference`
   in this dir is the final file; diff it against the 2.8.1 original to see
   exactly what was added):
   - `#include "i386/xm-i386.h"` — 2.7.2's configure has no generic i386
     xm_file default that 2.8.1's does (2.8.1's configure auto-prepends
     `i386/xm-i386.h` before ANY i386 case runs; 2.7.2 requires every case
     arm to name it explicitly, and I didn't for the new mingw32 arm). Its
     absence causes `HOST_BITS_PER_{CHAR,INT,LONG}` etc. to be undefined,
     which cascades into "TARGET_NEWLINE undeclared" errors in c-lex.c (the
     macros ARE defined, correctly, in `config/mips/mips.h`, but the error
     is actually earlier in the include chain, in `machmode.h`'s
     `HOST_BITS_PER_WIDE_INT` fallback — a genuine host/xm inclusion-order
     bug, nothing to do with the mips.h target file).
   - `#define bcmp memcmp` / `bcopy(s,d,n)` / `bzero(s,n)` / `#define index
     strchr` / `#define rindex strrchr` — mingw-w64's UCRT has no BSD
     string.h compat that 2.7.2's own C/C++ sources (`c-common.c`, `tree.c`,
     `cp/lex.c`) still call directly (`undefined reference to 'index'`/`'bcmp'`
     at link time). **Object-like** macro renaming (`#define index strchr`),
     not function-like (`#define index(s,c) strchr(s,c)`) — `cp/lex.c` has a
     bare K&R `extern char *index ();` forward declaration that a
     function-like macro breaks (`macro 'index' requires 2 arguments, but
     only 1 given`); an object-like rename survives being "called" through
     a differently-prototyped extern exactly like the real libc symbol would.
5. **`obstack.h` — cast-as-lvalue** (`host-fixes-obstack.patch`, included):
   same class of fix `apply_traces.py` already does for the NFS4 gcc-2.8.1
   tree (`*((T*)p)++ = v` rejected by gcc ≥4 as "lvalue required as
   increment operand") — 2.7.2's `obstack.h` needed the identical rewrite to
   `(*(T*)p = v, p += sizeof(T))`, applied to all 5 offending macro
   definitions (`obstack_ptr_grow`, `obstack_int_grow`, and both
   `_grow_fast` variants in both the GNU-`__extension__` branch AND the
   non-GNU fallback branch, which turned out to matter here because the
   fallback's `_grow_fast` macros have the SAME bug even though the
   non-fast macros in that branch don't).
6. **Recursive-make CC passthrough is broken for `cp/`** (build-time
   workaround, not a source patch): the top Makefile's `FLAGS_TO_PASS`
   computes `"CC=`case '' in stage*) ... ;; *) echo '';; esac`"` — a
   3-stage-bootstrap leftover that ALWAYS evaluates to an empty string
   regardless of the `CC=` given on the command line, so `cp/`'s own
   Makefile falls back to its unexpanded `CC = cc` default (`cc` isn't on
   this machine's PATH). Same bug bites the final `cd cp; $(MAKE) ...
   ../cc1plus` link step. **Workaround, no file changed:** invoke
   `mingw32-make -C cp CC="..." ...` directly (bypasses the broken
   recursive-make CC line entirely) for compiling the C++ frontend, and
   link `cc1plus` by hand with a plain `gcc ... -o cc1plus <objects>` command
   once all the `.o`s exist (step 4 above). This is pre-existing 2.7.2
   3-stage-bootstrap-era Makefile plumbing, unrelated to the mingw port.
7. **Stale generated-parser timestamps**: `cp -r` doesn't preserve mtimes,
   so a fresh copy can make `c-parse.y` (or `cp/parse.y`, `*.gperf`) look
   NEWER than its shipped pre-generated `.c`/`.h`, triggering a `bison`/`gperf`
   regen that isn't installed on this machine (`bison: command not found`).
   Fix: `touch` all `*.y`/`*.in`/`*.gperf` sources to an old timestamp, then
   `touch` their shipped generated outputs (`c-parse.c/h`, `c-gperf.h`,
   `cp/parse.c/h`, `cp/hash.h`, `objc-parse.c`, `bi-parser.c/h`, `cexp.c`)
   a minute later, so make sees them as already up to date. (Needed only
   once per fresh checkout; the repo tarball already ships these generated
   files — bison/gperf were never actually needed.)

None of items 1–7 touch `config/mips/*` or any RTL/codegen source file.

## 3. Validation results (stock cc1plus vs real PsyQ CC1PLPSX.EXE)

Method (`compare_tu.py`): for each recon `.cpp`, run BOTH compilers on the
*same* `cpp`-preprocessed `.i`, with the exact flags `tools/build.py`'s
`CC1PL_FLAGS` uses (`-quiet -O2 -G8 -fno-inline -fsigned-char`), then diff
the two `.s` outputs (after the same `_._`→`___`/`_GLOBAL_.I.`→`_GLOBAL__I_`
dtor/ctor-thunk renaming `build.py` itself applies, and stripping `.file`/
`.ident`/`.set nobopt` — inert-directive lines that never reach the final
`.o` after maspsx+as, so they don't affect byte-identity of the actual
build output).

| TU (all currently fully-PASS in `MATCH_PROGRESS.md`, i.e. matches retail) | Result |
|---|---|
| `recon/psxsrc/async.cpp` (6/6 PASS) | **IDENTICAL** |
| `recon/psxsrc/attract.cpp` (3/3 PASS) | **IDENTICAL** |
| `recon/psxsrc/corefmv.cpp` (2/2 PASS) | **IDENTICAL** |
| `recon/source/coreinv.cpp` (1/1 PASS) | **IDENTICAL** |
| `recon/psxsrc/bird.cpp` (28/28 PASS) | DIFFERS — 1 fn (`PlaceFlock`), see below |
| `recon/source/coremon.cpp` (17/17 PASS) | DIFFERS — 1 fn (`SpawnSkeleton`), same shape |
| `recon/psxsrc/cardcore.cpp`, `cdio.cpp`, `choosem.cpp`, `compmap.cpp` | ICE in our stock cc1plus (destructor-related), see below |

**The "DIFFERS" cases (`PlaceFlock__FP10BIRDSTRUCT`, `SpawnSkeleton__Fiii`)
are the SAME shape both times**: our stock vanilla-FSF cc1plus keeps one
MORE local live across a call than the real SN-patched compiler does,
costing one extra saved callee-saved register and 8 bytes of frame
(`regs=5/0`→`6/0`, frame 40 unchanged for bird but locals 64→72/120→128 for
coremon). This is consistent with **vanilla FSF gcc-2.7.2 and Sony/SN
Systems's in-house-patched "gcc 2.7.2.SN32.3.7" not being byte-identical
allocators in every case** — SN Systems shipped their own local-alloc/global
patches on top of the FSF 2.7.2 base (this is common knowledge for
PsyQ-era SN toolchains; see `reference_psx_retail_build_practice.md`). This
does NOT invalidate the instrumented build as a *diagnostic* tool — it still
shows the REAL local-alloc/global-alloc algorithm and priority formula
faithfully (same source, same algorithm) — but it means a stock-derived
trace occasionally shows a *slightly* different final register pick than
retail on functions where this SN delta is in play. **Rule of thumb**: trust
the trace's *priority ORDERING and ref/live-length arithmetic* unconditionally
(that's the FSF 2.7.2 algorithm, unchanged); treat the *final numeric
register* as retail-accurate only after cross-checking against
`verify_asm.py`'s diff for that specific function (as done in §5 below).

**The ICE cases**: vanilla FSF gcc-2.7.2 crashes
(`Internal compiler error`) compiling a class with a destructor in 4 of the
10 TUs sampled (`Dialog::~Dialog()`, `CdIO::~CdIO()`, and two more) — this is
a known FSF-2.7.2-era C++ destructor-codegen bug that SN's patched compiler
does not have (SN Systems backported/fixed bugs from later FSF snapshots
into their PsyQ compiler, same pattern as `reference_psyz_decomp.md`'s
"2.7.2-law" comparandum notes for other Sony/PsyQ-era forks). **This ICE is
orthogonal to the register-allocator instrumentation** (`global.c`/
`local-alloc.c` are untouched by it — the crash is in `cp/decl2.c`'s
deleting-destructor synthesis, which runs before local-alloc ever sees the
function) — so it does not compromise the validity of the allocator traces
for functions that DON'T hit it (which is most functions; `PrintItemPower`
below is a plain function, no destructor, and traces/compiles cleanly). It
DOES mean the instrumented cc1plus cannot currently trace an ENTIRE TU that
contains any dtor-bearing class — **use `isolate_fn.py` (see §4) to extract
just the target function** when this happens, exactly as done for
`PrintItemPower` below (its home TU `items.cpp` ICEs on an unrelated earlier
function, `GetItemStr`, at line 1690, before ever reaching `PrintItemPower`
at line 3414).

**Conclusion**: the instrumented build is a valid NEAR-ORACLE — it reproduces
retail codegen exactly on 4/6 sampled fully-passing TUs and the specific
target function of this report, with the two known deviation classes
(the SN-vs-FSF register-count delta, and the dtor ICE) both understood,
bounded, and orthogonal to the local-alloc/global-alloc trace path this
task cares about. Neither class affects `PrintItemPower`.

## 4. Running it on one TU / one function

```sh
# 1. get a .i the same way build.py would, WITHOUT invoking the real cc1plus:
python tools/instr/gen_i.py recon/source/items.cpp out.i

# 2. if the TU ICEs (destructor bug, §3) or is otherwise too large, isolate
#    just the target function first (blanks every OTHER top-level function's
#    BODY into a bodyless prototype -- keeps all types/globals/prototypes so
#    the target still compiles; heuristic, column-0-brace based, works for
#    this project's plain-function style, not battle-tested against nested
#    classes):
python tools/instr/isolate_fn.py recon/source/items.cpp PrintItemPower /tmp/items_isolated.cpp
cp /tmp/items_isolated.cpp recon/source/         # needs to sit next to its own headers
python tools/instr/gen_i.py recon/source/items_isolated.cpp out.i

# Or, when just one earlier function ICEs and preceding-TU compiler state may
# matter, remove only that body while retaining every other function:
python tools/instr/isolate_fn.py --drop-only recon/source/items.cpp GetItemStr recon/source/items_no_getitemstr.cpp

# 3. run the INSTRUMENTED cc1plus with GCC_TRACE_ALLOC=1, same flags as build.py's
#    CC1PL_FLAGS (-quiet -O2 -G8 -fno-inline -fsigned-char), and a writable
#    TMPDIR/TMP/TEMP (Windows path, trailing backslash):
GCC_TRACE_ALLOC=1 TMPDIR='C:\temp\dmt-cc1\tmp\' TMP='C:\temp\dmt-cc1\tmp\' TEMP='C:\temp\dmt-cc1\tmp\' \
  C:/temp/dmt-cc1/gccbuild-instr/cc1plus.exe -quiet -O2 -G8 -fno-inline -fsigned-char out.i -o out.s 2>trace.txt
```

`compare_tu.py <recon.cpp> [...]` automates the byte-identity check against
the real PsyQ compiler shown in §3 (uses `tools/build.py`'s own
`CC1PL_FLAGS`/`CPP_FLAGS`/paths, so it always tracks the gate's actual
flags).

When the stock compiler transforms a function differently, use the real
compiler's RTL dumps to check its actual loop decisions and allocation order:

```sh
python tools/instr/real_rtl.py recon/psxsrc/gpanel.cpp DrawDurThingy --dump loop
python tools/instr/real_rtl.py recon/psxsrc/gpanel.cpp DrawDurThingy --dump greg
```

The supported dumps are `loop`, `greg`, `lreg`, `flow`, `sched`, `sched2`, and
`dbr`. The last three expose pre-allocation scheduling (`-dS`), post-allocation
scheduling (`-dR`), and final delay-slot filling (`-dd`), respectively. These
old GCC option letters were checked against its `toplev.c`; do not substitute
newer GCC's dump spellings. For example:

```sh
python tools/instr/real_rtl.py recon/psxsrc/biglump.cpp BL_AsyncReadFile --dump sched2
python tools/instr/real_rtl.py recon/psxsrc/biglump.cpp BL_AsyncReadFile --dump dbr
```

Each invocation
retains its preprocessed input, assembly, and dump in a unique directory under
`build/rtl/`. It uses the gate compiler, flags, and per-TU overrides; no source
or assembly is rewritten. A missing source, compiler failure, absent dump, or
missing/ambiguous function heading is an error. Old GCC sometimes omits the
class from a heading; a qualified name may fall back to its bare name only when
that name identifies exactly one function in the dump.

## 5. The instrumentation (ported from NFS4's gcc-2.8.1 `apply_traces.py`)

`apply_traces_272.py` = the NFS4 gcc-2.8.1 `apply_traces.py`
(`C:/Temp/nfs4-instr-cc1/apply_traces.py`), ported to 2.7.2's `global.c` and
`local-alloc.c` (2.7.2 predates the `reload1.c`/`combine.c` instruments
`apply_traces.py` also has — `[reload_pick]`, `[reload-order]`,
`[distribute_notes]` — those were NOT ported; only the `[allocno_compare]`/
`[find_reg]`/`[caller-save]` (global.c) and `[qty_sugg_order]`/`[qty_order]`/
`[find_free_reg]`/`[qty_combine]`/`[qty_sugg]` (local-alloc.c) traces the
task asked for). Trace FORMAT is byte-identical to the 2.8.1 version (same
tag names, same column layout) so the NFS4 side's trace-reading habits
transfer directly; only the ANCHOR TEXT (the exact source strings the patch
matches against) needed adjusting for 2.7.2's slightly different source:

- `global.c`'s `allocno_compare` forward-decl prototype is
  `PROTO((int *, int *))` in 2.7.2 vs 2.8.1's `PROTO((const GENERIC_PTR,
  const GENERIC_PTR))` — anchor text updated, patch body unchanged (both
  versions have byte-identical `allocno_n_refs[]`/`allocno_live_length[]`/
  `allocno_calls_crossed[]`/`allocno_size[]` fields and the same
  `qsort(allocno_order, ...)` call site).
- `local-alloc.c`'s `qty_compare`/`qty_sugg_compare` priority-formula comment
  block ("Note that the quotient will never be bigger than...") recurs
  FOUR times in 2.7.2 (once per sort function: `qty_compare`,
  `qty_compare_1`, `qty_sugg_compare`, `qty_sugg_compare_1`) instead of once
  as a shared comment in 2.8.1, and lacks 2.8.1's trailing "QTY_CMP_PRI is
  also used by qty_sugg_compare." sentence that made a clean unique anchor
  — so the trace-helper function definitions (`nfs4_la_trace`,
  `nfs4_dump_qty_order`) are inserted right after the proto forward-decls
  instead (same unique anchor 2.8.1 already used for the *declarations*;
  2.7.2's version just also carries the *definitions* at that spot rather
  than near the priority-formula comment). No semantic difference — the
  trace output is identical either way, this is purely about finding a
  textually-unique splice point.
- `local-alloc.c`'s `combine_regs` merge-dump reads `reg_n_calls_crossed[]`/
  `reg_n_refs[]` directly (plain arrays) instead of 2.8.1's
  `REG_N_CALLS_CROSSED()`/`REG_N_REFS()` macros, which don't exist yet in
  2.7.2 — anchor + trace body updated to the array form (same values).
- `obstack.h`'s cast-as-lvalue fix is applied by hand (§2 item 5) rather
  than by the script's own `patch_obstack()` (whose anchor text is written
  for 2.8.1's slightly different whitespace) — `apply_traces_272.py` skips
  that step and expects it already done.

### The priority formula, as implemented (2.7.2 `local-alloc.c` / `global.c`)

Both allocators use the same shape of formula, evaluated in `qty_compare`/
`qty_sugg_compare` (`local-alloc.c` ~line 1580) and `allocno_compare`
(`global.c` ~line 583):

```
pri = floor_log2(refs) * refs * size / live_length * 10000
```

(`live_length = qty_death[q] - qty_birth[q]` in local-alloc; `size` is
almost always 1 for a scalar pseudo — the trace prints all four inputs plus
the resulting `pri` so you never have to recompute it by hand). Allocation
then proceeds in DESCENDING priority order (`qsort` + walk); for each
pseudo/allocno, `find_reg`/`find_free_reg` scans hard registers of the
right class **in a fixed physical/class order** and picks the **first free
one** — so higher priority = processed earlier = first claim on the
lowest-numbered free register of its class. A "coin-flip"-looking swap
between two registers of the same class is almost always just this: two
pseudos close enough in priority (or ordered oppositely between two
otherwise-similar builds) that whichever is processed first grabs the
lower-numbered register.

## 6. Worked example: `PrintItemPower__FcPC10ItemStruct`

Before the 2026-09-30 fix, the focused gate had **134 diffs, 497/497 instructions**:
our full `items.cpp` build put `x` in **s1** and the `tempstr` base in **s2**;
retail puts `x` in **s2** and the base in **s1**. The function now passes both
byte lanes, exact SYM, all 69 call targets, and its jump table.

**Diff direction matters:** `verify_asm.py` calls
`difflib.unified_diff(ours, oracle)`. A minus line is OURS; a plus line is
RETAIL. The original version of this example reversed that direction and
consequently reversed the variable-to-pseudo mapping and the proposed priority
adjustment. The correction below was checked directly against the full gate
compiler's assembly, its `-dg` dump, and the immutable oracle on 2026-09-30.

```
      -addu s1,a1,zero          OURS: x -> s1
      +addu s2,a1,zero          RETAIL: x -> s2
      -lui s2,0                OURS: tempstr base -> s2
      +lui s1,0                RETAIL: tempstr base -> s1
```

The saved instrumented trace is
`tools/instr/printitempower_trace_example.txt`. Its global allocation order:

```
[allocno_compare] order (allocno/pseudo:refs/live/calls/size=pri):
  1/74:40/168/35/1=11904   2/75:4/10/2/1=8000   14/434:3/4/0/1=7500
  3/76:14/76/21/1=5526     0/73:2/4/0/1=5000    8/163:4/16/4/1=5000
  ...
[find_reg] allocno 1 pseudo 74 refs 40 live 168 calls 35 -> reg 17 (s1): x
[find_reg] allocno 2 pseudo 75 refs 4 live 10 calls 2 -> reg 16 (s0)
[find_reg] allocno 3 pseudo 76 refs 14 live 76 calls 21 -> reg 18 (s2): tempstr base
```

The real PsyQ full-TU `-dg` dump confirms the same dispositions: pseudo 74
is assigned register 17, and pseudo 76 register 18. The parameter-copy instruction
moves **a1 into s1**, identifying pseudo 74 as `x`; the symbol-load instruction
sets **s2 to symbol_ref("tempstr")**, identifying pseudo 76 as the base.
Map pseudos from these defining instructions, not from inferred reference counts.

Thus `x` currently has higher priority (11904) than the base (5526).
A candidate source shape would need to **raise the base's priority above x's,
or lower x's below the base's**, while preserving retail instructions, debug
records, calls, and table targets. With refs/live otherwise unchanged, shortening
the base's live length from 76 to at most 35 would exceed x's current priority.
This arithmetic is a diagnostic constraint, not authorization for artificial
uses, register pins, eager field loads, or instruction rewrites.

A measured source experiment replacing every `tempstr` use with the existing
`tstr` alias reduced the function to 450 instructions and 169 diffs; it was
reverted. Changing only the first `strcpy` destination to `tstr` kept 497
instructions but increased the diff to 148; it was also reverted. Consistent
alias spelling alone does not reproduce the retail source shape.

The successful source form updates the existing pointer explicitly before each
format call: `tstr += strlen(tempstr); sprintf(tstr, ...);`, and, where the text
has a placeholder, `tstr -= 3` or `tstr -= 5` before `sprintf`. These are live
pointer computations required to select the output position. Keeping them as
assignments to the original local doubles its allocator ref count without adding
instructions or debug records:

```
[allocno_compare] order:
  3/76:28/76/21/1=14736  1/74:40/168/35/1=11904  2/75:4/10/2/1=8000 ...
[find_reg] allocno 3 pseudo 76 refs 28 live 76 calls 21 -> reg 17 (s1): tstr
[find_reg] allocno 1 pseudo 74 refs 40 live 168 calls 35 -> reg 18 (s2): x
```

This after-fix trace was produced with the instrumented compiler using
`--drop-only GetItemStr,SpawnQuestItem`; the real full-TU `-dg` dump independently
confirms the same allocation order and dispositions. The full gate remains
497/497 instructions with zero diffs.

The stock compiler ICEs on `GetItemStr` and `SpawnQuestItem`. Isolation or
`--drop-only` can bypass those bodies for diagnosis, but always compare the
resulting target's code and pseudo definitions with the **full real gate TU**.
Stock-versus-PsyQ agreement on an isolated input does not by itself establish
agreement with the unmodified full-TU build.

## 7. File inventory

| Path | What |
|---|---|
| `C:/temp/dmt-cc1/gccsrc/gcc-2.7.2/` | stock (uninstrumented) source tree + host fixes |
| `C:/temp/dmt-cc1/gccsrc/gcc-2.7.2-instr/` | same, + `apply_traces_272.py` applied |
| `C:/temp/dmt-cc1/gccbuild-ecoff/cc1.exe`, `cc1plus.exe` | stock build (validation oracle) |
| `C:/temp/dmt-cc1/gccbuild-instr/cc1plus.exe` | instrumented build (use this one for traces) |
| `tools/instr/apply_traces_272.py` | the ported instrumentation patch script |
| `tools/instr/compare_tu.py` | byte-identity validator vs real PsyQ CC1PLPSX |
| `tools/instr/isolate_fn.py` | extracts one function from a TU that ICEs elsewhere |
| `tools/instr/gen_i.py` | produces a `.i` via `tools/build.py`'s own cpp step |
| `tools/instr/real_rtl.py` | extracts a function's authoritative real-compiler RTL in a private output directory |
| `tools/instr/host-fixes-configure.patch`, `host-fixes-obstack.patch` | the two textual diffs vs pristine 2.7.2 |
| `tools/instr/xm-mingw32.h.reference` | the finished host xm file (diff against 2.8.1's for the two additions) |
| `tools/instr/printitempower_trace_example.txt` | full `GCC_TRACE_ALLOC=1` trace for §6 |

## 8. Remaining allocator diagnostics (2026-09-30)

### GetUniqueItem__Fii

The `--drop-only GetItemStr,SpawnQuestItem` input compiles successfully with the
instrumented compiler. Its current trace agrees with the full PsyQ `-dg` dump:

```
allocno 0 / pseudo 72: i    refs 13 / live 120 / calls 7 -> priority 3250 -> s1
allocno 2 / pseudo 74: uid  refs 11 / live 119 / calls 7 -> priority 2773 -> s2
```

Retail requires i in s2 and uid in s1. With other inputs unchanged, uid would
need 13 live references at its current live length (priority 3277), or its live
length would need to fall to 101 or less. These are diagnostic bounds, not a
reason to add redundant operations. The six SaveItemPower calls and all tail
operations must retain their retail order and instructions.

Measured and reverted: making parameter i const leaves 88 diffs / 216
instructions unchanged. Reusing OUid for the new seed's packed uid/count reduces
the function to 214 instructions, removes a required saved-value lifetime, and
regresses to 160 diffs. Do not treat fewer saved registers as an improvement.

### delta_get_item__FPC9TCmdGItemUc

Baseline: 103 diffs, 116 generated instructions versus 115 retail. There are
two distinguishable issues: command value 2 is hoisted into t2, whereas retail
materializes it in v0 inside the matching-record path; Dl is kept in t8 rather
than a0, displacing the record pointer and command-load registers.

Replacing the three early goto exits with ReleaseDLevel(Dl) followed by return
1 moves command 2 into the correct inner branch and preserves all four call
targets, but leaves 117 instructions / 102 diffs: the remaining Dl allocation
introduces two extra argument moves. Flattening the pointer/counter scopes on
top of that form gives 110 diffs / 117 instructions. A command switch regresses
to 116 diffs / 121 instructions; a block-local const command introduces loop
control differences (107 diffs / 118 instructions). These forms were reverted.

The isolated instrumented input emits this target's allocator trace before
ICEing in a later static initializer. Its dispositions agree with the full
PsyQ dump (Dl pseudo 75 -> t8; command pseudo 85 -> a0). A nonzero final compiler
exit must still be reported: a completed target trace is useful diagnostic data,
but does not establish successful compilation of the isolated TU.

### DrawDurThingy__6GPaneliiP10ItemStructi

Before the DurColors matrix reconstruction, the full gpanel.cpp compiled
successfully with both compilers, but comparison
shows a larger transformed-RTL discrepancy than a register permutation. PsyQ
uses an 88-byte frame; stock gcc uses 104 bytes and spills the item pointer.
The real global allocator has 19 allocnos, versus 23 in the instrumented stock
trace. Inspect the real `loop`/`greg` dumps here rather than treating the stock
trace's final registers as the gate compiler's choices.

That real loop dump combined the red-channel address induction variable with
its memory use and retains both the complete red-table pointer and the scalar
Loop*3 offset. Retail instead retains the scalar offset plus a Y-1 row anchor.
That is the source of the saved-register displacement, not a hoisted flip
argument: the real assembly still materializes flip=1 inside the loop.

Measured and reverted: caching Y-1 as a const local grows the frame to 96 bytes
(182 instructions / 153 diffs); a three-byte RGB struct view reduces the frame
to 80 bytes but changes the instruction stream (168 / 101 diffs); a const int
first-colour index gives 181 / 96 diffs, and a const short index gives 183 / 98.
Changing only the switch selector to const unsigned short gives count-exact
179 instructions but 100 diffs and the wrong SYM parameter locations. The
then-committed source remained at 180 instructions / 97 diffs.

The retail SDB global-data record identifies `DurColors` at 0x800B9BCC as a
file-static `unsigned char[6][3]` (18 bytes), not three independent channel
arrays. Restoring that actual declaration and its six RGB rows changes all
three loop loads into destination-address induction variables. The real
`loop` dump now combines them with the scalar Loop*3 offset; it no longer
keeps a complete red-channel pointer. All three direct call sites still
match. The table itself passes `tools/symbol_data_gate.py` against retail,
including its source SDB extent; five negative tests rejected a wrong VA,
wrong extent including padding, missing symbol, zero size, and pointer
relocations. This data-byte receipt does not count as a new function PASS.

After matrix reconstruction: 178/179 instructions, 57 diff lines, an 80-byte frame versus
retail's 88. The unrecorded Y-1 row anchor and initial rectangle scheduling
still differ. Adding an explicit const YBase restores the anchor's register
but introduces an extra REG record/scope and stays nonmatching (180/179,
57 diff lines). Reading row fields back for y2/y3 adds loads (181/179,
86 lines). The earlier setXYWH experiment (177/179, 160 lines) was invalid:
gpanel.cpp did not yet include the macro header, so it compiled as an implicit
function call, not a macro. It was discarded; do not infer macro behavior
from that result. The shared SDK header is now included and implicit checks
use the real source path. A valid experiment chaining y1=y0 gives 179/179
but 62 lines. Those coordinate experiments were
restored; only the SYM-confirmed matrix declaration/initializer was retained.

With psyq.h actually included, a valid setXYWH(Ft4, X+20, Y-2, 4, 25)
for the initial black rectangle fixes its scheduling and reduces the current
source to 49 diff lines (still 178/179 instructions and frame 80 versus 88).
Replacing the inner rectangles with setXYWH as well produces identical code,
so their explicit stores remain. The retained macro passes the real-path
implicit check; GPANEL's 13/13 direct-call audits (including DrawSpeedBar's
28 sites) and its ten existing function passes remain unchanged. The Y-1
anchor still needs a source-level explanation.

### DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct

The former 380-line mismatch contained genuine reconstruction errors, not
just allocation residue. Retail uses a 36-byte POLY_G4; the source used a
POLY_FT4 view with a length written into its code byte and three halfword
colour stores. The actual PsyQ 4.0 LIBGPU.H definition is now shared in
psyq.h, replacing identical local definitions in loading/options/primpool.

Repaired from retail instructions and SYM: four upper/lower colour bounces
(the fourth upper bounce was absent), byte conversion BEFORE halving the
red channels, the primitive's correct vertex rows, and addPrim at
ThisOt[GPanelOt-2]. The original Bx/By bar origin is preserved while X/Y walk
the middle frames and typed PlayerStruct::SpdList[8] items. The background
quad now uses that saved origin, correct top/bottom rows, and a function-scope
Ft4 local matching SYM rather than Ft4b plus unrecorded coordinate locals.

Four single-use const selector snapshots preserve each retail global read
before that vertex's coordinate stores, without extra instructions or SYM
records. Single-use InnerX/InnerY values preserve the corresponding +2
computations. Moving the middle-loop initializations after the first fixed
corner print also reproduces its argument and delay-slot order.

Current: 460/459 instructions, 11 diff lines in the final background quad;
both assemblers fail, so this is NOT a PASS receipt. Parameter/local types,
registers, record order, and nested block offsets now match; the extra final
instruction changes the function length/end offset. The real compiler's
assembly still contains a move from s6 into v1 before the two y stores,
where retail stores directly from s6 and schedules u0 reads around the
x/y stores. Const By, chained y assignments, short/unsigned-short casts,
and const u0 snapshots did not fix this residue and were restored.

The real `lreg` dump narrows the extra-copy cause: insn 1086 sets an HI-mode
pseudo from the low half of By (SI pseudo 80), carrying REG_EQUIV to the
primitive's y1 memory at +18. Its subsequent allocation/reload produces the
extra move. Diagnose this real-compiler equivalence before treating the
residue as an assembler issue or adding source operations to influence it.

The progress parser formerly displayed its regex's oracle count as 'ours'.
status.py now reports the actual source count (covered by parser regression
tests); this corrects diagnostics, not any PASS verdict.

### BL_AsyncReadFile__FPcUl

Baseline is 88/88 instructions with four scheduling diff lines: ours puts
the status-result copy before `TSK_Sleep` and its constant argument in the
delay slot; retail puts the argument first and the result copy in the slot.
The real `sched2`/`dbr` dumps expose the affected result-copy, argument-set,
and call instructions rather than relying on inferred source order.

Measured and restored: a loop-local `const int status`, assigned to `MemSize`
after sleeping, gives exact bytes but an extra empty SYM scope at +0xe4.
A function-scope mutable status gives exact bytes but an extra REG record.
Putting the sleep in the loop condition's comma expression keeps the original
four diffs and exact SYM. A function-scope const status in a label/goto loop
has 88 instructions without the empty scope, but changes Name/MyHnd/ah
allocation (32 diff lines); adding const to Name does not fix it.

The isolated stock/instrumented compiler initially ICEs on the unused
`int strlen(const char *)` declaration, even after function-body isolation.
Removing that declaration only from the diagnostic input allows a successful
trace. For the goto experiment its allocation agrees with the full real
compiler dump: MemSize pseudo 74 -> s0, MyHnd 75 -> s1, Name 72 -> s2,
and ah 77 -> s2. This diagnostic-only prototype removal is not a gate or
source change. No source experiment above was retained or marked PASS.

### GLUE_StartGameExit__Fv

The old byte-array declaration `extern unsigned char plr[]` and a descending
byte-offset loop gave exact bytes but retained an extra `i` debug record.
Casting that array to `PlayerStruct *` and using a two-player ascending loop
does not solve it: the real `loop` dump reverses the loop but says
`Cannot eliminate biv 72: biv used in insn 101`; it retains both a source
counter and a complete pointer (12 byte-diff lines, wrong `i` record).

Declaring the actual `extern PlayerStruct plr[2]`, then using
`for (i = 0; i < 2; i++) plr[i].plractive = 0`, fixes the source representation.
The real compiler now recognizes a destination-address induction variable
`6632*i + (plr+29)`, combines it with the scalar offset, reverses the loop,
and reports `biv 72 was eliminated`. This reproduces retail's 27 instructions
and removes the extra record. Both byte lanes, exact SYM and all seven calls
pass; the other 26 already-passing GLUE entries remain passing.

Use actual array/field declarations before diagnosing a loop from casts on
opaque byte buffers. Identical layouts and addresses do not imply identical
front-end trees or induction-variable transformations.

Nothing under `C:/temp/dmt-cc1/` is committed (outside the repo entirely,
per the task's rules); everything under `tools/instr/` is small text and
safe to commit if the user wants the diagnostic lane kept.
