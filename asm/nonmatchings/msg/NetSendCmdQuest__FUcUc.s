.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdQuest__FUcUc, 0x74

glabel NetSendCmdQuest__FUcUc
    /* 3F8C8 8004F8C8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F8CC 8004F8CC 58000224 */  addiu      $v0, $zero, 0x58
    /* 3F8D0 8004F8D0 1100A5A3 */  sb         $a1, 0x11($sp)
    /* 3F8D4 8004F8D4 FF00A530 */  andi       $a1, $a1, 0xFF
    /* 3F8D8 8004F8D8 1000A2A3 */  sb         $v0, 0x10($sp)
    /* 3F8DC 8004F8DC 80100500 */  sll        $v0, $a1, 2
    /* 3F8E0 8004F8E0 21104500 */  addu       $v0, $v0, $a1
    /* 3F8E4 8004F8E4 80100200 */  sll        $v0, $v0, 2
    /* 3F8E8 8004F8E8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F8EC 8004F8EC 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 3F8F0 8004F8F0 21082200 */  addu       $at, $at, $v0
    /* 3F8F4 8004F8F4 42DA2390 */  lbu        $v1, %lo(quests + 0x2)($at)
    /* 3F8F8 8004F8F8 00000000 */  nop
    /* 3F8FC 8004F8FC 1200A3A3 */  sb         $v1, 0x12($sp)
    /* 3F900 8004F900 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 3F904 8004F904 21082200 */  addu       $at, $at, $v0
    /* 3F908 8004F908 51DA2390 */  lbu        $v1, %lo(quests + 0x11)($at)
    /* 3F90C 8004F90C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3F910 8004F910 1300A3A3 */  sb         $v1, 0x13($sp)
    /* 3F914 8004F914 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 3F918 8004F918 21082200 */  addu       $at, $at, $v0
    /* 3F91C 8004F91C 4FDA2290 */  lbu        $v0, %lo(quests + 0xF)($at)
    /* 3F920 8004F920 05000524 */  addiu      $a1, $zero, 0x5
    /* 3F924 8004F924 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3F928 8004F928 1400A2A3 */   sb        $v0, 0x14($sp)
    /* 3F92C 8004F92C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F930 8004F930 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F934 8004F934 0800E003 */  jr         $ra
    /* 3F938 8004F938 00000000 */   nop
endlabel NetSendCmdQuest__FUcUc
