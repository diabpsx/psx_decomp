.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initmemmanadr, 0x138

glabel initmemmanadr
    /* 1A26C 8002A26C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1A270 8002A270 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1A274 8002A274 21888000 */  addu       $s1, $a0, $zero
    /* 1A278 8002A278 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 1A27C 8002A27C 2198A000 */  addu       $s3, $a1, $zero
    /* 1A280 8002A280 2800B2AF */  sw         $s2, 0x28($sp)
    /* 1A284 8002A284 2190C000 */  addu       $s2, $a2, $zero
    /* 1A288 8002A288 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1A28C 8002A28C E3BD000C */  jal        getlocksemaphore
    /* 1A290 8002A290 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1A294 8002A294 21204000 */  addu       $a0, $v0, $zero
    /* 1A298 8002A298 142384AF */  sw         $a0, %gp_rel(_lv)($gp)
    /* 1A29C 8002A29C E8BD000C */  jal        locksemaphore
    /* 1A2A0 8002A2A0 00000000 */   nop
    /* 1A2A4 8002A2A4 1380043C */  lui        $a0, %hi(memclass)
    /* 1A2A8 8002A2A8 307A8424 */  addiu      $a0, $a0, %lo(memclass)
    /* 1A2AC 8002A2AC 2C1D93AF */  sw         $s3, %gp_rel(lowmemadr)($gp)
    /* 1A2B0 8002A2B0 A0B1000C */  jal        blockclear
    /* 1A2B4 8002A2B4 80010524 */   addiu     $a1, $zero, 0x180
    /* 1A2B8 8002A2B8 80101100 */  sll        $v0, $s1, 2
    /* 1A2BC 8002A2BC 21105100 */  addu       $v0, $v0, $s1
    /* 1A2C0 8002A2C0 C0100200 */  sll        $v0, $v0, 3
    /* 1A2C4 8002A2C4 21804000 */  addu       $s0, $v0, $zero
    /* 1A2C8 8002A2C8 2A105002 */  slt        $v0, $s2, $s0
    /* 1A2CC 8002A2CC 0C004010 */  beqz       $v0, .L8002A300
    /* 1A2D0 8002A2D0 00000000 */   nop
    /* 1A2D4 8002A2D4 1180043C */  lui        $a0, %hi(D_8010F3E4)
    /* 1A2D8 8002A2D8 E4F38424 */  addiu      $a0, $a0, %lo(D_8010F3E4)
    /* 1A2DC 8002A2DC 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1A2E0 8002A2E0 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1A2E4 8002A2E4 1280013C */  lui        $at, %hi(abortfile)
    /* 1A2E8 8002A2E8 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1A2EC 8002A2EC 78000224 */  addiu      $v0, $zero, 0x78
    /* 1A2F0 8002A2F0 1280013C */  lui        $at, %hi(abortline)
    /* 1A2F4 8002A2F4 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1A2F8 8002A2F8 0F95000C */  jal        abortmessage
    /* 1A2FC 8002A2FC 00000000 */   nop
  .L8002A300:
    /* 1A300 8002A300 2C1D848F */  lw         $a0, %gp_rel(lowmemadr)($gp)
    /* 1A304 8002A304 9CAD000C */  jal        initmemblocks
    /* 1A308 8002A308 21282002 */   addu      $a1, $s1, $zero
    /* 1A30C 8002A30C 1280043C */  lui        $a0, %hi(D_8011C4D0)
    /* 1A310 8002A310 D0C48424 */  addiu      $a0, $a0, %lo(D_8011C4D0)
    /* 1A314 8002A314 2C1D868F */  lw         $a2, %gp_rel(lowmemadr)($gp)
    /* 1A318 8002A318 21280000 */  addu       $a1, $zero, $zero
    /* 1A31C 8002A31C 21387202 */  addu       $a3, $s3, $s2
    /* 1A320 8002A320 08000224 */  addiu      $v0, $zero, 0x8
    /* 1A324 8002A324 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1A328 8002A328 20000224 */  addiu      $v0, $zero, 0x20
    /* 1A32C 8002A32C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1A330 8002A330 04000224 */  addiu      $v0, $zero, 0x4
    /* 1A334 8002A334 281D87AF */  sw         $a3, %gp_rel(highmemadr)($gp)
    /* 1A338 8002A338 1800A0AF */  sw         $zero, 0x18($sp)
    /* 1A33C 8002A33C 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 1A340 8002A340 E9A8000C */  jal        creatememclass
    /* 1A344 8002A344 2130D000 */   addu      $a2, $a2, $s0
    /* 1A348 8002A348 281D828F */  lw         $v0, %gp_rel(highmemadr)($gp)
    /* 1A34C 8002A34C 2C1D838F */  lw         $v1, %gp_rel(lowmemadr)($gp)
    /* 1A350 8002A350 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1A354 8002A354 23104300 */  subu       $v0, $v0, $v1
    /* 1A358 8002A358 442382AF */  sw         $v0, %gp_rel(highwater)($gp)
    /* 1A35C 8002A35C F3BD000C */  jal        unlocksemaphore
    /* 1A360 8002A360 00000000 */   nop
    /* 1A364 8002A364 2C1D858F */  lw         $a1, %gp_rel(lowmemadr)($gp)
    /* 1A368 8002A368 281D868F */  lw         $a2, %gp_rel(highmemadr)($gp)
    /* 1A36C 8002A36C 1180043C */  lui        $a0, %hi(D_8010F428)
    /* 1A370 8002A370 28F48424 */  addiu      $a0, $a0, %lo(D_8010F428)
    /* 1A374 8002A374 21384002 */  addu       $a3, $s2, $zero
    /* 1A378 8002A378 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1A37C 8002A37C 5F97000C */  jal        print
    /* 1A380 8002A380 1400B0AF */   sw        $s0, 0x14($sp)
    /* 1A384 8002A384 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1A388 8002A388 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 1A38C 8002A38C 2800B28F */  lw         $s2, 0x28($sp)
    /* 1A390 8002A390 2400B18F */  lw         $s1, 0x24($sp)
    /* 1A394 8002A394 2000B08F */  lw         $s0, 0x20($sp)
    /* 1A398 8002A398 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1A39C 8002A39C 0800E003 */  jr         $ra
    /* 1A3A0 8002A3A0 00000000 */   nop
endlabel initmemmanadr
