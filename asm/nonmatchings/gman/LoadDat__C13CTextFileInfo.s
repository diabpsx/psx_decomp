.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadDat__C13CTextFileInfo, 0x58

glabel LoadDat__C13CTextFileInfo
    /* 8458C 8009458C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 84590 80094590 1000B0AF */  sw         $s0, 0x10($sp)
    /* 84594 80094594 1400BFAF */  sw         $ra, 0x14($sp)
    /* 84598 80094598 E554020C */  jal        HasDat__C13CTextFileInfo
    /* 8459C 8009459C 21808000 */   addu      $s0, $a0, $zero
    /* 845A0 800945A0 07004014 */  bnez       $v0, .L800945C0
    /* 845A4 800945A4 21200002 */   addu      $a0, $s0, $zero
    /* 845A8 800945A8 21200000 */  addu       $a0, $zero, $zero
    /* 845AC 800945AC 1180053C */  lui        $a1, %hi(D_80110598)
    /* 845B0 800945B0 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 845B4 800945B4 A583000C */  jal        DBG_Error
    /* 845B8 800945B8 7E060624 */   addiu     $a2, $zero, 0x67E
    /* 845BC 800945BC 21200002 */  addu       $a0, $s0, $zero
  .L800945C0:
    /* 845C0 800945C0 1280053C */  lui        $a1, %hi(D_8011ACF0)
    /* 845C4 800945C4 F0ACA524 */  addiu      $a1, $a1, %lo(D_8011ACF0)
    /* 845C8 800945C8 9551020C */  jal        GetFile__C13CTextFileInfoPcUl
    /* 845CC 800945CC 01000624 */   addiu     $a2, $zero, 0x1
    /* 845D0 800945D0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 845D4 800945D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 845D8 800945D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 845DC 800945DC 0800E003 */  jr         $ra
    /* 845E0 800945E0 00000000 */   nop
endlabel LoadDat__C13CTextFileInfo
