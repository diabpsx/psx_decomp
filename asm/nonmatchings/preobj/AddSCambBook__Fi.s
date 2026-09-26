.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSCambBook__Fi, 0xA0

glabel AddSCambBook__Fi
    /* 1C4C8 801560C0 40100400 */  sll        $v0, $a0, 1
    /* 1C4CC 801560C4 21104400 */  addu       $v0, $v0, $a0
    /* 1C4D0 801560C8 80100200 */  sll        $v0, $v0, 2
    /* 1C4D4 801560CC 23104400 */  subu       $v0, $v0, $a0
    /* 1C4D8 801560D0 80100200 */  sll        $v0, $v0, 2
    /* 1C4DC 801560D4 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1C4E0 801560D8 21082200 */  addu       $at, $at, $v0
    /* 1C4E4 801560DC 6D8C2490 */  lbu        $a0, %lo(object + 0x21)($at)
    /* 1C4E8 801560E0 1280033C */  lui        $v1, %hi(setpc_x)
    /* 1C4EC 801560E4 E4C0638C */  lw         $v1, %lo(setpc_x)($v1)
    /* 1C4F0 801560E8 1280053C */  lui        $a1, %hi(setpc_y)
    /* 1C4F4 801560EC E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 1C4F8 801560F0 1280063C */  lui        $a2, %hi(setpc_w)
    /* 1C4FC 801560F4 ECC0C68C */  lw         $a2, %lo(setpc_w)($a2)
    /* 1C500 801560F8 00260400 */  sll        $a0, $a0, 24
    /* 1C504 801560FC 03260400 */  sra        $a0, $a0, 24
    /* 1C508 80156100 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1C50C 80156104 21082200 */  addu       $at, $at, $v0
    /* 1C510 80156108 5A8C23A4 */  sh         $v1, %lo(object + 0xE)($at)
    /* 1C514 8015610C 21186600 */  addu       $v1, $v1, $a2
    /* 1C518 80156110 01006324 */  addiu      $v1, $v1, 0x1
    /* 1C51C 80156114 1280063C */  lui        $a2, %hi(setpc_h)
    /* 1C520 80156118 F0C0C68C */  lw         $a2, %lo(setpc_h)($a2)
    /* 1C524 8015611C 01008424 */  addiu      $a0, $a0, 0x1
    /* 1C528 80156120 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1C52C 80156124 21082200 */  addu       $at, $at, $v0
    /* 1C530 80156128 5C8C25A4 */  sh         $a1, %lo(object + 0x10)($at)
    /* 1C534 8015612C 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1C538 80156130 21082200 */  addu       $at, $at, $v0
    /* 1C53C 80156134 5E8C23A4 */  sh         $v1, %lo(object + 0x12)($at)
    /* 1C540 80156138 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 1C544 8015613C 21082200 */  addu       $at, $at, $v0
    /* 1C548 80156140 648C24A4 */  sh         $a0, %lo(object + 0x18)($at)
    /* 1C54C 80156144 2128A600 */  addu       $a1, $a1, $a2
    /* 1C550 80156148 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1C554 8015614C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1C558 80156150 21082200 */  addu       $at, $at, $v0
    /* 1C55C 80156154 608C25A4 */  sh         $a1, %lo(object + 0x14)($at)
    /* 1C560 80156158 0800E003 */  jr         $ra
    /* 1C564 8015615C 00000000 */   nop
endlabel AddSCambBook__Fi
