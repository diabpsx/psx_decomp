.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_ResumeGame__Fv, 0x54

glabel GLUE_ResumeGame__Fv
    /* 8BA78 8009BA78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8BA7C 8009BA7C 21200000 */  addu       $a0, $zero, $zero
    /* 8BA80 8009BA80 00400524 */  addiu      $a1, $zero, 0x4000
    /* 8BA84 8009BA84 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 8BA88 8009BA88 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8BA8C 8009BA8C B681000C */  jal        TSK_Exist
    /* 8BA90 8009BA90 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8BA94 8009BA94 21804000 */  addu       $s0, $v0, $zero
    /* 8BA98 8009BA98 05000016 */  bnez       $s0, .L8009BAB0
    /* 8BA9C 8009BA9C 21200000 */   addu      $a0, $zero, $zero
    /* 8BAA0 8009BAA0 1180053C */  lui        $a1, %hi(D_80110B58)
    /* 8BAA4 8009BAA4 580BA524 */  addiu      $a1, $a1, %lo(D_80110B58)
    /* 8BAA8 8009BAA8 A583000C */  jal        DBG_Error
    /* 8BAAC 8009BAAC 1D010624 */   addiu     $a2, $zero, 0x11D
  .L8009BAB0:
    /* 8BAB0 8009BAB0 3E82000C */  jal        TSK_MakeTaskActive
    /* 8BAB4 8009BAB4 21200002 */   addu      $a0, $s0, $zero
    /* 8BAB8 8009BAB8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8BABC 8009BABC 1000B08F */  lw         $s0, 0x10($sp)
    /* 8BAC0 8009BAC0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8BAC4 8009BAC4 0800E003 */  jr         $ra
    /* 8BAC8 8009BAC8 00000000 */   nop
endlabel GLUE_ResumeGame__Fv
