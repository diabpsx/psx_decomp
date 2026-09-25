.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetAutomapType__FiiUc, 0xD4

glabel GetAutomapType__FiiUc
    /* 709D4 800809D4 21308000 */  addu       $a2, $a0, $zero
    /* 709D8 800809D8 21400000 */  addu       $t0, $zero, $zero
    /* 709DC 800809DC C3180600 */  sra        $v1, $a2, 3
    /* 709E0 800809E0 1180043C */  lui        $a0, %hi(automapview)
    /* 709E4 800809E4 E4D68424 */  addiu      $a0, $a0, %lo(automapview)
    /* 709E8 800809E8 80100300 */  sll        $v0, $v1, 2
    /* 709EC 800809EC 21104300 */  addu       $v0, $v0, $v1
    /* 709F0 800809F0 C0100200 */  sll        $v0, $v0, 3
    /* 709F4 800809F4 21104400 */  addu       $v0, $v0, $a0
    /* 709F8 800809F8 21104500 */  addu       $v0, $v0, $a1
    /* 709FC 800809FC 00004290 */  lbu        $v0, 0x0($v0)
    /* 70A00 80080A00 0700C330 */  andi       $v1, $a2, 0x7
    /* 70A04 80080A04 07106200 */  srav       $v0, $v0, $v1
    /* 70A08 80080A08 01004230 */  andi       $v0, $v0, 0x1
    /* 70A0C 80080A0C 03004014 */  bnez       $v0, .L80080A1C
    /* 70A10 80080A10 21380000 */   addu      $a3, $zero, $zero
    /* 70A14 80080A14 A8020208 */  j          .L80080AA0
    /* 70A18 80080A18 21100000 */   addu      $v0, $zero, $zero
  .L80080A1C:
    /* 70A1C 80080A1C 0E80033C */  lui        $v1, %hi(dungeon)
    /* 70A20 80080A20 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 70A24 80080A24 40100600 */  sll        $v0, $a2, 1
    /* 70A28 80080A28 21104600 */  addu       $v0, $v0, $a2
    /* 70A2C 80080A2C 40110200 */  sll        $v0, $v0, 5
    /* 70A30 80080A30 21104300 */  addu       $v0, $v0, $v1
    /* 70A34 80080A34 40180500 */  sll        $v1, $a1, 1
    /* 70A38 80080A38 21186200 */  addu       $v1, $v1, $v0
    /* 70A3C 80080A3C 00006294 */  lhu        $v0, 0x0($v1)
    /* 70A40 80080A40 00000000 */  nop
    /* 70A44 80080A44 40100200 */  sll        $v0, $v0, 1
    /* 70A48 80080A48 1180013C */  lui        $at, %hi(automaptype)
    /* 70A4C 80080A4C 21082200 */  addu       $at, $at, $v0
    /* 70A50 80080A50 ACD72594 */  lhu        $a1, %lo(automaptype)($at)
    /* 70A54 80080A54 00000000 */  nop
    /* 70A58 80080A58 0F00A230 */  andi       $v0, $a1, 0xF
    /* 70A5C 80080A5C FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 70A60 80080A60 0C00622C */  sltiu      $v0, $v1, 0xC
    /* 70A64 80080A64 0D004010 */  beqz       $v0, .L80080A9C
    /* 70A68 80080A68 02220500 */   srl       $a0, $a1, 8
    /* 70A6C 80080A6C 80100300 */  sll        $v0, $v1, 2
    /* 70A70 80080A70 1280013C */  lui        $at, %hi(jtbl_80118DE0)
    /* 70A74 80080A74 21082200 */  addu       $at, $at, $v0
    /* 70A78 80080A78 E08D228C */  lw         $v0, %lo(jtbl_80118DE0)($at)
    /* 70A7C 80080A7C 00000000 */  nop
    /* 70A80 80080A80 08004000 */  jr         $v0
    /* 70A84 80080A84 00000000 */   nop
  jlabel .L80080A88
    /* 70A88 80080A88 A6020208 */  j          .L80080A98
    /* 70A8C 80080A8C 01000724 */   addiu     $a3, $zero, 0x1
  jlabel .L80080A90
    /* 70A90 80080A90 A7020208 */  j          .L80080A9C
    /* 70A94 80080A94 01000724 */   addiu     $a3, $zero, 0x1
  jlabel .L80080A98
    /* 70A98 80080A98 01000824 */  addiu      $t0, $zero, 0x1
  jlabel .L80080A9C
    /* 70A9C 80080A9C 2110A000 */  addu       $v0, $a1, $zero
  .L80080AA0:
    /* 70AA0 80080AA0 0800E003 */  jr         $ra
    /* 70AA4 80080AA4 00000000 */   nop
endlabel GetAutomapType__FiiUc
