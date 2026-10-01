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

The supported dumps are `loop`, `greg`, `lreg`, `flow`, `cse`, `cse2`, `combine`,
`sched`, `sched2`, and `dbr`. CSE (`-ds`), post-loop CSE (`-dt`), and combine
(`-dc`) expose earlier expression/narrowing transformations. The last three
expose pre-allocation scheduling (`-dS`), post-allocation
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

Use `--output-path-only` to retain/validate a stage without printing its large
RTL body. It still rejects an absent or ambiguous function; it is not a bypass.
This also avoids broken-pipe errors from truncating output with Select-Object.

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

The real `lreg` dump identifies insn 1086 setting HI pseudo 350 from the low
half of By (SI pseudo 80), carrying REG_EQUIV to y1 memory at +18. Earlier
`cse`, `cse2`, and `combine` dumps now prove that the same copy already exists
without REG_EQUIV: allocation/reload preserves it rather than introducing it.
The next investigation must address expression expansion or early elimination,
not allocator priority. Reversing coordinate order only reverses stores;
a const short Top and a comma expression grouping y stores with u1 retain the
same extra copy. All three new source tests were restored.

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

### ProcessItems__Fv: current frame-snapshot source

The isolated instrumented lane compiles successfully. Its global allocation
trace gives `ii` (pseudo 73) 27 references / 82 live instructions / two crossed
calls, priority 13170, selecting s1. The frame snapshot (196) has 4 / 11 / one
call, priority 7272, selecting s2; loop index i (72) has 18 / 102 / two calls,
priority 7058, selecting s3. The full real compiler's greg dump independently
agrees on these three register assignments. Retail instead keeps ii in a1,
the frame in s1, and the item offset in s2. Thus ii's unnecessary call-crossing
lifetime is a concrete source-expression/CSE target, not an arbitrary register
swap to force with source annotations.

`compare_tu.py build/processitems_current_diag.cpp` also identifies a bounded
SN/FSF difference: stock hoists the SinTab address into s6 across the loop,
where real PsyQ retains symbolic loads. Stock saves eight registers versus
real's seven (both frames are 56 bytes). Do not copy that extra allocation
into the reconstruction. The diagnostic artifacts are
`build/processitems_current_diag.{cpp,i,s,trace}`; full real RTL was captured
with `real_rtl.py recon/source/items.cpp ProcessItems --dump greg`.

### M_ChangeLightOffset__Fi: SYM-only register mismatch

The full board refresh still gives bytes PASS but reports ly in a2 instead of
retail a0. The retail y2/oy/ly records all name a0, while the final shifted and
combined Y argument is physically built in a2. Experiments in the ignored
full-TU copy `build/monster_light_diag.cpp` did not solve this: splitting the
final ly assignment into copy/shift/add gives 26 byte diffs; assigning ly=y2
and doing the final calculation in the call gives 14 diffs and eliminates the
ly record; assigning only the shift to ly gives six diffs but still records a2;
computing the early division in ly before copying to y2 gives 79 diffs and three
extra instructions. None was applied to the reconstruction. Full real greg
evidence is available with `real_rtl.py recon/source/monster.cpp M_ChangeLightOffset`.
The PC gold twin uses a different lighting-offset algorithm, so it does not
justify replacing the PSX arithmetic to fix this debug-only mismatch.

### GetUniqueItem__Fii: measured i/uid allocation swap

The isolated `build/getunique_diag.cpp` baseline is assembly-identical between
stock and real PsyQ (`compare_tu.py`), making this a validated trace case.
The instrumented global allocator gives i (pseudo 72) 13 references / 120 live
instructions / seven calls, priority 3250 -> s1; uid (74) has 11 / 119 / seven,
priority 2773 -> s2. Retail uses i=s2 and uid=s1. Both bodies have 216 instructions;
the current 88 diff lines are dominated by this swap. The full real greg dump
was also captured with `real_rtl.py recon/source/items.cpp GetUniqueItem`.

Measured source forms in the ignored diagnostic copy did not alter the mismatch:
explicit flag addition versus ++, two successive seed |= operations versus one
grouped OR, and an unsigned-byte cast versus the uid mask all retain 88 diffs.
No reconstruction change was retained. At unchanged reference counts uid would
need a live range of at most 101 instructions to outrank i; reducing i to eleven
references would also reverse their priority. These are diagnostic bounds, not
permission to add fake uses, guards, or register pins. The next change must be
supported by the original data flow and must still pass the real byte/SYM gates.

### delta_get_item__FPC9TCmdGItemUc: scope/control-flow probes

Revalidated baseline: 103 diff lines, 116 source instructions versus 115 retail.
Retail SYM has function-scope Dl/pD/i and no bc record; the current source has
two scoped pointer/index walks and a bc snapshot. Merely restoring the gold
twin's field-by-field conditions with shared function-scope pD/i gives 115
diffs (116 instructions), not a fix. A switch gives 126 diffs / 121 instructions;
natural ReleaseDLevel-and-return arms give 110 / 117. All were restored, and
the original 103-diff baseline was rechecked. The data layouts still agree
with the retail loads (TCmdGItem 32 bytes; TCmdPItem 24 bytes). Retail loads
all twelve incoming item fields before destination writes, and has a different
Dl/pD allocation at the first cache acquisition; scope cleanup alone does not
explain these differences. No new PASS is claimed.

### set_mdec_audio_volume: static-record membership probes

In ignored full-TU copy `build/fmv_static_diag.cpp`, moving voice_attr to file
scope keeps all 51 instructions but removes its function record, so it is not
a solution. Restoring function scope with explicit `{0}` initialization also
keeps the bytes but retains `vol { voice_attr i }`, whereas retail has
`vol voice_attr { i }`. Neither experiment was applied to the reconstruction.
The generated real-compiler `.g.s` places `.begin` before the STAT `.def`, so
the mismatch exists before ASPSX/PSYLINK; it is not introduced by symlane's
comparison parser. The stock GCC 2.7.2 `sdbout_begin_block` implementation
likewise emits PUT_SDB_BLOCK_START before walking the outer block's declarations.
Changing parser membership or moving a file-global record into the function
would hide this mismatch rather than reconstruct it.

Further delta_get_item check: explicit const snapshots of its twelve incoming
fields give 114 diffs / 117 instructions; combining snapshots with root-scope
pD/i gives 126 / 117 and adds twelve REG records plus nested scopes. More
importantly, inspection of the unchanged baseline's generated assembly shows
it already loads all twelve fields before any destination write. Thus the
snapshot idea is not a semantic repair and should not be pursued. All trials
remain only in `build/msg_snapshot_diag.cpp`; live msg.cpp is unchanged.

### Era-supported function section placement

Real CC1PLPSX rejects `-ffunction-sections` (exit 33, invalid option), but accepts
an explicit declaration attribute such as
`__attribute__((section(".text.FindGetItem")))`. The diagnostic full-source copy
`build/coreinv_section_diag.cpp` adds only that prototype attribute. Both
`verify_asm.py` (45 instructions) and `symlane.py` (exact records) pass for
FindGetItem__FiUsi, using the unchanged real compiler flags and ASPSX pipeline.
The compiler itself emits the named section; no assembly/object editing is
involved. This is a possible path to ordered source-function placement, not an
implemented partial-TU linker: duplicate unselected definitions, runtime data,
and internal references still need an explicit design and whole-image checks.
No attribute or new flag was applied to the live reconstruction or normal build.
An Objects full-TU diagnostic attributes InitObjectGFX and FreeObjectGFX to two
different named sections. It exposed a verifier bug: section-relative offset
zero was alias-resolved to an unrelated function in default .text. Alias lookup
now uses (section, offset), and body extraction stops at section boundaries.
Both diagnostic functions pass the unchanged byte comparison (135 and three
instructions) and exact SYM. Regression tests cover equal offsets in different
sections, same-section aliases, and undefined/common/data symbols. Embedded
tables in named sections remain explicitly unsupported rather than borrowing
the default-.text table matcher. No section attributes were applied to Objects'
live source. Its small-data mismatch is now repaired
in the live source: initialized numobjfiles=0 and myscale=512 precede the `%s`
literal; tentative LONG numobjects and UCHAR InitObjFlag follow it. Retail SYM
confirms numobjects is LONG, not the old INT declaration. All four source symbol
offsets now imply base 0x8011B9C0. The 17 emitted bytes equal retail, followed by
three zero alignment bytes; all 96 byte/SYM gates and call audits remain passing.
Objects' complete definitions have now been reordered to their retail sequence,
with ten unique numeric macro definitions moved above the functions. Function
bodies were preserved. All 96 emitted offsets and SYM records now match retail;
94 pass maspsx directly, and OperateBook/OperateShrine pass their already
registered real-ASPSX lane. The ignored reorder probe initially used an
unsupported diagnostic filename/address-selector combination and found no
oracles; the final tests used `build/order_probe/objects.cpp` with the correct
Objects oracle selection, then rechecked the live TU at 96/96. Those two
assembler differences rule out the GNU-emulated object as a final input;
the native-source route below preserves the authoritative assembler instead.
An actual GNU linker probe in `build/section_probe*` confirms that a duplicate
definition still fails even when its section is explicitly discarded. Thus
partial-TU linking cannot safely rely on /DISCARD/ alone or relax duplicate checks.
SPELLS was instead integrated as a complete passing TU: all six emitted offsets
already agree with retail, and splitting its read-only fragment at the exact
jump-table boundary permits its full source-emitted table to replace the old
table while retaining the unused header-literal prefix. All five images match.

### Objects: full native relocation probe

