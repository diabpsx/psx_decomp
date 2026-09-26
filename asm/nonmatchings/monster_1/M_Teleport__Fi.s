.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_Teleport__Fi, 0x214

glabel M_Teleport__Fi
    /* 14CA8 8014E8A0 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 14CAC 8014E8A4 4800BEAF */  sw         $fp, 0x48($sp)
    /* 14CB0 8014E8A8 21F08000 */  addu       $fp, $a0, $zero
    /* 14CB4 8014E8AC 4000B6AF */  sw         $s6, 0x40($sp)
    /* 14CB8 8014E8B0 21B00000 */  addu       $s6, $zero, $zero
    /* 14CBC 8014E8B4 4400B7AF */  sw         $s7, 0x44($sp)
    /* 14CC0 8014E8B8 21B80000 */  addu       $s7, $zero, $zero
    /* 14CC4 8014E8BC 3400B3AF */  sw         $s3, 0x34($sp)
    /* 14CC8 8014E8C0 40101E00 */  sll        $v0, $fp, 1
    /* 14CCC 8014E8C4 21105E00 */  addu       $v0, $v0, $fp
    /* 14CD0 8014E8C8 80100200 */  sll        $v0, $v0, 2
    /* 14CD4 8014E8CC 21105E00 */  addu       $v0, $v0, $fp
    /* 14CD8 8014E8D0 C0100200 */  sll        $v0, $v0, 3
    /* 14CDC 8014E8D4 1080033C */  lui        $v1, %hi(monster)
    /* 14CE0 8014E8D8 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 14CE4 8014E8DC 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 14CE8 8014E8E0 21A84300 */  addu       $s5, $v0, $v1
    /* 14CEC 8014E8E4 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 14CF0 8014E8E8 3800B4AF */  sw         $s4, 0x38($sp)
    /* 14CF4 8014E8EC 3000B2AF */  sw         $s2, 0x30($sp)
    /* 14CF8 8014E8F0 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 14CFC 8014E8F4 2800B0AF */  sw         $s0, 0x28($sp)
    /* 14D00 8014E8F8 3300A382 */  lb         $v1, 0x33($s5)
    /* 14D04 8014E8FC 0F000224 */  addiu      $v0, $zero, 0xF
    /* 14D08 8014E900 5F006210 */  beq        $v1, $v0, .L8014EA80
    /* 14D0C 8014E904 21980000 */   addu      $s3, $zero, $zero
    /* 14D10 8014E908 4A00B092 */  lbu        $s0, 0x4A($s5)
    /* 14D14 8014E90C 4B00A792 */  lbu        $a3, 0x4B($s5)
    /* 14D18 8014E910 02000424 */  addiu      $a0, $zero, 0x2
    /* 14D1C 8014E914 C9F6000C */  jal        ENG_random__Fl
    /* 14D20 8014E918 1800A7AF */   sw        $a3, 0x18($sp)
    /* 14D24 8014E91C 02000424 */  addiu      $a0, $zero, 0x2
    /* 14D28 8014E920 40100200 */  sll        $v0, $v0, 1
    /* 14D2C 8014E924 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 14D30 8014E928 C9F6000C */  jal        ENG_random__Fl
    /* 14D34 8014E92C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 14D38 8014E930 40100200 */  sll        $v0, $v0, 1
    /* 14D3C 8014E934 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 14D40 8014E938 1000A78F */  lw         $a3, 0x10($sp)
    /* 14D44 8014E93C FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 14D48 8014E940 23A00702 */  subu       $s4, $s0, $a3
  .L8014E944:
    /* 14D4C 8014E944 FF00C232 */  andi       $v0, $s6, 0xFF
    /* 14D50 8014E948 26004014 */  bnez       $v0, .L8014E9E4
    /* 14D54 8014E94C FFFF1024 */   addiu     $s0, $zero, -0x1
    /* 14D58 8014E950 1800A78F */  lw         $a3, 0x18($sp)
    /* 14D5C 8014E954 00000000 */  nop
    /* 14D60 8014E958 2388E300 */  subu       $s1, $a3, $v1
  .L8014E95C:
    /* 14D64 8014E95C 03004016 */  bnez       $s2, .L8014E96C
    /* 14D68 8014E960 00000000 */   nop
    /* 14D6C 8014E964 19000012 */  beqz       $s0, .L8014E9CC
    /* 14D70 8014E968 00000000 */   nop
  .L8014E96C:
    /* 14D74 8014E96C 21B82002 */  addu       $s7, $s1, $zero
    /* 14D78 8014E970 6200222E */  sltiu      $v0, $s1, 0x62
    /* 14D7C 8014E974 15004010 */  beqz       $v0, .L8014E9CC
    /* 14D80 8014E978 21988002 */   addu      $s3, $s4, $zero
    /* 14D84 8014E97C 6200622E */  sltiu      $v0, $s3, 0x62
    /* 14D88 8014E980 12004010 */  beqz       $v0, .L8014E9CC
    /* 14D8C 8014E984 00000000 */   nop
    /* 14D90 8014E988 3400A282 */  lb         $v0, 0x34($s5)
    /* 14D94 8014E98C 00000000 */  nop
    /* 14D98 8014E990 0E006212 */  beq        $s3, $v0, .L8014E9CC
    /* 14D9C 8014E994 00000000 */   nop
    /* 14DA0 8014E998 3500A282 */  lb         $v0, 0x35($s5)
    /* 14DA4 8014E99C 00000000 */  nop
    /* 14DA8 8014E9A0 0A00E212 */  beq        $s7, $v0, .L8014E9CC
    /* 14DAC 8014E9A4 2120C003 */   addu      $a0, $fp, $zero
    /* 14DB0 8014E9A8 21286002 */  addu       $a1, $s3, $zero
    /* 14DB4 8014E9AC 2130E002 */  addu       $a2, $s7, $zero
    /* 14DB8 8014E9B0 1701020C */  jal        PosOkMonst__Fiii
    /* 14DBC 8014E9B4 2000A3AF */   sw        $v1, 0x20($sp)
    /* 14DC0 8014E9B8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 14DC4 8014E9BC 2000A38F */  lw         $v1, 0x20($sp)
    /* 14DC8 8014E9C0 02004010 */  beqz       $v0, .L8014E9CC
    /* 14DCC 8014E9C4 00000000 */   nop
    /* 14DD0 8014E9C8 01001624 */  addiu      $s6, $zero, 0x1
  .L8014E9CC:
    /* 14DD4 8014E9CC 01001026 */  addiu      $s0, $s0, 0x1
    /* 14DD8 8014E9D0 0400001E */  bgtz       $s0, .L8014E9E4
    /* 14DDC 8014E9D4 21882302 */   addu      $s1, $s1, $v1
    /* 14DE0 8014E9D8 FF00C232 */  andi       $v0, $s6, 0xFF
    /* 14DE4 8014E9DC DFFF4010 */  beqz       $v0, .L8014E95C
    /* 14DE8 8014E9E0 00000000 */   nop
  .L8014E9E4:
    /* 14DEC 8014E9E4 1000A78F */  lw         $a3, 0x10($sp)
    /* 14DF0 8014E9E8 01005226 */  addiu      $s2, $s2, 0x1
    /* 14DF4 8014E9EC 0200422A */  slti       $v0, $s2, 0x2
    /* 14DF8 8014E9F0 04004010 */  beqz       $v0, .L8014EA04
    /* 14DFC 8014E9F4 21A08702 */   addu      $s4, $s4, $a3
    /* 14E00 8014E9F8 FF00C232 */  andi       $v0, $s6, 0xFF
    /* 14E04 8014E9FC D1FF4010 */  beqz       $v0, .L8014E944
    /* 14E08 8014EA00 00000000 */   nop
  .L8014EA04:
    /* 14E0C 8014EA04 FF00C232 */  andi       $v0, $s6, 0xFF
    /* 14E10 8014EA08 1D004010 */  beqz       $v0, .L8014EA80
    /* 14E14 8014EA0C 00000000 */   nop
    /* 14E18 8014EA10 D7FC010C */  jal        M_ClearSquares__Fi
    /* 14E1C 8014EA14 2120C003 */   addu      $a0, $fp, $zero
    /* 14E20 8014EA18 2120C003 */  addu       $a0, $fp, $zero
    /* 14E24 8014EA1C 3500A382 */  lb         $v1, 0x35($s5)
    /* 14E28 8014EA20 3400A582 */  lb         $a1, 0x34($s5)
    /* 14E2C 8014EA24 C0180300 */  sll        $v1, $v1, 3
    /* 14E30 8014EA28 C0100500 */  sll        $v0, $a1, 3
    /* 14E34 8014EA2C 23104500 */  subu       $v0, $v0, $a1
    /* 14E38 8014EA30 C0110200 */  sll        $v0, $v0, 7
    /* 14E3C 8014EA34 21186200 */  addu       $v1, $v1, $v0
    /* 14E40 8014EA38 0E80013C */  lui        $at, %hi(dung_map)
    /* 14E44 8014EA3C 21082300 */  addu       $at, $at, $v1
    /* 14E48 8014EA40 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 14E4C 8014EA44 C0181700 */  sll        $v1, $s7, 3
    /* 14E50 8014EA48 C0101300 */  sll        $v0, $s3, 3
    /* 14E54 8014EA4C 23105300 */  subu       $v0, $v0, $s3
    /* 14E58 8014EA50 C0110200 */  sll        $v0, $v0, 7
    /* 14E5C 8014EA54 21186200 */  addu       $v1, $v1, $v0
    /* 14E60 8014EA58 0100C227 */  addiu      $v0, $fp, 0x1
    /* 14E64 8014EA5C 0E80013C */  lui        $at, %hi(dung_map)
    /* 14E68 8014EA60 21082300 */  addu       $at, $at, $v1
    /* 14E6C 8014EA64 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 14E70 8014EA68 3800B3A2 */  sb         $s3, 0x38($s5)
    /* 14E74 8014EA6C EB2A050C */  jal        M_GetDir__Fi
    /* 14E78 8014EA70 3900B7A2 */   sb        $s7, 0x39($s5)
    /* 14E7C 8014EA74 2120C003 */  addu       $a0, $fp, $zero
    /* 14E80 8014EA78 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 14E84 8014EA7C 3C00A2A2 */   sb        $v0, 0x3C($s5)
  .L8014EA80:
    /* 14E88 8014EA80 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 14E8C 8014EA84 4800BE8F */  lw         $fp, 0x48($sp)
    /* 14E90 8014EA88 4400B78F */  lw         $s7, 0x44($sp)
    /* 14E94 8014EA8C 4000B68F */  lw         $s6, 0x40($sp)
    /* 14E98 8014EA90 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 14E9C 8014EA94 3800B48F */  lw         $s4, 0x38($sp)
    /* 14EA0 8014EA98 3400B38F */  lw         $s3, 0x34($sp)
    /* 14EA4 8014EA9C 3000B28F */  lw         $s2, 0x30($sp)
    /* 14EA8 8014EAA0 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 14EAC 8014EAA4 2800B08F */  lw         $s0, 0x28($sp)
    /* 14EB0 8014EAA8 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 14EB4 8014EAAC 0800E003 */  jr         $ra
    /* 14EB8 8014EAB0 00000000 */   nop
endlabel M_Teleport__Fi
