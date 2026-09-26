.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TrapLocOk__Fii, 0x54

glabel TrapLocOk__Fii
    /* 1D9E0 801575D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D9E4 801575DC C0100500 */  sll        $v0, $a1, 3
    /* 1D9E8 801575E0 C0180400 */  sll        $v1, $a0, 3
    /* 1D9EC 801575E4 23186400 */  subu       $v1, $v1, $a0
    /* 1D9F0 801575E8 C0190300 */  sll        $v1, $v1, 7
    /* 1D9F4 801575EC 21104300 */  addu       $v0, $v0, $v1
    /* 1D9F8 801575F0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1D9FC 801575F4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1DA00 801575F8 21082200 */  addu       $at, $at, $v0
    /* 1DA04 801575FC 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1DA08 80157600 00000000 */  nop
    /* 1DA0C 80157604 08004230 */  andi       $v0, $v0, 0x8
    /* 1DA10 80157608 04004014 */  bnez       $v0, .L8015761C
    /* 1DA14 8015760C 21100000 */   addu      $v0, $zero, $zero
    /* 1DA18 80157610 380B020C */  jal        GetSOLID__Fii
    /* 1DA1C 80157614 00000000 */   nop
    /* 1DA20 80157618 0100422C */  sltiu      $v0, $v0, 0x1
  .L8015761C:
    /* 1DA24 8015761C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1DA28 80157620 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1DA2C 80157624 0800E003 */  jr         $ra
    /* 1DA30 80157628 00000000 */   nop
endlabel TrapLocOk__Fii
