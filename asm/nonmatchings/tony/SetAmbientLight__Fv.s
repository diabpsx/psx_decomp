.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetAmbientLight__Fv, 0xC0

glabel SetAmbientLight__Fv
    /* 8B3FC 8009B3FC 1280023C */  lui        $v0, %hi(leveltype)
    /* 8B400 8009B400 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 8B404 8009B404 00000000 */  nop
    /* 8B408 8009B408 02004014 */  bnez       $v0, .L8009B414
    /* 8B40C 8009B40C 1E000224 */   addiu     $v0, $zero, 0x1E
    /* 8B410 8009B410 80000224 */  addiu      $v0, $zero, 0x80
  .L8009B414:
    /* 8B414 8009B414 1280013C */  lui        $at, %hi(restore_r)
    /* 8B418 8009B418 F8B822AC */  sw         $v0, %lo(restore_r)($at)
    /* 8B41C 8009B41C 1280013C */  lui        $at, %hi(restore_g)
    /* 8B420 8009B420 FCB822AC */  sw         $v0, %lo(restore_g)($at)
    /* 8B424 8009B424 1280013C */  lui        $at, %hi(restore_b)
    /* 8B428 8009B428 00B922AC */  sw         $v0, %lo(restore_b)($at)
    /* 8B42C 8009B42C 21300000 */  addu       $a2, $zero, $zero
    /* 8B430 8009B430 10800D3C */  lui        $t5, %hi(dung_map_r)
    /* 8B434 8009B434 2802AD25 */  addiu      $t5, $t5, %lo(dung_map_r)
    /* 8B438 8009B438 10800C3C */  lui        $t4, %hi(dung_map_g)
    /* 8B43C 8009B43C 680E8C25 */  addiu      $t4, $t4, %lo(dung_map_g)
    /* 8B440 8009B440 10800B3C */  lui        $t3, %hi(dung_map_b)
    /* 8B444 8009B444 A81A6B25 */  addiu      $t3, $t3, %lo(dung_map_b)
  .L8009B448:
    /* 8B448 8009B448 21500000 */  addu       $t2, $zero, $zero
    /* 8B44C 8009B44C 21486001 */  addu       $t1, $t3, $zero
    /* 8B450 8009B450 21408001 */  addu       $t0, $t4, $zero
    /* 8B454 8009B454 2138A001 */  addu       $a3, $t5, $zero
  .L8009B458:
    /* 8B458 8009B458 21282601 */  addu       $a1, $t1, $a2
    /* 8B45C 8009B45C 38002925 */  addiu      $t1, $t1, 0x38
    /* 8B460 8009B460 21200601 */  addu       $a0, $t0, $a2
    /* 8B464 8009B464 38000825 */  addiu      $t0, $t0, 0x38
    /* 8B468 8009B468 1280033C */  lui        $v1, %hi(restore_r)
    /* 8B46C 8009B46C F8B8638C */  lw         $v1, %lo(restore_r)($v1)
    /* 8B470 8009B470 2110E600 */  addu       $v0, $a3, $a2
    /* 8B474 8009B474 000043A0 */  sb         $v1, 0x0($v0)
    /* 8B478 8009B478 1280023C */  lui        $v0, %hi(restore_g)
    /* 8B47C 8009B47C FCB8428C */  lw         $v0, %lo(restore_g)($v0)
    /* 8B480 8009B480 00000000 */  nop
    /* 8B484 8009B484 000082A0 */  sb         $v0, 0x0($a0)
    /* 8B488 8009B488 1280023C */  lui        $v0, %hi(restore_b)
    /* 8B48C 8009B48C 00B9428C */  lw         $v0, %lo(restore_b)($v0)
    /* 8B490 8009B490 01004A25 */  addiu      $t2, $t2, 0x1
    /* 8B494 8009B494 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 8B498 8009B498 38004229 */  slti       $v0, $t2, 0x38
    /* 8B49C 8009B49C EEFF4014 */  bnez       $v0, .L8009B458
    /* 8B4A0 8009B4A0 3800E724 */   addiu     $a3, $a3, 0x38
    /* 8B4A4 8009B4A4 0100C624 */  addiu      $a2, $a2, 0x1
    /* 8B4A8 8009B4A8 3800C228 */  slti       $v0, $a2, 0x38
    /* 8B4AC 8009B4AC E6FF4014 */  bnez       $v0, .L8009B448
    /* 8B4B0 8009B4B0 00000000 */   nop
    /* 8B4B4 8009B4B4 0800E003 */  jr         $ra
    /* 8B4B8 8009B4B8 00000000 */   nop
endlabel SetAmbientLight__Fv
