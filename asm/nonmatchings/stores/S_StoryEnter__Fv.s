.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StoryEnter__Fv, 0x9C

glabel S_StoryEnter__Fv
    /* 63AE8 80073AE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 63AEC 80073AEC 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63AF0 80073AF0 09000224 */  addiu      $v0, $zero, 0x9
    /* 63AF4 80073AF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 63AF8 80073AF8 211380A3 */  sb         $zero, %gp_rel(WFlag)($gp)
    /* 63AFC 80073AFC 18006210 */  beq        $v1, $v0, .L80073B60
    /* 63B00 80073B00 0A006228 */   slti      $v0, $v1, 0xA
    /* 63B04 80073B04 05004010 */  beqz       $v0, .L80073B1C
    /* 63B08 80073B08 07000224 */   addiu     $v0, $zero, 0x7
    /* 63B0C 80073B0C 08006210 */  beq        $v1, $v0, .L80073B30
    /* 63B10 80073B10 04000224 */   addiu     $v0, $zero, 0x4
    /* 63B14 80073B14 DDCE0108 */  j          .L80073B74
    /* 63B18 80073B18 00000000 */   nop
  .L80073B1C:
    /* 63B1C 80073B1C 0B000224 */  addiu      $v0, $zero, 0xB
    /* 63B20 80073B20 13006210 */  beq        $v1, $v0, .L80073B70
    /* 63B24 80073B24 00000000 */   nop
    /* 63B28 80073B28 DDCE0108 */  j          .L80073B74
    /* 63B2C 80073B2C 00000000 */   nop
  .L80073B30:
    /* 63B30 80073B30 442182AF */  sw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 63B34 80073B34 0F000224 */  addiu      $v0, $zero, 0xF
    /* 63B38 80073B38 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 63B3C 80073B3C 97000224 */  addiu      $v0, $zero, 0x97
    /* 63B40 80073B40 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 63B44 80073B44 9F000224 */  addiu      $v0, $zero, 0x9F
    /* 63B48 80073B48 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 63B4C 80073B4C 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 63B50 80073B50 5BBE010C */  jal        StartStore__Fc
    /* 63B54 80073B54 13000424 */   addiu     $a0, $zero, 0x13
    /* 63B58 80073B58 DDCE0108 */  j          .L80073B74
    /* 63B5C 80073B5C 00000000 */   nop
  .L80073B60:
    /* 63B60 80073B60 5BBE010C */  jal        StartStore__Fc
    /* 63B64 80073B64 11000424 */   addiu     $a0, $zero, 0x11
    /* 63B68 80073B68 DDCE0108 */  j          .L80073B74
    /* 63B6C 80073B6C 00000000 */   nop
  .L80073B70:
    /* 63B70 80073B70 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L80073B74:
    /* 63B74 80073B74 1000BF8F */  lw         $ra, 0x10($sp)
    /* 63B78 80073B78 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 63B7C 80073B7C 0800E003 */  jr         $ra
    /* 63B80 80073B80 00000000 */   nop
endlabel S_StoryEnter__Fv
