.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Tfree__FPv, 0xB0

glabel Tfree__FPv
    /* 7839C 8008839C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 783A0 800883A0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 783A4 800883A4 21908000 */  addu       $s2, $a0, $zero
    /* 783A8 800883A8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 783AC 800883AC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 783B0 800883B0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 783B4 800883B4 1D004012 */  beqz       $s2, .L8008842C
    /* 783B8 800883B8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 783BC 800883BC 0B80103C */  lui        $s0, %hi(MemBlock + 0x4)
    /* 783C0 800883C0 587B1026 */  addiu      $s0, $s0, %lo(MemBlock + 0x4)
    /* 783C4 800883C4 21880000 */  addu       $s1, $zero, $zero
    /* 783C8 800883C8 E0011326 */  addiu      $s3, $s0, 0x1E0
  .L800883CC:
    /* 783CC 800883CC 0000028E */  lw         $v0, 0x0($s0)
    /* 783D0 800883D0 00000000 */  nop
    /* 783D4 800883D4 11004216 */  bne        $s2, $v0, .L8008841C
    /* 783D8 800883D8 00000000 */   nop
    /* 783DC 800883DC 0B80013C */  lui        $at, %hi(MemBlock)
    /* 783E0 800883E0 21083100 */  addu       $at, $at, $s1
    /* 783E4 800883E4 547B248C */  lw         $a0, %lo(MemBlock)($at)
    /* 783E8 800883E8 1886000C */  jal        GAL_Free
    /* 783EC 800883EC 00000000 */   nop
    /* 783F0 800883F0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 783F4 800883F4 05004014 */  bnez       $v0, .L8008840C
    /* 783F8 800883F8 21200000 */   addu      $a0, $zero, $zero
    /* 783FC 800883FC 1180053C */  lui        $a1, %hi(D_80110394)
    /* 78400 80088400 9403A524 */  addiu      $a1, $a1, %lo(D_80110394)
    /* 78404 80088404 A583000C */  jal        DBG_Error
    /* 78408 80088408 85000624 */   addiu     $a2, $zero, 0x85
  .L8008840C:
    /* 7840C 8008840C 1404828F */  lw         $v0, %gp_rel(NoTAllocs)($gp)
    /* 78410 80088410 000000AE */  sw         $zero, 0x0($s0)
    /* 78414 80088414 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 78418 80088418 140482AF */  sw         $v0, %gp_rel(NoTAllocs)($gp)
  .L8008841C:
    /* 7841C 8008841C 08001026 */  addiu      $s0, $s0, 0x8
    /* 78420 80088420 2A101302 */  slt        $v0, $s0, $s3
    /* 78424 80088424 E9FF4014 */  bnez       $v0, .L800883CC
    /* 78428 80088428 08003126 */   addiu     $s1, $s1, 0x8
  .L8008842C:
    /* 7842C 8008842C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 78430 80088430 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 78434 80088434 1800B28F */  lw         $s2, 0x18($sp)
    /* 78438 80088438 1400B18F */  lw         $s1, 0x14($sp)
    /* 7843C 8008843C 1000B08F */  lw         $s0, 0x10($sp)
    /* 78440 80088440 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 78444 80088444 0800E003 */  jr         $ra
    /* 78448 80088448 00000000 */   nop
endlabel Tfree__FPv
