.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReleaseMemHdrBlock, 0x40

glabel ReleaseMemHdrBlock
    /* 12110 80022110 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12114 80022114 21288000 */  addu       $a1, $a0, $zero
    /* 12118 80022118 1280023C */  lui        $v0, %hi(D_8011C9EC)
    /* 1211C 8002211C ECC9428C */  lw         $v0, %lo(D_8011C9EC)($v0)
    /* 12120 80022120 1280043C */  lui        $a0, %hi(D_8011C9D0)
    /* 12124 80022124 D0C98424 */  addiu      $a0, $a0, %lo(D_8011C9D0)
    /* 12128 80022128 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1212C 8002212C 01004224 */  addiu      $v0, $v0, 0x1
    /* 12130 80022130 1280013C */  lui        $at, %hi(D_8011C9EC)
    /* 12134 80022134 ECC922AC */  sw         $v0, %lo(D_8011C9EC)($at)
    /* 12138 80022138 9B86000C */  jal        AttachHdrToList
    /* 1213C 8002213C 00000000 */   nop
    /* 12140 80022140 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12144 80022144 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12148 80022148 0800E003 */  jr         $ra
    /* 1214C 8002214C 00000000 */   nop
endlabel ReleaseMemHdrBlock
