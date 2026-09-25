.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_PlaySound__FUscic, 0x248

glabel STR_PlaySound__FUscic
    /* 88DC8 80098DC8 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 88DCC 80098DCC 3800B0AF */  sw         $s0, 0x38($sp)
    /* 88DD0 80098DD0 2180A000 */  addu       $s0, $a1, $zero
    /* 88DD4 80098DD4 4800B4AF */  sw         $s4, 0x48($sp)
    /* 88DD8 80098DD8 21A0C000 */  addu       $s4, $a2, $zero
    /* 88DDC 80098DDC 4000B2AF */  sw         $s2, 0x40($sp)
    /* 88DE0 80098DE0 21900002 */  addu       $s2, $s0, $zero
    /* 88DE4 80098DE4 4400B3AF */  sw         $s3, 0x44($sp)
    /* 88DE8 80098DE8 21988000 */  addu       $s3, $a0, $zero
    /* 88DEC 80098DEC 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 88DF0 80098DF0 21A8E000 */  addu       $s5, $a3, $zero
    /* 88DF4 80098DF4 5000BFAF */  sw         $ra, 0x50($sp)
    /* 88DF8 80098DF8 DD62020C */  jal        STR_Init__Fv
    /* 88DFC 80098DFC 3C00B1AF */   sw        $s1, 0x3C($sp)
    /* 88E00 80098E00 00861000 */  sll        $s0, $s0, 24
    /* 88E04 80098E04 21000016 */  bnez       $s0, .L80098E8C
    /* 88E08 80098E08 4D000224 */   addiu     $v0, $zero, 0x4D
    /* 88E0C 80098E0C D2EC010C */  jal        LANG_GetLang__Fv
    /* 88E10 80098E10 00000000 */   nop
    /* 88E14 80098E14 21184000 */  addu       $v1, $v0, $zero
    /* 88E18 80098E18 0600622C */  sltiu      $v0, $v1, 0x6
    /* 88E1C 80098E1C 1C004010 */  beqz       $v0, .L80098E90
    /* 88E20 80098E20 80100300 */   sll       $v0, $v1, 2
    /* 88E24 80098E24 1180013C */  lui        $at, %hi(jtbl_8011094C)
    /* 88E28 80098E28 21082200 */  addu       $at, $at, $v0
    /* 88E2C 80098E2C 4C09228C */  lw         $v0, %lo(jtbl_8011094C)($at)
    /* 88E30 80098E30 00000000 */  nop
    /* 88E34 80098E34 08004000 */  jr         $v0
    /* 88E38 80098E38 00000000 */   nop
  jlabel .L80098E3C
    /* 88E3C 80098E3C A3630208 */  j          .L80098E8C
    /* 88E40 80098E40 45000224 */   addiu     $v0, $zero, 0x45
  jlabel .L80098E44
    /* 88E44 80098E44 A3630208 */  j          .L80098E8C
    /* 88E48 80098E48 46000224 */   addiu     $v0, $zero, 0x46
  jlabel .L80098E4C
    /* 88E4C 80098E4C A3630208 */  j          .L80098E8C
    /* 88E50 80098E50 47000224 */   addiu     $v0, $zero, 0x47
  jlabel .L80098E54
    /* 88E54 80098E54 A3630208 */  j          .L80098E8C
    /* 88E58 80098E58 53000224 */   addiu     $v0, $zero, 0x53
  jlabel .L80098E5C
    /* 88E5C 80098E5C A3630208 */  j          .L80098E8C
    /* 88E60 80098E60 4A000224 */   addiu     $v0, $zero, 0x4A
  jlabel .L80098E64
    /* 88E64 80098E64 1180023C */  lui        $v0, %hi(D_801108C8)
    /* 88E68 80098E68 C8084224 */  addiu      $v0, $v0, %lo(D_801108C8)
    /* 88E6C 80098E6C 08004010 */  beqz       $v0, .L80098E90
    /* 88E70 80098E70 21200000 */   addu      $a0, $zero, $zero
    /* 88E74 80098E74 1180053C */  lui        $a1, %hi(D_801108B4)
    /* 88E78 80098E78 B408A524 */  addiu      $a1, $a1, %lo(D_801108B4)
    /* 88E7C 80098E7C A583000C */  jal        DBG_Error
    /* 88E80 80098E80 77020624 */   addiu     $a2, $zero, 0x277
    /* 88E84 80098E84 A5630208 */  j          .L80098E94
    /* 88E88 80098E88 FFFF6332 */   andi      $v1, $s3, 0xFFFF
  .L80098E8C:
    /* 88E8C 80098E8C 3000A2A3 */  sb         $v0, 0x30($sp)
  .L80098E90:
    /* 88E90 80098E90 FFFF6332 */  andi       $v1, $s3, 0xFFFF
  .L80098E94:
    /* 88E94 80098E94 69000224 */  addiu      $v0, $zero, 0x69
    /* 88E98 80098E98 0E006210 */  beq        $v1, $v0, .L80098ED4
    /* 88E9C 80098E9C 6A006228 */   slti      $v0, $v1, 0x6A
    /* 88EA0 80098EA0 07004010 */  beqz       $v0, .L80098EC0
    /* 88EA4 80098EA4 0C000224 */   addiu     $v0, $zero, 0xC
    /* 88EA8 80098EA8 0A006210 */  beq        $v1, $v0, .L80098ED4
    /* 88EAC 80098EAC 2E000224 */   addiu     $v0, $zero, 0x2E
    /* 88EB0 80098EB0 09006210 */  beq        $v1, $v0, .L80098ED8
    /* 88EB4 80098EB4 4D000224 */   addiu     $v0, $zero, 0x4D
    /* 88EB8 80098EB8 B8630208 */  j          .L80098EE0
    /* 88EBC 80098EBC 3100A0A3 */   sb        $zero, 0x31($sp)
  .L80098EC0:
    /* 88EC0 80098EC0 6B000224 */  addiu      $v0, $zero, 0x6B
    /* 88EC4 80098EC4 03006210 */  beq        $v1, $v0, .L80098ED4
    /* 88EC8 80098EC8 48030224 */   addiu     $v0, $zero, 0x348
    /* 88ECC 80098ECC 03006214 */  bne        $v1, $v0, .L80098EDC
    /* 88ED0 80098ED0 00000000 */   nop
  .L80098ED4:
    /* 88ED4 80098ED4 4D000224 */  addiu      $v0, $zero, 0x4D
  .L80098ED8:
    /* 88ED8 80098ED8 3000A2A3 */  sb         $v0, 0x30($sp)
  .L80098EDC:
    /* 88EDC 80098EDC 3100A0A3 */  sb         $zero, 0x31($sp)
  .L80098EE0:
    /* 88EE0 80098EE0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 88EE4 80098EE4 1280053C */  lui        $a1, %hi(D_8011ADD0)
    /* 88EE8 80098EE8 D0ADA524 */  addiu      $a1, $a1, %lo(D_8011ADD0)
    /* 88EEC 80098EEC 3000A627 */  addiu      $a2, $sp, 0x30
    /* 88EF0 80098EF0 9767000C */  jal        sprintf
    /* 88EF4 80098EF4 FFFF6732 */   andi      $a3, $s3, 0xFFFF
    /* 88EF8 80098EF8 01004226 */  addiu      $v0, $s2, 0x1
    /* 88EFC 80098EFC 01005030 */  andi       $s0, $v0, 0x1
    /* 88F00 80098F00 2863020C */  jal        STR_InitStream__Fc
    /* 88F04 80098F04 21200002 */   addu      $a0, $s0, $zero
    /* 88F08 80098F08 21884000 */  addu       $s1, $v0, $zero
    /* 88F0C 80098F0C 03002016 */  bnez       $s1, .L80098F1C
    /* 88F10 80098F10 0100103A */   xori      $s0, $s0, 0x1
    /* 88F14 80098F14 FA630208 */  j          .L80098FE8
    /* 88F18 80098F18 21100000 */   addu      $v0, $zero, $zero
  .L80098F1C:
    /* 88F1C 80098F1C 21900002 */  addu       $s2, $s0, $zero
    /* 88F20 80098F20 21202002 */  addu       $a0, $s1, $zero
    /* 88F24 80098F24 0C0032A2 */  sb         $s2, 0xC($s1)
    /* 88F28 80098F28 010035A2 */  sb         $s5, 0x1($s1)
    /* 88F2C 80098F2C 140034AE */  sw         $s4, 0x14($s1)
    /* 88F30 80098F30 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 88F34 80098F34 180034AE */   sw        $s4, 0x18($s1)
    /* 88F38 80098F38 11000012 */  beqz       $s0, .L80098F80
    /* 88F3C 80098F3C FC030224 */   addiu     $v0, $zero, 0x3FC
    /* 88F40 80098F40 4406838F */  lw         $v1, %gp_rel(D_8011ADC4)($gp)
    /* 88F44 80098F44 1C0022AE */  sw         $v0, 0x1C($s1)
    /* 88F48 80098F48 32000224 */  addiu      $v0, $zero, 0x32
    /* 88F4C 80098F4C 04006214 */  bne        $v1, $v0, .L80098F60
    /* 88F50 80098F50 68000224 */   addiu     $v0, $zero, 0x68
    /* 88F54 80098F54 4C06828F */  lw         $v0, %gp_rel(my_spurate)($gp)
    /* 88F58 80098F58 D9630208 */  j          .L80098F64
    /* 88F5C 80098F5C 600022AE */   sw        $v0, 0x60($s1)
  .L80098F60:
    /* 88F60 80098F60 600022AE */  sw         $v0, 0x60($s1)
  .L80098F64:
    /* 88F64 80098F64 1280023C */  lui        $v0, %hi(leveltype)
    /* 88F68 80098F68 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 88F6C 80098F6C 00000000 */  nop
    /* 88F70 80098F70 11004010 */  beqz       $v0, .L80098FB8
    /* 88F74 80098F74 01000424 */   addiu     $a0, $zero, 0x1
    /* 88F78 80098F78 EA630208 */  j          .L80098FA8
    /* 88F7C 80098F7C 00000000 */   nop
  .L80098F80:
    /* 88F80 80098F80 4406838F */  lw         $v1, %gp_rel(D_8011ADC4)($gp)
    /* 88F84 80098F84 1C0022AE */  sw         $v0, 0x1C($s1)
    /* 88F88 80098F88 32000224 */  addiu      $v0, $zero, 0x32
    /* 88F8C 80098F8C 04006214 */  bne        $v1, $v0, .L80098FA0
    /* 88F90 80098F90 68000224 */   addiu     $v0, $zero, 0x68
    /* 88F94 80098F94 4C06828F */  lw         $v0, %gp_rel(my_spurate)($gp)
    /* 88F98 80098F98 E9630208 */  j          .L80098FA4
    /* 88F9C 80098F9C 600022AE */   sw        $v0, 0x60($s1)
  .L80098FA0:
    /* 88FA0 80098FA0 600022AE */  sw         $v0, 0x60($s1)
  .L80098FA4:
    /* 88FA4 80098FA4 21200000 */  addu       $a0, $zero, $zero
  .L80098FA8:
    /* 88FA8 80098FA8 1000228E */  lw         $v0, 0x10($s1)
    /* 88FAC 80098FAC 01000524 */  addiu      $a1, $zero, 0x1
    /* 88FB0 80098FB0 9B61000C */  jal        SpuSetReverbVoice
    /* 88FB4 80098FB4 04284500 */   sllv      $a1, $a1, $v0
  .L80098FB8:
    /* 88FB8 80098FB8 74002426 */  addiu      $a0, $s1, 0x74
    /* 88FBC 80098FBC 1280053C */  lui        $a1, %hi(D_8011ADD8)
    /* 88FC0 80098FC0 D8ADA524 */  addiu      $a1, $a1, %lo(D_8011ADD8)
    /* 88FC4 80098FC4 9767000C */  jal        sprintf
    /* 88FC8 80098FC8 1000A627 */   addiu     $a2, $sp, 0x10
    /* 88FCC 80098FCC FFFF6232 */  andi       $v0, $s3, 0xFFFF
    /* 88FD0 80098FD0 700022AE */  sw         $v0, 0x70($s1)
    /* 88FD4 80098FD4 21202002 */  addu       $a0, $s1, $zero
    /* 88FD8 80098FD8 002E1200 */  sll        $a1, $s2, 24
    /* 88FDC 80098FDC 1B68020C */  jal        STR_StreamMainTask__FP6SFXHDRc
    /* 88FE0 80098FE0 032E0500 */   sra       $a1, $a1, 24
    /* 88FE4 80098FE4 21102002 */  addu       $v0, $s1, $zero
  .L80098FE8:
    /* 88FE8 80098FE8 5000BF8F */  lw         $ra, 0x50($sp)
    /* 88FEC 80098FEC 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 88FF0 80098FF0 4800B48F */  lw         $s4, 0x48($sp)
    /* 88FF4 80098FF4 4400B38F */  lw         $s3, 0x44($sp)
    /* 88FF8 80098FF8 4000B28F */  lw         $s2, 0x40($sp)
    /* 88FFC 80098FFC 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 89000 80099000 3800B08F */  lw         $s0, 0x38($sp)
    /* 89004 80099004 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 89008 80099008 0800E003 */  jr         $ra
    /* 8900C 8009900C 00000000 */   nop
endlabel STR_PlaySound__FUscic
