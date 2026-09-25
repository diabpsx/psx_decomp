.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDead__Fv, 0x204

glabel InitDead__Fv
    /* 27D88 80037D88 F8FCBD27 */  addiu      $sp, $sp, -0x308
    /* 27D8C 80037D8C BD000724 */  addiu      $a3, $zero, 0xBD
    /* 27D90 80037D90 F402A227 */  addiu      $v0, $sp, 0x2F4
  .L80037D94:
    /* 27D94 80037D94 000040AC */  sw         $zero, 0x0($v0)
    /* 27D98 80037D98 FFFFE724 */  addiu      $a3, $a3, -0x1
    /* 27D9C 80037D9C FDFFE104 */  bgez       $a3, .L80037D94
    /* 27DA0 80037DA0 FCFF4224 */   addiu     $v0, $v0, -0x4
    /* 27DA4 80037DA4 21300000 */  addu       $a2, $zero, $zero
    /* 27DA8 80037DA8 1280023C */  lui        $v0, %hi(nummtypes)
    /* 27DAC 80037DAC 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 27DB0 80037DB0 00000000 */  nop
    /* 27DB4 80037DB4 2A004018 */  blez       $v0, .L80037E60
    /* 27DB8 80037DB8 21380000 */   addu      $a3, $zero, $zero
    /* 27DBC 80037DBC 1180053C */  lui        $a1, %hi(Monsters + 0x12)
    /* 27DC0 80037DC0 CEA3A524 */  addiu      $a1, $a1, %lo(Monsters + 0x12)
    /* 27DC4 80037DC4 21200000 */  addu       $a0, $zero, $zero
  .L80037DC8:
    /* 27DC8 80037DC8 0000A290 */  lbu        $v0, 0x0($a1)
    /* 27DCC 80037DCC 00000000 */  nop
    /* 27DD0 80037DD0 80100200 */  sll        $v0, $v0, 2
    /* 27DD4 80037DD4 21105D00 */  addu       $v0, $v0, $sp
    /* 27DD8 80037DD8 0000428C */  lw         $v0, 0x0($v0)
    /* 27DDC 80037DDC 00000000 */  nop
    /* 27DE0 80037DE0 18004014 */  bnez       $v0, .L80037E44
    /* 27DE4 80037DE4 40100600 */   sll       $v0, $a2, 1
    /* 27DE8 80037DE8 21104600 */  addu       $v0, $v0, $a2
    /* 27DEC 80037DEC 80100200 */  sll        $v0, $v0, 2
    /* 27DF0 80037DF0 0D80013C */  lui        $at, %hi(dead)
    /* 27DF4 80037DF4 21082200 */  addu       $at, $at, $v0
    /* 27DF8 80037DF8 10EB27AC */  sw         $a3, %lo(dead)($at)
    /* 27DFC 80037DFC 1180013C */  lui        $at, %hi(Monsters + 0xC)
    /* 27E00 80037E00 21082400 */  addu       $at, $at, $a0
    /* 27E04 80037E04 C8A32380 */  lb         $v1, %lo(Monsters + 0xC)($at)
    /* 27E08 80037E08 0D80013C */  lui        $at, %hi(dead + 0x8)
    /* 27E0C 80037E0C 21082200 */  addu       $at, $at, $v0
    /* 27E10 80037E10 18EB20A0 */  sb         $zero, %lo(dead + 0x8)($at)
    /* 27E14 80037E14 0D80013C */  lui        $at, %hi(dead + 0x4)
    /* 27E18 80037E18 21082200 */  addu       $at, $at, $v0
    /* 27E1C 80037E1C 14EB23AC */  sw         $v1, %lo(dead + 0x4)($at)
    /* 27E20 80037E20 0100C324 */  addiu      $v1, $a2, 0x1
    /* 27E24 80037E24 1180013C */  lui        $at, %hi(Monsters + 0x18)
    /* 27E28 80037E28 21082400 */  addu       $at, $at, $a0
    /* 27E2C 80037E2C D4A323A0 */  sb         $v1, %lo(Monsters + 0x18)($at)
    /* 27E30 80037E30 0000A290 */  lbu        $v0, 0x0($a1)
    /* 27E34 80037E34 21306000 */  addu       $a2, $v1, $zero
    /* 27E38 80037E38 80100200 */  sll        $v0, $v0, 2
    /* 27E3C 80037E3C 21105D00 */  addu       $v0, $v0, $sp
    /* 27E40 80037E40 000046AC */  sw         $a2, 0x0($v0)
  .L80037E44:
    /* 27E44 80037E44 1C00A524 */  addiu      $a1, $a1, 0x1C
    /* 27E48 80037E48 1280023C */  lui        $v0, %hi(nummtypes)
    /* 27E4C 80037E4C 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 27E50 80037E50 0100E724 */  addiu      $a3, $a3, 0x1
    /* 27E54 80037E54 2A10E200 */  slt        $v0, $a3, $v0
    /* 27E58 80037E58 DBFF4014 */  bnez       $v0, .L80037DC8
    /* 27E5C 80037E5C 1C008424 */   addiu     $a0, $a0, 0x1C
  .L80037E60:
    /* 27E60 80037E60 40180600 */  sll        $v1, $a2, 1
    /* 27E64 80037E64 21186600 */  addu       $v1, $v1, $a2
    /* 27E68 80037E68 0100C524 */  addiu      $a1, $a2, 0x1
    /* 27E6C 80037E6C 2130A000 */  addu       $a2, $a1, $zero
    /* 27E70 80037E70 40200600 */  sll        $a0, $a2, 1
    /* 27E74 80037E74 21208600 */  addu       $a0, $a0, $a2
    /* 27E78 80037E78 0100C224 */  addiu      $v0, $a2, 0x1
    /* 27E7C 80037E7C 21304000 */  addu       $a2, $v0, $zero
    /* 27E80 80037E80 80180300 */  sll        $v1, $v1, 2
    /* 27E84 80037E84 08000224 */  addiu      $v0, $zero, 0x8
    /* 27E88 80037E88 80200400 */  sll        $a0, $a0, 2
    /* 27E8C 80037E8C 0D80013C */  lui        $at, %hi(dead + 0x4)
    /* 27E90 80037E90 21082300 */  addu       $at, $at, $v1
    /* 27E94 80037E94 14EB22AC */  sw         $v0, %lo(dead + 0x4)($at)
    /* 27E98 80037E98 0D80013C */  lui        $at, %hi(dead + 0x8)
    /* 27E9C 80037E9C 21082300 */  addu       $at, $at, $v1
    /* 27EA0 80037EA0 18EB20A0 */  sb         $zero, %lo(dead + 0x8)($at)
    /* 27EA4 80037EA4 F00F85AF */  sw         $a1, %gp_rel(spurtndx)($gp)
    /* 27EA8 80037EA8 0D80013C */  lui        $at, %hi(dead + 0x8)
    /* 27EAC 80037EAC 21082400 */  addu       $at, $at, $a0
    /* 27EB0 80037EB0 18EB20A0 */  sb         $zero, %lo(dead + 0x8)($at)
    /* 27EB4 80037EB4 1280033C */  lui        $v1, %hi(nummonsters)
    /* 27EB8 80037EB8 CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 27EBC 80037EBC 0C000224 */  addiu      $v0, $zero, 0xC
    /* 27EC0 80037EC0 0D80013C */  lui        $at, %hi(dead + 0x4)
    /* 27EC4 80037EC4 21082400 */  addu       $at, $at, $a0
    /* 27EC8 80037EC8 14EB22AC */  sw         $v0, %lo(dead + 0x4)($at)
    /* 27ECC 80037ECC F40F86AF */  sw         $a2, %gp_rel(stonendx)($gp)
    /* 27ED0 80037ED0 2B006018 */  blez       $v1, .L80037F80
    /* 27ED4 80037ED4 21380000 */   addu      $a3, $zero, $zero
    /* 27ED8 80037ED8 1180083C */  lui        $t0, %hi(monstactive)
    /* 27EDC 80037EDC C4A00825 */  addiu      $t0, $t0, %lo(monstactive)
  .L80037EE0:
    /* 27EE0 80037EE0 00000285 */  lh         $v0, 0x0($t0)
    /* 27EE4 80037EE4 00000000 */  nop
    /* 27EE8 80037EE8 40180200 */  sll        $v1, $v0, 1
    /* 27EEC 80037EEC 21186200 */  addu       $v1, $v1, $v0
    /* 27EF0 80037EF0 80180300 */  sll        $v1, $v1, 2
    /* 27EF4 80037EF4 21186200 */  addu       $v1, $v1, $v0
    /* 27EF8 80037EF8 C0280300 */  sll        $a1, $v1, 3
    /* 27EFC 80037EFC 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 27F00 80037F00 21082500 */  addu       $at, $at, $a1
    /* 27F04 80037F04 E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 27F08 80037F08 00000000 */  nop
    /* 27F0C 80037F0C 16004010 */  beqz       $v0, .L80037F68
    /* 27F10 80037F10 40180600 */   sll       $v1, $a2, 1
    /* 27F14 80037F14 21186600 */  addu       $v1, $v1, $a2
    /* 27F18 80037F18 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 27F1C 80037F1C 21082500 */  addu       $at, $at, $a1
    /* 27F20 80037F20 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 27F24 80037F24 80180300 */  sll        $v1, $v1, 2
    /* 27F28 80037F28 0C004280 */  lb         $v0, 0xC($v0)
    /* 27F2C 80037F2C 0100C424 */  addiu      $a0, $a2, 0x1
    /* 27F30 80037F30 0D80013C */  lui        $at, %hi(dead + 0x4)
    /* 27F34 80037F34 21082300 */  addu       $at, $at, $v1
    /* 27F38 80037F38 14EB22AC */  sw         $v0, %lo(dead + 0x4)($at)
    /* 27F3C 80037F3C 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 27F40 80037F40 21082500 */  addu       $at, $at, $a1
    /* 27F44 80037F44 E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 27F48 80037F48 21308000 */  addu       $a2, $a0, $zero
    /* 27F4C 80037F4C 04004224 */  addiu      $v0, $v0, 0x4
    /* 27F50 80037F50 0D80013C */  lui        $at, %hi(dead + 0x8)
    /* 27F54 80037F54 21082300 */  addu       $at, $at, $v1
    /* 27F58 80037F58 18EB22A0 */  sb         $v0, %lo(dead + 0x8)($at)
    /* 27F5C 80037F5C 1080013C */  lui        $at, %hi(monster + 0x45)
    /* 27F60 80037F60 21082500 */  addu       $at, $at, $a1
    /* 27F64 80037F64 D95326A0 */  sb         $a2, %lo(monster + 0x45)($at)
  .L80037F68:
    /* 27F68 80037F68 1280023C */  lui        $v0, %hi(nummonsters)
    /* 27F6C 80037F6C CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 27F70 80037F70 0100E724 */  addiu      $a3, $a3, 0x1
    /* 27F74 80037F74 2A10E200 */  slt        $v0, $a3, $v0
    /* 27F78 80037F78 D9FF4014 */  bnez       $v0, .L80037EE0
    /* 27F7C 80037F7C 02000825 */   addiu     $t0, $t0, 0x2
  .L80037F80:
    /* 27F80 80037F80 0803BD27 */  addiu      $sp, $sp, 0x308
    /* 27F84 80037F84 0800E003 */  jr         $ra
    /* 27F88 80037F88 00000000 */   nop
endlabel InitDead__Fv