The reordered live TU has now been compiled and assembled intact by real PsyQ,
then PSYLINKed with 136 unique external addresses from the retail symbol maps.
The complete `.rdata` (3,164 bytes) and `.sdata` payload (17 bytes) match retail
at 0x80116AE0 and 0x8011B9C0. An isolated `.sdata` group leaves 46 internal
GP-relative words short by 0x1240 (the distance from retail GP 0x8011A780 to
this TU's data base). Defining `_gp` alone does not change those section-relative
patch expressions. Correct group placement is still required; no words are patched.

This probe also exposed wrong data-reference addends hidden by normalized gates.
They are repaired in source: both PostAddObject door branches set _oAnimFrame,
not _oSelFlag (their stores tail-merge); OperateSChambBk updates Q_BONE=14 rather
than quest 13; OperateGoatShrine sets _oAnimDelay rather than _oAnimCnt (also
confirmed by the gold PC twin); GetObjectStr tests _oTrapFlag rather than
_oDoorFlag. All 96 byte/SYM gates remain passing and the affected call audits
pass. Repeating the full native probe leaves only the 46 uniform GP-base
differences; all eight non-GP relocated-word differences are gone. Artifacts:
`build/sdk/native/probe_source_objects.*`. This is not yet a final-image receipt.

The GP group issue is now resolved in a native probe. ORG/OBJ changes alone do
not work: group OBJ changes absolute symbols but leaves section-relative GP
offsets unchanged, while trying to redeclare section ORG conflicts. Supplying
the existing 4,672-byte retail small-data prefix as an explicit data-only
scaffold object before the untouched compiled Objects object makes its section
offset 0x1240, with the group beginning at retail GP. ASPSX input requires CRLF.
`probe_gp_prefix.cpe` then matches all 52,128 text bytes, all 3,164 read-only
bytes, and the entire small-data prefix plus 17 source bytes, with zero differing
bytes. The native map places numobjfiles/numobjects/InitObjFlag at the correct
absolute addresses, and all 96 native SYM records match at their retail VAs.
The prefix is not reconstructed source and must not be counted as such. No
compiler instruction, object, or relocation was patched. Final-image wiring
is now implemented. The probe is reproduced by `tools/native_recon.py` and
`configs/native_recon_link.json`, with exact byte/SYM checks and separate hashes
for source payloads and the data-only GP scaffold prefix. Final-image wrappers
import only the source payloads, preserve all original scaffold symbols, and
leave the prefix and unrelated data in place. All five images match retail.

### MSG pair resolved

DeltaAddItem's second scan now resets pD from OpD and walks pD, preserving the
saved base as in the retail registers and gold PC pointer-reuse pattern. Its
successful fill releases Dl and returns directly rather than breaking to a
shared footer. This removes loop-hoisted constants and yields all 138 retail
instructions and exact SYM. All fifteen item-field relocation addends were
checked against the oracle, not just normalized away.

Applying the same natural release-and-return structure to both delta_get_item
scans, with root-scope Dl/pD/i and no bc snapshot or goto label, yields all 115
retail instructions and exact SYM. The earlier return probe changed only the
first scan, so it missed the second scan's effect on loop lowering. Explicit
copy snapshots are still unnecessary. Both functions pass real ASPSX and
their strict call audits; the live MSG TU is now 111/111 PASS.

### ProcessItems follow-up and MemcardPad control-flow repair

Further ProcessItems diagnostic copies do not justify changing live source:
const-qualified array views give 115 differences / 192 instructions; a mixed
array/pointer form gives 75 / 172, and a C++ reference gives the same result.
Moving pointer creation after the increment gives 61 / 178; splitting indexed
read from pointer write gives 57 / 174. None eliminates ii's call-crossing
lifetime. Taking the frame directly from preincrement gives 110 / 189. These
remain ignored diagnostics, not new passes or approved source replacements.

MemcardPad's retail control flow exposes real errors in the earlier draft:
lcs must preserve the pre-movement selection; the inner missing-text scan uses
NoEntries without subtracting one; cancelling stores the last-entry selection
before reading its link; move is cleared before test_card_format; the file-menu
range test is unsigned; and the loading box runs when saveflag >= 3. The reset
of saveflag belongs inside the unusable-card branch, not after all card-status
branches. Error sounds now follow their AlertTxt assignments in their natural
branches; the compiler merges the store/call tails into the two retail sites,
instead of a single manually shared call. All 33 call sites match in order.

The live function improves from 124 differences / 577 instructions to eight
differences / 583 versus retail 585. The remaining instruction mismatch is the
save_blocks reload in the game-save case: ours folds the argument to 10, while
retail reloads the global. SYM still fails on length, and real ASPSX also fails;
this is not a PASS. All 33 previously passing Options entries remain passing.
Real CSE evidence is under build/rtl/options-d0dnbvwe/input.i.cse.
The full reconstructed-TU call-audit rescan now passes 2725/2725 real functions,
with no pending call-audit entries. A diagnostic const-qualified view of
save_blocks leaves the remaining eight differences unchanged; it was not applied.

### DRLG_L5TransFix: isolate the hoisted-seven difference

The live real-compiler baseline is 357 diff lines, 270 instructions versus
retail 273. A diagnostic comparison that erases general-purpose register names
for alignment (not a gate) reduces the differing instruction shapes to the
prologue/save placement and constant-7 materialization near the final tile
tests. Ours hoists 7 into s2; retail materializes it near the comparisons.
The resulting register-pressure change explains much of the large raw diff.
This is not evidence of byte equivalence, and no normalization was added to
the verifier.

The real loop dump at build/rtl/drlg_l1-gkbcl9qh/input.i.loop gives the relevant
decision directly: inner-loop insn 845 / pseudo 488 has life 3 and move-insn
savings 3, moving to 1190. The outer loop then moves 1190 to 1301, where the
value is constant 7. The real greg dump is retained under
build/rtl/drlg_l1-uf2_6qut/input.i.greg. Flattening the nested v==6 and v==23
condition pairs into separate conjunctions produces identical mismatch counts;
that diagnostic was not applied to live source.

The 9cc6504 compare_tu tool on build/transfix_probe/isolated.cpp reveals a much
larger stock/SN divergence here: stock uses a 48-byte frame and nine saved
registers, versus real PsyQ's 24-byte frame and six saved registers. Do not use
stock allocator choices to prescribe this function's register mapping. The
gold PC twin supports the first five tile repairs; the later repairs are PSX
extensions and must continue to follow the retail oracle.

MemcardPad's remaining save_blocks reload is already folded to constant 10 in
the real early-CSE dump (insn 713 after the store at 700), not introduced by
register allocation. Its ten-entry retail switch table has no alternate entry
between that store and the call, ruling out a simple shared-case entry there.
Neither investigation changed live source or the PASS count.

### PrintCDWaitTask address formation and SPLTARGT integration

PrintCDWaitTask still differs by 17 lines (76 instructions versus retail 79).
Retail preserves plr+0x1D in s3 and loads the second player's active flag at
offset 6632; our real loop RTL already combines that address to plr+6661,
leaving no address pseudo for loop-invariant motion. A const player pointer
and an incomplete external array declaration change nothing. A root-scope
named second-player index instead hoists offset 6632 and gives 33 differences;
moving that index into the conditional returns to the baseline. No diagnostic
was applied to live source. The real loop dump is retained at
build/rtl/stream-5pfu8g8z/input.i.loop.

SPLTARGT now replaces its complete text scaffold and the 48-byte
AutoTargetSpells data scaffold in the final image. Moving SpellTarget::Active's
inline definition after the dependent type declarations restores the retail
order of its three header methods without changing their bodies. All 17
byte/SYM receipts and all call audits pass, the array passes symbol_data_gate,
and the complete main image remains byte-identical with zero-filled BSS.
CanTalkToMonst is explicitly bound to the unique game-overlay symbol. Source
integration now covers 215 functions across 33 TUs; this does not increase the
2684/2727 byte/SYM board or imply the remaining scaffolds are reconstructed.

### PREQUEST native placement preflight: missing header pool affects table alignment

A native whole-TU placement probe links PREQUEST text at 0x8015E7DC (3220
bytes) and its current read-only section at 0x80119B3C. All nine native SYM
records match at their retail addresses. The linked text nevertheless has one
wrong byte, at text offset 2940: the jump-table address is four bytes late.
This is not a final-image pass and has not been added to the native registry.

Retail's pool starts at 0x80119B18 with the unused gman.h and cplayer.h strings
(36 bytes), then the five quest filenames. Current source begins with those
filenames and emits 108 bytes, but only 104 retail bytes remain from 0x80119B3C
to the next TU. The compiler's .align 3 before the nine-entry table inserts
four bytes relative to the shortened section; retail's table is at 0x80119B80.
The strict CPE bounds check correctly rejected the initial 104-byte region.
An explicitly diagnostic 108-byte region showed 22 differing data bytes and
four bytes extending into the next TU. Artifacts are
build/native_source/prequest_probe.{obj,lnk,map,cpe,sym}.

Restoring the original header-owned constant pool, not trimming or patching
the compiled section, was required before integration. The existing real
TextDat::DumpDatFile definition in psxsrc/gman.h accounts for its filename;
the skeleton CPLAYER.H likewise contains a header assertion at line 0x41.
Overlay integration also needs explicit ownership for text in PREGAME and
read-only data in the main image; the current native-source route intentionally
still rejects non-main TUs. Neither limitation was bypassed in this probe.

The pool defect is now repaired in live source. PREQUEST includes
source/gen/header_methods_prequest.h, containing the SYM-layout TextDat and
CPlayer types and their original DumpDatFile/GetPlayer inline bodies. The
aggregate reconstructed gman.h was first tested but also emitted unrelated
PRIMPOOL and FILEIO constants, so its over-broad dependencies were not added.
The focused original header definitions emit exactly the missing filename
literals, without emitting extra function bodies or synthetic padding arrays.

Replaying the native probe with live recon/source/prequest.cpp, .text at
0x8015E7DC/3220 and .rdata at 0x80119B18/140 now matches every byte in both
retail images, including all nine relocated jump-table entries. All nine
native SYM records match at retail addresses; the normal byte/SYM and strict
call audits also remain 9/9. The unused PActiveArray external declaration has
no emitted relocation and requires no invented binding.

PREQUEST is now integrated. Native source placement supports an explicit text
home and a distinct main-image data home, with section extents checked against
the named YAML fragments and overlapping payloads rejected. Optional small
data retains the existing verified GP-prefix mechanism; PREQUEST needs none.
The label-preserving data wrapper uses the YAML-proven terminal boundary to
replace a complete final string/table object, without emitting its internal
parser sentinel or modifying the oracle scaffold. Both main and standalone
PREGAME links rebuild/verify the native source payloads before consumption.
The complete five-image link passes; 81 unit tests pass, including wrong-image,
extent, and final-string-object boundary checks. Source-linked coverage is now
224 functions across 34 TUs at that checkpoint, while the byte/SYM board
remains 2684/2727.

### PREOBJ integrated through the cross-image native route

PREOBJ now includes the same original TextDat header type and DumpDatFile
inline, extracted to psxsrc/textdat_header.h and shared with PREQUEST. This
restores its 16-byte unused GMAN filename prefix through normal compilation.
All 16,132 text bytes at 0x80155FD8 and all 484 read-only bytes at 0x801197AC
match retail after native relocation, including dispatch tables. All 61 native
SYM records match at their original addresses; both PREOBJ and PREQUEST retain
their 61/61 and 9/9 standard byte/SYM receipts. PREOBJ's strict call audit is
also 61/61. No generated instruction or source payload was patched.

The native registry now supplies PREOBJ's text to PREGAME and its full pool to
the main image. All five complete images remain byte-identical, and all 81
tests pass. Source-linked coverage is 285 functions across 35 TUs: 119 through
the conventional route and 166 through native source linking. The 2684/2727
board is unchanged; final integration of the remaining TUs is still required.

### PREMON source and relocation repair

Native placement exposed bugs masked by instruction relocation normalization:
five level paths used unrecognized single-backslash C escapes, so the compiler
removed the separators. They now use proper escaped backslashes. PlaceGroup's
debug call also incorrectly passed the GMAN filename as its message and the
warning as its filename; retail passes the warning followed by source/PREMON.cpp.
The original TextDat header restores the genuinely separate unused GMAN literal.

All 19 complete source definitions now follow retail address order. This also
restores filename-pool order, placing the quest paths before the four Diablo
map names. The unchanged compiler/ASPSX/PSYLINK then reproduces all 10,484 text
bytes at 0x8015F6E8 and all 286 pool bytes at 0x80119C00 exactly. All 19 native
SYM records, normal byte/SYM checks, and strict call audits pass.

The two bytes after the source pool are retail padding (0x68,0x00), not source
payload. A separate scaffold copy splits the last raw word into two equivalent
halfwords and labels the boundary. The existing bounded data bridge imports
the final two source-string bytes and preserves the following padding. The
original full scaffold remains unchanged; no code or compiled bytes are patched.
PREMON is selected by the native cross-image route, raising source-linked
coverage to 304 functions across 36 TUs (119 conventional and 185 native).
All five final images match retail. All 82 unit tests pass, including a new
regression check that the final source halfword does not consume nonzero padding.

### CDIO escape repair and reconstruction-wide literal scan

Following PREMON's path defects, a token-aware scan found one remaining unknown
escape in the reconstructed tree: CD_GetCdlFILE used backslash-percent instead
of a doubled C backslash. It compiled to a search format missing the leading
separator. The corrected six-byte .sdata payload is exactly 5c25733b3100,
matching retail at 0x8011AB4C. CDIO's 9/9 byte/SYM and 9/9 call checks remain
passing; its final-image integration is still pending.

tools/check_c_escapes.py now scans C/C++ literals while excluding comments and
consuming escaped backslashes in pairs. Tests cover invalid path/format
escapes, valid doubled separators, comments, character literals, and escaped
newlines. The current scan checks 329 files with no unknown escapes; all 86
unit tests pass. This is not a substitute for exact constant-pool checks:
valid-looking but incorrect strings and wrong argument order still require
retail relocation/data verification. No additional board PASS is claimed.

### DEAD initialized data and native linkage

DEAD's dead[31] array is now defined with its retail zero initializer rather
than left external to the TU. Its 372 bytes belong to initialized .data at
0x800CEB10, not BSS. Native source placement now accepts a bounded .data section
in a declared main-image data scaffold, in addition to read-only/small data.
The two functions, complete array, and spurtndx/stonendx counters at 0x8011B770
all match retail after native relocation. The three global data SYM records
and native map addresses match exactly; both function SYM records and calls
also pass. Data and code are imported without compiler-output modifications.
Source-linked coverage rises to 306 functions across 37 TUs (119 conventional,
187 native); the board remains 2684/2727. A new test rejects placing initialized
data in a read-only scaffold, bringing the passing test count to 87.

The FMV initializer's reverse chained assignment probe still yields the same
13-instruction, two-line mismatch (zero versus a2 for the i initializer).
Real early CSE already folds both initializers to zero. The diagnostic remains
under build/fmv_init_probe; no FMV source change was applied.

### GENDUNG small-data ownership and cross-image integration

The GENDUNG source had only the small globals used directly by its functions,
so their section offsets could not reproduce the original TU. The full retail
SYM inventory identifies 30 globals in the contiguous 108-byte group at
0x8011C0E4. Their exact types and zero initialization are now declared in retail
order, including the UCHAR setloadflag/setlvltype fields and their natural
alignment. These are real globals also supported by the gold GENDUNG source,
not padding variables. The shared original TextDat header restores the GMAN
filename prefix in its 164-byte constant pool.

Native linking now verifies all 7,472 code bytes, all 164 read-only bytes, all
108 small-data bytes, all 16 function SYM records, and all 30 global records and
addresses. Standard byte/SYM and strict call audits remain 16/16. GENDUNG is
selected for PREGAME text and main-image data. The 6,500-byte GP positioning
prefix is still scaffold and is not counted as source data. Likewise, the
large dungeon arrays remain external scaffold data. Source-linked coverage
is now 322 functions across 38 TUs (119 conventional plus 203 native); the
function PASS board remains 2684/2727.

### GENDUNG full initialized data restored

The following data-ownership pass restores the remaining 124,516-byte
.GENDUNG_data section. Every retail byte in that section is zero, but the
source uses its 13 named typed definitions, not an opaque zero blob: dungeon,
pdungeon, the four 2049-byte tile-property tables, ScrollInfo, TransList,
dung_map, three 56x56 map-colour arrays, and nSxy. Types, dimensions, and
addresses come from retail SYM; the original GENDUNG source confirms the
ownership of the PC counterparts. The PSX map-cell and colour arrays retain
their actual retail types and dimensions.

All initialized bytes and natural alignment match through unmodified native
compilation/linking. Native verification checks all 43 named data-symbol SYM
records and map addresses, plus all 16 function records and relocated code.
The original data scaffold remains intact but is no longer selected in the
final image. This advances data reconstruction without changing the function
board or the 322-function source-linked count. The GP carrier prefix remains
scaffold and is never counted as source data.

### THEMES code, placement tables, and small-data group integrated

The original PC ThemeGood/trm5x/trm5y/trm3x/trm3y initializers and PSX-sized
theme[50] now define the complete 688-byte retail data group at 0x80102728.
The original TextDat header restores its GMAN filename literal. Small globals
and ThemeGoodIn are defined in retail order after the function-local constant
templates, with declarations retained in the generated extern header. This
reproduces the 84-byte small-data group at 0x8011C15C without inserted fillers.

Native verification matches all 11,120 relocated code bytes, the 212-byte
read-only section and its jump tables, both data groups, all 31 function SYM
records, and all 21 named data records/addresses. Standard byte/SYM and strict
call audits remain 31/31. THEMES is selected for PREGAME code and main-image
data, raising source-linked coverage to 353 functions across 39 TUs (119
conventional and 234 native). The 6,620-byte GP carrier prefix remains scaffold;
the byte/SYM board remains 2684/2727.

### read_card_directory: front-end Boolean materialization isolated

The live baseline remains 152 instructions versus retail 151: the second
fh==-1 check uses nor/beqz instead of beq against the already-held -1. Both
an explicit early-error goto and the natural guarded read/convert/close block
produce 149 instructions, remove the second handle check, and swap fh/r's
saved registers (14 diff lines). Inverting the compound Boolean condition or
moving the equality outside the comma expression retains the original three
diff lines. None was applied to live source.

real_rtl.py now exposes the real compiler's earliest -dr/.rtl dump via
--dump rtl. In build/rtl/memcard-xfk5pbu6/input.i.rtl, the first check is a
direct eq branch, but the check after close is already xor(fh,-1) followed by
Boolean materialization. The CSE dump at memcard-t8qpi1_6 changes that xor to
not(fh); allocation is not the origin of the extra instruction. Future work
must recover a control-flow expression that retains the second direct check,
not force a saved-register choice or alter the verifier.

### GARYL native linkage and memory-card follow-up

GARYL's complete 128-byte code section and four-byte LastAddr small-data object
are now source-linked. Native relocation checks the MemCb callback address,
all three function SYM records, and LastAddr's ULONG type/address. The standard
byte/SYM and strict call audits remain 3/3. Source-linked coverage is 356
functions across 40 TUs (119 conventional and 237 native); the GP prefix is
still scaffold data, not part of the source-owned payload.

Two further read_card_directory diagnostics were rejected. Moving both error
checks into the trailing comma operand gives the same 149-instruction form
with the second handle check removed and fh/r swapped. Initializing r=-1
before a guarded read gives 148 instructions, 73 diff lines, and a 144-byte
frame instead of retail's 152. Neither changed live source or the PASS board.

### CURSOR source-linked with its complete owned globals

The unmodified CURSOR source now supplies all 1,620 code bytes and its 66-byte
small-data group at 0x8011B72C. Full native relocation matches every retail
instruction, including external array references. All nine function SYM records
and all 15 named global records/addresses match, as do the standard byte/SYM
and call audits. The byte-sized per-player arrays retain their true two-byte
extents and natural internal alignment; the final two retail padding bytes
remain scaffold, not part of the source payload.

The native registry selects CURSOR for the final main image. Source-linked
coverage is 365 functions across 41 TUs (119 conventional and 246 native),
without changing the 2684/2727 PASS board or counting the GP prefix as source.

### DRLG_L3 named table reconstruction; overlay layout still pending

Restored 36 named cave-generation tables (708 payload bytes) in
source/gen/tables_drlg_l3.h from the PC source twin. Every initializer was
checked against the appropriate main/PREGAME retail address before addition,
then every emitted object-symbol payload was checked independently afterward,
including rejection of overlapping relocations. The existing unsigned-char
interfaces are retained. Standard byte/SYM and call checks remain 37/37;
all 87 unit tests pass.

DRLG_L3 cannot yet be selected by the current native registry: its original
PREGAME contribution begins at 0x801486A4 with local constant tables, then named
tables and lockout at 0x80148958, before function text at 0x80148F98. Other small
tables live in main-image small data. The current native data route deliberately
accepts main-image data only. Source pools and owned globals must first be
reassembled and verified against that layout, then overlay-data placement can
be added with bounds checks. No .text/.data section patch or relocation masking
was used, and no source-linked function increase is claimed yet.

### DRLG_L3 full native preflight and a masked dungeon-boundary bug

Restored the original TextDat header literal and corrected abyssx/lavapool to
file-static storage in their retail order: SYM names them STAT INT/UCHAR at
0x8011C8E0/0x8011C8E4, not exported small-data globals. Native .sbss reserves
eight bytes (five payload bytes plus alignment). Standard function checks
remain 37/37.

Full relocation then exposed a genuine MakeMegas bug masked by normalized
relocations: the source wrote dungeon[46][j], but the retail addend is 0xEA0,
or column 39 at the 96-byte stride. The gold source uses MDMAXX-1. The live
source now uses DMAXX-1, with all function and call audits still 37/37.

The other eight mismatching words differed only by the common GP origin delta
0x176C. Supplying the existing 5,996-byte small-data prefix through the normal
data-only carrier fixes these, including .sbss references, without changing
the compiled object. The resulting drlg_l3_gp_probe matches .text (18,528),
.rdata (63), .data (2,228), .sdata (prefix plus 128 source bytes), and .sbss (8)
exactly. All 37 native function SYM records plus lockout, lockoutcnt, abyssx,
and lavapool records match. Data homes are PREGAME for .rdata/.data and main
for small data/BSS. Final registry wiring still requires bounded overlay-data
and BSS support; no increase in source-linked coverage is claimed yet.

The probe also exposed a build-path collision when a GP carrier object shared
the native output object's basename. native_link now rejects that alias before
writing either object, with a regression test that verifies the carrier is
preserved. The working probe uses drlg_l3_gp_carrier.obj as its separate input.

### DRLG_L3 final-image wiring completed

The native route now supports initialized data in its declared overlay and
bounded main-image .sbss. Section ownership is checked against the selected
image's YAML fragments; native and SDK BSS allocations must not overlap.
Native BSS bytes must be zero, and static global types/addresses remain subject
to exact SYM comparison. Generated .sbss storage is placed with linker extent
assertions, not absorbed into an unvalidated zero tail.

DRLG_L3's original split overlay scaffolds are preserved. New combined copies
group the local constant pool and initialized tables/lockout at the compiler's
section boundaries. Full linking caught explicit padding outside labels and
nine missing end labels in the old split files: the new copies give padding
its own labels and close each table label, without changing any bytes. The
wrapper generator now rejects unclosed/mismatched labels. This prevents an
unrecognized table from being included twice by an oversized preceding import.

The registry selects DRLG_L3's 37 functions, 63 read-only bytes (with the last
padding byte preserved), 2,228 initialized overlay bytes, 128 small-data bytes,
and eight .sbss bytes. All native byte/SYM checks pass and PREGAME links exactly.
Source-linked coverage is now 402 functions across 42 TUs: 119 conventional
and 283 native. The function board remains 2684/2727, and the GP positioning
prefix is still scaffold, not counted as source data.
The final five-image rebuild is byte-identical; all 92 tests pass, including
overlay ownership, BSS overlap, padding, and label-boundary regression cases.

