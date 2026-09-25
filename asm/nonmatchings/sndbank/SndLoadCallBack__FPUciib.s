.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SndLoadCallBack__FPUciib, 0x78

glabel SndLoadCallBack__FPUciib
    /* 8A440 8009A440 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8A444 8009A444 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8A448 8009A448 21808000 */  addu       $s0, $a0, $zero
    /* 8A44C 8009A44C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8A450 8009A450 2188C000 */  addu       $s1, $a2, $zero
    /* 8A454 8009A454 0400A014 */  bnez       $a1, .L8009A468
    /* 8A458 8009A458 1800BFAF */   sw        $ra, 0x18($sp)
    /* 8A45C 8009A45C 8006828F */  lw         $v0, %gp_rel(D_8011AE00)($gp)
    /* 8A460 8009A460 00000000 */  nop
    /* 8A464 8009A464 281F82AF */  sw         $v0, %gp_rel(D_8011C6A8)($gp)
  .L8009A468:
    /* 8A468 8009A468 C763000C */  jal        SpuSetTransferMode
    /* 8A46C 8009A46C 21200000 */   addu      $a0, $zero, $zero
    /* 8A470 8009A470 281F848F */  lw         $a0, %gp_rel(D_8011C6A8)($gp)
    /* 8A474 8009A474 AF63000C */  jal        SpuSetTransferStartAddr
    /* 8A478 8009A478 00000000 */   nop
    /* 8A47C 8009A47C 21200002 */  addu       $a0, $s0, $zero
    /* 8A480 8009A480 3F63000C */  jal        SpuWrite
    /* 8A484 8009A484 21282002 */   addu      $a1, $s1, $zero
    /* 8A488 8009A488 D363000C */  jal        SpuIsTransferCompleted
    /* 8A48C 8009A48C 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A490 8009A490 281F838F */  lw         $v1, %gp_rel(D_8011C6A8)($gp)
    /* 8A494 8009A494 01000224 */  addiu      $v0, $zero, 0x1
    /* 8A498 8009A498 21187100 */  addu       $v1, $v1, $s1
    /* 8A49C 8009A49C 281F83AF */  sw         $v1, %gp_rel(D_8011C6A8)($gp)
    /* 8A4A0 8009A4A0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8A4A4 8009A4A4 1400B18F */  lw         $s1, 0x14($sp)
    /* 8A4A8 8009A4A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 8A4AC 8009A4AC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8A4B0 8009A4B0 0800E003 */  jr         $ra
    /* 8A4B4 8009A4B4 00000000 */   nop
endlabel SndLoadCallBack__FPUciib
