.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetRCnt, 0x38

glabel GetRCnt
    /* 11098 80021098 FFFF8330 */  andi       $v1, $a0, 0xFFFF
    /* 1109C 8002109C 03006228 */  slti       $v0, $v1, 0x3
    /* 110A0 800210A0 08004010 */  beqz       $v0, .L800210C4
    /* 110A4 800210A4 00190300 */   sll       $v1, $v1, 4
    /* 110A8 800210A8 0B80023C */  lui        $v0, %hi(D_800B6378)
    /* 110AC 800210AC 7863428C */  lw         $v0, %lo(D_800B6378)($v0)
    /* 110B0 800210B0 00000000 */  nop
    /* 110B4 800210B4 21186200 */  addu       $v1, $v1, $v0
    /* 110B8 800210B8 00006294 */  lhu        $v0, 0x0($v1)
    /* 110BC 800210BC 32840008 */  j          .L800210C8
    /* 110C0 800210C0 00000000 */   nop
  .L800210C4:
    /* 110C4 800210C4 21100000 */  addu       $v0, $zero, $zero
  .L800210C8:
    /* 110C8 800210C8 0800E003 */  jr         $ra
    /* 110CC 800210CC 00000000 */   nop
endlabel GetRCnt