### Fixed low-RAM pseudo-labels are compared as literal bits

A full board refresh before this change confirmed 2684/2727. Examining BLOCK
showed that spimdisasm's D_8000001E-style labels are fixed cached-pointer field
anchors, not loaded-image data symbols. The verifier had replaced their low
immediates with zero while preserving our compiler's actual field offsets.
The literal classifier now treats synthetic low-RAM anchors below 0x80010000
as constants, including explicit +/- addends. Genuine loaded-image symbols
retain the existing relocation handling. This preserves additional exact
bits rather than ignoring differences or changing compiler output.

Tests cover classification, addends, genuine image symbols, and the actual
instruction normalizer, including rejection of a changed field offset. All
96 unit tests pass. PrintMissiles now passes the standard gate at 126 insns,
as well as real ASPSX and exact SYM; its no-longer-needed assembler exception
was removed. PrintObjects/PrintMonsters/PrintItems remain nonmatching, now
reported at 167/275/403 diff lines respectively. The native link pipeline
already compares full bytes and is unchanged by this diagnostic correction.

A separate PrintObjects scratch-cache pointer experiment gives 277 insns and
a 160-byte frame versus retail 279/168, so it was not applied. The completed
full post-change regression scan confirms 2684/2727 with no lost passes; the
board is refreshed and PrintMissiles no longer needs the ASPSX-only marker.

### PrintObjects: scratch-cache induction variable isolated

With literal-field normalization corrected, the live baseline is 280 versus
279 instructions. Ignoring register spelling only for diagnostic alignment
leaves the scratch-cache base adjustment plus call-argument scheduling: ours
initializes the loop pointer to 0x1F800004 and loads at offset zero; retail
uses 0x1F800000 and loads at offset four. This diagnostic never changes gates.

The real loop dump at build/rtl/block-eotc9una/input.i.loop identifies the
decision: address GIVs at insns 107 and 120 both have multiplier four and
addend 528482308, and are combined into pseudo 277. Insn 641 initializes that
pseudo to 0x1F800004. The index-only GIV at 103 is rejected as not worthwhile
(0 versus 212 loop instructions). The real greg dump is at
build/rtl/block-sxfrc845/input.i.greg.

Rejected diagnostic variants: treating the scratch header as an initial
CacheInfo word and using [f+1] for both accesses yields 278 instructions and a
160-byte frame instead of retail's 168; using that view for only the pointer
read yields 284 instructions/135 diff lines; a preincrement loop-entry form
yields 277 instructions/164 diff lines. None reproduces the retail layout or
SYM. All remain in build/block_cache_probe; no live BLOCK source was changed.

### ERROR localized IDs and original header pools restored

ERROR's MsgStrings[44] was only a zero-initialized declaration, although retail
contains localized message IDs. The table now has its actual 44 integer IDs;
its 176 emitted bytes match retail exactly. Together with the 80-byte queue,
it fills the 256-byte data section in retail order. All three function byte/SYM
and strict call checks remain passing.

The apparent unaligned four-byte state group at 0x8011B869 was a missing-header
symptom: original .tp and .dat literals begin at 0x8011B860 and occupy nine
bytes first. Restoring the real CTextFileInfo::HasTp/HasDat inlines in a focused
header emits those strings naturally, followed by msgholdflag/msgcnt/msgflag/
msgdelay. A byte-aligned prefix experiment failed because PSYLINK aligned the
following source section; that experiment and its alignment relaxation were
removed. The original word-aligned prefix checks remain intact.

Native linking now matches all 500 code bytes, 256 data bytes, 14 read-only
bytes, and 13 small-data bytes, plus all three function and six named data SYM
records/addresses. A scaffold copy preserves the two nonzero trailing filename
padding bytes; no padding variable or compiled-output patch is used. ERROR is
selected for the final image, raising source-linked coverage to 405 functions
across 43 TUs (119 conventional and 286 native). The board remains 2684/2727.

### ENGINE source linkage and complete global state

Restored the retail orgseed LONG definition and unused static sgnWidth INT,
retaining their actual symbol names/types rather than padding variables. The
seed globals occupy eight initialized bytes at 0x8011B858; the static seed,
CCritSect object, and width occupy 12 .sbss bytes at 0x8011C7C4. All five native
data-symbol SYM records and applicable export-map addresses match retail.

ENGINE now supplies all 540 code bytes, its 18-byte diagnostic filename, both
state groups, and all nine exact function SYM records through the native route.
The original filename padding (0x6F,0x00) stays in a separate labelled tail in
a scaffold copy, while the original full scaffold remains unchanged. Standard
byte/SYM and strict call checks remain 9/9. Source-linked coverage is 414
functions across 44 TUs (119 conventional plus 295 native), with no change to
the 2684/2727 function board.

### PORTAL linkage and .sbss-only GP anchoring

PORTAL's source has static portalindex but no initialized .sdata. PSYLINK does
not use a plain _gp EQU as the base for its internal .sbss patches: the first
probe failed with out-of-range patches. The native route now supplies one
verified four-byte scaffold word in a .sdata group at retail GP when a TU owns
.sbss but no .sdata. It only establishes the linker base. The carrier is checked
against retail, excluded from exported source sections, and identified as
anchor mode in the receipt. Existing source-owned .sdata still uses its normal
prefix. A regression test distinguishes carrier bytes from owned payload.

PORTAL now matches all 1,808 code bytes, 80 initialized bytes (warp-coordinate
tables and portal array), 14 header-literal bytes, four .sbss bytes, ten native
function records, and the portal/portalindex data records. Its real TextDat
header restores the original GMAN literal; a scaffold copy preserves the
trailing 0x69,0x00 padding. Standard byte/SYM and strict call audits remain
10/10. Source-linked coverage is 424 functions across 45 TUs (119 conventional,
305 native), while the function board remains 2684/2727.

