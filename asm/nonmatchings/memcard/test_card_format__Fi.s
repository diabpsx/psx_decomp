.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching test_card_format__Fi, 0xF0

glabel test_card_format__Fi
    /* 8FFC 80142BF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9000 80142BF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9004 80142BFC 21808000 */  addu       $s0, $a0, $zero
    /* 9008 80142C00 00211000 */  sll        $a0, $s0, 4
    /* 900C 80142C04 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9010 80142C08 F369000C */  jal        _card_load
    /* 9014 80142C0C 1400B1AF */   sw        $s1, 0x14($sp)
    /* 9018 80142C10 FB69000C */  jal        _card_wait
    /* 901C 80142C14 21200002 */   addu      $a0, $s0, $zero
    /* 9020 80142C18 1280043C */  lui        $a0, %hi(card_ev0)
    /* 9024 80142C1C C8B1848C */  lw         $a0, %lo(card_ev0)($a0)
    /* 9028 80142C20 5B46000C */  jal        TestEvent
    /* 902C 80142C24 01001124 */   addiu     $s1, $zero, 0x1
    /* 9030 80142C28 28005110 */  beq        $v0, $s1, .L80142CCC
    /* 9034 80142C2C 01000224 */   addiu     $v0, $zero, 0x1
    /* 9038 80142C30 1280043C */  lui        $a0, %hi(card_ev1)
    /* 903C 80142C34 CCB1848C */  lw         $a0, %lo(card_ev1)($a0)
    /* 9040 80142C38 5B46000C */  jal        TestEvent
    /* 9044 80142C3C 00000000 */   nop
    /* 9048 80142C40 05005114 */  bne        $v0, $s1, .L80142C58
    /* 904C 80142C44 00000000 */   nop
  .L80142C48:
    /* 9050 80142C48 A495020C */  jal        card_removed__Fi
    /* 9054 80142C4C 21200002 */   addu      $a0, $s0, $zero
    /* 9058 80142C50 330B0508 */  j          .L80142CCC
    /* 905C 80142C54 21100000 */   addu      $v0, $zero, $zero
  .L80142C58:
    /* 9060 80142C58 1280043C */  lui        $a0, %hi(card_ev2)
    /* 9064 80142C5C D0B1848C */  lw         $a0, %lo(card_ev2)($a0)
    /* 9068 80142C60 5B46000C */  jal        TestEvent
    /* 906C 80142C64 00000000 */   nop
    /* 9070 80142C68 F7FF5110 */  beq        $v0, $s1, .L80142C48
    /* 9074 80142C6C 00000000 */   nop
    /* 9078 80142C70 1280043C */  lui        $a0, %hi(card_ev3)
    /* 907C 80142C74 D4B1848C */  lw         $a0, %lo(card_ev3)($a0)
    /* 9080 80142C78 5B46000C */  jal        TestEvent
    /* 9084 80142C7C 00000000 */   nop
    /* 9088 80142C80 11005114 */  bne        $v0, $s1, .L80142CC8
    /* 908C 80142C84 21200002 */   addu      $a0, $s0, $zero
    /* 9090 80142C88 B295020C */  jal        read_card_block__Fii
    /* 9094 80142C8C 21280000 */   addu      $a1, $zero, $zero
    /* 9098 80142C90 21184000 */  addu       $v1, $v0, $zero
    /* 909C 80142C94 0D006010 */  beqz       $v1, .L80142CCC
    /* 90A0 80142C98 21100000 */   addu      $v0, $zero, $zero
    /* 90A4 80142C9C 0D80043C */  lui        $a0, %hi(block_buf)
    /* 90A8 80142CA0 E8C78490 */  lbu        $a0, %lo(block_buf)($a0)
    /* 90AC 80142CA4 4D000324 */  addiu      $v1, $zero, 0x4D
    /* 90B0 80142CA8 08008314 */  bne        $a0, $v1, .L80142CCC
    /* 90B4 80142CAC 00000000 */   nop
    /* 90B8 80142CB0 0D80023C */  lui        $v0, %hi(block_buf + 0x1)
    /* 90BC 80142CB4 E9C74290 */  lbu        $v0, %lo(block_buf + 0x1)($v0)
    /* 90C0 80142CB8 00000000 */  nop
    /* 90C4 80142CBC 43004238 */  xori       $v0, $v0, 0x43
    /* 90C8 80142CC0 330B0508 */  j          .L80142CCC
    /* 90CC 80142CC4 0100422C */   sltiu     $v0, $v0, 0x1
  .L80142CC8:
    /* 90D0 80142CC8 21100000 */  addu       $v0, $zero, $zero
  .L80142CCC:
    /* 90D4 80142CCC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 90D8 80142CD0 1400B18F */  lw         $s1, 0x14($sp)
    /* 90DC 80142CD4 1000B08F */  lw         $s0, 0x10($sp)
    /* 90E0 80142CD8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 90E4 80142CDC 0800E003 */  jr         $ra
    /* 90E8 80142CE0 00000000 */   nop
endlabel test_card_format__Fi
