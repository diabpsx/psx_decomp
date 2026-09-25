.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ItemNoFlippy__Fv, 0x64

glabel ItemNoFlippy__Fv
    /* 38B3C 80048B3C 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 38B40 80048B40 0D80013C */  lui        $at, %hi(item + 0x35FF)
    /* 38B44 80048B44 21082200 */  addu       $at, $at, $v0
    /* 38B48 80048B48 53532280 */  lb         $v0, %lo(item + 0x35FF)($at)
    /* 38B4C 80048B4C 00000000 */  nop
    /* 38B50 80048B50 C0180200 */  sll        $v1, $v0, 3
    /* 38B54 80048B54 23186200 */  subu       $v1, $v1, $v0
    /* 38B58 80048B58 80180300 */  sll        $v1, $v1, 2
    /* 38B5C 80048B5C 23186200 */  subu       $v1, $v1, $v0
    /* 38B60 80048B60 80180300 */  sll        $v1, $v1, 2
    /* 38B64 80048B64 0D80013C */  lui        $at, %hi(item + 0x4E)
    /* 38B68 80048B68 21082300 */  addu       $at, $at, $v1
    /* 38B6C 80048B6C A21D2590 */  lbu        $a1, %lo(item + 0x4E)($at)
    /* 38B70 80048B70 01000424 */  addiu      $a0, $zero, 0x1
    /* 38B74 80048B74 0D80013C */  lui        $at, %hi(item + 0x68)
    /* 38B78 80048B78 21082300 */  addu       $at, $at, $v1
    /* 38B7C 80048B7C BC1D20A0 */  sb         $zero, %lo(item + 0x68)($at)
    /* 38B80 80048B80 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 38B84 80048B84 21082300 */  addu       $at, $at, $v1
    /* 38B88 80048B88 A41D24A0 */  sb         $a0, %lo(item + 0x50)($at)
    /* 38B8C 80048B8C 0D80013C */  lui        $at, %hi(item + 0x4F)
    /* 38B90 80048B90 21082300 */  addu       $at, $at, $v1
    /* 38B94 80048B94 A31D25A0 */  sb         $a1, %lo(item + 0x4F)($at)
    /* 38B98 80048B98 0800E003 */  jr         $ra
    /* 38B9C 80048B9C 00000000 */   nop
endlabel ItemNoFlippy__Fv
