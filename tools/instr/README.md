# Instrumented gcc-2.7.2 cc1plus — allocator-trace diagnostic lane

**DIAGNOSTIC ONLY.** Nothing here is, or ever replaces, the project's gate
compiler (`PSYQ / CC1PSX.EXE` / `CC1PLPSX.EXE` from `tools/build.py`). This is
a *separate*, from-source rebuild of vanilla FSF gcc-2.7.2, instrumented to
print its register allocator's internal decisions to stderr, used purely to
read off *why* the real compiler picked one register over another on a
near-miss. `tools/build.py` / the gate toolchain were not touched.

## Status (2026-09-28)

### Current quick start: reproducible matching diagnostics

`match_probe.py` builds the **same preprocessed input** with real PsyQ,
stock FSF and instrumented FSF compilers using the project's current flags.
It selects one exact assembly symbol and one unambiguous trace heading, then
checks both stock/PsyQ agreement and instrumentation transparency. It never
changes reconstruction, compiler sources or gate rules.

```powershell
python tools/instr/match_probe.py recon/psxsrc/dialog.cpp DialogPrint__Fiiiiiiiiii --function DialogPrint --gates
```

If unrelated frontend crashes require isolation, explicitly create a diagnostic
copy, then retain gates against the original TU:

```powershell
python tools/instr/isolate_fn.py recon/psxsrc/dialog.cpp DialogPrint build/dialogprint_iso.cpp
python tools/instr/match_probe.py build/dialogprint_iso.cpp DialogPrint__Fiiiiiiiiii --function DialogPrint --gates --gate-source recon/psxsrc/dialog.cpp
```

Each run uses a fresh short directory under `build/probes/`. `report.txt` is
the compact summary; `report.json` includes input/source/compiler hashes,
flags, exit statuses, global allocation ranks and all attempts, plus ordered
local allocator events (quantity IDs are **not** merged across blocks).
Each compiler's raw output, target assembly, requested RTL dumps and stderr are
retained. Divergent targets produce unified diff files. Requested gate output
is saved separately for maspsx, real ASPSX, SYM and ordered calls.

The default dumps are `greg,lreg`. To distinguish allocation from late control-flow
optimization and delay-slot scheduling, capture several passes in one run:

```powershell
python tools/instr/match_probe.py build/soundpad_iso.cpp SoundPad__Fv --function SoundPad --dump cse2,greg,sched2,jump2,dbr
```

`jump` is the early jump pass (`-dj`); `jump2` is the late jump pass (`-dJ`).
Both are also available through `real_rtl.py --dump`. Unknown or duplicate dump
names are rejected, and a missing requested dump makes the probe fail.

Worked diagnostic: in the pre-fix isolated SoundPad, real PsyQ `sched2` retains
two cancellation-path `cmenu` stores (RTL UIDs 1643 and 1673). In `jump2`, UID
1643 disappears and jump 1649 targets new label 1764 before store 1673. Thus
the shared store appears during late jump optimization, after hard-register
assignment, rather than during initial CSE. This input agrees across all three
compiler lanes; that agreement does not establish a retail byte match. Reproduce
with the command above; UID numbers depend on the exact source revision.

This diagnosis led to a verified source fix: move `Adjust = 0` after the
`cmenu` and `cs` assignments in the special cancellation branch. Both byte
lanes now match all 642 instructions, SYM is exact and all 41 calls match.
No additional locals, register constraints or gate changes are involved.
The completed full-board refresh confirms 2692/2727 PASS, with OPTIONS at
35/38 and 35 entries remaining. The 160-test suite passes.

For overloaded functions, supply the full trace heading with `--function`.
No source-variable names are guessed from pseudo numbers. Allocation attempts
are not claimed to be final reload assignments. A validated isolated trace
applies only to that input: it does **not** establish equivalence to the original
TU, and successful compiler agreement is **not** a retail PASS. Native data,
relocation/jump-table and final-image checks still apply separately.

Exit 0 requires a validated trace and success of every requested check; exit 1
means the report is incomplete/divergent or a requested check failed. Argument
errors exit 2. A real-ASPSX pass may legitimately coexist with a maspsx failure;
the report exposes both and does not decide project exception policy.

`compare_tu.py` now also uses unique artifact directories and meaningful exit
codes: 0 identical, 1 differing, 2 compiler failure or invalid invocation.
It no longer silently exits successfully after a reported compiler failure.

The historical build recipe and original validation results follow.

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
python tools/instr/real_rtl.py recon/psxsrc/biglump.cpp BL_AsyncReadFile \
  --dump greg,sched2,dbr --around TSK_Sleep --context 18
