.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShowLoadingBox__Fi, 0x28C

glabel ShowLoadingBox__Fi
    /* 95E5C 800A5E5C 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 95E60 800A5E60 5400B1AF */  sw         $s1, 0x54($sp)
    /* 95E64 800A5E64 21888000 */  addu       $s1, $a0, $zero
    /* 95E68 800A5E68 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95E6C 800A5E6C 7400BFAF */  sw         $ra, 0x74($sp)
    /* 95E70 800A5E70 7000BEAF */  sw         $fp, 0x70($sp)
    /* 95E74 800A5E74 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 95E78 800A5E78 6800B6AF */  sw         $s6, 0x68($sp)
    /* 95E7C 800A5E7C 6400B5AF */  sw         $s5, 0x64($sp)
    /* 95E80 800A5E80 6000B4AF */  sw         $s4, 0x60($sp)
    /* 95E84 800A5E84 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 95E88 800A5E88 5800B2AF */  sw         $s2, 0x58($sp)
    /* 95E8C 800A5E8C 129A020C */  jal        __6Dialog_800a6848
    /* 95E90 800A5E90 5000B0AF */   sw        $s0, 0x50($sp)
    /* 95E94 800A5E94 380A828F */  lw         $v0, %gp_rel(card_side_load)($gp)
    /* 95E98 800A5E98 00000000 */  nop
    /* 95E9C 800A5E9C 15002212 */  beq        $s1, $v0, .L800A5EF4
    /* 95EA0 800A5EA0 21A80000 */   addu      $s5, $zero, $zero
    /* 95EA4 800A5EA4 3C0A828F */  lw         $v0, %gp_rel(card_side_load + 0x4)($gp)
    /* 95EA8 800A5EA8 00000000 */  nop
    /* 95EAC 800A5EAC 11002212 */  beq        $s1, $v0, .L800A5EF4
    /* 95EB0 800A5EB0 00000000 */   nop
    /* 95EB4 800A5EB4 300A828F */  lw         $v0, %gp_rel(card_side_save)($gp)
    /* 95EB8 800A5EB8 00000000 */  nop
    /* 95EBC 800A5EBC 0D002212 */  beq        $s1, $v0, .L800A5EF4
    /* 95EC0 800A5EC0 00000000 */   nop
    /* 95EC4 800A5EC4 340A828F */  lw         $v0, %gp_rel(card_side_save + 0x4)($gp)
    /* 95EC8 800A5EC8 00000000 */  nop
    /* 95ECC 800A5ECC 09002212 */  beq        $s1, $v0, .L800A5EF4
    /* 95ED0 800A5ED0 00000000 */   nop
    /* 95ED4 800A5ED4 400A828F */  lw         $v0, %gp_rel(card_side_format)($gp)
    /* 95ED8 800A5ED8 00000000 */  nop
    /* 95EDC 800A5EDC 05002212 */  beq        $s1, $v0, .L800A5EF4
    /* 95EE0 800A5EE0 00000000 */   nop
    /* 95EE4 800A5EE4 440A828F */  lw         $v0, %gp_rel(card_side_format + 0x4)($gp)
    /* 95EE8 800A5EE8 00000000 */  nop
    /* 95EEC 800A5EEC 03002216 */  bne        $s1, $v0, .L800A5EFC
    /* 95EF0 800A5EF0 5B001224 */   addiu     $s2, $zero, 0x5B
  .L800A5EF4:
    /* 95EF4 800A5EF4 01001524 */  addiu      $s5, $zero, 0x1
    /* 95EF8 800A5EF8 5B001224 */  addiu      $s2, $zero, 0x5B
  .L800A5EFC:
    /* 95EFC 800A5EFC E0001324 */  addiu      $s3, $zero, 0xE0
    /* 95F00 800A5F00 3A001424 */  addiu      $s4, $zero, 0x3A
    /* 95F04 800A5F04 1280023C */  lui        $v0, %hi(FeFlag)
    /* 95F08 800A5F08 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 95F0C 800A5F0C 00000000 */  nop
    /* 95F10 800A5F10 02004010 */  beqz       $v0, .L800A5F1C
    /* 95F14 800A5F14 30000324 */   addiu     $v1, $zero, 0x30
    /* 95F18 800A5F18 4B001224 */  addiu      $s2, $zero, 0x4B
  .L800A5F1C:
    /* 95F1C 800A5F1C 3800A3A7 */  sh         $v1, 0x38($sp)
    /* 95F20 800A5F20 3A00B2A7 */  sh         $s2, 0x3A($sp)
    /* 95F24 800A5F24 3C00B3A7 */  sh         $s3, 0x3C($sp)
    /* 95F28 800A5F28 329A020C */  jal        GetOverlayOtBase__7CBlocks_800a68c8
    /* 95F2C 800A5F2C 3E00B4A7 */   sh        $s4, 0x3E($sp)
    /* 95F30 800A5F30 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95F34 800A5F34 08005024 */  addiu      $s0, $v0, 0x8
    /* 95F38 800A5F38 8A34020C */  jal        SetOTpos__6Dialogi
    /* 95F3C 800A5F3C 21280002 */   addu      $a1, $s0, $zero
    /* 95F40 800A5F40 0C80163C */  lui        $s6, %hi(MediumFont)
    /* 95F44 800A5F44 D882D626 */  addiu      $s6, $s6, %lo(MediumFont)
    /* 95F48 800A5F48 2120C002 */  addu       $a0, $s6, $zero
    /* 95F4C 800A5F4C 21280002 */  addu       $a1, $s0, $zero
    /* 95F50 800A5F50 E82A020C */  jal        SetOTpos__5CFonti
    /* 95F54 800A5F54 4000A2AF */   sw        $v0, 0x40($sp)
    /* 95F58 800A5F58 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95F5C 800A5F5C 12000524 */  addiu      $a1, $zero, 0x12
    /* 95F60 800A5F60 069A020C */  jal        SetBorder__6Dialogi_800a6818
    /* 95F64 800A5F64 21F04000 */   addu      $fp, $v0, $zero
    /* 95F68 800A5F68 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95F6C 800A5F6C 049A020C */  jal        SetBack__6Dialogi_800a6810
    /* 95F70 800A5F70 05000524 */   addiu     $a1, $zero, 0x5
    /* 95F74 800A5F74 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95F78 800A5F78 50000524 */  addiu      $a1, $zero, 0x50
    /* 95F7C 800A5F7C 40000624 */  addiu      $a2, $zero, 0x40
    /* 95F80 800A5F80 FC99020C */  jal        SetRGB__6DialogUcUcUc_800a67f0
    /* 95F84 800A5F84 40000724 */   addiu     $a3, $zero, 0x40
    /* 95F88 800A5F88 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95F8C 800A5F8C 30000524 */  addiu      $a1, $zero, 0x30
    /* 95F90 800A5F90 21304002 */  addu       $a2, $s2, $zero
    /* 95F94 800A5F94 E0000724 */  addiu      $a3, $zero, 0xE0
    /* 95F98 800A5F98 B82F020C */  jal        Back__6Dialogiiii
    /* 95F9C 800A5F9C 1000B4AF */   sw        $s4, 0x10($sp)
    /* 95FA0 800A5FA0 4AED010C */  jal        GetStr__Fi
    /* 95FA4 800A5FA4 21202002 */   addu      $a0, $s1, $zero
    /* 95FA8 800A5FA8 2120C002 */  addu       $a0, $s6, $zero
    /* 95FAC 800A5FAC A92A020C */  jal        GetStrWidth__5CFontPc
    /* 95FB0 800A5FB0 21284000 */   addu      $a1, $v0, $zero
    /* 95FB4 800A5FB4 1A005300 */  div        $zero, $v0, $s3
    /* 95FB8 800A5FB8 12180000 */  mflo       $v1
    /* 95FBC 800A5FBC 0A00A012 */  beqz       $s5, .L800A5FE8
    /* 95FC0 800A5FC0 01007224 */   addiu     $s2, $v1, 0x1
    /* 95FC4 800A5FC4 4AED010C */  jal        GetStr__Fi
    /* 95FC8 800A5FC8 8A020424 */   addiu     $a0, $zero, 0x28A
    /* 95FCC 800A5FCC 2120C002 */  addu       $a0, $s6, $zero
    /* 95FD0 800A5FD0 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 95FD4 800A5FD4 21284000 */   addu      $a1, $v0, $zero
    /* 95FD8 800A5FD8 1A005300 */  div        $zero, $v0, $s3
    /* 95FDC 800A5FDC 12100000 */  mflo       $v0
    /* 95FE0 800A5FE0 00000000 */  nop
    /* 95FE4 800A5FE4 21184202 */  addu       $v1, $s2, $v0
  .L800A5FE8:
    /* 95FE8 800A5FE8 21202002 */  addu       $a0, $s1, $zero
    /* 95FEC 800A5FEC 40100300 */  sll        $v0, $v1, 1
    /* 95FF0 800A5FF0 21104300 */  addu       $v0, $v0, $v1
    /* 95FF4 800A5FF4 80100200 */  sll        $v0, $v0, 2
    /* 95FF8 800A5FF8 23108202 */  subu       $v0, $s4, $v0
    /* 95FFC 800A5FFC 43100200 */  sra        $v0, $v0, 1
    /* 96000 800A6000 4AED010C */  jal        GetStr__Fi
    /* 96004 800A6004 03005424 */   addiu     $s4, $v0, 0x3
    /* 96008 800A6008 2120C002 */  addu       $a0, $s6, $zero
    /* 9600C 800A600C 21280000 */  addu       $a1, $zero, $zero
    /* 96010 800A6010 21308002 */  addu       $a2, $s4, $zero
    /* 96014 800A6014 21384000 */  addu       $a3, $v0, $zero
    /* 96018 800A6018 01001724 */  addiu      $s7, $zero, 0x1
    /* 9601C 800A601C 1280133C */  lui        $s3, %hi(WHITER)
    /* 96020 800A6020 D1AB7392 */  lbu        $s3, %lo(WHITER)($s3)
    /* 96024 800A6024 1280103C */  lui        $s0, %hi(WHITEG)
    /* 96028 800A6028 D2AB1092 */  lbu        $s0, %lo(WHITEG)($s0)
    /* 9602C 800A602C 3800B127 */  addiu      $s1, $sp, 0x38
    /* 96030 800A6030 1000B7AF */  sw         $s7, 0x10($sp)
    /* 96034 800A6034 1400B1AF */  sw         $s1, 0x14($sp)
    /* 96038 800A6038 1800B3AF */  sw         $s3, 0x18($sp)
    /* 9603C 800A603C 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 96040 800A6040 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 96044 800A6044 2000B0AF */   sw        $s0, 0x20($sp)
    /* 96048 800A6048 1100A012 */  beqz       $s5, .L800A6090
    /* 9604C 800A604C 00000000 */   nop
    /* 96050 800A6050 4AED010C */  jal        GetStr__Fi
    /* 96054 800A6054 8A020424 */   addiu     $a0, $zero, 0x28A
    /* 96058 800A6058 2120C002 */  addu       $a0, $s6, $zero
    /* 9605C 800A605C 21280000 */  addu       $a1, $zero, $zero
    /* 96060 800A6060 40301200 */  sll        $a2, $s2, 1
    /* 96064 800A6064 2130D200 */  addu       $a2, $a2, $s2
    /* 96068 800A6068 80300600 */  sll        $a2, $a2, 2
    /* 9606C 800A606C 2130D200 */  addu       $a2, $a2, $s2
    /* 96070 800A6070 21308602 */  addu       $a2, $s4, $a2
    /* 96074 800A6074 21384000 */  addu       $a3, $v0, $zero
    /* 96078 800A6078 1000B7AF */  sw         $s7, 0x10($sp)
    /* 9607C 800A607C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 96080 800A6080 1800B3AF */  sw         $s3, 0x18($sp)
    /* 96084 800A6084 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 96088 800A6088 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9608C 800A608C 2000B0AF */   sw        $s0, 0x20($sp)
  .L800A6090:
    /* 96090 800A6090 4000A58F */  lw         $a1, 0x40($sp)
    /* 96094 800A6094 8A34020C */  jal        SetOTpos__6Dialogi
    /* 96098 800A6098 2800A427 */   addiu     $a0, $sp, 0x28
    /* 9609C 800A609C 2120C002 */  addu       $a0, $s6, $zero
    /* 960A0 800A60A0 E82A020C */  jal        SetOTpos__5CFonti
    /* 960A4 800A60A4 2128C003 */   addu      $a1, $fp, $zero
    /* 960A8 800A60A8 2800A427 */  addiu      $a0, $sp, 0x28
    /* 960AC 800A60AC 089A020C */  jal        ___6Dialog_800a6820
    /* 960B0 800A60B0 02000524 */   addiu     $a1, $zero, 0x2
    /* 960B4 800A60B4 7400BF8F */  lw         $ra, 0x74($sp)
    /* 960B8 800A60B8 7000BE8F */  lw         $fp, 0x70($sp)
    /* 960BC 800A60BC 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 960C0 800A60C0 6800B68F */  lw         $s6, 0x68($sp)
    /* 960C4 800A60C4 6400B58F */  lw         $s5, 0x64($sp)
    /* 960C8 800A60C8 6000B48F */  lw         $s4, 0x60($sp)
    /* 960CC 800A60CC 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 960D0 800A60D0 5800B28F */  lw         $s2, 0x58($sp)
    /* 960D4 800A60D4 5400B18F */  lw         $s1, 0x54($sp)
    /* 960D8 800A60D8 5000B08F */  lw         $s0, 0x50($sp)
    /* 960DC 800A60DC 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 960E0 800A60E0 0800E003 */  jr         $ra
    /* 960E4 800A60E4 00000000 */   nop
endlabel ShowLoadingBox__Fi
