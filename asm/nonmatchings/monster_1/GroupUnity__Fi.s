.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GroupUnity__Fi, 0x414

glabel GroupUnity__Fi
    /* 15744 8014F33C B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 15748 8014F340 3000B4AF */  sw         $s4, 0x30($sp)
    /* 1574C 8014F344 21A08000 */  addu       $s4, $a0, $zero
    /* 15750 8014F348 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 15754 8014F34C 1080173C */  lui        $s7, %hi(monster)
    /* 15758 8014F350 9453F726 */  addiu      $s7, $s7, %lo(monster)
    /* 1575C 8014F354 40101400 */  sll        $v0, $s4, 1
    /* 15760 8014F358 21105400 */  addu       $v0, $v0, $s4
    /* 15764 8014F35C 80100200 */  sll        $v0, $v0, 2
    /* 15768 8014F360 21105400 */  addu       $v0, $v0, $s4
    /* 1576C 8014F364 2400B1AF */  sw         $s1, 0x24($sp)
    /* 15770 8014F368 C0880200 */  sll        $s1, $v0, 3
    /* 15774 8014F36C 21103702 */  addu       $v0, $s1, $s7
    /* 15778 8014F370 3800B6AF */  sw         $s6, 0x38($sp)
    /* 1577C 8014F374 34005680 */  lb         $s6, 0x34($v0)
    /* 15780 8014F378 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 15784 8014F37C 4000BFAF */  sw         $ra, 0x40($sp)
    /* 15788 8014F380 3400B5AF */  sw         $s5, 0x34($sp)
    /* 1578C 8014F384 2800B2AF */  sw         $s2, 0x28($sp)
    /* 15790 8014F388 2000B0AF */  sw         $s0, 0x20($sp)
    /* 15794 8014F38C 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 15798 8014F390 21083100 */  addu       $at, $at, $s1
    /* 1579C 8014F394 EB532390 */  lbu        $v1, %lo(monster + 0x57)($at)
    /* 157A0 8014F398 35005580 */  lb         $s5, 0x35($v0)
    /* 157A4 8014F39C 47006010 */  beqz       $v1, .L8014F4BC
    /* 157A8 8014F3A0 21980000 */   addu      $s3, $zero, $zero
    /* 157AC 8014F3A4 1580043C */  lui        $a0, %hi(CheckNoSolid__Fii)
    /* 157B0 8014F3A8 D0518424 */  addiu      $a0, $a0, %lo(CheckNoSolid__Fii)
    /* 157B4 8014F3AC 1080013C */  lui        $at, %hi(monster + 0x56)
    /* 157B8 8014F3B0 21083100 */  addu       $at, $at, $s1
    /* 157BC 8014F3B4 EA533390 */  lbu        $s3, %lo(monster + 0x56)($at)
    /* 157C0 8014F3B8 2128C002 */  addu       $a1, $s6, $zero
    /* 157C4 8014F3BC 40101300 */  sll        $v0, $s3, 1
    /* 157C8 8014F3C0 21105300 */  addu       $v0, $v0, $s3
    /* 157CC 8014F3C4 80100200 */  sll        $v0, $v0, 2
    /* 157D0 8014F3C8 21105300 */  addu       $v0, $v0, $s3
    /* 157D4 8014F3CC C0800200 */  sll        $s0, $v0, 3
    /* 157D8 8014F3D0 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 157DC 8014F3D4 21083000 */  addu       $at, $at, $s0
    /* 157E0 8014F3D8 CA532780 */  lb         $a3, %lo(monster + 0x36)($at)
    /* 157E4 8014F3DC 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 157E8 8014F3E0 21083000 */  addu       $at, $at, $s0
    /* 157EC 8014F3E4 CB532280 */  lb         $v0, %lo(monster + 0x37)($at)
    /* 157F0 8014F3E8 2130A002 */  addu       $a2, $s5, $zero
    /* 157F4 8014F3EC 7C54050C */  jal        LineClearF__FPFii_Uciiii
    /* 157F8 8014F3F0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 157FC 8014F3F4 FF004330 */  andi       $v1, $v0, 0xFF
    /* 15800 8014F3F8 0F006014 */  bnez       $v1, .L8014F438
    /* 15804 8014F3FC 02000224 */   addiu     $v0, $zero, 0x2
    /* 15808 8014F400 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 1580C 8014F404 21083100 */  addu       $at, $at, $s1
    /* 15810 8014F408 EB532390 */  lbu        $v1, %lo(monster + 0x57)($at)
    /* 15814 8014F40C 01000224 */  addiu      $v0, $zero, 0x1
    /* 15818 8014F410 2A006214 */  bne        $v1, $v0, .L8014F4BC
    /* 1581C 8014F414 21181702 */   addu      $v1, $s0, $s7
    /* 15820 8014F418 1080013C */  lui        $at, %hi(monster + 0x58)
    /* 15824 8014F41C 21083000 */  addu       $at, $at, $s0
    /* 15828 8014F420 EC532290 */  lbu        $v0, %lo(monster + 0x58)($at)
    /* 1582C 8014F424 00000000 */  nop
    /* 15830 8014F428 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 15834 8014F42C 580062A0 */  sb         $v0, 0x58($v1)
    /* 15838 8014F430 2C3D0508 */  j          .L8014F4B0
    /* 1583C 8014F434 02000224 */   addiu     $v0, $zero, 0x2
  .L8014F438:
    /* 15840 8014F438 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 15844 8014F43C 21083100 */  addu       $at, $at, $s1
    /* 15848 8014F440 EB532390 */  lbu        $v1, %lo(monster + 0x57)($at)
    /* 1584C 8014F444 00000000 */  nop
    /* 15850 8014F448 1D006214 */  bne        $v1, $v0, .L8014F4C0
    /* 15854 8014F44C 40101400 */   sll       $v0, $s4, 1
    /* 15858 8014F450 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1585C 8014F454 21083000 */  addu       $at, $at, $s0
    /* 15860 8014F458 CA532480 */  lb         $a0, %lo(monster + 0x36)($at)
    /* 15864 8014F45C 21900000 */  addu       $s2, $zero, $zero
    /* 15868 8014F460 6D41000C */  jal        abs
    /* 1586C 8014F464 2320C402 */   subu      $a0, $s6, $a0
    /* 15870 8014F468 04004228 */  slti       $v0, $v0, 0x4
    /* 15874 8014F46C 07004010 */  beqz       $v0, .L8014F48C
    /* 15878 8014F470 00000000 */   nop
    /* 1587C 8014F474 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 15880 8014F478 21083000 */  addu       $at, $at, $s0
    /* 15884 8014F47C CB532480 */  lb         $a0, %lo(monster + 0x37)($at)
    /* 15888 8014F480 6D41000C */  jal        abs
    /* 1588C 8014F484 2320A402 */   subu      $a0, $s5, $a0
    /* 15890 8014F488 04005228 */  slti       $s2, $v0, 0x4
  .L8014F48C:
    /* 15894 8014F48C 0B004012 */  beqz       $s2, .L8014F4BC
    /* 15898 8014F490 21181702 */   addu      $v1, $s0, $s7
    /* 1589C 8014F494 1080013C */  lui        $at, %hi(monster + 0x58)
    /* 158A0 8014F498 21083000 */  addu       $at, $at, $s0
    /* 158A4 8014F49C EC532290 */  lbu        $v0, %lo(monster + 0x58)($at)
    /* 158A8 8014F4A0 00000000 */  nop
    /* 158AC 8014F4A4 01004224 */  addiu      $v0, $v0, 0x1
    /* 158B0 8014F4A8 580062A0 */  sb         $v0, 0x58($v1)
    /* 158B4 8014F4AC 01000224 */  addiu      $v0, $zero, 0x1
  .L8014F4B0:
    /* 158B8 8014F4B0 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 158BC 8014F4B4 21083100 */  addu       $at, $at, $s1
    /* 158C0 8014F4B8 EB5322A0 */  sb         $v0, %lo(monster + 0x57)($at)
  .L8014F4BC:
    /* 158C4 8014F4BC 40101400 */  sll        $v0, $s4, 1
  .L8014F4C0:
    /* 158C8 8014F4C0 21105400 */  addu       $v0, $v0, $s4
    /* 158CC 8014F4C4 80100200 */  sll        $v0, $v0, 2
    /* 158D0 8014F4C8 21105400 */  addu       $v0, $v0, $s4
    /* 158D4 8014F4CC C0300200 */  sll        $a2, $v0, 3
    /* 158D8 8014F4D0 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 158DC 8014F4D4 21082600 */  addu       $at, $at, $a2
    /* 158E0 8014F4D8 EB532390 */  lbu        $v1, %lo(monster + 0x57)($at)
    /* 158E4 8014F4DC 01000224 */  addiu      $v0, $zero, 0x1
    /* 158E8 8014F4E0 33006214 */  bne        $v1, $v0, .L8014F5B0
    /* 158EC 8014F4E4 40101300 */   sll       $v0, $s3, 1
    /* 158F0 8014F4E8 21105300 */  addu       $v0, $v0, $s3
    /* 158F4 8014F4EC 80100200 */  sll        $v0, $v0, 2
    /* 158F8 8014F4F0 21105300 */  addu       $v0, $v0, $s3
    /* 158FC 8014F4F4 C0200200 */  sll        $a0, $v0, 3
    /* 15900 8014F4F8 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15904 8014F4FC 21082600 */  addu       $at, $at, $a2
    /* 15908 8014F500 E2532390 */  lbu        $v1, %lo(monster + 0x4E)($at)
    /* 1590C 8014F504 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15910 8014F508 21082400 */  addu       $at, $at, $a0
    /* 15914 8014F50C E2532290 */  lbu        $v0, %lo(monster + 0x4E)($at)
    /* 15918 8014F510 00000000 */  nop
    /* 1591C 8014F514 2B104300 */  sltu       $v0, $v0, $v1
    /* 15920 8014F518 0F004010 */  beqz       $v0, .L8014F558
    /* 15924 8014F51C 00000000 */   nop
    /* 15928 8014F520 1080013C */  lui        $at, %hi(monster + 0x43)
    /* 1592C 8014F524 21082400 */  addu       $at, $at, $a0
    /* 15930 8014F528 D75336A0 */  sb         $s6, %lo(monster + 0x43)($at)
    /* 15934 8014F52C 1080013C */  lui        $at, %hi(monster + 0x44)
    /* 15938 8014F530 21082400 */  addu       $at, $at, $a0
    /* 1593C 8014F534 D85335A0 */  sb         $s5, %lo(monster + 0x44)($at)
    /* 15940 8014F538 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15944 8014F53C 21082600 */  addu       $at, $at, $a2
    /* 15948 8014F540 E2532290 */  lbu        $v0, %lo(monster + 0x4E)($at)
    /* 1594C 8014F544 00000000 */  nop
    /* 15950 8014F548 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 15954 8014F54C 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15958 8014F550 21082400 */  addu       $at, $at, $a0
    /* 1595C 8014F554 E25322A0 */  sb         $v0, %lo(monster + 0x4E)($at)
  .L8014F558:
    /* 15960 8014F558 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 15964 8014F55C 21082400 */  addu       $at, $at, $a0
    /* 15968 8014F560 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 1596C 8014F564 0C000224 */  addiu      $v0, $zero, 0xC
    /* 15970 8014F568 6D006214 */  bne        $v1, $v0, .L8014F720
    /* 15974 8014F56C 00000000 */   nop
    /* 15978 8014F570 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1597C 8014F574 21082400 */  addu       $at, $at, $a0
    /* 15980 8014F578 C0532394 */  lhu        $v1, %lo(monster + 0x2C)($at)
    /* 15984 8014F57C 00000000 */  nop
    /* 15988 8014F580 04006230 */  andi       $v0, $v1, 0x4
    /* 1598C 8014F584 66004010 */  beqz       $v0, .L8014F720
    /* 15990 8014F588 FBFF6230 */   andi      $v0, $v1, 0xFFFB
    /* 15994 8014F58C 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 15998 8014F590 21082400 */  addu       $at, $at, $a0
    /* 1599C 8014F594 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 159A0 8014F598 07000224 */  addiu      $v0, $zero, 0x7
    /* 159A4 8014F59C 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 159A8 8014F5A0 21082400 */  addu       $at, $at, $a0
    /* 159AC 8014F5A4 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 159B0 8014F5A8 C83D0508 */  j          .L8014F720
    /* 159B4 8014F5AC 00000000 */   nop
  .L8014F5B0:
    /* 159B8 8014F5B0 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 159BC 8014F5B4 21082600 */  addu       $at, $at, $a2
    /* 159C0 8014F5B8 E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 159C4 8014F5BC 00000000 */  nop
    /* 159C8 8014F5C0 57004010 */  beqz       $v0, .L8014F720
    /* 159CC 8014F5C4 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 159D0 8014F5C8 40180200 */  sll        $v1, $v0, 1
    /* 159D4 8014F5CC 21186200 */  addu       $v1, $v1, $v0
    /* 159D8 8014F5D0 C0180300 */  sll        $v1, $v1, 3
    /* 159DC 8014F5D4 1180013C */  lui        $at, %hi(UniqMonst + 0xE)
    /* 159E0 8014F5D8 21082300 */  addu       $at, $at, $v1
    /* 159E4 8014F5DC 16C72294 */  lhu        $v0, %lo(UniqMonst + 0xE)($at)
    /* 159E8 8014F5E0 00000000 */  nop
    /* 159EC 8014F5E4 02004230 */  andi       $v0, $v0, 0x2
    /* 159F0 8014F5E8 4D004010 */  beqz       $v0, .L8014F720
    /* 159F4 8014F5EC 00000000 */   nop
    /* 159F8 8014F5F0 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 159FC 8014F5F4 00000000 */  nop
    /* 15A00 8014F5F8 49004018 */  blez       $v0, .L8014F720
    /* 15A04 8014F5FC 21280000 */   addu      $a1, $zero, $zero
    /* 15A08 8014F600 01000824 */  addiu      $t0, $zero, 0x1
    /* 15A0C 8014F604 2138C000 */  addu       $a3, $a2, $zero
    /* 15A10 8014F608 1180063C */  lui        $a2, %hi(monstactive)
    /* 15A14 8014F60C C4A0C624 */  addiu      $a2, $a2, %lo(monstactive)
  .L8014F610:
    /* 15A18 8014F610 0000C384 */  lh         $v1, 0x0($a2)
    /* 15A1C 8014F614 00000000 */  nop
    /* 15A20 8014F618 40100300 */  sll        $v0, $v1, 1
    /* 15A24 8014F61C 21104300 */  addu       $v0, $v0, $v1
    /* 15A28 8014F620 80100200 */  sll        $v0, $v0, 2
    /* 15A2C 8014F624 21104300 */  addu       $v0, $v0, $v1
    /* 15A30 8014F628 C0200200 */  sll        $a0, $v0, 3
    /* 15A34 8014F62C 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 15A38 8014F630 21082400 */  addu       $at, $at, $a0
    /* 15A3C 8014F634 EB532290 */  lbu        $v0, %lo(monster + 0x57)($at)
    /* 15A40 8014F638 00000000 */  nop
    /* 15A44 8014F63C 33004814 */  bne        $v0, $t0, .L8014F70C
    /* 15A48 8014F640 00000000 */   nop
    /* 15A4C 8014F644 1080013C */  lui        $at, %hi(monster + 0x56)
    /* 15A50 8014F648 21082400 */  addu       $at, $at, $a0
    /* 15A54 8014F64C EA532290 */  lbu        $v0, %lo(monster + 0x56)($at)
    /* 15A58 8014F650 00000000 */  nop
    /* 15A5C 8014F654 2D005414 */  bne        $v0, $s4, .L8014F70C
    /* 15A60 8014F658 00000000 */   nop
    /* 15A64 8014F65C 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15A68 8014F660 21082700 */  addu       $at, $at, $a3
    /* 15A6C 8014F664 E2532390 */  lbu        $v1, %lo(monster + 0x4E)($at)
    /* 15A70 8014F668 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15A74 8014F66C 21082400 */  addu       $at, $at, $a0
    /* 15A78 8014F670 E2532290 */  lbu        $v0, %lo(monster + 0x4E)($at)
    /* 15A7C 8014F674 00000000 */  nop
    /* 15A80 8014F678 2B104300 */  sltu       $v0, $v0, $v1
    /* 15A84 8014F67C 0F004010 */  beqz       $v0, .L8014F6BC
    /* 15A88 8014F680 00000000 */   nop
    /* 15A8C 8014F684 1080013C */  lui        $at, %hi(monster + 0x43)
    /* 15A90 8014F688 21082400 */  addu       $at, $at, $a0
    /* 15A94 8014F68C D75336A0 */  sb         $s6, %lo(monster + 0x43)($at)
    /* 15A98 8014F690 1080013C */  lui        $at, %hi(monster + 0x44)
    /* 15A9C 8014F694 21082400 */  addu       $at, $at, $a0
    /* 15AA0 8014F698 D85335A0 */  sb         $s5, %lo(monster + 0x44)($at)
    /* 15AA4 8014F69C 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15AA8 8014F6A0 21082700 */  addu       $at, $at, $a3
    /* 15AAC 8014F6A4 E2532290 */  lbu        $v0, %lo(monster + 0x4E)($at)
    /* 15AB0 8014F6A8 00000000 */  nop
    /* 15AB4 8014F6AC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 15AB8 8014F6B0 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 15ABC 8014F6B4 21082400 */  addu       $at, $at, $a0
    /* 15AC0 8014F6B8 E25322A0 */  sb         $v0, %lo(monster + 0x4E)($at)
  .L8014F6BC:
    /* 15AC4 8014F6BC 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 15AC8 8014F6C0 21082400 */  addu       $at, $at, $a0
    /* 15ACC 8014F6C4 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 15AD0 8014F6C8 0C000224 */  addiu      $v0, $zero, 0xC
    /* 15AD4 8014F6CC 0F006214 */  bne        $v1, $v0, .L8014F70C
    /* 15AD8 8014F6D0 00000000 */   nop
    /* 15ADC 8014F6D4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 15AE0 8014F6D8 21082400 */  addu       $at, $at, $a0
    /* 15AE4 8014F6DC C0532394 */  lhu        $v1, %lo(monster + 0x2C)($at)
    /* 15AE8 8014F6E0 00000000 */  nop
    /* 15AEC 8014F6E4 04006230 */  andi       $v0, $v1, 0x4
    /* 15AF0 8014F6E8 08004010 */  beqz       $v0, .L8014F70C
    /* 15AF4 8014F6EC FBFF6230 */   andi      $v0, $v1, 0xFFFB
    /* 15AF8 8014F6F0 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 15AFC 8014F6F4 21082400 */  addu       $at, $at, $a0
    /* 15B00 8014F6F8 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 15B04 8014F6FC 07000224 */  addiu      $v0, $zero, 0x7
    /* 15B08 8014F700 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 15B0C 8014F704 21082400 */  addu       $at, $at, $a0
    /* 15B10 8014F708 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
  .L8014F70C:
    /* 15B14 8014F70C 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 15B18 8014F710 0100A524 */  addiu      $a1, $a1, 0x1
    /* 15B1C 8014F714 2A10A200 */  slt        $v0, $a1, $v0
    /* 15B20 8014F718 BDFF4014 */  bnez       $v0, .L8014F610
    /* 15B24 8014F71C 0200C624 */   addiu     $a2, $a2, 0x2
  .L8014F720:
    /* 15B28 8014F720 4000BF8F */  lw         $ra, 0x40($sp)
    /* 15B2C 8014F724 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 15B30 8014F728 3800B68F */  lw         $s6, 0x38($sp)
    /* 15B34 8014F72C 3400B58F */  lw         $s5, 0x34($sp)
    /* 15B38 8014F730 3000B48F */  lw         $s4, 0x30($sp)
    /* 15B3C 8014F734 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 15B40 8014F738 2800B28F */  lw         $s2, 0x28($sp)
    /* 15B44 8014F73C 2400B18F */  lw         $s1, 0x24($sp)
    /* 15B48 8014F740 2000B08F */  lw         $s0, 0x20($sp)
    /* 15B4C 8014F744 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 15B50 8014F748 0800E003 */  jr         $ra
    /* 15B54 8014F74C 00000000 */   nop
endlabel GroupUnity__Fi
