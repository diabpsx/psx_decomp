.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_DrawHelp__Fv, 0x40

glabel _GLOBAL__D_DrawHelp__Fv
    /* 9EF48 800AEF48 740B828F */  lw         $v0, %gp_rel(D_8011B2F4)($gp)
    /* 9EF4C 800AEF4C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9EF50 800AEF50 05004010 */  beqz       $v0, .L800AEF68
    /* 9EF54 800AEF54 1000BFAF */   sw        $ra, 0x10($sp)
    /* 9EF58 800AEF58 1280043C */  lui        $a0, %hi(D_80121C78)
    /* 9EF5C 800AEF5C 781C8424 */  addiu      $a0, $a0, %lo(D_80121C78)
    /* 9EF60 800AEF60 F6BB020C */  jal        ___6Dialog_800aefd8
    /* 9EF64 800AEF64 02000524 */   addiu     $a1, $zero, 0x2
  .L800AEF68:
    /* 9EF68 800AEF68 1280043C */  lui        $a0, %hi(D_80121C88)
    /* 9EF6C 800AEF6C 881C8424 */  addiu      $a0, $a0, %lo(D_80121C88)
    /* 9EF70 800AEF70 F6BB020C */  jal        ___6Dialog_800aefd8
    /* 9EF74 800AEF74 02000524 */   addiu     $a1, $zero, 0x2
    /* 9EF78 800AEF78 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9EF7C 800AEF7C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9EF80 800AEF80 0800E003 */  jr         $ra
    /* 9EF84 800AEF84 00000000 */   nop
endlabel _GLOBAL__D_DrawHelp__Fv