```

`real_rtl.py` accepts a comma-separated pass list and compiles the shared input
only once. `--around REGEX` prints merged, line-numbered windows around every
matching line in each selected function body; `--context` controls the number
of surrounding lines. A missing or invalid expression is a hard error, so a
typo cannot masquerade as an empty diagnostic. The complete raw dumps remain
in the artifact directory even when focused output is requested.

The focused BL_AsyncReadFile receipt shows the two-instruction ordering root cause
without the former 2,000-line combined output: in `greg` and `sched2`, UID 148
saves `getasyncreadstatus`'s `$v0` to `$s0`, UID 151 loads argument 1 into
`$a0`, and UID 153 calls `TSK_Sleep`. The `dbr` pass chooses immediately
preceding UID 151 for the call delay slot, while retail instead orders the
argument load before the call and puts the `$v0` save in its delay slot. Moving
the sleep into the loop condition, comma-expression ownership, and optimized
constant-local forms preserve the same four textual diff lines; a mutable
loop-local adds a non-retail nested SYM block. No source variant was retained.

For the normalized byte gate itself, `VA_CTX` reveals instruction indices and
side-by-side context without changing comparison behavior:

```powershell
$env:VA_CTX=3
python tools/verify_asm.py recon/psxsrc/fmv.cpp LoPlayFMVOverLay
Remove-Item Env:VA_CTX
```

This disambiguates repeated normalized instructions. For `LoPlayFMVOverLay`,
the two otherwise-identical `sw v0,0(gp)` diff lines are one moved
`user_start` store: ours stores at instruction 210 before `li s5,1`, while
retail loads `fade` first and stores at 211. The natural chained assignment
`user_start = fade = user_quit` was screened and rejected: it emits 273 rather
than 274 instructions, swaps the long-lived s4/s5 allocation, and fails SYM;
all 48 calls remain ordered only. The original source was restored.

Each invocation retains its preprocessed input, assembly, and dump in a unique directory under
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

Resolved (2026-10-01): use the natural staged ID extraction
`OUid = _uid; uid = OUid; uid &= 0xFF;`. Both byte lanes now match all 216
instructions; exact SYM and all seven call targets pass. This adds no locals,
artificial uses or register constraints. Merely using `uid = OUid & 0xFF`
does not have the same compiler result and remains at the old 88 differences.

The new validated three-compiler probe `build/probes/a-2u6jughq` confirms the
predicted allocation threshold: uid pseudo 74 now has 13 references / 119
live instructions / seven calls, priority 3277, selecting s1. i pseudo 72
stays at 13 / 120 / seven, priority 3250, selecting s2. This reproduces retail
exactly and validates the earlier quantitative diagnosis through real gates.
Moving OUid's snapshot later or reversing initialization order instead
produced 214 instructions and was rejected. All 164 tests pass.
The completed full-board refresh confirms 2693/2727 PASS, 34 remaining,
with ITEMS at 105/106 and no regressions.

Historical evidence before the fix:

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

Post-matrix coordinate follow-up (2026-10-01): revisited Top=Y-1 and a
full-width Row=Y-1+(3-Loop)*5 now that DurColors is correctly declared.
Top alone, Row alone, and both together all produce 180 instructions versus
retail 179, with 49 diff lines. The Top variant saves fp (real frame comment:
vars=8, regs=10/0, args=32), but frame size remains 80 rather than retail 88;
SYM correctly rejects it. This differs from the older pre-matrix 96-byte
experiment and isolates an outstanding stack-layout issue even when the
extra saved register is restored. Diagnostic copies/results: `build/da`.
No source change was retained; live baseline remains 178/179 and non-PASS.

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

Existing-local follow-up (2026-10-02): reusing the now-dead `ItemType`
parameter for `Y - 1` does create a persistent anchor, but changes method
parameter allocation, grows to 180/179 instructions and 127 raw differences,
and retains the 80-byte frame. The retail fp anchor is therefore not a second
value range of an existing named parameter; live source was restored.

With psyq.h actually included, a valid setXYWH(Ft4, X+20, Y-2, 4, 25)
for the initial black rectangle fixes its scheduling and reduces the current
source to 49 diff lines (still 178/179 instructions and frame 80 versus 88).
Replacing the inner rectangles with setXYWH as well produces identical code,
so their explicit stores remain. The retained macro passes the real-path
implicit check; GPANEL's 13/13 direct-call audits (including DrawSpeedBar's
28 sites) and its ten existing function passes remain unchanged. The Y-1
anchor still needs a source-level explanation.

### DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct

Update (2026-10-01): retaining `const int Bottom = By + 0x14` before the
two bottom-coordinate stores removes the unwanted HI copy of By. Current
source is 459/459 instructions, exact SYM including length and block ends,
and all 28 call targets match. Both byte lanes still show six diff lines:
the right-edge add/store group uses v1 before the u0 load rather than a0
after that load. This is NOT a PASS; GPANEL remains 10/13.

The fresh isolated probe `build/probes/a-y9we6kgm` independently proves
stock FSF and real PsyQ differ in the inventory-item comparison (v1/v0
versus v0/t1), though instrumentation itself is transparent. Do not treat
its allocator choices as validated PsyQ choices. Real initial RTL shows
the top y stores directly use By's subreg; CSE reuses the earlier narrowed
By operand from the bottom-edge expressions. Keeping the addition in SI
before narrowing removes that dependency. Reordering UV/coordinate stores,
unsigned/masked casts, explicit UV snapshots and earlier Right snapshots
did not solve the remaining schedule; only Bottom was retained. Fresh real
CSE dump: `build/rtl/gpanel-543ochh0/input.i.cse`. All 160 tests pass.

Historical investigation before this update:

Further right-edge probes (2026-10-01) retain the six-diff baseline for
interleaved x/y stores, a chained right coordinate, unsigned right arithmetic,
and int/unsigned/byte snapshots of `u0 + 1`. Putting both y stores first
swaps Bx/By's saved registers throughout the function (68 differences);
deriving the right edge from stored x0 adds three instructions (69 diffs).
None was retained. Real first-scheduler dump `gpanel-iuqkoraa` and lreg dump
`gpanel-hflatdq7` both place UID 1114 (right edge, pseudo 356) followed by
stores 1116/1123 before the u0 reads. In second-scheduler dump
`gpanel-96_pqus6`, that result is already v1, so its later u0 load into v1
cannot move above these stores. Investigate pre-allocation scheduling of the
right-edge live range, not merely final delay-slot scheduling. Diagnostics
are under `build/sbr`; live executable source stays unchanged.

Late-combine identity follow-up: all 256 pairs from sixteen equivalent
spellings of the two `Bx + 0x89` right-edge assignments retain the exact
459-instruction/six-difference result (or regress). This includes the
Dialog-derived `~(-(Bx + 0x8A))` and `-~(Bx + 0x88)` forms. Results are under
`build/speedbar_right_probe`; arithmetic CSE timing does not free v1 for the
first u0 load, so live source remains unchanged.

Tail-order follow-up (2026-10-02): all 90 interleavings of the x1/x3, y0/y1
and u1/u3 assignment pairs were compiled while preserving order inside each
pair. Seventy-two retain 459 instructions and the same six differences;
eighteen that put both y stores ahead of the x pair produce the known
68-difference Bx/By allocation regression. None moves the first u0 load ahead
of the right edge. Explicit overlapping const snapshots for `u0` and the
right edge are also code- and SYM-neutral. Results are under
`build/speedbar_tail_order_probe`; live source remains unchanged.

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

Status-width follow-up (2026-10-01): full-TU copies in `build/asstat` test
signed/unsigned-byte status conversion, explicit low-byte masking, unsigned
shift arithmetic, and a signed-byte loop condition. None passes. Signed
conversion adds an instruction (89/88); unsigned conversion/masking retains
88 but substitutes ANDI for retail's raw result copy; unsigned shifting
keeps the baseline schedule; a cast-only condition shifts into v0 instead
of MemSize/s0. The baseline raw-int return declaration is unchanged: no
authoritative EA header supporting a narrower return type was found in the
local reference collections. These results do not justify changing an API
declaration or weakening SYM to admit a new temporary. No live source edit.

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

Existing-local pointer follow-up (2026-10-02): the first-phase `count` and the
index `ii` were each reused as `(int)&item[ii]` after the animation increment,
then every later field used that base. Both create the desired compact s0-based
body without adding a new name: count gives 166 instructions / 89 differences,
ii gives 166 / 99 (66 aligned). They are rejected because the frame collapses
to 48 bytes and the reused variable's root SYM location changes to s0 instead
of retail count=a0 or ii=a1. This proves an existing named integer cannot own
the retail anonymous pointer lifetime. The 192-instruction frame-snapshot
source remains live.

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

Follow-up (2026-10-01): four full-TU member-access spellings (C++ pointer
to member, dereferenced plr+1, commuted array indexing, explicit member
address/dereference) all retain the 76/79-instruction, 17-diff baseline.
No live source changes. Diagnostic sources/results are under `build/cdm`.
The three-compiler probe `build/probes/a-f14_60im` rejects trace validation:
instrumentation is transparent, but stock FSF hoists constants 288 and 510,
adds two saved registers, and grows the frame to 64 bytes versus real PsyQ's
56. Both loop dumps nonetheless use the same plr+6661 constant address.
Thus the stock compiler is not a solution to retail's plr+29 base hoist,
and its final allocations must not be applied to this target. This separates
the shared address-folding problem from the SN-specific invariant policy.

PrintCDWaitTask still differs by 17 lines (76 instructions versus retail 79).
Retail preserves plr+0x1D in s3 and loads the second player's active flag at
offset 6632; our real loop RTL already combines that address to plr+6661,
leaving no address pseudo for loop-invariant motion. A const player pointer
and an incomplete external array declaration change nothing. A root-scope
named second-player index instead hoists offset 6632 and gives 33 differences;
moving that index into the conditional returns to the baseline. No diagnostic
was applied to live source. The real loop dump is retained at
build/rtl/stream-5pfu8g8z/input.i.loop.

Field-base follow-up (2026-10-02): an anonymous or const pointer expression
rooted at `&plr[0].plractive` still folds to the absolute plr+6661 load. A
mutable `unsigned char *active` local produces the exact 79-instruction count
and desired base+stride decomposition, but allocates active to s4 and
CDGfxData to s3 (retail is the reverse) and adds a non-retail named SYM local.
This proves the missing three instructions are the recordless field-base
temporary while ruling out a named pointer as a seal-compliant fix. The live
source was restored.

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
Restoring the original C++ declaration order (`int i` before static
`voice_attr`) also preserves all 51 instructions, but emits `vol { i
voice_attr }`, which is farther from retail's `vol voice_attr { i }`. None of
these experiments was applied; compiler-language switching, declaration order,
and scope nesting do not explain this remaining mismatch.

The exact `cdstream.c` handler declarations were also gated as one unit:
combined `static int idx, i, sec`, then `static CdlLOC subcode[3]`, then
Diablo's `OldGp` call initializer. All 149 instructions and nine calls remain
exact and record order becomes correct, but the compiler places every record
inside the function block (`status result { idx i sec subcode OldGp }`) while
retail places them before it. The live split/late-array form's single adjacent
record swap is therefore closer and was restored.

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
the condition explicitly as !=0 leave the mismatch unchanged. Initializing
the existing `tren` local to Q_LTBANNER and passing it likewise retains the
same six lines, 315 instructions, and exact SYM. None was applied to live
source.

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

Argument-expression follow-up (2026-10-01): three full-TU copies in
`build/margs` test assigning Savefilename in the second call argument,
reading Savefilename instead of DiabloGameFile, and combining the two
assignments with a comma expression. All produce the unchanged eight diffs,
583/585 instructions. Retail reloads save_blocks after loading DiabloGameFile
but before storing Savefilename, so merely changing the latter store's source
ordering is not sufficient. None of these variants was retained; this does
not justify volatile accesses, alias barriers or extra control-flow guards.

A typed indirect spelling, `*(char **)&Savefilename = DiabloGameFile`, is
canonicalized back to the same direct store and also retains the eight-diff,
583/585 baseline with exact calls. It does not create the retail global
`save_blocks` reload and was reverted; there remains no source evidence for a
volatile qualifier.

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

Direct-control-flow follow-up (2026-10-01), `build/cdirect`: a switch guarding
the read and an explicit success-label form both produce 149/151 instructions
with fh/r swapped (14 diff lines). Splitting the two error checks produces
148 instructions and a 144-byte frame; a one-iteration while produces 152
instructions and a 160-byte frame. None passes or is retained. These forms
do not recover the second direct comparison without changing other code.

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

Late-pass follow-up (2026-10-01): the real compiler now establishes where the
Mode-first variant diverges. In `build/rtl/credits-j7tc8d5i/input.i.sched2`,
UID 418 is the separate Fade decrement after UID 415 (Mode=2). In
`build/rtl/credits-easp4_gb/input.i.jump2`, UID 418 has disappeared and jump
423 targets label 486 at case 2's decrement (UID 490). The lost instruction
is therefore late cross-jumping, not an assembler delay-slot discrepancy.
The baseline `credits-chfuljif` jump2 dump preserves both assignments;
the existing dbr dump puts Mode=2, rather than Fade--, in the jump delay slot.

Six additional full-TU tests in `build/clate` were rejected: Mode-first
unsigned/long subtraction and Mode-derived subtraction remain 249/250;
`Fade -= Mode++` remains the original four differences at 250/250;
subtracting the existing `one` variable grows to 252 instructions and a
200-byte frame. Live DoCredits is unchanged: exact SYM and 28 call targets,
but four byte-diff lines. The board remains 2692/2727. A future source fix
must avoid late sharing while preserving retail's decrement delay slot;
more constant-folding spellings of the same arithmetic are not promising.

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

Validated CSE evidence (2026-10-01): `build/probes/a-yyqt77mo` agrees exactly
across real PsyQ, stock FSF and instrumented FSF for this target. In initial
RTL, UID 15 copies tsz pseudo 74 into i pseudo 73; after first CSE the same
UID assigns constant zero with REG_EQUAL zero. The final allocations are
already correct (p/a0, i/a1, tsz/a2); this is not a register-priority problem.
Six full-TU trials under `build/mdc` reject chained initializers, pre-increment
conditions, post-increment indexing, a bottom-tested loop and swapped pointer/
size updates. Chains and pre-increment keep two diffs; post-indexing gives
eight; swapped updates give four; bottom testing folds the return and yields
12 rather than 13 instructions. No executable change was retained. Exact
SYM still passes; the stale source comment describing an older guard trial
was replaced with the current two-diff/CSE evidence.

Fresh real-gate output confirms the two-difference baseline is the initial
`addu a1,zero,zero` versus retail `addu a1,a2,zero`, not the final return.
Compiling the complete FMV TU with the authentic frontend at `-O1` does not
preserve that copy: the function grows to 14 instructions/21 diff lines, while
LoPlayFMVOverLay, set_mdec_audio_volume, and stream_cdready_handler regress to
78, 61, and 122 diff lines respectively with SYM failures. The production
`-O2` setting was restored; this is not an optimization-level fingerprint.
An isolated pure-C build of the live 13-instruction loop also retains exact
SYM and the same two normalized diff lines (`i` is still initialized directly
from zero), so C-versus-C++ frontend selection is not the missing factor.
Full-TU diagnostic copies under build/mdec_loop_probe test for-initializers,
for post-increment, do/break, a bounded while, and four declaration-initializer
arrangements. Infinite for/do forms peel the first iteration (16 instructions,
11 differences; post-increment gives 19 differences). Bounded while folds the
total return (12 instructions / seven differences). All four declaration forms
retain the exact 13-instruction/two-difference baseline. No new guard, volatile
access, or source change was retained; these natural loop/initializer forms do
not explain retail's surviving tsz-to-i copy.

Initializer follow-up (2026-10-02): twenty ways of producing `tsz == 0`
before `i = tsz` were screened, including complement/add pairs, pointer-self
subtraction/XOR/comparisons and multi-statement increment/decrement forms.
Code-neutral forms all reach first CSE as literal zero and retain the two-diff
baseline; pointer-derived forms that survive CSE add instructions or broadly
change allocation. Results are under `build/mdec_tsz_init_probe`. The live
literal initialization remains the closest permitted source.

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

Result-lifetime follow-up (2026-10-01): root-scope const BOOL/int/unsigned
snapshots of the first QuestStatus result keep 315 instructions, exact SYM
and the same six prologue differences. Assigning the result to existing tren
also keeps exact SYM, but changes the result mask/test register and gives ten
diff lines. Explicit function return and equivalent Boolean conversion do
not affect the prologue. All six full-TU diagnostics under `build/qstat`
were rejected; executable source and compiler settings remain unchanged.

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

Authentic frontend flag follow-up (2026-10-02): disabling the second scheduler
for the complete TUs is not the retail fingerprint. ResyncQuests grows to 321
instructions/160 differences, DoCredits reaches 16 differences and different
block offsets, and BL_AsyncReadFile reaches 14 differences with different block
offsets. The production scheduler setting was restored; the close residues are
not explained by a TU-level `-fno-schedule-insns2` flag.

### PSXMSG complete native linkage and level tables

Restored LevPals[17] as TU-owned initialized data and Level2Bgdata[25] as a
read-only table, matching the retail MAP/SYM. Both independent symbol byte
checks pass (17 and 50 bytes). Actual TextDat/CPlayer headers restore the
missing pool prefix. Native verification proves 2672 text bytes, 17 data bytes,
all 352 read-only bytes including jump tables, four small-data bytes, fifteen
function records and three global records. All fifteen calls, main-image/BSS
checks, and 147 tests pass. Coverage reaches 795 functions / 73 TUs (666/41
native, 129/32 conventional); matching remains 2687/2727.

### DRLG_L5TransFix paired loop coordinates

Tile-read follow-up (2026-10-02): replacing both cached-v comparisons against
seven with direct dungeon reads stops the unwanted seven hoist and reduces
the raw diff count to 186, but introduces reloads and grows to 277 instructions
versus retail 273. Replacing only the last seven test gives 272 instructions
and 349 diffs; restoring direct reads for the five gold-shared rules gives
276/403. Read-only views at the seven tests or also at v's initial load grow
to 283/284 instructions and a 32-byte frame (retail 24). All five full-TU
copies under `build/treads` were rejected. This isolates a CSE/load-reuse
versus loop-hoisting interaction; fewer differing register names alone is
not a match. Live source remains the 270/273, 333-difference baseline.

Rechecked the gold Hellfire source at DRLG_L1.CPP:2990: it confirms the five
shared transparency rules, while the remaining rules are PSX additions and
must retain retail behavior. Pairing xx/yy updates with i/j in the for headers
preserves every map access and update and reduces 357 differences to 333 at
270/273 instructions. Retained this natural induction form. Recomputing each
coordinate from its index produces 390 instructions and was rejected. All
call checks pass (no calls), and DRLG_L1 remains 39/40. Not a new PASS.

Late-combine comparison follow-up: all 512 combinations of eight equivalent
spellings for the three semantic `== 7` tests were compiled and gated. Changing
only the first cached-v test to `v + 1 == 8` prevents the unwanted saved
constant-seven hoist while combine still produces the required comparison.
The live function reaches retail's exact 273-instruction length and reduces
333 differences to 106; exact SYM and the no-call audit pass. The best raw
count is 98 at 275 instructions and is rejected. Results are retained at
`build/transfix_seven_probe/results.json`. This is a substantial retained
improvement but not a PASS; DRLG_L1 remains 39/40.

After that allocation change, restoring the retail initialization order inside
the paired for-header (`yy = 16, j = 0`) becomes effective: yy is now s0 and j
is s1, so their saves/initializations move into exact retail order. This removes
the four prologue differences and leaves 102 at the same 273/273 length and
exact SYM. The earlier 270-instruction allocation made this spelling neutral;
the two retained changes therefore have to be evaluated together.

Loop-ownership follow-up: screening 25 combinations of combined/separate loop
initialization and header/body coordinate updates found the full gold shape is
decisive once the comparison identity is present. Initializing yy and xx before
their loops and advancing both in their loop bodies reproduces every induction
register and update sequence, reducing 102 differences to ten at 273/273 with
exact SYM. The comparison must remain `v + 1 == 8`: reverting it to `v == 7`
reintroduces the saved-seven hoist and the old 270/357 allocation. Results are
under `build/transfix_loop_probe`; the combined identity-plus-gold-loop source
is retained. Only the three seven-comparison instruction groups remain.

The eight-form three-site comparison screen was rerun against the gold loops;
ten differences remains the exact-length minimum. A further middle-test screen
of integer-width casts and zero-comparison identities (`v - 7 == 0`,
`!(v ^ 7)`, and variants) either retains those ten, restores the old
270/357 saved-constant allocation, or adds instructions. Results are under
`build/transfix_seven_probe` and `build/transfix_cast_probe`. No direct
`v == 7` spelling currently preserves the retail allocator state.

A 100-case follow-up combined direct middle `v == 7` with ten integer-width
casts on the neighbor and final seven tests. Code-neutral casts fold back to
the old 270/357 constant hoist; signed/byte-distinguishing pairs bottom out at
28 differences but grow to 275 instructions. Results are under
`build/transfix_cast_sites_probe`; the retained ten-difference form remains
strictly closer on bytes, length and SYM.

### DialogPrint extra local and read-only-view probe

Shade-index follow-up (2026-10-02): retail evaluates GShadeX first, then
GShadeY, uses the shared base for G1/G2, and only then computes the next-row
index. Three single-use const snapshots in that order reproduce the sharing.
GX remains as one extra REG record (t0); GY and GY1 are omitted. A record-free
form that repeats GX reaches only 609/608 and 159 differences, while reusing U
broadly regresses allocation. Crucially, GY1 must remain an `int` modulo result;
the old `(char)` cast emitted one extra sign-extension instruction before the
multiply. DialogPrint improves from 162 differences at 610/608 to 118 at exact
608/608, with all thirty calls still exact. The first SYM mismatch is now the
SH saved register (s6 versus retail s4), followed by the extra GX record—not
function length. Attribution is retained at
`build/dialogprint_shade_xy_phased.txt`.

First-branch ordering follow-up: moving only `y1 = y0` (and the code-neutral
`x2 = x0`) ahead of UV setup preserves 608 instructions and reduces 118 to 116
differences. Moving all XY assignments first over-optimizes to 605; reordering
only the rotated branch gives 609/107, both branches 605/105, early y2 gives
608/122, and early x3 gives 608/120. The retained partial reorder is therefore
the exact-length minimum among these source-order screens.

Finally, the eight INT u/v identifiers were mapped by lifetime rather than the
guessed semantic axis. Two same-type cycles map current s3/s4/s2/s5/s6 and
s7/fp/stack lifetimes onto retail u0/u1/v1/v0/v2 and u2/u3/v3 names. After
restoring declaration order and excluding structure member tokens from the
mechanical rename, all eight records match exactly with byte-identical output.
The reproducible probe is `build/probe_dialog_uv_names.py`.

Validated isolated allocator trace is captured in build/dialogprint_alloc.
v1 (pseudo 99) has 6 references / 28 live instructions / two crossed calls,
priority 4285, ahead of u0 (94): 7/40/2, priority 3500. v3 (101) has 4/25/2,
priority 3200, while u2 (96) has 5/34/2, priority 2941 and spills. Retail
instead puts u0 first and spills v3. Earlier v1/v3 assignment probes do change
allocation but fail the real gates: 610/160, 611/161 and combined 610/280
(instructions/differences). None was retained; the trace is diagnostic, not
authorization for register pins or added fake references.

Coordinate-order follow-up (build/duv): paired corner assignments produce
605 instructions/209 differences; direct per-corner expressions produce
610/168. Staging rotated v0 through multiple assignments gives 610/330;
decrementing UOfs before its expression gives 610/158, only a small scheduling
change without restoring retail's allocation. None was retained. These trials
preserve corner values but do not meet either complete byte or SYM gates.
The supplied isolate_fn.py/compare_tu.py lane reports IDENTICAL assembly for
build/dialogprint_iso.cpp under stock and real PsyQ compilers, so this isolated
function is a validated candidate for the allocator trace lane.

Removed the draft-only Bits local by testing the shade-table expression
directly; retail has no such record. Instruction output is unchanged at
610/608 with 162 differences and all thirty calls exact. Read-only Fr/Tp
views shortened code to 601 instructions and increased the differences to
209, so they were reverted. The real greg dump is retained at
build/rtl/dialog-tdu8rfd5. Remaining issues include UV allocation (source spills
u2, retail spills v3) and shade-table scheduling; DIALOG remains 9/11.

### GAMEPAD complete native linkage

Restored original TextDat/CPlayer/CTextFileInfo headers and retail function/
deferred-inline order. Original ASPSX 2.67 naturally places the 212-byte GamePad
instances 224 bytes apart, matching the 436-byte BSS extent. Native verification
proves all 12768 text bytes, 60 initialized-data bytes, 248 readonly bytes
including jump tables, 39 small-data bytes, BSS and the constructor pointer,
plus 42 function records and eleven named global records.

Full relocation caught two errors invisible to normalized instruction checks:
SetWalkStyle must use txt_actions[2].pad_val (offset 0x24), not entry 9; and
InitGamePadVars clears _spselflag[1] before [0]. Both are corrected. All 42
standard passes and call audits remain green. Production main-image bytes,
120304 runtime zero BSS bytes and checksum all verify; all 150 tests pass.
Source linkage is now 901 functions / 77 TUs (772/45 native, 129/32 conventional).
Matching remains 2691/2727; this integration does not claim a new board PASS.

### DrawMenu retail logic and packet-address repairs

Comparison-form probe: changing the remaining interior tests together to
one-based forms raises output to 1040 instructions/886 differences without
fixing the stack-slot displacement. Reverted that batch to the verified
1033-instruction/751-difference baseline. Real greg/lreg dumps are retained
at build/rtl/options-irfthy04 and options-1b9e6o1c for the spill investigation;
the frame size matches, but mptr and subsequent locals start one spill slot
earlier than retail. No artificial stack slot or register constraint added.

Text-path follow-up replaces decompiler gotos/shared_print and Str/x2 locals
with structured frontend/in-game branches and direct string lookup arguments.
Final help-text selection uses direct calls without Str_00. All 27 ordered
calls remain exact. The initial one-based menu test restores the retail
232-byte frame and removes the initial code differences; current output is
1033/1032 instructions with 751 differences. Local names now match retail,
but allocation and stack slots still differ. OPTIONS remains 34/38 and all
150 tests pass. This remains non-PASS.

Packet/highlight follow-up restores sxp/syp integer coordinates and reuses len
for the slider's right edge, removing four decompiler short temporaries.
Highlight uses retail cx/cy and the shared len width rather than y2/Frm2/x/iVal.
Most importantly, retail falls through from selected-item spinners to the
common text renderer; the draft's else incorrectly skipped selected labels.
That control-flow error is repaired. Current source is 1033/1032 instructions
with 989 differences and a 224-byte frame versus retail 232. All 27 calls and
150 tests pass; OPTIONS stays 34/38. Numerical diff improvement is not claimed
for this correctness checkpoint; frame, scopes and text-path reconstruction
remain open.

Rectangle/local follow-up separates my (menu origin), yoff (per-row spacing)
and len (cached slider length), following their retail stack/register roles.
Restored mptrx/mptry and uses iptr=mptr->Item; explicit selected/unselected
slider calls remove the draft-only Frm/Str/Font temporaries. Current result
is 963 differences at 1027/1032 instructions, with all 27 calls exact and
OPTIONS still 34/38. Stack/local layout and the remaining packet/text scopes
are not yet exact; this is not a PASS.

Corrected SoundMenu rows: frontend uses rows 2/3/4 at 1/2/3 and row 1 at zero;
in-game uses rows 1/2/3/4 at 1/2/3/4. The prior draft omitted row 4. Slider
selection is based on item index i, not its length; position, gradient and
width use len, not the Just enum. Corrected addPrim's double-scaled ordering
table index (ThisOt+depth, not ThisOt+(depth<<2)). Restored signed half-height
division and byte-sized barg/barr before halving gradient colors, as shown
by the retail shifts and masks. Initial menu branch order follows retail.

All 27 calls remain exact and OPTIONS stays 34/38. The current 1015 instructions
are still short of retail's 1032 and give 991 differences; these are concrete
logic repairs, not a new byte/SYM PASS or a claim that the diff count improved.
All 150 tool tests pass. Local layout and the remaining drawing flow still
need reconstruction against the oracle.

### DrawSpinner coordinate and color lifetimes restored

Allocation follow-up: expressing the paused/non-sparkling case first gives
589 differences at 416 instructions with calls unchanged. Moving the y3
origin addition outside the projection branch does not help and was reverted.
The real local-allocation dump (build/rtl/options-3lbkankg) reports x and y
each with 24 references, 281 live instructions and seven crossed calls.
Retail spills y and retains Sparkle, whereas current source retains y and
does not allocate Sparkle to a saved register. Stock comparison of
build/spin_iso.cpp diverges substantially (176-byte frame versus real's 160),
so its final register choices must not substitute for real PsyQ evidence.

Retail retains radius=spinradius/2 independently instead of overwriting the
argument and reusing radius for a sine entry. Restored separate x1/y1, x2/y2
and x3/y3 calculations in retail order, with absolute outer coordinates and
relative middle offsets. The frame f no longer doubles as loop angular stride.
Quarter-bright colors are computed before the loop, and the cross packet
updates its middle offsets in place. Packet code-bit operations follow retail.

The result is 416 instructions versus retail's 415 (previously 392), with 593
differences versus the previous 641 and all eight calls matching. The current
160-byte frame still differs from retail's 168; this is not a new PASS.
Explicit unsigned color-product casts did not change code and were reverted.
OPTIONS remains 34/38 and the board remains 2691/2727.

### SoundPad retail logic corrections (still non-PASS)

Tail-only probes in build/stail leave the eight-difference baseline unchanged
for unsigned/long link conversions, a const table view and a nested assignment.
Staging the selection through cs emits 644 instructions, while decrementing
cmenu after resetting cs emits 641; neither is retail's 642. No variant was
retained. Real cse2 is captured at build/rtl/options-21lqn87n. These probes
do not justify adding volatile, artificial guards or weakening the gate.

Scope repair now leaves eight differences at 640/642 instructions. l belongs
only to the language for-loop; link tests use their source expressions and
speed selection uses a switch without an invented spd local. All local record
tuples and internal block boundaries now match retail; only the root end and
function length remain eight bytes short. The remaining difference is the
cmenu==7 cancellation update, where the compiler shares an end-of-branch
store. Extra staging through cs produces 644 instructions; staging through
cmenu does not solve it. Those trials were rejected. OPTIONS stays 34/38 and
all 41 SoundPad calls match. Full SYM/PASS is still not achieved.

Latest lifetime follow-up reaches 14 differences at the exact 642-instruction
length. Carrying the cancellation selection through its cs store before
loading the link removes the unwanted v1 interference. Keeping the later
destination snapshot separate and decrementing the special cancellation link
in place avoids non-retail tail merging. Reusing root l for that snapshot
regresses to 87 differences/643 instructions and was rejected. All 41 calls
remain exact and OPTIONS is still 34/38. SYM is not solved: retail's l record
is in the language-loop scope, while the current source has a function-scope
l and extra destination scopes. Both that scope mismatch and the remaining
fourteen register differences must be resolved; no new PASS is claimed.

Follow-up restores the default link dispatch before the language case, retail
one-based menu comparisons, the death-first cancellation branch and l reuse
for the language loop and speed selection. An explicit link switch preserves
the language fall-through behavior. Current result is 59 differences at
641/642 instructions, with all 41 calls exact and OPTIONS still 34/38. Real
greg (build/rtl/options-8bap19sx) exposes l's conflict with v1; the current
allocation uses a0 where retail uses v1. Moving the loop initializer outside
the language branch does not fix this and was reverted. No new PASS claimed.

Retail confirms lcs is the selection before movement; the previous draft
overwrote it during movement and blank-row skipping, suppressing normal
navigation sounds. Restored that snapshot and the missing separate wrap rules
for main/game-over menus. The language marker is row NewLang+1, not NewLang;
its five-row clearing loop now follows retail indexing. The death/menu-range
checks are unsigned, preventing negative differences from selecting unrelated
menus. Restored owned DiabloDieFlag/they_pressed with their zero initial
values and retail's l local name. Input is read before indexing the key table.

Current result: 152 differences, 636 instructions versus 642 retail, down from
this turn's 364 differences / 604 instructions. All 41 calls match and OPTIONS
remains 34/38, including DrawOptions. Remaining work starts in confirmation/
link dispatch; retail uses move for repeated button tests and lays out the
non-language dispatch before the l==-2 language case. This is not a PASS and
does not increase the 2691/2727 board count.

### DrawOptions resolved: globals, branches and TASK layout

Qfromoptions, PadFrig and old_pad were extern-only despite retail ownership
in OPTIONS. Their typed definitions with original 0/false/-1 initial values
restore GP-relative accesses without regressing the 33 existing passes.
Explicit control/help selection stores, the retail controller-exit branch
order and one-based menu comparison eliminate the remaining scheduling and
branch differences. Replaced TASK's forward declaration with its real
92-byte scheduler layout, resolving the last parameter SYM mismatch.

Both byte lanes now match all 447 instructions and local branch targets;
exact SYM and all 63 calls pass. OPTIONS is 34/38 with all 38 call audits
passing, and all 150 tests remain green. No gate exceptions were added.
The completed full-board refresh confirms 2691/2727 (36 remaining).

### PRINTY complete native linkage

Explicitly initialized MediumFont and restored LFont's position before the
medium-font character table, matching all 2040 initialized-data bytes. The
original TextDat/CTextFileInfo inlines restore the gman.h and .tp/.dat pools;
the latter explain WHITER starting at odd address 0x8011ABD1, without invented
padding. Reordered independent CBlocks/CFont header declarations so deferred
inline methods occupy retail addresses. All 4400 text bytes, 34 readonly
bytes, 36 small-data bytes and the four-byte constructor pointer match, with
nineteen exact function records and 21 named global records. Original readonly
alignment bytes 04 00 remain scaffold-owned.

Production main-image linkage is byte-identical and its 120304-byte runtime
BSS verifies zero. All nineteen call audits and 150 tests pass. Source-linked
coverage reaches 859 functions / 76 TUs (730/44 native, 129/32 conventional).
The matching board remains 2690/2727.

### DrawFlask expression and packet-store probes

Baseline is 285 instructions with 74 differences and exact SYM. Staging the
height through BarY and expressing mirrored X offsets with ternaries changes
allocation broadly (283 instructions); reverting the staging still gives
132 differences. Moving u3 ahead of the tpage store alone increases the
baseline to 82 differences. Reversing height-addition operands or using an
unsigned margin leaves the original 74 differences. All trials were reverted;
no packet-store reordering or integer-type workaround was retained. The next
investigation needs the real CSE/scheduling dependency evidence rather than
these source spelling changes. The matching total remains 2690/2727.
Follow-up: combining boolean negation/masking before assigning xof produces
282 instructions and 77 differences. Staging only the height through BarY,
without changing the original flip logic, keeps 285 instructions but changes
allocation to 208 differences and loses HealthHeight's retail register. Both
were reverted. Retail has only the root lexical block, so adding scoped
temporary locals is not automatically compatible with the exact SYM gate.
Fresh baseline dumps: build/rtl/gpanel-_cnm_pfn (rtl) and gpanel-cgp1bh56 (cse).

Grouping follow-up (2026-10-02): unsigned casts and the equivalent nested
subtraction `height - (-8)` are folded back to the 285/74 baseline. A signed
short cast around `height + 8` does preserve retail's add-before-subtract
shape and reduces the raw difference count to 70, but emits two sign-extension
instructions per branch, grows to 289/285, and fails function length. The
existing-BarY two-step form retains 285 instructions but changes allocator
order broadly (208 differences). All forms were reverted.

Packet-order follow-up (2026-10-02): all 720 permutations of the six
independent y2/u2/y3/u3/code/tpage updates were compiled in isolated full-TU
copies and scored with the unchanged retail gate. Applying the same order to
both flask halves, `y2, y3, u2, u3, code, tpage`, is uniquely best at the
retail 285-instruction length and reduces 74 differences to 42. Exact SYM and
all eleven calls still pass; both byte lanes report the same remaining
source-order/register residue. The exhaustive result set is retained at
`build/drawflask_order_probe/results.json`. The winning order is retained in
live source. Reusing xof as the height-plus-eight temporary remains 42 but
puts the temporary in s0 instead of retail v0; splitting the final health X
offset and commuting both final additions regresses to 46. Those follow-ups
were reverted.

Expression follow-up: 810 combinations of ten equivalent BarY spellings,
nine health-xof forms and nine mana-xof forms were screened on top of the
winning packet order. `BarY = -(height + 8) + Y` is the only further retained
change: both branches now emit retail's `addiu height,8` followed by
`subu Y,temp`, reducing 42 differences to 34 while preserving 285/285,
exact SYM and all eleven calls. Results are in
`build/drawflask_expr_probe/results.json`. The best shorter result is 33
differences at 282 instructions and is not a match. All exact-length winners
bottom out at 34; combined and argument-local xof expressions change
temporaries but do not move the shared FlaskFlip stack store before the
boolean sequence. The remaining residue is now confined to that call-argument
dependency and operand/register order in the two mirrored-X calculations.

### CFont::Print resolved: unsigned lead bytes

The real greg dump identified kan as pseudo 96, with hard-register preferences
v1/a3 despite no call-crossing lifetime. Explicit pointer increments, reversed
OR, addition and a split shift did not help; a paired indexed load shortened
the function incorrectly. Casting the centre/right lead bytes to unsigned
char before shifting, together with the left-case c reuse below, reproduces
all 398 instructions, local branch targets and the complete SYM record set.
Both assemblers and all thirteen calls pass; PRINTY is now 19/19 with all call
audits passing. The isolated stock compiler ICEs on this function, so these
decisions were checked against the real compiler rather than stock traces.
All 150 tests pass. Source-linked coverage is unchanged by this matching fix.
The completed full-board refresh confirms 2690/2727 (37 remaining).

### CFont::Print left-justified Kanji byte reuse (superseded by the pass above)

Retail reuses the local c for the second byte and holds the unsigned first
byte in kan before combining the call argument. Restoring that source flow
reduces 62 differences to 44 at the same 398-instruction length, with all
thirteen calls exact. The unsigned-char conversion matters: replacing it
with c & 0xFF restores the worse signed-temporary allocation. Splitting the
centre/right branch shifts differently does not help and was not retained.
The remaining gate failure includes kan in v1 instead of retail v0 and
different transient registers in the other two justification branches.
PRINTY stays 18/19 and the board remains 2689/2727; this is not a new PASS.

### GLUE complete native linkage

Moving the display-flag definitions below the first format-string use restores
all 356 small-data bytes without padding or assembly edits. Reordered source
definitions to retail TU order and verified the original-assembler object at
retail addresses: 2876 text bytes, 972 initialized-data bytes, 62 readonly
bytes, 356 small-data bytes and 24 zero BSS bytes, with all 28 function records
and fourteen named globals. Two trailing readonly alignment bytes stay in
the scaffold. Production main-image linkage is byte-identical, and runtime
verification proves all 120304 BSS bytes zero with the separate checksum.
All GLUE function and call checks pass, along with 150 tests. Source linkage
reaches 840 functions / 75 TUs (711/43 native, 129/32 conventional); matching
remains 2689/2727. This resolves the pending layout noted below.

### GLUE remaining globals and header pool restored

Restored the real TextDat/CPlayer header declarations, GLUE filename literal,
weapon/class/armour lookups, and six static small-BSS globals in retail order.
The data verification command additionally proves the entire 62-byte readonly
pool and all six offsets within the 24-byte zero-initialized region. GLUE
remains 28/28 with exact SYM; all 150 tests pass. Const character lookup arrays
are needed to preserve FindPlayerChar's retail scheduling.

Native registration remains pending: in the current 356-byte small-data
section, DoShowPanel/DoDrawBg precede the format literal instead of following
it. Their source offsets are 332/336, while retail needs 340/344. The table,
string pool, JustLoadedPlayer/GameStarted and final character-array offsets
are already correct. Do not approve native linkage until the middle ordering
is restored and fully relocated text/data verification passes.

### GLUE PlayerInfo source-data ownership

Restored the real PInf fields (Tx, GameTex, TownTex, TwoPlayerTex) and its
81-entry initialized PlayerInfo table instead of an external scaffold import.
gen_glue_player_info.py decodes only retail data and validates all original
pointers, identifier lengths and padding. Its --verify mode checks the actual
compiler-emitted 972-byte table, all 81 R_MIPS_32 relocations and the complete
324-byte owned string pool against retail, without changing the object.
GLUE remains 28/28 with all calls verified. Final native GLUE integration is
still pending its other global declarations and header/string pool; this does
not yet increase the 812 source-linked-function count or the 2689/2727 board.

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

Follow-up after the Dialog pass-timing discovery: anonymous grouped expressions
for the final `plr[0]` mode access still fold to a direct symbolic load; the
compiler does not retain a base. Retail SYM also contains root local `wtime` in
v0, while the current two dead WorldToScr assignments emit no record. Adding
the natural `register` hint is codegen- and SYM-neutral and does not restore
either wtime or s7. The missing base and missing debug lifetime are therefore
coupled source-shape evidence, not merely pointer spelling.

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

### read_card_directory resolved from the original Climax twin

The complete source shape in `C:/Temp/ps1-decomp-refs/warcraft2/memcard.c`
resolved the last three diff lines. The decisive combination is a
declaration-initialized `dir`, one `int i, fh, r` declaration, assigning
`fh = open(...)` in the success condition, and testing `fh == -1 || r == -1`
in a separate following `if`. Earlier probes changed only subsets of this
shape and therefore changed register allocation or retained the redundant
`nor/beqz` pair.

The live Diablo body preserves its additional title conversion, `PantsDelay`,
and unusable-card dirty-slot handling. Maspsx and real ASPSX now match all 151
instructions, exact SYM passes, and all eleven ordered calls pass. MEMCARD is
16/16 and the full board is 2694/2727 with 33 remaining.

### Authentic SN32.3.7 revision screen for close near-misses

Both additional native Win32 revisions (`.0002` and `.0003`) reproduced the
then-live Build-0001 output exactly for eight close failures: DoCredits (4
diffs), BL_AsyncReadFile (4), read_card_directory (3), ResyncQuests (6), DrawSpeedBar
(6), DrawInvTSK (8), Dialog::Back (8), and MemcardPad (8). Instruction counts
and normalized differences are unchanged in every case. Together with the
earlier LoPlayFMVOverLay result, this rules out the locally available authentic
compiler revisions as solutions for these scheduling/CSE residues; no compiler
override or source change was retained.

### DoCredits four-line residue: late delay-slot selection, not allocation

An isolated real-CC1PLPSX run with `greg,sched2,jump2,dbr` now identifies the
remaining four-line difference precisely. With the live source order
`Fade -= 1; Mode = 2;`, RTL insns 415 and 418 remain in that order through
`jump2`; the delayed-branch pass then places insn 418 (`Mode = 2`) in the
unconditional jump's delay slot. Retail instead has `Mode = 2` before the
jump and the fade decrement in its delay slot.

Reversing the two source statements initially produces exactly that desired
RTL order through `sched2`, but `jump2` recognizes the decrement as identical
to the later case-2 decrement (insn 490), redirects the jump to that block and
deletes the local decrement. The result is 249 rather than 250 instructions.
The old frontend has no `-fno-crossjumping` option (it rejects the flag), and
`-fno-schedule-insns` broadly regresses the TU to 7/11. Therefore the next
source experiment must change the case-1/case-2 CFG so the two decrements are
not cross-jump candidates while still lowering to the same final instruction;
allocator or compiler-revision changes cannot address this residue. No live
source or compiler override was retained. The isolated stock FSF target is
not byte-identical to the SN compiler for this function, so its allocator trace
is explicitly unvalidated; the real PsyQ RTL dumps remain authoritative.

### DrawSpellCel frame-gap and ProcessItems spelling screens

`DrawSpellCel` retains its 184-byte frame versus retail's 216-byte frame under
all 24 permutations of the four initial `X/Y/SW/SH` assignments. The best four
orders remain the live 94-difference result; the others range from 116 to 172
differences. Both other available authentic SN32.3.7 revisions reproduce the
same 184-byte frame. A 32-byte volatile aggregate, tested in each relevant
nested scope and on both sides of `st`, does grow the frame but is allocated
below the already-correct outer slots, shifting them by 32 and producing 160
differences plus a named SYM record. The retail-only region from physical
`sp+0x78` through `sp+0xA4` is wholly unreferenced; only `st` at `sp+0xA8` is
used. This rules out a missing ordinary local and points to reserved/padding
state produced by a still-missing C++ source construct.

For `ProcessItems`, all 64 combinations of pointer spelling across the six
animation phases (frame update, map lookup, first sound, sound-table lookup,
second sound, final stores) were compiled and gated. The best unnamed form is
183 instructions/74 differences; none beats the saved reference form at
172/69. The reference form creates the desired retained item base in `s0`, but
also emits a non-retail reference record and changes allocation (`i` moves to
`s2`, while the frame snapshot takes `s3`). Reconstructing the retail load
order with named const frame/x/y snapshots gives 194/113; x/y optimize out of
SYM, but the call-crossing frame remains a named record. An implementation-
reserved `__anim` name is still emitted by this GCC and does not solve the SYM
gate. No live source change was retained. The remaining source-shape problem is
to create the anonymous `s0` base and call-crossing `s1` frame snapshot while
letting the original `ii` die in `a1`, without a source-visible pointer or
frame record.

### MemcardPad resolved: asynchronous accesses and structured control flow

`MemcardPad` now matches all 585 instructions through both maspsx and real
ASPSX, and all 33 ordered calls remain exact. Retail stores 10 to
`save_blocks`, loads `DiabloGameFile` once, reloads `save_blocks`, stores that
same filename value to `Savefilename`, and calls `GetSaveStatusMessage` with a
nop delay slot. The live source previously let cc1plus constant-forward 10 and
hoist the filename load, producing 583 instructions. Treating only the
asynchronously owned count store/read and filename load as volatile recreates
the exact sequence without a helper local or post-cc1 intervention.

The remaining SYM mismatch was entirely structural. Replacing direct-return
gotos with `return`, duplicating the two activation/error tails, and replacing
the switch join gotos with `break` lets GCC cross-jump them back to the same
retail blocks without source LABEL records. The outer alert/normal dispatch is
now structured as the JAP block map requires: root block to `+0x908`, nested
blocks `+0x90..+0x824` and `+0xCC..+0x74C`, with `lcs` as the only inner local.
Removing draft-only `n`, `link`, `oldcmenu`, and `oldcs` restores the exact
record stream while direct global handoff stores keep identical instructions.
Both byte lanes, exact SYM, and all 33 calls pass. OPTIONS reaches 36/38 and the
full board reaches 2695/2727 with 32 entries remaining.

### DrawInvTSK and PrintCDWaitTask allocation follow-up

The retail DrawInvTSK decompile confirms the semantic initialization order is
`omp = myplr; osel = sel_data`, even though the live reversed statements are
what retain retail's `omp=s6`, `osel=s7` allocation. Direct natural order,
declaration initializers, a combined comma expression, `const`, and `register`
storage spellings all swap the two locals (`omp=s7`, `osel=s6`) and introduce
four tail-store differences. Reversing the two restore statements repairs the
tail but not the allocation or SYM. No live source change was retained.

For PrintCDWaitTask, a volatile typed view reaches the retail 79-instruction
length and gives CDGfxData its correct `s4`, but it still folds the `plr[1]`
address to a symbolic load and introduces a call-crossing boolean, shifting
`cdy` from `s1` to `s2`. Pointer-to-member access and reusing either the unused
TASK parameter or the existing Ft4 local are rematerialized back to the
76-instruction baseline. Thus the remaining lever is specifically an anonymous
mutable pointer lifetime: the known named-pointer form creates the desired
`s3 + 6632` access, but its debug record and `s3/s4` swap remain unacceptable.

Unused-parameter follow-up (2026-10-02): assigning the incoming `TASK *T` to
the player-array base before the loop reaches retail's exact 79-instruction
length and creates the base-plus-6632 access, reducing 17 differences to 12.
It is rejected because base and CDGfxData take s4/s3 in reverse and T's SYM
location changes from incoming a0 to s4. Assigning T inside the CDWAIT block or
in the cdx initializer optimizes back to the 76-instruction baseline; assigning
it in the final short-circuit operand keeps 79 instructions but perturbs the
BOOL branches and cdx/cdy allocation (32 differences). This proves the unused
parameter cannot legally own the anonymous base while preserving exact SYM.

Anonymous-address follow-up: sixteen array, pointer-to-array, commuted-index,
member-address and byte-offset spellings were screened, including the natural
`&plr[0].plractive + sizeof(PlayerStruct)` grouping and late-combine identities
for the 29-byte member offset. Every form folds to the same direct symbolic
load and 76/79, seventeen-difference baseline. Results are under
`build/cdwait_address_probe`; a real retained lifetime rather than expression
syntax is required to produce retail's unnamed s3 base.

### Two-diff FMV and Resync source-shape follow-up

`set_mdec_img_buffer` remains at 13 instructions / two normalized differences
after exact-SYM `register` declarations and an anonymous-union `tsz` member.
Writing through a second anonymous-union member still CSEs `i` to literal zero
and additionally emits the alias member in SYM. These forms do not preserve the
retail `a2 -> a1` copy.

Pass-timing follow-up: 41 algebraic identity spellings of `i = tsz` were
screened, including double negation/complement, paired add/subtract, casts,
bitwise identities, conditionals and multiply-by-minus-one. Every form folds
during early CSE and retains the same 13-instruction/two-difference baseline.
The exact Climax `int i, tsz=0; for (i=0; ...)` source instead constant-folds
the accumulated return, emits only twelve instructions, and fails SYM length.
Chained `i = tsz = 0` also retains two literal-zero moves. Results are under
`build/mdec_identity_probe`; live FMV source remains unchanged.

For LoPlayFMVOverLay, both the direct retail-order swap and
`user_start = (fade = 1, user_quit)` produce the same 273-instruction
`s4/s5` allocation regression. Using independent literal-one assignments also
canonicalizes to that result; the retail standalone `v0 = 1` is not recovered.
The live 274-instruction/two-difference order remains the closest form.

Twenty-three equivalent constant-one spellings for the first fade assignment,
including `~(-2)`, `-~0` and expressions based on the already-true user_quit,
all retain the same 274-instruction/two-difference order. The result set is at
`build/fmv_fade_identity_probe`; no source change was retained.

ResyncQuests is unchanged at 315 instructions / six prologue-order differences
when the gold source's unused `x/y` locals are restored, whether grouped with
`i/tren` or declared separately. A pre-call cached banner-quest pointer grows
the frame to 64, adds an `s1` local and 27 differences. The residue is therefore
not explained by omitted gold declarations or an early quest pointer cache.

Twenty-three equivalent spellings of the initial Q_LTBANNER value 7 likewise
fold before scheduling and retain the same prologue order. Results are under
`build/resync_constant_probe`; the callee-save/argument delay-slot residue is
not an arithmetic-constant pass-timing issue.

For BL_AsyncReadFile, twenty-two late-combine identity wrappers around
`getasyncreadstatus(ah)` all retain 88 instructions and the same four ordering
differences. Results are under `build/async_identity_probe`; the status-result
copy remains before the sleep argument load in every form.

### DrawDurThingy loop body resolved; frame reservation remains

Hoisting `const short DurY = (short)(Y - 1)` before the durability loop and
using it for all four loop Y coordinates restores retail's `$fp = Y - 1`
temporary. The function grows from 178 to the correct 179 instructions, and
every non-frame instruction now aligns; the diff falls from 49 to 48 and all
three calls remain exact. The only remaining mismatch is the frame header and
all stack-relative save/restore/argument offsets: ours is 80 bytes, retail 88.

An unused `RECT R` proves the missing reservation is exactly eight bytes: it
produces the retail 88-byte frame and leaves only the `$fp` initialization
order mismatch, but emits a non-retail AUTO `R` record. Constant-size
`__builtin_alloca(8)` is not equivalent: it turns `$fp` into the ABI frame
pointer and adds dynamic-stack instructions. `register RECT R` still emits the
same AUTO record, while a const reference bound to `RECT()` invokes aggregate
initialization and grows the function to 181 instructions. The retained source
keeps the correct loop body and exact SYM variable set; the next lever must
create an unnamed eight-byte compiler temporary rather than a named local,
reference, or alloca.

Further follow-up: widening the DurY expression through `long long` folds back
to the same 80-byte frame. A block-local GNU `__label__` does reserve exactly
eight bytes and produces the 88-byte/179-instruction shape with only the `$fp`
initialization order left, but it also makes DurY source-visible in SYM and has
no original-source justification; it was rejected. Moving DurY inside the
positive-durability block grows to 180 instructions and restores the unwanted
early return constant. The retained outer const remains the closest natural
form.

Unnamed-aggregate follow-up: standalone `RECT()` reserves compiler-owned
temporary storage but emits two initialization instructions, improving the
frame-only 48 differences to 24 while growing to 181/179. Copying MsgRect into
the temporary emits three instructions (182/179), and conditional aggregate
temporaries grow to 185-186 instructions. Unnamed lvalue casts, references and
sizeof expressions optimize away and retain the 80-byte frame. Results are
under `build/durthingy_temp_probe`; none satisfies both bytes and SYM, so live
source is unchanged.

DoCredits case-label follow-up: adding a semantics-neutral `case 3` at the
case-1 break join does not survive `jump2`; the pass still redirects to the
case-2 decrement and deletes the local decrement, leaving 249 instructions.

Decrement-spelling follow-up: all 400 pairs drawn from twenty equivalent
case-1/case-2 decrement expressions were compiled with case 1 in retail source
order (`Mode = 2` before the decrement). Prefix/postfix decrement, compound
assignment, direct subtraction, commuted addition, casts, bitwise identities,
and reuse of the existing constant `one` all canonicalize before `jump2` and
produce the same 249/250 cross-jumped result (or worse). Results are retained
at `build/credits_decrement_probe/results.json`. No live Credits source was
changed. The remaining lever is therefore CFG ownership that keeps the two
decrements distinct through late jump optimization, not arithmetic spelling,
allocation, assembler version, or delay-slot filling.

CFG follow-up (2026-10-02): all six textual orders of switch cases 0/1/2 were
compiled. Only 0/1/2 retains the 250-instruction four-difference baseline;
four orders produce 36 differences and the two case-2-first orders cross-jump
to 249 instructions with 73 differences. Giving case 2's decrement an empty
conditional or an explicit user label still lets `jump2` merge the common
tail when case 1 is written in retail order. Results are under
`build/credits_case_order_probe`; live source remains the four-difference
reversed-assignment form.

### SPLTARGT native-lane conversion

Moved SPLTARGT's seventeen already-passing spell-target/gamepad functions and
48-byte private `AutoTargetSpells` table from conventional to native ownership.
Native verification proves all 4,652 text bytes, all seventeen function SYM
records, the initialized table, and 36 external bindings. Its unused read-only
literal remains scaffold-owned. Coverage stays 1,153 functions / 91 TUs, now
split as 1,134/90 native and 19/1 conventional. PRIMPOOL remains conventional
because native ASPSX does not reproduce its required packed BSS layout. The
board remains 2693/2727.

### PCIO and DATIO native-lane conversions

Moved both seven-function file backends from conventional to native ownership.
PCIO supplies 1,380 text bytes and 104 relocated read-only bytes; DATIO supplies
1,276 text bytes and 88 relocated read-only bytes. Native verification proves
all fourteen function SYM records and each backend's fourteen external SDK/
base-class bindings. Neither TU owns writable or BSS storage. Coverage stays
1,153 functions / 91 TUs, now split as 1,117/89 native and 36/2 conventional.
The board remains 2693/2727.

### VERSION native-lane conversion

Moved VERSION's three already-passing functions, 120-byte mutable
`MyVerString` array, and 24-byte format string from conventional to native
ownership. Native verification proves all 124 text bytes, all three function
SYM records, the array's global type/address, and the three external bindings.
The large codeword prefix and compile-date suffix remain scaffold-owned.
Coverage stays 1,153 functions / 91 TUs, now split as 1,103/87 native and
50/4 conventional. The board remains 2693/2727.

### INTERFAC and COREAUTO native-lane conversions

Moved both two-function TUs from conventional to native ownership. INTERFAC
now supplies 988 text bytes plus its 72-byte diagnostic-string/dispatch-table
pool with 23 external bindings. COREAUTO supplies 1,316 text bytes and both
relocated jump tables (68 bytes) with three external bindings. Native
verification proves all four function SYM records and both pools. Their
separate 16-byte GMAN prefixes remain scaffold-owned, as does COREAUTO's
initialized data fragment. Coverage stays 1,153 functions / 91 TUs, now split
as 1,100/86 native and 53/5 conventional. The board remains 2693/2727.

### SPELLS native-lane conversion

Moved SPELLS's six already-passing functions and relocated five-entry dispatch
table from conventional to native ownership. Native verification proves all
3,264 text bytes, the complete 20-byte read-only table, six function SYM
records, and 35 external bindings. The preceding 40 bytes of unused GMAN/
CPlayer header literals remain scaffold-owned. Coverage stays 1,153 functions
/ 91 TUs, now split as 1,096/84 native and 57/7 conventional. The board
remains 2693/2727.

### COREMON native-lane conversion

Moved COREMON's seventeen already-passing monster utility functions from
conventional to native text ownership. Native verification proves the complete
5,760-byte text section, all seventeen function SYM records, and nineteen
external bindings. Its unused literal remains scaffold-owned. Coverage stays
1,153 functions / 91 TUs, now split as 1,090/83 native and 63/8 conventional.
The board remains 2693/2727.

### PAK native-lane conversion

Moved PAK's four already-passing block pack/unpack functions from conventional
to native text ownership. Native verification proves the complete 1,008-byte
text section, all four function SYM records, and the `memcmp`/`memcpy`
relocations. The TU has no data sections. Coverage stays 1,153 functions / 91
TUs, now split as 1,073/82 native and 80/9 conventional. The board remains
2693/2727.

### ASYNC native-lane conversion

Moved ASYNC's six already-passing streamed-audio helpers from conventional to
native text ownership. Native verification proves all 708 text bytes, six
function SYM records, and eight external bindings. The TU has no owned data;
its unused literal remains scaffold-owned. Coverage stays 1,153 functions /
91 TUs, now split as 1,069/81 native and 84/10 conventional. The board remains
2693/2727.

### TIMS native-lane conversion

Moved TIMS's three already-passing functions from conventional to native text
ownership: the two file-static TUTILS.H texture-page helpers and empty
`TimSwann`. Native verification proves the complete 48-byte text section and
all three SYM records; the TU has no relocations or source-owned data. Its
unused literal remains scaffold-owned. Coverage stays 1,153 functions / 91
TUs, now split as 1,063/80 native and 90/11 conventional. The board remains
2693/2727.

### SCROLLRT native-lane conversion

Moved SCROLLRT's two already-passing frame-overlay functions from conventional
to native text ownership. Native verification proves all 648 text bytes, both
function SYM records, and 23 external bindings. Its unused header literal
remains explicitly scaffold-owned. Coverage stays 1,153 functions / 91 TUs,
now split as 1,060/79 native and 93/12 conventional. The board remains
2693/2727.

### ITEMDAT native-lane conversion

Moved ITEMDAT's already-passing `InitAllItemsUseable` from conventional to
native text ownership. Native verification proves its complete 56-byte text
slice, function SYM record, and relocations to `AllItemsList` and
`AllItemsUseable`. The initialized item tables and read-only pool remain
explicitly scaffold-owned. Coverage remains 1,153 functions / 91 TUs, now
split as 1,058/78 native and 95/13 conventional. The board remains 2693/2727.

### MISDAT native-lane conversion

Moved MISDAT's two already-passing empty missile hooks from conventional to
native text ownership. Native verification proves the complete contiguous
16-byte text slice and both function SYM records; the TU has no relocations or
source-owned data. The initialized missile tables and read-only table remain
explicitly scaffold-owned. Coverage remains 1,153 functions / 91 TUs, now
split as 1,057/77 native and 96/14 conventional. The board remains 2693/2727.

### LoPlayFMVOverLay assignment-order allocator probe

The remaining maspsx mismatch is only the order of `fade = 1` and the
`user_start` store: 274 instructions and exact SYM. Moving the fade assignment
first produces that local order, but it is not a fix: the function drops to
273 instructions, swaps `start_time`/`fade` between s4 and s5, grows to 27
normalized differences, and loses exact function length.

The 9cc6504 allocator lane localizes the coupling. In the baseline, pseudo 75
(`start_time`) has 9 refs / 182 live / 39 calls (priority 1483, s4), while
pseudo 77 (`fade`) has 7 / 178 / 39 (priority 786, s5). Reordering raises
`fade` to 9 / 179 / 39 (1508), just ahead of `start_time` at 9 / 181 / 39
(1491), so the register swap is expected; the real compiler output confirms
the final picks. Reports are `build/probes/a-i5feow1t` (baseline) and
`build/probes/a-0qeasw38` (reordered). Stock differs from the SN compiler for
this function, so the traces remain diagnostic rather than a seal.

Both other available authentic SN32.3.7 revisions (`.0002` and `.0003`)
reproduce the same 274-instruction/two-line ordering residue with exact SYM.
The PsyQ 4.1 compiler changes the embedded language jump-table layout and is
not a valid substitute. The mismatch is therefore not resolved by selecting
another locally available retail compiler build.

Chained assignment forms reproduce either the two-difference baseline or the
same 273-instruction regression. A conditional assignment that explicitly
preserves `start_time` on the false path grows to 275 instructions and 47
differences. The exact Warcraft II combined declaration plus its `fade = 1;
user_quit = 1` order also gives the 273-instruction/27-difference register
swap once Diablo's `user_start` store is included. No FMV source change was
retained.

Predicate-lifetime follow-up: assigning the short-circuit pad predicate to
`user_quit` before the branch preserves 274 instructions and fixes the
fade-before-store order, but maps `user_quit` to predicate register s0 and
stores s0 directly. It leaves four byte diff lines and fails retail's v0 SYM
record. Explicitly normalizing `user_quit = 1` inside the branch, or storing a
literal one, reintroduces the 273-instruction s4/s5 allocator swap. Making the
post-store fade assignment conditional compiles identically to the live
two-difference baseline. All forms were reverted.

### PREMSG native-lane conversion

Moved PREMSG's three already-passing multiplayer-delta helpers from
conventional to native ownership. Restored the original unused GMAN
DumpDatFile inline and its fourteen-byte main-image literal; two following
alignment bytes remain scaffold. Native verification proves all 2,544
pregame text bytes, all three function SYM records, the cross-image literal
and all 39 external bindings. Both complete main/pregame image comparisons
pass byte-for-byte.

Coverage remains 1,153 functions / 91 TUs, now split as 1,055/76 native and
98/15 conventional. The board remains 2693/2727.

### PREMISS native-lane conversion

Moved PREMISS's single already-passing InitMissiles overlay function from
conventional to native ownership. Restored the original unused GMAN/CPlayer
header inlines and their 33 main-image source bytes; three following alignment
bytes remain scaffold. Native verification proves all 464 pregame text bytes,
the cross-image pool, function SYM record and eight bindings. Its one-call
audit, all 166 tests, and both complete main/pregame comparisons pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,052/75 native and
101/16 conventional. The board remains 2693/2727.

### PRESTORE native-lane conversion

Moved PRESTORE's two already-passing store initialization functions from
conventional to native ownership. Restored the original unused GMAN/CPlayer
header inlines and their 33 source-owned main-image bytes; three following
alignment bytes remain scaffold. Native verification proves all 760 pregame
text bytes, both SYM records, the cross-image header pool and 21 external
bindings. Function/call audits, all 166 tests and both complete main/pregame
image comparisons pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,051/74 native and
102/17 conventional. The board remains 2693/2727.

### PREPORT native-lane conversion

Moved PREPORT's single already-passing InitPortals overlay function from
conventional to native ownership. Restored the unused original GMAN
DumpDatFile inline and its fourteen-byte main-image literal; two following
alignment bytes remain scaffold behind an explicit boundary. Native verification
proves all 96 pregame text bytes, the function SYM record, delta_portal_inited
and portal bindings, and the cross-image literal. The one-call audit, all 166
tests, and both complete main/pregame comparisons pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,049/73 native and
104/18 conventional. The board remains 2693/2727.

### PREINV native-lane conversion

Moved PREINV's single already-passing InitInv overlay function from
conventional to native ownership. Restored the original unused GMAN/CPlayer
header inlines and their 33 source-owned filename bytes, with the following
three alignment bytes kept in scaffold. Native verification proves all 84
pregame text bytes, the main-image header pool, the function SYM record and
seven external bindings. Its one-call audit, all 166 tests, and both complete
main/pregame image comparisons pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,048/72 native and
105/19 conventional. The board remains 2693/2727.

### COREFMV native-lane conversion

Moved COREFMV's two already-passing movie entry points and full data payload
from conventional to native ownership. Restored the unused GMAN DumpDatFile
inline's filename literal and merged the former prefix/source read-only
fragments into the original complete 148-byte scaffold.

Native verification proves all 664 text bytes, the 48-byte FmvTab with six
movie-name relocations, 148 read-only bytes including all movie names and the
five-entry overlay reload switch table, both function SYM records and thirteen
external bindings. Function/call audits, all 166 tests and the complete main
image comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,047/71 native and
106/20 conventional. The board remains 2693/2727.

### COREINV native-lane conversion

Moved COREINV's single already-passing FindGetItem function from conventional
to native ownership. Restored its unused original GMAN/CPlayer header inlines
and their 33 source-owned filename bytes. An explicit boundary preserves three
following scaffold alignment bytes. Native verification proves all 180 text
bytes, the complete header pool, the function SYM record and its item,
itemactive and numitems bindings. The no-call audit, all 166 tests and the full
main-image comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,045/70 native and
108/21 conventional. The board remains 2693/2727.

### MONSVIEW native-lane conversion

Moved MONSVIEW's single empty, already-passing debug viewer from conventional
to native ownership. Restored the unused original GMAN DumpDatFile inline so
its filename literal is source-emitted. Native verification proves all eight
text bytes, fourteen read-only bytes and the function SYM record; the two
trailing alignment bytes remain scaffold. Its no-call audit, all 166 tests
and the full main-image comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,044/69 native and
109/22 conventional. The board remains 2693/2727.

### GAMEONLY native-lane conversion

Moved the game overlay's single empty presence-probe function from conventional
to native ownership. The TU owns exactly eight text bytes and no data, literals,
relocations or bindings. Native code and its function SYM record match retail;
the no-call audit, all 166 tests and the full 172,584-byte GAME.BIN comparison
pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,043/68 native and
110/23 conventional. The board remains 2693/2727.

### GAMEMENU native-lane conversion

Moved the single empty, already-passing PSX gamemenu_off stub from conventional
to native ownership. Restored the unused GMAN/CPlayer header inlines so their
two retail filename literals are source-emitted. Native verification proves
all eight text bytes, 33 source-owned read-only bytes and the function SYM
record. An explicit label boundary preserves the following three scaffold
alignment bytes. Its no-call audit, all 166 tests and the complete main-image
comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,042/67 native and
111/24 conventional. The board remains 2693/2727.

### TESTCODE native-lane conversion

Moved TESTCODE's two already-passing direct-start debug entry points from
conventional to native ownership. The TU owns exactly 96 text bytes and no
data or read-only payload. Native code, both function SYM records and all four
external bindings match retail. Both call audits, all 166 tests and the full
1,099,272-byte main-image comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,041/66 native and
112/25 conventional. The board remains 2693/2727.

### STORM native-lane conversion

Moved STORM's two already-passing C-linkage memory wrappers from conventional
to native ownership. The unit owns exactly 64 text bytes, has no data or
read-only payload, and binds only Tmalloc/Tfree. Native code and both function
SYM records match retail; both call audits, all 166 tests and the full
1,099,272-byte main-image comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,039/65 native and
114/26 conventional. The board remains 2693/2727.

### MEM native-lane conversion

Moved MEM's two already-passing wrappers from conventional to native ownership
and restored its two 40-byte MEM_INIT_INFO descriptors. Each record has its
retail RAM label, alignment four and relocated SlowMemMove callback. Declaring
the two labels const places their 21 source bytes in the retail read-only
section; mutable arrays incorrectly grew initialized data to 104 bytes and were
rejected. A final scaffold-word split preserves three trailing non-source bytes.

Native verification proves all 40 text bytes, 80 initialized-data bytes with
four relocations, 21 read-only bytes, both function SYM records and both static
descriptor records/addresses. Function/call audits, all 166 tests and the full
1,099,272-byte main-image comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,037/64 native and
116/27 conventional. The board remains 2693/2727.

### LZNP native-lane conversion

Moved LZNP's single already-passing decoder from conventional to native
ownership. The TU owns exactly 212 text bytes and no data, literals,
relocations or external bindings. Native code and its one function SYM record
match retail; its no-call audit, all 166 tests and the complete 1,099,272-byte
main-image comparison pass.

Coverage remains 1,153 functions / 91 TUs, now split as 1,035/63 native and
118/28 conventional. The function board remains 2693/2727.

### LAMBO native-lane conversion

Moved LAMBO's two empty, already-passing scratch functions from conventional
to native ownership. Restored the unused GMAN DumpDatFile inline's filename
literal and split the final scaffold word so its two trailing alignment bytes
remain original scaffold. Native verification proves all 16 text bytes, the
14 source-owned read-only bytes and both function SYM records. Both call audits,
all 166 tests and the complete 1,099,272-byte main-image comparison pass.

Coverage stays 1,153 functions / 91 TUs, now split as 1,034/62 native and
119/29 conventional. The board remains 2693/2727.

### MLIST native-lane conversion

Moved MLIST's five already-passing functions and both 16-byte list-selection
arrays from conventional to native ownership. Restored the unused original
GMAN DumpDatFile inline's filename literal, merged its two read-only scaffold
fragments into a bounded 33-byte source pool, and left the final three alignment
bytes scaffold-owned. Native verification proves all 1,008 text bytes, 32 data
bytes, five function SYM records, two global records/placements and twelve
external bindings. All five function/call audits and 166 tests pass; the full
1,099,272-byte main image remains exact.

Coverage stays 1,153 functions / 91 TUs, now split as 1,032/61 native and
121/30 conventional. No function-board increase is claimed.

### ATTRACT native-lane conversion

Moved ATTRACT's three already-passing functions from the conventional lane to
native ASPSX/PSYLINK ownership. Restored the original unused GMAN DumpDatFile
inline's diagnostic string without importing unrelated header literals. The
two formerly separate read-only fragments are now one exact 44-byte native
pool; the obsolete conventional data binding was removed.

Native verification proves all 424 text bytes, both read-only strings, all
three function SYM records and fourteen external bindings. Standard function
and call audits stay 3/3, all 166 tests pass, and the final 1,099,272-byte
main image remains exact. Coverage is unchanged at 1,153 functions / 91 TUs,
but the split is now 1,027/60 native and 126/31 conventional.

### LOADING native integration

Restored the real TextDat layout/destructor declaration, TASK bitfields and
original GMAN/CPlayer/CTextFileInfo literals. Reordered the deferred Dialog
helpers without modifying their bodies, kept CScreen's destructor implicit
to preserve its block-free SYM, and emitted the file-static POLY_G4 primitive
helper before the initialization thunks at its retail address. Its top-level
STAT declaration was checked explicitly, not only its function body.

Native validation caught and fixed BootScreen's incorrect zero initializer:
retail starts it true. All 2,784 text bytes, 124 CScreen data bytes, 100
read-only bytes, 32 small-data bytes, four naturally allocated small-BSS
bytes and both constructor/destructor pointers now match. All nineteen
function SYM and eight named global records/placements pass, as do all
nineteen ordinary function/call checks and 166 tests. The shared TextDat
header's existing native consumers are also recompiled and checked.
The completed main-image rebuild matches all 1,099,272 retail bytes. Receipts
confirm 1,024 native functions / 59 TUs, giving 1,153 source-linked functions /
91 TUs overall. The function PASS board remains 2693/2727.

### SETMAPS native integration

Restored the GMAN/CTextFileInfo header pool and the seven transition arrays'
retail file-static linkage. The arrays remain writable as in the original
data/small-data placement; corrected a stale comment claiming they were const.
Native verification proves all 1,836 pregame text bytes, 104 initialized-data
bytes, 404 read-only bytes including filenames and switch targets, 36 small-
data bytes, six function SYM records and all seven array records/addresses.
All six ordinary function and call audits pass, and all 166 tests pass.
The final main and pregame images match all 1,099,272 and 171,468 retail
bytes respectively. Receipts confirm 1,005 native functions / 58 TUs, or
1,134 source-linked functions / 90 TUs overall. The board remains 2693/2727.

### CHOOSEM native integration

Restored MgToText's 34 initialized monster-name pointers and literals, replacing
the uninitialized declaration. Restored the original BOOL type of
DoUiForChooseMonster (initial value one) and the GMAN/CTextFileInfo header
pools. Native verification proves all 1,492 pregame text bytes, 136 main-image
data bytes with all 34 relocations, 216 read-only bytes including the
fourteen-entry quest dispatch table, 232 small-data bytes and both global
SYM records/placements. All eight function SYM and call checks pass; all
166 tests pass. A scaffold label boundary after FIREM exposes the following
flag without changing its bytes or losing alignment padding.
The completed main and pregame rebuilds match all 1,099,272 and 171,468
retail bytes respectively. Receipts confirm 999 native functions / 57 TUs,
or 1,128 source-linked functions / 89 TUs overall. The board remains 2693/2727.

### LOADSAVE data preparation

Native integration follow-up: reordered all 23 function definitions by
retail address and supplied the missing LoadOptions prototype before its
first call. Without that prototype, the old compiler introduced an implicit
unmangled call and extra debug scopes; no checker was weakened to admit it.
All 23 function/SYM and call checks pass after the correction.

Native verification covers 5,332 frontend text bytes, 812 main-image data
bytes, 49 source-owned read-only bytes, 28 small-data bytes and four small-BSS
bytes, plus all eight named data records/placements. The unused trailing
DIABLO-OPTIONS literal and intervening alignment remain original scaffold;
no fake source use was introduced. The completed final-image rebuild verifies
all 1,099,272 main-image bytes and 143,924 frontend-overlay bytes against
retail. All 166 tests pass. Receipts confirm 991 native functions / 56 TUs,
or 1,120 source-linked functions / 88 TUs overall. The board remains 2693/2727.

Earlier data preparation:

Restored the retail named writable Shift-JIS arrays DiabloStr[11],
SaveCharName[19] and OptSaveName[11], replacing anonymous literals in the
title accessors and save-title formatting calls. Restored initialized
IconBuffer[768] and the zero-initialized dirty-video globals after the format
pool. Original GMAN/CPlayer/CTextFileInfo inlines restore the header literals.
Independent compiled-symbol gates verify all three strings and the icon
buffer, including exact SDB extents and no overlapping relocations. All
23 ordinary function/SYM and call checks still pass; all 166 tests pass.

No native registration or linkage-count increase yet: function order and
absolute data/overlay placement still need verification. Retail also retains
an unused `DIABLO-OPTIONS` literal after the compiled read-only pool; its
source provenance is not established and no artificial use was added.
The old source banner incorrectly claiming thirteen routines were absent
was corrected; their implementations were already present.

### COMPMAP native integration

Restored the original unused GMAN inline's filename literal. The compiler's
two allocation labels (`DL`, `DECB`) occupy nine source-owned small-data
bytes at 8011BCBC. Exact scaffold-word splits expose their final null byte
and the final source-filename null byte without changing or discarding the
following original padding. This TU owns no persistent global objects; its
map state is held in instances allocated by callers.

Native verification covers all 3,028 text bytes, 55 read-only bytes, nine
small-data bytes and all twenty function SYM records, including constructors,
destructors and deferred header copies. Whole-TU relocation and ordinary
function/call checks pass 20/20; all 166 tests pass. No compiler/gate changes.
The completed main-image rebuild matches all 1,099,272 retail bytes. Receipts
confirm 968 native functions / 55 TUs, or 1,097 source-linked functions /
87 TUs overall. The matching board remains 2693/2727.

### PADS integration details

Replaced the broad reconstructed GMAN include with the original focused
TextDat/CTextFileInfo definitions. This removes unrelated primpool.h/.hdr
literals while retaining retail's gman.h and .tp/.dat pool. No controller
logic or compiler settings changed.

Native verification covers all 1,920 text bytes, 1,444 initialized-data
bytes (both CPad objects, both raw controller buffers and the demo buffer),
56 read-only bytes, 32 small-data bytes and the constructor-table pointer.
All fifteen function SYM records and ten named data records/placements match.
The ordinary function/call checks remain 15/15 and all 166 tests pass.
PAD_Open's separately reconstructed startup copy is not counted again here.
The final main-image rebuild matches all 1,099,272 retail bytes. Receipts
confirm 948 native functions / 54 TUs, giving 1,077 source-linked functions /
86 TUs overall. The function PASS board remains 2693/2727.

### PSXHELP native integration

Restored HelpList as 25 typed HelpStruct records (300 bytes), verified by
the independent compiled-data gate. Restored GMAN/CPlayer/CTextFileInfo
header literals, helpflag=0, and displayinghelp=0 after the extension/format
strings while preserving the original DrawHelp-named initializer thunks.
Reordered the deferred CPad/Dialog/CBlocks definitions to reproduce the exact
retail helper addresses, without altering their instructions.

ASPSX 2.67 naturally packs HelpTop/help_select_line after HelpRect into the
retail ten-byte small-BSS extent; 2.56 incorrectly separates the bytes. Both
Dialog objects (local txtBack and global HelpBack) own 32 BSS bytes starting
at 80121C78. Native verification proves 3,420 text bytes, 300 initialized-data
bytes, 47 read-only bytes, 40 small-data bytes, both BSS extents and the
constructor/destructor pointers. All eighteen function SYM records and eight
named data records/placements match, with 18/18 ordinary function/call audits
and all 166 tests passing. Unowned alignment bytes remain scaffold.
The final main-image rebuild matches all 1,099,272 retail bytes. Receipts now
confirm 933 native functions / 53 TUs, or 1,062 source-linked functions /
85 TUs overall. The function board remains 2693/2727, with 34 non-PASS entries.

### MULTI integration details

Replaced NetInit's artificial `if (0)`/dummy scope with the original PC
single-player provider branch and dwID declaration, omitting the Storm-only
operations absent from PSX. This inferred PSX adaptation preserves all 164
NetInit instructions and exact debug scopes; it does not claim recovery of
the original PSX source text. Restored the GMAN header pool, gszVersionNumber
as the retail five-byte `NULL` string, and seven initialized state bytes.
Restored the complete 32,008-byte TMegaPkt type for its global pointer SYM.

Native BSS with ASPSX 2.56 was 52 bytes, placing sgGameInitInfo four bytes
early. ASPSX 2.67 naturally produces retail's 56 bytes and exact addresses,
without source padding or relaxed extents. Its selection is explicit in the
registry and its binary hash is captured by the existing receipt mechanism.
All 1,244 text bytes, 14 read-only bytes, 12 small-data bytes, 56 small-BSS
bytes, five function SYM records and nineteen data records/placements match.
Ordinary function and call audits remain 5/5; all 166 tests pass.
The completed main-image rebuild matches all 1,099,272 retail bytes. Receipts
confirm 915 native functions / 52 TUs, giving 1,044 source-linked functions /
84 TUs overall. The matching board remains 2693/2727.

### TOWNERS integration details

Native integration follow-up: restored GMAN/CTextFileInfo header literals,
the retail initialized small-data order, snLastCowSFX=-1 and the const cow
sound table (also const in gold PC source). CowSFX now follows PlrHasItem at
its original text address. Exact native relocation exposed seven off-by-one
_pLvlVisited reads in TalkToTowner, formerly hidden by immediate/address
normalization. Retail accesses levels 1, 2/4, 3, 4, 9 and 1 in those tests;
the source is corrected. Gold confirms the king/banner/rock/anvil levels;
retail remains authoritative for PSX-specific greeting tests.

All 12,204 text bytes, 4,828 initialized-data bytes, 368 read-only bytes
(including sound data and the ten-way NPC switch table), 32 small-data bytes,
eight BSS bytes, 33 function SYM records and eighteen named data records/
placements now pass native verification. Ordinary function/call audits remain
33/33, and all 166 tests pass. No instruction patching or gate changes.
The main-image rebuild matches all 1,099,272 retail bytes. Receipts confirm
910 native functions / 51 TUs, or 1,039 source-linked functions / 83 TUs
including the conventional lane. The board remains 2693/2727.

Earlier source-data preparation:

`tools/gen_towner_tables.py` reconstructs seven arrays (1,692 bytes) from
original Hellfire TOWNERS.CPP and its PLAYER.H/TEXTDAT.H constants. Explicit
retail PSX differences are reviewed rather than copied blindly: TownCowDir
is 1/0/2 (southwest/south/west), not PC 1/3/4; Qtalklist retains ten base-game
NPC rows and sixteen quests, with an eleventh zero-filled row. AnimOrder,
positions, offsets and all retained dialogue cells otherwise match gold.
The generator refuses changed gold direction values or matrix dimensions.

TOWNERS now owns these tables and the explicit zero-initialized 3,136-byte
towner array. Individual compiled-data gates check all eight symbols' bytes,
exact SDB extents and absence of overlapping relocations. All pass. The
ordinary function/SYM and call gates remain 33/33; all 166 tests pass,
including two new tests for the PSX direction and dialogue projections.
This does not yet register TOWNERS for native linkage: small-data defaults,
local-static sound data, source/header order and complete native relocation
still need verification. Source-linked and function PASS counts are unchanged.

### LANG integration details

Restored the original TextDat/CTextFileInfo header inlines, emitting gman.h
and .tp/.dat literals. NumOfStrings is defined after GetLangFileNameExt so
the TEXTDB label and five extension strings precede it in small data, matching
retail. LANG now uses the shared GAL declarations; the previous local
GAL_SetMemName declaration incorrectly returned void instead of UCHAR.

Native verification proves all 1,404 text bytes, 104 read-only bytes including
the six-entry language jump table, 60 small-data bytes, nine function SYM
records and all five global records/placements. The ordinary function and
call checks remain 9/9; all 164 tests pass. No compiler/gate changes.
The completed main-image rebuild matches all 1,099,272 retail bytes. Source
linkage is now 1,006 functions / 82 TUs (877/50 native, 129/32 conventional).
The function PASS board remains 2693/2727, with 34 entries still open.

### DRLG_L2 table reconstruction details

Writable-string diagnostic (2026-10-01): `build/probe_l2_writable.py`
compiles a separate source copy with `-fwritable-strings`, moving the two
zero-array definitions after the function bodies. This naturally reproduces
the complete 9,492-byte overlay initialized-data region at 80140EF4, including
GMAN's filename, all large tables, the three short PSX filenames and both
zero arrays. Its 100-byte owned small-data region at 8011BE7C also matches
(the diagnostic additionally checks the unchanged 5,884-byte GP prefix).
No production compiler flag was changed.

The diagnostic is NOT a native seal: real PsyQ still emits DoPatternCheck's
nine-entry jump table in a separate 36-byte .rdata section, leaving text
40 bytes short (table plus retail alignment). `configs/embedded_text_tables.txt`
already documents that embedded table; individual gates normalize it, while
the strict native whole-TU check correctly rejects the layout. The diagnostic
puts the separate table at an explicitly non-retail scratch address solely
to compare the data region, never as an integration proposal. Stock GCC's
MIPS backend supports text tables for embedded PIC, but that also changes
the addressing model and conflicts with -G; it is not established as a
matching alternative. Resolve authentic table emission/placement before
registering this TU; do not rewrite object instructions or relax extents.

Follow-up options audit: the installed GNUCC.PDF (PsyQ 4.3 documentation)
describes writable strings on page 177, backend table-section macros on
page 210, and embedded PIC on page 276. The CCPSX introduction documents
driver pass-through but no inline-table switch. Direct real-PsyQ probes
in `build/l2flags`, generated by `build/probe_l2_table_options.py`, establish:
`-mmips-as` still emits DoPatternCheck's table in .rdata; embedded PIC at
G0 emits it in .text but changes the entries to label differences and adds
PC-relative `bal` sequences, unlike retail's absolute table. Thus neither
is a matching alternative. ASPSX 2.56 rejects the proposed `-r` switch.
Production compiler settings, gate normalization and native registration
remain unchanged. These rejected configurations should not be retried as
simple placement fixes.

Storage/filename follow-up: RoomList[81] and predungeon[40][40] are now
explicit initialized source arrays; independent compiled-symbol gates prove
their 1,620 and 1,600 zero bytes and exact SDB sizes. Restored initialized
myk, pHallList, nRoomCnt, nSx1/nSy1/nSx2/nSy2 after the small minisets, matching
the main-image zero initial values and declaration order. Restored the GMAN
header filename through its original unused DumpDatFile inline.

The PSX load filenames are `Blind2.DUN`, `Blood1.DUN`, `Bonestr2.DUN` at
8014274C/80142758/80142764, not the full PC `Levels\\L2Data\\...` paths formerly
in the source. This source bug was hidden by the individual byte gate's
address normalization. The filenames are now corrected; function/SYM and
call gates still pass 36/36, all 117 table gates still pass, and 164 tests pass.
Native registration is still absent: retail interleaves the GMAN string,
tables, these three strings and zero arrays in the overlay prefix, while
the current compiler places all literals in a separate .rdata section.
This layout needs compiler/link evidence, not invented padding or rewritten
instructions. No gate flags were changed and no source-link count is claimed.

`tools/gen_drlg_l2_tables.py` reconstructs 117 initialized arrays directly
from the original Hellfire DRLG_L2.CPP/H, expanding its numeric tile and
pattern constants. All 6,082 payload bytes independently match the PSX main
image/overlay at their authoritative declared addresses. This includes both
direction arrays, SPATSL2, both tile-type tables, the arch/stair/door/miniset
families, the 100-by-10 Patterns matrix, and eleven small-data minisets.

The source now includes `recon/source/gen/tables_drlg_l2.h` instead of relying
solely on external declarations for these arrays. `--verify` compiles the
actual TU and checks each complete array's ELF bytes, exact SDB extent, and
absence of overlapping relocations; all 117 pass. `--write` regenerates only
after gold/retail agreement. Four tests cover aggregate zero fill, invalid
shapes/types, initializer round trips and rejection of executable expressions.
All 164 tests pass; DRLG_L2 remains 36/36 function PASS and 36/36 call audits.

This is source-data preparation, not native overlay integration. RoomList and
predungeon storage, section layout/padding, absolute function order, globals,
and final linked overlay still need native verification. Source-linked counts
and the 2692/2727 function board have not increased from this change.

### OBJPRINT integration details

Restored the original GMAN/CTextFileInfo header literals and the source-level
inline definitions/order of PRIM_GetCopy, PRIM_CopyPrim, PRIM_GetPrim,
GetNumOfFrames, GetCreature and GetFr. Moved DoorOffsets after the 98-entry
ObjPrintFuncs table to restore their original initialized-data layout.

Native verification proves all 5,244 text bytes, 456 initialized-data bytes,
34 read-only bytes, 36 small-data bytes, 96 BSS bytes, 30 function SYM
records and nine named globals. In particular, the complete relocated
ObjPrintFuncs table matches retail rather than merely passing individual
handler bodies. The ordinary board/call checks remain 30/30, and all 160
tests pass. No gate rules or compiler flags were changed.
The final main-image rebuild matches all 1,099,272 retail bytes. Receipts
confirm 868 native functions / 49 TUs and 997 source-linked functions /
81 TUs overall. The function PASS board remains 2692/2727.

### BIRD integration details

Restored BirdList as explicit zero-initialized 384-byte data, replacing its
tentative BSS declaration. The real TextDat layout/header inline, CPlayer
header inline, and CTextFileInfo extension literals reproduce the original
header pools. PRIM_GetPrim now precedes GetOtPos in emitted text, as retail
requires. The shared TextDat header gains only the original PrepareFt4 method
declaration; all existing native consumers were recompiled and verified.

Native checks prove 6,312 text bytes, 384 data bytes, 112 read-only bytes
(including both relocated jump tables), 24 small-data bytes, 16 small-BSS
bytes, all 28 function SYM records, and six named globals. The ordinary
function/call audits remain 28/28 and all 160 tests pass. The main-image
rebuild matches all 1,099,272 retail bytes. Receipts confirm 838 native
functions / 48 TUs: 967 source-linked functions / 80 TUs overall. The board
remains 2692/2727; no new function PASS is claimed by this integration.

### KANJI integration details

Restored the original TextDat::DumpDatFile and CPlayer::GetPlayer header
inlines, plus CTextFileInfo's extension literals. Read-only pool order now
matches gman.h, cplayer.h, KANJI.CPP, the four database filenames, primpool.h.
Deferred helper definitions are ordered so their emitted copies follow the
retail sequence: PRIM_GetPrim, DumpMonsters, GetDecompBuffers, GetFr.
Individual function gates alone did not detect their previous wrong absolute
placements; the native whole-TU check did.

Native verification covers 3,500 text bytes, 126 read-only bytes, 28 small-data
bytes (including KanjiCache's relocation to KanjiList), 12 small-BSS bytes,
and 19,452 BSS bytes including native alignment. All 24 function SYM records
and nine global records/placements match. The original final read-only word
was split into two explicit halfwords without changing its bytes: the last
two bytes of the primpool.h string belong to source, and the following 70 01
remain original scaffold. No bytes were fabricated or discarded.
The ordinary board and call audits remain 24/24; all 160 tests pass.
The final main image rebuild matches all 1,099,272 retail bytes. Receipts now
confirm 810 native functions / 47 TUs, giving 939 source-linked functions /
79 TUs overall. This does not change the 2692/2727 function PASS board.

### PALETTE native integration details

Retail SYM names nine PALETTE globals in initialized small data: sgbFadedIn
at 8011BC65, screenbright at BC66, faderate at BC68, fading at BC6C, FADE_OT
at BC70, st at BC74, mode at BC78, FadeCoords at BC7C, FadeCoords2 at BC84.
The ROM initializes FADE_OT to 511, st to 1, and the other scalar values to
zero. Source now owns those initial values instead of tentative BSS and
includes the original unused DumpDatFile inline's `psxsrc/gman.h` literal.
All 14 real-ASPSX byte gates, exact function SYM records and call audits pass.

The initial native-registration attempt was deferred: the emitted small-data
scalars begin at offset 0/1, whereas the retail region beginning 8011BC64
has the first named bytes at offsets 1/2; the aligned integers/tables then
agree. The leading byte's provenance must be established, not supplied as
invented padding or a fabricated unused string. Retail read-only extent is
14 bytes plus two scaffold alignment bytes. No source-linked count increase
was claimed until whole-TU relocation and data-symbol placement passed.

Resolved by checking the preceding bytes: 8011BC5C holds `.tp\0`, followed
by `.dat\0` at 8011BC60. The byte at BC64 is the latter string's terminator,
not padding. Restoring the existing original CTextFileInfo HasTp/HasDat
header inlines emits both literals and places sgbFadedIn at BC65 naturally.
Native ASPSX/PSYLINK now verifies all 1,264 text bytes, 14 read-only bytes,
48 small-data bytes, fourteen function SYM records and nine global records
and placements. The final two read-only alignment bytes remain scaffold.
The registry and generated linker now select this payload; source linkage
is 915 functions / 78 TUs (786/46 native, 129/32 conventional). All 160 tests
pass. This integration does not add a function PASS to the 2692/2727 board.
The final main-image rebuild passes: all 1,099,272 serialized bytes match
retail, with 120,304 verified zero-fill BSS bytes and the checksum trailer
handled separately by the existing image serializer.

### ProcessItems index scope and diagnostic path sensitivity

Unnamed-access follow-up (2026-10-02): direct `(item + ii)->field` and
`(&item[ii])->field` forms avoid the extra named-reference SYM record, but
still fail. Converting all item accesses gives 159 instructions; converting
only the animation body gives 172 (retail 169). Commuted array indexing is
unchanged at 192. Six narrower variants beginning at the animation guard,
frame snapshot or map test, with either pointer or indexed final-length reads,
produce 171--179 instructions and retain wrong saved-register lifetimes.
Results/sources are under `build/pia`; none was retained. These measurements
confirm that named-pointer debug records were not the only obstacle: the
anonymous pointer spelling also changes loop address-hoisting behavior.

Address-use follow-up (2026-10-01): eight full-TU copies under `build/ipa0`
through `ipa7` vary reference creation before the animation condition versus
before the increment, and indexed versus reference increment/final-length
access. Results span 161--174 instructions, none matching retail's 169.
The closest count (`ipa5`) is 170 with the correct 56-byte frame, but 81
diff lines. Its real debug assembly also exposes `anim` as an extra ItemStruct
reference REG record (s0) and keeps ii in s1 instead of retail a1. Thus the
cached-reference approach has an independent SYM defect, not merely a final
instruction-count problem. No executable source change was retained.
Generator and results: `build/probe_item_address.py`,
`build/item_address_results.json`. The live frame snapshot remains necessary
to preserve the pre-sound-call frame value seen in retail.

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

Authentic-toolchain follow-up (2026-10-02): switching only ASPSX to 2.67
does not resolve the local-static/record-membership failures in MAI_Counselor,
ProcessMonsters, MI_Manashield, set_mdec_audio_volume or stream_cdready_handler.
No debug records were rewritten and no normalization rule changed.

A read-only binary inventory found two additional native Win32 C++ builds:
SN32.3.7.0002 at `C:/Temp/PSYQ/psyq-400-DTL-S2002/GNU/CC1PLPSX.EXE`
(SHA256 65837f430b20683a9123e221b478ca4154eb5a54f43372425936b9b91b542e2d),
and SN32.3.7.0003 at `C:/Temp/ps1-decomp-refs/glover/bin/CC1PLPSX.EXE`
(0b28d05cef35ee0ba5584e05c295a990fad26ef539fb563251a1ec51f3e3d754).
Both retain MI_Manashield's exact 192 instructions but the same incorrect
xoffset block membership. Both also retain set_mdec_img_buffer's two-diff
initial-zero mismatch. Thus these authentic revisions do not solve either
representative failure. Tests used process-local DIAB_CC1PL overrides only;
the production compiler remains Build 0001.

The PsyQ 4.0 DOS frontend has now been executed under a build-local DOSBox
Staging runner against the exact FMV preprocessed input. It identifies itself
as gcc 2.7.2.SN16.3.7 Build 0001. Its `set_mdec_img_buffer` assembly is
instruction-for-instruction identical to the SN32 frontend, including the
second literal-zero initialization. After authentic ASPSX/PSYLINK, both
`set_mdec_audio_volume` and `stream_cdready_handler` retain the same incorrect
inside-block static membership. Therefore the DOS/Windows host frontend split
does not explain either failure cluster. Diagnostic files are under
`build/dcc`, `build/dosbox_staging_portable`, and
`build/sn/dos_fmv_g.sym.txt`; none is tracked or used by production gates.

The DOS comparison was extended to the other smallest scheduling failures.
SN16 emits the same instruction order as all three SN32 builds for DoCredits,
BL_AsyncReadFile, DrawSpeedBar and ResyncQuests as well as both FMV targets.
The four-, four-, six-, six- and two-difference residues are therefore not
frontend build/host-version artifacts. Exact DOS outputs are retained as
`build/dcc/{CRED,BIG,GPAN,QUES}.S`.

Related local-static investigation (2026-10-01): MI_Manashield's baseline is
192 exact instructions, but its xoffset STAT is inside rather than before
the locals' block. The full-TU `build/mscope/missiles.cpp` experiment puts
all automatic locals/statements in a nested block after xoffset. Bytes stay
exact, but SYM now contains two blocks rather than retail's one. Rejected.
Moving the unchanged table to file scope also preserves all 192 instructions
and five calls, but removes `xoffset` from the function record entirely (the
first function local becomes `j`); retail genuinely owns it as a function
static before the block. The local-static form was restored.
The real generated `build/sn/missiles.g.s` puts `.begin` before xoffset's
`.def`. Stock GCC 2.7.2 `sdbout.c:sdbout_begin_block` likewise emits
PUT_SDB_BLOCK_START before sdbout_block/sdbout_syms. This is concrete evidence
against adding source braces to solve the static-record membership cluster;
it does not authorize reordering debug records or relaxing the gate. The
misleading live-source comment claiming an already-matching outer brace was
corrected; executable source is unchanged.

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

Corner-flag follow-up (2026-10-02): using the existing trans value at the
first or second upper corner yields 1,099 or 1,100 real-ASPSX instructions;
using it at both yields 1,105 (retail 1,094). This disrupts Y-1 sharing and
adds flag handling without solving the full function. Replacing either/both
upper-corner flag-clear pairs with `code &= 0xFC` instead preserves the
baseline 1,095-instruction native output and four aligned diff lines. All
six full-TU variants under `build/dtc` were rejected; no live source change.
These results do not support a transparency-macro fix for the retained X-1
temporary. Maspsx's additional small-data expansion remains a separate issue.

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

Resolved follow-up (2026-10-02): an exhaustive 13x13 screen of equivalent
top-left/bottom-left `X - 1` identities found the missing pass-order shape.
Keeping the first corner as `X - 1` and spelling the third as `~(-X)` prevents
early CSE from retaining one shared s1 value; combine later lowers the identity
to retail's direct `addiu a2,fp,-1`. Real ASPSX now matches all 1,094 retail
instructions, exact SYM and all forty calls. Maspsx still expands the known
GP-relative DialogGBack byte store to a two-instruction absolute store, so the
function is registered as a reviewed real-ASPSX pass rather than weakening the
default gate. Results are retained under `build/dialog_xminus_probe`. DIALOG
advances to 10/11 and the full board to 2696/2727 (31 remaining).

### DrawInvTSK entry scheduling probes

Declaration-order follow-up (2026-10-02): reversing omp/osel declarations,
with either assignment order or a combined declaration, does not improve
bytes and breaks the retail record order (osel appears before omp). All
three full-TU probes under `build/ivdecl` were rejected. The isolated
three-compiler probe `build/probes/a-n9qmo84z` is explicitly unvalidated:
stock/instrumented FSF ICE on the unused Dialog destructor in structs_inv.h.
Real PsyQ dumps remain useful: lreg assigns omp pseudo 73 two references
over 234 instructions and osel pseudo 74 two over 237, both crossing 49
calls; greg confirms s6 and s7 respectively. At the documented allocator
formula these priorities are 85 and 84. The narrow lifetime difference
explains why declaration-only changes cannot resolve the saved-state/entry
schedule. Live reconstruction remains unchanged.

Saved-state lifetime follow-up (2026-10-02): loading omp before osel and
restoring `myplr=omp; invflag=0; sel_data=osel` fixes the complete entry
schedule and keeps exact SYM/390 instructions. It remains non-PASS: maspsx
reports four diff lines and real ASPSX reports two aligned diff lines for
the misplaced invflag byte store at the exit. All six tail-store permutations
were checked; none passes. Root inventory-flag snapshots, original-player/
selection snapshots and an early restore-value copy do not solve both ends.
Artifacts: `build/ivs`, particularly `restore_interleave` and `tail1`.
The candidate is retained only as diagnostic evidence; live source remains
the previous eight-difference baseline. This demonstrates coupling between
saved-value lifetimes and the entry schedule rather than an assembler issue.

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

### DrawObjSelector coordinate staging

The Ghidra draft initially made `nx` look like the folded constant 0x23 and
`ny` like an unshifted center advanced later. Restoring that shape reduced the
raw diff count from 237 to 190, but it was a false local optimum: retail SLD and
the actual instructions prove line 1088 computes
`nx = ((256 - nw) >> 1) + 32`, line 1089 computes
`ny = (176 - nh) / 2 + 32`, and the title uses `ny - 22`. Those formulas are
restored. They make `ny` AUTO again and grow the frame from 256 to 264 bytes,
toward retail's 280, while preserving all thirty calls; the gate is 237 diffs
at 503/514 instructions. `nx` still remains in a register rather than retail's
sp-72 slot. Retail's loop-counter zero is scheduled into `SetRGB`'s delay slot,
but its SLD belongs to the later loop line; the ordinary `for (i = 0; ...)`
source is therefore retained. A guarded `do` loop, moving the later item-loop
increment, and early `ypos` initialization all regress allocation and were
rejected.

The repaired `tools/diffsrc.py` now defaults to the repository's
`rom/DIABPSX-SYM.txt` and mirrors the current PsyQ 4.0 build API (the old copy
still imported a removed `retail_sym` module and called NFS4-only compiler
splice helpers). Its `-g` twin is instruction-exact for PADFUNCS and attributes
the remaining mismatch to 58 blocks. The decisive first-loop residue is a
single saved-register swap: retail keeps `add_wrap` in s0 and the generated
three-byte index induction in s1; live output reverses them. The isolated
instrumented 2.7.2 trace is retained under `build/probes/a-rauadtdd`, but is
diagnostic only: vanilla stock produces a 256-byte frame while the SN frontend
produces 264, so its final allocation is not authoritative.

Both other authentic SN32.3.7 frontends (Build 0002 and 0003) reproduce the
same 503/514 instructions, 264-byte frame and 237-difference result for this
function, so the allocation is not a Build-0001-only quirk. Declaration order,
same-scope declaration timing, storage-class hints, commuted subscripting and
reciprocal/literal `maxlen`/`nw` ownership are code-neutral or regress. Reusing
`nx` explicitly as the three-byte loop induction reaches retail's exact 514
instruction count but collapses the frame to 256 and causes 266 differences;
making `nx` volatile reaches the 280-byte frame but grows to 526 instructions
and corrupts parameter/local ownership. These diagnostics prove the missing
eleven instructions are the natural spill/reloads of `nx`, coupled to the
`add_wrap`/induction s0/s1 priority swap—not omitted behavior or compiler
revision. Neither diagnostic source form is retained.

### BL_AsyncReadFile across-call status lifetime

A block-local `const int status = getasyncreadstatus(ah)` followed by
`TSK_Sleep(1)` and `MemSize = status` produces all 88 retail instructions: the
sleep argument is loaded before the call and the status copy occupies its delay
slot. It is not retained because cc1plus emits two extra nested block pairs,
while retail has only the function block. Moving the temporary to function
scope avoids those blocks but swaps saved-register ownership and causes 32 byte
differences. Comma expressions, condition-owned calls, and destination-based
XOR/add/sub identities preserve the four-difference baseline. This narrows the
remaining problem to an unnamed across-call temporary lifetime with no lexical
debug block.

For `LoPlayFMVOverLay`, thirty equivalent expressions for the `user_start =
user_quit` store were screened, including late-combine complement identities,
casts, boolean forms and arithmetic identities. Every valid identity retains
274 instructions and the same two-line store/fade ordering residue; the result
set is under `build/user_start_probe`. The live source remains unchanged.

### DrawAutomap LineY reconstruction

Retail SYM contains root local `LineY`, but the live function previously only
declared it and recomputed `MapY + 1` at each use, so cc1plus removed its record.
The JAP decompile shows the corresponding value initialized to one beside
`MapY = 0`, used for the leveltype-3 horizontal/vertical neighbor coordinates,
and incremented with MapY. Restoring that induction reduces the gate from 1337
to 1297 differences and restores the missing SYM name, although current
allocation records fp while retail records its initial v1 range. A
per-iteration `LineY = MapY + 1` form is one instruction shorter and 1298
differences, so the explicit induction is retained.

Retail SLD also shows the scaled and halved AMPlayerX/Y values stored back to
their globals before the final offsets are formed. Keeping the products in
`Lx/Ly` while explicitly emitting those intermediate stores adds exactly the
five missing instructions: DrawAutomap is now 979/979. Moving `LineY = 1`
after the four run-length clears matches retail initialization order and lowers
the final count to 1292 differences.
Both SYM names survive; Ly has retail a0 while Lx remains v1 instead of a1.
All 42 calls remain exact. `build/drawautomap_liney_diffsrc.txt` contains the
first exact `-g` attribution; the refreshed source is directly reproducible
with `tools/diffsrc.py`.

The four endpoint temporaries were then mapped by actual lifetime rather than
their guessed player-number semantics. The byte-identical P1x/P2x/P2y
three-cycle maps current a3/t0/a1 lifetimes to retail names a1/a3/t0; restoring
the declaration list to P1x/P1y/P2x/P2y preserves retail record order. All four
P records now match exactly without changing any instruction. The reproducible
probe is `build/probe_automap_pcycle.py`.

A further byte-identical same-type swap maps the old Lx v1 lifetime to retail's
LineY name. LineY is now exact; Lx moves to fp and remains nonmatching (it was
already nonmatching in v1). This adds one exact record without losing another.
The probe is `build/probe_automap_lx_liney.py`.

The same byte-identical mapping fixes three saved-register records: cycling the
current MapX/RLen and MapY/LLen lifetimes while restoring declaration order
places MapX=s5, MapY=s4 and RLen=s3 exactly as retail. LLen remains s2 rather
than s1, paired with the wall flags remaining s1 rather than s2. Completing
that last cycle crosses retail INT/UCHAR types; a mechanical swap grows the
function to 996 instructions and is rejected. The retained same-type probe is
`build/probe_automap_saved_names.py`; the rejected boundary probe is
`build/probe_automap_flag_length.py`.

Frame follow-up: the extra eight bytes are one strength-reduced
`dungeon[MapY]` row pointer spilled at sp+184 and advanced by 96 at the inner
loop tail. Retail recomputes that address and has no slot. A volatile typed
view suppresses the induction and reaches the exact 224-byte frame, but drops
to 977 instructions and broadly regresses allocation, so it is diagnostic only
and was reverted. A non-volatile byte-address spelling regresses to 1398
differences, while a block-local const row pointer folds back to the retained
baseline. The next source fix must make the induction rematerializable without
volatile semantics or changing the exact 979-instruction body.

Loop-recurrence diagnostics reach the same conclusion without volatile data.
`MapY = LineY++` removes the spilled pointer and reaches frame 224 but combines
the row updates, yielding 977 instructions. `LineY++; MapY = LineY; MapY--`
keeps frame 224 and restores 979 instructions, but is an artificial three-step
identity and worsens allocation to 1342 differences; it is rejected. Natural
two-statement recurrences fold to 977-978 instructions or restore the spilled
pointer. The live independent `MapY++`/`LineY++` remains the faithful closest
form until another missing retail lifetime accounts for those two instructions.

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
