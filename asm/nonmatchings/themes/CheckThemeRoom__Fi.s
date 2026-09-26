.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckThemeRoom__Fi, 0x2C4

glabel CheckThemeRoom__Fi
    /* 22AC4 8015C6BC 1280023C */  lui        $v0, %hi(numtrigs)
    /* 22AC8 8015C6C0 78BB428C */  lw         $v0, %lo(numtrigs)($v0)
    /* 22ACC 8015C6C4 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 22AD0 8015C6C8 3000B2AF */  sw         $s2, 0x30($sp)
    /* 22AD4 8015C6CC 21908000 */  addu       $s2, $a0, $zero
    /* 22AD8 8015C6D0 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 22ADC 8015C6D4 4800BEAF */  sw         $fp, 0x48($sp)
    /* 22AE0 8015C6D8 4400B7AF */  sw         $s7, 0x44($sp)
    /* 22AE4 8015C6DC 4000B6AF */  sw         $s6, 0x40($sp)
    /* 22AE8 8015C6E0 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 22AEC 8015C6E4 3800B4AF */  sw         $s4, 0x38($sp)
    /* 22AF0 8015C6E8 3400B3AF */  sw         $s3, 0x34($sp)
    /* 22AF4 8015C6EC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 22AF8 8015C6F0 17004018 */  blez       $v0, .L8015C750
    /* 22AFC 8015C6F4 2800B0AF */   sw        $s0, 0x28($sp)
    /* 22B00 8015C6F8 21280000 */  addu       $a1, $zero, $zero
    /* 22B04 8015C6FC 00310200 */  sll        $a2, $v0, 4
  .L8015C700:
    /* 22B08 8015C700 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 22B0C 8015C704 21082500 */  addu       $at, $at, $a1
    /* 22B10 8015C708 D033238C */  lw         $v1, %lo(trigs + 0x4)($at)
    /* 22B14 8015C70C 0E80013C */  lui        $at, %hi(trigs)
    /* 22B18 8015C710 21082500 */  addu       $at, $at, $a1
    /* 22B1C 8015C714 CC33248C */  lw         $a0, %lo(trigs)($at)
    /* 22B20 8015C718 C0180300 */  sll        $v1, $v1, 3
    /* 22B24 8015C71C C0100400 */  sll        $v0, $a0, 3
    /* 22B28 8015C720 23104400 */  subu       $v0, $v0, $a0
    /* 22B2C 8015C724 C0110200 */  sll        $v0, $v0, 7
    /* 22B30 8015C728 21186200 */  addu       $v1, $v1, $v0
    /* 22B34 8015C72C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22B38 8015C730 21082300 */  addu       $at, $at, $v1
    /* 22B3C 8015C734 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 22B40 8015C738 00000000 */  nop
    /* 22B44 8015C73C 25005210 */  beq        $v0, $s2, .L8015C7D4
    /* 22B48 8015C740 1000A524 */   addiu     $a1, $a1, 0x10
    /* 22B4C 8015C744 2A10A600 */  slt        $v0, $a1, $a2
    /* 22B50 8015C748 EDFF4014 */  bnez       $v0, .L8015C700
    /* 22B54 8015C74C 00000000 */   nop
  .L8015C750:
    /* 22B58 8015C750 21200000 */  addu       $a0, $zero, $zero
    /* 22B5C 8015C754 21880000 */  addu       $s1, $zero, $zero
  .L8015C758:
    /* 22B60 8015C758 21800000 */  addu       $s0, $zero, $zero
    /* 22B64 8015C75C C0181100 */  sll        $v1, $s1, 3
  .L8015C760:
    /* 22B68 8015C760 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22B6C 8015C764 21082300 */  addu       $at, $at, $v1
    /* 22B70 8015C768 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 22B74 8015C76C 00000000 */  nop
    /* 22B78 8015C770 08005214 */  bne        $v0, $s2, .L8015C794
    /* 22B7C 8015C774 00000000 */   nop
    /* 22B80 8015C778 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 22B84 8015C77C 21082300 */  addu       $at, $at, $v1
    /* 22B88 8015C780 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 22B8C 8015C784 00000000 */  nop
    /* 22B90 8015C788 08004230 */  andi       $v0, $v0, 0x8
    /* 22B94 8015C78C 11004014 */  bnez       $v0, .L8015C7D4
    /* 22B98 8015C790 01008424 */   addiu     $a0, $a0, 0x1
  .L8015C794:
    /* 22B9C 8015C794 01001026 */  addiu      $s0, $s0, 0x1
    /* 22BA0 8015C798 6000022A */  slti       $v0, $s0, 0x60
    /* 22BA4 8015C79C F0FF4014 */  bnez       $v0, .L8015C760
    /* 22BA8 8015C7A0 80036324 */   addiu     $v1, $v1, 0x380
    /* 22BAC 8015C7A4 01003126 */  addiu      $s1, $s1, 0x1
    /* 22BB0 8015C7A8 6000222A */  slti       $v0, $s1, 0x60
    /* 22BB4 8015C7AC EAFF4014 */  bnez       $v0, .L8015C758
    /* 22BB8 8015C7B0 01000224 */   addiu     $v0, $zero, 0x1
    /* 22BBC 8015C7B4 1280033C */  lui        $v1, %hi(leveltype)
    /* 22BC0 8015C7B8 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 22BC4 8015C7BC 00000000 */  nop
    /* 22BC8 8015C7C0 06006214 */  bne        $v1, $v0, .L8015C7DC
    /* 22BCC 8015C7C4 F7FF8224 */   addiu     $v0, $a0, -0x9
    /* 22BD0 8015C7C8 5C00422C */  sltiu      $v0, $v0, 0x5C
    /* 22BD4 8015C7CC 04004014 */  bnez       $v0, .L8015C7E0
    /* 22BD8 8015C7D0 21880000 */   addu      $s1, $zero, $zero
  .L8015C7D4:
    /* 22BDC 8015C7D4 53720508 */  j          .L8015C94C
    /* 22BE0 8015C7D8 21100000 */   addu      $v0, $zero, $zero
  .L8015C7DC:
    /* 22BE4 8015C7DC 21880000 */  addu       $s1, $zero, $zero
  .L8015C7E0:
    /* 22BE8 8015C7E0 F8FF0724 */  addiu      $a3, $zero, -0x8
    /* 22BEC 8015C7E4 2000A7AF */  sw         $a3, 0x20($sp)
  .L8015C7E8:
    /* 22BF0 8015C7E8 21800000 */  addu       $s0, $zero, $zero
    /* 22BF4 8015C7EC FFFF2726 */  addiu      $a3, $s1, -0x1
    /* 22BF8 8015C7F0 1000A7AF */  sw         $a3, 0x10($sp)
    /* 22BFC 8015C7F4 01002726 */  addiu      $a3, $s1, 0x1
    /* 22C00 8015C7F8 21B80000 */  addu       $s7, $zero, $zero
    /* 22C04 8015C7FC 80031524 */  addiu      $s5, $zero, 0x380
    /* 22C08 8015C800 80FC1424 */  addiu      $s4, $zero, -0x380
    /* 22C0C 8015C804 C0F01100 */  sll        $fp, $s1, 3
    /* 22C10 8015C808 2000B68F */  lw         $s6, 0x20($sp)
    /* 22C14 8015C80C 2198C003 */  addu       $s3, $fp, $zero
    /* 22C18 8015C810 1800A7AF */  sw         $a3, 0x18($sp)
  .L8015C814:
    /* 22C1C 8015C814 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22C20 8015C818 21083300 */  addu       $at, $at, $s3
    /* 22C24 8015C81C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 22C28 8015C820 00000000 */  nop
    /* 22C2C 8015C824 3A005214 */  bne        $v0, $s2, .L8015C910
    /* 22C30 8015C828 00000000 */   nop
    /* 22C34 8015C82C 21200002 */  addu       $a0, $s0, $zero
    /* 22C38 8015C830 380B020C */  jal        GetSOLID__Fii
    /* 22C3C 8015C834 21282002 */   addu      $a1, $s1, $zero
    /* 22C40 8015C838 01004238 */  xori       $v0, $v0, 0x1
    /* 22C44 8015C83C 34004010 */  beqz       $v0, .L8015C910
    /* 22C48 8015C840 2110D403 */   addu      $v0, $fp, $s4
    /* 22C4C 8015C844 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22C50 8015C848 21082200 */  addu       $at, $at, $v0
    /* 22C54 8015C84C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 22C58 8015C850 00000000 */  nop
    /* 22C5C 8015C854 06005210 */  beq        $v0, $s2, .L8015C870
    /* 22C60 8015C858 FFFF0426 */   addiu     $a0, $s0, -0x1
    /* 22C64 8015C85C 380B020C */  jal        GetSOLID__Fii
    /* 22C68 8015C860 21282002 */   addu      $a1, $s1, $zero
    /* 22C6C 8015C864 01004238 */  xori       $v0, $v0, 0x1
    /* 22C70 8015C868 38004014 */  bnez       $v0, .L8015C94C
    /* 22C74 8015C86C 21100000 */   addu      $v0, $zero, $zero
  .L8015C870:
    /* 22C78 8015C870 2110D503 */  addu       $v0, $fp, $s5
    /* 22C7C 8015C874 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22C80 8015C878 21082200 */  addu       $at, $at, $v0
    /* 22C84 8015C87C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 22C88 8015C880 00000000 */  nop
    /* 22C8C 8015C884 06005210 */  beq        $v0, $s2, .L8015C8A0
    /* 22C90 8015C888 01000426 */   addiu     $a0, $s0, 0x1
    /* 22C94 8015C88C 380B020C */  jal        GetSOLID__Fii
    /* 22C98 8015C890 21282002 */   addu      $a1, $s1, $zero
    /* 22C9C 8015C894 01004238 */  xori       $v0, $v0, 0x1
    /* 22CA0 8015C898 2C004014 */  bnez       $v0, .L8015C94C
    /* 22CA4 8015C89C 21100000 */   addu      $v0, $zero, $zero
  .L8015C8A0:
    /* 22CA8 8015C8A0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22CAC 8015C8A4 21083600 */  addu       $at, $at, $s6
    /* 22CB0 8015C8A8 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 22CB4 8015C8AC 00000000 */  nop
    /* 22CB8 8015C8B0 07005210 */  beq        $v0, $s2, .L8015C8D0
    /* 22CBC 8015C8B4 00000000 */   nop
    /* 22CC0 8015C8B8 1000A58F */  lw         $a1, 0x10($sp)
    /* 22CC4 8015C8BC 380B020C */  jal        GetSOLID__Fii
    /* 22CC8 8015C8C0 21200002 */   addu      $a0, $s0, $zero
    /* 22CCC 8015C8C4 01004238 */  xori       $v0, $v0, 0x1
    /* 22CD0 8015C8C8 20004014 */  bnez       $v0, .L8015C94C
    /* 22CD4 8015C8CC 21100000 */   addu      $v0, $zero, $zero
  .L8015C8D0:
    /* 22CD8 8015C8D0 1800A78F */  lw         $a3, 0x18($sp)
    /* 22CDC 8015C8D4 00000000 */  nop
    /* 22CE0 8015C8D8 C0100700 */  sll        $v0, $a3, 3
    /* 22CE4 8015C8DC 21105700 */  addu       $v0, $v0, $s7
    /* 22CE8 8015C8E0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22CEC 8015C8E4 21082200 */  addu       $at, $at, $v0
    /* 22CF0 8015C8E8 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 22CF4 8015C8EC 00000000 */  nop
    /* 22CF8 8015C8F0 07005210 */  beq        $v0, $s2, .L8015C910
    /* 22CFC 8015C8F4 00000000 */   nop
    /* 22D00 8015C8F8 1800A58F */  lw         $a1, 0x18($sp)
    /* 22D04 8015C8FC 380B020C */  jal        GetSOLID__Fii
    /* 22D08 8015C900 21200002 */   addu      $a0, $s0, $zero
    /* 22D0C 8015C904 01004238 */  xori       $v0, $v0, 0x1
    /* 22D10 8015C908 10004014 */  bnez       $v0, .L8015C94C
    /* 22D14 8015C90C 21100000 */   addu      $v0, $zero, $zero
  .L8015C910:
    /* 22D18 8015C910 8003F726 */  addiu      $s7, $s7, 0x380
    /* 22D1C 8015C914 8003D626 */  addiu      $s6, $s6, 0x380
    /* 22D20 8015C918 8003B526 */  addiu      $s5, $s5, 0x380
    /* 22D24 8015C91C 80039426 */  addiu      $s4, $s4, 0x380
    /* 22D28 8015C920 01001026 */  addiu      $s0, $s0, 0x1
    /* 22D2C 8015C924 6000022A */  slti       $v0, $s0, 0x60
    /* 22D30 8015C928 BAFF4014 */  bnez       $v0, .L8015C814
    /* 22D34 8015C92C 80037326 */   addiu     $s3, $s3, 0x380
    /* 22D38 8015C930 01003126 */  addiu      $s1, $s1, 0x1
    /* 22D3C 8015C934 2000A78F */  lw         $a3, 0x20($sp)
    /* 22D40 8015C938 6000222A */  slti       $v0, $s1, 0x60
    /* 22D44 8015C93C 0800E724 */  addiu      $a3, $a3, 0x8
    /* 22D48 8015C940 A9FF4014 */  bnez       $v0, .L8015C7E8
    /* 22D4C 8015C944 2000A7AF */   sw        $a3, 0x20($sp)
    /* 22D50 8015C948 01000224 */  addiu      $v0, $zero, 0x1
  .L8015C94C:
    /* 22D54 8015C94C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 22D58 8015C950 4800BE8F */  lw         $fp, 0x48($sp)
    /* 22D5C 8015C954 4400B78F */  lw         $s7, 0x44($sp)
    /* 22D60 8015C958 4000B68F */  lw         $s6, 0x40($sp)
    /* 22D64 8015C95C 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 22D68 8015C960 3800B48F */  lw         $s4, 0x38($sp)
    /* 22D6C 8015C964 3400B38F */  lw         $s3, 0x34($sp)
    /* 22D70 8015C968 3000B28F */  lw         $s2, 0x30($sp)
    /* 22D74 8015C96C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 22D78 8015C970 2800B08F */  lw         $s0, 0x28($sp)
    /* 22D7C 8015C974 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 22D80 8015C978 0800E003 */  jr         $ra
    /* 22D84 8015C97C 00000000 */   nop
endlabel CheckThemeRoom__Fi
