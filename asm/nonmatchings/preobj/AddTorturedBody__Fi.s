.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTorturedBody__Fi, 0x78

glabel AddTorturedBody__Fi
    /* 1D5D8 801571D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D5DC 801571D4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D5E0 801571D8 21888000 */  addu       $s1, $a0, $zero
    /* 1D5E4 801571DC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D5E8 801571E0 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D5EC 801571E4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1D5F0 801571E8 40801100 */  sll        $s0, $s1, 1
    /* 1D5F4 801571EC 21801102 */  addu       $s0, $s0, $s1
    /* 1D5F8 801571F0 80801000 */  sll        $s0, $s0, 2
    /* 1D5FC 801571F4 23801102 */  subu       $s0, $s0, $s1
    /* 1D600 801571F8 80801000 */  sll        $s0, $s0, 2
    /* 1D604 801571FC 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D608 80157200 21083000 */  addu       $at, $at, $s0
    /* 1D60C 80157204 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D610 80157208 C9F6000C */  jal        ENG_random__Fl
    /* 1D614 8015720C 04000424 */   addiu     $a0, $zero, 0x4
    /* 1D618 80157210 01004224 */  addiu      $v0, $v0, 0x1
    /* 1D61C 80157214 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1D620 80157218 21083000 */  addu       $at, $at, $s0
    /* 1D624 8015721C 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 1D628 80157220 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D62C 80157224 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 1D630 80157228 21083000 */  addu       $at, $at, $s0
    /* 1D634 8015722C 758C22A0 */  sb         $v0, %lo(object + 0x29)($at)
    /* 1D638 80157230 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D63C 80157234 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D640 80157238 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D644 8015723C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D648 80157240 0800E003 */  jr         $ra
    /* 1D64C 80157244 00000000 */   nop
endlabel AddTorturedBody__Fi
