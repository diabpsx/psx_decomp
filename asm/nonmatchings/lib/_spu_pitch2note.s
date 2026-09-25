.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching _spu_pitch2note, 0x134

glabel _spu_pitch2note
    /* 9CA0 80019CA0 21C08000 */  addu       $t8, $a0, $zero
    /* 9CA4 80019CA4 2120C000 */  addu       $a0, $a2, $zero
    /* 9CA8 80019CA8 27300600 */  nor        $a2, $zero, $a2
    /* 9CAC 80019CAC 21180000 */  addu       $v1, $zero, $zero
    /* 9CB0 80019CB0 0F000A24 */  addiu      $t2, $zero, 0xF
    /* 9CB4 80019CB4 FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 9CB8 80019CB8 07104601 */  srav       $v0, $a2, $t2
  .L80019CBC:
    /* 9CBC 80019CBC 01004230 */  andi       $v0, $v0, 0x1
    /* 9CC0 80019CC0 03004014 */  bnez       $v0, .L80019CD0
    /* 9CC4 80019CC4 00000000 */   nop
    /* 9CC8 80019CC8 37670008 */  j          .L80019CDC
    /* 9CCC 80019CCC 21184001 */   addu      $v1, $t2, $zero
  .L80019CD0:
    /* 9CD0 80019CD0 FFFF4A25 */  addiu      $t2, $t2, -0x1
    /* 9CD4 80019CD4 F9FF4105 */  bgez       $t2, .L80019CBC
    /* 9CD8 80019CD8 07104601 */   srav      $v0, $a2, $t2
  .L80019CDC:
    /* 9CDC 80019CDC F4FF6F24 */  addiu      $t7, $v1, -0xC
    /* 9CE0 80019CE0 01000224 */  addiu      $v0, $zero, 0x1
    /* 9CE4 80019CE4 04706200 */  sllv       $t6, $v0, $v1
    /* 9CE8 80019CE8 00100824 */  addiu      $t0, $zero, 0x1000
    /* 9CEC 80019CEC 21500000 */  addu       $t2, $zero, $zero
    /* 9CF0 80019CF0 FFFF8630 */  andi       $a2, $a0, 0xFFFF
    /* 9CF4 80019CF4 1800C801 */  mult       $t6, $t0
  .L80019CF8:
    /* 9CF8 80019CF8 80110800 */  sll        $v0, $t0, 6
    /* 9CFC 80019CFC 21104800 */  addu       $v0, $v0, $t0
    /* 9D00 80019D00 00110200 */  sll        $v0, $v0, 4
    /* 9D04 80019D04 23104800 */  subu       $v0, $v0, $t0
    /* 9D08 80019D08 80100200 */  sll        $v0, $v0, 2
    /* 9D0C 80019D0C 12600000 */  mflo       $t4
    /* 9D10 80019D10 23404800 */  subu       $t0, $v0, $t0
    /* 9D14 80019D14 02430800 */  srl        $t0, $t0, 12
    /* 9D18 80019D18 1800C801 */  mult       $t6, $t0
    /* 9D1C 80019D1C 21200000 */  addu       $a0, $zero, $zero
    /* 9D20 80019D20 40690A00 */  sll        $t5, $t2, 5
    /* 9D24 80019D24 21580000 */  addu       $t3, $zero, $zero
    /* 9D28 80019D28 12180000 */  mflo       $v1
    /* 9D2C 80019D2C 23106C00 */  subu       $v0, $v1, $t4
    /* 9D30 80019D30 42490200 */  srl        $t1, $v0, 5
    /* 9D34 80019D34 21382001 */  addu       $a3, $t1, $zero
  .L80019D38:
    /* 9D38 80019D38 21108B01 */  addu       $v0, $t4, $t3
    /* 9D3C 80019D3C 21188701 */  addu       $v1, $t4, $a3
    /* 9D40 80019D40 02130200 */  srl        $v0, $v0, 12
    /* 9D44 80019D44 2B10C200 */  sltu       $v0, $a2, $v0
    /* 9D48 80019D48 04004014 */  bnez       $v0, .L80019D5C
    /* 9D4C 80019D4C 021B0300 */   srl       $v1, $v1, 12
    /* 9D50 80019D50 2B10C300 */  sltu       $v0, $a2, $v1
    /* 9D54 80019D54 0B004014 */  bnez       $v0, .L80019D84
    /* 9D58 80019D58 2110A401 */   addu      $v0, $t5, $a0
  .L80019D5C:
    /* 9D5C 80019D5C 2138E900 */  addu       $a3, $a3, $t1
    /* 9D60 80019D60 01008424 */  addiu      $a0, $a0, 0x1
    /* 9D64 80019D64 20008228 */  slti       $v0, $a0, 0x20
    /* 9D68 80019D68 F3FF4014 */  bnez       $v0, .L80019D38
    /* 9D6C 80019D6C 21586901 */   addu      $t3, $t3, $t1
    /* 9D70 80019D70 01004A25 */  addiu      $t2, $t2, 0x1
    /* 9D74 80019D74 30004229 */  slti       $v0, $t2, 0x30
    /* 9D78 80019D78 DFFF4014 */  bnez       $v0, .L80019CF8
    /* 9D7C 80019D7C 1800C801 */   mult      $t6, $t0
    /* 9D80 80019D80 00060224 */  addiu      $v0, $zero, 0x600
  .L80019D84:
    /* 9D84 80019D84 02004104 */  bgez       $v0, .L80019D90
    /* 9D88 80019D88 21184000 */   addu      $v1, $v0, $zero
    /* 9D8C 80019D8C 7F004324 */  addiu      $v1, $v0, 0x7F
  .L80019D90:
    /* 9D90 80019D90 C3190300 */  sra        $v1, $v1, 7
    /* 9D94 80019D94 C0210300 */  sll        $a0, $v1, 7
    /* 9D98 80019D98 23204400 */  subu       $a0, $v0, $a0
    /* 9D9C 80019D9C FFFF0233 */  andi       $v0, $t8, 0xFFFF
    /* 9DA0 80019DA0 21104300 */  addu       $v0, $v0, $v1
    /* 9DA4 80019DA4 40180F00 */  sll        $v1, $t7, 1
    /* 9DA8 80019DA8 21186F00 */  addu       $v1, $v1, $t7
    /* 9DAC 80019DAC 80180300 */  sll        $v1, $v1, 2
    /* 9DB0 80019DB0 21104300 */  addu       $v0, $v0, $v1
    /* 9DB4 80019DB4 FFFFA330 */  andi       $v1, $a1, 0xFFFF
    /* 9DB8 80019DB8 21186400 */  addu       $v1, $v1, $a0
    /* 9DBC 80019DBC 00120200 */  sll        $v0, $v0, 8
    /* 9DC0 80019DC0 0800E003 */  jr         $ra
    /* 9DC4 80019DC4 25104300 */   or        $v0, $v0, $v1
    /* 9DC8 80019DC8 00000000 */  nop
    /* 9DCC 80019DCC 50730119 */  .word      0x19017350                    # blez       $t0, .L80036B10 # 00010000 <InstrIdType: CPU_NORMAL>
    /* 9DD0 80019DD0 B35C4100 */   tltu      $v0, $at, 370 /* handwritten instruction */
endlabel _spu_pitch2note
