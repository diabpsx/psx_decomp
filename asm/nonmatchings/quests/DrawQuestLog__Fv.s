.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawQuestLog__Fv, 0x1F8

glabel DrawQuestLog__Fv
    /* 58A70 80068A70 1280023C */  lui        $v0, %hi(qtextflag)
    /* 58A74 80068A74 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 58A78 80068A78 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 58A7C 80068A7C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 58A80 80068A80 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 58A84 80068A84 2800B2AF */  sw         $s2, 0x28($sp)
    /* 58A88 80068A88 2400B1AF */  sw         $s1, 0x24($sp)
    /* 58A8C 80068A8C 03004014 */  bnez       $v0, .L80068A9C
    /* 58A90 80068A90 2000B0AF */   sw        $s0, 0x20($sp)
    /* 58A94 80068A94 349A020C */  jal        PrintSelectBack__FUs
    /* 58A98 80068A98 E6040424 */   addiu     $a0, $zero, 0x4E6
  .L80068A9C:
    /* 58A9C 80068A9C 1380103C */  lui        $s0, %hi(D_8012EE38)
    /* 58AA0 80068AA0 38EE1026 */  addiu      $s0, $s0, %lo(D_8012EE38)
    /* 58AA4 80068AA4 21200002 */  addu       $a0, $s0, $zero
    /* 58AA8 80068AA8 97A4010C */  jal        SetBack__6Dialogi_8006925c
    /* 58AAC 80068AAC 94000524 */   addiu     $a1, $zero, 0x94
    /* 58AB0 80068AB0 21200002 */  addu       $a0, $s0, $zero
    /* 58AB4 80068AB4 99A4010C */  jal        SetBorder__6Dialogi_80069264
    /* 58AB8 80068AB8 12000524 */   addiu     $a1, $zero, 0x12
    /* 58ABC 80068ABC 21200002 */  addu       $a0, $s0, $zero
    /* 58AC0 80068AC0 1280053C */  lui        $a1, %hi(BACKR)
    /* 58AC4 80068AC4 FAABA590 */  lbu        $a1, %lo(BACKR)($a1)
    /* 58AC8 80068AC8 1280063C */  lui        $a2, %hi(BACKG)
    /* 58ACC 80068ACC FBABC690 */  lbu        $a2, %lo(BACKG)($a2)
    /* 58AD0 80068AD0 1280073C */  lui        $a3, %hi(BACKB)
    /* 58AD4 80068AD4 FCABE790 */  lbu        $a3, %lo(BACKB)($a3)
    /* 58AD8 80068AD8 42280500 */  srl        $a1, $a1, 1
    /* 58ADC 80068ADC 42300600 */  srl        $a2, $a2, 1
    /* 58AE0 80068AE0 8FA4010C */  jal        SetRGB__6DialogUcUcUc_8006923c
    /* 58AE4 80068AE4 42380700 */   srl       $a3, $a3, 1
    /* 58AE8 80068AE8 21200002 */  addu       $a0, $s0, $zero
    /* 58AEC 80068AEC B812858F */  lw         $a1, %gp_rel(D_8011BA38)($gp)
    /* 58AF0 80068AF0 BC12868F */  lw         $a2, %gp_rel(D_8011BA3C)($gp)
    /* 58AF4 80068AF4 C012878F */  lw         $a3, %gp_rel(D_8011BA40)($gp)
    /* 58AF8 80068AF8 C412828F */  lw         $v0, %gp_rel(D_8011BA44)($gp)
    /* 58AFC 80068AFC 1000A524 */  addiu      $a1, $a1, 0x10
    /* 58B00 80068B00 0800C624 */  addiu      $a2, $a2, 0x8
    /* 58B04 80068B04 E0FFE724 */  addiu      $a3, $a3, -0x20
    /* 58B08 80068B08 F0FF4224 */  addiu      $v0, $v0, -0x10
    /* 58B0C 80068B0C B82F020C */  jal        Back__6Dialogiiii
    /* 58B10 80068B10 1000A2AF */   sw        $v0, 0x10($sp)
    /* 58B14 80068B14 21200002 */  addu       $a0, $s0, $zero
    /* 58B18 80068B18 99A4010C */  jal        SetBorder__6Dialogi_80069264
    /* 58B1C 80068B1C 12000524 */   addiu     $a1, $zero, 0x12
    /* 58B20 80068B20 21200002 */  addu       $a0, $s0, $zero
    /* 58B24 80068B24 97A4010C */  jal        SetBack__6Dialogi_8006925c
    /* 58B28 80068B28 05000524 */   addiu     $a1, $zero, 0x5
    /* 58B2C 80068B2C 1280053C */  lui        $a1, %hi(BORDERR)
    /* 58B30 80068B30 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 58B34 80068B34 1280063C */  lui        $a2, %hi(BORDERG)
    /* 58B38 80068B38 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 58B3C 80068B3C 1280073C */  lui        $a3, %hi(BORDERB)
    /* 58B40 80068B40 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 58B44 80068B44 8FA4010C */  jal        SetRGB__6DialogUcUcUc_8006923c
    /* 58B48 80068B48 21200002 */   addu      $a0, $s0, $zero
    /* 58B4C 80068B4C B812858F */  lw         $a1, %gp_rel(D_8011BA38)($gp)
    /* 58B50 80068B50 BC12868F */  lw         $a2, %gp_rel(D_8011BA3C)($gp)
    /* 58B54 80068B54 C012878F */  lw         $a3, %gp_rel(D_8011BA40)($gp)
    /* 58B58 80068B58 C412828F */  lw         $v0, %gp_rel(D_8011BA44)($gp)
    /* 58B5C 80068B5C 21200002 */  addu       $a0, $s0, $zero
    /* 58B60 80068B60 B82F020C */  jal        Back__6Dialogiiii
    /* 58B64 80068B64 1000A2AF */   sw        $v0, 0x10($sp)
    /* 58B68 80068B68 B812828F */  lw         $v0, %gp_rel(D_8011BA38)($gp)
    /* 58B6C 80068B6C BC12838F */  lw         $v1, %gp_rel(D_8011BA3C)($gp)
    /* 58B70 80068B70 C012848F */  lw         $a0, %gp_rel(D_8011BA40)($gp)
    /* 58B74 80068B74 C412858F */  lw         $a1, %gp_rel(D_8011BA44)($gp)
    /* 58B78 80068B78 1280063C */  lui        $a2, %hi(qtextflag)
    /* 58B7C 80068B7C 60B9C690 */  lbu        $a2, %lo(qtextflag)($a2)
    /* 58B80 80068B80 FC2082A7 */  sh         $v0, %gp_rel(D_8011C87C)($gp)
    /* 58B84 80068B84 FE2083A7 */  sh         $v1, %gp_rel(D_8011C87E)($gp)
    /* 58B88 80068B88 002184A7 */  sh         $a0, %gp_rel(D_8011C880)($gp)
    /* 58B8C 80068B8C 022185A7 */  sh         $a1, %gp_rel(D_8011C882)($gp)
    /* 58B90 80068B90 0A00C014 */  bnez       $a2, .L80068BBC
    /* 58B94 80068B94 00000000 */   nop
    /* 58B98 80068B98 4AED010C */  jal        GetStr__Fi
    /* 58B9C 80068B9C 3B030424 */   addiu     $a0, $zero, 0x33B
    /* 58BA0 80068BA0 01000324 */  addiu      $v1, $zero, 0x1
    /* 58BA4 80068BA4 1000A3AF */  sw         $v1, 0x10($sp)
    /* 58BA8 80068BA8 21200000 */  addu       $a0, $zero, $zero
    /* 58BAC 80068BAC 02000524 */  addiu      $a1, $zero, 0x2
    /* 58BB0 80068BB0 01000624 */  addiu      $a2, $zero, 0x1
    /* 58BB4 80068BB4 07A2010C */  jal        PrintQLString__FiiUcPcc
    /* 58BB8 80068BB8 21384000 */   addu      $a3, $v0, $zero
  .L80068BBC:
    /* 58BBC 80068BBC EC12838F */  lw         $v1, %gp_rel(numqlines)($gp)
    /* 58BC0 80068BC0 00000000 */  nop
    /* 58BC4 80068BC4 07006228 */  slti       $v0, $v1, 0x7
    /* 58BC8 80068BC8 02004010 */  beqz       $v0, .L80068BD4
    /* 58BCC 80068BCC 07001224 */   addiu     $s2, $zero, 0x7
    /* 58BD0 80068BD0 21906000 */  addu       $s2, $v1, $zero
  .L80068BD4:
    /* 58BD4 80068BD4 F012918F */  lw         $s1, %gp_rel(qtopline)($gp)
    /* 58BD8 80068BD8 1B00401A */  blez       $s2, .L80068C48
    /* 58BDC 80068BDC 21800000 */   addu      $s0, $zero, $zero
    /* 58BE0 80068BE0 1380133C */  lui        $s3, %hi(D_8012EDF8)
    /* 58BE4 80068BE4 F8ED7326 */  addiu      $s3, $s3, %lo(D_8012EDF8)
  .L80068BE8:
    /* 58BE8 80068BE8 CC12828F */  lw         $v0, %gp_rel(D_8011BA4C)($gp)
    /* 58BEC 80068BEC 1280033C */  lui        $v1, %hi(qtextflag)
    /* 58BF0 80068BF0 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 58BF4 80068BF4 21100202 */  addu       $v0, $s0, $v0
    /* 58BF8 80068BF8 80100200 */  sll        $v0, $v0, 2
    /* 58BFC 80068BFC 21105300 */  addu       $v0, $v0, $s3
    /* 58C00 80068C00 0000428C */  lw         $v0, 0x0($v0)
    /* 58C04 80068C04 0C006014 */  bnez       $v1, .L80068C38
    /* 58C08 80068C08 00110200 */   sll       $v0, $v0, 4
    /* 58C0C 80068C0C 0E80013C */  lui        $at, %hi(questlist + 0xC)
    /* 58C10 80068C10 21082200 */  addu       $at, $at, $v0
    /* 58C14 80068C14 14D9248C */  lw         $a0, %lo(questlist + 0xC)($at)
    /* 58C18 80068C18 4AED010C */  jal        GetStr__Fi
    /* 58C1C 80068C1C 00000000 */   nop
    /* 58C20 80068C20 21200000 */  addu       $a0, $zero, $zero
    /* 58C24 80068C24 21282002 */  addu       $a1, $s1, $zero
    /* 58C28 80068C28 01000624 */  addiu      $a2, $zero, 0x1
    /* 58C2C 80068C2C 21384000 */  addu       $a3, $v0, $zero
    /* 58C30 80068C30 07A2010C */  jal        PrintQLString__FiiUcPcc
    /* 58C34 80068C34 1000A0AF */   sw        $zero, 0x10($sp)
  .L80068C38:
    /* 58C38 80068C38 01001026 */  addiu      $s0, $s0, 0x1
    /* 58C3C 80068C3C 2A101202 */  slt        $v0, $s0, $s2
    /* 58C40 80068C40 E9FF4014 */  bnez       $v0, .L80068BE8
    /* 58C44 80068C44 02003126 */   addiu     $s1, $s1, 0x2
  .L80068C48:
    /* 58C48 80068C48 3000BF8F */  lw         $ra, 0x30($sp)
    /* 58C4C 80068C4C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 58C50 80068C50 2800B28F */  lw         $s2, 0x28($sp)
    /* 58C54 80068C54 2400B18F */  lw         $s1, 0x24($sp)
    /* 58C58 80068C58 2000B08F */  lw         $s0, 0x20($sp)
    /* 58C5C 80068C5C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 58C60 80068C60 0800E003 */  jr         $ra
    /* 58C64 80068C64 00000000 */   nop
endlabel DrawQuestLog__Fv
