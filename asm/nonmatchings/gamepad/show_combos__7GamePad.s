.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching show_combos__7GamePad, 0x28C

glabel show_combos__7GamePad
    /* 6A2EC 8007A2EC B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6A2F0 8007A2F0 3800B2AF */  sw         $s2, 0x38($sp)
    /* 6A2F4 8007A2F4 21908000 */  addu       $s2, $a0, $zero
    /* 6A2F8 8007A2F8 4400B5AF */  sw         $s5, 0x44($sp)
    /* 6A2FC 8007A2FC 54001524 */  addiu      $s5, $zero, 0x54
    /* 6A300 8007A300 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6A304 8007A304 4800B6AF */  sw         $s6, 0x48($sp)
    /* 6A308 8007A308 4000B4AF */  sw         $s4, 0x40($sp)
    /* 6A30C 8007A30C 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 6A310 8007A310 3400B1AF */  sw         $s1, 0x34($sp)
    /* 6A314 8007A314 3000B0AF */  sw         $s0, 0x30($sp)
    /* 6A318 8007A318 4C004482 */  lb         $a0, 0x4C($s2)
    /* 6A31C 8007A31C D1004392 */  lbu        $v1, 0xD1($s2)
    /* 6A320 8007A320 2B100400 */  sltu       $v0, $zero, $a0
    /* 6A324 8007A324 89006010 */  beqz       $v1, .L8007A54C
    /* 6A328 8007A328 40B00200 */   sll       $s6, $v0, 1
    /* 6A32C 8007A32C D0004292 */  lbu        $v0, 0xD0($s2)
    /* 6A330 8007A330 00000000 */  nop
    /* 6A334 8007A334 85004010 */  beqz       $v0, .L8007A54C
    /* 6A338 8007A338 00000000 */   nop
    /* 6A33C 8007A33C 0000428E */  lw         $v0, 0x0($s2)
    /* 6A340 8007A340 00000000 */  nop
    /* 6A344 8007A344 1C01428C */  lw         $v0, 0x11C($v0)
    /* 6A348 8007A348 00000000 */  nop
    /* 6A34C 8007A34C 83110200 */  sra        $v0, $v0, 6
    /* 6A350 8007A350 7E004010 */  beqz       $v0, .L8007A54C
    /* 6A354 8007A354 00000000 */   nop
    /* 6A358 8007A358 1280023C */  lui        $v0, %hi(demo_pad_time)
    /* 6A35C 8007A35C B4AB428C */  lw         $v0, %lo(demo_pad_time)($v0)
    /* 6A360 8007A360 00000000 */  nop
    /* 6A364 8007A364 79004014 */  bnez       $v0, .L8007A54C
    /* 6A368 8007A368 00000000 */   nop
    /* 6A36C 8007A36C 4C148283 */  lb         $v0, %gp_rel(D_8011BBCC)($gp)
    /* 6A370 8007A370 00000000 */  nop
    /* 6A374 8007A374 03004004 */  bltz       $v0, .L8007A384
    /* 6A378 8007A378 00000000 */   nop
    /* 6A37C 8007A37C 73004414 */  bne        $v0, $a0, .L8007A54C
    /* 6A380 8007A380 00000000 */   nop
  .L8007A384:
    /* 6A384 8007A384 32000224 */  addiu      $v0, $zero, 0x32
    /* 6A388 8007A388 2800A2A7 */  sh         $v0, 0x28($sp)
    /* 6A38C 8007A38C E0000224 */  addiu      $v0, $zero, 0xE0
    /* 6A390 8007A390 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 6A394 8007A394 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6A398 8007A398 2A00A0A7 */  sh         $zero, 0x2A($sp)
    /* 6A39C 8007A39C 36F7000C */  jal        ClrDiabloMsg__Fv
    /* 6A3A0 8007A3A0 2E00A2A7 */   sh        $v0, 0x2E($sp)
    /* 6A3A4 8007A3A4 0B000424 */  addiu      $a0, $zero, 0xB
    /* 6A3A8 8007A3A8 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 6A3AC 8007A3AC 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 6A3B0 8007A3B0 21380000 */  addu       $a3, $zero, $zero
    /* 6A3B4 8007A3B4 21A00000 */  addu       $s4, $zero, $zero
    /* 6A3B8 8007A3B8 4C004582 */  lb         $a1, 0x4C($s2)
    /* 6A3BC 8007A3BC 53EB010C */  jal        PostGamePad__Fiiii
    /* 6A3C0 8007A3C0 21984002 */   addu      $s3, $s2, $zero
  .L8007A3C4:
    /* 6A3C4 8007A3C4 9800658E */  lw         $a1, 0x98($s3)
    /* 6A3C8 8007A3C8 00000000 */  nop
    /* 6A3CC 8007A3CC 5800A010 */  beqz       $a1, .L8007A530
    /* 6A3D0 8007A3D0 00000000 */   nop
    /* 6A3D4 8007A3D4 4C004282 */  lb         $v0, 0x4C($s2)
    /* 6A3D8 8007A3D8 00000000 */  nop
    /* 6A3DC 8007A3DC 20004010 */  beqz       $v0, .L8007A460
    /* 6A3E0 8007A3E0 00000000 */   nop
    /* 6A3E4 8007A3E4 B8E2010C */  jal        GetActionButton__7GamePadPFi_v
    /* 6A3E8 8007A3E8 21204002 */   addu      $a0, $s2, $zero
    /* 6A3EC 8007A3EC 21204000 */  addu       $a0, $v0, $zero
    /* 6A3F0 8007A3F0 AC71020C */  jal        get_action_str__Fii
    /* 6A3F4 8007A3F4 01000524 */   addiu     $a1, $zero, 0x1
    /* 6A3F8 8007A3F8 5C00448E */  lw         $a0, 0x5C($s2)
    /* 6A3FC 8007A3FC CA71020C */  jal        get_key_pad__Fi
    /* 6A400 8007A400 21884000 */   addu      $s1, $v0, $zero
    /* 6A404 8007A404 40180200 */  sll        $v1, $v0, 1
    /* 6A408 8007A408 21186200 */  addu       $v1, $v1, $v0
    /* 6A40C 8007A40C 80180300 */  sll        $v1, $v1, 2
    /* 6A410 8007A410 9800658E */  lw         $a1, 0x98($s3)
    /* 6A414 8007A414 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 6A418 8007A418 21082300 */  addu       $at, $at, $v1
    /* 6A41C 8007A41C 6CC33080 */  lb         $s0, %lo(pad_txt + 0x8)($at)
    /* 6A420 8007A420 B8E2010C */  jal        GetActionButton__7GamePadPFi_v
    /* 6A424 8007A424 21204002 */   addu      $a0, $s2, $zero
    /* 6A428 8007A428 CA71020C */  jal        get_key_pad__Fi
    /* 6A42C 8007A42C 21204000 */   addu      $a0, $v0, $zero
    /* 6A430 8007A430 0D80043C */  lui        $a0, %hi(tempstr)
    /* 6A434 8007A434 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 6A438 8007A438 1280053C */  lui        $a1, %hi(D_80118A44)
    /* 6A43C 8007A43C 448AA524 */  addiu      $a1, $a1, %lo(D_80118A44)
    /* 6A440 8007A440 40180200 */  sll        $v1, $v0, 1
    /* 6A444 8007A444 21186200 */  addu       $v1, $v1, $v0
    /* 6A448 8007A448 80180300 */  sll        $v1, $v1, 2
    /* 6A44C 8007A44C 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 6A450 8007A450 21082300 */  addu       $at, $at, $v1
    /* 6A454 8007A454 6CC32280 */  lb         $v0, %lo(pad_txt + 0x8)($at)
    /* 6A458 8007A458 37E90108 */  j          .L8007A4DC
    /* 6A45C 8007A45C 21302002 */   addu      $a2, $s1, $zero
  .L8007A460:
    /* 6A460 8007A460 5C00448E */  lw         $a0, 0x5C($s2)
    /* 6A464 8007A464 CA71020C */  jal        get_key_pad__Fi
    /* 6A468 8007A468 00000000 */   nop
    /* 6A46C 8007A46C 40180200 */  sll        $v1, $v0, 1
    /* 6A470 8007A470 21186200 */  addu       $v1, $v1, $v0
    /* 6A474 8007A474 80180300 */  sll        $v1, $v1, 2
    /* 6A478 8007A478 9800658E */  lw         $a1, 0x98($s3)
    /* 6A47C 8007A47C 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 6A480 8007A480 21082300 */  addu       $at, $at, $v1
    /* 6A484 8007A484 6CC33180 */  lb         $s1, %lo(pad_txt + 0x8)($at)
    /* 6A488 8007A488 B8E2010C */  jal        GetActionButton__7GamePadPFi_v
    /* 6A48C 8007A48C 21204002 */   addu      $a0, $s2, $zero
    /* 6A490 8007A490 CA71020C */  jal        get_key_pad__Fi
    /* 6A494 8007A494 21204000 */   addu      $a0, $v0, $zero
    /* 6A498 8007A498 40180200 */  sll        $v1, $v0, 1
    /* 6A49C 8007A49C 21186200 */  addu       $v1, $v1, $v0
    /* 6A4A0 8007A4A0 80180300 */  sll        $v1, $v1, 2
    /* 6A4A4 8007A4A4 9800658E */  lw         $a1, 0x98($s3)
    /* 6A4A8 8007A4A8 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 6A4AC 8007A4AC 21082300 */  addu       $at, $at, $v1
    /* 6A4B0 8007A4B0 6CC33080 */  lb         $s0, %lo(pad_txt + 0x8)($at)
    /* 6A4B4 8007A4B4 B8E2010C */  jal        GetActionButton__7GamePadPFi_v
    /* 6A4B8 8007A4B8 21204002 */   addu      $a0, $s2, $zero
    /* 6A4BC 8007A4BC 21204000 */  addu       $a0, $v0, $zero
    /* 6A4C0 8007A4C0 AC71020C */  jal        get_action_str__Fii
    /* 6A4C4 8007A4C4 01000524 */   addiu     $a1, $zero, 0x1
    /* 6A4C8 8007A4C8 0D80043C */  lui        $a0, %hi(tempstr)
    /* 6A4CC 8007A4CC 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 6A4D0 8007A4D0 1280053C */  lui        $a1, %hi(D_80118A54)
    /* 6A4D4 8007A4D4 548AA524 */  addiu      $a1, $a1, %lo(D_80118A54)
    /* 6A4D8 8007A4D8 21302002 */  addu       $a2, $s1, $zero
  .L8007A4DC:
    /* 6A4DC 8007A4DC 21380002 */  addu       $a3, $s0, $zero
    /* 6A4E0 8007A4E0 9767000C */  jal        sprintf
    /* 6A4E4 8007A4E4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6A4E8 8007A4E8 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 6A4EC 8007A4EC D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 6A4F0 8007A4F0 21280000 */  addu       $a1, $zero, $zero
    /* 6A4F4 8007A4F4 2130A002 */  addu       $a2, $s5, $zero
    /* 6A4F8 8007A4F8 0D80073C */  lui        $a3, %hi(tempstr)
    /* 6A4FC 8007A4FC 10EAE724 */  addiu      $a3, $a3, %lo(tempstr)
    /* 6A500 8007A500 1000B526 */  addiu      $s5, $s5, 0x10
    /* 6A504 8007A504 1280083C */  lui        $t0, %hi(WHITER)
    /* 6A508 8007A508 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 6A50C 8007A50C 1280033C */  lui        $v1, %hi(WHITEG)
    /* 6A510 8007A510 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 6A514 8007A514 2800A227 */  addiu      $v0, $sp, 0x28
    /* 6A518 8007A518 1000B6AF */  sw         $s6, 0x10($sp)
    /* 6A51C 8007A51C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6A520 8007A520 1800A8AF */  sw         $t0, 0x18($sp)
    /* 6A524 8007A524 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 6A528 8007A528 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 6A52C 8007A52C 2000A3AF */   sw        $v1, 0x20($sp)
  .L8007A530:
    /* 6A530 8007A530 01009426 */  addiu      $s4, $s4, 0x1
    /* 6A534 8007A534 0E00822A */  slti       $v0, $s4, 0xE
    /* 6A538 8007A538 A2FF4014 */  bnez       $v0, .L8007A3C4
    /* 6A53C 8007A53C 04007326 */   addiu     $s3, $s3, 0x4
    /* 6A540 8007A540 4C004292 */  lbu        $v0, 0x4C($s2)
    /* 6A544 8007A544 00000000 */  nop
    /* 6A548 8007A548 4C1482A3 */  sb         $v0, %gp_rel(D_8011BBCC)($gp)
  .L8007A54C:
    /* 6A54C 8007A54C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 6A550 8007A550 4800B68F */  lw         $s6, 0x48($sp)
    /* 6A554 8007A554 4400B58F */  lw         $s5, 0x44($sp)
    /* 6A558 8007A558 4000B48F */  lw         $s4, 0x40($sp)
    /* 6A55C 8007A55C 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 6A560 8007A560 3800B28F */  lw         $s2, 0x38($sp)
    /* 6A564 8007A564 3400B18F */  lw         $s1, 0x34($sp)
    /* 6A568 8007A568 3000B08F */  lw         $s0, 0x30($sp)
    /* 6A56C 8007A56C 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6A570 8007A570 0800E003 */  jr         $ra
    /* 6A574 8007A574 00000000 */   nop
endlabel show_combos__7GamePad