### PFILE source linkage with exact one-byte ownership

PFILE now supplies its complete 240-byte code section, the original 14-byte
GMAN header literal, and the one-byte gbValidSaveFile object at 0x8011B9F0.
The native bytes, all three function SYM records, and the global's UCHAR
type/address match retail. Standard byte/SYM and strict calls remain 3/3.
The state flag's following nonzero padding (0x4A,0x71,0x00) and the filename's
0x0B,0x80 tail remain original scaffold data rather than synthetic source bytes.
The original full filename scaffold is retained alongside its boundary-labelled
import copy. Source-linked coverage is now 427 functions across 46 TUs (119
conventional and 308 native); the board remains 2684/2727.

### PrintGameOver resolved by the actual CFont layout

GAMEOVER declared CFont with methods but no data members, making the external
MediumFont object the wrong size. A named Font pointer had recovered retail
bytes but added a SYM record; previous const-pointer/reference trials still
used the empty class and lost a saved register/instruction.

The live declaration now contains the exact 540-byte SYM layout: TextureId,
FontTab[256], PrintyOTpos, MinX/MaxX/Width, ThisDat, and FontHeight. Calling
MediumFont directly removes the artificial Font temporary while preserving
all 80 retail instructions. PrintGameOver passes the normal byte gate, real
ASPSX, exact SYM, and all 13 ordered calls; GAMEOVER is now 12/12.

Real early RTL confirms the type-dependent code-generation change: the old
dump gameover-tqm5s9h7 uses symbol_ref/v for MediumFont; the corrected dump
gameover-v72rm9df uses symbol_ref without that flag, and the assembly declares
MediumFont's actual size as 540. This is a source-type repair, not a debug
record suppression or allocator hint. All 97 unit tests pass. The completed
full board refresh confirms 2685/2727 (42 remaining), with no lost passes.

### wait_cdstream resolved from original Climax Warcraft II source

C:/Temp/ps1-decomp-refs/warcraft2/cdstream.c:600 supplies the original routine:
start_wait=time_in_frames and a loop condition comparing time_in_frames with
start_wait+(5*60). Restoring this expression with the retail nonvolatile clock
reproduces all 46 instructions and the exact AUTO start_wait record. Both the
invented wait flag and the artificial address-taking expression are removed.
The compiler retains the same constant loop predicate as retail; this does
not introduce new timeout behavior.

The live function passes the standard byte gate, real ASPSX, and exact SYM.
FMV is now 40/44; all 44 call audits pass. All 97 unit tests pass, and the full
board refresh confirms 2686/2727, 41 remaining, with no lost passes. Real loop
evidence is retained under build/rtl/fmv-rp0l1amh/input.i.loop.

The same reference tree provides mdec.c:98 and :829 for the remaining image
buffer/volume routines, plus cdstream.c:212 for the callback. The original
image-buffer for-loop is not a match here: it constant-folds the returned size
and produces 12 instructions versus retail 13, in both real C and C++ lanes.
That diagnostic was not applied. These are original PSX source twins, distinct
from the Diablo PC references and the generated IDA/m2c drafts.

### FMV return contracts corrected; declaration audit added

Retail SYM and the original Climax mdec.c source both declare kill_mdec_audio,
stop_mdec_audio, init_mdec_audio, set_mdec_audio_volume, and stop_mdec_stream
as void. The reconstruction had used int results (and returned ignored SDK
results) based on instruction appearance. All five now have the real void
contracts. Their 12/9/70/51/17 instructions remain exact, respectively, and
FMV retains 40/44 byte/SYM passes and 44/44 call audits.

tools/return_type_audit.py separately checks emitted function declarations
against retail type records. It retains pointer/enum/structure information,
handles header-copy aliases, and fails closed for missing or ambiguous types.
All 44 FMV function declarations now pass; the repository-wide declaration
audit is still pending. Three regression tests distinguish void/int, exclude
function-pointer variables, and reject ambiguous copies. All 100 tests pass.

Moving voice_attr after i, as in the Warcraft II source, preserves the 51 code
instructions but changes the local-record order and does not solve the retail
block membership. Restoring static-first order and changing the return type
also leaves that membership mismatch. No scope/record normalization was added;
set_mdec_audio_volume remains non-PASS on the board.

### Repository-wide return declaration audit

The full scan initially verified 2657/2725 entries and flagged 68. Five clear
repairs are now applied without losing existing byte/body-SYM passes: BLOCK's
TextDat::GetCreature/GetPal return CCreatureHdr*/PAL*, with PAL's actual layout;
GPANEL's GetPal returns UINT, its TextDat::GetPal returns PAL*, and FRAME_HDR is
defined with its real 12-byte bitfield layout rather than left incomplete.
BLOCK's declaration/call audits are 68/68 and its board remains 63/68. GPANEL's
declaration audit is 12/13, calls 13/13, and its board remains 10/13.

The resulting inventory is saved in configs/return_type_pending.json:
2662 verified declarations, 37 declaration differences, and 26 compiler-generated
initializer/destructor thunks with no retail declaration. Missing thunk metadata
is distinguished from a proven type mismatch but is not silently counted as a
matching declaration. The function board's heading now explicitly describes
its existing byte/function-body-SYM scope. Return contracts remain an additional
full-seal requirement. All 100 unit tests pass; the byte/body-SYM total remains
2686/2727, with 41 physical/body-record mismatches still open.

### Six more return contracts restored without byte regressions

MAIN's GetTpX/GetTpY now return INT, PAK's writeblock returns VOID, and INV's
CalculateGold(int) returns LONG as retail declares. The CalculateGold callers
in PLAYER/STORES already declared the integer-parameter overload as long;
the distinct PlayerStruct* overload remains unchanged. GMAN's PrintMonster
now returns the POLY_FT4* from PrintMonsterA, and GetCreature returns the real
CCreatureHdr* instead of a byte pointer.

All prior byte/body-SYM passes are retained: MAIN 7/7, PAK 4/4, INV 55/57,
GMAN 76/76, and its header consumer PADS 15/15. Their strict call audits all
pass. GMAN's only remaining declaration-audit findings are its two generated
thunks without retail declaration records. The pending inventory now records
2668 verified declarations, 31 declaration differences, and 26 such thunks.
No function-body PASS increase is claimed; the board remains 2686/2727.

### GLUE Boolean and monster-list return contracts

GLUE_Finished/GetShowGameScreenFlag/HasGameStarted now return the retail BOOL
type. The two formerly INT flag carriers also use their SYM-proven BOOL type,
so getters do not add spurious integer-to-Boolean conversion instructions.
GLUE_GetCurrentList returns MonstList*, whose real 16-byte field layout replaces
the fabricated opaque MonstListLevel type; MonstLevel's actual field names are
restored too. BgTask calls the declared GLUE_Finished function directly, and
GPANEL's existing external alias now declares its correct BOOL return type.

GLUE's return and call audits are 28/28. Its existing board stays 27/28 and
BgTask stays at 186 diff lines (297/299 instructions); GPANEL keeps 10/13 and
13/13 calls. The pending inventory now has 2672 verified declarations, 27 type
differences, and 26 generated thunks without retail declarations. No function
body PASS increase is claimed; the board remains 2686/2727.

### Fourteen byte-return contracts restored

SMemFree, PREOBJ's TrapLocOk/TorchLocOK, TryIconCurs, OLoad, L5checkRoom, and
the eight Force*Trig routines now return the retail UCHAR type rather than
the four-byte C++ BOOL. Matching declarations were corrected where necessary;
other TryIconCurs and SMemFree callers already used unsigned char. These
changes preserve every prior byte/body-SYM pass in the affected TUs: STORM 2/2,
PREOBJ 61/61, DIABLO 33/33, LOADSAVE 23/23, DRLG_L1 39/40, and TRIGS 22/22.
Their strict call audits all pass, and the declaration audits are complete
for these TUs.

The return-type inventory now verifies 2686/2725 declarations, with 13 real
differences and 26 generated thunks lacking retail declaration records. This
numerator coincides with, but is a different metric from, the byte/body-SYM
board's 2686/2727; its 41 remaining functions have not been relabelled as passes.

### MSG and remaining simple byte-return contracts

MSG's delta_get_item/delta_portal_inited/delta_quest_inited/i_own_level now
return UCHAR. DeltaExportData returns the INT result of ExportData, consistent
with its existing LOADSAVE caller declaration; ParseCmd returns ULONG,
consistent with MULTI. MSG remains 111/111 byte/body-SYM and calls; MULTI and
LOADSAVE retain 5/5 and 23/23. The declaration audit's only MSG findings are
the two generated thunks lacking retail records.

DRLG_L4's L4checkRoom/DRLG_L4PlaceMiniSet, GWIN's GRL_PostMessage, and STORES'
StoreAutoPlace also now return UCHAR. GLUE's existing named external alias for
GRL_PostMessage has the correct return and signed wParam declaration. DRLG_L4
retains 36/36, GWIN 5/5, STORES 103/103, and GLUE 27/28; their call audits pass.

The inventory now verifies 2696/2725 declarations. Only three actual return
differences remain (the color-clamp helpers), plus 26 generated thunks without
retail declaration records. The byte/body-SYM board remains 2686/2727; these
declaration repairs are not counted as new function-body passes.

### Return declaration audit clean for all recorded functions

TrimCol in CONTROL and DIALOG, and SpdTrimCol in GPANEL, now use the retail
UCHAR return type. Direct testing disproved the old assumption that the
sign-extended short instruction sequence required a SHORT function result:
the true declaration preserves those same bytes and function-body records.
CONTROL remains 50/51, DIALOG 9/11, GPANEL 10/13; calls are 51/51, 11/11, and
13/13. DrawSpeedBar's existing 11-line mismatch is unchanged.

A fresh repository-wide declaration scan reports 2699/2699 available records
matching, no failures, and 26 unrecorded generated thunks. The return audit now
handles those exactly as a separate metadata category: only _GLOBAL__I/_D
names with a compiler VOID declaration and no retail declaration qualify.
They are not counted as verified return records. Ordinary missing declarations,
wrong thunk returns, and any known retail mismatch still fail closed, covered
by regression tests. The pending inventory is empty and retains the 26 cases
in an explicit unrecorded_thunks list. All 101 unit tests pass.
The native source verifier now checks return declarations alongside function
placement and body records, with a test rejecting wrong or missing return
declarations even when body metadata could otherwise match. All 102 tests pass.
The completed full body-gate refresh remains 2686/2727 without regressions,
and the rebuilt five images remain byte-identical.

### FMV static membership checked in C; SPU declarations repaired

A pure-C diagnostic of the original Climax volume routine reproduces all 51
instructions but not the retail static-record placement. With static-first
declaration order it has the same `vol { voice_attr i }` sequence as C++.
Moving i into an inner block preserves bytes but adds an extra nested SYM block.
Neither experiment was applied; compiler-language switching and scope nesting
do not explain this remaining mismatch.

The original PsyQ 4.0 and 4.1 LIBSPU.H declarations exposed eleven imprecise
FMV API prototypes. They now use the SDK's void/long/unsigned-long results,
signed long mode/size arguments where declared, unsigned-byte SpuWrite input,
and typed SpuVoiceAttr/SpuCommonAttr pointers instead of void*. FMV retains
40/44 byte/body-SYM passes, 44/44 game-function return declarations, and 44/44
ordered call audits. The audio routines retain their 205/70/51 instruction
matches. set_mdec_audio_volume remains non-PASS solely on its block membership;
no debug-record rewriting or verifier exception was added.

### ResyncQuests prologue mismatch localized to scheduling

Both assembler lanes still show the same six-line difference at the first
QuestStatus call (315 instructions on each side), while exact SYM already
passes. Reusing the existing i variable for the quest argument and spelling
the condition explicitly as !=0 leave the mismatch unchanged; neither was
applied to live source.

The real sched2 dump at build/rtl/quests-aos3aeuv/input.i.sched2 shows equal
priority 1 for the stack adjustment, two register saves, argument constant,
and call. Its backward scheduler picks save-s0 then save-ra over the argument
load using the potential-hazard tie-break. The dbr dump at
build/rtl/quests-ojgqy6vh/input.i.dbr confirms save-s0 is then placed in the
first call's delay slot. Retail instead uses the argument load there. Thus
this residue is already present before final assembly emission and is not
an ASPSX-versus-maspsx artifact or a SYM-local mismatch.

### GRAHAM palette-task data and header pools restored

GRAHAM now defines all ten retail small-data globals in their original order,
including last_type=-1 and daylight=1. The exact native comparison caught the
latter's nonzero initializer. Original CTextFileInfo and CPlayer header inlines
emit the .tp/.dat and gman.h/cplayer.h literals naturally. CPlayer's focused
header is now shared with PREQUEST; its existing nine passes are preserved.

