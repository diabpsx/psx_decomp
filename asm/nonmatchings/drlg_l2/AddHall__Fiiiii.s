.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddHall__Fiiiii, 0xD8

glabel AddHall__Fiiiii
    /* A784 8014437C 4817828F */  lw         $v0, %gp_rel(pHallList)($gp)
    /* A788 80144380 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* A78C 80144384 2000B4AF */  sw         $s4, 0x20($sp)
    /* A790 80144388 3800B48F */  lw         $s4, 0x38($sp)
    /* A794 8014438C 1000B0AF */  sw         $s0, 0x10($sp)
    /* A798 80144390 21808000 */  addu       $s0, $a0, $zero
    /* A79C 80144394 1400B1AF */  sw         $s1, 0x14($sp)
    /* A7A0 80144398 2188A000 */  addu       $s1, $a1, $zero
    /* A7A4 8014439C 1800B2AF */  sw         $s2, 0x18($sp)
    /* A7A8 801443A0 2190C000 */  addu       $s2, $a2, $zero
    /* A7AC 801443A4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* A7B0 801443A8 2198E000 */  addu       $s3, $a3, $zero
    /* A7B4 801443AC 0B004014 */  bnez       $v0, .L801443DC
    /* A7B8 801443B0 2400BFAF */   sw        $ra, 0x24($sp)
    /* A7BC 801443B4 E4F6000C */  jal        DiabloAllocPtr__FUl
    /* A7C0 801443B8 18000424 */   addiu     $a0, $zero, 0x18
    /* A7C4 801443BC 481782AF */  sw         $v0, %gp_rel(pHallList)($gp)
    /* A7C8 801443C0 000050AC */  sw         $s0, 0x0($v0)
    /* A7CC 801443C4 040051AC */  sw         $s1, 0x4($v0)
    /* A7D0 801443C8 080052AC */  sw         $s2, 0x8($v0)
    /* A7D4 801443CC 0C0053AC */  sw         $s3, 0xC($v0)
    /* A7D8 801443D0 100054AC */  sw         $s4, 0x10($v0)
    /* A7DC 801443D4 0C110508 */  j          .L80144430
    /* A7E0 801443D8 140040AC */   sw        $zero, 0x14($v0)
  .L801443DC:
    /* A7E4 801443DC E4F6000C */  jal        DiabloAllocPtr__FUl
    /* A7E8 801443E0 18000424 */   addiu     $a0, $zero, 0x18
    /* A7EC 801443E4 4817838F */  lw         $v1, %gp_rel(pHallList)($gp)
    /* A7F0 801443E8 21204000 */  addu       $a0, $v0, $zero
    /* A7F4 801443EC 000090AC */  sw         $s0, 0x0($a0)
    /* A7F8 801443F0 040091AC */  sw         $s1, 0x4($a0)
    /* A7FC 801443F4 080092AC */  sw         $s2, 0x8($a0)
    /* A800 801443F8 0C0093AC */  sw         $s3, 0xC($a0)
    /* A804 801443FC 100094AC */  sw         $s4, 0x10($a0)
    /* A808 80144400 140080AC */  sw         $zero, 0x14($a0)
    /* A80C 80144404 1400628C */  lw         $v0, 0x14($v1)
    /* A810 80144408 00000000 */  nop
    /* A814 8014440C 07004010 */  beqz       $v0, .L8014442C
    /* A818 80144410 00000000 */   nop
  .L80144414:
    /* A81C 80144414 1400638C */  lw         $v1, 0x14($v1)
    /* A820 80144418 00000000 */  nop
    /* A824 8014441C 1400628C */  lw         $v0, 0x14($v1)
    /* A828 80144420 00000000 */  nop
    /* A82C 80144424 FBFF4014 */  bnez       $v0, .L80144414
    /* A830 80144428 00000000 */   nop
  .L8014442C:
    /* A834 8014442C 140064AC */  sw         $a0, 0x14($v1)
  .L80144430:
    /* A838 80144430 2400BF8F */  lw         $ra, 0x24($sp)
    /* A83C 80144434 2000B48F */  lw         $s4, 0x20($sp)
    /* A840 80144438 1C00B38F */  lw         $s3, 0x1C($sp)
    /* A844 8014443C 1800B28F */  lw         $s2, 0x18($sp)
    /* A848 80144440 1400B18F */  lw         $s1, 0x14($sp)
    /* A84C 80144444 1000B08F */  lw         $s0, 0x10($sp)
    /* A850 80144448 2800BD27 */  addiu      $sp, $sp, 0x28
    /* A854 8014444C 0800E003 */  jr         $ra
    /* A858 80144450 00000000 */   nop
endlabel AddHall__Fiiiii
