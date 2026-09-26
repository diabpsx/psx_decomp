.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddNova__Fiiiiiicii, 0x210

glabel AddNova__Fiiiiiicii
    /* 7AB8 801416B0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 7ABC 801416B4 2800B6AF */  sw         $s6, 0x28($sp)
    /* 7AC0 801416B8 21B08000 */  addu       $s6, $a0, $zero
    /* 7AC4 801416BC 80101600 */  sll        $v0, $s6, 2
    /* 7AC8 801416C0 21105600 */  addu       $v0, $v0, $s6
    /* 7ACC 801416C4 80100200 */  sll        $v0, $v0, 2
    /* 7AD0 801416C8 23105600 */  subu       $v0, $v0, $s6
    /* 7AD4 801416CC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 7AD8 801416D0 80A00200 */  sll        $s4, $v0, 2
    /* 7ADC 801416D4 4800A38F */  lw         $v1, 0x48($sp)
    /* 7AE0 801416D8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 7AE4 801416DC 3000BFAF */  sw         $ra, 0x30($sp)
    /* 7AE8 801416E0 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 7AEC 801416E4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 7AF0 801416E8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7AF4 801416EC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7AF8 801416F0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7AFC 801416F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7B00 801416F8 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 7B04 801416FC 21083400 */  addu       $at, $at, $s4
    /* 7B08 80141700 762C27A4 */  sh         $a3, %lo(missile + 0x1E)($at)
    /* 7B0C 80141704 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 7B10 80141708 21083400 */  addu       $at, $at, $s4
    /* 7B14 8014170C 782C23A4 */  sh         $v1, %lo(missile + 0x20)($at)
    /* 7B18 80141710 5400B58F */  lw         $s5, 0x54($sp)
    /* 7B1C 80141714 5000B793 */  lbu        $s7, 0x50($sp)
    /* 7B20 80141718 4000A212 */  beq        $s5, $v0, .L8014181C
    /* 7B24 8014171C 00000000 */   nop
    /* 7B28 80141720 C9F6000C */  jal        ENG_random__Fl
    /* 7B2C 80141724 06000424 */   addiu     $a0, $zero, 0x6
    /* 7B30 80141728 06000424 */  addiu      $a0, $zero, 0x6
    /* 7B34 8014172C C9F6000C */  jal        ENG_random__Fl
    /* 7B38 80141730 21804000 */   addu      $s0, $v0, $zero
    /* 7B3C 80141734 06000424 */  addiu      $a0, $zero, 0x6
    /* 7B40 80141738 C9F6000C */  jal        ENG_random__Fl
    /* 7B44 8014173C 21984000 */   addu      $s3, $v0, $zero
    /* 7B48 80141740 06000424 */  addiu      $a0, $zero, 0x6
    /* 7B4C 80141744 C9F6000C */  jal        ENG_random__Fl
    /* 7B50 80141748 21904000 */   addu      $s2, $v0, $zero
    /* 7B54 8014174C 06000424 */  addiu      $a0, $zero, 0x6
    /* 7B58 80141750 C9F6000C */  jal        ENG_random__Fl
    /* 7B5C 80141754 21884000 */   addu      $s1, $v0, $zero
    /* 7B60 80141758 21801302 */  addu       $s0, $s0, $s3
    /* 7B64 8014175C 21801202 */  addu       $s0, $s0, $s2
    /* 7B68 80141760 21801102 */  addu       $s0, $s0, $s1
    /* 7B6C 80141764 21800202 */  addu       $s0, $s0, $v0
    /* 7B70 80141768 40101500 */  sll        $v0, $s5, 1
    /* 7B74 8014176C 21105500 */  addu       $v0, $v0, $s5
    /* 7B78 80141770 80100200 */  sll        $v0, $v0, 2
    /* 7B7C 80141774 21105500 */  addu       $v0, $v0, $s5
    /* 7B80 80141778 00110200 */  sll        $v0, $v0, 4
    /* 7B84 8014177C 23105500 */  subu       $v0, $v0, $s5
    /* 7B88 80141780 80100200 */  sll        $v0, $v0, 2
    /* 7B8C 80141784 21105500 */  addu       $v0, $v0, $s5
    /* 7B90 80141788 C0100200 */  sll        $v0, $v0, 3
    /* 7B94 8014178C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7B98 80141790 21083400 */  addu       $at, $at, $s4
    /* 7B9C 80141794 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 7BA0 80141798 05001026 */  addiu      $s0, $s0, 0x5
    /* 7BA4 8014179C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 7BA8 801417A0 21082200 */  addu       $at, $at, $v0
    /* 7BAC 801417A4 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 7BB0 801417A8 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 7BB4 801417AC 21083400 */  addu       $at, $at, $s4
    /* 7BB8 801417B0 982C2580 */  lb         $a1, %lo(missile + 0x40)($at)
    /* 7BBC 801417B4 21800202 */  addu       $s0, $s0, $v0
    /* 7BC0 801417B8 43801000 */  sra        $s0, $s0, 1
    /* 7BC4 801417BC 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7BC8 801417C0 21083400 */  addu       $at, $at, $s4
    /* 7BCC 801417C4 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 7BD0 801417C8 0D00A018 */  blez       $a1, .L80141800
    /* 7BD4 801417CC 00000000 */   nop
    /* 7BD8 801417D0 21208002 */  addu       $a0, $s4, $zero
  .L801417D4:
    /* 7BDC 801417D4 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7BE0 801417D8 21082400 */  addu       $at, $at, $a0
    /* 7BE4 801417DC 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 7BE8 801417E0 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 7BEC 801417E4 C3100300 */  sra        $v0, $v1, 3
    /* 7BF0 801417E8 21186200 */  addu       $v1, $v1, $v0
    /* 7BF4 801417EC 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7BF8 801417F0 21082400 */  addu       $at, $at, $a0
    /* 7BFC 801417F4 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 7C00 801417F8 F6FFA01C */  bgtz       $a1, .L801417D4
    /* 7C04 801417FC 00000000 */   nop
  .L80141800:
    /* 7C08 80141800 1B00E016 */  bnez       $s7, .L80141870
    /* 7C0C 80141804 80101600 */   sll       $v0, $s6, 2
    /* 7C10 80141808 2120A002 */  addu       $a0, $s5, $zero
    /* 7C14 8014180C C2DC010C */  jal        UseMana__Fii
    /* 7C18 80141810 12000524 */   addiu     $a1, $zero, 0x12
    /* 7C1C 80141814 1C060508 */  j          .L80141870
    /* 7C20 80141818 80101600 */   sll       $v0, $s6, 2
  .L8014181C:
    /* 7C24 8014181C C9F6000C */  jal        ENG_random__Fl
    /* 7C28 80141820 03000424 */   addiu     $a0, $zero, 0x3
    /* 7C2C 80141824 03000424 */  addiu      $a0, $zero, 0x3
    /* 7C30 80141828 C9F6000C */  jal        ENG_random__Fl
    /* 7C34 8014182C 21804000 */   addu      $s0, $v0, $zero
    /* 7C38 80141830 03000424 */  addiu      $a0, $zero, 0x3
    /* 7C3C 80141834 C9F6000C */  jal        ENG_random__Fl
    /* 7C40 80141838 21884000 */   addu      $s1, $v0, $zero
    /* 7C44 8014183C 21801102 */  addu       $s0, $s0, $s1
    /* 7C48 80141840 1280033C */  lui        $v1, %hi(currlevel)
    /* 7C4C 80141844 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 7C50 80141848 21800202 */  addu       $s0, $s0, $v0
    /* 7C54 8014184C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7C58 80141850 21083400 */  addu       $at, $at, $s4
    /* 7C5C 80141854 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 7C60 80141858 42180300 */  srl        $v1, $v1, 1
    /* 7C64 8014185C 21800302 */  addu       $s0, $s0, $v1
    /* 7C68 80141860 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7C6C 80141864 21083400 */  addu       $at, $at, $s4
    /* 7C70 80141868 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 7C74 8014186C 80101600 */  sll        $v0, $s6, 2
  .L80141870:
    /* 7C78 80141870 21105600 */  addu       $v0, $v0, $s6
    /* 7C7C 80141874 80100200 */  sll        $v0, $v0, 2
    /* 7C80 80141878 23105600 */  subu       $v0, $v0, $s6
    /* 7C84 8014187C 80100200 */  sll        $v0, $v0, 2
    /* 7C88 80141880 01000324 */  addiu      $v1, $zero, 0x1
    /* 7C8C 80141884 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 7C90 80141888 21082200 */  addu       $at, $at, $v0
    /* 7C94 8014188C 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 7C98 80141890 3000BF8F */  lw         $ra, 0x30($sp)
    /* 7C9C 80141894 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 7CA0 80141898 2800B68F */  lw         $s6, 0x28($sp)
    /* 7CA4 8014189C 2400B58F */  lw         $s5, 0x24($sp)
    /* 7CA8 801418A0 2000B48F */  lw         $s4, 0x20($sp)
    /* 7CAC 801418A4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7CB0 801418A8 1800B28F */  lw         $s2, 0x18($sp)
    /* 7CB4 801418AC 1400B18F */  lw         $s1, 0x14($sp)
    /* 7CB8 801418B0 1000B08F */  lw         $s0, 0x10($sp)
    /* 7CBC 801418B4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 7CC0 801418B8 0800E003 */  jr         $ra
    /* 7CC4 801418BC 00000000 */   nop
endlabel AddNova__Fiiiiiicii
