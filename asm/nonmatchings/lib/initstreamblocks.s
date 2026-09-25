.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initstreamblocks, 0x4C

glabel initstreamblocks
    /* 1F394 8002F394 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1F398 8002F398 00000000 */  nop
    /* 1F39C 8002F39C 0D004010 */  beqz       $v0, .L8002F3D4
    /* 1F3A0 8002F3A0 F8FFBD27 */   addiu     $sp, $sp, -0x8
    /* 1F3A4 8002F3A4 740044AC */  sw         $a0, 0x74($v0)
    /* 1F3A8 8002F3A8 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 1F3AC 8002F3AC 0800A018 */  blez       $a1, .L8002F3D0
    /* 1F3B0 8002F3B0 21180000 */   addu      $v1, $zero, $zero
    /* 1F3B4 8002F3B4 9C008224 */  addiu      $v0, $a0, 0x9C
  .L8002F3B8:
    /* 1F3B8 8002F3B8 980082AC */  sw         $v0, 0x98($a0)
    /* 1F3BC 8002F3BC 21204000 */  addu       $a0, $v0, $zero
    /* 1F3C0 8002F3C0 01006324 */  addiu      $v1, $v1, 0x1
    /* 1F3C4 8002F3C4 2A106500 */  slt        $v0, $v1, $a1
    /* 1F3C8 8002F3C8 FBFF4014 */  bnez       $v0, .L8002F3B8
    /* 1F3CC 8002F3CC 9C008224 */   addiu     $v0, $a0, 0x9C
  .L8002F3D0:
    /* 1F3D0 8002F3D0 980080AC */  sw         $zero, 0x98($a0)
  .L8002F3D4:
    /* 1F3D4 8002F3D4 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 1F3D8 8002F3D8 0800E003 */  jr         $ra
    /* 1F3DC 8002F3DC 00000000 */   nop
endlabel initstreamblocks
