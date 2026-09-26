.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_TryM2MHit__Fiiiii, 0x238

glabel M_TryM2MHit__Fiiiii
    /* 135F8 8014D1F0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 135FC 8014D1F4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 13600 8014D1F8 21908000 */  addu       $s2, $a0, $zero
    /* 13604 8014D1FC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 13608 8014D200 2188A000 */  addu       $s1, $a1, $zero
    /* 1360C 8014D204 3000B6AF */  sw         $s6, 0x30($sp)
    /* 13610 8014D208 21B0C000 */  addu       $s6, $a2, $zero
    /* 13614 8014D20C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 13618 8014D210 40101100 */  sll        $v0, $s1, 1
    /* 1361C 8014D214 21105100 */  addu       $v0, $v0, $s1
    /* 13620 8014D218 80100200 */  sll        $v0, $v0, 2
    /* 13624 8014D21C 21105100 */  addu       $v0, $v0, $s1
    /* 13628 8014D220 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1362C 8014D224 C0800200 */  sll        $s0, $v0, 3
    /* 13630 8014D228 3800BFAF */  sw         $ra, 0x38($sp)
    /* 13634 8014D22C 3400B7AF */  sw         $s7, 0x34($sp)
    /* 13638 8014D230 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1363C 8014D234 2400B3AF */  sw         $s3, 0x24($sp)
    /* 13640 8014D238 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 13644 8014D23C 21083000 */  addu       $at, $at, $s0
    /* 13648 8014D240 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1364C 8014D244 5000B78F */  lw         $s7, 0x50($sp)
    /* 13650 8014D248 83110200 */  sra        $v0, $v0, 6
    /* 13654 8014D24C 6A004018 */  blez       $v0, .L8014D3F8
    /* 13658 8014D250 21A8E000 */   addu      $s5, $a3, $zero
    /* 1365C 8014D254 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 13660 8014D258 21083000 */  addu       $at, $at, $s0
    /* 13664 8014D25C F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 13668 8014D260 00000000 */  nop
    /* 1366C 8014D264 12004390 */  lbu        $v1, 0x12($v0)
    /* 13670 8014D268 20000224 */  addiu      $v0, $zero, 0x20
    /* 13674 8014D26C 07006214 */  bne        $v1, $v0, .L8014D28C
    /* 13678 8014D270 02000224 */   addiu     $v0, $zero, 0x2
    /* 1367C 8014D274 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 13680 8014D278 21083000 */  addu       $at, $at, $s0
    /* 13684 8014D27C DD532390 */  lbu        $v1, %lo(monster + 0x49)($at)
    /* 13688 8014D280 00000000 */  nop
    /* 1368C 8014D284 5C006210 */  beq        $v1, $v0, .L8014D3F8
    /* 13690 8014D288 00000000 */   nop
  .L8014D28C:
    /* 13694 8014D28C C9F6000C */  jal        ENG_random__Fl
    /* 13698 8014D290 64000424 */   addiu     $a0, $zero, 0x64
    /* 1369C 8014D294 21984000 */  addu       $s3, $v0, $zero
    /* 136A0 8014D298 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 136A4 8014D29C 21083000 */  addu       $at, $at, $s0
    /* 136A8 8014D2A0 C7532280 */  lb         $v0, %lo(monster + 0x33)($at)
    /* 136AC 8014D2A4 0F001424 */  addiu      $s4, $zero, 0xF
    /* 136B0 8014D2A8 02005414 */  bne        $v0, $s4, .L8014D2B4
    /* 136B4 8014D2AC 21202002 */   addu      $a0, $s1, $zero
    /* 136B8 8014D2B0 21980000 */  addu       $s3, $zero, $zero
  .L8014D2B4:
    /* 136BC 8014D2B4 635A050C */  jal        CheckMonsterHit__FiRUc
    /* 136C0 8014D2B8 1000A527 */   addiu     $a1, $sp, 0x10
    /* 136C4 8014D2BC FF004230 */  andi       $v0, $v0, 0xFF
    /* 136C8 8014D2C0 4D004014 */  bnez       $v0, .L8014D3F8
    /* 136CC 8014D2C4 2A107602 */   slt       $v0, $s3, $s6
    /* 136D0 8014D2C8 4B004010 */  beqz       $v0, .L8014D3F8
    /* 136D4 8014D2CC 2320F502 */   subu      $a0, $s7, $s5
    /* 136D8 8014D2D0 C9F6000C */  jal        ENG_random__Fl
    /* 136DC 8014D2D4 01008424 */   addiu     $a0, $a0, 0x1
    /* 136E0 8014D2D8 21305500 */  addu       $a2, $v0, $s5
    /* 136E4 8014D2DC 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 136E8 8014D2E0 21083000 */  addu       $at, $at, $s0
    /* 136EC 8014D2E4 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 136F0 8014D2E8 80310600 */  sll        $a2, $a2, 6
    /* 136F4 8014D2EC 23104600 */  subu       $v0, $v0, $a2
    /* 136F8 8014D2F0 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 136FC 8014D2F4 21083000 */  addu       $at, $at, $s0
    /* 13700 8014D2F8 A45322AC */  sw         $v0, %lo(monster + 0x10)($at)
    /* 13704 8014D2FC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 13708 8014D300 21083000 */  addu       $at, $at, $s0
    /* 1370C 8014D304 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 13710 8014D308 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 13714 8014D30C 21083000 */  addu       $at, $at, $s0
    /* 13718 8014D310 A453238C */  lw         $v1, %lo(monster + 0x10)($at)
    /* 1371C 8014D314 10004234 */  ori        $v0, $v0, 0x10
    /* 13720 8014D318 83190300 */  sra        $v1, $v1, 6
    /* 13724 8014D31C 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 13728 8014D320 21083000 */  addu       $at, $at, $s0
    /* 1372C 8014D324 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 13730 8014D328 2300601C */  bgtz       $v1, .L8014D3B8
    /* 13734 8014D32C 40101200 */   sll       $v0, $s2, 1
    /* 13738 8014D330 21105200 */  addu       $v0, $v0, $s2
    /* 1373C 8014D334 80100200 */  sll        $v0, $v0, 2
    /* 13740 8014D338 21105200 */  addu       $v0, $v0, $s2
    /* 13744 8014D33C C0200200 */  sll        $a0, $v0, 3
    /* 13748 8014D340 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1374C 8014D344 21082400 */  addu       $at, $at, $a0
    /* 13750 8014D348 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 13754 8014D34C 00000000 */  nop
    /* 13758 8014D350 12004390 */  lbu        $v1, 0x12($v0)
    /* 1375C 8014D354 6D000224 */  addiu      $v0, $zero, 0x6D
    /* 13760 8014D358 09006210 */  beq        $v1, $v0, .L8014D380
    /* 13764 8014D35C 00000000 */   nop
    /* 13768 8014D360 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1376C 8014D364 21082400 */  addu       $at, $at, $a0
    /* 13770 8014D368 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 13774 8014D36C 00000000 */  nop
    /* 13778 8014D370 EFFF4230 */  andi       $v0, $v0, 0xFFEF
    /* 1377C 8014D374 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 13780 8014D378 21082400 */  addu       $at, $at, $a0
    /* 13784 8014D37C C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
  .L8014D380:
    /* 13788 8014D380 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1378C 8014D384 21083000 */  addu       $at, $at, $s0
    /* 13790 8014D388 C7532280 */  lb         $v0, %lo(monster + 0x33)($at)
    /* 13794 8014D38C 00000000 */  nop
    /* 13798 8014D390 05005414 */  bne        $v0, $s4, .L8014D3A8
    /* 1379C 8014D394 21204002 */   addu      $a0, $s2, $zero
    /* 137A0 8014D398 0430050C */  jal        M2MStartKill__Fii
    /* 137A4 8014D39C 21282002 */   addu      $a1, $s1, $zero
    /* 137A8 8014D3A0 F7340508 */  j          .L8014D3DC
    /* 137AC 8014D3A4 0F000224 */   addiu     $v0, $zero, 0xF
  .L8014D3A8:
    /* 137B0 8014D3A8 0430050C */  jal        M2MStartKill__Fii
    /* 137B4 8014D3AC 21282002 */   addu      $a1, $s1, $zero
    /* 137B8 8014D3B0 FE340508 */  j          .L8014D3F8
    /* 137BC 8014D3B4 00000000 */   nop
  .L8014D3B8:
    /* 137C0 8014D3B8 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 137C4 8014D3BC 21083000 */  addu       $at, $at, $s0
    /* 137C8 8014D3C0 C7532280 */  lb         $v0, %lo(monster + 0x33)($at)
    /* 137CC 8014D3C4 00000000 */  nop
    /* 137D0 8014D3C8 09005414 */  bne        $v0, $s4, .L8014D3F0
    /* 137D4 8014D3CC 21202002 */   addu      $a0, $s1, $zero
    /* 137D8 8014D3D0 3A2E050C */  jal        M2MStartHit__Fiii
    /* 137DC 8014D3D4 21284002 */   addu      $a1, $s2, $zero
    /* 137E0 8014D3D8 0F000224 */  addiu      $v0, $zero, 0xF
  .L8014D3DC:
    /* 137E4 8014D3DC 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 137E8 8014D3E0 21083000 */  addu       $at, $at, $s0
    /* 137EC 8014D3E4 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 137F0 8014D3E8 FE340508 */  j          .L8014D3F8
    /* 137F4 8014D3EC 00000000 */   nop
  .L8014D3F0:
    /* 137F8 8014D3F0 3A2E050C */  jal        M2MStartHit__Fiii
    /* 137FC 8014D3F4 21284002 */   addu      $a1, $s2, $zero
  .L8014D3F8:
    /* 13800 8014D3F8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 13804 8014D3FC 3400B78F */  lw         $s7, 0x34($sp)
    /* 13808 8014D400 3000B68F */  lw         $s6, 0x30($sp)
    /* 1380C 8014D404 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 13810 8014D408 2800B48F */  lw         $s4, 0x28($sp)
    /* 13814 8014D40C 2400B38F */  lw         $s3, 0x24($sp)
    /* 13818 8014D410 2000B28F */  lw         $s2, 0x20($sp)
    /* 1381C 8014D414 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 13820 8014D418 1800B08F */  lw         $s0, 0x18($sp)
    /* 13824 8014D41C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 13828 8014D420 0800E003 */  jr         $ra
    /* 1382C 8014D424 00000000 */   nop
endlabel M_TryM2MHit__Fiiiii