The data wrapper accepts complete, unescaped ASCII .asciz rows at a partial
object boundary, with explicit address/length checks. It rejects split strings
and escaped literals rather than guessing their encoding. A regression test
covers this case. Original scaffold bytes outside each source payload remain
unchanged, including the three nonzero/zero filename padding bytes.

Native linking matches all 1,344 code bytes, 33 read-only bytes, and 40 small-data
bytes, both function body/return records, and all ten global records/addresses.
Standard byte/SYM, return, and call checks pass 2/2. Source-linked coverage is
429 functions across 47 TUs (119 conventional and 310 native), with the
function board unchanged at 2686/2727.

### DPIECE source-linked against GENDUNG-owned arrays

DPIECE now supplies all 2,344 code bytes, its 34-byte header/diagnostic pool,
and the four-byte dPiece pointer at 0x8011BE44. The pointer is initialized
small data, not .sbss as an old source comment claimed. Native linking verifies
every instruction and data byte, all 20 function body/return records, and
the pointer's PTR SHORT type/address. Standard byte/SYM, call, and return
audits pass 20/20. The external map and tile-property arrays remain owned by
the already source-linked GENDUNG TU.

The original TextDat header restores the unused GMAN filename, while a
boundary-labelled scaffold copy preserves the final two padding bytes and
leaves the original scaffold untouched. Source-linked coverage is 449 functions
across 48 TUs (119 conventional and 330 native); the function board remains
2686/2727.

### DoCredits mode-transition scheduling probe

The live function still matches SYM and differs only in the placement of
Mode=2 versus Fade-- around the shared display jump (250 instructions each).
Writing Mode++ after the decrement generates the same four-line mismatch.
Moving Mode++ before the decrement, or using an early switch break for the
timeout condition, produces 249 instructions: the compiler shares the Fade--
tail with case 2, unlike retail. Those diagnostics were not applied.

The real dbr dump at build/rtl/credits-_8fpky83/input.i.dbr shows Mode's
constant-two assignment (insn 418) in jump 423's delay-slot sequence. Retail
has the Fade decrement there. No original DoCredits implementation was found
in the Warcraft II source tree. The next attempt must preserve the separate
decrement while recovering its scheduling, without adding artificial barriers
or patching generated instructions.

### DrawSpellCel field-order search bounded and rejected

The live function has 737 instructions, like retail, but a 184-byte frame
instead of 216 and different register assignments. A register-neutral diagnostic
alignment also highlights the X/Y/width/height load scheduling before primitive
allocation. All 24 permutations of those four independent assignments were
tested in a full-TU diagnostic copy, with no extra operations or flag changes.
Every variant remains 737 instructions and nonmatching; diff counts range from
94 to 172, with the existing source order already among the best. No variant
was applied to live source.

Results are retained in build/control_order_probe/order_results.json. The real
baseline allocation dump is build/rtl/control-3g7uwywd/input.i.greg; it reports
47 pseudos to allocate. The remaining frame/allocation discrepancy therefore
needs a broader source-expression or lifetime explanation, not just one of
these four-load permutations. The function board remains 2686/2727.

### DAVEO source linkage verified

The existing DAVEO source now supplies all 4,624 code bytes, 14 read-only bytes,
and 20 small-data bytes. Its initialized DaveDebCount, dot literal, DavesPad,
DavesPadDeb, and PDosh already reproduce the retail order. Full native byte
comparison, all 16 function body/return records, and all four named global
records/addresses match. No function-body edits were needed. Standard byte/SYM,
call, and return audits pass 16/16.

A labelled scaffold copy preserves the final 0x04,0x00 filename padding while
the original file remains untouched. Source-linked coverage is 465 functions
across 49 TUs (119 conventional and 346 native source functions); the separate
original-SDK import count is also 346 and must not be confused with this count.
The function board remains 2686/2727.

### GAMEOVER source-linked after its CFont repair

All ten explicit definitions and the two inline CBlocks helpers now emit in
retail order; their bodies are unchanged. PrintGameOver has a proper forward
declaration for its earlier caller. The entire 1,220-byte native text section
matches retail after relocation, and all twelve body/return records and call
audits pass. No runtime data section is emitted by this TU; unused original
header data remains scaffold and is not claimed as source output.

The native verifier now recognizes the same cfront destructor spelling alias
(_._ versus ___) already supported by symlane and the return audit. Exact
placement and function/body checks remain mandatory, covered by a regression
test that rejects a misplaced destructor. Source-linked coverage is 477
functions across 50 TUs (119 conventional and 358 native), while the byte/body
board remains 2686/2727.

### MAIN preflight exposes the main-file checksum/BSS boundary

MAIN's static GameTaskPtr is at 0x8011C604 in retail SYM. The MAP starts .sbss
there, and startup clears BSS from that address. The current raw-file scaffold
instead includes a word 0x02A12C64 at that location and starts its appended zero
tail at 0x8011C608. Direct calculation proves that word is exactly the sum of
all preceding 1,099,268 bytes modulo 2^32; it is the four-byte file checksum,
not the initial value of GameTaskPtr.

tools/image_trailer.py now audits this format against the MAP boundary, with
strict extent/checksum validation and separate encode/decode helpers. Tests
reject corrupt payloads, wrong checksums, extra/truncated data, and invalid
boundaries. All 107 tests pass. No ROM, original scaffold, or linked image was
changed. MAIN was not added to source linkage: the next format step must
separate serialized checksum bytes from runtime zero-fill, preserving both
disc-file identity and the real 0x8011C604 BSS address.

### Checksum/runtime split completed

The main YAML now declares a separate four-byte bin trailer at 0x10C604.
The linker and native placement reader exclude it from runtime sections;
SDK BSS bounds are checked against the retail MAP. The obsolete checksum
word was removed from the small-data scaffold (no oracle instructions or
ROM bytes changed). Runtime BSS starts at 0x8011C604 and covers 120304 bytes.

`link.py` now emits `build/diabpsx.runtime.bin`, rejects any nonzero or missing
BSS byte, and separately serializes `build/diabpsx.bin` with a computed checksum.
All five linked files match retail; the independent runtime/trailer audit
passes, as do 111 unit tests. MAIN itself is not yet selected for source linkage.
The function board remains 2686/2727; this fixes the final-image format, not
any remaining function mismatch.

### MAIN source linkage completed

Moved the existing GetTpY/GetTpX definitions before MAIN's entry points to
restore retail TU order. Native ASPSX/PSYLINK now supplies all 688 text bytes
and the four-byte GameTaskPtr static at 0x8011C604. All seven function byte,
SYM, return-declaration, and call checks pass; the static pointer type and
address match retail. The final main file and independent runtime/trailer
check pass, along with 111 tests. Source linkage is now 484 functions across
51 TUs (365 native functions in 19 TUs, 119 conventional in 32 TUs).
The board remains 2686/2727 because MAIN was already individually passing.

### Original SNMAIN whole-layout diagnostic is exact

`tools/snmain_probe.py` extracts the original PsyQ 4.1 LIBSN/SNMAIN unchanged
and supplies whole-section extents using explicit diagnostic carriers. All
384 text bytes, 36 initialized-data bytes, and four small-BSS bytes now match
retail. This resolves the previous isolated-member 13 text-word and six
data-word mismatches through linker expressions alone. The 15 constructor
and 11 destructor extents, GP base, and final four-byte heap alignment are
necessary inputs. No compiled bytes were patched. The carriers are not
runtime payloads and SNMAIN is not yet counted as a final-link SDK import.
Next: integrate original member with provenance-preserving surrounding data
and code sections, including the heap-alignment extent.

### SNMAIN original-library integration

`tools/sdk_layout.py` replaces diagnostic zero carriers with the actual
surrounding retail scaffold and verifies every whole-section byte after
linking the unchanged archive object. The normal SDK pipeline now imports
SNMAIN's three functions, 36 initialized-data bytes with eight verified
exports, and four-byte private small-BSS cell. Restored MAP labels __text
and __data identify the existing words; no data or instruction values changed.
Native SDK import count is 349, with 488 entries still outside that lane.
Layout tests check member exclusion from carriers, preserved surroundings,
zero BSS, and rejection of out-of-bounds/missing sections. 114 tests pass.
The game function board remains 2686/2727.

### MemcardPad reload: volatile declarations do not explain retail

`tools/instr/probe_memcard_reload.py` creates isolated full-TU copies, keeping
the correct options.cpp basename and real gate settings. Baseline remains
8 differences / 583 instructions versus retail 585. Qualifying save_blocks
volatile gives 21 / 586; moving its option-save assignment before Savefilename
does not change that result. Making the Savefilename pointer volatile gives
27 / 584, and making DiabloGameFile's pointer volatile gives 16 / 587.
No qualifier or store-order change was applied to reconstruction. These are
causal diagnostics only; an artificial volatile access is not a matching fix.
The actual compiler CSE dumps are retained in build/rtl/options-irqpwj0u
(baseline) and options-8flkfrok (volatile save_blocks). Probe outputs are in
build/memcard_reload_probe/results.json. The next search must explain the
selective game-save reload without introducing these unrelated memory effects.

### M_ChangeLightOffset full byte/SYM PASS

The corrected Y value belongs in ly before final scaling: each y2 sign/direction
branch assigns ly, including the unchanged else case. A single-use const final_y
holds `(ly >> 2) + ((ym & 1) << 3)` for the call. Both y2 and ly now have retail's
a0 records. All 90 instructions and exact local targets pass maspsx and real
ASPSX, exact SYM passes, and the ChangeLightOff target is correct. MONSTER is
103/105. The PC twin's different eighth-tile algorithm was not substituted.

Diagnostic intermediate forms matter: an unconditional ly=y2 before the Y
test produced identical normalized instructions but a wrong local branch
target (0xD8 vs retail 0xE0); moving the copy earlier lost y2's record. Explicit
branch assignments preserve both source variables and the correct direct
negative-Y branch. A fully in-call scaled expression kept exact SYM but changed
the final address temporary to v1; the const temporary restores retail v0.
No register pin, volatile access, or debug-record normalization was introduced.

### read_card_directory conditional-expression probes

Six additional full-TU diagnostics in build/card_condition_probe were rejected.
Returning fh through a conditional expression produces 120 diff lines / 157
instructions; conditional error/success expressions produce 126 / 155 and
87 / 156. Putting a nested conditional after close gives 45 / 150, changing
allocation and losing the desired direct second test. Testing fh+1==0 retains
the baseline three differences / 152 instructions but uses addiu/beqz rather
than nor/beqz. An unsigned comparison retains nor/beqz. Retail remains 151
instructions with beq s1,fp. This confirms that merely changing comparison
arithmetic does not recover the missing direct-branch control-flow form.
Live memcard.cpp and the 2687/2727 board were unchanged by these probes.

### GetUniqueItem pointer lifetime and metadata-order probes

Six full-TU pointer/reference caching trials were rejected: caching item[i]
after power application produces 192 instructions / 146 differences; caching
before the seed branch gives 197 / 141; caching after the seed branch gives
209 / 111. Retail has 216 instructions. Pointer and reference forms generate
the same results, removing repeated address calculations retail retains and
not reversing the i/uid allocation. None was applied.

All 24 permutations of the four independent final metadata assignments were
then checked. They retain 216 instructions but give 88--118 differences;
none improves the baseline or fixes the swap. Results are retained in
build/unique_metadata_probe/results.json, with lifetime copies under
build/unique_lifetime_probe. A fresh real-compiler greg dump in
build/rtl/items-tjtx6die confirms i pseudo72 in s1 and uid pseudo74 in s2.
The reconstruction and 2687/2727 board remain unchanged by these experiments.

### MINITEXT initialized state restored before source linkage

Native-integration preflight found missing/incorrect data despite 17 individual
function passes. Restored MtPrevText[80] as initialized TU-owned data after
QBack, the unused retail ULONG qtextDelay in the correct static order, and
the initialized small-data values: textadj/fetextadj=120, TextWait=200,
mytx/myty=32, and explicit zero qtbodge/FadeState/MusicFading/iBookName.
The latter two public position globals and TextWait follow the DrawQTextTSK
format literal, reproducing retail layout without filler.

Compiled .data is exactly 96 bytes at retail 0x800D6790 and .sdata exactly
52 bytes at 0x8011B934; both complete relocation-free sections compare equal
to ROM. MtPrevText also passes the independent 80-byte symbol data gate.
MINITEXT retains 17/17 byte/body-SYM and ordered-call passes. Its .sbss is now
36 bytes; final native integration still needs retail header literals,
function/header-copy order, and constructor/destructor placement verification.
No source-link coverage increase is claimed yet; the board stays 2687/2727.

### MINITEXT whole-TU native integration and thunk SYM correction

Restored the actual TextDat/CPlayer header definitions to emit the missing
header pool. KANJI_strlen and the six deferred inline methods now follow retail
function order. Native verification proves all 4400 text bytes, 96 data bytes,
160 read-only bytes (including both jump tables), 52 small-data bytes, 36 BSS
bytes, and the two four-byte ctor/dtor entries. All 22 named global SYM records
and all 17 function records, including both generated thunks, match retail.
Source linkage is now 501 functions in 52 TUs, of which 382/20 use the native lane.

