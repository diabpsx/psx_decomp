.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_mdec_polys, 0x390

glabel init_mdec_polys
    /* 1D754 8015734C 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 1D758 80157350 5000B2AF */  sw         $s2, 0x50($sp)
    /* 1D75C 80157354 21908000 */  addu       $s2, $a0, $zero
    /* 1D760 80157358 5400B3AF */  sw         $s3, 0x54($sp)
    /* 1D764 8015735C 2198A000 */  addu       $s3, $a1, $zero
    /* 1D768 80157360 5800B4AF */  sw         $s4, 0x58($sp)
    /* 1D76C 80157364 1580143C */  lui        $s4, %hi(tmdc_pol)
    /* 1D770 80157368 A44F9426 */  addiu      $s4, $s4, %lo(tmdc_pol)
    /* 1D774 8015736C 21208002 */  addu       $a0, $s4, $zero
    /* 1D778 80157370 1580053C */  lui        $a1, %hi(br)
    /* 1D77C 80157374 6449A524 */  addiu      $a1, $a1, %lo(br)
    /* 1D780 80157378 4800B0AF */  sw         $s0, 0x48($sp)
    /* 1D784 8015737C FFFFD024 */  addiu      $s0, $a2, -0x1
    /* 1D788 80157380 8000A38F */  lw         $v1, 0x80($sp)
    /* 1D78C 80157384 8400A88F */  lw         $t0, 0x84($sp)
    /* 1D790 80157388 21300000 */  addu       $a2, $zero, $zero
    /* 1D794 8015738C 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 1D798 80157390 FFFFF124 */  addiu      $s1, $a3, -0x1
    /* 1D79C 80157394 5C00B5AF */  sw         $s5, 0x5C($sp)
    /* 1D7A0 80157398 8800B58F */  lw         $s5, 0x88($sp)
    /* 1D7A4 8015739C 00141000 */  sll        $v0, $s0, 16
    /* 1D7A8 801573A0 6000B6AF */  sw         $s6, 0x60($sp)
    /* 1D7AC 801573A4 8C00B68F */  lw         $s6, 0x8C($sp)
    /* 1D7B0 801573A8 43140200 */  sra        $v0, $v0, 17
    /* 1D7B4 801573AC 6400B7AF */  sw         $s7, 0x64($sp)
    /* 1D7B8 801573B0 9000B78F */  lw         $s7, 0x90($sp)
    /* 1D7BC 801573B4 23104202 */  subu       $v0, $s2, $v0
    /* 1D7C0 801573B8 2400B0A7 */  sh         $s0, 0x24($sp)
    /* 1D7C4 801573BC 2600B1A7 */  sh         $s1, 0x26($sp)
    /* 1D7C8 801573C0 2000A3A7 */  sh         $v1, 0x20($sp)
    /* 1D7CC 801573C4 2200A8A7 */  sh         $t0, 0x22($sp)
    /* 1D7D0 801573C8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1D7D4 801573CC 2600A297 */  lhu        $v0, 0x26($sp)
    /* 1D7D8 801573D0 2000A727 */  addiu      $a3, $sp, 0x20
    /* 1D7DC 801573D4 6800BFAF */  sw         $ra, 0x68($sp)
    /* 1D7E0 801573D8 340D80AF */  sw         $zero, %gp_rel(frame_decoded)($gp)
    /* 1D7E4 801573DC 1580013C */  lui        $at, %hi(mdc_buf + 0x4)
    /* 1D7E8 801573E0 E85530A4 */  sh         $s0, %lo(mdc_buf + 0x4)($at)
    /* 1D7EC 801573E4 1580013C */  lui        $at, %hi(mdc_buf + 0x6)
    /* 1D7F0 801573E8 EA5531A4 */  sh         $s1, %lo(mdc_buf + 0x6)($at)
    /* 1D7F4 801573EC 1580013C */  lui        $at, %hi(mdc_buf + 0xC)
    /* 1D7F8 801573F0 F05530A4 */  sh         $s0, %lo(mdc_buf + 0xC)($at)
    /* 1D7FC 801573F4 1580013C */  lui        $at, %hi(mdc_buf + 0xE)
    /* 1D800 801573F8 F25531A4 */  sh         $s1, %lo(mdc_buf + 0xE)($at)
    /* 1D804 801573FC 1580013C */  lui        $at, %hi(mdc_buf)
    /* 1D808 80157400 E45523A4 */  sh         $v1, %lo(mdc_buf)($at)
    /* 1D80C 80157404 1580013C */  lui        $at, %hi(mdc_buf + 0x2)
    /* 1D810 80157408 E65528A4 */  sh         $t0, %lo(mdc_buf + 0x2)($at)
    /* 1D814 8015740C 1580013C */  lui        $at, %hi(mdc_buf + 0x8)
    /* 1D818 80157410 EC5535A4 */  sh         $s5, %lo(mdc_buf + 0x8)($at)
    /* 1D81C 80157414 1580013C */  lui        $at, %hi(mdc_buf + 0xA)
    /* 1D820 80157418 EE5536A4 */  sh         $s6, %lo(mdc_buf + 0xA)($at)
    /* 1D824 8015741C 1800B7AF */  sw         $s7, 0x18($sp)
    /* 1D828 80157420 00140200 */  sll        $v0, $v0, 16
    /* 1D82C 80157424 43140200 */  sra        $v0, $v0, 17
    /* 1D830 80157428 23106202 */  subu       $v0, $s3, $v0
    /* 1D834 8015742C 7B5A050C */  jal        split_poly_area
    /* 1D838 80157430 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1D83C 80157434 F00D838F */  lw         $v1, %gp_rel(area_pw)($gp)
    /* 1D840 80157438 F40D848F */  lw         $a0, %gp_rel(area_ph)($gp)
    /* 1D844 8015743C FC0D82AF */  sw         $v0, %gp_rel(num_pol)($gp)
    /* 1D848 80157440 140E83AF */  sw         $v1, %gp_rel(mdec_pw)($gp)
    /* 1D84C 80157444 1C0E84AF */  sw         $a0, %gp_rel(mdec_ph)($gp)
    /* 1D850 80157448 1B004018 */  blez       $v0, .L801574B8
    /* 1D854 8015744C 21480000 */   addu      $t1, $zero, $zero
    /* 1D858 80157450 21408002 */  addu       $t0, $s4, $zero
    /* 1D85C 80157454 20030B25 */  addiu      $t3, $t0, 0x320
  .L80157458:
    /* 1D860 80157458 21386001 */  addu       $a3, $t3, $zero
    /* 1D864 8015745C 21300001 */  addu       $a2, $t0, $zero
    /* 1D868 80157460 20000A25 */  addiu      $t2, $t0, 0x20
  .L80157464:
    /* 1D86C 80157464 0000C28C */  lw         $v0, 0x0($a2)
    /* 1D870 80157468 0400C38C */  lw         $v1, 0x4($a2)
    /* 1D874 8015746C 0800C48C */  lw         $a0, 0x8($a2)
    /* 1D878 80157470 0C00C58C */  lw         $a1, 0xC($a2)
    /* 1D87C 80157474 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1D880 80157478 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1D884 8015747C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 1D888 80157480 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 1D88C 80157484 1000C624 */  addiu      $a2, $a2, 0x10
    /* 1D890 80157488 F6FFCA14 */  bne        $a2, $t2, .L80157464
    /* 1D894 8015748C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 1D898 80157490 0000C28C */  lw         $v0, 0x0($a2)
    /* 1D89C 80157494 0400C38C */  lw         $v1, 0x4($a2)
    /* 1D8A0 80157498 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1D8A4 8015749C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1D8A8 801574A0 28000825 */  addiu      $t0, $t0, 0x28
    /* 1D8AC 801574A4 FC0D828F */  lw         $v0, %gp_rel(num_pol)($gp)
    /* 1D8B0 801574A8 01002925 */  addiu      $t1, $t1, 0x1
    /* 1D8B4 801574AC 2A102201 */  slt        $v0, $t1, $v0
    /* 1D8B8 801574B0 E9FF4014 */  bnez       $v0, .L80157458
    /* 1D8BC 801574B4 28006B25 */   addiu     $t3, $t3, 0x28
  .L801574B8:
    /* 1D8C0 801574B8 FC0D828F */  lw         $v0, %gp_rel(num_pol)($gp)
    /* 1D8C4 801574BC 00000000 */  nop
    /* 1D8C8 801574C0 1D004018 */  blez       $v0, .L80157538
    /* 1D8CC 801574C4 21480000 */   addu      $t1, $zero, $zero
    /* 1D8D0 801574C8 1580023C */  lui        $v0, %hi(br + 0x320)
    /* 1D8D4 801574CC 844C4224 */  addiu      $v0, $v0, %lo(br + 0x320)
    /* 1D8D8 801574D0 E0FC4824 */  addiu      $t0, $v0, -0x320
    /* 1D8DC 801574D4 21584000 */  addu       $t3, $v0, $zero
  .L801574D8:
    /* 1D8E0 801574D8 21386001 */  addu       $a3, $t3, $zero
    /* 1D8E4 801574DC 21300001 */  addu       $a2, $t0, $zero
    /* 1D8E8 801574E0 20000A25 */  addiu      $t2, $t0, 0x20
  .L801574E4:
    /* 1D8EC 801574E4 0000C28C */  lw         $v0, 0x0($a2)
    /* 1D8F0 801574E8 0400C38C */  lw         $v1, 0x4($a2)
    /* 1D8F4 801574EC 0800C48C */  lw         $a0, 0x8($a2)
    /* 1D8F8 801574F0 0C00C58C */  lw         $a1, 0xC($a2)
    /* 1D8FC 801574F4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1D900 801574F8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1D904 801574FC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 1D908 80157500 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 1D90C 80157504 1000C624 */  addiu      $a2, $a2, 0x10
    /* 1D910 80157508 F6FFCA14 */  bne        $a2, $t2, .L801574E4
    /* 1D914 8015750C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 1D918 80157510 0000C28C */  lw         $v0, 0x0($a2)
    /* 1D91C 80157514 0400C38C */  lw         $v1, 0x4($a2)
    /* 1D920 80157518 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1D924 8015751C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1D928 80157520 28000825 */  addiu      $t0, $t0, 0x28
    /* 1D92C 80157524 FC0D828F */  lw         $v0, %gp_rel(num_pol)($gp)
    /* 1D930 80157528 01002925 */  addiu      $t1, $t1, 0x1
    /* 1D934 8015752C 2A102201 */  slt        $v0, $t1, $v0
    /* 1D938 80157530 E9FF4014 */  bnez       $v0, .L801574D8
    /* 1D93C 80157534 28006B25 */   addiu     $t3, $t3, 0x28
  .L80157538:
    /* 1D940 80157538 1580143C */  lui        $s4, %hi(tmdc_pol + 0x190)
    /* 1D944 8015753C 34519426 */  addiu      $s4, $s4, %lo(tmdc_pol + 0x190)
    /* 1D948 80157540 21208002 */  addu       $a0, $s4, $zero
    /* 1D94C 80157544 1580053C */  lui        $a1, %hi(br + 0x190)
    /* 1D950 80157548 F44AA524 */  addiu      $a1, $a1, %lo(br + 0x190)
    /* 1D954 8015754C 2400A297 */  lhu        $v0, 0x24($sp)
    /* 1D958 80157550 01000624 */  addiu      $a2, $zero, 0x1
    /* 1D95C 80157554 2000B5A7 */  sh         $s5, 0x20($sp)
    /* 1D960 80157558 2200B6A7 */  sh         $s6, 0x22($sp)
    /* 1D964 8015755C 00140200 */  sll        $v0, $v0, 16
    /* 1D968 80157560 43140200 */  sra        $v0, $v0, 17
    /* 1D96C 80157564 23104202 */  subu       $v0, $s2, $v0
    /* 1D970 80157568 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1D974 8015756C 2600A297 */  lhu        $v0, 0x26($sp)
    /* 1D978 80157570 2000A727 */  addiu      $a3, $sp, 0x20
    /* 1D97C 80157574 1800B7AF */  sw         $s7, 0x18($sp)
    /* 1D980 80157578 00140200 */  sll        $v0, $v0, 16
    /* 1D984 8015757C 43140200 */  sra        $v0, $v0, 17
    /* 1D988 80157580 23106202 */  subu       $v0, $s3, $v0
    /* 1D98C 80157584 7B5A050C */  jal        split_poly_area
    /* 1D990 80157588 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1D994 8015758C F00D838F */  lw         $v1, %gp_rel(area_pw)($gp)
    /* 1D998 80157590 F40D848F */  lw         $a0, %gp_rel(area_ph)($gp)
    /* 1D99C 80157594 000E82AF */  sw         $v0, %gp_rel(num_pol + 0x4)($gp)
    /* 1D9A0 80157598 180E83AF */  sw         $v1, %gp_rel(mdec_pw + 0x4)($gp)
    /* 1D9A4 8015759C 200E84AF */  sw         $a0, %gp_rel(mdec_ph + 0x4)($gp)
    /* 1D9A8 801575A0 1B004018 */  blez       $v0, .L80157610
    /* 1D9AC 801575A4 21480000 */   addu      $t1, $zero, $zero
    /* 1D9B0 801575A8 21408002 */  addu       $t0, $s4, $zero
    /* 1D9B4 801575AC 20030B25 */  addiu      $t3, $t0, 0x320
  .L801575B0:
    /* 1D9B8 801575B0 21386001 */  addu       $a3, $t3, $zero
    /* 1D9BC 801575B4 21300001 */  addu       $a2, $t0, $zero
    /* 1D9C0 801575B8 20000A25 */  addiu      $t2, $t0, 0x20
  .L801575BC:
    /* 1D9C4 801575BC 0000C28C */  lw         $v0, 0x0($a2)
    /* 1D9C8 801575C0 0400C38C */  lw         $v1, 0x4($a2)
    /* 1D9CC 801575C4 0800C48C */  lw         $a0, 0x8($a2)
    /* 1D9D0 801575C8 0C00C58C */  lw         $a1, 0xC($a2)
    /* 1D9D4 801575CC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1D9D8 801575D0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1D9DC 801575D4 0800E4AC */  sw         $a0, 0x8($a3)
    /* 1D9E0 801575D8 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 1D9E4 801575DC 1000C624 */  addiu      $a2, $a2, 0x10
    /* 1D9E8 801575E0 F6FFCA14 */  bne        $a2, $t2, .L801575BC
    /* 1D9EC 801575E4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 1D9F0 801575E8 0000C28C */  lw         $v0, 0x0($a2)
    /* 1D9F4 801575EC 0400C38C */  lw         $v1, 0x4($a2)
    /* 1D9F8 801575F0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1D9FC 801575F4 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1DA00 801575F8 28000825 */  addiu      $t0, $t0, 0x28
    /* 1DA04 801575FC 000E828F */  lw         $v0, %gp_rel(num_pol + 0x4)($gp)
    /* 1DA08 80157600 01002925 */  addiu      $t1, $t1, 0x1
    /* 1DA0C 80157604 2A102201 */  slt        $v0, $t1, $v0
    /* 1DA10 80157608 E9FF4014 */  bnez       $v0, .L801575B0
    /* 1DA14 8015760C 28006B25 */   addiu     $t3, $t3, 0x28
  .L80157610:
    /* 1DA18 80157610 000E828F */  lw         $v0, %gp_rel(num_pol + 0x4)($gp)
    /* 1DA1C 80157614 00000000 */  nop
    /* 1DA20 80157618 1D004018 */  blez       $v0, .L80157690
    /* 1DA24 8015761C 21480000 */   addu      $t1, $zero, $zero
    /* 1DA28 80157620 1580023C */  lui        $v0, %hi(D_80154E14)
    /* 1DA2C 80157624 144E4224 */  addiu      $v0, $v0, %lo(D_80154E14)
    /* 1DA30 80157628 E0FC4824 */  addiu      $t0, $v0, -0x320
    /* 1DA34 8015762C 21584000 */  addu       $t3, $v0, $zero
  .L80157630:
    /* 1DA38 80157630 21386001 */  addu       $a3, $t3, $zero
    /* 1DA3C 80157634 21300001 */  addu       $a2, $t0, $zero
    /* 1DA40 80157638 20000A25 */  addiu      $t2, $t0, 0x20
  .L8015763C:
    /* 1DA44 8015763C 0000C28C */  lw         $v0, 0x0($a2)
    /* 1DA48 80157640 0400C38C */  lw         $v1, 0x4($a2)
    /* 1DA4C 80157644 0800C48C */  lw         $a0, 0x8($a2)
    /* 1DA50 80157648 0C00C58C */  lw         $a1, 0xC($a2)
    /* 1DA54 8015764C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1DA58 80157650 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1DA5C 80157654 0800E4AC */  sw         $a0, 0x8($a3)
    /* 1DA60 80157658 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 1DA64 8015765C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 1DA68 80157660 F6FFCA14 */  bne        $a2, $t2, .L8015763C
    /* 1DA6C 80157664 1000E724 */   addiu     $a3, $a3, 0x10
    /* 1DA70 80157668 0000C28C */  lw         $v0, 0x0($a2)
    /* 1DA74 8015766C 0400C38C */  lw         $v1, 0x4($a2)
    /* 1DA78 80157670 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1DA7C 80157674 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1DA80 80157678 28000825 */  addiu      $t0, $t0, 0x28
    /* 1DA84 8015767C 000E828F */  lw         $v0, %gp_rel(num_pol + 0x4)($gp)
    /* 1DA88 80157680 01002925 */  addiu      $t1, $t1, 0x1
    /* 1DA8C 80157684 2A102201 */  slt        $v0, $t1, $v0
    /* 1DA90 80157688 E9FF4014 */  bnez       $v0, .L80157630
    /* 1DA94 8015768C 28006B25 */   addiu     $t3, $t3, 0x28
  .L80157690:
    /* 1DA98 80157690 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1DA9C 80157694 0C0E90AF */  sw         $s0, %gp_rel(mdec_w)($gp)
    /* 1DAA0 80157698 100E91AF */  sw         $s1, %gp_rel(mdec_h)($gp)
    /* 1DAA4 8015769C 040E92AF */  sw         $s2, %gp_rel(mdec_cx)($gp)
    /* 1DAA8 801576A0 080E93AF */  sw         $s3, %gp_rel(mdec_cy)($gp)
    /* 1DAAC 801576A4 100D82AF */  sw         $v0, %gp_rel(last_mdc)($gp)
    /* 1DAB0 801576A8 0C0D82AF */  sw         $v0, %gp_rel(last_fn)($gp)
    /* 1DAB4 801576AC 6800BF8F */  lw         $ra, 0x68($sp)
    /* 1DAB8 801576B0 6400B78F */  lw         $s7, 0x64($sp)
    /* 1DABC 801576B4 6000B68F */  lw         $s6, 0x60($sp)
    /* 1DAC0 801576B8 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 1DAC4 801576BC 5800B48F */  lw         $s4, 0x58($sp)
    /* 1DAC8 801576C0 5400B38F */  lw         $s3, 0x54($sp)
    /* 1DACC 801576C4 5000B28F */  lw         $s2, 0x50($sp)
    /* 1DAD0 801576C8 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 1DAD4 801576CC 4800B08F */  lw         $s0, 0x48($sp)
    /* 1DAD8 801576D0 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 1DADC 801576D4 0800E003 */  jr         $ra
    /* 1DAE0 801576D8 00000000 */   nop
endlabel init_mdec_polys
