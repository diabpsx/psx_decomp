.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UpdateL4Trans__Fv, 0x5C

glabel UpdateL4Trans__Fv
    /* 24944 8015E53C 21280000 */  addu       $a1, $zero, $zero
    /* 24948 8015E540 01000624 */  addiu      $a2, $zero, 0x1
  .L8015E544:
    /* 2494C 8015E544 21200000 */  addu       $a0, $zero, $zero
    /* 24950 8015E548 C0180500 */  sll        $v1, $a1, 3
  .L8015E54C:
    /* 24954 8015E54C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 24958 8015E550 21082300 */  addu       $at, $at, $v1
    /* 2495C 8015E554 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 24960 8015E558 00000000 */  nop
    /* 24964 8015E55C 04004010 */  beqz       $v0, .L8015E570
    /* 24968 8015E560 00000000 */   nop
    /* 2496C 8015E564 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 24970 8015E568 21082300 */  addu       $at, $at, $v1
    /* 24974 8015E56C 2F7A26A0 */  sb         $a2, %lo(dung_map + 0x7)($at)
  .L8015E570:
    /* 24978 8015E570 01008424 */  addiu      $a0, $a0, 0x1
    /* 2497C 8015E574 60008228 */  slti       $v0, $a0, 0x60
    /* 24980 8015E578 F4FF4014 */  bnez       $v0, .L8015E54C
    /* 24984 8015E57C 80036324 */   addiu     $v1, $v1, 0x380
    /* 24988 8015E580 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2498C 8015E584 6000A228 */  slti       $v0, $a1, 0x60
    /* 24990 8015E588 EEFF4014 */  bnez       $v0, .L8015E544
    /* 24994 8015E58C 00000000 */   nop
    /* 24998 8015E590 0800E003 */  jr         $ra
    /* 2499C 8015E594 00000000 */   nop
endlabel UpdateL4Trans__Fv
