.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddQuestItems__Fv, 0xA0

glabel AddQuestItems__Fv
    /* 28EF4 80038EF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28EF8 80038EF8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 28EFC 80038EFC DC9E010C */  jal        QuestStatus__Fi
    /* 28F00 80038F00 21200000 */   addu      $a0, $zero, $zero
    /* 28F04 80038F04 FF004230 */  andi       $v0, $v0, 0xFF
    /* 28F08 80038F08 08004010 */  beqz       $v0, .L80038F2C
    /* 28F0C 80038F0C 00000000 */   nop
    /* 28F10 80038F10 0E80023C */  lui        $v0, %hi(quests + 0x12)
    /* 28F14 80038F14 52DA4290 */  lbu        $v0, %lo(quests + 0x12)($v0)
    /* 28F18 80038F18 00000000 */  nop
    /* 28F1C 80038F1C 03004014 */  bnez       $v0, .L80038F2C
    /* 28F20 80038F20 00000000 */   nop
    /* 28F24 80038F24 1515010C */  jal        SpawnRock__Fv
    /* 28F28 80038F28 00000000 */   nop
  .L80038F2C:
    /* 28F2C 80038F2C DC9E010C */  jal        QuestStatus__Fi
    /* 28F30 80038F30 0A000424 */   addiu     $a0, $zero, 0xA
    /* 28F34 80038F34 FF004230 */  andi       $v0, $v0, 0xFF
    /* 28F38 80038F38 12004010 */  beqz       $v0, .L80038F84
    /* 28F3C 80038F3C 00000000 */   nop
    /* 28F40 80038F40 0E80023C */  lui        $v0, %hi(quests + 0xDA)
    /* 28F44 80038F44 1ADB4290 */  lbu        $v0, %lo(quests + 0xDA)($v0)
    /* 28F48 80038F48 00000000 */  nop
    /* 28F4C 80038F4C 0D004014 */  bnez       $v0, .L80038F84
    /* 28F50 80038F50 10000424 */   addiu     $a0, $zero, 0x10
    /* 28F54 80038F54 01000224 */  addiu      $v0, $zero, 0x1
    /* 28F58 80038F58 1280053C */  lui        $a1, %hi(setpc_x)
    /* 28F5C 80038F5C E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 28F60 80038F60 1280063C */  lui        $a2, %hi(setpc_y)
    /* 28F64 80038F64 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 28F68 80038F68 21380000 */  addu       $a3, $zero, $zero
    /* 28F6C 80038F6C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 28F70 80038F70 40280500 */  sll        $a1, $a1, 1
    /* 28F74 80038F74 40300600 */  sll        $a2, $a2, 1
    /* 28F78 80038F78 1B00A524 */  addiu      $a1, $a1, 0x1B
    /* 28F7C 80038F7C 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 28F80 80038F80 1B00C624 */   addiu     $a2, $a2, 0x1B
  .L80038F84:
    /* 28F84 80038F84 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28F88 80038F88 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28F8C 80038F8C 0800E003 */  jr         $ra
    /* 28F90 80038F90 00000000 */   nop
endlabel AddQuestItems__Fv
