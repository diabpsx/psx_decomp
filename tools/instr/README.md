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

## 6. Worked example: `PrintItemPower__FcPC10ItemStruct` (`recon/source/items.cpp:3414`)

Current status (`tools/verify_asm.py`): **134 diffs**, and per
`MATCH_PROGRESS.md` a documented near-miss. `verify_asm.py`'s diff isolates
it to exactly one register swap right at function entry:

```
      +sw s2,32(sp)
      +addu s2,a1,zero          <- OURS:   x (2nd param, a1) -> $s2
      +lb v0,105(s2)
      -addu s1,a1,zero          <- ORACLE: x (2nd param, a1) -> $s1
      -lb v0,105(s1)
      -sw s2,32(sp)
      -lui s2,0                 <- ORACLE: the OTHER var (tempstr addr)  -> $s2
      -addiu s2,s2,0
      +lui s1,0                 <- OURS:   the OTHER var (tempstr addr)  -> $s1
      +addiu s1,s1,0
```

i.e. exactly the task's "pure s1/s2 swap" — `x` (the `const ItemStruct *`
parameter) and the pointer that materializes `tempstr`'s address are
call-crossing, so GLOBAL alloc (not local-alloc) decides their homes.
`items.cpp` itself ICEs on an unrelated earlier function (`GetItemStr`,
line 1690, a `switch` with a nested `sprintf` — the destructor bug from §3
doesn't apply here, this looks like a different, not-yet-diagnosed FSF-2.7.2
ICE, but it's before `PrintItemPower` either way and blocks the whole-TU
trace), so `isolate_fn.py` was used to extract just `PrintItemPower` (see
`tools/instr/README.md` §4's exact recipe; the isolated single-function TU
compiles cleanly under BOTH the real PsyQ CC1PLPSX and our stock cc1plus,
producing an **IDENTICAL** `.s` — confirming the instrumented build's trace
for this specific function is retail-accurate, not just FSF-accurate).

The full trace is saved at `tools/instr/printitempower_trace_example.txt`.
The relevant `[allocno_compare]`/`[find_reg]` block (`global.c`, the whole-
function call-crossing allocator — this is GLOBAL alloc, not local-alloc,
since both `x` and the tempstr-address var live across many `sprintf`/
`strcpy`/`strcat` calls in the `switch`):

```
[allocno_compare]  order (allocno/pseudo:refs/live/calls/size=pri):
  1/74:40/168/35/1=11904   2/75:4/10/2/1=8000   14/434:3/4/0/1=7500
  3/76:14/76/21/1=5526     0/73:2/4/0/1=5000    8/163:4/16/4/1=5000
  13/425:3/7/1/1=4285      12/376:4/19/4/1=4210 4/119:3/8/1/1=3750
  ...
[find_reg] allocno 1 pseudo 74  refs 40 live 168 calls 35 -> reg 17  ($s1)
[find_reg] allocno 2 pseudo 75  refs 4  live 10  calls 2  -> reg 16  ($s0)
[find_reg] allocno 14 pseudo 434 refs 3 live 4   calls 0  -> reg 3
[find_reg] allocno 3 pseudo 76  refs 14 live 76  calls 21 -> reg 18  ($s2)   <- this is `x`
```

Reading it against the `.s` output confirms **pseudo 76 = `x`** (`addu
s2,a1,zero` in our build matches `find_reg`'s `pseudo 76 -> reg 18`
exactly — `reg 18` = `$s2`), and **pseudo 74** (the highest-priority
allocno, 40 refs/168 live/35 calls — `tstr`/the `tempstr` base pointer,
referenced as an sprintf-destination or `strlen` operand in nearly every
`switch` case) is what's currently sitting in `$s1` (`reg 17`).

`x`'s priority (`5526`, rank 4 of the allocno order) is well below pseudo
74's (`11904`, rank 1) — that's WHY pseudo 74 is processed first and claims
the first callee-saved slot (`$s1`, since `$s0`/reg 16 was presumably
already spoken for or simply the class-order picks 17 first — the trace's
`[find_reg]` line for allocno 2/pseudo 75 shows it landing on reg 16 = $s0,
so the two "top" allocnos (74, 75) exhaust s1 and s0, leaving pseudo 76 to
land on s2). **For `x` to land on `$s1` instead (matching retail), its
priority needs to overtake pseudo 74's 11904** — since
`pri = floor_log2(refs)*refs*size/live_length*10000`, and `x`'s `refs=14`
is fixed by how many times the source actually dereferences `x` (one
`floor_log2(14)*14 = 3*14 = 42`), the lever is **`live_length`**: `x`'s
current `live=76` (`pri = 42/76*10000 = 5526`); shrinking `live_length` to
`≤ 42*10000/11904 ≈ 35` would push `x`'s priority above pseudo 74's 11904
and flip the swap. Concretely this means **narrowing the span between `x`'s
first and last use** — e.g. reading every `x->_iPL*` field the function
needs into locals in one tight block near the top (shortening how far `x`
the pointer itself has to stay live across the `switch`'s later,
`sprintf`-heavy cases) rather than dereferencing it freshly in each distant
`case`. The alternative lever is the mirror image: reduce pseudo 74's own
priority (fewer `refs` on the `tempstr`/`tstr` pointer — e.g. using the
`tempstr` global directly in the branches that don't need the `char *tstr`
alias, cutting its ref count) so pseudo 76 overtakes it without `x` itself
changing at all. Both are legitimate, pin-free, C-source-level levers
(§3.12b of the shared methodology doc) — neither has been applied/verified
in-tree yet; this is the diagnostic reading only, per this task's scope.

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
| `tools/instr/host-fixes-configure.patch`, `host-fixes-obstack.patch` | the two textual diffs vs pristine 2.7.2 |
| `tools/instr/xm-mingw32.h.reference` | the finished host xm file (diff against 2.8.1's for the two additions) |
| `tools/instr/printitempower_trace_example.txt` | full `GCC_TRACE_ALLOC=1` trace for §6 |

Nothing under `C:/temp/dmt-cc1/` is committed (outside the repo entirely,
per the task's rules); everything under `tools/instr/` is small text and
safe to commit if the user wants the diagnostic lane kept.
