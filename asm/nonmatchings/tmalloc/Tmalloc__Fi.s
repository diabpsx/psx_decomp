.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Tmalloc__Fi, 0xF4

glabel Tmalloc__Fi
    /* 782A8 800882A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 782AC 800882AC 01800534 */  ori        $a1, $zero, 0x8001
    /* 782B0 800882B0 1280063C */  lui        $a2, %hi(D_8011AB8C)
    /* 782B4 800882B4 8CABC624 */  addiu      $a2, $a2, %lo(D_8011AB8C)
    /* 782B8 800882B8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 782BC 800882BC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 782C0 800882C0 7785000C */  jal        GAL_Alloc
    /* 782C4 800882C4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 782C8 800882C8 21804000 */  addu       $s0, $v0, $zero
    /* 782CC 800882CC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 782D0 800882D0 05000216 */  bne        $s0, $v0, .L800882E8
    /* 782D4 800882D4 21200000 */   addu      $a0, $zero, $zero
    /* 782D8 800882D8 1180053C */  lui        $a1, %hi(D_80110394)
    /* 782DC 800882DC 9403A524 */  addiu      $a1, $a1, %lo(D_80110394)
    /* 782E0 800882E0 A583000C */  jal        DBG_Error
    /* 782E4 800882E4 5C000624 */   addiu     $a2, $zero, 0x5C
  .L800882E8:
    /* 782E8 800882E8 DD85000C */  jal        GAL_Lock
    /* 782EC 800882EC 21200002 */   addu      $a0, $s0, $zero
    /* 782F0 800882F0 06000016 */  bnez       $s0, .L8008830C
    /* 782F4 800882F4 21884000 */   addu      $s1, $v0, $zero
    /* 782F8 800882F8 21200000 */  addu       $a0, $zero, $zero
    /* 782FC 800882FC 1180053C */  lui        $a1, %hi(D_80110394)
    /* 78300 80088300 9403A524 */  addiu      $a1, $a1, %lo(D_80110394)
    /* 78304 80088304 A583000C */  jal        DBG_Error
    /* 78308 80088308 60000624 */   addiu     $a2, $zero, 0x60
  .L8008830C:
    /* 7830C 8008830C 0B80043C */  lui        $a0, %hi(MemBlock + 0x4)
    /* 78310 80088310 587B8424 */  addiu      $a0, $a0, %lo(MemBlock + 0x4)
    /* 78314 80088314 21280000 */  addu       $a1, $zero, $zero
    /* 78318 80088318 E0018324 */  addiu      $v1, $a0, 0x1E0
  .L8008831C:
    /* 7831C 8008831C 0000828C */  lw         $v0, 0x0($a0)
    /* 78320 80088320 00000000 */  nop
    /* 78324 80088324 0A004014 */  bnez       $v0, .L80088350
    /* 78328 80088328 21102002 */   addu      $v0, $s1, $zero
    /* 7832C 8008832C 1404838F */  lw         $v1, %gp_rel(NoTAllocs)($gp)
    /* 78330 80088330 000082AC */  sw         $v0, 0x0($a0)
    /* 78334 80088334 0B80013C */  lui        $at, %hi(MemBlock)
    /* 78338 80088338 21082500 */  addu       $at, $at, $a1
    /* 7833C 8008833C 547B30AC */  sw         $s0, %lo(MemBlock)($at)
    /* 78340 80088340 01006324 */  addiu      $v1, $v1, 0x1
    /* 78344 80088344 140483AF */  sw         $v1, %gp_rel(NoTAllocs)($gp)
    /* 78348 80088348 E1200208 */  j          .L80088384
    /* 7834C 8008834C 00000000 */   nop
  .L80088350:
    /* 78350 80088350 08008424 */  addiu      $a0, $a0, 0x8
    /* 78354 80088354 2A108300 */  slt        $v0, $a0, $v1
    /* 78358 80088358 F0FF4014 */  bnez       $v0, .L8008831C
    /* 7835C 8008835C 0800A524 */   addiu     $a1, $a1, 0x8
    /* 78360 80088360 1180023C */  lui        $v0, %hi(D_801103A8)
    /* 78364 80088364 A8034224 */  addiu      $v0, $v0, %lo(D_801103A8)
    /* 78368 80088368 05004010 */  beqz       $v0, .L80088380
    /* 7836C 8008836C 21200000 */   addu      $a0, $zero, $zero
    /* 78370 80088370 1180053C */  lui        $a1, %hi(D_80110394)
    /* 78374 80088374 9403A524 */  addiu      $a1, $a1, %lo(D_80110394)
    /* 78378 80088378 A583000C */  jal        DBG_Error
    /* 7837C 8008837C 6C000624 */   addiu     $a2, $zero, 0x6C
  .L80088380:
    /* 78380 80088380 21100000 */  addu       $v0, $zero, $zero
  .L80088384:
    /* 78384 80088384 1800BF8F */  lw         $ra, 0x18($sp)
    /* 78388 80088388 1400B18F */  lw         $s1, 0x14($sp)
    /* 7838C 8008838C 1000B08F */  lw         $s0, 0x10($sp)
    /* 78390 80088390 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 78394 80088394 0800E003 */  jr         $ra
    /* 78398 80088398 00000000 */   nop
endlabel Tmalloc__Fi
