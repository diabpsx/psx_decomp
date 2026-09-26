.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Element__Fi, 0x71C

glabel MI_Element__Fi
    /* FC98 80149890 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* FC9C 80149894 2400B1AF */  sw         $s1, 0x24($sp)
    /* FCA0 80149898 21888000 */  addu       $s1, $a0, $zero
    /* FCA4 8014989C 80101100 */  sll        $v0, $s1, 2
    /* FCA8 801498A0 21105100 */  addu       $v0, $v0, $s1
    /* FCAC 801498A4 80100200 */  sll        $v0, $v0, 2
    /* FCB0 801498A8 23105100 */  subu       $v0, $v0, $s1
    /* FCB4 801498AC 2000B0AF */  sw         $s0, 0x20($sp)
    /* FCB8 801498B0 80800200 */  sll        $s0, $v0, 2
    /* FCBC 801498B4 13000324 */  addiu      $v1, $zero, 0x13
    /* FCC0 801498B8 4400BFAF */  sw         $ra, 0x44($sp)
    /* FCC4 801498BC 4000BEAF */  sw         $fp, 0x40($sp)
    /* FCC8 801498C0 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* FCCC 801498C4 3800B6AF */  sw         $s6, 0x38($sp)
    /* FCD0 801498C8 3400B5AF */  sw         $s5, 0x34($sp)
    /* FCD4 801498CC 3000B4AF */  sw         $s4, 0x30($sp)
    /* FCD8 801498D0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* FCDC 801498D4 2800B2AF */  sw         $s2, 0x28($sp)
    /* FCE0 801498D8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* FCE4 801498DC 21083000 */  addu       $at, $at, $s0
    /* FCE8 801498E0 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* FCEC 801498E4 1080013C */  lui        $at, %hi(missile + 0x10)
    /* FCF0 801498E8 21083000 */  addu       $at, $at, $s0
    /* FCF4 801498EC 682C338C */  lw         $s3, %lo(missile + 0x10)($at)
    /* FCF8 801498F0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* FCFC 801498F4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* FD00 801498F8 21083000 */  addu       $at, $at, $s0
    /* FD04 801498FC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* FD08 80149900 1080013C */  lui        $at, %hi(missile + 0x37)
    /* FD0C 80149904 21083000 */  addu       $at, $at, $s0
    /* FD10 80149908 8F2C2290 */  lbu        $v0, %lo(missile + 0x37)($at)
    /* FD14 8014990C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* FD18 80149910 21083000 */  addu       $at, $at, $s0
    /* FD1C 80149914 862C3284 */  lh         $s2, %lo(missile + 0x2E)($at)
    /* FD20 80149918 CE004314 */  bne        $v0, $v1, .L80149C54
    /* FD24 8014991C B6010724 */   addiu     $a3, $zero, 0x1B6
    /* FD28 80149920 40101200 */  sll        $v0, $s2, 1
    /* FD2C 80149924 21105200 */  addu       $v0, $v0, $s2
    /* FD30 80149928 80100200 */  sll        $v0, $v0, 2
    /* FD34 8014992C 21105200 */  addu       $v0, $v0, $s2
    /* FD38 80149930 00110200 */  sll        $v0, $v0, 4
    /* FD3C 80149934 23105200 */  subu       $v0, $v0, $s2
    /* FD40 80149938 80100200 */  sll        $v0, $v0, 2
    /* FD44 8014993C 21105200 */  addu       $v0, $v0, $s2
    /* FD48 80149940 C0100200 */  sll        $v0, $v0, 3
    /* FD4C 80149944 1080013C */  lui        $at, %hi(missile + 0x31)
    /* FD50 80149948 21083000 */  addu       $at, $at, $s0
    /* FD54 8014994C 892C3480 */  lb         $s4, %lo(missile + 0x31)($at)
    /* FD58 80149950 1080013C */  lui        $at, %hi(missile + 0x32)
    /* FD5C 80149954 21083000 */  addu       $at, $at, $s0
    /* FD60 80149958 8A2C3580 */  lb         $s5, %lo(missile + 0x32)($at)
    /* FD64 8014995C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* FD68 80149960 21083000 */  addu       $at, $at, $s0
    /* FD6C 80149964 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* FD70 80149968 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* FD74 8014996C 21082200 */  addu       $at, $at, $v0
    /* FD78 80149970 68A53284 */  lh         $s2, %lo(plr + 0x30)($at)
    /* FD7C 80149974 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* FD80 80149978 21082200 */  addu       $at, $at, $v0
    /* FD84 8014997C 6AA53684 */  lh         $s6, %lo(plr + 0x32)($at)
    /* FD88 80149980 21288002 */  addu       $a1, $s4, $zero
    /* FD8C 80149984 F834010C */  jal        ChangeLight__Fiiii
    /* FD90 80149988 2130A002 */   addu      $a2, $s5, $zero
    /* FD94 8014998C 21204002 */  addu       $a0, $s2, $zero
    /* FD98 80149990 2128C002 */  addu       $a1, $s6, $zero
    /* FD9C 80149994 21308002 */  addu       $a2, $s4, $zero
    /* FDA0 80149998 7FE8040C */  jal        CheckBlock__Fiiii
    /* FDA4 8014999C 2138A002 */   addu      $a3, $s5, $zero
    /* FDA8 801499A0 0C004014 */  bnez       $v0, .L801499D4
    /* FDAC 801499A4 21204002 */   addu      $a0, $s2, $zero
    /* FDB0 801499A8 21202002 */  addu       $a0, $s1, $zero
    /* FDB4 801499AC 21286002 */  addu       $a1, $s3, $zero
    /* FDB8 801499B0 21306002 */  addu       $a2, $s3, $zero
    /* FDBC 801499B4 01000724 */  addiu      $a3, $zero, 0x1
    /* FDC0 801499B8 01000224 */  addiu      $v0, $zero, 0x1
    /* FDC4 801499BC 1000B4AF */  sw         $s4, 0x10($sp)
    /* FDC8 801499C0 1400B5AF */  sw         $s5, 0x14($sp)
    /* FDCC 801499C4 1800A2AF */  sw         $v0, 0x18($sp)
    /* FDD0 801499C8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FDD4 801499CC 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FDD8 801499D0 21204002 */  addu       $a0, $s2, $zero
  .L801499D4:
    /* FDDC 801499D4 2128C002 */  addu       $a1, $s6, $zero
    /* FDE0 801499D8 21308002 */  addu       $a2, $s4, $zero
    /* FDE4 801499DC 0100BE26 */  addiu      $fp, $s5, 0x1
    /* FDE8 801499E0 7FE8040C */  jal        CheckBlock__Fiiii
    /* FDEC 801499E4 2138C003 */   addu      $a3, $fp, $zero
    /* FDF0 801499E8 0C004014 */  bnez       $v0, .L80149A1C
    /* FDF4 801499EC 21204002 */   addu      $a0, $s2, $zero
    /* FDF8 801499F0 21202002 */  addu       $a0, $s1, $zero
    /* FDFC 801499F4 21286002 */  addu       $a1, $s3, $zero
    /* FE00 801499F8 21306002 */  addu       $a2, $s3, $zero
    /* FE04 801499FC 01000724 */  addiu      $a3, $zero, 0x1
    /* FE08 80149A00 01000224 */  addiu      $v0, $zero, 0x1
    /* FE0C 80149A04 1000B4AF */  sw         $s4, 0x10($sp)
    /* FE10 80149A08 1400BEAF */  sw         $fp, 0x14($sp)
    /* FE14 80149A0C 1800A2AF */  sw         $v0, 0x18($sp)
    /* FE18 80149A10 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FE1C 80149A14 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FE20 80149A18 21204002 */  addu       $a0, $s2, $zero
  .L80149A1C:
    /* FE24 80149A1C 2128C002 */  addu       $a1, $s6, $zero
    /* FE28 80149A20 21308002 */  addu       $a2, $s4, $zero
    /* FE2C 80149A24 FFFFB726 */  addiu      $s7, $s5, -0x1
    /* FE30 80149A28 7FE8040C */  jal        CheckBlock__Fiiii
    /* FE34 80149A2C 2138E002 */   addu      $a3, $s7, $zero
    /* FE38 80149A30 0C004014 */  bnez       $v0, .L80149A64
    /* FE3C 80149A34 21204002 */   addu      $a0, $s2, $zero
    /* FE40 80149A38 21202002 */  addu       $a0, $s1, $zero
    /* FE44 80149A3C 21286002 */  addu       $a1, $s3, $zero
    /* FE48 80149A40 21306002 */  addu       $a2, $s3, $zero
    /* FE4C 80149A44 01000724 */  addiu      $a3, $zero, 0x1
    /* FE50 80149A48 01000224 */  addiu      $v0, $zero, 0x1
    /* FE54 80149A4C 1000B4AF */  sw         $s4, 0x10($sp)
    /* FE58 80149A50 1400B7AF */  sw         $s7, 0x14($sp)
    /* FE5C 80149A54 1800A2AF */  sw         $v0, 0x18($sp)
    /* FE60 80149A58 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FE64 80149A5C 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FE68 80149A60 21204002 */  addu       $a0, $s2, $zero
  .L80149A64:
    /* FE6C 80149A64 2128C002 */  addu       $a1, $s6, $zero
    /* FE70 80149A68 01009026 */  addiu      $s0, $s4, 0x1
    /* FE74 80149A6C 21300002 */  addu       $a2, $s0, $zero
    /* FE78 80149A70 7FE8040C */  jal        CheckBlock__Fiiii
    /* FE7C 80149A74 2138A002 */   addu      $a3, $s5, $zero
    /* FE80 80149A78 0C004014 */  bnez       $v0, .L80149AAC
    /* FE84 80149A7C 21204002 */   addu      $a0, $s2, $zero
    /* FE88 80149A80 21202002 */  addu       $a0, $s1, $zero
    /* FE8C 80149A84 21286002 */  addu       $a1, $s3, $zero
    /* FE90 80149A88 21306002 */  addu       $a2, $s3, $zero
    /* FE94 80149A8C 01000724 */  addiu      $a3, $zero, 0x1
    /* FE98 80149A90 01000224 */  addiu      $v0, $zero, 0x1
    /* FE9C 80149A94 1000B0AF */  sw         $s0, 0x10($sp)
    /* FEA0 80149A98 1400B5AF */  sw         $s5, 0x14($sp)
    /* FEA4 80149A9C 1800A2AF */  sw         $v0, 0x18($sp)
    /* FEA8 80149AA0 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FEAC 80149AA4 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FEB0 80149AA8 21204002 */  addu       $a0, $s2, $zero
  .L80149AAC:
    /* FEB4 80149AAC 2128C002 */  addu       $a1, $s6, $zero
    /* FEB8 80149AB0 21300002 */  addu       $a2, $s0, $zero
    /* FEBC 80149AB4 7FE8040C */  jal        CheckBlock__Fiiii
    /* FEC0 80149AB8 2138E002 */   addu      $a3, $s7, $zero
    /* FEC4 80149ABC 0C004014 */  bnez       $v0, .L80149AF0
    /* FEC8 80149AC0 21204002 */   addu      $a0, $s2, $zero
    /* FECC 80149AC4 21202002 */  addu       $a0, $s1, $zero
    /* FED0 80149AC8 21286002 */  addu       $a1, $s3, $zero
    /* FED4 80149ACC 21306002 */  addu       $a2, $s3, $zero
    /* FED8 80149AD0 01000724 */  addiu      $a3, $zero, 0x1
    /* FEDC 80149AD4 01000224 */  addiu      $v0, $zero, 0x1
    /* FEE0 80149AD8 1000B0AF */  sw         $s0, 0x10($sp)
    /* FEE4 80149ADC 1400B7AF */  sw         $s7, 0x14($sp)
    /* FEE8 80149AE0 1800A2AF */  sw         $v0, 0x18($sp)
    /* FEEC 80149AE4 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FEF0 80149AE8 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FEF4 80149AEC 21204002 */  addu       $a0, $s2, $zero
  .L80149AF0:
    /* FEF8 80149AF0 2128C002 */  addu       $a1, $s6, $zero
    /* FEFC 80149AF4 21300002 */  addu       $a2, $s0, $zero
    /* FF00 80149AF8 7FE8040C */  jal        CheckBlock__Fiiii
    /* FF04 80149AFC 2138C003 */   addu      $a3, $fp, $zero
    /* FF08 80149B00 0C004014 */  bnez       $v0, .L80149B34
    /* FF0C 80149B04 21204002 */   addu      $a0, $s2, $zero
    /* FF10 80149B08 21202002 */  addu       $a0, $s1, $zero
    /* FF14 80149B0C 21286002 */  addu       $a1, $s3, $zero
    /* FF18 80149B10 21306002 */  addu       $a2, $s3, $zero
    /* FF1C 80149B14 01000724 */  addiu      $a3, $zero, 0x1
    /* FF20 80149B18 01000224 */  addiu      $v0, $zero, 0x1
    /* FF24 80149B1C 1000B0AF */  sw         $s0, 0x10($sp)
    /* FF28 80149B20 1400BEAF */  sw         $fp, 0x14($sp)
    /* FF2C 80149B24 1800A2AF */  sw         $v0, 0x18($sp)
    /* FF30 80149B28 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FF34 80149B2C 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FF38 80149B30 21204002 */  addu       $a0, $s2, $zero
  .L80149B34:
    /* FF3C 80149B34 2128C002 */  addu       $a1, $s6, $zero
    /* FF40 80149B38 FFFF9026 */  addiu      $s0, $s4, -0x1
    /* FF44 80149B3C 21300002 */  addu       $a2, $s0, $zero
    /* FF48 80149B40 7FE8040C */  jal        CheckBlock__Fiiii
    /* FF4C 80149B44 2138A002 */   addu      $a3, $s5, $zero
    /* FF50 80149B48 0C004014 */  bnez       $v0, .L80149B7C
    /* FF54 80149B4C 21204002 */   addu      $a0, $s2, $zero
    /* FF58 80149B50 21202002 */  addu       $a0, $s1, $zero
    /* FF5C 80149B54 21286002 */  addu       $a1, $s3, $zero
    /* FF60 80149B58 21306002 */  addu       $a2, $s3, $zero
    /* FF64 80149B5C 01000724 */  addiu      $a3, $zero, 0x1
    /* FF68 80149B60 01000224 */  addiu      $v0, $zero, 0x1
    /* FF6C 80149B64 1000B0AF */  sw         $s0, 0x10($sp)
    /* FF70 80149B68 1400B5AF */  sw         $s5, 0x14($sp)
    /* FF74 80149B6C 1800A2AF */  sw         $v0, 0x18($sp)
    /* FF78 80149B70 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FF7C 80149B74 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FF80 80149B78 21204002 */  addu       $a0, $s2, $zero
  .L80149B7C:
    /* FF84 80149B7C 2128C002 */  addu       $a1, $s6, $zero
    /* FF88 80149B80 21300002 */  addu       $a2, $s0, $zero
    /* FF8C 80149B84 7FE8040C */  jal        CheckBlock__Fiiii
    /* FF90 80149B88 2138C003 */   addu      $a3, $fp, $zero
    /* FF94 80149B8C 0C004014 */  bnez       $v0, .L80149BC0
    /* FF98 80149B90 21204002 */   addu      $a0, $s2, $zero
    /* FF9C 80149B94 21202002 */  addu       $a0, $s1, $zero
    /* FFA0 80149B98 21286002 */  addu       $a1, $s3, $zero
    /* FFA4 80149B9C 21306002 */  addu       $a2, $s3, $zero
    /* FFA8 80149BA0 01000724 */  addiu      $a3, $zero, 0x1
    /* FFAC 80149BA4 01000224 */  addiu      $v0, $zero, 0x1
    /* FFB0 80149BA8 1000B0AF */  sw         $s0, 0x10($sp)
    /* FFB4 80149BAC 1400BEAF */  sw         $fp, 0x14($sp)
    /* FFB8 80149BB0 1800A2AF */  sw         $v0, 0x18($sp)
    /* FFBC 80149BB4 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FFC0 80149BB8 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* FFC4 80149BBC 21204002 */  addu       $a0, $s2, $zero
  .L80149BC0:
    /* FFC8 80149BC0 2128C002 */  addu       $a1, $s6, $zero
    /* FFCC 80149BC4 21300002 */  addu       $a2, $s0, $zero
    /* FFD0 80149BC8 7FE8040C */  jal        CheckBlock__Fiiii
    /* FFD4 80149BCC 2138E002 */   addu      $a3, $s7, $zero
    /* FFD8 80149BD0 0C004014 */  bnez       $v0, .L80149C04
    /* FFDC 80149BD4 80101100 */   sll       $v0, $s1, 2
    /* FFE0 80149BD8 21202002 */  addu       $a0, $s1, $zero
    /* FFE4 80149BDC 21286002 */  addu       $a1, $s3, $zero
    /* FFE8 80149BE0 2130A000 */  addu       $a2, $a1, $zero
    /* FFEC 80149BE4 01000724 */  addiu      $a3, $zero, 0x1
    /* FFF0 80149BE8 01000224 */  addiu      $v0, $zero, 0x1
    /* FFF4 80149BEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* FFF8 80149BF0 1400B7AF */  sw         $s7, 0x14($sp)
    /* FFFC 80149BF4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 10000 80149BF8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* 10004 80149BFC 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 10008 80149C00 80101100 */  sll        $v0, $s1, 2
  .L80149C04:
    /* 1000C 80149C04 21105100 */  addu       $v0, $v0, $s1
    /* 10010 80149C08 80100200 */  sll        $v0, $v0, 2
    /* 10014 80149C0C 23105100 */  subu       $v0, $v0, $s1
    /* 10018 80149C10 80180200 */  sll        $v1, $v0, 2
    /* 1001C 80149C14 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10020 80149C18 21082300 */  addu       $at, $at, $v1
    /* 10024 80149C1C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 10028 80149C20 00000000 */  nop
    /* 1002C 80149C24 D2004014 */  bnez       $v0, .L80149F70
    /* 10030 80149C28 01000224 */   addiu     $v0, $zero, 0x1
    /* 10034 80149C2C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 10038 80149C30 21082300 */  addu       $at, $at, $v1
    /* 1003C 80149C34 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 10040 80149C38 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 10044 80149C3C 21082300 */  addu       $at, $at, $v1
    /* 10048 80149C40 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* 1004C 80149C44 D034010C */  jal        AddUnLight__Fi
    /* 10050 80149C48 00000000 */   nop
    /* 10054 80149C4C DC270508 */  j          .L80149F70
    /* 10058 80149C50 00000000 */   nop
  .L80149C54:
    /* 1005C 80149C54 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 10060 80149C58 21083000 */  addu       $at, $at, $s0
    /* 10064 80149C5C 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* 10068 80149C60 1080013C */  lui        $at, %hi(missile)
    /* 1006C 80149C64 21083000 */  addu       $at, $at, $s0
    /* 10070 80149C68 582C258C */  lw         $a1, %lo(missile)($at)
    /* 10074 80149C6C 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 10078 80149C70 21083000 */  addu       $at, $at, $s0
    /* 1007C 80149C74 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* 10080 80149C78 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 10084 80149C7C 21083000 */  addu       $at, $at, $s0
    /* 10088 80149C80 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* 1008C 80149C84 21104500 */  addu       $v0, $v0, $a1
    /* 10090 80149C88 21186600 */  addu       $v1, $v1, $a2
    /* 10094 80149C8C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 10098 80149C90 21083000 */  addu       $at, $at, $s0
    /* 1009C 80149C94 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* 100A0 80149C98 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 100A4 80149C9C 21083000 */  addu       $at, $at, $s0
    /* 100A8 80149CA0 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* 100AC 80149CA4 68EB040C */  jal        GetMissilePos__Fi
    /* 100B0 80149CA8 21202002 */   addu      $a0, $s1, $zero
    /* 100B4 80149CAC 21202002 */  addu       $a0, $s1, $zero
    /* 100B8 80149CB0 21286002 */  addu       $a1, $s3, $zero
    /* 100BC 80149CB4 2130A000 */  addu       $a2, $a1, $zero
    /* 100C0 80149CB8 21380000 */  addu       $a3, $zero, $zero
    /* 100C4 80149CBC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 100C8 80149CC0 21083000 */  addu       $at, $at, $s0
    /* 100CC 80149CC4 892C3480 */  lb         $s4, %lo(missile + 0x31)($at)
    /* 100D0 80149CC8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 100D4 80149CCC 21083000 */  addu       $at, $at, $s0
    /* 100D8 80149CD0 8A2C3580 */  lb         $s5, %lo(missile + 0x32)($at)
    /* 100DC 80149CD4 01000224 */  addiu      $v0, $zero, 0x1
    /* 100E0 80149CD8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 100E4 80149CDC 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 100E8 80149CE0 1000B4AF */  sw         $s4, 0x10($sp)
    /* 100EC 80149CE4 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* 100F0 80149CE8 1400B5AF */   sw        $s5, 0x14($sp)
    /* 100F4 80149CEC 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 100F8 80149CF0 21083000 */  addu       $at, $at, $s0
    /* 100FC 80149CF4 7A2C2284 */  lh         $v0, %lo(missile + 0x22)($at)
    /* 10100 80149CF8 00000000 */  nop
    /* 10104 80149CFC 12004014 */  bnez       $v0, .L80149D48
    /* 10108 80149D00 80101100 */   sll       $v0, $s1, 2
    /* 1010C 80149D04 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 10110 80149D08 21083000 */  addu       $at, $at, $s0
    /* 10114 80149D0C 7C2C2284 */  lh         $v0, %lo(missile + 0x24)($at)
    /* 10118 80149D10 00000000 */  nop
    /* 1011C 80149D14 0C008216 */  bne        $s4, $v0, .L80149D48
    /* 10120 80149D18 80101100 */   sll       $v0, $s1, 2
    /* 10124 80149D1C 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 10128 80149D20 21083000 */  addu       $at, $at, $s0
    /* 1012C 80149D24 7E2C2284 */  lh         $v0, %lo(missile + 0x26)($at)
    /* 10130 80149D28 00000000 */  nop
    /* 10134 80149D2C 0600A216 */  bne        $s5, $v0, .L80149D48
    /* 10138 80149D30 80101100 */   sll       $v0, $s1, 2
    /* 1013C 80149D34 01000224 */  addiu      $v0, $zero, 0x1
    /* 10140 80149D38 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 10144 80149D3C 21083000 */  addu       $at, $at, $s0
    /* 10148 80149D40 7A2C22A4 */  sh         $v0, %lo(missile + 0x22)($at)
    /* 1014C 80149D44 80101100 */  sll        $v0, $s1, 2
  .L80149D48:
    /* 10150 80149D48 21105100 */  addu       $v0, $v0, $s1
    /* 10154 80149D4C 80100200 */  sll        $v0, $v0, 2
    /* 10158 80149D50 23105100 */  subu       $v0, $v0, $s1
    /* 1015C 80149D54 80380200 */  sll        $a3, $v0, 2
    /* 10160 80149D58 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 10164 80149D5C 21082700 */  addu       $at, $at, $a3
    /* 10168 80149D60 7A2C2384 */  lh         $v1, %lo(missile + 0x22)($at)
    /* 1016C 80149D64 01000224 */  addiu      $v0, $zero, 0x1
    /* 10170 80149D68 4B006214 */  bne        $v1, $v0, .L80149E98
    /* 10174 80149D6C 80101100 */   sll       $v0, $s1, 2
    /* 10178 80149D70 21208002 */  addu       $a0, $s4, $zero
    /* 1017C 80149D74 2128A002 */  addu       $a1, $s5, $zero
    /* 10180 80149D78 02000224 */  addiu      $v0, $zero, 0x2
    /* 10184 80149D7C 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 10188 80149D80 21082700 */  addu       $at, $at, $a3
    /* 1018C 80149D84 7A2C22A4 */  sh         $v0, %lo(missile + 0x22)($at)
    /* 10190 80149D88 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 10194 80149D8C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10198 80149D90 21082700 */  addu       $at, $at, $a3
    /* 1019C 80149D94 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 101A0 80149D98 ACE8040C */  jal        FindClosest__Fiii
    /* 101A4 80149D9C 13000624 */   addiu     $a2, $zero, 0x13
    /* 101A8 80149DA0 1D004018 */  blez       $v0, .L80149E18
    /* 101AC 80149DA4 21208002 */   addu      $a0, $s4, $zero
    /* 101B0 80149DA8 40800200 */  sll        $s0, $v0, 1
    /* 101B4 80149DAC 21800202 */  addu       $s0, $s0, $v0
    /* 101B8 80149DB0 80801000 */  sll        $s0, $s0, 2
    /* 101BC 80149DB4 21800202 */  addu       $s0, $s0, $v0
    /* 101C0 80149DB8 C0801000 */  sll        $s0, $s0, 3
    /* 101C4 80149DBC 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 101C8 80149DC0 21083000 */  addu       $at, $at, $s0
    /* 101CC 80149DC4 C8532680 */  lb         $a2, %lo(monster + 0x34)($at)
    /* 101D0 80149DC8 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 101D4 80149DCC 21083000 */  addu       $at, $at, $s0
    /* 101D8 80149DD0 C9532780 */  lb         $a3, %lo(monster + 0x35)($at)
    /* 101DC 80149DD4 2CE9040C */  jal        GetDirection8__Fiiii
    /* 101E0 80149DD8 2128A002 */   addu      $a1, $s5, $zero
    /* 101E4 80149DDC 21202002 */  addu       $a0, $s1, $zero
    /* 101E8 80149DE0 09F5040C */  jal        SetMissDir__Fii
    /* 101EC 80149DE4 21284000 */   addu      $a1, $v0, $zero
    /* 101F0 80149DE8 21202002 */  addu       $a0, $s1, $zero
    /* 101F4 80149DEC 21288002 */  addu       $a1, $s4, $zero
    /* 101F8 80149DF0 2130A002 */  addu       $a2, $s5, $zero
    /* 101FC 80149DF4 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 10200 80149DF8 21083000 */  addu       $at, $at, $s0
    /* 10204 80149DFC C8532780 */  lb         $a3, %lo(monster + 0x34)($at)
    /* 10208 80149E00 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1020C 80149E04 21083000 */  addu       $at, $at, $s0
    /* 10210 80149E08 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 10214 80149E0C 10000224 */  addiu      $v0, $zero, 0x10
    /* 10218 80149E10 A3270508 */  j          .L80149E8C
    /* 1021C 80149E14 1400A2AF */   sw        $v0, 0x14($sp)
  .L80149E18:
    /* 10220 80149E18 40101200 */  sll        $v0, $s2, 1
    /* 10224 80149E1C 21105200 */  addu       $v0, $v0, $s2
    /* 10228 80149E20 80100200 */  sll        $v0, $v0, 2
    /* 1022C 80149E24 21105200 */  addu       $v0, $v0, $s2
    /* 10230 80149E28 00110200 */  sll        $v0, $v0, 4
    /* 10234 80149E2C 23105200 */  subu       $v0, $v0, $s2
    /* 10238 80149E30 80100200 */  sll        $v0, $v0, 2
    /* 1023C 80149E34 21105200 */  addu       $v0, $v0, $s2
    /* 10240 80149E38 C0100200 */  sll        $v0, $v0, 3
    /* 10244 80149E3C 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 10248 80149E40 21082200 */  addu       $at, $at, $v0
    /* 1024C 80149E44 7AA53080 */  lb         $s0, %lo(plr + 0x42)($at)
    /* 10250 80149E48 21202002 */  addu       $a0, $s1, $zero
    /* 10254 80149E4C 09F5040C */  jal        SetMissDir__Fii
    /* 10258 80149E50 21280002 */   addu      $a1, $s0, $zero
    /* 1025C 80149E54 21202002 */  addu       $a0, $s1, $zero
    /* 10260 80149E58 21288002 */  addu       $a1, $s4, $zero
    /* 10264 80149E5C 2130A002 */  addu       $a2, $s5, $zero
    /* 10268 80149E60 80101000 */  sll        $v0, $s0, 2
    /* 1026C 80149E64 1080013C */  lui        $at, %hi(XDirAdd)
    /* 10270 80149E68 21082200 */  addu       $at, $at, $v0
    /* 10274 80149E6C D829278C */  lw         $a3, %lo(XDirAdd)($at)
    /* 10278 80149E70 1080013C */  lui        $at, %hi(YDirAdd)
    /* 1027C 80149E74 21082200 */  addu       $at, $at, $v0
    /* 10280 80149E78 F829238C */  lw         $v1, %lo(YDirAdd)($at)
    /* 10284 80149E7C 10000224 */  addiu      $v0, $zero, 0x10
    /* 10288 80149E80 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1028C 80149E84 21388702 */  addu       $a3, $s4, $a3
    /* 10290 80149E88 2118A302 */  addu       $v1, $s5, $v1
  .L80149E8C:
    /* 10294 80149E8C 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 10298 80149E90 1000A3AF */   sw        $v1, 0x10($sp)
    /* 1029C 80149E94 80101100 */  sll        $v0, $s1, 2
  .L80149E98:
    /* 102A0 80149E98 21105100 */  addu       $v0, $v0, $s1
    /* 102A4 80149E9C 80100200 */  sll        $v0, $v0, 2
    /* 102A8 80149EA0 23105100 */  subu       $v0, $v0, $s1
    /* 102AC 80149EA4 80180200 */  sll        $v1, $v0, 2
    /* 102B0 80149EA8 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 102B4 80149EAC 21082300 */  addu       $at, $at, $v1
    /* 102B8 80149EB0 762C2284 */  lh         $v0, %lo(missile + 0x1E)($at)
    /* 102BC 80149EB4 00000000 */  nop
    /* 102C0 80149EB8 07008216 */  bne        $s4, $v0, .L80149ED8
    /* 102C4 80149EBC 21288002 */   addu      $a1, $s4, $zero
    /* 102C8 80149EC0 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 102CC 80149EC4 21082300 */  addu       $at, $at, $v1
    /* 102D0 80149EC8 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* 102D4 80149ECC 00000000 */  nop
    /* 102D8 80149ED0 0E00A212 */  beq        $s5, $v0, .L80149F0C
    /* 102DC 80149ED4 80101100 */   sll       $v0, $s1, 2
  .L80149ED8:
    /* 102E0 80149ED8 2130A002 */  addu       $a2, $s5, $zero
    /* 102E4 80149EDC 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 102E8 80149EE0 21082300 */  addu       $at, $at, $v1
    /* 102EC 80149EE4 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 102F0 80149EE8 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 102F4 80149EEC 21082300 */  addu       $at, $at, $v1
    /* 102F8 80149EF0 762C25A4 */  sh         $a1, %lo(missile + 0x1E)($at)
    /* 102FC 80149EF4 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 10300 80149EF8 21082300 */  addu       $at, $at, $v1
    /* 10304 80149EFC 782C26A4 */  sh         $a2, %lo(missile + 0x20)($at)
    /* 10308 80149F00 F834010C */  jal        ChangeLight__Fiiii
    /* 1030C 80149F04 B6010724 */   addiu     $a3, $zero, 0x1B6
    /* 10310 80149F08 80101100 */  sll        $v0, $s1, 2
  .L80149F0C:
    /* 10314 80149F0C 21105100 */  addu       $v0, $v0, $s1
    /* 10318 80149F10 80100200 */  sll        $v0, $v0, 2
    /* 1031C 80149F14 23105100 */  subu       $v0, $v0, $s1
    /* 10320 80149F18 80800200 */  sll        $s0, $v0, 2
    /* 10324 80149F1C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10328 80149F20 21083000 */  addu       $at, $at, $s0
    /* 1032C 80149F24 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 10330 80149F28 00000000 */  nop
    /* 10334 80149F2C 10004014 */  bnez       $v0, .L80149F70
    /* 10338 80149F30 21202002 */   addu      $a0, $s1, $zero
    /* 1033C 80149F34 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 10340 80149F38 21083000 */  addu       $at, $at, $s0
    /* 10344 80149F3C 972C20A0 */  sb         $zero, %lo(missile + 0x3F)($at)
    /* 10348 80149F40 D3F4040C */  jal        SetMissAnim__Fii
    /* 1034C 80149F44 13000524 */   addiu     $a1, $zero, 0x13
    /* 10350 80149F48 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 10354 80149F4C 21083000 */  addu       $at, $at, $s0
    /* 10358 80149F50 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* 1035C 80149F54 00000000 */  nop
    /* 10360 80149F58 00160200 */  sll        $v0, $v0, 24
    /* 10364 80149F5C 03160200 */  sra        $v0, $v0, 24
    /* 10368 80149F60 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1036C 80149F64 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10370 80149F68 21083000 */  addu       $at, $at, $s0
    /* 10374 80149F6C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L80149F70:
    /* 10378 80149F70 D1EA040C */  jal        PutMissile__Fi
    /* 1037C 80149F74 21202002 */   addu      $a0, $s1, $zero
    /* 10380 80149F78 4400BF8F */  lw         $ra, 0x44($sp)
    /* 10384 80149F7C 4000BE8F */  lw         $fp, 0x40($sp)
    /* 10388 80149F80 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 1038C 80149F84 3800B68F */  lw         $s6, 0x38($sp)
    /* 10390 80149F88 3400B58F */  lw         $s5, 0x34($sp)
    /* 10394 80149F8C 3000B48F */  lw         $s4, 0x30($sp)
    /* 10398 80149F90 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 1039C 80149F94 2800B28F */  lw         $s2, 0x28($sp)
    /* 103A0 80149F98 2400B18F */  lw         $s1, 0x24($sp)
    /* 103A4 80149F9C 2000B08F */  lw         $s0, 0x20($sp)
    /* 103A8 80149FA0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 103AC 80149FA4 0800E003 */  jr         $ra
    /* 103B0 80149FA8 00000000 */   nop
endlabel MI_Element__Fi
