.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching QuestStatus__Fi, 0x94

glabel QuestStatus__Fi
    /* 57B70 80067B70 1280023C */  lui        $v0, %hi(setlevel)
    /* 57B74 80067B74 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 57B78 80067B78 00000000 */  nop
    /* 57B7C 80067B7C 12004014 */  bnez       $v0, .L80067BC8
    /* 57B80 80067B80 21288000 */   addu      $a1, $a0, $zero
    /* 57B84 80067B84 80100500 */  sll        $v0, $a1, 2
    /* 57B88 80067B88 21104500 */  addu       $v0, $v0, $a1
    /* 57B8C 80067B8C 80200200 */  sll        $a0, $v0, 2
    /* 57B90 80067B90 1280033C */  lui        $v1, %hi(currlevel)
    /* 57B94 80067B94 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 57B98 80067B98 0E80013C */  lui        $at, %hi(quests)
    /* 57B9C 80067B9C 21082400 */  addu       $at, $at, $a0
    /* 57BA0 80067BA0 40DA2290 */  lbu        $v0, %lo(quests)($at)
    /* 57BA4 80067BA4 00000000 */  nop
    /* 57BA8 80067BA8 14006214 */  bne        $v1, $v0, .L80067BFC
    /* 57BAC 80067BAC 21100000 */   addu      $v0, $zero, $zero
    /* 57BB0 80067BB0 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 57BB4 80067BB4 21082400 */  addu       $at, $at, $a0
    /* 57BB8 80067BB8 42DA2290 */  lbu        $v0, %lo(quests + 0x2)($at)
    /* 57BBC 80067BBC 00000000 */  nop
    /* 57BC0 80067BC0 03004014 */  bnez       $v0, .L80067BD0
    /* 57BC4 80067BC4 01000324 */   addiu     $v1, $zero, 0x1
  .L80067BC8:
    /* 57BC8 80067BC8 FF9E0108 */  j          .L80067BFC
    /* 57BCC 80067BCC 21100000 */   addu      $v0, $zero, $zero
  .L80067BD0:
    /* 57BD0 80067BD0 1280043C */  lui        $a0, %hi(gbMaxPlayers)
    /* 57BD4 80067BD4 A2B98490 */  lbu        $a0, %lo(gbMaxPlayers)($a0)
    /* 57BD8 80067BD8 00000000 */  nop
    /* 57BDC 80067BDC 07008310 */  beq        $a0, $v1, .L80067BFC
    /* 57BE0 80067BE0 01000224 */   addiu     $v0, $zero, 0x1
    /* 57BE4 80067BE4 00110500 */  sll        $v0, $a1, 4
    /* 57BE8 80067BE8 0E80013C */  lui        $at, %hi(questlist + 0x6)
    /* 57BEC 80067BEC 21082200 */  addu       $at, $at, $v0
    /* 57BF0 80067BF0 0ED92290 */  lbu        $v0, %lo(questlist + 0x6)($at)
    /* 57BF4 80067BF4 00000000 */  nop
    /* 57BF8 80067BF8 01004230 */  andi       $v0, $v0, 0x1
  .L80067BFC:
    /* 57BFC 80067BFC 0800E003 */  jr         $ra
    /* 57C00 80067C00 00000000 */   nop
endlabel QuestStatus__Fi
