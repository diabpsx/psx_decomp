.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_Talker__Fi, 0x68

glabel M_Talker__Fi
    /* 6F550 8007F550 40100400 */  sll        $v0, $a0, 1
    /* 6F554 8007F554 21104400 */  addu       $v0, $v0, $a0
    /* 6F558 8007F558 80100200 */  sll        $v0, $v0, 2
    /* 6F55C 8007F55C 21104400 */  addu       $v0, $v0, $a0
    /* 6F560 8007F560 C0100200 */  sll        $v0, $v0, 3
    /* 6F564 8007F564 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 6F568 8007F568 21082200 */  addu       $at, $at, $v0
    /* 6F56C 8007F56C E0532490 */  lbu        $a0, %lo(monster + 0x4C)($at)
    /* 6F570 8007F570 1C000224 */  addiu      $v0, $zero, 0x1C
    /* 6F574 8007F574 FF008330 */  andi       $v1, $a0, 0xFF
    /* 6F578 8007F578 0C006210 */  beq        $v1, $v0, .L8007F5AC
    /* 6F57C 8007F57C 1F000224 */   addiu     $v0, $zero, 0x1F
    /* 6F580 8007F580 0A006210 */  beq        $v1, $v0, .L8007F5AC
    /* 6F584 8007F584 12000224 */   addiu     $v0, $zero, 0x12
    /* 6F588 8007F588 08006210 */  beq        $v1, $v0, .L8007F5AC
    /* 6F58C 8007F58C EAFF8224 */   addiu     $v0, $a0, -0x16
    /* 6F590 8007F590 0200422C */  sltiu      $v0, $v0, 0x2
    /* 6F594 8007F594 06004014 */  bnez       $v0, .L8007F5B0
    /* 6F598 8007F598 01000224 */   addiu     $v0, $zero, 0x1
    /* 6F59C 8007F59C E3FF8224 */  addiu      $v0, $a0, -0x1D
    /* 6F5A0 8007F5A0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 6F5A4 8007F5A4 02004010 */  beqz       $v0, .L8007F5B0
    /* 6F5A8 8007F5A8 21100000 */   addu      $v0, $zero, $zero
  .L8007F5AC:
    /* 6F5AC 8007F5AC 01000224 */  addiu      $v0, $zero, 0x1
  .L8007F5B0:
    /* 6F5B0 8007F5B0 0800E003 */  jr         $ra
    /* 6F5B4 8007F5B4 00000000 */   nop
endlabel M_Talker__Fi
