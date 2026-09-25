.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMultiQuest__FiiUci, 0x80

glabel SetMultiQuest__FiiUci
    /* 5916C 8006916C 80100400 */  sll        $v0, $a0, 2
    /* 59170 80069170 21104400 */  addu       $v0, $v0, $a0
    /* 59174 80069174 80200200 */  sll        $a0, $v0, 2
    /* 59178 80069178 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 5917C 8006917C 21082400 */  addu       $at, $at, $a0
    /* 59180 80069180 42DA2390 */  lbu        $v1, %lo(quests + 0x2)($at)
    /* 59184 80069184 03000224 */  addiu      $v0, $zero, 0x3
    /* 59188 80069188 16006210 */  beq        $v1, $v0, .L800691E4
    /* 5918C 8006918C 2A106500 */   slt       $v0, $v1, $a1
    /* 59190 80069190 04004010 */  beqz       $v0, .L800691A4
    /* 59194 80069194 00000000 */   nop
    /* 59198 80069198 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 5919C 8006919C 21082400 */  addu       $at, $at, $a0
    /* 591A0 800691A0 42DA25A0 */  sb         $a1, %lo(quests + 0x2)($at)
  .L800691A4:
    /* 591A4 800691A4 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 591A8 800691A8 21082400 */  addu       $at, $at, $a0
    /* 591AC 800691AC 51DA2290 */  lbu        $v0, %lo(quests + 0x11)($at)
    /* 591B0 800691B0 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 591B4 800691B4 21082400 */  addu       $at, $at, $a0
    /* 591B8 800691B8 4FDA2390 */  lbu        $v1, %lo(quests + 0xF)($at)
    /* 591BC 800691BC 25104600 */  or         $v0, $v0, $a2
    /* 591C0 800691C0 2A186700 */  slt        $v1, $v1, $a3
    /* 591C4 800691C4 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 591C8 800691C8 21082400 */  addu       $at, $at, $a0
    /* 591CC 800691CC 51DA22A0 */  sb         $v0, %lo(quests + 0x11)($at)
    /* 591D0 800691D0 04006010 */  beqz       $v1, .L800691E4
    /* 591D4 800691D4 00000000 */   nop
    /* 591D8 800691D8 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 591DC 800691DC 21082400 */  addu       $at, $at, $a0
    /* 591E0 800691E0 4FDA27A0 */  sb         $a3, %lo(quests + 0xF)($at)
  .L800691E4:
    /* 591E4 800691E4 0800E003 */  jr         $ra
    /* 591E8 800691E8 00000000 */   nop
endlabel SetMultiQuest__FiiUci