This exposed a pre-existing general symlane mistake: it treated all generated
thunk bodies as missing from retail. In fact all 26 have body records under
_GLOBAL_.I./D. spellings; only their return-type declarations are absent.
The normal SYM gate now aliases the spelling and checks those bodies instead
of granting a blanket N/A. Native alias tests reject wrong addresses and body
records. Constructor-table placement tests enforce data-fragment bounds and
word alignment. 116 tests pass. The completed full board refresh remains
2687/2727 under this stricter gate, with no regressions. The main-image link
and its independent runtime BSS check also pass with MINITEXT selected.

### DoCredits transition expression/scoping follow-up

Six further full-TU variants in build/credits_transition_probe do not solve
the four-difference baseline. Mode-first comma expressions, prefix decrement,
a const nextFade snapshot, and a nested decrement block all produce the same
249-instruction cross-jumped form (retail is 250). Fade-first comma remains
the original four differences with exact SYM. A const nextMode snapshot keeps
those byte differences but introduces extra SYM blocks, so is worse. No live
source change was retained. The remaining problem is preserving retail's
separate decrement while moving it into the shared-display jump delay slot;
simple expression grouping and empty block boundaries do not do that.

### SOUND complete native source linkage

Restored SOURCE/SOUND.CPP's retail initialized globals: gbDupSounds=1,
master volume=230, music/sound/speech volume=8191, music track=5, MONO=0,
gbSndInited=0, and null sghMusic. The six USHORT music IDs 0x3CD--0x3D2
are now owned by this TU. Its SFXHDR pointer uses the actual 132-byte layout,
not an opaque declaration, allowing the global type/address check to pass.
Actual TextDat/CTextFileInfo headers provide the original filename/extension
pools. All 636 text bytes, 12 table bytes, 33 read-only bytes, and 40 small-data
bytes match via native linking, with all ten named globals and nine functions
verified. A separate scaffold copy preserves the final CA 69 00 alignment
bytes; the original scaffold and ROM remain untouched.

The final main image and runtime BSS check pass; all nine call audits and
116 tests pass. Source linkage reaches 510 functions across 53 TUs (391 native
functions in 21 TUs). The matching board remains 2687/2727, with 40 open.

### set_mdec_img_buffer: loop form versus initial copy

Fresh real-gate output confirms the two-difference baseline is the initial
`addu a1,zero,zero` versus retail `addu a1,a2,zero`, not the final return.
Full-TU diagnostic copies under build/mdec_loop_probe test for-initializers,
for post-increment, do/break, a bounded while, and four declaration-initializer
arrangements. Infinite for/do forms peel the first iteration (16 instructions,
11 differences; post-increment gives 19 differences). Bounded while folds the
total return (12 instructions / seven differences). All four declaration forms
retain the exact 13-instruction/two-difference baseline. No new guard, volatile
access, or source change was retained; these natural loop/initializer forms do
not explain retail's surviving tsz-to-i copy.

### GWIN complete native source linkage

Moved AllMsgs after GRL_PostMessage so its message strings follow the source
diagnostic filename in retail pool order. Native ASPSX/PSYLINK verifies all
312 code bytes, the complete 280-byte read-only pool (including eleven
message-name pointer relocations), and CurrentProc's four-byte BSS cell at
0x8011C8CC. All five function SYM records and both named global types/addresses
match retail. Standard gates and all five direct-call audits pass, as do the
final main-file comparison, runtime BSS validation, and 116 tests.
Source linkage reaches 515 functions / 54 TUs, with 396 / 22 native. The
function board remains 2687/2727; this is final-image integration progress.

### EFFECTS native linkage and typed sound-effect table

Restored retail EXT linkage for sghStream/sgpStreamSFX, the actual SFXX/SFXY/
SFXW/SFXH static names and values, plus mypan=0x8000 and sfxdelay/sfxdnum=0.
The old note incorrectly claimed these variables lacked retail SYM names.
The complete 992-entry sgSFX now uses typed TSFX initializers: Channel is zero,
bank IDs are sequential 0--991, and the original flag runs are preserved.
The PC EFFECTS.H table instead holds filename-based records; its shape was
not substituted for the PSX table. An independent data gate proves all 3968
bytes and the native linker also verifies its final location and SYM array type.

Native verification passes 2804 text bytes, 3968 data bytes, the 14-byte
header pool and 48-byte small-data group, all 20 function records, and ten
global records. All 20 direct-call audits pass. Source integration coverage
is now 535 functions / 55 TUs (416 / 23 native); function count stays 2687/2727.
All five complete linked files match retail; the runtime BSS audit and all
116 tests pass after integration.

### Deferred local-static probes and fail-closed SYM command status

Isolated inline versions of set_mdec_audio_volume and stream_cdready_handler
retain their respective 51 and 149 instruction matches, but neither fixes
the static-record scope/order mismatch. Deferred inline emission is therefore
not an explanation for this cluster. Copies remain under build/inline_static_probe;
live FMV source was not changed.

The standalone symlane command previously printed failed comparisons while
returning exit code zero. It now returns failure for any missing/mismatching
entry or empty result set. Unit tests cover both generated-thunk name aliases,
body mismatch/missing records, ordinary pass/failure, and empty input. The board
parser no longer accepts the obsolete SYM N/A result as a pass. Real checks
confirm the known volume mismatch returns 1 and QBack's two exact thunks return
0. FMV remains 40/44 and MINITEXT 17/17. All 119 tests pass.

### TOWN complete native source linkage

Restoring the actual TextDat/CPlayer header definitions supplies TOWN's missing
header literals without inserting padding strings. Native linkage proves all
2976 text bytes and the full 128-byte filename/header pool, including the town
sector filenames and loader diagnostic. P3Tiles is verified as a static byte
pointer at 0x8011C8C8. All eight exact function-body SYM records, byte gates,
and direct-call audits pass. The final main file remains identical with zero
runtime BSS; 119 tests pass. Source linkage reaches 543 functions / 56 TUs
(424 / 24 native). The individual matching board remains 2687/2727.

### ResyncQuests declaration/prologue probes

Four full-TU copies in build/quest_prologue_probe test the remaining scheduler
tie without changing compiler flags. Initializing i (alone or with tren) grows
the body to 319 versus 315 instructions, adds an s-register save, and gives
26 differences. Initializing only tren, or using the gold PC source's combined
`int i, tren;` declaration, preserves the exact SYM but leaves all six original
prologue differences. No variant was applied. A fresh real sched2 dump is at
build/rtl/quests-_k7g2dhz/input.i.sched2; the remaining difference is not resolved
by ordinary local declaration/initialization forms.

### Broader original-archive provenance inventory

`tools/sdk_archive_inventory.py` searches every .lib/.a filename (including
ignored files) under the two supplied reference roots. 319 archives were
inspected; 260 SN-format archives parse completely, with no archive errors.
Ten pending names appear in their exports. 97 member/export pairs are strictly
screened against retail extents and unrelocated bits, with no byte candidate.
The additional GetLong name in SuperSponge's XMPLAY is 44 bytes versus retail
100. BattleKonchuuden's MAINSYS/main object has unparsed bytes and remains
explicitly unresolved, not rejected as a proven mismatch. Archive/member hashes
and reasons are recorded in build/sdk_archive_inventory.json. Non-SN formats
are inventoried but not treated as exhaustively searched code.

The eight standard C names still present in 4.0/4.1 archives are not new matches:
their LIBC/LIBC2 extents differ from retail. No library entry was reconstructed
or newly imported; native import count remains 349. Screening tests reject
unparsed objects and missing exports; all 122 tests pass.

### MAINSYS name collision ruled out by original PSYLINK

The documented parse_obj format variants all fail to consume the complete
BattleKonchuuden MAINSYS object (the normal/non-padded modes stop at byte 3430
of 52024; padded mode desynchronizes). No parser relaxation was introduced.
The bundled DUMPOBJ is a DOS binary unsupported by native Windows, but the
existing original PSYLINK lane successfully links the unmodified member with
external diagnostic stubs and emits its debug records.

Its main starts at 0x80010000 in that diagnostic link, has a 1392-byte body,
and begins with word bytes 90 FF BD 27 (addiu sp,sp,-112). Diablo's main is
80 bytes and begins E8 FF BD 27 (addiu sp,sp,-24). The supplied source identifies
the archive routine as D:/98025/P00/MAINSYS.C with argc/argv and the other game's
render loop. Thus the exported-name candidate is independently disproven even
though the generic object parser remains unable to read it. Artifacts are under
build/mainsys_probe; no original object bytes or import registry were changed.
Native SDK imports remain 349; function matching remains 2687/2727.

### TRIGS gold-source tables restored

Native-link preflight found TRIGS' lookup arrays still declared extern. Fourteen
lists from the gold diablo-hellfire/src/TRIGS.CPP match the retail PSX values
exactly after using short rather than the PC int element type: TownDownList,
TownWarp1List, L1Up/Down, L2Up/Down/TWarpUp, L3Up/Down/TWarpUp, and
L4Up/Down/TWarpUp/Penta. Their typed definitions now live in
recon/source/gen/tables_trigs_pc.h and are compiled into the owning TU.
The independent symbol data gate verifies all fourteen arrays (284 bytes),
including every -1 terminator. TRIGS keeps 22/22 byte/body-SYM and call passes.
The remaining PSX-only lists, mutable trigger/block tables, and precise global
layout still need restoration before whole-TU native selection. No integration
coverage increase is claimed yet; the board remains 2687/2727.

### TRIGS full native reconstruction and IsTrigger semantic repair

Completed the six PSX-specific warp/block lists, typed trigs/TrigList/BlockList
storage, and all initialized state, including the unused retail FRIG statics
and FRIGX/Y/Z=55/71/24. The combined table header is now tables_trigs.h.
The complete .data (1700 bytes) and .sdata (104 bytes) reproduce retail exactly.
Actual TextDat/CPlayer headers restore the pool prefix; corrected the diagnostic
filename from psxsrc/TRIGS.CPP to retail source/TRIGS.cpp.

Whole-TU native relocation found two real masked-addend errors in IsTrigger:
the old source tested _qlog (+0x11) and _qtype (+1), while retail tests _qslvl
(+0xC) and _qactive (+2). The source now reads the correct fields. All 8252
native text bytes, 132 read-only bytes including both jump tables, and all
40 named global records pass. CheckTrigForce's maspsx output inserts two nops
after ownership restoration; real ASPSX has exactly retail's 195 instructions
and exact SYM, so it is explicitly registered in aspsx_passes.txt.
Source linkage reaches 565 functions / 57 TUs (446 / 25 native). The final
main-image link, runtime BSS check, 22 call audits, and 122 tests pass. A full
board refresh confirms 2687/2727 with no regressions and the reviewed ASPSX
entry applied to CheckTrigForce.

### PRETRIGS migrated from conventional to native source linkage

PRETRIGS' nine functions were already selected in recon_link.json. They now
use the native lane, with complete 2864-byte PREGAME text verification and
ownership of the 33-byte main-image header pool. Actual TextDat/CPlayer header
definitions provide the literals. A separate scaffold copy retains trailing
0A 01 80 padding bytes outside the source-owned pool.

The final-link duplicate-owner guard correctly rejected simultaneous GNU and
native selections; removed the old conventional entry rather than weakening
that guard. Coverage remains 565 functions across 57 TUs: 110/31 conventional
and 455/26 native. All nine byte/SYM/call checks and 122 tests pass. This is
stronger relocation/data verification, not nine new source-linked functions.
After migration all five complete linked files match retail and the independent
runtime BSS/checksum audit passes.

### GPUQ complete native source linkage

AllArgs[30] now has an explicit typed zero initializer, restoring its retail
840-byte initialized-data section rather than tentative BSS storage. The
independent symbol data gate and native link verify all queue bytes. Native
integration also checks the complete 1092-byte text, 16-byte diagnostic pool,
and four-byte ArgsSoFar state, with both global types and addresses exact.
All seven functions pass byte/SYM and call audits; the final main-image link,
runtime BSS/checksum audit, and 122 tests pass. Source linkage is now 572
functions across 58 TUs (462 native / 27 TUs, 110 conventional / 31 TUs).
The individual matching board remains 2687/2727.

### PRIMPOOL pool repaired; native BSS packing remains open

The TU incorrectly included the reconstructed primpool.h inline helpers,
emitting psxsrc/primpool.h rather than retail's psxsrc/gman.h. It now includes
the needed PsyQ types and actual TextDat header. The full 25 source read-only
bytes match retail. A separate scaffold copy preserves trailing 49 41 42;
its assembled 28-byte fragment was independently compared in full. All
19 byte/body-SYM and call checks remain passing.

Native integration was attempted but deliberately not selected: original
ASPSX/PSYLINK gives .sbss length 44, whereas retail places the eleven statics
in 32 bytes at 0x8011C608--0x8011C627. Each byte-sized .lcomm currently takes
a word-aligned allocation, unlike the retail adjacent BufferDepth/WorkRamId/
ScrNum and BufferNum/LastBuffer. The native CPE extent guard rejects this;
no bounds relaxation, neighboring-BSS overwrite, or compiled-object patch was
made. The temporary native registry entry was removed. Diagnostic artifacts
remain build/native_source/primpool.* for the next packing investigation.
Coverage remains 572 source-linked functions; board remains 2687/2727.

