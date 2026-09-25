.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct, 0x72C

glabel DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct
    /* 87B20 80097B20 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 87B24 80097B24 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 87B28 80097B28 6400B7AF */  sw         $s7, 0x64($sp)
    /* 87B2C 80097B2C 21B8A000 */  addu       $s7, $a1, $zero
    /* 87B30 80097B30 5400B3AF */  sw         $s3, 0x54($sp)
    /* 87B34 80097B34 1280133C */  lui        $s3, %hi(_pcurr_inv)
    /* 87B38 80097B38 D4BB7326 */  addiu      $s3, $s3, %lo(_pcurr_inv)
    /* 87B3C 80097B3C 6C00BFAF */  sw         $ra, 0x6C($sp)
    /* 87B40 80097B40 6800BEAF */  sw         $fp, 0x68($sp)
    /* 87B44 80097B44 6000B6AF */  sw         $s6, 0x60($sp)
    /* 87B48 80097B48 5C00B5AF */  sw         $s5, 0x5C($sp)
    /* 87B4C 80097B4C 5800B4AF */  sw         $s4, 0x58($sp)
    /* 87B50 80097B50 5000B2AF */  sw         $s2, 0x50($sp)
    /* 87B54 80097B54 4800B0AF */  sw         $s0, 0x48($sp)
    /* 87B58 80097B58 3800A6AF */  sw         $a2, 0x38($sp)
    /* 87B5C 80097B5C 0000F28E */  lw         $s2, 0x0($s7)
    /* 87B60 80097B60 0C00E28E */  lw         $v0, 0xC($s7)
    /* 87B64 80097B64 0400F48E */  lw         $s4, 0x4($s7)
    /* 87B68 80097B68 1000E38E */  lw         $v1, 0x10($s7)
    /* 87B6C 80097B6C 21904202 */  addu       $s2, $s2, $v0
    /* 87B70 80097B70 1280023C */  lui        $v0, %hi(sel_data)
    /* 87B74 80097B74 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 87B78 80097B78 21A08302 */  addu       $s4, $s4, $v1
    /* 87B7C 80097B7C 80100200 */  sll        $v0, $v0, 2
    /* 87B80 80097B80 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 87B84 80097B84 21082200 */  addu       $at, $at, $v0
    /* 87B88 80097B88 D4BB238C */  lw         $v1, %lo(_pcurr_inv)($at)
    /* 87B8C 80097B8C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 87B90 80097B90 DF006210 */  beq        $v1, $v0, .L80097F10
    /* 87B94 80097B94 21888000 */   addu      $s1, $a0, $zero
    /* 87B98 80097B98 1406848F */  lw         $a0, %gp_rel(D_8011AD94)($gp)
    /* 87B9C 80097B9C 2406828F */  lw         $v0, %gp_rel(D_8011ADA4)($gp)
    /* 87BA0 80097BA0 1806858F */  lw         $a1, %gp_rel(D_8011AD98)($gp)
    /* 87BA4 80097BA4 2806838F */  lw         $v1, %gp_rel(D_8011ADA8)($gp)
    /* 87BA8 80097BA8 21308200 */  addu       $a2, $a0, $v0
    /* 87BAC 80097BAC 2138A300 */  addu       $a3, $a1, $v1
    /* 87BB0 80097BB0 1C06848F */  lw         $a0, %gp_rel(D_8011AD9C)($gp)
    /* 87BB4 80097BB4 2C06828F */  lw         $v0, %gp_rel(D_8011ADAC)($gp)
    /* 87BB8 80097BB8 2006858F */  lw         $a1, %gp_rel(D_8011ADA0)($gp)
    /* 87BBC 80097BBC 3006838F */  lw         $v1, %gp_rel(D_8011ADB0)($gp)
    /* 87BC0 80097BC0 140686AF */  sw         $a2, %gp_rel(D_8011AD94)($gp)
    /* 87BC4 80097BC4 180687AF */  sw         $a3, %gp_rel(D_8011AD98)($gp)
    /* 87BC8 80097BC8 21208200 */  addu       $a0, $a0, $v0
    /* 87BCC 80097BCC 2128A300 */  addu       $a1, $a1, $v1
    /* 87BD0 80097BD0 4100C228 */  slti       $v0, $a2, 0x41
    /* 87BD4 80097BD4 1C0684AF */  sw         $a0, %gp_rel(D_8011AD9C)($gp)
    /* 87BD8 80097BD8 200685AF */  sw         $a1, %gp_rel(D_8011ADA0)($gp)
    /* 87BDC 80097BDC 04004014 */  bnez       $v0, .L80097BF0
    /* 87BE0 80097BE0 4100E228 */   slti      $v0, $a3, 0x41
    /* 87BE4 80097BE4 FCFF0224 */  addiu      $v0, $zero, -0x4
    /* 87BE8 80097BE8 240682AF */  sw         $v0, %gp_rel(D_8011ADA4)($gp)
    /* 87BEC 80097BEC 4100E228 */  slti       $v0, $a3, 0x41
  .L80097BF0:
    /* 87BF0 80097BF0 04004014 */  bnez       $v0, .L80097C04
    /* 87BF4 80097BF4 41008228 */   slti      $v0, $a0, 0x41
    /* 87BF8 80097BF8 FCFF0224 */  addiu      $v0, $zero, -0x4
    /* 87BFC 80097BFC 280682AF */  sw         $v0, %gp_rel(D_8011ADA8)($gp)
    /* 87C00 80097C00 41008228 */  slti       $v0, $a0, 0x41
  .L80097C04:
    /* 87C04 80097C04 04004014 */  bnez       $v0, .L80097C18
    /* 87C08 80097C08 4100A228 */   slti      $v0, $a1, 0x41
    /* 87C0C 80097C0C FCFF0224 */  addiu      $v0, $zero, -0x4
    /* 87C10 80097C10 2C0682AF */  sw         $v0, %gp_rel(D_8011ADAC)($gp)
    /* 87C14 80097C14 4100A228 */  slti       $v0, $a1, 0x41
  .L80097C18:
    /* 87C18 80097C18 04004014 */  bnez       $v0, .L80097C2C
    /* 87C1C 80097C1C C0FFC228 */   slti      $v0, $a2, -0x40
    /* 87C20 80097C20 FCFF0224 */  addiu      $v0, $zero, -0x4
    /* 87C24 80097C24 300682AF */  sw         $v0, %gp_rel(D_8011ADB0)($gp)
    /* 87C28 80097C28 C0FFC228 */  slti       $v0, $a2, -0x40
  .L80097C2C:
    /* 87C2C 80097C2C 02004010 */  beqz       $v0, .L80097C38
    /* 87C30 80097C30 04000224 */   addiu     $v0, $zero, 0x4
    /* 87C34 80097C34 240682AF */  sw         $v0, %gp_rel(D_8011ADA4)($gp)
  .L80097C38:
    /* 87C38 80097C38 C0FFE228 */  slti       $v0, $a3, -0x40
    /* 87C3C 80097C3C 02004010 */  beqz       $v0, .L80097C48
    /* 87C40 80097C40 04000224 */   addiu     $v0, $zero, 0x4
    /* 87C44 80097C44 280682AF */  sw         $v0, %gp_rel(D_8011ADA8)($gp)
  .L80097C48:
    /* 87C48 80097C48 C0FF8228 */  slti       $v0, $a0, -0x40
    /* 87C4C 80097C4C 02004010 */  beqz       $v0, .L80097C58
    /* 87C50 80097C50 04000224 */   addiu     $v0, $zero, 0x4
    /* 87C54 80097C54 2C0682AF */  sw         $v0, %gp_rel(D_8011ADAC)($gp)
  .L80097C58:
    /* 87C58 80097C58 C0FFA228 */  slti       $v0, $a1, -0x40
    /* 87C5C 80097C5C 02004010 */  beqz       $v0, .L80097C68
    /* 87C60 80097C60 04000224 */   addiu     $v0, $zero, 0x4
    /* 87C64 80097C64 300682AF */  sw         $v0, %gp_rel(D_8011ADB0)($gp)
  .L80097C68:
    /* 87C68 80097C68 9B0F020C */  jal        PRIM_GetNextPolyG4__Fv
    /* 87C6C 80097C6C 00000000 */   nop
    /* 87C70 80097C70 21804000 */  addu       $s0, $v0, $zero
    /* 87C74 80097C74 08000224 */  addiu      $v0, $zero, 0x8
    /* 87C78 80097C78 030002A2 */  sb         $v0, 0x3($s0)
    /* 87C7C 80097C7C 38000224 */  addiu      $v0, $zero, 0x38
    /* 87C80 80097C80 070002A2 */  sb         $v0, 0x7($s0)
    /* 87C84 80097C84 1280033C */  lui        $v1, %hi(sel_data)
    /* 87C88 80097C88 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 87C8C 80097C8C 00000000 */  nop
    /* 87C90 80097C90 80180300 */  sll        $v1, $v1, 2
    /* 87C94 80097C94 21187300 */  addu       $v1, $v1, $s3
    /* 87C98 80097C98 0000648C */  lw         $a0, 0x0($v1)
    /* 87C9C 80097C9C 0A0014A6 */  sh         $s4, 0xA($s0)
    /* 87CA0 80097CA0 00110400 */  sll        $v0, $a0, 4
    /* 87CA4 80097CA4 21104400 */  addu       $v0, $v0, $a0
    /* 87CA8 80097CA8 21104202 */  addu       $v0, $s2, $v0
    /* 87CAC 80097CAC 080002A6 */  sh         $v0, 0x8($s0)
    /* 87CB0 80097CB0 0000648C */  lw         $a0, 0x0($v1)
    /* 87CB4 80097CB4 120014A6 */  sh         $s4, 0x12($s0)
    /* 87CB8 80097CB8 00110400 */  sll        $v0, $a0, 4
    /* 87CBC 80097CBC 21104400 */  addu       $v0, $v0, $a0
    /* 87CC0 80097CC0 21104202 */  addu       $v0, $s2, $v0
    /* 87CC4 80097CC4 11004224 */  addiu      $v0, $v0, 0x11
    /* 87CC8 80097CC8 100002A6 */  sh         $v0, 0x10($s0)
    /* 87CCC 80097CCC 0000648C */  lw         $a0, 0x0($v1)
    /* 87CD0 80097CD0 14008526 */  addiu      $a1, $s4, 0x14
    /* 87CD4 80097CD4 1A0005A6 */  sh         $a1, 0x1A($s0)
    /* 87CD8 80097CD8 00110400 */  sll        $v0, $a0, 4
    /* 87CDC 80097CDC 21104400 */  addu       $v0, $v0, $a0
    /* 87CE0 80097CE0 1406848F */  lw         $a0, %gp_rel(D_8011AD94)($gp)
    /* 87CE4 80097CE4 21104202 */  addu       $v0, $s2, $v0
    /* 87CE8 80097CE8 180002A6 */  sh         $v0, 0x18($s0)
    /* 87CEC 80097CEC 0000638C */  lw         $v1, 0x0($v1)
    /* 87CF0 80097CF0 220005A6 */  sh         $a1, 0x22($s0)
    /* 87CF4 80097CF4 BF008424 */  addiu      $a0, $a0, 0xBF
    /* 87CF8 80097CF8 00240400 */  sll        $a0, $a0, 16
    /* 87CFC 80097CFC 03240400 */  sra        $a0, $a0, 16
    /* 87D00 80097D00 00110300 */  sll        $v0, $v1, 4
    /* 87D04 80097D04 21104300 */  addu       $v0, $v0, $v1
    /* 87D08 80097D08 21104202 */  addu       $v0, $s2, $v0
    /* 87D0C 80097D0C 11004224 */  addiu      $v0, $v0, 0x11
    /* 87D10 80097D10 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87D14 80097D14 200002A6 */   sh        $v0, 0x20($s0)
    /* 87D18 80097D18 21200000 */  addu       $a0, $zero, $zero
    /* 87D1C 80097D1C FF004230 */  andi       $v0, $v0, 0xFF
    /* 87D20 80097D20 42100200 */  srl        $v0, $v0, 1
    /* 87D24 80097D24 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87D28 80097D28 040002A2 */   sb        $v0, 0x4($s0)
    /* 87D2C 80097D2C 050002A2 */  sb         $v0, 0x5($s0)
    /* 87D30 80097D30 1406848F */  lw         $a0, %gp_rel(D_8011AD94)($gp)
    /* 87D34 80097D34 00000000 */  nop
    /* 87D38 80097D38 80008424 */  addiu      $a0, $a0, 0x80
    /* 87D3C 80097D3C 00240400 */  sll        $a0, $a0, 16
    /* 87D40 80097D40 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87D44 80097D44 03240400 */   sra       $a0, $a0, 16
    /* 87D48 80097D48 060002A2 */  sb         $v0, 0x6($s0)
    /* 87D4C 80097D4C 1806848F */  lw         $a0, %gp_rel(D_8011AD98)($gp)
    /* 87D50 80097D50 00000000 */  nop
    /* 87D54 80097D54 BF008424 */  addiu      $a0, $a0, 0xBF
    /* 87D58 80097D58 00240400 */  sll        $a0, $a0, 16
    /* 87D5C 80097D5C BA5E020C */  jal        SpdTrimCol__Fs
    /* 87D60 80097D60 03240400 */   sra       $a0, $a0, 16
    /* 87D64 80097D64 21200000 */  addu       $a0, $zero, $zero
    /* 87D68 80097D68 FF004230 */  andi       $v0, $v0, 0xFF
    /* 87D6C 80097D6C 42100200 */  srl        $v0, $v0, 1
    /* 87D70 80097D70 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87D74 80097D74 0C0002A2 */   sb        $v0, 0xC($s0)
    /* 87D78 80097D78 0D0002A2 */  sb         $v0, 0xD($s0)
    /* 87D7C 80097D7C 1806848F */  lw         $a0, %gp_rel(D_8011AD98)($gp)
    /* 87D80 80097D80 00000000 */  nop
    /* 87D84 80097D84 80008424 */  addiu      $a0, $a0, 0x80
    /* 87D88 80097D88 00240400 */  sll        $a0, $a0, 16
    /* 87D8C 80097D8C BA5E020C */  jal        SpdTrimCol__Fs
    /* 87D90 80097D90 03240400 */   sra       $a0, $a0, 16
    /* 87D94 80097D94 0E0002A2 */  sb         $v0, 0xE($s0)
    /* 87D98 80097D98 1C06848F */  lw         $a0, %gp_rel(D_8011AD9C)($gp)
    /* 87D9C 80097D9C 00000000 */  nop
    /* 87DA0 80097DA0 BF008424 */  addiu      $a0, $a0, 0xBF
    /* 87DA4 80097DA4 00240400 */  sll        $a0, $a0, 16
    /* 87DA8 80097DA8 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87DAC 80097DAC 03240400 */   sra       $a0, $a0, 16
    /* 87DB0 80097DB0 21200000 */  addu       $a0, $zero, $zero
    /* 87DB4 80097DB4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 87DB8 80097DB8 42100200 */  srl        $v0, $v0, 1
    /* 87DBC 80097DBC BA5E020C */  jal        SpdTrimCol__Fs
    /* 87DC0 80097DC0 140002A2 */   sb        $v0, 0x14($s0)
    /* 87DC4 80097DC4 150002A2 */  sb         $v0, 0x15($s0)
    /* 87DC8 80097DC8 1C06848F */  lw         $a0, %gp_rel(D_8011AD9C)($gp)
    /* 87DCC 80097DCC 00000000 */  nop
    /* 87DD0 80097DD0 80008424 */  addiu      $a0, $a0, 0x80
    /* 87DD4 80097DD4 00240400 */  sll        $a0, $a0, 16
    /* 87DD8 80097DD8 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87DDC 80097DDC 03240400 */   sra       $a0, $a0, 16
    /* 87DE0 80097DE0 160002A2 */  sb         $v0, 0x16($s0)
    /* 87DE4 80097DE4 2006848F */  lw         $a0, %gp_rel(D_8011ADA0)($gp)
    /* 87DE8 80097DE8 00000000 */  nop
    /* 87DEC 80097DEC BF008424 */  addiu      $a0, $a0, 0xBF
    /* 87DF0 80097DF0 00240400 */  sll        $a0, $a0, 16
    /* 87DF4 80097DF4 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87DF8 80097DF8 03240400 */   sra       $a0, $a0, 16
    /* 87DFC 80097DFC 21200000 */  addu       $a0, $zero, $zero
    /* 87E00 80097E00 FF004230 */  andi       $v0, $v0, 0xFF
    /* 87E04 80097E04 42100200 */  srl        $v0, $v0, 1
    /* 87E08 80097E08 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87E0C 80097E0C 1C0002A2 */   sb        $v0, 0x1C($s0)
    /* 87E10 80097E10 1D0002A2 */  sb         $v0, 0x1D($s0)
    /* 87E14 80097E14 2006848F */  lw         $a0, %gp_rel(D_8011ADA0)($gp)
    /* 87E18 80097E18 00000000 */  nop
    /* 87E1C 80097E1C 80008424 */  addiu      $a0, $a0, 0x80
    /* 87E20 80097E20 00240400 */  sll        $a0, $a0, 16
    /* 87E24 80097E24 BA5E020C */  jal        SpdTrimCol__Fs
    /* 87E28 80097E28 03240400 */   sra       $a0, $a0, 16
    /* 87E2C 80097E2C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
    /* 87E30 80097E30 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
    /* 87E34 80097E34 0000038E */  lw         $v1, 0x0($s0)
    /* 87E38 80097E38 00FF053C */  lui        $a1, (0xFF000000 >> 16)
    /* 87E3C 80097E3C 1E0002A2 */  sb         $v0, 0x1E($s0)
    /* 87E40 80097E40 1800228E */  lw         $v0, 0x18($s1)
    /* 87E44 80097E44 1280063C */  lui        $a2, %hi(ThisOt)
    /* 87E48 80097E48 B4AAC68C */  lw         $a2, %lo(ThisOt)($a2)
    /* 87E4C 80097E4C 80100200 */  sll        $v0, $v0, 2
    /* 87E50 80097E50 21104600 */  addu       $v0, $v0, $a2
    /* 87E54 80097E54 F8FF428C */  lw         $v0, -0x8($v0)
    /* 87E58 80097E58 24186500 */  and        $v1, $v1, $a1
    /* 87E5C 80097E5C 24104400 */  and        $v0, $v0, $a0
    /* 87E60 80097E60 25186200 */  or         $v1, $v1, $v0
    /* 87E64 80097E64 000003AE */  sw         $v1, 0x0($s0)
    /* 87E68 80097E68 1800238E */  lw         $v1, 0x18($s1)
    /* 87E6C 80097E6C 24800402 */  and        $s0, $s0, $a0
    /* 87E70 80097E70 80180300 */  sll        $v1, $v1, 2
    /* 87E74 80097E74 21186600 */  addu       $v1, $v1, $a2
    /* 87E78 80097E78 F8FF628C */  lw         $v0, -0x8($v1)
    /* 87E7C 80097E7C 1280043C */  lui        $a0, %hi(sel_data)
    /* 87E80 80097E80 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 87E84 80097E84 24104500 */  and        $v0, $v0, $a1
    /* 87E88 80097E88 25105000 */  or         $v0, $v0, $s0
    /* 87E8C 80097E8C F8FF62AC */  sw         $v0, -0x8($v1)
    /* 87E90 80097E90 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 87E94 80097E94 21082400 */  addu       $at, $at, $a0
    /* 87E98 80097E98 C4BB2290 */  lbu        $v0, %lo(_SpdBeltSelFlag)($at)
    /* 87E9C 80097E9C 00000000 */  nop
    /* 87EA0 80097EA0 1B004010 */  beqz       $v0, .L80097F10
    /* 87EA4 80097EA4 0D008526 */   addiu     $a1, $s4, 0xD
    /* 87EA8 80097EA8 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 87EAC 80097EAC 40000724 */  addiu      $a3, $zero, 0x40
    /* 87EB0 80097EB0 80100400 */  sll        $v0, $a0, 2
    /* 87EB4 80097EB4 21105300 */  addu       $v0, $v0, $s3
    /* 87EB8 80097EB8 0000488C */  lw         $t0, 0x0($v0)
    /* 87EBC 80097EBC F0000224 */  addiu      $v0, $zero, 0xF0
    /* 87EC0 80097EC0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 87EC4 80097EC4 20000224 */  addiu      $v0, $zero, 0x20
    /* 87EC8 80097EC8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 87ECC 80097ECC 60000224 */  addiu      $v0, $zero, 0x60
    /* 87ED0 80097ED0 1800A2AF */  sw         $v0, 0x18($sp)
    /* 87ED4 80097ED4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 87ED8 80097ED8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 87EDC 80097EDC 1800238E */  lw         $v1, 0x18($s1)
    /* 87EE0 80097EE0 01000224 */  addiu      $v0, $zero, 0x1
    /* 87EE4 80097EE4 2800A2AF */  sw         $v0, 0x28($sp)
    /* 87EE8 80097EE8 08000224 */  addiu      $v0, $zero, 0x8
    /* 87EEC 80097EEC 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 87EF0 80097EF0 3000A2AF */  sw         $v0, 0x30($sp)
    /* 87EF4 80097EF4 00210800 */  sll        $a0, $t0, 4
    /* 87EF8 80097EF8 21208800 */  addu       $a0, $a0, $t0
    /* 87EFC 80097EFC 21204402 */  addu       $a0, $s2, $a0
    /* 87F00 80097F00 05008424 */  addiu      $a0, $a0, 0x5
    /* 87F04 80097F04 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 87F08 80097F08 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 87F0C 80097F0C 2400A3AF */   sw        $v1, 0x24($sp)
  .L80097F10:
    /* 87F10 80097F10 99000524 */  addiu      $a1, $zero, 0x99
    /* 87F14 80097F14 21A84002 */  addu       $s5, $s2, $zero
    /* 87F18 80097F18 2130A002 */  addu       $a2, $s5, $zero
    /* 87F1C 80097F1C 21B08002 */  addu       $s6, $s4, $zero
    /* 87F20 80097F20 2138C002 */  addu       $a3, $s6, $zero
    /* 87F24 80097F24 1000A0AF */  sw         $zero, 0x10($sp)
    /* 87F28 80097F28 1800228E */  lw         $v0, 0x18($s1)
    /* 87F2C 80097F2C 1100B226 */  addiu      $s2, $s5, 0x11
    /* 87F30 80097F30 1800A0AF */  sw         $zero, 0x18($sp)
    /* 87F34 80097F34 1400A2AF */  sw         $v0, 0x14($sp)
    /* 87F38 80097F38 1400248E */  lw         $a0, 0x14($s1)
    /* 87F3C 80097F3C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 87F40 80097F40 21980000 */   addu      $s3, $zero, $zero
    /* 87F44 80097F44 9A000524 */  addiu      $a1, $zero, 0x9A
    /* 87F48 80097F48 1000A0AF */  sw         $zero, 0x10($sp)
    /* 87F4C 80097F4C 1800228E */  lw         $v0, 0x18($s1)
    /* 87F50 80097F50 2130A002 */  addu       $a2, $s5, $zero
    /* 87F54 80097F54 1800A0AF */  sw         $zero, 0x18($sp)
    /* 87F58 80097F58 1400A2AF */  sw         $v0, 0x14($sp)
    /* 87F5C 80097F5C 1400248E */  lw         $a0, 0x14($s1)
    /* 87F60 80097F60 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 87F64 80097F64 2138C002 */   addu      $a3, $s6, $zero
    /* 87F68 80097F68 9B000524 */  addiu      $a1, $zero, 0x9B
    /* 87F6C 80097F6C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 87F70 80097F70 1800228E */  lw         $v0, 0x18($s1)
    /* 87F74 80097F74 2130A002 */  addu       $a2, $s5, $zero
    /* 87F78 80097F78 1800A0AF */  sw         $zero, 0x18($sp)
    /* 87F7C 80097F7C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 87F80 80097F80 1400248E */  lw         $a0, 0x14($s1)
    /* 87F84 80097F84 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 87F88 80097F88 2138C002 */   addu      $a3, $s6, $zero
    /* 87F8C 80097F8C 9C000524 */  addiu      $a1, $zero, 0x9C
    /* 87F90 80097F90 1000A0AF */  sw         $zero, 0x10($sp)
    /* 87F94 80097F94 1800228E */  lw         $v0, 0x18($s1)
    /* 87F98 80097F98 2130A002 */  addu       $a2, $s5, $zero
    /* 87F9C 80097F9C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 87FA0 80097FA0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 87FA4 80097FA4 1400248E */  lw         $a0, 0x14($s1)
    /* 87FA8 80097FA8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 87FAC 80097FAC 2138C002 */   addu      $a3, $s6, $zero
    /* 87FB0 80097FB0 9D000524 */  addiu      $a1, $zero, 0x9D
  .L80097FB4:
    /* 87FB4 80097FB4 21304002 */  addu       $a2, $s2, $zero
    /* 87FB8 80097FB8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 87FBC 80097FBC 1800228E */  lw         $v0, 0x18($s1)
    /* 87FC0 80097FC0 21388002 */  addu       $a3, $s4, $zero
    /* 87FC4 80097FC4 1800A0AF */  sw         $zero, 0x18($sp)
    /* 87FC8 80097FC8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 87FCC 80097FCC 1400248E */  lw         $a0, 0x14($s1)
    /* 87FD0 80097FD0 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 87FD4 80097FD4 01007326 */   addiu     $s3, $s3, 0x1
    /* 87FD8 80097FD8 9E000524 */  addiu      $a1, $zero, 0x9E
    /* 87FDC 80097FDC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 87FE0 80097FE0 1800228E */  lw         $v0, 0x18($s1)
    /* 87FE4 80097FE4 21304002 */  addu       $a2, $s2, $zero
    /* 87FE8 80097FE8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 87FEC 80097FEC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 87FF0 80097FF0 1400248E */  lw         $a0, 0x14($s1)
    /* 87FF4 80097FF4 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 87FF8 80097FF8 21388002 */   addu      $a3, $s4, $zero
    /* 87FFC 80097FFC 9F000524 */  addiu      $a1, $zero, 0x9F
    /* 88000 80098000 1000A0AF */  sw         $zero, 0x10($sp)
    /* 88004 80098004 1800228E */  lw         $v0, 0x18($s1)
    /* 88008 80098008 21304002 */  addu       $a2, $s2, $zero
    /* 8800C 8009800C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 88010 80098010 1400A2AF */  sw         $v0, 0x14($sp)
    /* 88014 80098014 1400248E */  lw         $a0, 0x14($s1)
    /* 88018 80098018 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 8801C 8009801C 21388002 */   addu      $a3, $s4, $zero
    /* 88020 80098020 A0000524 */  addiu      $a1, $zero, 0xA0
    /* 88024 80098024 21304002 */  addu       $a2, $s2, $zero
    /* 88028 80098028 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8802C 8009802C 1800228E */  lw         $v0, 0x18($s1)
    /* 88030 80098030 21388002 */  addu       $a3, $s4, $zero
    /* 88034 80098034 1800A0AF */  sw         $zero, 0x18($sp)
    /* 88038 80098038 1400A2AF */  sw         $v0, 0x14($sp)
    /* 8803C 8009803C 1400248E */  lw         $a0, 0x14($s1)
    /* 88040 80098040 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 88044 80098044 11005226 */   addiu     $s2, $s2, 0x11
    /* 88048 80098048 0600622A */  slti       $v0, $s3, 0x6
    /* 8804C 8009804C D9FF4014 */  bnez       $v0, .L80097FB4
    /* 88050 80098050 9D000524 */   addiu     $a1, $zero, 0x9D
    /* 88054 80098054 A1000524 */  addiu      $a1, $zero, 0xA1
    /* 88058 80098058 21304002 */  addu       $a2, $s2, $zero
    /* 8805C 8009805C 21388002 */  addu       $a3, $s4, $zero
    /* 88060 80098060 1000A0AF */  sw         $zero, 0x10($sp)
    /* 88064 80098064 1800228E */  lw         $v0, 0x18($s1)
    /* 88068 80098068 11801E3C */  lui        $fp, %hi(InvGfxTable)
    /* 8806C 8009806C 78D2DE27 */  addiu      $fp, $fp, %lo(InvGfxTable)
    /* 88070 80098070 1800A0AF */  sw         $zero, 0x18($sp)
    /* 88074 80098074 1400A2AF */  sw         $v0, 0x14($sp)
    /* 88078 80098078 1400248E */  lw         $a0, 0x14($s1)
    /* 8807C 8009807C 3800B08F */  lw         $s0, 0x38($sp)
    /* 88080 80098080 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 88084 80098084 21980000 */   addu      $s3, $zero, $zero
    /* 88088 80098088 A2000524 */  addiu      $a1, $zero, 0xA2
    /* 8808C 8009808C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 88090 80098090 1800228E */  lw         $v0, 0x18($s1)
    /* 88094 80098094 21304002 */  addu       $a2, $s2, $zero
    /* 88098 80098098 1800A0AF */  sw         $zero, 0x18($sp)
    /* 8809C 8009809C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 880A0 800980A0 1400248E */  lw         $a0, 0x14($s1)
    /* 880A4 800980A4 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 880A8 800980A8 21388002 */   addu      $a3, $s4, $zero
    /* 880AC 800980AC A3000524 */  addiu      $a1, $zero, 0xA3
    /* 880B0 800980B0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 880B4 800980B4 1800228E */  lw         $v0, 0x18($s1)
    /* 880B8 800980B8 21304002 */  addu       $a2, $s2, $zero
    /* 880BC 800980BC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 880C0 800980C0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 880C4 800980C4 1400248E */  lw         $a0, 0x14($s1)
    /* 880C8 800980C8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 880CC 800980CC 21388002 */   addu      $a3, $s4, $zero
    /* 880D0 800980D0 A4000524 */  addiu      $a1, $zero, 0xA4
    /* 880D4 800980D4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 880D8 800980D8 1800228E */  lw         $v0, 0x18($s1)
    /* 880DC 800980DC 21304002 */  addu       $a2, $s2, $zero
    /* 880E0 800980E0 1800A0AF */  sw         $zero, 0x18($sp)
    /* 880E4 800980E4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 880E8 800980E8 1400248E */  lw         $a0, 0x14($s1)
    /* 880EC 800980EC 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 880F0 800980F0 21388002 */   addu      $a3, $s4, $zero
    /* 880F4 800980F4 0000F28E */  lw         $s2, 0x0($s7)
    /* 880F8 800980F8 0400F48E */  lw         $s4, 0x4($s7)
    /* 880FC 800980FC 0C00E38E */  lw         $v1, 0xC($s7)
    /* 88100 80098100 02004226 */  addiu      $v0, $s2, 0x2
    /* 88104 80098104 21904300 */  addu       $s2, $v0, $v1
    /* 88108 80098108 1000E38E */  lw         $v1, 0x10($s7)
    /* 8810C 8009810C 02008226 */  addiu      $v0, $s4, 0x2
    /* 88110 80098110 21A04300 */  addu       $s4, $v0, $v1
  .L80098114:
    /* 88114 80098114 DC150386 */  lh         $v1, 0x15DC($s0)
    /* 88118 80098118 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 8811C 8009811C 0D006210 */  beq        $v1, $v0, .L80098154
    /* 88120 80098120 21304002 */   addu      $a2, $s2, $zero
    /* 88124 80098124 FC150392 */  lbu        $v1, 0x15FC($s0)
    /* 88128 80098128 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8812C 8009812C 1800228E */  lw         $v0, 0x18($s1)
    /* 88130 80098130 1800A0AF */  sw         $zero, 0x18($sp)
    /* 88134 80098134 01004224 */  addiu      $v0, $v0, 0x1
    /* 88138 80098138 80180300 */  sll        $v1, $v1, 2
    /* 8813C 8009813C 21187E00 */  addu       $v1, $v1, $fp
    /* 88140 80098140 1400A2AF */  sw         $v0, 0x14($sp)
    /* 88144 80098144 1400248E */  lw         $a0, 0x14($s1)
    /* 88148 80098148 0000658C */  lw         $a1, 0x0($v1)
    /* 8814C 8009814C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 88150 80098150 21388002 */   addu      $a3, $s4, $zero
  .L80098154:
    /* 88154 80098154 11005226 */  addiu      $s2, $s2, 0x11
    /* 88158 80098158 01007326 */  addiu      $s3, $s3, 0x1
    /* 8815C 8009815C 0800622A */  slti       $v0, $s3, 0x8
    /* 88160 80098160 ECFF4014 */  bnez       $v0, .L80098114
    /* 88164 80098164 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 88168 80098168 94000524 */  addiu      $a1, $zero, 0x94
    /* 8816C 8009816C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 88170 80098170 1800228E */  lw         $v0, 0x18($s1)
    /* 88174 80098174 2130A002 */  addu       $a2, $s5, $zero
    /* 88178 80098178 1800A0AF */  sw         $zero, 0x18($sp)
    /* 8817C 8009817C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 88180 80098180 1400A2AF */  sw         $v0, 0x14($sp)
    /* 88184 80098184 1400248E */  lw         $a0, 0x14($s1)
    /* 88188 80098188 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 8818C 8009818C 2138C002 */   addu      $a3, $s6, $zero
    /* 88190 80098190 0100A326 */  addiu      $v1, $s5, 0x1
    /* 88194 80098194 080043A4 */  sh         $v1, 0x8($v0)
    /* 88198 80098198 180043A4 */  sh         $v1, 0x18($v0)
    /* 8819C 8009819C 1400C326 */  addiu      $v1, $s6, 0x14
    /* 881A0 800981A0 1A0043A4 */  sh         $v1, 0x1A($v0)
    /* 881A4 800981A4 220043A4 */  sh         $v1, 0x22($v0)
    /* 881A8 800981A8 14000324 */  addiu      $v1, $zero, 0x14
    /* 881AC 800981AC 040043A0 */  sb         $v1, 0x4($v0)
    /* 881B0 800981B0 050043A0 */  sb         $v1, 0x5($v0)
    /* 881B4 800981B4 060043A0 */  sb         $v1, 0x6($v0)
    /* 881B8 800981B8 0C004390 */  lbu        $v1, 0xC($v0)
    /* 881BC 800981BC 8900A426 */  addiu      $a0, $s5, 0x89
    /* 881C0 800981C0 100044A4 */  sh         $a0, 0x10($v0)
    /* 881C4 800981C4 200044A4 */  sh         $a0, 0x20($v0)
    /* 881C8 800981C8 0C004490 */  lbu        $a0, 0xC($v0)
    /* 881CC 800981CC 0A0056A4 */  sh         $s6, 0xA($v0)
    /* 881D0 800981D0 120056A4 */  sh         $s6, 0x12($v0)
    /* 881D4 800981D4 01006324 */  addiu      $v1, $v1, 0x1
    /* 881D8 800981D8 140043A0 */  sb         $v1, 0x14($v0)
    /* 881DC 800981DC 0D004390 */  lbu        $v1, 0xD($v0)
    /* 881E0 800981E0 01008424 */  addiu      $a0, $a0, 0x1
    /* 881E4 800981E4 240044A0 */  sb         $a0, 0x24($v0)
    /* 881E8 800981E8 0D004490 */  lbu        $a0, 0xD($v0)
    /* 881EC 800981EC 01006324 */  addiu      $v1, $v1, 0x1
    /* 881F0 800981F0 1D0043A0 */  sb         $v1, 0x1D($v0)
    /* 881F4 800981F4 16004394 */  lhu        $v1, 0x16($v0)
    /* 881F8 800981F8 01008424 */  addiu      $a0, $a0, 0x1
    /* 881FC 800981FC 250044A0 */  sb         $a0, 0x25($v0)
    /* 88200 80098200 07004490 */  lbu        $a0, 0x7($v0)
    /* 88204 80098204 40006334 */  ori        $v1, $v1, 0x40
    /* 88208 80098208 02008434 */  ori        $a0, $a0, 0x2
    /* 8820C 8009820C FE008430 */  andi       $a0, $a0, 0xFE
    /* 88210 80098210 160043A4 */  sh         $v1, 0x16($v0)
    /* 88214 80098214 070044A0 */  sb         $a0, 0x7($v0)
    /* 88218 80098218 6C00BF8F */  lw         $ra, 0x6C($sp)
    /* 8821C 8009821C 6800BE8F */  lw         $fp, 0x68($sp)
    /* 88220 80098220 6400B78F */  lw         $s7, 0x64($sp)
    /* 88224 80098224 6000B68F */  lw         $s6, 0x60($sp)
    /* 88228 80098228 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 8822C 8009822C 5800B48F */  lw         $s4, 0x58($sp)
    /* 88230 80098230 5400B38F */  lw         $s3, 0x54($sp)
    /* 88234 80098234 5000B28F */  lw         $s2, 0x50($sp)
    /* 88238 80098238 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 8823C 8009823C 4800B08F */  lw         $s0, 0x48($sp)
    /* 88240 80098240 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 88244 80098244 0800E003 */  jr         $ra
    /* 88248 80098248 00000000 */   nop
endlabel DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct
