.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching iscrcblock, 0x7C

glabel iscrcblock
    /* 19514 80029514 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 19518 80029518 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1951C 8002951C 21808000 */  addu       $s0, $a0, $zero
    /* 19520 80029520 1800BFAF */  sw         $ra, 0x18($sp)
    /* 19524 80029524 E9AD000C */  jal        getblockadr
    /* 19528 80029528 1400B1AF */   sw        $s1, 0x14($sp)
    /* 1952C 8002952C 21200002 */  addu       $a0, $s0, $zero
    /* 19530 80029530 EFAD000C */  jal        getblocklen
    /* 19534 80029534 21884000 */   addu      $s1, $v0, $zero
    /* 19538 80029538 21184000 */  addu       $v1, $v0, $zero
    /* 1953C 8002953C 0C006228 */  slti       $v0, $v1, 0xC
    /* 19540 80029540 0C004014 */  bnez       $v0, .L80029574
    /* 19544 80029544 21800000 */   addu      $s0, $zero, $zero
    /* 19548 80029548 21202302 */  addu       $a0, $s1, $v1
    /* 1954C 8002954C F4FF8424 */  addiu      $a0, $a0, -0xC
    /* 19550 80029550 B9B2000C */  jal        getm
    /* 19554 80029554 04000524 */   addiu     $a1, $zero, 0x4
    /* 19558 80029558 1280043C */  lui        $a0, %hi(D_8011C488)
    /* 1955C 8002955C 88C48424 */  addiu      $a0, $a0, %lo(D_8011C488)
    /* 19560 80029560 04000524 */  addiu      $a1, $zero, 0x4
    /* 19564 80029564 B9B2000C */  jal        getm
    /* 19568 80029568 21804000 */   addu      $s0, $v0, $zero
    /* 1956C 8002956C 26800202 */  xor        $s0, $s0, $v0
    /* 19570 80029570 0100102E */  sltiu      $s0, $s0, 0x1
  .L80029574:
    /* 19574 80029574 21100002 */  addu       $v0, $s0, $zero
    /* 19578 80029578 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1957C 8002957C 1400B18F */  lw         $s1, 0x14($sp)
    /* 19580 80029580 1000B08F */  lw         $s0, 0x10($sp)
    /* 19584 80029584 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 19588 80029588 0800E003 */  jr         $ra
    /* 1958C 8002958C 00000000 */   nop
endlabel iscrcblock
