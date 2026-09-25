.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DEC_RemoveAsDecRequestor__FP7TextDat, 0x58

glabel DEC_RemoveAsDecRequestor__FP7TextDat
    /* 94400 800A4400 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94404 800A4404 1400BFAF */  sw         $ra, 0x14($sp)
    /* 94408 800A4408 2D91020C */  jal        FindThisTd__FP7TextDat
    /* 9440C 800A440C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 94410 800A4410 21804000 */  addu       $s0, $v0, $zero
    /* 94414 800A4414 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 94418 800A4418 07000216 */  bne        $s0, $v0, .L800A4438
    /* 9441C 800A441C 80101000 */   sll       $v0, $s0, 2
    /* 94420 800A4420 21200000 */  addu       $a0, $zero, $zero
    /* 94424 800A4424 1180053C */  lui        $a1, %hi(D_80110C48)
    /* 94428 800A4428 480CA524 */  addiu      $a1, $a1, %lo(D_80110C48)
    /* 9442C 800A442C A583000C */  jal        DBG_Error
    /* 94430 800A4430 5D000624 */   addiu     $a2, $zero, 0x5D
    /* 94434 800A4434 80101000 */  sll        $v0, $s0, 2
  .L800A4438:
    /* 94438 800A4438 1280013C */  lui        $at, %hi(D_8011D050)
    /* 9443C 800A443C 21082200 */  addu       $at, $at, $v0
    /* 94440 800A4440 50D020AC */  sw         $zero, %lo(D_8011D050)($at)
    /* 94444 800A4444 1400BF8F */  lw         $ra, 0x14($sp)
    /* 94448 800A4448 1000B08F */  lw         $s0, 0x10($sp)
    /* 9444C 800A444C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94450 800A4450 0800E003 */  jr         $ra
    /* 94454 800A4454 00000000 */   nop
endlabel DEC_RemoveAsDecRequestor__FP7TextDat
