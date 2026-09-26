.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddLightning__Fiiiiiicii, 0x1EC

glabel AddLightning__Fiiiiiicii
    /* 4CE8 8013E8E0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4CEC 8013E8E4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4CF0 8013E8E8 21888000 */  addu       $s1, $a0, $zero
    /* 4CF4 8013E8EC 3800A38F */  lw         $v1, 0x38($sp)
    /* 4CF8 8013E8F0 80101100 */  sll        $v0, $s1, 2
    /* 4CFC 8013E8F4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4D00 8013E8F8 3C00B28F */  lw         $s2, 0x3C($sp)
    /* 4D04 8013E8FC 21105100 */  addu       $v0, $v0, $s1
    /* 4D08 8013E900 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4D0C 8013E904 4000B38F */  lw         $s3, 0x40($sp)
    /* 4D10 8013E908 80100200 */  sll        $v0, $v0, 2
    /* 4D14 8013E90C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 4D18 8013E910 4400B48F */  lw         $s4, 0x44($sp)
    /* 4D1C 8013E914 23105100 */  subu       $v0, $v0, $s1
    /* 4D20 8013E918 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4D24 8013E91C 80800200 */  sll        $s0, $v0, 2
    /* 4D28 8013E920 2400BFAF */  sw         $ra, 0x24($sp)
    /* 4D2C 8013E924 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 4D30 8013E928 21083000 */  addu       $at, $at, $s0
    /* 4D34 8013E92C 8D2C27A0 */  sb         $a3, %lo(missile + 0x35)($at)
    /* 4D38 8013E930 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 4D3C 8013E934 21083000 */  addu       $at, $at, $s0
    /* 4D40 8013E938 8E2C23A0 */  sb         $v1, %lo(missile + 0x36)($at)
    /* 4D44 8013E93C 1D004006 */  bltz       $s2, .L8013E9B4
    /* 4D48 8013E940 80101200 */   sll       $v0, $s2, 2
    /* 4D4C 8013E944 21105200 */  addu       $v0, $v0, $s2
    /* 4D50 8013E948 80100200 */  sll        $v0, $v0, 2
    /* 4D54 8013E94C 23105200 */  subu       $v0, $v0, $s2
    /* 4D58 8013E950 80100200 */  sll        $v0, $v0, 2
    /* 4D5C 8013E954 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 4D60 8013E958 21082200 */  addu       $at, $at, $v0
    /* 4D64 8013E95C 8B2C2390 */  lbu        $v1, %lo(missile + 0x33)($at)
    /* 4D68 8013E960 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 4D6C 8013E964 21083000 */  addu       $at, $at, $s0
    /* 4D70 8013E968 8B2C23A0 */  sb         $v1, %lo(missile + 0x33)($at)
    /* 4D74 8013E96C 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 4D78 8013E970 21082200 */  addu       $at, $at, $v0
    /* 4D7C 8013E974 8C2C2390 */  lbu        $v1, %lo(missile + 0x34)($at)
    /* 4D80 8013E978 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 4D84 8013E97C 21083000 */  addu       $at, $at, $s0
    /* 4D88 8013E980 8C2C23A0 */  sb         $v1, %lo(missile + 0x34)($at)
    /* 4D8C 8013E984 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 4D90 8013E988 21082200 */  addu       $at, $at, $v0
    /* 4D94 8013E98C 602C238C */  lw         $v1, %lo(missile + 0x8)($at)
    /* 4D98 8013E990 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 4D9C 8013E994 21083000 */  addu       $at, $at, $s0
    /* 4DA0 8013E998 602C23AC */  sw         $v1, %lo(missile + 0x8)($at)
    /* 4DA4 8013E99C 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 4DA8 8013E9A0 21082200 */  addu       $at, $at, $v0
    /* 4DAC 8013E9A4 642C228C */  lw         $v0, %lo(missile + 0xC)($at)
    /* 4DB0 8013E9A8 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 4DB4 8013E9AC 21083000 */  addu       $at, $at, $s0
    /* 4DB8 8013E9B0 642C22AC */  sw         $v0, %lo(missile + 0xC)($at)
  .L8013E9B4:
    /* 4DBC 8013E9B4 C9F6000C */  jal        ENG_random__Fl
    /* 4DC0 8013E9B8 08000424 */   addiu     $a0, $zero, 0x8
    /* 4DC4 8013E9BC 01004224 */  addiu      $v0, $v0, 0x1
    /* 4DC8 8013E9C0 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 4DCC 8013E9C4 21083000 */  addu       $at, $at, $s0
    /* 4DD0 8013E9C8 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
    /* 4DD4 8013E9CC 1D004006 */  bltz       $s2, .L8013EA44
    /* 4DD8 8013E9D0 00161300 */   sll       $v0, $s3, 24
    /* 4DDC 8013E9D4 03160200 */  sra        $v0, $v0, 24
    /* 4DE0 8013E9D8 01000324 */  addiu      $v1, $zero, 0x1
    /* 4DE4 8013E9DC 0F004310 */  beq        $v0, $v1, .L8013EA1C
    /* 4DE8 8013E9E0 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 4DEC 8013E9E4 0D008212 */  beq        $s4, $v0, .L8013EA1C
    /* 4DF0 8013E9E8 00000000 */   nop
    /* 4DF4 8013E9EC 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 4DF8 8013E9F0 21083000 */  addu       $at, $at, $s0
    /* 4DFC 8013E9F4 982C2290 */  lbu        $v0, %lo(missile + 0x40)($at)
    /* 4E00 8013E9F8 00000000 */  nop
    /* 4E04 8013E9FC 00160200 */  sll        $v0, $v0, 24
    /* 4E08 8013EA00 43160200 */  sra        $v0, $v0, 25
    /* 4E0C 8013EA04 06004224 */  addiu      $v0, $v0, 0x6
    /* 4E10 8013EA08 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4E14 8013EA0C 21083000 */  addu       $at, $at, $s0
    /* 4E18 8013EA10 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 4E1C 8013EA14 9BFA0408 */  j          .L8013EA6C
    /* 4E20 8013EA18 80801100 */   sll       $s0, $s1, 2
  .L8013EA1C:
    /* 4E24 8013EA1C 09004006 */  bltz       $s2, .L8013EA44
    /* 4E28 8013EA20 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 4E2C 8013EA24 07008212 */  beq        $s4, $v0, .L8013EA44
    /* 4E30 8013EA28 80101100 */   sll       $v0, $s1, 2
    /* 4E34 8013EA2C 21105100 */  addu       $v0, $v0, $s1
    /* 4E38 8013EA30 80100200 */  sll        $v0, $v0, 2
    /* 4E3C 8013EA34 23105100 */  subu       $v0, $v0, $s1
    /* 4E40 8013EA38 80100200 */  sll        $v0, $v0, 2
    /* 4E44 8013EA3C 97FA0408 */  j          .L8013EA5C
    /* 4E48 8013EA40 0A000324 */   addiu     $v1, $zero, 0xA
  .L8013EA44:
    /* 4E4C 8013EA44 80101100 */  sll        $v0, $s1, 2
    /* 4E50 8013EA48 21105100 */  addu       $v0, $v0, $s1
    /* 4E54 8013EA4C 80100200 */  sll        $v0, $v0, 2
    /* 4E58 8013EA50 23105100 */  subu       $v0, $v0, $s1
    /* 4E5C 8013EA54 80100200 */  sll        $v0, $v0, 2
    /* 4E60 8013EA58 08000324 */  addiu      $v1, $zero, 0x8
  .L8013EA5C:
    /* 4E64 8013EA5C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4E68 8013EA60 21082200 */  addu       $at, $at, $v0
    /* 4E6C 8013EA64 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 4E70 8013EA68 80801100 */  sll        $s0, $s1, 2
  .L8013EA6C:
    /* 4E74 8013EA6C 21801102 */  addu       $s0, $s0, $s1
    /* 4E78 8013EA70 80801000 */  sll        $s0, $s0, 2
    /* 4E7C 8013EA74 23801102 */  subu       $s0, $s0, $s1
    /* 4E80 8013EA78 80801000 */  sll        $s0, $s0, 2
    /* 4E84 8013EA7C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 4E88 8013EA80 21083000 */  addu       $at, $at, $s0
    /* 4E8C 8013EA84 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* 4E90 8013EA88 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 4E94 8013EA8C 21083000 */  addu       $at, $at, $s0
    /* 4E98 8013EA90 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* 4E9C 8013EA94 BA34010C */  jal        AddLight__Fiii
    /* 4EA0 8013EA98 43020624 */   addiu     $a2, $zero, 0x243
    /* 4EA4 8013EA9C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 4EA8 8013EAA0 21083000 */  addu       $at, $at, $s0
    /* 4EAC 8013EAA4 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 4EB0 8013EAA8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 4EB4 8013EAAC 2000B48F */  lw         $s4, 0x20($sp)
    /* 4EB8 8013EAB0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 4EBC 8013EAB4 1800B28F */  lw         $s2, 0x18($sp)
    /* 4EC0 8013EAB8 1400B18F */  lw         $s1, 0x14($sp)
    /* 4EC4 8013EABC 1000B08F */  lw         $s0, 0x10($sp)
    /* 4EC8 8013EAC0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4ECC 8013EAC4 0800E003 */  jr         $ra
    /* 4ED0 8013EAC8 00000000 */   nop
endlabel AddLightning__Fiiiiiicii
