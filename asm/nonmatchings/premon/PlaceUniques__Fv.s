.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaceUniques__Fv, 0x190

glabel PlaceUniques__Fv
    /* 27FD4 80161BCC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 27FD8 80161BD0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 27FDC 80161BD4 21880000 */  addu       $s1, $zero, $zero
    /* 27FE0 80161BD8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 27FE4 80161BDC 21900000 */  addu       $s2, $zero, $zero
    /* 27FE8 80161BE0 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 27FEC 80161BE4 2000B0AF */  sw         $s0, 0x20($sp)
  .L80161BE8:
    /* 27FF0 80161BE8 1180013C */  lui        $at, %hi(UniqMonst)
    /* 27FF4 80161BEC 21083200 */  addu       $at, $at, $s2
    /* 27FF8 80161BF0 08C72580 */  lb         $a1, %lo(UniqMonst)($at)
    /* 27FFC 80161BF4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 28000 80161BF8 5100A210 */  beq        $a1, $v0, .L80161D40
    /* 28004 80161BFC 00000000 */   nop
    /* 28008 80161C00 1180013C */  lui        $at, %hi(UniqMonst + 0x4)
    /* 2800C 80161C04 21083200 */  addu       $at, $at, $s2
    /* 28010 80161C08 0CC72390 */  lbu        $v1, %lo(UniqMonst + 0x4)($at)
    /* 28014 80161C0C 1280023C */  lui        $v0, %hi(currlevel)
    /* 28018 80161C10 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2801C 80161C14 00000000 */  nop
    /* 28020 80161C18 46006214 */  bne        $v1, $v0, .L80161D34
    /* 28024 80161C1C 21800000 */   addu      $s0, $zero, $zero
    /* 28028 80161C20 1000A427 */  addiu      $a0, $sp, 0x10
    /* 2802C 80161C24 BA7D050C */  jal        SwapMonsterType__FPi
    /* 28030 80161C28 1000A5AF */   sw        $a1, 0x10($sp)
    /* 28034 80161C2C 1280043C */  lui        $a0, %hi(nummtypes)
    /* 28038 80161C30 9CC2848C */  lw         $a0, %lo(nummtypes)($a0)
    /* 2803C 80161C34 00000000 */  nop
    /* 28040 80161C38 10008018 */  blez       $a0, .L80161C7C
    /* 28044 80161C3C 21280000 */   addu      $a1, $zero, $zero
    /* 28048 80161C40 1000A68F */  lw         $a2, 0x10($sp)
    /* 2804C 80161C44 21180000 */  addu       $v1, $zero, $zero
  .L80161C48:
    /* 28050 80161C48 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 28054 80161C4C 21082300 */  addu       $at, $at, $v1
    /* 28058 80161C50 CEA32290 */  lbu        $v0, %lo(Monsters + 0x12)($at)
    /* 2805C 80161C54 0100A524 */  addiu      $a1, $a1, 0x1
    /* 28060 80161C58 26104600 */  xor        $v0, $v0, $a2
    /* 28064 80161C5C 0100422C */  sltiu      $v0, $v0, 0x1
    /* 28068 80161C60 21804000 */  addu       $s0, $v0, $zero
    /* 2806C 80161C64 2A10A400 */  slt        $v0, $a1, $a0
    /* 28070 80161C68 04004010 */  beqz       $v0, .L80161C7C
    /* 28074 80161C6C 1C006324 */   addiu     $v1, $v1, 0x1C
    /* 28078 80161C70 FF000232 */  andi       $v0, $s0, 0xFF
    /* 2807C 80161C74 F4FF4010 */  beqz       $v0, .L80161C48
    /* 28080 80161C78 00000000 */   nop
  .L80161C7C:
    /* 28084 80161C7C 07002016 */  bnez       $s1, .L80161C9C
    /* 28088 80161C80 FFFFA524 */   addiu     $a1, $a1, -0x1
    /* 2808C 80161C84 0E80023C */  lui        $v0, %hi(quests + 0x2A)
    /* 28090 80161C88 6ADA4290 */  lbu        $v0, %lo(quests + 0x2A)($v0)
    /* 28094 80161C8C 00000000 */  nop
    /* 28098 80161C90 03004014 */  bnez       $v0, .L80161CA0
    /* 2809C 80161C94 02000224 */   addiu     $v0, $zero, 0x2
    /* 280A0 80161C98 21800000 */  addu       $s0, $zero, $zero
  .L80161C9C:
    /* 280A4 80161C9C 02000224 */  addiu      $v0, $zero, 0x2
  .L80161CA0:
    /* 280A8 80161CA0 07002216 */  bne        $s1, $v0, .L80161CC0
    /* 280AC 80161CA4 03000224 */   addiu     $v0, $zero, 0x3
    /* 280B0 80161CA8 0E80023C */  lui        $v0, %hi(quests + 0x3E)
    /* 280B4 80161CAC 7EDA4290 */  lbu        $v0, %lo(quests + 0x3E)($v0)
    /* 280B8 80161CB0 00000000 */  nop
    /* 280BC 80161CB4 02004014 */  bnez       $v0, .L80161CC0
    /* 280C0 80161CB8 03000224 */   addiu     $v0, $zero, 0x3
    /* 280C4 80161CBC 21800000 */  addu       $s0, $zero, $zero
  .L80161CC0:
    /* 280C8 80161CC0 07002216 */  bne        $s1, $v0, .L80161CE0
    /* 280CC 80161CC4 07000224 */   addiu     $v0, $zero, 0x7
    /* 280D0 80161CC8 0E80023C */  lui        $v0, %hi(quests + 0x8E)
    /* 280D4 80161CCC CEDA4290 */  lbu        $v0, %lo(quests + 0x8E)($v0)
    /* 280D8 80161CD0 00000000 */  nop
    /* 280DC 80161CD4 02004014 */  bnez       $v0, .L80161CE0
    /* 280E0 80161CD8 07000224 */   addiu     $v0, $zero, 0x7
    /* 280E4 80161CDC 21800000 */  addu       $s0, $zero, $zero
  .L80161CE0:
    /* 280E8 80161CE0 07002216 */  bne        $s1, $v0, .L80161D00
    /* 280EC 80161CE4 08000224 */   addiu     $v0, $zero, 0x8
    /* 280F0 80161CE8 0E80023C */  lui        $v0, %hi(quests + 0x52)
    /* 280F4 80161CEC 92DA4290 */  lbu        $v0, %lo(quests + 0x52)($v0)
    /* 280F8 80161CF0 00000000 */  nop
    /* 280FC 80161CF4 02004014 */  bnez       $v0, .L80161D00
    /* 28100 80161CF8 08000224 */   addiu     $v0, $zero, 0x8
    /* 28104 80161CFC 21800000 */  addu       $s0, $zero, $zero
  .L80161D00:
    /* 28108 80161D00 08002216 */  bne        $s1, $v0, .L80161D24
    /* 2810C 80161D04 FF000232 */   andi      $v0, $s0, 0xFF
    /* 28110 80161D08 0E80023C */  lui        $v0, %hi(quests + 0xDE)
    /* 28114 80161D0C 1EDB4290 */  lbu        $v0, %lo(quests + 0xDE)($v0)
    /* 28118 80161D10 00000000 */  nop
    /* 2811C 80161D14 03004014 */  bnez       $v0, .L80161D24
    /* 28120 80161D18 FF000232 */   andi      $v0, $s0, 0xFF
    /* 28124 80161D1C 21800000 */  addu       $s0, $zero, $zero
    /* 28128 80161D20 FF000232 */  andi       $v0, $s0, 0xFF
  .L80161D24:
    /* 2812C 80161D24 03004010 */  beqz       $v0, .L80161D34
    /* 28130 80161D28 21202002 */   addu      $a0, $s1, $zero
    /* 28134 80161D2C A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 28138 80161D30 08000624 */   addiu     $a2, $zero, 0x8
  .L80161D34:
    /* 2813C 80161D34 18005226 */  addiu      $s2, $s2, 0x18
    /* 28140 80161D38 FA860508 */  j          .L80161BE8
    /* 28144 80161D3C 01003126 */   addiu     $s1, $s1, 0x1
  .L80161D40:
    /* 28148 80161D40 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 2814C 80161D44 2800B28F */  lw         $s2, 0x28($sp)
    /* 28150 80161D48 2400B18F */  lw         $s1, 0x24($sp)
    /* 28154 80161D4C 2000B08F */  lw         $s0, 0x20($sp)
    /* 28158 80161D50 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 2815C 80161D54 0800E003 */  jr         $ra
    /* 28160 80161D58 00000000 */   nop
endlabel PlaceUniques__Fv
