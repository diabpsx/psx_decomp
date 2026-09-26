.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5FillChambers__Fv, 0x6EC

glabel L5FillChambers__Fv
    /* 5A00 8013F5F8 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5A04 8013F5FC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5A08 8013F600 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5A0C 8013F604 09004010 */  beqz       $v0, .L8013F62C
    /* 5A10 8013F608 1800B0AF */   sw        $s0, 0x18($sp)
    /* 5A14 8013F60C 21200000 */  addu       $a0, $zero, $zero
    /* 5A18 8013F610 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5A1C 8013F614 21300000 */  addu       $a2, $zero, $zero
    /* 5A20 8013F618 21380000 */  addu       $a3, $zero, $zero
    /* 5A24 8013F61C 01000224 */  addiu      $v0, $zero, 0x1
    /* 5A28 8013F620 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5A2C 8013F624 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5A30 8013F628 1400A2AF */   sw        $v0, 0x14($sp)
  .L8013F62C:
    /* 5A34 8013F62C 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5A38 8013F630 00000000 */  nop
    /* 5A3C 8013F634 3D004010 */  beqz       $v0, .L8013F72C
    /* 5A40 8013F638 00000000 */   nop
    /* 5A44 8013F63C 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5A48 8013F640 00000000 */  nop
    /* 5A4C 8013F644 10004010 */  beqz       $v0, .L8013F688
    /* 5A50 8013F648 00000000 */   nop
    /* 5A54 8013F64C 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5A58 8013F650 00000000 */  nop
    /* 5A5C 8013F654 08004014 */  bnez       $v0, .L8013F678
    /* 5A60 8013F658 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5A64 8013F65C 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5A68 8013F660 21300000 */  addu       $a2, $zero, $zero
    /* 5A6C 8013F664 21380000 */  addu       $a3, $zero, $zero
    /* 5A70 8013F668 01000224 */  addiu      $v0, $zero, 0x1
    /* 5A74 8013F66C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5A78 8013F670 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5A7C 8013F674 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F678:
    /* 5A80 8013F678 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5A84 8013F67C 00000000 */  nop
    /* 5A88 8013F680 10004014 */  bnez       $v0, .L8013F6C4
    /* 5A8C 8013F684 00000000 */   nop
  .L8013F688:
    /* 5A90 8013F688 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5A94 8013F68C 00000000 */  nop
    /* 5A98 8013F690 08004010 */  beqz       $v0, .L8013F6B4
    /* 5A9C 8013F694 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5AA0 8013F698 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5AA4 8013F69C 21300000 */  addu       $a2, $zero, $zero
    /* 5AA8 8013F6A0 21380000 */  addu       $a3, $zero, $zero
    /* 5AAC 8013F6A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 5AB0 8013F6A8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5AB4 8013F6AC ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5AB8 8013F6B0 1400A2AF */   sw        $v0, 0x14($sp)
  .L8013F6B4:
    /* 5ABC 8013F6B4 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5AC0 8013F6B8 00000000 */  nop
    /* 5AC4 8013F6BC 10004010 */  beqz       $v0, .L8013F700
    /* 5AC8 8013F6C0 00000000 */   nop
  .L8013F6C4:
    /* 5ACC 8013F6C4 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5AD0 8013F6C8 00000000 */  nop
    /* 5AD4 8013F6CC 08004010 */  beqz       $v0, .L8013F6F0
    /* 5AD8 8013F6D0 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5ADC 8013F6D4 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5AE0 8013F6D8 21300000 */  addu       $a2, $zero, $zero
    /* 5AE4 8013F6DC 21380000 */  addu       $a3, $zero, $zero
    /* 5AE8 8013F6E0 01000224 */  addiu      $v0, $zero, 0x1
    /* 5AEC 8013F6E4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5AF0 8013F6E8 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5AF4 8013F6EC 1400A2AF */   sw        $v0, 0x14($sp)
  .L8013F6F0:
    /* 5AF8 8013F6F0 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5AFC 8013F6F4 00000000 */  nop
    /* 5B00 8013F6F8 0C004014 */  bnez       $v0, .L8013F72C
    /* 5B04 8013F6FC 00000000 */   nop
  .L8013F700:
    /* 5B08 8013F700 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5B0C 8013F704 00000000 */  nop
    /* 5B10 8013F708 0C004014 */  bnez       $v0, .L8013F73C
    /* 5B14 8013F70C 1C000424 */   addiu     $a0, $zero, 0x1C
    /* 5B18 8013F710 0E000424 */  addiu      $a0, $zero, 0xE
    /* 5B1C 8013F714 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5B20 8013F718 21300000 */  addu       $a2, $zero, $zero
    /* 5B24 8013F71C 21380000 */  addu       $a3, $zero, $zero
    /* 5B28 8013F720 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5B2C 8013F724 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5B30 8013F728 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F72C:
    /* 5B34 8013F72C 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5B38 8013F730 00000000 */  nop
    /* 5B3C 8013F734 08004010 */  beqz       $v0, .L8013F758
    /* 5B40 8013F738 1C000424 */   addiu     $a0, $zero, 0x1C
  .L8013F73C:
    /* 5B44 8013F73C 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5B48 8013F740 21300000 */  addu       $a2, $zero, $zero
    /* 5B4C 8013F744 21380000 */  addu       $a3, $zero, $zero
    /* 5B50 8013F748 01000224 */  addiu      $v0, $zero, 0x1
    /* 5B54 8013F74C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5B58 8013F750 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5B5C 8013F754 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F758:
    /* 5B60 8013F758 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5B64 8013F75C 00000000 */  nop
    /* 5B68 8013F760 09004010 */  beqz       $v0, .L8013F788
    /* 5B6C 8013F764 00000000 */   nop
    /* 5B70 8013F768 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5B74 8013F76C 00000000 */  nop
    /* 5B78 8013F770 11004010 */  beqz       $v0, .L8013F7B8
    /* 5B7C 8013F774 0C000424 */   addiu     $a0, $zero, 0xC
    /* 5B80 8013F778 12000524 */  addiu      $a1, $zero, 0x12
    /* 5B84 8013F77C 0E000624 */  addiu      $a2, $zero, 0xE
    /* 5B88 8013F780 5DFA040C */  jal        DRLG_L5GHall__Fiiii
    /* 5B8C 8013F784 12000724 */   addiu     $a3, $zero, 0x12
  .L8013F788:
    /* 5B90 8013F788 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5B94 8013F78C 00000000 */  nop
    /* 5B98 8013F790 09004010 */  beqz       $v0, .L8013F7B8
    /* 5B9C 8013F794 00000000 */   nop
    /* 5BA0 8013F798 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5BA4 8013F79C 00000000 */  nop
    /* 5BA8 8013F7A0 05004010 */  beqz       $v0, .L8013F7B8
    /* 5BAC 8013F7A4 1A000424 */   addiu     $a0, $zero, 0x1A
    /* 5BB0 8013F7A8 12000524 */  addiu      $a1, $zero, 0x12
    /* 5BB4 8013F7AC 1C000624 */  addiu      $a2, $zero, 0x1C
    /* 5BB8 8013F7B0 5DFA040C */  jal        DRLG_L5GHall__Fiiii
    /* 5BBC 8013F7B4 12000724 */   addiu     $a3, $zero, 0x12
  .L8013F7B8:
    /* 5BC0 8013F7B8 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5BC4 8013F7BC 00000000 */  nop
    /* 5BC8 8013F7C0 0D004010 */  beqz       $v0, .L8013F7F8
    /* 5BCC 8013F7C4 00000000 */   nop
    /* 5BD0 8013F7C8 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5BD4 8013F7CC 00000000 */  nop
    /* 5BD8 8013F7D0 09004014 */  bnez       $v0, .L8013F7F8
    /* 5BDC 8013F7D4 00000000 */   nop
    /* 5BE0 8013F7D8 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5BE4 8013F7DC 00000000 */  nop
    /* 5BE8 8013F7E0 05004010 */  beqz       $v0, .L8013F7F8
    /* 5BEC 8013F7E4 0C000424 */   addiu     $a0, $zero, 0xC
    /* 5BF0 8013F7E8 12000524 */  addiu      $a1, $zero, 0x12
    /* 5BF4 8013F7EC 1C000624 */  addiu      $a2, $zero, 0x1C
    /* 5BF8 8013F7F0 5DFA040C */  jal        DRLG_L5GHall__Fiiii
    /* 5BFC 8013F7F4 12000724 */   addiu     $a3, $zero, 0x12
  .L8013F7F8:
    /* 5C00 8013F7F8 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5C04 8013F7FC 00000000 */  nop
    /* 5C08 8013F800 07004010 */  beqz       $v0, .L8013F820
    /* 5C0C 8013F804 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5C10 8013F808 21280000 */  addu       $a1, $zero, $zero
    /* 5C14 8013F80C 21300000 */  addu       $a2, $zero, $zero
    /* 5C18 8013F810 01000724 */  addiu      $a3, $zero, 0x1
    /* 5C1C 8013F814 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C20 8013F818 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5C24 8013F81C 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F820:
    /* 5C28 8013F820 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 5C2C 8013F824 00000000 */  nop
    /* 5C30 8013F828 39004010 */  beqz       $v0, .L8013F910
    /* 5C34 8013F82C 00000000 */   nop
    /* 5C38 8013F830 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5C3C 8013F834 00000000 */  nop
    /* 5C40 8013F838 0F004010 */  beqz       $v0, .L8013F878
    /* 5C44 8013F83C 00000000 */   nop
    /* 5C48 8013F840 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5C4C 8013F844 00000000 */  nop
    /* 5C50 8013F848 07004014 */  bnez       $v0, .L8013F868
    /* 5C54 8013F84C 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5C58 8013F850 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5C5C 8013F854 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C60 8013F858 21380000 */  addu       $a3, $zero, $zero
    /* 5C64 8013F85C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C68 8013F860 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5C6C 8013F864 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F868:
    /* 5C70 8013F868 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5C74 8013F86C 00000000 */  nop
    /* 5C78 8013F870 0F004014 */  bnez       $v0, .L8013F8B0
    /* 5C7C 8013F874 00000000 */   nop
  .L8013F878:
    /* 5C80 8013F878 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5C84 8013F87C 00000000 */  nop
    /* 5C88 8013F880 07004010 */  beqz       $v0, .L8013F8A0
    /* 5C8C 8013F884 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5C90 8013F888 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5C94 8013F88C 21300000 */  addu       $a2, $zero, $zero
    /* 5C98 8013F890 01000724 */  addiu      $a3, $zero, 0x1
    /* 5C9C 8013F894 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5CA0 8013F898 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5CA4 8013F89C 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F8A0:
    /* 5CA8 8013F8A0 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5CAC 8013F8A4 00000000 */  nop
    /* 5CB0 8013F8A8 0F004010 */  beqz       $v0, .L8013F8E8
    /* 5CB4 8013F8AC 00000000 */   nop
  .L8013F8B0:
    /* 5CB8 8013F8B0 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5CBC 8013F8B4 00000000 */  nop
    /* 5CC0 8013F8B8 07004010 */  beqz       $v0, .L8013F8D8
    /* 5CC4 8013F8BC 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5CC8 8013F8C0 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5CCC 8013F8C4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5CD0 8013F8C8 01000724 */  addiu      $a3, $zero, 0x1
    /* 5CD4 8013F8CC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5CD8 8013F8D0 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5CDC 8013F8D4 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F8D8:
    /* 5CE0 8013F8D8 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5CE4 8013F8DC 00000000 */  nop
    /* 5CE8 8013F8E0 0B004014 */  bnez       $v0, .L8013F910
    /* 5CEC 8013F8E4 00000000 */   nop
  .L8013F8E8:
    /* 5CF0 8013F8E8 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5CF4 8013F8EC 00000000 */  nop
    /* 5CF8 8013F8F0 0B004014 */  bnez       $v0, .L8013F920
    /* 5CFC 8013F8F4 0E000424 */   addiu     $a0, $zero, 0xE
    /* 5D00 8013F8F8 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5D04 8013F8FC 21300000 */  addu       $a2, $zero, $zero
    /* 5D08 8013F900 21380000 */  addu       $a3, $zero, $zero
    /* 5D0C 8013F904 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5D10 8013F908 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5D14 8013F90C 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F910:
    /* 5D18 8013F910 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5D1C 8013F914 00000000 */  nop
    /* 5D20 8013F918 07004010 */  beqz       $v0, .L8013F938
    /* 5D24 8013F91C 0E000424 */   addiu     $a0, $zero, 0xE
  .L8013F920:
    /* 5D28 8013F920 1C000524 */  addiu      $a1, $zero, 0x1C
    /* 5D2C 8013F924 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D30 8013F928 21380000 */  addu       $a3, $zero, $zero
    /* 5D34 8013F92C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5D38 8013F930 ADF9040C */  jal        DRLG_L5GChamber__Fiiiiii
    /* 5D3C 8013F934 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013F938:
    /* 5D40 8013F938 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5D44 8013F93C 00000000 */  nop
    /* 5D48 8013F940 09004010 */  beqz       $v0, .L8013F968
    /* 5D4C 8013F944 00000000 */   nop
    /* 5D50 8013F948 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 5D54 8013F94C 00000000 */  nop
    /* 5D58 8013F950 11004010 */  beqz       $v0, .L8013F998
    /* 5D5C 8013F954 12000424 */   addiu     $a0, $zero, 0x12
    /* 5D60 8013F958 0C000524 */  addiu      $a1, $zero, 0xC
    /* 5D64 8013F95C 12000624 */  addiu      $a2, $zero, 0x12
    /* 5D68 8013F960 5DFA040C */  jal        DRLG_L5GHall__Fiiii
    /* 5D6C 8013F964 0E000724 */   addiu     $a3, $zero, 0xE
  .L8013F968:
    /* 5D70 8013F968 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 5D74 8013F96C 00000000 */  nop
    /* 5D78 8013F970 09004010 */  beqz       $v0, .L8013F998
    /* 5D7C 8013F974 00000000 */   nop
    /* 5D80 8013F978 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5D84 8013F97C 00000000 */  nop
    /* 5D88 8013F980 05004010 */  beqz       $v0, .L8013F998
    /* 5D8C 8013F984 12000424 */   addiu     $a0, $zero, 0x12
    /* 5D90 8013F988 1A000524 */  addiu      $a1, $zero, 0x1A
    /* 5D94 8013F98C 12000624 */  addiu      $a2, $zero, 0x12
    /* 5D98 8013F990 5DFA040C */  jal        DRLG_L5GHall__Fiiii
    /* 5D9C 8013F994 1C000724 */   addiu     $a3, $zero, 0x1C
  .L8013F998:
    /* 5DA0 8013F998 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5DA4 8013F99C 00000000 */  nop
    /* 5DA8 8013F9A0 0D004010 */  beqz       $v0, .L8013F9D8
    /* 5DAC 8013F9A4 00000000 */   nop
    /* 5DB0 8013F9A8 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 5DB4 8013F9AC 00000000 */  nop
    /* 5DB8 8013F9B0 09004014 */  bnez       $v0, .L8013F9D8
    /* 5DBC 8013F9B4 00000000 */   nop
    /* 5DC0 8013F9B8 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5DC4 8013F9BC 00000000 */  nop
    /* 5DC8 8013F9C0 05004010 */  beqz       $v0, .L8013F9D8
    /* 5DCC 8013F9C4 12000424 */   addiu     $a0, $zero, 0x12
    /* 5DD0 8013F9C8 0C000524 */  addiu      $a1, $zero, 0xC
    /* 5DD4 8013F9CC 12000624 */  addiu      $a2, $zero, 0x12
    /* 5DD8 8013F9D0 5DFA040C */  jal        DRLG_L5GHall__Fiiii
    /* 5DDC 8013F9D4 1C000724 */   addiu     $a3, $zero, 0x1C
  .L8013F9D8:
    /* 5DE0 8013F9D8 1280023C */  lui        $v0, %hi(setloadflag)
    /* 5DE4 8013F9DC F4C04290 */  lbu        $v0, %lo(setloadflag)($v0)
    /* 5DE8 8013F9E0 00000000 */  nop
    /* 5DEC 8013F9E4 BA004010 */  beqz       $v0, .L8013FCD0
    /* 5DF0 8013F9E8 00000000 */   nop
    /* 5DF4 8013F9EC 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5DF8 8013F9F0 00000000 */  nop
    /* 5DFC 8013F9F4 74004014 */  bnez       $v0, .L8013FBC8
    /* 5E00 8013F9F8 01001024 */   addiu     $s0, $zero, 0x1
    /* 5E04 8013F9FC 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 5E08 8013FA00 00000000 */  nop
    /* 5E0C 8013FA04 5B004014 */  bnez       $v0, .L8013FB74
    /* 5E10 8013FA08 00000000 */   nop
    /* 5E14 8013FA0C 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5E18 8013FA10 00000000 */  nop
    /* 5E1C 8013FA14 57004014 */  bnez       $v0, .L8013FB74
    /* 5E20 8013FA18 00000000 */   nop
    /* 5E24 8013FA1C 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5E28 8013FA20 00000000 */  nop
    /* 5E2C 8013FA24 12004014 */  bnez       $v0, .L8013FA70
    /* 5E30 8013FA28 00000000 */   nop
    /* 5E34 8013FA2C 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5E38 8013FA30 00000000 */  nop
    /* 5E3C 8013FA34 0A004010 */  beqz       $v0, .L8013FA60
    /* 5E40 8013FA38 00000000 */   nop
    /* 5E44 8013FA3C 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5E48 8013FA40 00000000 */  nop
    /* 5E4C 8013FA44 06004010 */  beqz       $v0, .L8013FA60
    /* 5E50 8013FA48 00000000 */   nop
    /* 5E54 8013FA4C C9F6000C */  jal        ENG_random__Fl
    /* 5E58 8013FA50 02000424 */   addiu     $a0, $zero, 0x2
    /* 5E5C 8013FA54 02004010 */  beqz       $v0, .L8013FA60
    /* 5E60 8013FA58 00000000 */   nop
    /* 5E64 8013FA5C 02001024 */  addiu      $s0, $zero, 0x2
  .L8013FA60:
    /* 5E68 8013FA60 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5E6C 8013FA64 00000000 */  nop
    /* 5E70 8013FA68 2E004010 */  beqz       $v0, .L8013FB24
    /* 5E74 8013FA6C 01000224 */   addiu     $v0, $zero, 0x1
  .L8013FA70:
    /* 5E78 8013FA70 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5E7C 8013FA74 00000000 */  nop
    /* 5E80 8013FA78 0A004010 */  beqz       $v0, .L8013FAA4
    /* 5E84 8013FA7C 00000000 */   nop
    /* 5E88 8013FA80 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5E8C 8013FA84 00000000 */  nop
    /* 5E90 8013FA88 06004014 */  bnez       $v0, .L8013FAA4
    /* 5E94 8013FA8C 00000000 */   nop
    /* 5E98 8013FA90 C9F6000C */  jal        ENG_random__Fl
    /* 5E9C 8013FA94 02000424 */   addiu     $a0, $zero, 0x2
    /* 5EA0 8013FA98 02004010 */  beqz       $v0, .L8013FAA4
    /* 5EA4 8013FA9C 00000000 */   nop
    /* 5EA8 8013FAA0 21800000 */  addu       $s0, $zero, $zero
  .L8013FAA4:
    /* 5EAC 8013FAA4 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5EB0 8013FAA8 00000000 */  nop
    /* 5EB4 8013FAAC 1D004010 */  beqz       $v0, .L8013FB24
    /* 5EB8 8013FAB0 01000224 */   addiu     $v0, $zero, 0x1
    /* 5EBC 8013FAB4 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5EC0 8013FAB8 00000000 */  nop
    /* 5EC4 8013FABC 09004014 */  bnez       $v0, .L8013FAE4
    /* 5EC8 8013FAC0 00000000 */   nop
    /* 5ECC 8013FAC4 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5ED0 8013FAC8 00000000 */  nop
    /* 5ED4 8013FACC 05004010 */  beqz       $v0, .L8013FAE4
    /* 5ED8 8013FAD0 00000000 */   nop
    /* 5EDC 8013FAD4 C9F6000C */  jal        ENG_random__Fl
    /* 5EE0 8013FAD8 02000424 */   addiu     $a0, $zero, 0x2
    /* 5EE4 8013FADC 0100422C */  sltiu      $v0, $v0, 0x1
    /* 5EE8 8013FAE0 40800200 */  sll        $s0, $v0, 1
  .L8013FAE4:
    /* 5EEC 8013FAE4 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 5EF0 8013FAE8 00000000 */  nop
    /* 5EF4 8013FAEC 0D004010 */  beqz       $v0, .L8013FB24
    /* 5EF8 8013FAF0 01000224 */   addiu     $v0, $zero, 0x1
    /* 5EFC 8013FAF4 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 5F00 8013FAF8 00000000 */  nop
    /* 5F04 8013FAFC 09004010 */  beqz       $v0, .L8013FB24
    /* 5F08 8013FB00 01000224 */   addiu     $v0, $zero, 0x1
    /* 5F0C 8013FB04 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 5F10 8013FB08 00000000 */  nop
    /* 5F14 8013FB0C 05004010 */  beqz       $v0, .L8013FB24
    /* 5F18 8013FB10 01000224 */   addiu     $v0, $zero, 0x1
    /* 5F1C 8013FB14 C9F6000C */  jal        ENG_random__Fl
    /* 5F20 8013FB18 03000424 */   addiu     $a0, $zero, 0x3
    /* 5F24 8013FB1C 21804000 */  addu       $s0, $v0, $zero
    /* 5F28 8013FB20 01000224 */  addiu      $v0, $zero, 0x1
  .L8013FB24:
    /* 5F2C 8013FB24 0E000212 */  beq        $s0, $v0, .L8013FB60
    /* 5F30 8013FB28 0200022A */   slti      $v0, $s0, 0x2
    /* 5F34 8013FB2C 05004010 */  beqz       $v0, .L8013FB44
    /* 5F38 8013FB30 00000000 */   nop
    /* 5F3C 8013FB34 08000012 */  beqz       $s0, .L8013FB58
    /* 5F40 8013FB38 02000424 */   addiu     $a0, $zero, 0x2
    /* 5F44 8013FB3C 34FF0408 */  j          .L8013FCD0
    /* 5F48 8013FB40 00000000 */   nop
  .L8013FB44:
    /* 5F4C 8013FB44 02000224 */  addiu      $v0, $zero, 0x2
    /* 5F50 8013FB48 08000212 */  beq        $s0, $v0, .L8013FB6C
    /* 5F54 8013FB4C 1E000424 */   addiu     $a0, $zero, 0x1E
    /* 5F58 8013FB50 34FF0408 */  j          .L8013FCD0
    /* 5F5C 8013FB54 00000000 */   nop
  .L8013FB58:
    /* 5F60 8013FB58 32FF0408 */  j          .L8013FCC8
    /* 5F64 8013FB5C 10000524 */   addiu     $a1, $zero, 0x10
  .L8013FB60:
    /* 5F68 8013FB60 10000424 */  addiu      $a0, $zero, 0x10
    /* 5F6C 8013FB64 32FF0408 */  j          .L8013FCC8
    /* 5F70 8013FB68 10000524 */   addiu     $a1, $zero, 0x10
  .L8013FB6C:
    /* 5F74 8013FB6C 32FF0408 */  j          .L8013FCC8
    /* 5F78 8013FB70 10000524 */   addiu     $a1, $zero, 0x10
  .L8013FB74:
    /* 5F7C 8013FB74 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5F80 8013FB78 00000000 */  nop
    /* 5F84 8013FB7C 12004014 */  bnez       $v0, .L8013FBC8
    /* 5F88 8013FB80 01001024 */   addiu     $s0, $zero, 0x1
    /* 5F8C 8013FB84 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 5F90 8013FB88 00000000 */  nop
    /* 5F94 8013FB8C 0A004010 */  beqz       $v0, .L8013FBB8
    /* 5F98 8013FB90 00000000 */   nop
    /* 5F9C 8013FB94 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5FA0 8013FB98 00000000 */  nop
    /* 5FA4 8013FB9C 06004010 */  beqz       $v0, .L8013FBB8
    /* 5FA8 8013FBA0 00000000 */   nop
    /* 5FAC 8013FBA4 C9F6000C */  jal        ENG_random__Fl
    /* 5FB0 8013FBA8 02000424 */   addiu     $a0, $zero, 0x2
    /* 5FB4 8013FBAC 02004010 */  beqz       $v0, .L8013FBB8
    /* 5FB8 8013FBB0 00000000 */   nop
    /* 5FBC 8013FBB4 02001024 */  addiu      $s0, $zero, 0x2
  .L8013FBB8:
    /* 5FC0 8013FBB8 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 5FC4 8013FBBC 00000000 */  nop
    /* 5FC8 8013FBC0 2E004010 */  beqz       $v0, .L8013FC7C
    /* 5FCC 8013FBC4 01000224 */   addiu     $v0, $zero, 0x1
  .L8013FBC8:
    /* 5FD0 8013FBC8 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 5FD4 8013FBCC 00000000 */  nop
    /* 5FD8 8013FBD0 0A004010 */  beqz       $v0, .L8013FBFC
    /* 5FDC 8013FBD4 00000000 */   nop
    /* 5FE0 8013FBD8 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 5FE4 8013FBDC 00000000 */  nop
    /* 5FE8 8013FBE0 06004014 */  bnez       $v0, .L8013FBFC
    /* 5FEC 8013FBE4 00000000 */   nop
    /* 5FF0 8013FBE8 C9F6000C */  jal        ENG_random__Fl
    /* 5FF4 8013FBEC 02000424 */   addiu     $a0, $zero, 0x2
    /* 5FF8 8013FBF0 02004010 */  beqz       $v0, .L8013FBFC
    /* 5FFC 8013FBF4 00000000 */   nop
    /* 6000 8013FBF8 21800000 */  addu       $s0, $zero, $zero
  .L8013FBFC:
    /* 6004 8013FBFC 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 6008 8013FC00 00000000 */  nop
    /* 600C 8013FC04 1D004010 */  beqz       $v0, .L8013FC7C
    /* 6010 8013FC08 01000224 */   addiu     $v0, $zero, 0x1
    /* 6014 8013FC0C 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 6018 8013FC10 00000000 */  nop
    /* 601C 8013FC14 09004014 */  bnez       $v0, .L8013FC3C
    /* 6020 8013FC18 00000000 */   nop
    /* 6024 8013FC1C 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 6028 8013FC20 00000000 */  nop
    /* 602C 8013FC24 05004010 */  beqz       $v0, .L8013FC3C
    /* 6030 8013FC28 00000000 */   nop
    /* 6034 8013FC2C C9F6000C */  jal        ENG_random__Fl
    /* 6038 8013FC30 02000424 */   addiu     $a0, $zero, 0x2
    /* 603C 8013FC34 0100422C */  sltiu      $v0, $v0, 0x1
    /* 6040 8013FC38 40800200 */  sll        $s0, $v0, 1
  .L8013FC3C:
    /* 6044 8013FC3C 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 6048 8013FC40 00000000 */  nop
    /* 604C 8013FC44 0D004010 */  beqz       $v0, .L8013FC7C
    /* 6050 8013FC48 01000224 */   addiu     $v0, $zero, 0x1
    /* 6054 8013FC4C 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 6058 8013FC50 00000000 */  nop
    /* 605C 8013FC54 09004010 */  beqz       $v0, .L8013FC7C
    /* 6060 8013FC58 01000224 */   addiu     $v0, $zero, 0x1
    /* 6064 8013FC5C 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 6068 8013FC60 00000000 */  nop
    /* 606C 8013FC64 05004010 */  beqz       $v0, .L8013FC7C
    /* 6070 8013FC68 01000224 */   addiu     $v0, $zero, 0x1
    /* 6074 8013FC6C C9F6000C */  jal        ENG_random__Fl
    /* 6078 8013FC70 03000424 */   addiu     $a0, $zero, 0x3
    /* 607C 8013FC74 21804000 */  addu       $s0, $v0, $zero
    /* 6080 8013FC78 01000224 */  addiu      $v0, $zero, 0x1
  .L8013FC7C:
    /* 6084 8013FC7C 0E000212 */  beq        $s0, $v0, .L8013FCB8
    /* 6088 8013FC80 0200022A */   slti      $v0, $s0, 0x2
    /* 608C 8013FC84 05004010 */  beqz       $v0, .L8013FC9C
    /* 6090 8013FC88 00000000 */   nop
    /* 6094 8013FC8C 08000012 */  beqz       $s0, .L8013FCB0
    /* 6098 8013FC90 10000424 */   addiu     $a0, $zero, 0x10
    /* 609C 8013FC94 34FF0408 */  j          .L8013FCD0
    /* 60A0 8013FC98 00000000 */   nop
  .L8013FC9C:
    /* 60A4 8013FC9C 02000224 */  addiu      $v0, $zero, 0x2
    /* 60A8 8013FCA0 08000212 */  beq        $s0, $v0, .L8013FCC4
    /* 60AC 8013FCA4 10000424 */   addiu     $a0, $zero, 0x10
    /* 60B0 8013FCA8 34FF0408 */  j          .L8013FCD0
    /* 60B4 8013FCAC 00000000 */   nop
  .L8013FCB0:
    /* 60B8 8013FCB0 32FF0408 */  j          .L8013FCC8
    /* 60BC 8013FCB4 02000524 */   addiu     $a1, $zero, 0x2
  .L8013FCB8:
    /* 60C0 8013FCB8 10000424 */  addiu      $a0, $zero, 0x10
    /* 60C4 8013FCBC 32FF0408 */  j          .L8013FCC8
    /* 60C8 8013FCC0 10000524 */   addiu     $a1, $zero, 0x10
  .L8013FCC4:
    /* 60CC 8013FCC4 1E000524 */  addiu      $a1, $zero, 0x1E
  .L8013FCC8:
    /* 60D0 8013FCC8 3EFD040C */  jal        DRLG_L5SetRoom__Fii
    /* 60D4 8013FCCC 00000000 */   nop
  .L8013FCD0:
    /* 60D8 8013FCD0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 60DC 8013FCD4 1800B08F */  lw         $s0, 0x18($sp)
    /* 60E0 8013FCD8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 60E4 8013FCDC 0800E003 */  jr         $ra
    /* 60E8 8013FCE0 00000000 */   nop
endlabel L5FillChambers__Fv
