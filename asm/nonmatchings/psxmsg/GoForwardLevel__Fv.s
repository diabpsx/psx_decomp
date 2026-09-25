.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoForwardLevel__Fv, 0x54

glabel GoForwardLevel__Fv
    /* 87430 80097430 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87434 80097434 1000BFAF */  sw         $ra, 0x10($sp)
    /* 87438 80097438 5F5D020C */  jal        LevelToLevelInit__Fv
    /* 8743C 8009743C 00000000 */   nop
    /* 87440 80097440 1280023C */  lui        $v0, %hi(currlevel)
    /* 87444 80097444 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 87448 80097448 00000000 */  nop
    /* 8744C 8009744C 1000422C */  sltiu      $v0, $v0, 0x10
    /* 87450 80097450 05004014 */  bnez       $v0, .L80097468
    /* 87454 80097454 21200000 */   addu      $a0, $zero, $zero
    /* 87458 80097458 1180053C */  lui        $a1, %hi(D_8011071C)
    /* 8745C 8009745C 1C07A524 */  addiu      $a1, $a1, %lo(D_8011071C)
    /* 87460 80097460 A583000C */  jal        DBG_Error
    /* 87464 80097464 4B020624 */   addiu     $a2, $zero, 0x24B
  .L80097468:
    /* 87468 80097468 FC05848F */  lw         $a0, %gp_rel(D_8011AD7C)($gp)
    /* 8746C 8009746C D692020C */  jal        PutUpCutScreen__Fi
    /* 87470 80097470 00000000 */   nop
    /* 87474 80097474 1000BF8F */  lw         $ra, 0x10($sp)
    /* 87478 80097478 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8747C 8009747C 0800E003 */  jr         $ra
    /* 87480 80097480 00000000 */   nop
endlabel GoForwardLevel__Fv
