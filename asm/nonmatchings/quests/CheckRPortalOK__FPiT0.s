.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckRPortalOK__FPiT0, 0x40

glabel CheckRPortalOK__FPiT0
    /* 574B4 800674B4 0000868C */  lw         $a2, 0x0($a0)
    /* 574B8 800674B8 1280023C */  lui        $v0, %hi(ViewX)
    /* 574BC 800674BC 14C1428C */  lw         $v0, %lo(ViewX)($v0)
    /* 574C0 800674C0 0000A38C */  lw         $v1, 0x0($a1)
    /* 574C4 800674C4 0800C214 */  bne        $a2, $v0, .L800674E8
    /* 574C8 800674C8 00000000 */   nop
    /* 574CC 800674CC 1280023C */  lui        $v0, %hi(ViewY)
    /* 574D0 800674D0 18C1428C */  lw         $v0, %lo(ViewY)($v0)
    /* 574D4 800674D4 00000000 */  nop
    /* 574D8 800674D8 03006214 */  bne        $v1, $v0, .L800674E8
    /* 574DC 800674DC 00000000 */   nop
    /* 574E0 800674E0 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 574E4 800674E4 FFFF6324 */  addiu      $v1, $v1, -0x1
  .L800674E8:
    /* 574E8 800674E8 000086AC */  sw         $a2, 0x0($a0)
    /* 574EC 800674EC 0800E003 */  jr         $ra
    /* 574F0 800674F0 0000A3AC */   sw        $v1, 0x0($a1)
endlabel CheckRPortalOK__FPiT0
