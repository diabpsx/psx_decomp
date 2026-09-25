.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ioreader, 0x140

glabel ioreader
    /* 192F8 800292F8 EC1C828F */  lw         $v0, %gp_rel(streamer_iotaskptr)($gp)
    /* 192FC 800292FC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19300 80029300 1000BFAF */  sw         $ra, 0x10($sp)
    /* 19304 80029304 E01C80AF */  sw         $zero, %gp_rel(soundservice)($gp)
    /* 19308 80029308 35004010 */  beqz       $v0, .L800293E0
    /* 1930C 8002930C 00000000 */   nop
    /* 19310 80029310 F01C828F */  lw         $v0, %gp_rel(streamer_iotaskstatus)($gp)
    /* 19314 80029314 00000000 */  nop
    /* 19318 80029318 09F84000 */  jalr       $v0
    /* 1931C 8002931C 00000000 */   nop
    /* 19320 80029320 27004014 */  bnez       $v0, .L800293C0
    /* 19324 80029324 00000000 */   nop
    /* 19328 80029328 D81C828F */  lw         $v0, %gp_rel(relinquishio)($gp)
    /* 1932C 8002932C 00000000 */  nop
    /* 19330 80029330 0B004010 */  beqz       $v0, .L80029360
    /* 19334 80029334 00000000 */   nop
    /* 19338 80029338 DC1C828F */  lw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 1933C 8002933C 00000000 */  nop
    /* 19340 80029340 2C004010 */  beqz       $v0, .L800293F4
    /* 19344 80029344 00000000 */   nop
    /* 19348 80029348 08C0000C */  jal        gettick
    /* 1934C 8002934C 00000000 */   nop
    /* 19350 80029350 4C2382AF */  sw         $v0, %gp_rel(asynctick)($gp)
    /* 19354 80029354 DC1C80AF */  sw         $zero, %gp_rel(streamhasioflag)($gp)
    /* 19358 80029358 E6A40008 */  j          .L80029398
    /* 1935C 8002935C 00000000 */   nop
  .L80029360:
    /* 19360 80029360 001D828F */  lw         $v0, %gp_rel(D_8011C480)($gp)
    /* 19364 80029364 00000000 */  nop
    /* 19368 80029368 04004010 */  beqz       $v0, .L8002937C
    /* 1936C 8002936C FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 19370 80029370 001D82AF */  sw         $v0, %gp_rel(D_8011C480)($gp)
    /* 19374 80029374 E6A40008 */  j          .L80029398
    /* 19378 80029378 00000000 */   nop
  .L8002937C:
    /* 1937C 8002937C E41C838F */  lw         $v1, %gp_rel(streamstarting)($gp)
    /* 19380 80029380 01000224 */  addiu      $v0, $zero, 0x1
    /* 19384 80029384 DC1C82AF */  sw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 19388 80029388 03006010 */  beqz       $v1, .L80029398
    /* 1938C 8002938C 00000000 */   nop
    /* 19390 80029390 E81C80AF */  sw         $zero, %gp_rel(streamtoppedupflag)($gp)
    /* 19394 80029394 E41C80AF */  sw         $zero, %gp_rel(streamstarting)($gp)
  .L80029398:
    /* 19398 80029398 DC1C828F */  lw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 1939C 8002939C 00000000 */  nop
    /* 193A0 800293A0 14004010 */  beqz       $v0, .L800293F4
    /* 193A4 800293A4 01000224 */   addiu     $v0, $zero, 0x1
    /* 193A8 800293A8 EC1C838F */  lw         $v1, %gp_rel(streamer_iotaskptr)($gp)
    /* 193AC 800293AC E01C82AF */  sw         $v0, %gp_rel(soundservice)($gp)
    /* 193B0 800293B0 09F86000 */  jalr       $v1
    /* 193B4 800293B4 00000000 */   nop
    /* 193B8 800293B8 FDA40008 */  j          .L800293F4
    /* 193BC 800293BC 00000000 */   nop
  .L800293C0:
    /* 193C0 800293C0 D81C828F */  lw         $v0, %gp_rel(relinquishio)($gp)
    /* 193C4 800293C4 00000000 */  nop
    /* 193C8 800293C8 0A004010 */  beqz       $v0, .L800293F4
    /* 193CC 800293CC 00000000 */   nop
    /* 193D0 800293D0 6DB6000C */  jal        coordinatestream
    /* 193D4 800293D4 00000000 */   nop
    /* 193D8 800293D8 FDA40008 */  j          .L800293F4
    /* 193DC 800293DC 00000000 */   nop
  .L800293E0:
    /* 193E0 800293E0 D81C828F */  lw         $v0, %gp_rel(relinquishio)($gp)
    /* 193E4 800293E4 00000000 */  nop
    /* 193E8 800293E8 02004010 */  beqz       $v0, .L800293F4
    /* 193EC 800293EC 00000000 */   nop
    /* 193F0 800293F0 DC1C80AF */  sw         $zero, %gp_rel(streamhasioflag)($gp)
  .L800293F4:
    /* 193F4 800293F4 041D828F */  lw         $v0, %gp_rel(loadfilewaiting)($gp)
    /* 193F8 800293F8 00000000 */  nop
    /* 193FC 800293FC 09004014 */  bnez       $v0, .L80029424
    /* 19400 80029400 00000000 */   nop
    /* 19404 80029404 F81C828F */  lw         $v0, %gp_rel(async_iotaskptr)($gp)
    /* 19408 80029408 00000000 */  nop
    /* 1940C 8002940C 06004010 */  beqz       $v0, .L80029428
    /* 19410 80029410 00000000 */   nop
    /* 19414 80029414 09F84000 */  jalr       $v0
    /* 19418 80029418 00000000 */   nop
    /* 1941C 8002941C 0AA50008 */  j          .L80029428
    /* 19420 80029420 00000000 */   nop
  .L80029424:
    /* 19424 80029424 041D80AF */  sw         $zero, %gp_rel(loadfilewaiting)($gp)
  .L80029428:
    /* 19428 80029428 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1942C 8002942C 21100000 */  addu       $v0, $zero, $zero
    /* 19430 80029430 0800E003 */  jr         $ra
    /* 19434 80029434 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel ioreader
