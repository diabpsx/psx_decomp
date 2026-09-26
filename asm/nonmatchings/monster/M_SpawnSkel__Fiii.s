.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_SpawnSkel__Fiii, 0x150

glabel M_SpawnSkel__Fiii
    /* 1C894 8015648C 1C1B828F */  lw         $v0, %gp_rel(nummtypes)($gp)
    /* 1C898 80156490 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 1C89C 80156494 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 1C8A0 80156498 21A88000 */  addu       $s5, $a0, $zero
    /* 1C8A4 8015649C 4000B6AF */  sw         $s6, 0x40($sp)
    /* 1C8A8 801564A0 21B0A000 */  addu       $s6, $a1, $zero
    /* 1C8AC 801564A4 3800B4AF */  sw         $s4, 0x38($sp)
    /* 1C8B0 801564A8 21A0C000 */  addu       $s4, $a2, $zero
    /* 1C8B4 801564AC 3000B2AF */  sw         $s2, 0x30($sp)
    /* 1C8B8 801564B0 21900000 */  addu       $s2, $zero, $zero
    /* 1C8BC 801564B4 2800B0AF */  sw         $s0, 0x28($sp)
    /* 1C8C0 801564B8 21800000 */  addu       $s0, $zero, $zero
    /* 1C8C4 801564BC 4400BFAF */  sw         $ra, 0x44($sp)
    /* 1C8C8 801564C0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 1C8CC 801564C4 10004018 */  blez       $v0, .L80156508
    /* 1C8D0 801564C8 2C00B1AF */   sw        $s1, 0x2C($sp)
    /* 1C8D4 801564CC 21880000 */  addu       $s1, $zero, $zero
  .L801564D0:
    /* 1C8D8 801564D0 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 1C8DC 801564D4 21083100 */  addu       $at, $at, $s1
    /* 1C8E0 801564D8 CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 1C8E4 801564DC 27FD010C */  jal        IsSkel__Fi
    /* 1C8E8 801564E0 00000000 */   nop
    /* 1C8EC 801564E4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C8F0 801564E8 02004010 */  beqz       $v0, .L801564F4
    /* 1C8F4 801564EC 00000000 */   nop
    /* 1C8F8 801564F0 01005226 */  addiu      $s2, $s2, 0x1
  .L801564F4:
    /* 1C8FC 801564F4 1C1B828F */  lw         $v0, %gp_rel(nummtypes)($gp)
    /* 1C900 801564F8 01001026 */  addiu      $s0, $s0, 0x1
    /* 1C904 801564FC 2A100202 */  slt        $v0, $s0, $v0
    /* 1C908 80156500 F3FF4014 */  bnez       $v0, .L801564D0
    /* 1C90C 80156504 1C003126 */   addiu     $s1, $s1, 0x1C
  .L80156508:
    /* 1C910 80156508 29004012 */  beqz       $s2, .L801565B0
    /* 1C914 8015650C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 1C918 80156510 C9F6000C */  jal        ENG_random__Fl
    /* 1C91C 80156514 21204002 */   addu      $a0, $s2, $zero
    /* 1C920 80156518 21900000 */  addu       $s2, $zero, $zero
    /* 1C924 8015651C 21800000 */  addu       $s0, $zero, $zero
    /* 1C928 80156520 1C1B838F */  lw         $v1, %gp_rel(nummtypes)($gp)
    /* 1C92C 80156524 00000000 */  nop
    /* 1C930 80156528 13006018 */  blez       $v1, .L80156578
    /* 1C934 8015652C 21984000 */   addu      $s3, $v0, $zero
    /* 1C938 80156530 21880000 */  addu       $s1, $zero, $zero
  .L80156534:
    /* 1C93C 80156534 2A107202 */  slt        $v0, $s3, $s2
    /* 1C940 80156538 10004014 */  bnez       $v0, .L8015657C
    /* 1C944 8015653C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1C948 80156540 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 1C94C 80156544 21083100 */  addu       $at, $at, $s1
    /* 1C950 80156548 CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 1C954 8015654C 27FD010C */  jal        IsSkel__Fi
    /* 1C958 80156550 00000000 */   nop
    /* 1C95C 80156554 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1C960 80156558 02004010 */  beqz       $v0, .L80156564
    /* 1C964 8015655C 00000000 */   nop
    /* 1C968 80156560 01005226 */  addiu      $s2, $s2, 0x1
  .L80156564:
    /* 1C96C 80156564 1C1B828F */  lw         $v0, %gp_rel(nummtypes)($gp)
    /* 1C970 80156568 01001026 */  addiu      $s0, $s0, 0x1
    /* 1C974 8015656C 2A100202 */  slt        $v0, $s0, $v0
    /* 1C978 80156570 F0FF4014 */  bnez       $v0, .L80156534
    /* 1C97C 80156574 1C003126 */   addiu     $s1, $s1, 0x1C
  .L80156578:
    /* 1C980 80156578 01000224 */  addiu      $v0, $zero, 0x1
  .L8015657C:
    /* 1C984 8015657C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1C988 80156580 2120A002 */  addu       $a0, $s5, $zero
    /* 1C98C 80156584 2128C002 */  addu       $a1, $s6, $zero
    /* 1C990 80156588 21308002 */  addu       $a2, $s4, $zero
    /* 1C994 8015658C 74FF010C */  jal        AddMonster__FiiiiUc
    /* 1C998 80156590 FFFF0726 */   addiu     $a3, $s0, -0x1
    /* 1C99C 80156594 21804000 */  addu       $s0, $v0, $zero
    /* 1C9A0 80156598 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1C9A4 8015659C 03000212 */  beq        $s0, $v0, .L801565AC
    /* 1C9A8 801565A0 21200002 */   addu      $a0, $s0, $zero
    /* 1C9AC 801565A4 DD00020C */  jal        M_StartSpStand__Fii
    /* 1C9B0 801565A8 21288002 */   addu      $a1, $s4, $zero
  .L801565AC:
    /* 1C9B4 801565AC 21100002 */  addu       $v0, $s0, $zero
  .L801565B0:
    /* 1C9B8 801565B0 4400BF8F */  lw         $ra, 0x44($sp)
    /* 1C9BC 801565B4 4000B68F */  lw         $s6, 0x40($sp)
    /* 1C9C0 801565B8 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 1C9C4 801565BC 3800B48F */  lw         $s4, 0x38($sp)
    /* 1C9C8 801565C0 3400B38F */  lw         $s3, 0x34($sp)
    /* 1C9CC 801565C4 3000B28F */  lw         $s2, 0x30($sp)
    /* 1C9D0 801565C8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 1C9D4 801565CC 2800B08F */  lw         $s0, 0x28($sp)
    /* 1C9D8 801565D0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 1C9DC 801565D4 0800E003 */  jr         $ra
    /* 1C9E0 801565D8 00000000 */   nop
endlabel M_SpawnSkel__Fiii
