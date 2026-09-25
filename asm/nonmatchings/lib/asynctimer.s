.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asynctimer, 0xAC

glabel asynctimer
    /* 17670 80027670 781C828F */  lw         $v0, %gp_rel(asynctimeout)($gp)
    /* 17674 80027674 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 17678 80027678 24004010 */  beqz       $v0, .L8002770C
    /* 1767C 8002767C 2000BFAF */   sw        $ra, 0x20($sp)
    /* 17680 80027680 781C828F */  lw         $v0, %gp_rel(asynctimeout)($gp)
    /* 17684 80027684 00000000 */  nop
    /* 17688 80027688 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1768C 8002768C 781C82AF */  sw         $v0, %gp_rel(asynctimeout)($gp)
    /* 17690 80027690 781C828F */  lw         $v0, %gp_rel(asynctimeout)($gp)
    /* 17694 80027694 781C828F */  lw         $v0, %gp_rel(asynctimeout)($gp)
    /* 17698 80027698 00000000 */  nop
    /* 1769C 8002769C 1B004014 */  bnez       $v0, .L8002770C
    /* 176A0 800276A0 00000000 */   nop
    /* 176A4 800276A4 801C828F */  lw         $v0, %gp_rel(cdtimeoutcount)($gp)
    /* 176A8 800276A8 00000000 */  nop
    /* 176AC 800276AC 01004224 */  addiu      $v0, $v0, 0x1
    /* 176B0 800276B0 801C82AF */  sw         $v0, %gp_rel(cdtimeoutcount)($gp)
    /* 176B4 800276B4 801C828F */  lw         $v0, %gp_rel(cdtimeoutcount)($gp)
    /* 176B8 800276B8 941C828F */  lw         $v0, %gp_rel(asyncreadreq)($gp)
    /* 176BC 800276BC 00000000 */  nop
    /* 176C0 800276C0 03004014 */  bnez       $v0, .L800276D0
    /* 176C4 800276C4 A0000224 */   addiu     $v0, $zero, 0xA0
    /* 176C8 800276C8 901C80AF */  sw         $zero, %gp_rel(cdcallbacks)($gp)
    /* 176CC 800276CC A0000224 */  addiu      $v0, $zero, 0xA0
  .L800276D0:
    /* 176D0 800276D0 1800A2A3 */  sb         $v0, 0x18($sp)
    /* 176D4 800276D4 21200000 */  addu       $a0, $zero, $zero
  .L800276D8:
    /* 176D8 800276D8 7C6B000C */  jal        CdSync
    /* 176DC 800276DC 21280000 */   addu      $a1, $zero, $zero
    /* 176E0 800276E0 0E000424 */  addiu      $a0, $zero, 0xE
    /* 176E4 800276E4 1800A527 */  addiu      $a1, $sp, 0x18
    /* 176E8 800276E8 326C000C */  jal        CdControlB
    /* 176EC 800276EC 1000A627 */   addiu     $a2, $sp, 0x10
    /* 176F0 800276F0 1000A293 */  lbu        $v0, 0x10($sp)
    /* 176F4 800276F4 00000000 */  nop
    /* 176F8 800276F8 01004230 */  andi       $v0, $v0, 0x1
    /* 176FC 800276FC F6FF4014 */  bnez       $v0, .L800276D8
    /* 17700 80027700 21200000 */   addu      $a0, $zero, $zero
    /* 17704 80027704 809D000C */  jal        asyncinitread
    /* 17708 80027708 00000000 */   nop
  .L8002770C:
    /* 1770C 8002770C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 17710 80027710 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 17714 80027714 0800E003 */  jr         $ra
    /* 17718 80027718 00000000 */   nop
endlabel asynctimer
