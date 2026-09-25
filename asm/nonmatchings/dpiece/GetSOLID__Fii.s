.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSOLID__Fii, 0x48

glabel GetSOLID__Fii
    /* 72CE0 80082CE0 70008228 */  slti       $v0, $a0, 0x70
    /* 72CE4 80082CE4 03004010 */  beqz       $v0, .L80082CF4
    /* 72CE8 80082CE8 7000A228 */   slti      $v0, $a1, 0x70
    /* 72CEC 80082CEC 03004014 */  bnez       $v0, .L80082CFC
    /* 72CF0 80082CF0 C0100500 */   sll       $v0, $a1, 3
  .L80082CF4:
    /* 72CF4 80082CF4 480B0208 */  j          .L80082D20
    /* 72CF8 80082CF8 01000224 */   addiu     $v0, $zero, 0x1
  .L80082CFC:
    /* 72CFC 80082CFC C0180400 */  sll        $v1, $a0, 3
    /* 72D00 80082D00 23186400 */  subu       $v1, $v1, $a0
    /* 72D04 80082D04 C0190300 */  sll        $v1, $v1, 7
    /* 72D08 80082D08 21104300 */  addu       $v0, $v0, $v1
    /* 72D0C 80082D0C 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72D10 80082D10 21082200 */  addu       $at, $at, $v0
    /* 72D14 80082D14 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 72D18 80082D18 00000000 */  nop
    /* 72D1C 80082D1C 01004230 */  andi       $v0, $v0, 0x1
  .L80082D20:
    /* 72D20 80082D20 0800E003 */  jr         $ra
    /* 72D24 80082D24 00000000 */   nop
endlabel GetSOLID__Fii
