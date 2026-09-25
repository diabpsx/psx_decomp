.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CountdownSave__Fi, 0xE0

glabel CountdownSave__Fi
    /* 95D7C 800A5D7C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 95D80 800A5D80 01008424 */  addiu      $a0, $a0, 0x1
    /* 95D84 800A5D84 0C008228 */  slti       $v0, $a0, 0xC
    /* 95D88 800A5D88 30004014 */  bnez       $v0, .L800A5E4C
    /* 95D8C 800A5D8C 1800BFAF */   sw        $ra, 0x18($sp)
    /* 95D90 800A5D90 740A848F */  lw         $a0, %gp_rel(save_blocks)($gp)
    /* 95D94 800A5D94 880A858F */  lw         $a1, %gp_rel(Savefilename)($gp)
    /* 95D98 800A5D98 9F69050C */  jal        func_8015A67C
    /* 95D9C 800A5D9C 00000000 */   nop
    /* 95DA0 800A5DA0 2A004010 */  beqz       $v0, .L800A5E4C
    /* 95DA4 800A5DA4 21200000 */   addu      $a0, $zero, $zero
    /* 95DA8 800A5DA8 1280053C */  lui        $a1, %hi(current_card)
    /* 95DAC 800A5DAC 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 95DB0 800A5DB0 00000000 */  nop
    /* 95DB4 800A5DB4 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 95DB8 800A5DB8 0100A538 */  xori       $a1, $a1, 0x1
    /* 95DBC 800A5DBC E495020C */  jal        ActivateMemcard__Fii
    /* 95DC0 800A5DC0 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 95DC4 800A5DC4 880A838F */  lw         $v1, %gp_rel(Savefilename)($gp)
    /* 95DC8 800A5DC8 1280023C */  lui        $v0, %hi(DiabloOptionFile)
    /* 95DCC 800A5DCC 14B4428C */  lw         $v0, %lo(DiabloOptionFile)($v0)
    /* 95DD0 800A5DD0 00000000 */  nop
    /* 95DD4 800A5DD4 09006210 */  beq        $v1, $v0, .L800A5DFC
    /* 95DD8 800A5DD8 00000000 */   nop
    /* 95DDC 800A5DDC 9E65050C */  jal        func_80159678
    /* 95DE0 800A5DE0 00000000 */   nop
    /* 95DE4 800A5DE4 03004010 */  beqz       $v0, .L800A5DF4
    /* 95DE8 800A5DE8 00000000 */   nop
    /* 95DEC 800A5DEC 86970208 */  j          .L800A5E18
    /* 95DF0 800A5DF0 0F050224 */   addiu     $v0, $zero, 0x50F
  .L800A5DF4:
    /* 95DF4 800A5DF4 86970208 */  j          .L800A5E18
    /* 95DF8 800A5DF8 08050224 */   addiu     $v0, $zero, 0x508
  .L800A5DFC:
    /* 95DFC 800A5DFC 9465050C */  jal        func_80159650
    /* 95E00 800A5E00 00000000 */   nop
    /* 95E04 800A5E04 03004010 */  beqz       $v0, .L800A5E14
    /* 95E08 800A5E08 00000000 */   nop
    /* 95E0C 800A5E0C 86970208 */  j          .L800A5E18
    /* 95E10 800A5E10 0F050224 */   addiu     $v0, $zero, 0x50F
  .L800A5E14:
    /* 95E14 800A5E14 F8020224 */  addiu      $v0, $zero, 0x2F8
  .L800A5E18:
    /* 95E18 800A5E18 1280013C */  lui        $at, %hi(AlertTxt)
    /* 95E1C 800A5E1C 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 95E20 800A5E20 1280043C */  lui        $a0, %hi(current_card)
    /* 95E24 800A5E24 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 95E28 800A5E28 1280013C */  lui        $at, %hi(StatusTxt)
    /* 95E2C 800A5E2C 5CB420AC */  sw         $zero, %lo(StatusTxt)($at)
    /* 95E30 800A5E30 7C0A80AF */  sw         $zero, %gp_rel(cardondelay)($gp)
    /* 95E34 800A5E34 280D050C */  jal        func_801434A0
    /* 95E38 800A5E38 00000000 */   nop
    /* 95E3C 800A5E3C 01000424 */  addiu      $a0, $zero, 0x1
    /* 95E40 800A5E40 E495020C */  jal        ActivateMemcard__Fii
    /* 95E44 800A5E44 01000524 */   addiu     $a1, $zero, 0x1
    /* 95E48 800A5E48 21200000 */  addu       $a0, $zero, $zero
  .L800A5E4C:
    /* 95E4C 800A5E4C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 95E50 800A5E50 21108000 */  addu       $v0, $a0, $zero
    /* 95E54 800A5E54 0800E003 */  jr         $ra
    /* 95E58 800A5E58 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel CountdownSave__Fi
