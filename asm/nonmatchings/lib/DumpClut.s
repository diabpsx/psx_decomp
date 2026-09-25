.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpClut, 0x40

glabel DumpClut
    /* 30D0 800130D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 30D4 800130D4 21308000 */  addu       $a2, $a0, $zero
    /* 30D8 800130D8 3F00C530 */  andi       $a1, $a2, 0x3F
    /* 30DC 800130DC FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 30E0 800130E0 1180043C */  lui        $a0, %hi(D_8010DDC0)
    /* 30E4 800130E4 C0DD8424 */  addiu      $a0, $a0, %lo(D_8010DDC0)
    /* 30E8 800130E8 00290500 */  sll        $a1, $a1, 4
    /* 30EC 800130EC 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 30F0 800130F0 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 30F4 800130F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 30F8 800130F8 09F84000 */  jalr       $v0
    /* 30FC 800130FC 82310600 */   srl       $a2, $a2, 6
    /* 3100 80013100 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3104 80013104 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3108 80013108 0800E003 */  jr         $ra
    /* 310C 8001310C 00000000 */   nop
endlabel DumpClut
