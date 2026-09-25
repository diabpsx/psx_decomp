.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlrClrTrans__Fii, 0x78

glabel PlrClrTrans__Fii
    /* 50C6C 80060C6C FFFFA724 */  addiu      $a3, $a1, -0x1
    /* 50C70 80060C70 0100A524 */  addiu      $a1, $a1, 0x1
    /* 50C74 80060C74 2A10A700 */  slt        $v0, $a1, $a3
    /* 50C78 80060C78 18004014 */  bnez       $v0, .L80060CDC
    /* 50C7C 80060C7C 00000000 */   nop
    /* 50C80 80060C80 01008824 */  addiu      $t0, $a0, 0x1
  .L80060C84:
    /* 50C84 80060C84 FFFF8624 */  addiu      $a2, $a0, -0x1
    /* 50C88 80060C88 2A100601 */  slt        $v0, $t0, $a2
    /* 50C8C 80060C8C 0F004014 */  bnez       $v0, .L80060CCC
    /* 50C90 80060C90 C0100600 */   sll       $v0, $a2, 3
    /* 50C94 80060C94 C0180700 */  sll        $v1, $a3, 3
    /* 50C98 80060C98 23104600 */  subu       $v0, $v0, $a2
    /* 50C9C 80060C9C C0110200 */  sll        $v0, $v0, 7
    /* 50CA0 80060CA0 21184300 */  addu       $v1, $v0, $v1
  .L80060CA4:
    /* 50CA4 80060CA4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 50CA8 80060CA8 21082300 */  addu       $at, $at, $v1
    /* 50CAC 80060CAC 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 50CB0 80060CB0 0100C624 */  addiu      $a2, $a2, 0x1
    /* 50CB4 80060CB4 0E80013C */  lui        $at, %hi(TransList)
    /* 50CB8 80060CB8 21082200 */  addu       $at, $at, $v0
    /* 50CBC 80060CBC 287920A0 */  sb         $zero, %lo(TransList)($at)
    /* 50CC0 80060CC0 2A100601 */  slt        $v0, $t0, $a2
    /* 50CC4 80060CC4 F7FF4010 */  beqz       $v0, .L80060CA4
    /* 50CC8 80060CC8 80036324 */   addiu     $v1, $v1, 0x380
  .L80060CCC:
    /* 50CCC 80060CCC 0100E724 */  addiu      $a3, $a3, 0x1
    /* 50CD0 80060CD0 2A10A700 */  slt        $v0, $a1, $a3
    /* 50CD4 80060CD4 EBFF4010 */  beqz       $v0, .L80060C84
    /* 50CD8 80060CD8 00000000 */   nop
  .L80060CDC:
    /* 50CDC 80060CDC 0800E003 */  jr         $ra
    /* 50CE0 80060CE0 00000000 */   nop
endlabel PlrClrTrans__Fii
