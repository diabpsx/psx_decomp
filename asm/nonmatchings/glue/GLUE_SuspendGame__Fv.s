.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_SuspendGame__Fv, 0x54

glabel GLUE_SuspendGame__Fv
    /* 8BA24 8009BA24 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8BA28 8009BA28 21200000 */  addu       $a0, $zero, $zero
    /* 8BA2C 8009BA2C 00400524 */  addiu      $a1, $zero, 0x4000
    /* 8BA30 8009BA30 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 8BA34 8009BA34 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8BA38 8009BA38 B681000C */  jal        TSK_Exist
    /* 8BA3C 8009BA3C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8BA40 8009BA40 21804000 */  addu       $s0, $v0, $zero
    /* 8BA44 8009BA44 05000016 */  bnez       $s0, .L8009BA5C
    /* 8BA48 8009BA48 21200000 */   addu      $a0, $zero, $zero
    /* 8BA4C 8009BA4C 1180053C */  lui        $a1, %hi(D_80110B58)
    /* 8BA50 8009BA50 580BA524 */  addiu      $a1, $a1, %lo(D_80110B58)
    /* 8BA54 8009BA54 A583000C */  jal        DBG_Error
    /* 8BA58 8009BA58 0E010624 */   addiu     $a2, $zero, 0x10E
  .L8009BA5C:
    /* 8BA5C 8009BA5C 3982000C */  jal        TSK_MakeTaskInactive
    /* 8BA60 8009BA60 21200002 */   addu      $a0, $s0, $zero
    /* 8BA64 8009BA64 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8BA68 8009BA68 1000B08F */  lw         $s0, 0x10($sp)
    /* 8BA6C 8009BA6C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8BA70 8009BA70 0800E003 */  jr         $ra
    /* 8BA74 8009BA74 00000000 */   nop
endlabel GLUE_SuspendGame__Fv
