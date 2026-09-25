.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSYS_IsStackOutOfBounds, 0x5C

glabel GSYS_IsStackOutOfBounds
    /* 11268 80021268 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1126C 8002126C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 11270 80021270 21808000 */  addu       $s0, $a0, $zero
    /* 11274 80021274 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11278 80021278 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1127C 8002127C B184000C */  jal        GetSp
    /* 11280 80021280 2188A000 */   addu      $s1, $a1, $zero
    /* 11284 80021284 21184000 */  addu       $v1, $v0, $zero
    /* 11288 80021288 2B107000 */  sltu       $v0, $v1, $s0
    /* 1128C 8002128C 05004014 */  bnez       $v0, .L800212A4
    /* 11290 80021290 21200000 */   addu      $a0, $zero, $zero
    /* 11294 80021294 21101102 */  addu       $v0, $s0, $s1
    /* 11298 80021298 2B106200 */  sltu       $v0, $v1, $v0
    /* 1129C 8002129C 03004014 */  bnez       $v0, .L800212AC
    /* 112A0 800212A0 21108000 */   addu      $v0, $a0, $zero
  .L800212A4:
    /* 112A4 800212A4 01000434 */  ori        $a0, $zero, 0x1
    /* 112A8 800212A8 21108000 */  addu       $v0, $a0, $zero
  .L800212AC:
    /* 112AC 800212AC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 112B0 800212B0 1400B18F */  lw         $s1, 0x14($sp)
    /* 112B4 800212B4 1000B08F */  lw         $s0, 0x10($sp)
    /* 112B8 800212B8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 112BC 800212BC 0800E003 */  jr         $ra
    /* 112C0 800212C0 00000000 */   nop
endlabel GSYS_IsStackOutOfBounds
