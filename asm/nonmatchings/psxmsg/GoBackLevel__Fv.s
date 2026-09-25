.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoBackLevel__Fv, 0x5C

glabel GoBackLevel__Fv
    /* 87030 80097030 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87034 80097034 1000BFAF */  sw         $ra, 0x10($sp)
    /* 87038 80097038 5F5D020C */  jal        LevelToLevelInit__Fv
    /* 8703C 8009703C 00000000 */   nop
    /* 87040 80097040 1280023C */  lui        $v0, %hi(currlevel)
    /* 87044 80097044 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 87048 80097048 00000000 */  nop
    /* 8704C 8009704C 03004010 */  beqz       $v0, .L8009705C
    /* 87050 80097050 1100422C */   sltiu     $v0, $v0, 0x11
    /* 87054 80097054 06004014 */  bnez       $v0, .L80097070
    /* 87058 80097058 00000000 */   nop
  .L8009705C:
    /* 8705C 8009705C 21200000 */  addu       $a0, $zero, $zero
    /* 87060 80097060 1180053C */  lui        $a1, %hi(D_8011071C)
    /* 87064 80097064 1C07A524 */  addiu      $a1, $a1, %lo(D_8011071C)
    /* 87068 80097068 A583000C */  jal        DBG_Error
    /* 8706C 8009706C C9010624 */   addiu     $a2, $zero, 0x1C9
  .L80097070:
    /* 87070 80097070 FC05848F */  lw         $a0, %gp_rel(D_8011AD7C)($gp)
    /* 87074 80097074 D692020C */  jal        PutUpCutScreen__Fi
    /* 87078 80097078 00000000 */   nop
    /* 8707C 8009707C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 87080 80097080 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87084 80097084 0800E003 */  jr         $ra
    /* 87088 80097088 00000000 */   nop
endlabel GoBackLevel__Fv
