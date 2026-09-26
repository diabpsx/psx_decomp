.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddPedistal__Fi, 0xA8

glabel AddPedistal__Fi
    /* 1D328 80156F20 40100400 */  sll        $v0, $a0, 1
    /* 1D32C 80156F24 21104400 */  addu       $v0, $v0, $a0
    /* 1D330 80156F28 80100200 */  sll        $v0, $v0, 2
    /* 1D334 80156F2C 23104400 */  subu       $v0, $v0, $a0
    /* 1D338 80156F30 80300200 */  sll        $a2, $v0, 2
    /* 1D33C 80156F34 1280033C */  lui        $v1, %hi(setpc_x)
    /* 1D340 80156F38 E4C0638C */  lw         $v1, %lo(setpc_x)($v1)
    /* 1D344 80156F3C 1280043C */  lui        $a0, %hi(setpc_y)
    /* 1D348 80156F40 E8C0848C */  lw         $a0, %lo(setpc_y)($a0)
    /* 1D34C 80156F44 1280023C */  lui        $v0, %hi(setpc_w)
    /* 1D350 80156F48 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 1D354 80156F4C 1280053C */  lui        $a1, %hi(setpc_h)
    /* 1D358 80156F50 F0C0A58C */  lw         $a1, %lo(setpc_h)($a1)
    /* 1D35C 80156F54 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1D360 80156F58 21082600 */  addu       $at, $at, $a2
    /* 1D364 80156F5C 5A8C23A4 */  sh         $v1, %lo(object + 0xE)($at)
    /* 1D368 80156F60 21186200 */  addu       $v1, $v1, $v0
    /* 1D36C 80156F64 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1D370 80156F68 21082600 */  addu       $at, $at, $a2
    /* 1D374 80156F6C 5C8C24A4 */  sh         $a0, %lo(object + 0x10)($at)
    /* 1D378 80156F70 21208500 */  addu       $a0, $a0, $a1
    /* 1D37C 80156F74 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1D380 80156F78 21082600 */  addu       $at, $at, $a2
    /* 1D384 80156F7C 5E8C23A4 */  sh         $v1, %lo(object + 0x12)($at)
    /* 1D388 80156F80 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1D38C 80156F84 21082600 */  addu       $at, $at, $a2
    /* 1D390 80156F88 608C24A4 */  sh         $a0, %lo(object + 0x14)($at)
    /* 1D394 80156F8C 0E80023C */  lui        $v0, %hi(quests + 0xC4)
    /* 1D398 80156F90 04DB4290 */  lbu        $v0, %lo(quests + 0xC4)($v0)
    /* 1D39C 80156F94 00000000 */  nop
    /* 1D3A0 80156F98 06004010 */  beqz       $v0, .L80156FB4
    /* 1D3A4 80156F9C FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1D3A8 80156FA0 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 1D3AC 80156FA4 21082600 */  addu       $at, $at, $a2
    /* 1D3B0 80156FA8 648C22A4 */  sh         $v0, %lo(object + 0x18)($at)
    /* 1D3B4 80156FAC F05B0508 */  j          .L80156FC0
    /* 1D3B8 80156FB0 00000000 */   nop
  .L80156FB4:
    /* 1D3BC 80156FB4 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 1D3C0 80156FB8 21082600 */  addu       $at, $at, $a2
    /* 1D3C4 80156FBC 648C20A4 */  sh         $zero, %lo(object + 0x18)($at)
  .L80156FC0:
    /* 1D3C8 80156FC0 0800E003 */  jr         $ra
    /* 1D3CC 80156FC4 00000000 */   nop
endlabel AddPedistal__Fi
