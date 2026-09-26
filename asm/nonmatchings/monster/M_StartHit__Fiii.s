.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartHit__Fiii, 0x2E8

glabel M_StartHit__Fiii
    /* 116E0 8014B2D8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 116E4 8014B2DC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 116E8 8014B2E0 21988000 */  addu       $s3, $a0, $zero
    /* 116EC 8014B2E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 116F0 8014B2E8 2180A000 */  addu       $s0, $a1, $zero
    /* 116F4 8014B2EC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 116F8 8014B2F0 2190C000 */  addu       $s2, $a2, $zero
    /* 116FC 8014B2F4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 11700 8014B2F8 0F000006 */  bltz       $s0, .L8014B338
    /* 11704 8014B2FC 1400B1AF */   sw        $s1, 0x14($sp)
    /* 11708 8014B300 40101300 */  sll        $v0, $s3, 1
    /* 1170C 8014B304 21105300 */  addu       $v0, $v0, $s3
    /* 11710 8014B308 80100200 */  sll        $v0, $v0, 2
    /* 11714 8014B30C 21105300 */  addu       $v0, $v0, $s3
    /* 11718 8014B310 C0100200 */  sll        $v0, $v0, 3
    /* 1171C 8014B314 01000324 */  addiu      $v1, $zero, 0x1
    /* 11720 8014B318 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 11724 8014B31C 21082200 */  addu       $at, $at, $v0
    /* 11728 8014B320 DA532490 */  lbu        $a0, %lo(monster + 0x46)($at)
    /* 1172C 8014B324 04180302 */  sllv       $v1, $v1, $s0
    /* 11730 8014B328 25208300 */  or         $a0, $a0, $v1
    /* 11734 8014B32C 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 11738 8014B330 21082200 */  addu       $at, $at, $v0
    /* 1173C 8014B334 DA5324A0 */  sb         $a0, %lo(monster + 0x46)($at)
  .L8014B338:
    /* 11740 8014B338 40101300 */  sll        $v0, $s3, 1
    /* 11744 8014B33C 21105300 */  addu       $v0, $v0, $s3
    /* 11748 8014B340 80100200 */  sll        $v0, $v0, 2
    /* 1174C 8014B344 21105300 */  addu       $v0, $v0, $s3
    /* 11750 8014B348 C0880200 */  sll        $s1, $v0, 3
    /* 11754 8014B34C 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 11758 8014B350 21083100 */  addu       $at, $at, $s1
    /* 1175C 8014B354 A453258C */  lw         $a1, %lo(monster + 0x10)($at)
    /* 11760 8014B358 1280063C */  lui        $a2, %hi(currlevel)
    /* 11764 8014B35C 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 11768 8014B360 E43A010C */  jal        delta_monster_hp__FilUc
    /* 1176C 8014B364 21206002 */   addu      $a0, $s3, $zero
    /* 11770 8014B368 21200000 */  addu       $a0, $zero, $zero
    /* 11774 8014B36C 25000524 */  addiu      $a1, $zero, 0x25
    /* 11778 8014B370 FFFF6632 */  andi       $a2, $s3, 0xFFFF
    /* 1177C 8014B374 183E010C */  jal        NetSendCmdParam2__FUcUcUsUs
    /* 11780 8014B378 FFFF4732 */   andi      $a3, $s2, 0xFFFF
    /* 11784 8014B37C 21206002 */  addu       $a0, $s3, $zero
    /* 11788 8014B380 4AF5000C */  jal        PlayEffect__Fii
    /* 1178C 8014B384 01000524 */   addiu     $a1, $zero, 0x1
    /* 11790 8014B388 24000006 */  bltz       $s0, .L8014B41C
    /* 11794 8014B38C 40101000 */   sll       $v0, $s0, 1
    /* 11798 8014B390 21105000 */  addu       $v0, $v0, $s0
    /* 1179C 8014B394 80100200 */  sll        $v0, $v0, 2
    /* 117A0 8014B398 21105000 */  addu       $v0, $v0, $s0
    /* 117A4 8014B39C 00110200 */  sll        $v0, $v0, 4
    /* 117A8 8014B3A0 23105000 */  subu       $v0, $v0, $s0
    /* 117AC 8014B3A4 80100200 */  sll        $v0, $v0, 2
    /* 117B0 8014B3A8 21105000 */  addu       $v0, $v0, $s0
    /* 117B4 8014B3AC C0100200 */  sll        $v0, $v0, 3
    /* 117B8 8014B3B0 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 117BC 8014B3B4 21083100 */  addu       $at, $at, $s1
    /* 117C0 8014B3B8 D15330A0 */  sb         $s0, %lo(monster + 0x3D)($at)
    /* 117C4 8014B3BC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 117C8 8014B3C0 21082200 */  addu       $at, $at, $v0
    /* 117CC 8014B3C4 68A52394 */  lhu        $v1, %lo(plr + 0x30)($at)
    /* 117D0 8014B3C8 1080013C */  lui        $at, %hi(monster + 0x4A)
    /* 117D4 8014B3CC 21083100 */  addu       $at, $at, $s1
    /* 117D8 8014B3D0 DE5323A0 */  sb         $v1, %lo(monster + 0x4A)($at)
    /* 117DC 8014B3D4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 117E0 8014B3D8 21083100 */  addu       $at, $at, $s1
    /* 117E4 8014B3DC C0532394 */  lhu        $v1, %lo(monster + 0x2C)($at)
    /* 117E8 8014B3E0 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 117EC 8014B3E4 21082200 */  addu       $at, $at, $v0
    /* 117F0 8014B3E8 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 117F4 8014B3EC EFFF6330 */  andi       $v1, $v1, 0xFFEF
    /* 117F8 8014B3F0 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 117FC 8014B3F4 21083100 */  addu       $at, $at, $s1
    /* 11800 8014B3F8 C05323A4 */  sh         $v1, %lo(monster + 0x2C)($at)
    /* 11804 8014B3FC 1080013C */  lui        $at, %hi(monster + 0x4B)
    /* 11808 8014B400 21083100 */  addu       $at, $at, $s1
    /* 1180C 8014B404 DF5322A0 */  sb         $v0, %lo(monster + 0x4B)($at)
    /* 11810 8014B408 EB2A050C */  jal        M_GetDir__Fi
    /* 11814 8014B40C 21206002 */   addu      $a0, $s3, $zero
    /* 11818 8014B410 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1181C 8014B414 21083100 */  addu       $at, $at, $s1
    /* 11820 8014B418 D05322A0 */  sb         $v0, %lo(monster + 0x3C)($at)
  .L8014B41C:
    /* 11824 8014B41C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 11828 8014B420 21083100 */  addu       $at, $at, $s1
    /* 1182C 8014B424 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 11830 8014B428 00000000 */  nop
    /* 11834 8014B42C 12004490 */  lbu        $a0, 0x12($v0)
    /* 11838 8014B430 00000000 */  nop
    /* 1183C 8014B434 E3FF8224 */  addiu      $v0, $a0, -0x1D
    /* 11840 8014B438 0400422C */  sltiu      $v0, $v0, 0x4
    /* 11844 8014B43C 09004014 */  bnez       $v0, .L8014B464
    /* 11848 8014B440 FF008330 */   andi      $v1, $a0, 0xFF
    /* 1184C 8014B444 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 11850 8014B448 21083100 */  addu       $at, $at, $s1
    /* 11854 8014B44C DB532280 */  lb         $v0, %lo(monster + 0x47)($at)
    /* 11858 8014B450 83191200 */  sra        $v1, $s2, 6
    /* 1185C 8014B454 03004224 */  addiu      $v0, $v0, 0x3
    /* 11860 8014B458 2A186200 */  slt        $v1, $v1, $v0
    /* 11864 8014B45C 50006014 */  bnez       $v1, .L8014B5A0
    /* 11868 8014B460 FF008330 */   andi      $v1, $a0, 0xFF
  .L8014B464:
    /* 1186C 8014B464 27000224 */  addiu      $v0, $zero, 0x27
    /* 11870 8014B468 05006214 */  bne        $v1, $v0, .L8014B480
    /* 11874 8014B46C F0FF8224 */   addiu     $v0, $a0, -0x10
    /* 11878 8014B470 283A050C */  jal        M_Teleport__Fi
    /* 1187C 8014B474 21206002 */   addu      $a0, $s3, $zero
    /* 11880 8014B478 272D0508 */  j          .L8014B49C
    /* 11884 8014B47C 40101300 */   sll       $v0, $s3, 1
  .L8014B480:
    /* 11888 8014B480 0400422C */  sltiu      $v0, $v0, 0x4
    /* 1188C 8014B484 04004010 */  beqz       $v0, .L8014B498
    /* 11890 8014B488 01000224 */   addiu     $v0, $zero, 0x1
    /* 11894 8014B48C 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 11898 8014B490 21083100 */  addu       $at, $at, $s1
    /* 1189C 8014B494 DD5322A0 */  sb         $v0, %lo(monster + 0x49)($at)
  .L8014B498:
    /* 118A0 8014B498 40101300 */  sll        $v0, $s3, 1
  .L8014B49C:
    /* 118A4 8014B49C 21105300 */  addu       $v0, $v0, $s3
    /* 118A8 8014B4A0 80100200 */  sll        $v0, $v0, 2
    /* 118AC 8014B4A4 21105300 */  addu       $v0, $v0, $s3
    /* 118B0 8014B4A8 C0900200 */  sll        $s2, $v0, 3
    /* 118B4 8014B4AC 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 118B8 8014B4B0 21083200 */  addu       $at, $at, $s2
    /* 118BC 8014B4B4 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 118C0 8014B4B8 0F000224 */  addiu      $v0, $zero, 0xF
    /* 118C4 8014B4BC 38006210 */  beq        $v1, $v0, .L8014B5A0
    /* 118C8 8014B4C0 21206002 */   addu      $a0, $s3, $zero
    /* 118CC 8014B4C4 03000724 */  addiu      $a3, $zero, 0x3
    /* 118D0 8014B4C8 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 118D4 8014B4CC 21083200 */  addu       $at, $at, $s2
    /* 118D8 8014B4D0 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 118DC 8014B4D4 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 118E0 8014B4D8 21083200 */  addu       $at, $at, $s2
    /* 118E4 8014B4DC D0532680 */  lb         $a2, %lo(monster + 0x3C)($at)
    /* 118E8 8014B4E0 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 118EC 8014B4E4 0A00A524 */   addiu     $a1, $a1, 0xA
    /* 118F0 8014B4E8 1080023C */  lui        $v0, %hi(monster)
    /* 118F4 8014B4EC 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 118F8 8014B4F0 21104202 */  addu       $v0, $s2, $v0
    /* 118FC 8014B4F4 38005180 */  lb         $s1, 0x38($v0)
    /* 11900 8014B4F8 39005080 */  lb         $s0, 0x39($v0)
    /* 11904 8014B4FC 05000224 */  addiu      $v0, $zero, 0x5
    /* 11908 8014B500 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1190C 8014B504 21083200 */  addu       $at, $at, $s2
    /* 11910 8014B508 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 11914 8014B50C 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 11918 8014B510 21083200 */  addu       $at, $at, $s2
    /* 1191C 8014B514 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 11920 8014B518 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 11924 8014B51C 21083200 */  addu       $at, $at, $s2
    /* 11928 8014B520 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 1192C 8014B524 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 11930 8014B528 21083200 */  addu       $at, $at, $s2
    /* 11934 8014B52C C85331A0 */  sb         $s1, %lo(monster + 0x34)($at)
    /* 11938 8014B530 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1193C 8014B534 21083200 */  addu       $at, $at, $s2
    /* 11940 8014B538 C95330A0 */  sb         $s0, %lo(monster + 0x35)($at)
    /* 11944 8014B53C 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 11948 8014B540 21083200 */  addu       $at, $at, $s2
    /* 1194C 8014B544 CA5331A0 */  sb         $s1, %lo(monster + 0x36)($at)
    /* 11950 8014B548 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 11954 8014B54C 21083200 */  addu       $at, $at, $s2
    /* 11958 8014B550 CB5330A0 */  sb         $s0, %lo(monster + 0x37)($at)
    /* 1195C 8014B554 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 11960 8014B558 21083200 */  addu       $at, $at, $s2
    /* 11964 8014B55C CC5331A0 */  sb         $s1, %lo(monster + 0x38)($at)
    /* 11968 8014B560 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 1196C 8014B564 21083200 */  addu       $at, $at, $s2
    /* 11970 8014B568 CD5330A0 */  sb         $s0, %lo(monster + 0x39)($at)
    /* 11974 8014B56C D5FC010C */  jal        M_CheckEFlag__Fi
    /* 11978 8014B570 21206002 */   addu      $a0, $s3, $zero
    /* 1197C 8014B574 D7FC010C */  jal        M_ClearSquares__Fi
    /* 11980 8014B578 21206002 */   addu      $a0, $s3, $zero
    /* 11984 8014B57C C0801000 */  sll        $s0, $s0, 3
    /* 11988 8014B580 C0101100 */  sll        $v0, $s1, 3
    /* 1198C 8014B584 23105100 */  subu       $v0, $v0, $s1
    /* 11990 8014B588 C0110200 */  sll        $v0, $v0, 7
    /* 11994 8014B58C 21800202 */  addu       $s0, $s0, $v0
    /* 11998 8014B590 01006226 */  addiu      $v0, $s3, 0x1
    /* 1199C 8014B594 0E80013C */  lui        $at, %hi(dung_map)
    /* 119A0 8014B598 21083000 */  addu       $at, $at, $s0
    /* 119A4 8014B59C 287A22A4 */  sh         $v0, %lo(dung_map)($at)
  .L8014B5A0:
    /* 119A8 8014B5A0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 119AC 8014B5A4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 119B0 8014B5A8 1800B28F */  lw         $s2, 0x18($sp)
    /* 119B4 8014B5AC 1400B18F */  lw         $s1, 0x14($sp)
    /* 119B8 8014B5B0 1000B08F */  lw         $s0, 0x10($sp)
    /* 119BC 8014B5B4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 119C0 8014B5B8 0800E003 */  jr         $ra
    /* 119C4 8014B5BC 00000000 */   nop
endlabel M_StartHit__Fiii
