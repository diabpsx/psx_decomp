.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndLocOk__Fii, 0x118

glabel RndLocOk__Fii
    /* 1D8C8 801574C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D8CC 801574C4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D8D0 801574C8 21888000 */  addu       $s1, $a0, $zero
    /* 1D8D4 801574CC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1D8D8 801574D0 2190A000 */  addu       $s2, $a1, $zero
    /* 1D8DC 801574D4 C0101200 */  sll        $v0, $s2, 3
    /* 1D8E0 801574D8 C0181100 */  sll        $v1, $s1, 3
    /* 1D8E4 801574DC 23187100 */  subu       $v1, $v1, $s1
    /* 1D8E8 801574E0 C0190300 */  sll        $v1, $v1, 7
    /* 1D8EC 801574E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D8F0 801574E8 21804300 */  addu       $s0, $v0, $v1
    /* 1D8F4 801574EC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1D8F8 801574F0 0E80013C */  lui        $at, %hi(dung_map)
    /* 1D8FC 801574F4 21083000 */  addu       $at, $at, $s0
    /* 1D900 801574F8 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 1D904 801574FC 00000000 */  nop
    /* 1D908 80157500 2E004014 */  bnez       $v0, .L801575BC
    /* 1D90C 80157504 21100000 */   addu      $v0, $zero, $zero
    /* 1D910 80157508 21202002 */  addu       $a0, $s1, $zero
    /* 1D914 8015750C 447F010C */  jal        IsDplayer__Fii
    /* 1D918 80157510 21284002 */   addu      $a1, $s2, $zero
    /* 1D91C 80157514 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1D920 80157518 28004014 */  bnez       $v0, .L801575BC
    /* 1D924 8015751C 21100000 */   addu      $v0, $zero, $zero
    /* 1D928 80157520 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1D92C 80157524 21083000 */  addu       $at, $at, $s0
    /* 1D930 80157528 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 1D934 8015752C 00000000 */  nop
    /* 1D938 80157530 22004014 */  bnez       $v0, .L801575BC
    /* 1D93C 80157534 21100000 */   addu      $v0, $zero, $zero
    /* 1D940 80157538 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1D944 8015753C 21083000 */  addu       $at, $at, $s0
    /* 1D948 80157540 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1D94C 80157544 00000000 */  nop
    /* 1D950 80157548 08004230 */  andi       $v0, $v0, 0x8
    /* 1D954 8015754C 1B004014 */  bnez       $v0, .L801575BC
    /* 1D958 80157550 21100000 */   addu      $v0, $zero, $zero
    /* 1D95C 80157554 21202002 */  addu       $a0, $s1, $zero
    /* 1D960 80157558 380B020C */  jal        GetSOLID__Fii
    /* 1D964 8015755C 21284002 */   addu      $a1, $s2, $zero
    /* 1D968 80157560 16004014 */  bnez       $v0, .L801575BC
    /* 1D96C 80157564 21100000 */   addu      $v0, $zero, $zero
    /* 1D970 80157568 1280033C */  lui        $v1, %hi(leveltype)
    /* 1D974 8015756C 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 1D978 80157570 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D97C 80157574 11006214 */  bne        $v1, $v0, .L801575BC
    /* 1D980 80157578 21800000 */   addu      $s0, $zero, $zero
    /* 1D984 8015757C 21202002 */  addu       $a0, $s1, $zero
    /* 1D988 80157580 910A020C */  jal        GetDPiece__Fii
    /* 1D98C 80157584 21284002 */   addu      $a1, $s2, $zero
    /* 1D990 80157588 00140200 */  sll        $v0, $v0, 16
    /* 1D994 8015758C 03140200 */  sra        $v0, $v0, 16
    /* 1D998 80157590 7F004228 */  slti       $v0, $v0, 0x7F
    /* 1D99C 80157594 06004014 */  bnez       $v0, .L801575B0
    /* 1D9A0 80157598 21202002 */   addu      $a0, $s1, $zero
    /* 1D9A4 8015759C 910A020C */  jal        GetDPiece__Fii
    /* 1D9A8 801575A0 21284002 */   addu      $a1, $s2, $zero
    /* 1D9AC 801575A4 00140200 */  sll        $v0, $v0, 16
    /* 1D9B0 801575A8 03140200 */  sra        $v0, $v0, 16
    /* 1D9B4 801575AC 90005028 */  slti       $s0, $v0, 0x90
  .L801575B0:
    /* 1D9B8 801575B0 02000016 */  bnez       $s0, .L801575BC
    /* 1D9BC 801575B4 21100000 */   addu      $v0, $zero, $zero
    /* 1D9C0 801575B8 01000224 */  addiu      $v0, $zero, 0x1
  .L801575BC:
    /* 1D9C4 801575BC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1D9C8 801575C0 1800B28F */  lw         $s2, 0x18($sp)
    /* 1D9CC 801575C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D9D0 801575C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D9D4 801575CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D9D8 801575D0 0800E003 */  jr         $ra
    /* 1D9DC 801575D4 00000000 */   nop
endlabel RndLocOk__Fii
