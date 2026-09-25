.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintAreYouSure__17CTempPauseMessagei, 0x178

glabel PrintAreYouSure__17CTempPauseMessagei
    /* 78FE0 80088FE0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 78FE4 80088FE4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 78FE8 80088FE8 21908000 */  addu       $s2, $a0, $zero
    /* 78FEC 80088FEC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 78FF0 80088FF0 2198A000 */  addu       $s3, $a1, $zero
    /* 78FF4 80088FF4 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 78FF8 80088FF8 3800B6AF */  sw         $s6, 0x38($sp)
    /* 78FFC 80088FFC 3400B5AF */  sw         $s5, 0x34($sp)
    /* 79000 80089000 3000B4AF */  sw         $s4, 0x30($sp)
    /* 79004 80089004 2400B1AF */  sw         $s1, 0x24($sp)
    /* 79008 80089008 3ED8000C */  jal        RedBack__Fv
    /* 7900C 8008900C 2000B0AF */   sw        $s0, 0x20($sp)
    /* 79010 80089010 2925020C */  jal        GetMaxOtPos__7CBlocks_800894a4
    /* 79014 80089014 00000000 */   nop
    /* 79018 80089018 1280113C */  lui        $s1, %hi(D_8011CBC0)
    /* 7901C 8008901C C0CB3126 */  addiu      $s1, $s1, %lo(D_8011CBC0)
    /* 79020 80089020 21202002 */  addu       $a0, $s1, $zero
    /* 79024 80089024 21804000 */  addu       $s0, $v0, $zero
    /* 79028 80089028 8A34020C */  jal        SetOTpos__6Dialogi
    /* 7902C 8008902C FDFF0526 */   addiu     $a1, $s0, -0x3
    /* 79030 80089030 0C80143C */  lui        $s4, %hi(MediumFont)
    /* 79034 80089034 D8829426 */  addiu      $s4, $s4, %lo(MediumFont)
    /* 79038 80089038 21208002 */  addu       $a0, $s4, $zero
    /* 7903C 8008903C FEFF0526 */  addiu      $a1, $s0, -0x2
    /* 79040 80089040 E82A020C */  jal        SetOTpos__5CFonti
    /* 79044 80089044 21B04000 */   addu      $s6, $v0, $zero
    /* 79048 80089048 21202002 */  addu       $a0, $s1, $zero
    /* 7904C 8008904C 1280053C */  lui        $a1, %hi(BORDERR)
    /* 79050 80089050 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 79054 80089054 1280063C */  lui        $a2, %hi(BORDERG)
    /* 79058 80089058 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 7905C 8008905C 1280073C */  lui        $a3, %hi(BORDERB)
    /* 79060 80089060 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 79064 80089064 F124020C */  jal        SetRGB__6DialogUcUcUc_800893c4
    /* 79068 80089068 21A84000 */   addu      $s5, $v0, $zero
    /* 7906C 8008906C 21202002 */  addu       $a0, $s1, $zero
    /* 79070 80089070 F924020C */  jal        SetBack__6Dialogi_800893e4
    /* 79074 80089074 94000524 */   addiu     $a1, $zero, 0x94
    /* 79078 80089078 21202002 */  addu       $a0, $s1, $zero
    /* 7907C 8008907C FB24020C */  jal        SetBorder__6Dialogi_800893ec
    /* 79080 80089080 12000524 */   addiu     $a1, $zero, 0x12
    /* 79084 80089084 21202002 */  addu       $a0, $s1, $zero
    /* 79088 80089088 50000524 */  addiu      $a1, $zero, 0x50
    /* 7908C 8008908C 60000624 */  addiu      $a2, $zero, 0x60
    /* 79090 80089090 A0000724 */  addiu      $a3, $zero, 0xA0
    /* 79094 80089094 30000224 */  addiu      $v0, $zero, 0x30
    /* 79098 80089098 B82F020C */  jal        Back__6Dialogiiii
    /* 7909C 8008909C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 790A0 800890A0 21204002 */  addu       $a0, $s2, $zero
    /* 790A4 800890A4 21280000 */  addu       $a1, $zero, $zero
    /* 790A8 800890A8 26000624 */  addiu      $a2, $zero, 0x26
    /* 790AC 800890AC 21386002 */  addu       $a3, $s3, $zero
    /* 790B0 800890B0 50000224 */  addiu      $v0, $zero, 0x50
    /* 790B4 800890B4 1800A2A7 */  sh         $v0, 0x18($sp)
    /* 790B8 800890B8 60000224 */  addiu      $v0, $zero, 0x60
    /* 790BC 800890BC 1A00A2A7 */  sh         $v0, 0x1A($sp)
    /* 790C0 800890C0 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 790C4 800890C4 1C00A2A7 */  sh         $v0, 0x1C($sp)
    /* 790C8 800890C8 30000224 */  addiu      $v0, $zero, 0x30
    /* 790CC 800890CC 1800B027 */  addiu      $s0, $sp, 0x18
    /* 790D0 800890D0 1E00A2A7 */  sh         $v0, 0x1E($sp)
    /* 790D4 800890D4 0423020C */  jal        MY_PausePrint__17CTempPauseMessageiiiP4RECT
    /* 790D8 800890D8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 790DC 800890DC 21204002 */  addu       $a0, $s2, $zero
    /* 790E0 800890E0 02000524 */  addiu      $a1, $zero, 0x2
    /* 790E4 800890E4 E7040624 */  addiu      $a2, $zero, 0x4E7
    /* 790E8 800890E8 21386002 */  addu       $a3, $s3, $zero
    /* 790EC 800890EC 0423020C */  jal        MY_PausePrint__17CTempPauseMessageiiiP4RECT
    /* 790F0 800890F0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 790F4 800890F4 21204002 */  addu       $a0, $s2, $zero
    /* 790F8 800890F8 03000524 */  addiu      $a1, $zero, 0x3
    /* 790FC 800890FC C9020624 */  addiu      $a2, $zero, 0x2C9
    /* 79100 80089100 21386002 */  addu       $a3, $s3, $zero
    /* 79104 80089104 0423020C */  jal        MY_PausePrint__17CTempPauseMessageiiiP4RECT
    /* 79108 80089108 1000B0AF */   sw        $s0, 0x10($sp)
    /* 7910C 8008910C 349A020C */  jal        PrintSelectBack__FUs
    /* 79110 80089110 E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 79114 80089114 21208002 */  addu       $a0, $s4, $zero
    /* 79118 80089118 E82A020C */  jal        SetOTpos__5CFonti
    /* 7911C 8008911C 2128A002 */   addu      $a1, $s5, $zero
    /* 79120 80089120 21202002 */  addu       $a0, $s1, $zero
    /* 79124 80089124 8A34020C */  jal        SetOTpos__6Dialogi
    /* 79128 80089128 2128C002 */   addu      $a1, $s6, $zero
    /* 7912C 8008912C 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 79130 80089130 3800B68F */  lw         $s6, 0x38($sp)
    /* 79134 80089134 3400B58F */  lw         $s5, 0x34($sp)
    /* 79138 80089138 3000B48F */  lw         $s4, 0x30($sp)
    /* 7913C 8008913C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 79140 80089140 2800B28F */  lw         $s2, 0x28($sp)
    /* 79144 80089144 2400B18F */  lw         $s1, 0x24($sp)
    /* 79148 80089148 2000B08F */  lw         $s0, 0x20($sp)
    /* 7914C 8008914C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 79150 80089150 0800E003 */  jr         $ra
    /* 79154 80089154 00000000 */   nop
endlabel PrintAreYouSure__17CTempPauseMessagei