### PRIMPOOL packing localized; approved GNU lane already reproduces it

A minimal real-ASPSX probe with two one-byte .lcomm symbols and one four-byte
symbol emits 12 bytes and offsets 0/4/8 in the original LNK object. The padding
therefore exists before PSYLINK, not because of the native placement script.
ASPSX rejects a third .lcomm alignment operand and the .sbss shorthand in the
diagnostic; no unsupported syntax or object changes were applied to source.

The existing approved maspsx/GNU object already has the exact retail 32-byte
.sbss. All eleven symbol offsets were checked: 0,4,8,9,10,12,16,20,21,24,28
for hndPrimBuffers through ThisOtSize in retail declaration order. This gives
a conventional-source integration path without altering declarations or native
object bytes. That path still needs explicit BSS and shared-small-data placement
support; PRIMPOOL remains unselected until final link, types, and bounds pass.
Diagnostic files are under build/bss_packing_probe. Coverage/counts unchanged.

### Conventional source BSS placement support

Added recon_bss.py and the initially empty recon_bss_link.json registry. The
linker can now place an unchanged conventional TU's complete .bss/.sbss at an
explicit main-image address, with an exact extent assertion. It merges these
allocations with native and SDK BSS and rejects overlaps. Object validation
requires exact-sized, allocated writable NOBITS storage, not initialized bytes
or a differently sized section. Orphan-section checks remain enabled.

The real PRIMPOOL GNU object passes the 32-byte NOBITS check. Tests cover
invalid ownership, sections, bounds, alignment, sizes, overlaps, and actual
linker-script emission of its original object section at 0x8011C608. All
127 tests pass. PRIMPOOL remains unselected: shared .sdata and its nonzero
read-only padding still need conventional placement before whole-TU linkage.
This is infrastructure toward that verified integration, not a coverage gain.

### PRIMPOOL conventional source linkage completed

The unchanged maspsx/GNU object now supplies all 19 functions, its complete
20-byte .sdata, 25-byte .rodata, and packed 32-byte .sbss. All 15 global types
were compared with retail declaration records, and their final GNU ELF symbol
addresses match retail exactly. All eleven BSS offsets are also enforced on
the input object through recon_bss_link.json; native ASPSX's different BSS
packing is not patched or imported.

Shared small data is partitioned at 0x8011AAB4 and 0x8011AAC8. The original
scaffold is preserved; split_primpool_sdata.py generates the before/after
fragments, and other native imports retain the same GP base across this
contiguous group. Explicit linker padding preserves 49 41 42 after the
source's string terminator, with payload and total extents checked separately.
New tests cover partitioned GP bounds, exact padding, and packed symbol offsets.
All 19 byte/SYM/call checks, the main-image comparison, and 130 tests pass.
Coverage is now 591 functions / 59 TUs: 129/32 conventional and 462/27 native.
The completed five-image rebuild is exact, including the independent runtime
BSS/checksum audit after the shared-data partition.
The individual matching board remains 2687/2727.

### VID mixed-section preflight and ASPSX command exit status

VID contains eleven .VID_text functions plus VID_OpenModule/InitScreens in
STARTUP. An isolated copy uses the compiler-supported declaration attribute
section(".text.vid_startup") for those two functions. The unchanged real flags
produce exactly 1012 ordinary text bytes and 432 startup bytes. All thirteen
functions pass normalized byte and exact body-SYM checks; the real ASPSX lane
passes all eleven VID entries plus both STARTUP entries when routed to their
proper oracle segment. The attributes remain diagnostic-only pending explicit
mixed-section final-link support. The live SetVideoMode declaration was corrected
from void to long using the original PsyQ 4.0 LIBETC.H; both affected segment
gates and all thirteen call audits remain passing.

The ASPSX CLI, like the earlier SYM CLI, previously returned success even after
reporting failures. It now returns nonzero for incomplete/mismatching/empty
results. Tests cover missing functions/CPE/oracles and real mismatch outcomes.
set_mdec_img_buffer's known mismatch returns 1; CheckTrigForce's exact native
case returns 0. All 132 tests pass. Coverage remains 591 source-linked functions
and the individual board remains 2687/2727.

### VID exact-address six-section native diagnostic

`tools/instr/probe_vid_native.py` now compiles the isolated section-attributed
copy and links unchanged native objects at all retail addresses. All six
payloads match: 1012 bytes of VID text, 432 startup bytes, 16 read-only bytes,
four small-data bytes, 20 small-BSS bytes, and the 224-byte screen array.
The .rdata extent includes the compiler/assembler's final alignment byte;
the original 15-byte assumption was rejected by exact CPE coverage before
being corrected to the observed and retail-matching 16-byte section.

All thirteen function addresses/body SYM/return declarations and seven global
records also match retail. The object/source hashes and section extents are
recorded in build/vid_native_probe/receipt.json. The GP prefix remains scaffold
and is not counted as reconstructed data. Native-link section validation now
accepts compiler-emitted dotted section names while still rejecting paths,
newlines, and directive separators; tests cover that boundary. 133 tests pass.
VID remains diagnostic-only until mixed-section final-image integration is
implemented. Coverage and matching counts remain 591 and 2687/2727.

### VID mixed-section final integration

The live source now declares its two startup functions in compiler-emitted
.text.vid_startup. Native linkage imports those 432 bytes and all 1012 ordinary
VID text bytes, plus its complete read-only/small-data/BSS sections. All thirteen
function placements, body records and return types, and seven global records
match retail. Additional code sections require explicit functions routed to the
owning TU by segment_homes.txt and exact contiguous oracle coverage. The mixed
STARTUP wrapper preserves all unselected function scaffolds; duplicate ownership,
partial functions, gaps, and whole-TU conflicts are rejected. Native large BSS is
now placed with the same bounds/overlap checks as small BSS.

The main image and runtime BSS/checksum audit pass. The call audit was extended
from .text-only parsing to section-aware function ownership and relocation
resolution. Equal offsets in different sections are not aliases, and a tail
jump into another section cannot be discarded as a local jump. All thirteen
VID calls and 139 tests pass. Source coverage reaches 604 functions / 60 TUs
(475/28 native and 129/32 conventional); the function board stays 2687/2727.
The completed repository-wide section-aware call audit passes 2725/2725 real
functions. Its per-TU results are retained in build/callaudit_all.json.

### DECOMP mixed-section native linkage

DECOMP now uses the actual 112-byte TextDat declaration and its real unused
header method, restoring the gman.h pool rather than retaining an opaque byte
array stand-in. DEC_Open uses compiler-emitted .text.decomp_startup, sharing
the STARTUP wrapper with VID while unselected functions remain scaffold.
Native verification proves 416 ordinary text bytes, 36 startup bytes, the
34-byte header/diagnostic pool, and the 40-byte DecRequestors BSS array with
its exact global record. The final two read-only padding bytes (04 00) remain
outside source ownership in a separate scaffold copy.

All six byte/SYM/call checks and 140 tests pass. The five-image build remains
exact, including runtime BSS/checksum validation. A regression test covers two
source owners in one mixed segment with a scaffold function between them.
Coverage reaches 610 functions / 61 TUs (481/29 native, 129/32 conventional).
The matching board remains 2687/2727.

### SYSINIT complete mixed-section native linkage

Restored its TUTILS helper order and actual TextDat header pool; SYSI_Init
uses compiler-emitted .text.sysinit_startup. Native verification proves all
368 ordinary code bytes, 328 startup bytes, 112 read-only bytes, FileSYS's
four small-data bytes, and the two file-system pointer statics in eight BSS
bytes. All six function records and three global types/addresses match retail.
SpuInit's declaration was corrected to void from the original PsyQ 4.0 LIBSPU.H.

All six byte/SYM/call audits pass, including SYSI_Init's 25 ordered calls.
The main-image link and runtime BSS/checksum audit remain exact; 140 tests pass.
Native receipts were refreshed after the final source whitespace cleanup.
Coverage reaches 616 functions / 62 TUs (487/30 native, 129/32 conventional).
The matching board remains 2687/2727.

### OVERLAY mixed-section native linkage and real HaltTab type

Restored retail's HaltTab as a const ULONG[3], replacing the differently named
OVER_STUB byte aggregate. A normal memcpy of the table reproduces all 49
ClearOut instructions and exact SYM through the compiler's builtin expansion.
This is the runtime halt/return template recorded in retail data, not a new
function body supplied as bytes. Its independent 12-byte symbol gate passes.

Moved descriptor definitions after the first diagnostic string and used natural
zero initialization for CurrentOverlay. Native relocation caught and corrected
the prior small-data order (CurrentOverlay before fmv.bin instead of after it).
OVR_Open uses compiler-emitted startup placement. All 1100 ordinary text bytes,
32 startup bytes, 72 read-only bytes, 12 small-data bytes, 64 descriptor BSS
bytes, and the constructor pointer match retail, with fourteen function records
and all six global records exact. Both relevant segment gates and fourteen call
audits pass. Main-image/BSS checks and 140 tests pass. Source coverage reaches
630 functions / 63 TUs (501/31 native, 129/32 conventional); board stays 2687/2727.

### PAUSE complete native integration

Retail SYM disproved the old anonymous-global comments: restored CanPause,
Paused (BOOL, not int), and PBack, and the actual TextDat header pool. Reordered
the independent CPad/CBlocks/Dialog header definitions and their inline methods
to emit retail's deferred-function order without changing bodies. PA_Open uses
compiler-emitted startup placement. Original CRLF source formatting is preserved.

Native verification proves 4120 ordinary code bytes, 56 startup bytes, the
complete 192-byte pool including both relocated virtual tables, TPtr's four
small-data bytes, eight small-BSS bytes, PBack's 16-byte BSS, and both four-byte
constructor/destructor entries. All 35 function records and four global records
match retail. All byte/SYM/call checks, the main-image/BSS audit, and 140 tests
pass. Refreshed native receipts reflect the final source bytes. Coverage reaches
665 functions / 64 TUs (536/32 native, 129/32 conventional); board stays 2687/2727.

### SCRATCH complete native linkage without source changes

Inspection showed that the inherited PalCollection already emits its 492 bytes
in initialized .data under the real compiler; it is not a tentative BSS object.
Both brace-initializer diagnostics were rejected by that compiler and were not
applied. The existing source naturally matches all 1728 text bytes, 492 data
bytes, 100 read-only bytes, and two small-data bytes. Native verification checks
all 25 function records and ThePals/ShadClut/InitialPositions types and addresses.
The independent 80-byte palette-position table gate also passes.

All 25 byte/SYM/call checks, main-image/BSS verification, and 140 tests pass.
Coverage reaches 690 functions / 65 TUs (561/33 native, 129/32 conventional).
The matching board remains 2687/2727.

### FILEIO complete native linkage and static-member alias proof

The unchanged FILEIO source now supplies all 2104 text bytes, its initialized
50-byte FileToLoad buffer, complete 80-byte string/vtable pool, and the two-byte
backslash separator. All fifteen function records and the static-member global
record match retail. The explicit alias from _6FileIO.FileToLoad to the splat
_6FileIO_FileToLoad label is accepted only when native map, retail SYM, and
symbol-address metadata all agree. Regression tests reject mismatched addresses.

The data bridge now recognizes only the exact escaped-backslash asciz literal
as two bytes, 5C 00. Other escaped literals remain unsupported and truncated
literal boundaries fail. All fifteen byte/SYM/call checks, main-image/BSS
verification, and 142 tests pass. Coverage reaches 705 functions / 66 TUs
(576/34 native, 129/32 conventional); the board remains 2687/2727.

### SYSOBJ sentinel restoration and native linkage

Restored SysObj::NewHnd's retail -1 initializer (the previous tentative
definition was zero). All four functions still pass byte/SYM/call checks.
Native linkage verifies 300 code bytes, the 18-byte diagnostic string, and
four small-data bytes; original 04 00 alignment padding stays scaffold-owned.

Retail exposes _6SysObj.NewHnd only as an exported symbol, with no typed data
declaration. The corrected initialized source likewise emits only the symbol.
The registry explicitly records this address-only case and the receipt marks
retail_type_record=false, compiler_type=null. All compiler/native/retail/alias
addresses must agree; available retail type records cannot use this path, and
function symbols or missing/ambiguous evidence are rejected. No type match is
invented for unavailable records. Tests cover these failure cases.

The main-image/BSS audit and 143 tests pass. Coverage reaches 709 functions /
67 TUs (580/35 native, 129/32 conventional); board remains 2687/2727.

### CDIO complete native linkage

Restored the actual TextDat header to supply the missing gman.h filename pool.
Native linkage verifies all 1564 code bytes, the complete 104-byte string/vtable
pool, and six small-data bytes for the CD filename format. The earlier corrected
backslash remains intact. All nine exact function records and call audits pass.

