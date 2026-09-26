.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3FillStraights__Fv, 0x3AC

glabel DRLG_L3FillStraights__Fv
    /* FC24 8014981C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* FC28 80149820 3000B6AF */  sw         $s6, 0x30($sp)
    /* FC2C 80149824 21B00000 */  addu       $s6, $zero, $zero
    /* FC30 80149828 2000B2AF */  sw         $s2, 0x20($sp)
    /* FC34 8014982C 21900000 */  addu       $s2, $zero, $zero
    /* FC38 80149830 3400B7AF */  sw         $s7, 0x34($sp)
    /* FC3C 80149834 0E80173C */  lui        $s7, %hi(dungeon)
    /* FC40 80149838 C440F726 */  addiu      $s7, $s7, %lo(dungeon)
    /* FC44 8014983C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* FC48 80149840 3800BEAF */  sw         $fp, 0x38($sp)
    /* FC4C 80149844 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* FC50 80149848 2800B4AF */  sw         $s4, 0x28($sp)
    /* FC54 8014984C 2400B3AF */  sw         $s3, 0x24($sp)
    /* FC58 80149850 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* FC5C 80149854 1800B0AF */  sw         $s0, 0x18($sp)
    /* FC60 80149858 1000A0AF */  sw         $zero, 0x10($sp)
    /* FC64 8014985C 21280000 */  addu       $a1, $zero, $zero
  .L80149860:
    /* FC68 80149860 21980000 */  addu       $s3, $zero, $zero
    /* FC6C 80149864 40A81200 */  sll        $s5, $s2, 1
    /* FC70 80149868 21A0E002 */  addu       $s4, $s7, $zero
  .L8014986C:
    /* FC74 8014986C 2118B402 */  addu       $v1, $s5, $s4
    /* FC78 80149870 00006294 */  lhu        $v0, 0x0($v1)
    /* FC7C 80149874 00000000 */  nop
    /* FC80 80149878 0B004014 */  bnez       $v0, .L801498A8
    /* FC84 8014987C 0400A228 */   slti      $v0, $a1, 0x4
    /* FC88 80149880 02006394 */  lhu        $v1, 0x2($v1)
    /* FC8C 80149884 01000224 */  addiu      $v0, $zero, 0x1
    /* FC90 80149888 06006214 */  bne        $v1, $v0, .L801498A4
    /* FC94 8014988C 00000000 */   nop
    /* FC98 80149890 0200A014 */  bnez       $a1, .L8014989C
    /* FC9C 80149894 00000000 */   nop
    /* FCA0 80149898 21B06002 */  addu       $s6, $s3, $zero
  .L8014989C:
    /* FCA4 8014989C 3F260508 */  j          .L801498FC
    /* FCA8 801498A0 0100A524 */   addiu     $a1, $a1, 0x1
  .L801498A4:
    /* FCAC 801498A4 0400A228 */  slti       $v0, $a1, 0x4
  .L801498A8:
    /* FCB0 801498A8 14004014 */  bnez       $v0, .L801498FC
    /* FCB4 801498AC 21280000 */   addu      $a1, $zero, $zero
    /* FCB8 801498B0 C9F6000C */  jal        ENG_random__Fl
    /* FCBC 801498B4 02000424 */   addiu     $a0, $zero, 0x2
    /* FCC0 801498B8 0F004010 */  beqz       $v0, .L801498F8
    /* FCC4 801498BC 2A10D302 */   slt       $v0, $s6, $s3
    /* FCC8 801498C0 2180C002 */  addu       $s0, $s6, $zero
    /* FCCC 801498C4 0C004010 */  beqz       $v0, .L801498F8
    /* FCD0 801498C8 40101000 */   sll       $v0, $s0, 1
    /* FCD4 801498CC 21105000 */  addu       $v0, $v0, $s0
    /* FCD8 801498D0 40110200 */  sll        $v0, $v0, 5
    /* FCDC 801498D4 21885700 */  addu       $s1, $v0, $s7
  .L801498D8:
    /* FCE0 801498D8 C9F6000C */  jal        ENG_random__Fl
    /* FCE4 801498DC 02000424 */   addiu     $a0, $zero, 0x2
    /* FCE8 801498E0 2118B102 */  addu       $v1, $s5, $s1
    /* FCEC 801498E4 000062A4 */  sh         $v0, 0x0($v1)
    /* FCF0 801498E8 01001026 */  addiu      $s0, $s0, 0x1
    /* FCF4 801498EC 2A101302 */  slt        $v0, $s0, $s3
    /* FCF8 801498F0 F9FF4014 */  bnez       $v0, .L801498D8
    /* FCFC 801498F4 60003126 */   addiu     $s1, $s1, 0x60
  .L801498F8:
    /* FD00 801498F8 21280000 */  addu       $a1, $zero, $zero
  .L801498FC:
    /* FD04 801498FC 01007326 */  addiu      $s3, $s3, 0x1
    /* FD08 80149900 2500622A */  slti       $v0, $s3, 0x25
    /* FD0C 80149904 D9FF4014 */  bnez       $v0, .L8014986C
    /* FD10 80149908 60009426 */   addiu     $s4, $s4, 0x60
    /* FD14 8014990C 01005226 */  addiu      $s2, $s2, 0x1
    /* FD18 80149910 2700422A */  slti       $v0, $s2, 0x27
    /* FD1C 80149914 D2FF4014 */  bnez       $v0, .L80149860
    /* FD20 80149918 21280000 */   addu      $a1, $zero, $zero
    /* FD24 8014991C 21900000 */  addu       $s2, $zero, $zero
    /* FD28 80149920 0E80173C */  lui        $s7, %hi(dungeon)
    /* FD2C 80149924 C440F726 */  addiu      $s7, $s7, %lo(dungeon)
  .L80149928:
    /* FD30 80149928 21280000 */  addu       $a1, $zero, $zero
    /* FD34 8014992C 21980000 */  addu       $s3, $zero, $zero
    /* FD38 80149930 40A81200 */  sll        $s5, $s2, 1
    /* FD3C 80149934 21A0E002 */  addu       $s4, $s7, $zero
  .L80149938:
    /* FD40 80149938 2120B402 */  addu       $a0, $s5, $s4
    /* FD44 8014993C 00008394 */  lhu        $v1, 0x0($a0)
    /* FD48 80149940 01000224 */  addiu      $v0, $zero, 0x1
    /* FD4C 80149944 0B006214 */  bne        $v1, $v0, .L80149974
    /* FD50 80149948 0400A228 */   slti      $v0, $a1, 0x4
    /* FD54 8014994C 02008294 */  lhu        $v0, 0x2($a0)
    /* FD58 80149950 00000000 */  nop
    /* FD5C 80149954 06004014 */  bnez       $v0, .L80149970
    /* FD60 80149958 00000000 */   nop
    /* FD64 8014995C 0200A014 */  bnez       $a1, .L80149968
    /* FD68 80149960 00000000 */   nop
    /* FD6C 80149964 21B06002 */  addu       $s6, $s3, $zero
  .L80149968:
    /* FD70 80149968 72260508 */  j          .L801499C8
    /* FD74 8014996C 0100A524 */   addiu     $a1, $a1, 0x1
  .L80149970:
    /* FD78 80149970 0400A228 */  slti       $v0, $a1, 0x4
  .L80149974:
    /* FD7C 80149974 14004014 */  bnez       $v0, .L801499C8
    /* FD80 80149978 21280000 */   addu      $a1, $zero, $zero
    /* FD84 8014997C C9F6000C */  jal        ENG_random__Fl
    /* FD88 80149980 02000424 */   addiu     $a0, $zero, 0x2
    /* FD8C 80149984 0F004010 */  beqz       $v0, .L801499C4
    /* FD90 80149988 2A10D302 */   slt       $v0, $s6, $s3
    /* FD94 8014998C 2180C002 */  addu       $s0, $s6, $zero
    /* FD98 80149990 0C004010 */  beqz       $v0, .L801499C4
    /* FD9C 80149994 40101000 */   sll       $v0, $s0, 1
    /* FDA0 80149998 21105000 */  addu       $v0, $v0, $s0
    /* FDA4 8014999C 40110200 */  sll        $v0, $v0, 5
    /* FDA8 801499A0 21885700 */  addu       $s1, $v0, $s7
  .L801499A4:
    /* FDAC 801499A4 C9F6000C */  jal        ENG_random__Fl
    /* FDB0 801499A8 02000424 */   addiu     $a0, $zero, 0x2
    /* FDB4 801499AC 2118B102 */  addu       $v1, $s5, $s1
    /* FDB8 801499B0 020062A4 */  sh         $v0, 0x2($v1)
    /* FDBC 801499B4 01001026 */  addiu      $s0, $s0, 0x1
    /* FDC0 801499B8 2A101302 */  slt        $v0, $s0, $s3
    /* FDC4 801499BC F9FF4014 */  bnez       $v0, .L801499A4
    /* FDC8 801499C0 60003126 */   addiu     $s1, $s1, 0x60
  .L801499C4:
    /* FDCC 801499C4 21280000 */  addu       $a1, $zero, $zero
  .L801499C8:
    /* FDD0 801499C8 01007326 */  addiu      $s3, $s3, 0x1
    /* FDD4 801499CC 2500622A */  slti       $v0, $s3, 0x25
    /* FDD8 801499D0 D9FF4014 */  bnez       $v0, .L80149938
    /* FDDC 801499D4 60009426 */   addiu     $s4, $s4, 0x60
    /* FDE0 801499D8 01005226 */  addiu      $s2, $s2, 0x1
    /* FDE4 801499DC 2700422A */  slti       $v0, $s2, 0x27
    /* FDE8 801499E0 D1FF4014 */  bnez       $v0, .L80149928
    /* FDEC 801499E4 21980000 */   addu      $s3, $zero, $zero
    /* FDF0 801499E8 0E80023C */  lui        $v0, %hi(dungeon)
    /* FDF4 801499EC C4404224 */  addiu      $v0, $v0, %lo(dungeon)
    /* FDF8 801499F0 60005724 */  addiu      $s7, $v0, 0x60
    /* FDFC 801499F4 21B04000 */  addu       $s6, $v0, $zero
  .L801499F8:
    /* FE00 801499F8 21200000 */  addu       $a0, $zero, $zero
    /* FE04 801499FC 21900000 */  addu       $s2, $zero, $zero
    /* FE08 80149A00 21F0C002 */  addu       $fp, $s6, $zero
    /* FE0C 80149A04 21A8E002 */  addu       $s5, $s7, $zero
    /* FE10 80149A08 21A0C002 */  addu       $s4, $s6, $zero
  .L80149A0C:
    /* FE14 80149A0C 00008296 */  lhu        $v0, 0x0($s4)
    /* FE18 80149A10 00000000 */  nop
    /* FE1C 80149A14 0B004014 */  bnez       $v0, .L80149A44
    /* FE20 80149A18 04008228 */   slti      $v0, $a0, 0x4
    /* FE24 80149A1C 0000A396 */  lhu        $v1, 0x0($s5)
    /* FE28 80149A20 01000224 */  addiu      $v0, $zero, 0x1
    /* FE2C 80149A24 06006214 */  bne        $v1, $v0, .L80149A40
    /* FE30 80149A28 00000000 */   nop
    /* FE34 80149A2C 02008014 */  bnez       $a0, .L80149A38
    /* FE38 80149A30 00000000 */   nop
    /* FE3C 80149A34 1000B2AF */  sw         $s2, 0x10($sp)
  .L80149A38:
    /* FE40 80149A38 A5260508 */  j          .L80149A94
    /* FE44 80149A3C 01008424 */   addiu     $a0, $a0, 0x1
  .L80149A40:
    /* FE48 80149A40 04008228 */  slti       $v0, $a0, 0x4
  .L80149A44:
    /* FE4C 80149A44 13004014 */  bnez       $v0, .L80149A94
    /* FE50 80149A48 21200000 */   addu      $a0, $zero, $zero
    /* FE54 80149A4C C9F6000C */  jal        ENG_random__Fl
    /* FE58 80149A50 02000424 */   addiu     $a0, $zero, 0x2
    /* FE5C 80149A54 0E004010 */  beqz       $v0, .L80149A90
    /* FE60 80149A58 00000000 */   nop
    /* FE64 80149A5C 1000B08F */  lw         $s0, 0x10($sp)
    /* FE68 80149A60 00000000 */  nop
    /* FE6C 80149A64 2A101202 */  slt        $v0, $s0, $s2
    /* FE70 80149A68 09004010 */  beqz       $v0, .L80149A90
    /* FE74 80149A6C 40101000 */   sll       $v0, $s0, 1
    /* FE78 80149A70 21885E00 */  addu       $s1, $v0, $fp
  .L80149A74:
    /* FE7C 80149A74 C9F6000C */  jal        ENG_random__Fl
    /* FE80 80149A78 02000424 */   addiu     $a0, $zero, 0x2
    /* FE84 80149A7C 000022A6 */  sh         $v0, 0x0($s1)
    /* FE88 80149A80 01001026 */  addiu      $s0, $s0, 0x1
    /* FE8C 80149A84 2A101202 */  slt        $v0, $s0, $s2
    /* FE90 80149A88 FAFF4014 */  bnez       $v0, .L80149A74
    /* FE94 80149A8C 02003126 */   addiu     $s1, $s1, 0x2
  .L80149A90:
    /* FE98 80149A90 21200000 */  addu       $a0, $zero, $zero
  .L80149A94:
    /* FE9C 80149A94 0200B526 */  addiu      $s5, $s5, 0x2
    /* FEA0 80149A98 01005226 */  addiu      $s2, $s2, 0x1
    /* FEA4 80149A9C 2500422A */  slti       $v0, $s2, 0x25
    /* FEA8 80149AA0 DAFF4014 */  bnez       $v0, .L80149A0C
    /* FEAC 80149AA4 02009426 */   addiu     $s4, $s4, 0x2
    /* FEB0 80149AA8 6000F726 */  addiu      $s7, $s7, 0x60
    /* FEB4 80149AAC 01007326 */  addiu      $s3, $s3, 0x1
    /* FEB8 80149AB0 2700622A */  slti       $v0, $s3, 0x27
    /* FEBC 80149AB4 D0FF4014 */  bnez       $v0, .L801499F8
    /* FEC0 80149AB8 6000D626 */   addiu     $s6, $s6, 0x60
    /* FEC4 80149ABC 21980000 */  addu       $s3, $zero, $zero
    /* FEC8 80149AC0 0E80173C */  lui        $s7, %hi(dungeon)
    /* FECC 80149AC4 C440F726 */  addiu      $s7, $s7, %lo(dungeon)
    /* FED0 80149AC8 6000F526 */  addiu      $s5, $s7, 0x60
    /* FED4 80149ACC 21B00000 */  addu       $s6, $zero, $zero
  .L80149AD0:
    /* FED8 80149AD0 21200000 */  addu       $a0, $zero, $zero
    /* FEDC 80149AD4 21900000 */  addu       $s2, $zero, $zero
    /* FEE0 80149AD8 21A0A002 */  addu       $s4, $s5, $zero
  .L80149ADC:
    /* FEE4 80149ADC 2118D702 */  addu       $v1, $s6, $s7
    /* FEE8 80149AE0 40101200 */  sll        $v0, $s2, 1
    /* FEEC 80149AE4 21104300 */  addu       $v0, $v0, $v1
    /* FEF0 80149AE8 00004394 */  lhu        $v1, 0x0($v0)
    /* FEF4 80149AEC 01000224 */  addiu      $v0, $zero, 0x1
    /* FEF8 80149AF0 0B006214 */  bne        $v1, $v0, .L80149B20
    /* FEFC 80149AF4 04008228 */   slti      $v0, $a0, 0x4
    /* FF00 80149AF8 00008296 */  lhu        $v0, 0x0($s4)
    /* FF04 80149AFC 00000000 */  nop
    /* FF08 80149B00 06004014 */  bnez       $v0, .L80149B1C
    /* FF0C 80149B04 00000000 */   nop
    /* FF10 80149B08 02008014 */  bnez       $a0, .L80149B14
    /* FF14 80149B0C 00000000 */   nop
    /* FF18 80149B10 1000B2AF */  sw         $s2, 0x10($sp)
  .L80149B14:
    /* FF1C 80149B14 DC260508 */  j          .L80149B70
    /* FF20 80149B18 01008424 */   addiu     $a0, $a0, 0x1
  .L80149B1C:
    /* FF24 80149B1C 04008228 */  slti       $v0, $a0, 0x4
  .L80149B20:
    /* FF28 80149B20 13004014 */  bnez       $v0, .L80149B70
    /* FF2C 80149B24 21200000 */   addu      $a0, $zero, $zero
    /* FF30 80149B28 C9F6000C */  jal        ENG_random__Fl
    /* FF34 80149B2C 02000424 */   addiu     $a0, $zero, 0x2
    /* FF38 80149B30 0E004010 */  beqz       $v0, .L80149B6C
    /* FF3C 80149B34 00000000 */   nop
    /* FF40 80149B38 1000B08F */  lw         $s0, 0x10($sp)
    /* FF44 80149B3C 00000000 */  nop
    /* FF48 80149B40 2A101202 */  slt        $v0, $s0, $s2
    /* FF4C 80149B44 09004010 */  beqz       $v0, .L80149B6C
    /* FF50 80149B48 40101000 */   sll       $v0, $s0, 1
    /* FF54 80149B4C 21885500 */  addu       $s1, $v0, $s5
  .L80149B50:
    /* FF58 80149B50 C9F6000C */  jal        ENG_random__Fl
    /* FF5C 80149B54 02000424 */   addiu     $a0, $zero, 0x2
    /* FF60 80149B58 000022A6 */  sh         $v0, 0x0($s1)
    /* FF64 80149B5C 01001026 */  addiu      $s0, $s0, 0x1
    /* FF68 80149B60 2A101202 */  slt        $v0, $s0, $s2
    /* FF6C 80149B64 FAFF4014 */  bnez       $v0, .L80149B50
    /* FF70 80149B68 02003126 */   addiu     $s1, $s1, 0x2
  .L80149B6C:
    /* FF74 80149B6C 21200000 */  addu       $a0, $zero, $zero
  .L80149B70:
    /* FF78 80149B70 01005226 */  addiu      $s2, $s2, 0x1
    /* FF7C 80149B74 2500422A */  slti       $v0, $s2, 0x25
    /* FF80 80149B78 D8FF4014 */  bnez       $v0, .L80149ADC
    /* FF84 80149B7C 02009426 */   addiu     $s4, $s4, 0x2
    /* FF88 80149B80 6000B526 */  addiu      $s5, $s5, 0x60
    /* FF8C 80149B84 01007326 */  addiu      $s3, $s3, 0x1
    /* FF90 80149B88 2700622A */  slti       $v0, $s3, 0x27
    /* FF94 80149B8C D0FF4014 */  bnez       $v0, .L80149AD0
    /* FF98 80149B90 6000D626 */   addiu     $s6, $s6, 0x60
    /* FF9C 80149B94 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* FFA0 80149B98 3800BE8F */  lw         $fp, 0x38($sp)
    /* FFA4 80149B9C 3400B78F */  lw         $s7, 0x34($sp)
    /* FFA8 80149BA0 3000B68F */  lw         $s6, 0x30($sp)
    /* FFAC 80149BA4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* FFB0 80149BA8 2800B48F */  lw         $s4, 0x28($sp)
    /* FFB4 80149BAC 2400B38F */  lw         $s3, 0x24($sp)
    /* FFB8 80149BB0 2000B28F */  lw         $s2, 0x20($sp)
    /* FFBC 80149BB4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* FFC0 80149BB8 1800B08F */  lw         $s0, 0x18($sp)
    /* FFC4 80149BBC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* FFC8 80149BC0 0800E003 */  jr         $ra
    /* FFCC 80149BC4 00000000 */   nop
endlabel DRLG_L3FillStraights__Fv
