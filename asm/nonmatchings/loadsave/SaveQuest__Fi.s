.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SaveQuest__Fi, 0xCC

glabel SaveQuest__Fi
    /* 21F98 8015BB90 80100400 */  sll        $v0, $a0, 2
    /* 21F9C 8015BB94 21104400 */  addu       $v0, $v0, $a0
    /* 21FA0 8015BB98 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21FA4 8015BB9C 80100200 */  sll        $v0, $v0, 2
    /* 21FA8 8015BBA0 0E80013C */  lui        $at, %hi(quests + 0x3)
    /* 21FAC 8015BBA4 21082200 */  addu       $at, $at, $v0
    /* 21FB0 8015BBA8 43DA2488 */  lwl        $a0, %lo(quests + 0x3)($at)
    /* 21FB4 8015BBAC 0E80013C */  lui        $at, %hi(quests)
    /* 21FB8 8015BBB0 21082200 */  addu       $at, $at, $v0
    /* 21FBC 8015BBB4 40DA2498 */  lwr        $a0, %lo(quests)($at)
    /* 21FC0 8015BBB8 0E80013C */  lui        $at, %hi(quests + 0x7)
    /* 21FC4 8015BBBC 21082200 */  addu       $at, $at, $v0
    /* 21FC8 8015BBC0 47DA2588 */  lwl        $a1, %lo(quests + 0x7)($at)
    /* 21FCC 8015BBC4 0E80013C */  lui        $at, %hi(quests + 0x4)
    /* 21FD0 8015BBC8 21082200 */  addu       $at, $at, $v0
    /* 21FD4 8015BBCC 44DA2598 */  lwr        $a1, %lo(quests + 0x4)($at)
    /* 21FD8 8015BBD0 0E80013C */  lui        $at, %hi(quests + 0xB)
    /* 21FDC 8015BBD4 21082200 */  addu       $at, $at, $v0
    /* 21FE0 8015BBD8 4BDA2688 */  lwl        $a2, %lo(quests + 0xB)($at)
    /* 21FE4 8015BBDC 0E80013C */  lui        $at, %hi(quests + 0x8)
    /* 21FE8 8015BBE0 21082200 */  addu       $at, $at, $v0
    /* 21FEC 8015BBE4 48DA2698 */  lwr        $a2, %lo(quests + 0x8)($at)
    /* 21FF0 8015BBE8 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 21FF4 8015BBEC 21082200 */  addu       $at, $at, $v0
    /* 21FF8 8015BBF0 4FDA2788 */  lwl        $a3, %lo(quests + 0xF)($at)
    /* 21FFC 8015BBF4 0E80013C */  lui        $at, %hi(quests + 0xC)
    /* 22000 8015BBF8 21082200 */  addu       $at, $at, $v0
    /* 22004 8015BBFC 4CDA2798 */  lwr        $a3, %lo(quests + 0xC)($at)
    /* 22008 8015BC00 030064A8 */  swl        $a0, 0x3($v1)
    /* 2200C 8015BC04 000064B8 */  swr        $a0, 0x0($v1)
    /* 22010 8015BC08 070065A8 */  swl        $a1, 0x7($v1)
    /* 22014 8015BC0C 040065B8 */  swr        $a1, 0x4($v1)
    /* 22018 8015BC10 0B0066A8 */  swl        $a2, 0xB($v1)
    /* 2201C 8015BC14 080066B8 */  swr        $a2, 0x8($v1)
    /* 22020 8015BC18 0F0067A8 */  swl        $a3, 0xF($v1)
    /* 22024 8015BC1C 0C0067B8 */  swr        $a3, 0xC($v1)
    /* 22028 8015BC20 0E80013C */  lui        $at, %hi(quests + 0x13)
    /* 2202C 8015BC24 21082200 */  addu       $at, $at, $v0
    /* 22030 8015BC28 53DA2488 */  lwl        $a0, %lo(quests + 0x13)($at)
    /* 22034 8015BC2C 0E80013C */  lui        $at, %hi(quests + 0x10)
    /* 22038 8015BC30 21082200 */  addu       $at, $at, $v0
    /* 2203C 8015BC34 50DA2498 */  lwr        $a0, %lo(quests + 0x10)($at)
    /* 22040 8015BC38 00000000 */  nop
    /* 22044 8015BC3C 130064A8 */  swl        $a0, 0x13($v1)
    /* 22048 8015BC40 100064B8 */  swr        $a0, 0x10($v1)
    /* 2204C 8015BC44 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22050 8015BC48 00000000 */  nop
    /* 22054 8015BC4C 14004224 */  addiu      $v0, $v0, 0x14
    /* 22058 8015BC50 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 2205C 8015BC54 0800E003 */  jr         $ra
    /* 22060 8015BC58 00000000 */   nop
endlabel SaveQuest__Fi