The partial-data bridge now permits ASCII literals containing only paired
backslash escapes, calculating their decoded extent; it still rejects newline,
hexadecimal, octal, malformed, or partial escapes. Tests cover the six-byte
CD format and reject truncation/unsupported forms. Main-image/BSS checks and
144 tests pass. Coverage reaches 718 functions / 68 TUs (589/36 native,
129/32 conventional); the board remains 2687/2727.

### TMALLOC complete native linkage and strupr declarations

Restored ownership of MemBlock[60] as a typed zero-initialized 480-byte table.
The independent symbol gate and native link match it exactly. Native checks
also prove all 544 text bytes, 41 source string bytes, 12 small-data bytes,
and both global records. Original 63 75 01 alignment bytes remain a separate
scaffold fragment. All four function records and ordered calls pass.

FILEIO and BIGLUMP declared strupr as pointer-returning although its retail
declaration and definition are void; both ignored that result. Their prototypes
now agree. Focused checks remain FILEIO 15/15, BIGLUMP 16/17, TMALLOC 4/4, and
all three TUs' call audits pass. Main-image/BSS checks and 144 tests pass.
Coverage reaches 722 functions / 69 TUs (593/37 native, 129/32 conventional).
The matching board remains 2687/2727.

### PROF timer declarations restored and native-linked

Retail SYM names the first timer TimePerFrame and declares all five as INT,
contrary to the old source's TicksPerFrame/LONG declarations and missing-SYM
comment. Restored the actual names/types without changing any instruction.
Native linkage verifies all 804 text bytes, four small-data bytes, twenty BSS
bytes, ten function records, and six global records at their retail addresses.
All ten byte/SYM/call checks and 144 tests pass. The completed five-image build
and runtime BSS/checksum audit remain exact. Coverage reaches 732 functions /
70 TUs (603/38 native, 129/32 conventional); board stays 2687/2727.

### DAVEL full native linkage and TU-specific SYM copy lookup

Native relocation exposed four different menu-flag load addresses despite the
normalized byte pass. Restored retail's operand order: PauseMode, invflag,
chrflag, sbookflag, questlog. The bitwise OR remains logically equivalent, but
the actual loads now match. All 9704 text bytes, 176 initialized-data bytes,
54 read-only bytes, 32 small-data bytes, eight small-BSS bytes, 576 particle
BSS bytes, 36 function records, and twelve named global records pass native
verification. Original 6C 00 string-padding bytes remain scaffold-owned.

Standalone symlane's default unsuffixed GetOtPos request previously chose a
different TU's first retail copy. It now resolves only a unique oracle copy
in the current TU, refusing missing/ambiguous copies or incorrect explicit
suffixes. Tests verify it never falls back to another TU. Default DAVEL SYM
now correctly reports 36/36. All 146 tests and main-image/BSS checks pass.
Coverage reaches 768 functions / 71 TUs (639/39 native, 129/32 conventional).
The completed full board refresh remains 2687/2727 with no regressions under
the stricter copy lookup. All 36 DAVEL call audits and runtime BSS checks pass.

### SNDBANK native linkage: original ASPSX 2.67 BSS packing

Minimal original-assembler probes localize the earlier packing differences:
2.56 places byte/byte/word small statics at 0/4/8 and the large 264/20/48-byte
objects at 0/264/284 (332 bytes). ASPSX 2.67 and 2.79 instead produce 0/1/4
and 0/272/304 (352 bytes), matching PRIMPOOL's and SNDBANK's retail layouts.
The 2.81 object is unsupported by the current parser and is not selected.
Assembler-only 2.67 tests do not fix FMV's static SYM membership mismatches.

SNDBANK now explicitly selects original ASPSX 2.67 while retaining the real
2.7.2.SN32.3.7 compiler and flags. All 2076 text bytes, 180 read-only bytes,
14 small-data bytes, six small-BSS bytes, 352 large-BSS bytes, twelve function
records and ten global records match retail. The actual TextDat header restores
the missing header literal. No artificial padding or object patch was added.
The default assembler remains 2.56. Native receipts record the selected version
and binary hash; unknown versions are rejected. All 147 tests pass.
Coverage reaches 780 functions / 72 TUs (651/40 native, 129/32 conventional).
Final main-image/BSS verification and all twelve standard byte/SYM/call checks
pass. The matching board remains 2687/2727.

### Close scheduling mismatches are not resolved by ASPSX 2.67

Assembler-only checks with unchanged source/compiler keep DoCredits at four
aligned differences, BL_AsyncReadFile at four, and ResyncQuests at six. No new
assembler exception was registered. Five further BL_AsyncReadFile full-TU
source probes (while/break, for/break, status assignment in the sleep argument,
comma-grouped body statements, and an explicit post-sleep shift) all retain
88 instructions, exact SYM, and the same four scheduling differences.
Copies are under build/async_forms_probe. Live source was unchanged; these
ordinary polling-loop forms do not recover the retail delay-slot choice.
Matching and source-link coverage remain 2687/2727 and 780 respectively.

### PSXMSG complete native linkage and level tables

Restored LevPals[17] as TU-owned initialized data and Level2Bgdata[25] as a
read-only table, matching the retail MAP/SYM. Both independent symbol byte
checks pass (17 and 50 bytes). Actual TextDat/CPlayer headers restore the
missing pool prefix. Native verification proves 2672 text bytes, 17 data bytes,
all 352 read-only bytes including jump tables, four small-data bytes, fifteen
function records and three global records. All fifteen calls, main-image/BSS
checks, and 147 tests pass. Coverage reaches 795 functions / 73 TUs (666/41
native, 129/32 conventional); matching remains 2687/2727.

### BgTask resolved: retail locals and player-pointer lifetimes

Restored BgTask's retail declaration order, ObjId/List integer types and the
MyBlocks/MyPlayer/MyPlayer2/P1Panel/P2Panel names. Removed draft-only panel
pointer locals. The startup plr1/plr2 caches now end after setup; scroll and
render calls use the actual plr array, allowing the compiler to form retail's
independent loop address registers. This reduces the initial 186 differences
to an exact 299-instruction match. The first scroll call also uses plr[0]
directly. JustLoadedPlayer is restored as the retail static unsigned byte in
small data, replacing a wrong-width int store.

Both byte lanes, exact SYM records/scopes, and all 53 calls pass. The full GLUE
TU passes 28/28 with all call audits. No assembler exception or gate change
was necessary; source-link coverage is not increased by this function fix.
The completed full-board refresh confirms 2689/2727 (38 remaining), with all
147 tool tests passing.

### SetScrollTarget missing retained primary-player base

Current CPlayer::SetScrollTarget has 246 instructions and a 48-byte frame,
against retail's 249 and 56. Retail materializes plr in s7 in the final
single-player branch, then reads its mode; the current compiler uses a direct
symbolic load and does not save s7. Pointer/member spelling, call-first sum
order, and four branch-local pointer/reference forms do not restore this
address pseudo (build/scroll). No live source changed.

Real dumps are build/rtl/cplayer-cqx7n0yf (cse) and cplayer-b0v7zgbh (greg).
Whole-TU stock comparison ICEs later in NonBlockingLoadNewGFX. The supplied
isolate_fn.py successfully isolates SetScrollTarget; compare_tu.py then finds
only the known C++ static-member spelling difference (dot versus dollar in
PActiveArray), with identical function assembly. Thus stock diagnostics are
usable for this isolated function, but the failure has not been resolved and
retail/SYM remain mandatory gates. The board remains 2688/2727.

### CheckIsoBodge resolved: coordinate lifetime and structured return

CheckIsoBodge now matches all 219 instructions in both byte lanes, exact SYM
including block membership, and all fifteen ordered call targets. Passing
wy+oy to both CheckDirs calls (rather than updating wy in place) restores
retail's coordinate lifetimes and reduces 110 differences to five. Retaining
the CheckCentre-negative body and the shared final newdir return removes the
remaining branch/return differences. A const local for the initial CheckDirs
result, with direct short-circuit left/right checks, matches the retail scopes
without extra l/r debug records. No register pins or artificial guards were
introduced. The whole GAMEPAD TU now passes 42/42, including call audits.
The completed full-board refresh confirms 2688/2727 (39 remaining), with all
147 tool tests passing. Source-link coverage is unchanged by this gate fix.

### ProcessItems index scope and diagnostic path sensitivity

Gold Hellfire source confirms the common animation/sound sequence; PSX's
deduplicated list and frame snapshot remain retail-specific. Four scope probes
under build/processitems_index_probe leave 192 instructions for a separately
scoped index or 194 when the frame snapshot is moved inside the map test.
Combining the scoped index with a cached item reference yields 163 instructions
with a 48-byte frame (retail 56), or 172 when the final animation-length read
stays indexed (retail 169). None passes SYM; no source change was retained.
Fresh real dumps are build/rtl/items-qy1n6kek (cse), items-32sd92d0 (cse2),
and items-sy_vpro7 (greg).

Original ASPSX crashed on the longer diagnostic directory names. Identical
source under short r00/r01/r10/r11 names assembled and returned ordinary SYM
mismatches. Keep probe paths short; a crash is not a matching result or proof
that the C++ construct itself is unsupported. This observation does not alter
compiler/assembler binaries, source semantics, or gate rules.

### MAI_Counselor declaration order versus stack slots

Revalidated the live 295-instruction match and compared complete SYM records.
Retail orders counsmiss, _mx and _my before the main block, then fx/fy/mx/my/
md/v/dist/Monst inside it. Live code has the right locations but different
order and membership. Moving _mx/_my before fx matches record order but
changes _my from sp-48 to sp-72 and produces 34 instruction differences.
Moving counsmiss after the Monst assignment preserves all 295 instructions
but emits fx before counsmiss. Explicit late and outer-coordinate scopes
likewise fail SYM or stack placement. No variant was retained.

Diagnostic full-TU copies are in build/counselor_scope_probe. Inspection of
gcc-2.7.2 sdbout.c confirms block starts are emitted before their symbol lists;
an explicit extra scope therefore does not by itself reproduce retail's
pre-block records. This remains a debug-emission/source-scope investigation,
not a reason to ignore record ordering or change the SYM gate. Live source
was restored and its byte pass rechecked; the total remains 2687/2727.

### Dialog::Back early-CSE corner reuse

Current real ASPSX output is 1095 instructions versus retail's 1094; maspsx
adds a separate small-data-store expansion and reports 1096. The substantive
extra instruction comes from retaining X-1 in s1 across the first two corner
calls instead of recomputing it in a2 at the first and third corners. The first
CSE dump already shares pseudo 427 between insns 1549 and 1661, so allocator
priority changes alone do not explain how the extra temporary arose.
Real dumps: build/rtl/dialog-qh_vin_0 (cse), dialog-1cxclzpb (cse2), and
dialog-ywsynceu (greg).

Full-TU probes under build/dialog_corner_probe test the original DX parameter
at either/both corner sites, unsigned coordinate arithmetic, and literal,
late-declared or const transparency. DX at the third corner reaches the right
instruction count but increases the frame from 184 to 192 bytes and leaves
17 aligned differences; other DX forms also fail. Unsigned arithmetic retains
the baseline. Literal/const transparency produces 1066 instructions and late
declaration produces 1083, both broad regressions. No reconstruction change
was retained. The next useful target is the early-CSE expression lifetime,
not assembler selection or those equivalent coordinate spellings.

### DrawInvTSK entry scheduling probes

Both byte lanes retain eight aligned differences at the entry, with exactly
390 instructions and matching SYM. Real pre-allocation scheduling already
orders the sel_data load, invflag load, and myplr load differently from retail;
this is not an ASPSX-only expansion issue. Captured sched, sched2 and lreg
dumps are under build/rtl/inv-8g9aewe8, inv-rlwgk58p and inv-makiqbj0.

Six declaration/assignment forms and five equivalent guard forms were tested
in full-TU copies under build/inv_entry_probe. Reversing saved-state assignment
order also reverses omp/osel's registers and increases the differences to
twelve. Initializers and comma expressions do not improve the baseline;
reversing the guard operands gives 24 differences. Positive conjunction,
explicit zero comparison and conditional-expression guards retain eight.
None were retained in reconstruction. Live source was rechecked at eight
differences with exact SYM; the board remains 2687/2727. The next investigation
must account for entry scheduling without sacrificing retail's saved-state
register assignments, rather than repeating these source spelling changes.

### TONY complete native linkage

Native verification proves all 1748 text bytes, 109 read-only bytes, 108
small-data bytes, 40 BSS bytes, seventeen function records and 25 named
global records. SetAmbientLight's chained stores now follow retail's
red/green/blue order. The mutable DEMOPAD0.DAT pool symbol is bound to its
verified retail address; a local-pointer refactor changed code generation
and was not retained. Three trailing alignment bytes remain scaffold-owned.
All seventeen standard byte/SYM and call checks pass. The final main image
is byte-identical, with all 120304 runtime BSS bytes verified zero and the
additive checksum serialized separately. Coverage reaches 812 functions /
74 TUs (683/42 native, 129/32 conventional); matching remains 2687/2727.

Nothing under `C:/temp/dmt-cc1/` is committed (outside the repo entirely,
per the task's rules); everything under `tools/instr/` is small text and
safe to commit if the user wants the diagnostic lane kept.
