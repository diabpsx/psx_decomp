/* GNU as macros used by splat-generated .s files. */
/* idempotent: the splat .s files .include this and INCLUDE_ASM includes it once more */
.ifndef __MACRO_INC
.set __MACRO_INC, 1

.macro glabel label
    .global \label
    .type \label, @function
    \label:
.endm

/* jump-table target label — made global so the jtbl in the rodata object can
   reference it across translation units (does not change emitted bytes). */
.macro jlabel label
    .global \label
    \label:
.endm

/* data label (global) */
.macro dlabel label
    .global \label
    \label:
.endm

/* splat "ascii/aligned" data label — same as dlabel for our purposes */
.macro alabel label
    .global \label
    \label:
.endm

/* close a function: emit its size for asm-differ / objdump */
.macro endlabel label
    .size \label, . - \label
.endm

/* close a data object: emit its size */
.macro enddlabel label
    .size \label, . - \label
.endm

/* splat annotation header: `nonmatching <name>[, <size>]` — informational */
.macro nonmatching name, size=0
.endm

/* GTE (cop2) ops spelled by name by spimdisasm; GNU as has no MIPS-I cop2 mnemonics.
   Encodings verified against the retail bytes (mvmva 1,0,0,0,0 = 0x4A480012, dpcs = 0x4A780010). */
.macro mvmva sf, mx, v, cv, lm
    .word 0x4A400012 | (\sf << 19) | (\mx << 17) | (\v << 15) | (\cv << 13) | (\lm << 10)
.endm
.macro dpcs
    .word 0x4A780010
.endm

.endif
