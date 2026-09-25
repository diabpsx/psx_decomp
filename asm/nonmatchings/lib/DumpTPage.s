.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpTPage, 0x60

glabel DumpTPage
    /* 3070 80013070 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3074 80013074 FFFF8730 */  andi       $a3, $a0, 0xFFFF
    /* 3078 80013078 00190700 */  sll        $v1, $a3, 4
    /* 307C 8001307C 00016330 */  andi       $v1, $v1, 0x100
    /* 3080 80013080 82100700 */  srl        $v0, $a3, 2
    /* 3084 80013084 00024230 */  andi       $v0, $v0, 0x200
    /* 3088 80013088 25186200 */  or         $v1, $v1, $v0
    /* 308C 8001308C C2290700 */  srl        $a1, $a3, 7
    /* 3090 80013090 42310700 */  srl        $a2, $a3, 5
    /* 3094 80013094 80390700 */  sll        $a3, $a3, 6
    /* 3098 80013098 1180043C */  lui        $a0, %hi(D_8010DDA8)
    /* 309C 8001309C A8DD8424 */  addiu      $a0, $a0, %lo(D_8010DDA8)
    /* 30A0 800130A0 0300A530 */  andi       $a1, $a1, 0x3
    /* 30A4 800130A4 0300C630 */  andi       $a2, $a2, 0x3
    /* 30A8 800130A8 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 30AC 800130AC A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 30B0 800130B0 C007E730 */  andi       $a3, $a3, 0x7C0
    /* 30B4 800130B4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 30B8 800130B8 09F84000 */  jalr       $v0
    /* 30BC 800130BC 1000A3AF */   sw        $v1, 0x10($sp)
    /* 30C0 800130C0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 30C4 800130C4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 30C8 800130C8 0800E003 */  jr         $ra
    /* 30CC 800130CC 00000000 */   nop
endlabel DumpTPage
