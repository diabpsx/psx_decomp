.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadQuest__Fi, 0xC8

glabel LoadQuest__Fi
    /* 21E14 8015BA0C 80100400 */  sll        $v0, $a0, 2
    /* 21E18 8015BA10 21104400 */  addu       $v0, $v0, $a0
    /* 21E1C 8015BA14 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21E20 8015BA18 80100200 */  sll        $v0, $v0, 2
    /* 21E24 8015BA1C 03006488 */  lwl        $a0, 0x3($v1)
    /* 21E28 8015BA20 00006498 */  lwr        $a0, 0x0($v1)
    /* 21E2C 8015BA24 07006588 */  lwl        $a1, 0x7($v1)
    /* 21E30 8015BA28 04006598 */  lwr        $a1, 0x4($v1)
    /* 21E34 8015BA2C 0B006688 */  lwl        $a2, 0xB($v1)
    /* 21E38 8015BA30 08006698 */  lwr        $a2, 0x8($v1)
    /* 21E3C 8015BA34 0F006788 */  lwl        $a3, 0xF($v1)
    /* 21E40 8015BA38 0C006798 */  lwr        $a3, 0xC($v1)
    /* 21E44 8015BA3C 0E80013C */  lui        $at, %hi(quests + 0x3)
    /* 21E48 8015BA40 21082200 */  addu       $at, $at, $v0
    /* 21E4C 8015BA44 43DA24A8 */  swl        $a0, %lo(quests + 0x3)($at)
    /* 21E50 8015BA48 0E80013C */  lui        $at, %hi(quests)
    /* 21E54 8015BA4C 21082200 */  addu       $at, $at, $v0
    /* 21E58 8015BA50 40DA24B8 */  swr        $a0, %lo(quests)($at)
    /* 21E5C 8015BA54 0E80013C */  lui        $at, %hi(quests + 0x7)
    /* 21E60 8015BA58 21082200 */  addu       $at, $at, $v0
    /* 21E64 8015BA5C 47DA25A8 */  swl        $a1, %lo(quests + 0x7)($at)
    /* 21E68 8015BA60 0E80013C */  lui        $at, %hi(quests + 0x4)
    /* 21E6C 8015BA64 21082200 */  addu       $at, $at, $v0
    /* 21E70 8015BA68 44DA25B8 */  swr        $a1, %lo(quests + 0x4)($at)
    /* 21E74 8015BA6C 0E80013C */  lui        $at, %hi(quests + 0xB)
    /* 21E78 8015BA70 21082200 */  addu       $at, $at, $v0
    /* 21E7C 8015BA74 4BDA26A8 */  swl        $a2, %lo(quests + 0xB)($at)
    /* 21E80 8015BA78 0E80013C */  lui        $at, %hi(quests + 0x8)
    /* 21E84 8015BA7C 21082200 */  addu       $at, $at, $v0
    /* 21E88 8015BA80 48DA26B8 */  swr        $a2, %lo(quests + 0x8)($at)
    /* 21E8C 8015BA84 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 21E90 8015BA88 21082200 */  addu       $at, $at, $v0
    /* 21E94 8015BA8C 4FDA27A8 */  swl        $a3, %lo(quests + 0xF)($at)
    /* 21E98 8015BA90 0E80013C */  lui        $at, %hi(quests + 0xC)
    /* 21E9C 8015BA94 21082200 */  addu       $at, $at, $v0
    /* 21EA0 8015BA98 4CDA27B8 */  swr        $a3, %lo(quests + 0xC)($at)
    /* 21EA4 8015BA9C 13006488 */  lwl        $a0, 0x13($v1)
    /* 21EA8 8015BAA0 10006498 */  lwr        $a0, 0x10($v1)
    /* 21EAC 8015BAA4 0E80013C */  lui        $at, %hi(quests + 0x13)
    /* 21EB0 8015BAA8 21082200 */  addu       $at, $at, $v0
    /* 21EB4 8015BAAC 53DA24A8 */  swl        $a0, %lo(quests + 0x13)($at)
    /* 21EB8 8015BAB0 0E80013C */  lui        $at, %hi(quests + 0x10)
    /* 21EBC 8015BAB4 21082200 */  addu       $at, $at, $v0
    /* 21EC0 8015BAB8 50DA24B8 */  swr        $a0, %lo(quests + 0x10)($at)
    /* 21EC4 8015BABC 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21EC8 8015BAC0 00000000 */  nop
    /* 21ECC 8015BAC4 14004224 */  addiu      $v0, $v0, 0x14
    /* 21ED0 8015BAC8 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21ED4 8015BACC 0800E003 */  jr         $ra
    /* 21ED8 8015BAD0 00000000 */   nop
endlabel LoadQuest__Fi
