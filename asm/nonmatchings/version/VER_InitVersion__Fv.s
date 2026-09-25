.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VER_InitVersion__Fv, 0x44

glabel VER_InitVersion__Fv
    /* 726A0 800826A0 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 726A4 800826A4 8800BFAF */  sw         $ra, 0x88($sp)
    /* 726A8 800826A8 86C2020C */  jal        GetVersionString__FPc
    /* 726AC 800826AC 1000A427 */   addiu     $a0, $sp, 0x10
    /* 726B0 800826B0 BBC2020C */  jal        GetWord__FPc
    /* 726B4 800826B4 1000A427 */   addiu     $a0, $sp, 0x10
    /* 726B8 800826B8 0E80043C */  lui        $a0, %hi(MyVerString)
    /* 726BC 800826BC 1C3C8424 */  addiu      $a0, $a0, %lo(MyVerString)
    /* 726C0 800826C0 1280053C */  lui        $a1, %hi(D_8011944C)
    /* 726C4 800826C4 4C94A524 */  addiu      $a1, $a1, %lo(D_8011944C)
    /* 726C8 800826C8 1000A627 */  addiu      $a2, $sp, 0x10
    /* 726CC 800826CC 9767000C */  jal        sprintf
    /* 726D0 800826D0 21384000 */   addu      $a3, $v0, $zero
    /* 726D4 800826D4 8800BF8F */  lw         $ra, 0x88($sp)
    /* 726D8 800826D8 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 726DC 800826DC 0800E003 */  jr         $ra
    /* 726E0 800826E0 00000000 */   nop
endlabel VER_InitVersion__Fv
