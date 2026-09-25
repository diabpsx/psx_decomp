.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setstreameriofuncs, 0xCC

glabel setstreameriofuncs
    /* 19438 80029438 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1943C 8002943C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19440 80029440 21808000 */  addu       $s0, $a0, $zero
    /* 19444 80029444 1400B1AF */  sw         $s1, 0x14($sp)
    /* 19448 80029448 2188A000 */  addu       $s1, $a1, $zero
    /* 1944C 8002944C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 19450 80029450 2190C000 */  addu       $s2, $a2, $zero
    /* 19454 80029454 15000012 */  beqz       $s0, .L800294AC
    /* 19458 80029458 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 1945C 8002945C F81C828F */  lw         $v0, %gp_rel(async_iotaskptr)($gp)
    /* 19460 80029460 00000000 */  nop
    /* 19464 80029464 0C004010 */  beqz       $v0, .L80029498
    /* 19468 80029468 01000224 */   addiu     $v0, $zero, 0x1
    /* 1946C 8002946C FC1C828F */  lw         $v0, %gp_rel(async_iotaskstatus)($gp)
    /* 19470 80029470 DC1C80AF */  sw         $zero, %gp_rel(streamhasioflag)($gp)
    /* 19474 80029474 09F84000 */  jalr       $v0
    /* 19478 80029478 00000000 */   nop
    /* 1947C 8002947C 02004010 */  beqz       $v0, .L80029488
    /* 19480 80029480 01000224 */   addiu     $v0, $zero, 0x1
    /* 19484 80029484 D81C82AF */  sw         $v0, %gp_rel(relinquishio)($gp)
  .L80029488:
    /* 19488 80029488 01000224 */  addiu      $v0, $zero, 0x1
    /* 1948C 8002948C E41C82AF */  sw         $v0, %gp_rel(streamstarting)($gp)
    /* 19490 80029490 37A50008 */  j          .L800294DC
    /* 19494 80029494 00000000 */   nop
  .L80029498:
    /* 19498 80029498 DC1C82AF */  sw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 1949C 8002949C D81C80AF */  sw         $zero, %gp_rel(relinquishio)($gp)
    /* 194A0 800294A0 E81C80AF */  sw         $zero, %gp_rel(streamtoppedupflag)($gp)
    /* 194A4 800294A4 37A50008 */  j          .L800294DC
    /* 194A8 800294A8 00000000 */   nop
  .L800294AC:
    /* 194AC 800294AC 3FA4000C */  jal        streamhasio
    /* 194B0 800294B0 00000000 */   nop
    /* 194B4 800294B4 09004010 */  beqz       $v0, .L800294DC
    /* 194B8 800294B8 00000000 */   nop
    /* 194BC 800294BC 6DB6000C */  jal        coordinatestream
    /* 194C0 800294C0 00000000 */   nop
  .L800294C4:
    /* 194C4 800294C4 F01C828F */  lw         $v0, %gp_rel(streamer_iotaskstatus)($gp)
    /* 194C8 800294C8 00000000 */  nop
    /* 194CC 800294CC 09F84000 */  jalr       $v0
    /* 194D0 800294D0 00000000 */   nop
    /* 194D4 800294D4 FBFF4014 */  bnez       $v0, .L800294C4
    /* 194D8 800294D8 00000000 */   nop
  .L800294DC:
    /* 194DC 800294DC EC1C90AF */  sw         $s0, %gp_rel(streamer_iotaskptr)($gp)
    /* 194E0 800294E0 F01C91AF */  sw         $s1, %gp_rel(streamer_iotaskstatus)($gp)
    /* 194E4 800294E4 F41C92AF */  sw         $s2, %gp_rel(streamer_setnotfull)($gp)
    /* 194E8 800294E8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 194EC 800294EC 1800B28F */  lw         $s2, 0x18($sp)
    /* 194F0 800294F0 1400B18F */  lw         $s1, 0x14($sp)
    /* 194F4 800294F4 1000B08F */  lw         $s0, 0x10($sp)
    /* 194F8 800294F8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 194FC 800294FC 0800E003 */  jr         $ra
    /* 19500 80029500 00000000 */   nop
endlabel setstreameriofuncs
