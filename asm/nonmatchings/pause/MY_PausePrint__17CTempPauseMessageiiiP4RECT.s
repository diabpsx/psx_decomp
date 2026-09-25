.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MY_PausePrint__17CTempPauseMessageiiiP4RECT, 0x240

glabel MY_PausePrint__17CTempPauseMessageiiiP4RECT
    /* 78C10 80088C10 A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 78C14 80088C14 3800B0AF */  sw         $s0, 0x38($sp)
    /* 78C18 80088C18 2180A000 */  addu       $s0, $a1, $zero
    /* 78C1C 80088C1C 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 78C20 80088C20 2188C000 */  addu       $s1, $a2, $zero
    /* 78C24 80088C24 4000B2AF */  sw         $s2, 0x40($sp)
    /* 78C28 80088C28 2190E000 */  addu       $s2, $a3, $zero
    /* 78C2C 80088C2C 80101000 */  sll        $v0, $s0, 2
    /* 78C30 80088C30 21105000 */  addu       $v0, $v0, $s0
    /* 78C34 80088C34 40180200 */  sll        $v1, $v0, 1
    /* 78C38 80088C38 5400B7AF */  sw         $s7, 0x54($sp)
    /* 78C3C 80088C3C 0B007724 */  addiu      $s7, $v1, 0xB
    /* 78C40 80088C40 4400B3AF */  sw         $s3, 0x44($sp)
    /* 78C44 80088C44 7000B38F */  lw         $s3, 0x70($sp)
    /* 78C48 80088C48 43030224 */  addiu      $v0, $zero, 0x343
    /* 78C4C 80088C4C 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 78C50 80088C50 5800BEAF */  sw         $fp, 0x58($sp)
    /* 78C54 80088C54 5000B6AF */  sw         $s6, 0x50($sp)
    /* 78C58 80088C58 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 78C5C 80088C5C 02002216 */  bne        $s1, $v0, .L80088C68
    /* 78C60 80088C60 4800B4AF */   sw        $s4, 0x48($sp)
    /* 78C64 80088C64 09007724 */  addiu      $s7, $v1, 0x9
  .L80088C68:
    /* 78C68 80088C68 2925020C */  jal        GetMaxOtPos__7CBlocks_800894a4
    /* 78C6C 80088C6C 00000000 */   nop
    /* 78C70 80088C70 0F000016 */  bnez       $s0, .L80088CB0
    /* 78C74 80088C74 FFFF5E24 */   addiu     $fp, $v0, -0x1
    /* 78C78 80088C78 4AED010C */  jal        GetStr__Fi
    /* 78C7C 80088C7C 21202002 */   addu      $a0, $s1, $zero
    /* 78C80 80088C80 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 78C84 80088C84 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 78C88 80088C88 21280000 */  addu       $a1, $zero, $zero
    /* 78C8C 80088C8C 2130E002 */  addu       $a2, $s7, $zero
    /* 78C90 80088C90 1280033C */  lui        $v1, %hi(BLUER)
    /* 78C94 80088C94 D4AB6390 */  lbu        $v1, %lo(BLUER)($v1)
    /* 78C98 80088C98 1280083C */  lui        $t0, %hi(BLUEG)
    /* 78C9C 80088C9C D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 78CA0 80088CA0 1280093C */  lui        $t1, %hi(BLUEB)
    /* 78CA4 80088CA4 D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 78CA8 80088CA8 80230208 */  j          .L80088E00
    /* 78CAC 80088CAC 21384000 */   addu      $a3, $v0, $zero
  .L80088CB0:
    /* 78CB0 80088CB0 FEFF0226 */  addiu      $v0, $s0, -0x2
    /* 78CB4 80088CB4 45005214 */  bne        $v0, $s2, .L80088DCC
    /* 78CB8 80088CB8 00000000 */   nop
    /* 78CBC 80088CBC 4AED010C */  jal        GetStr__Fi
    /* 78CC0 80088CC0 21202002 */   addu      $a0, $s1, $zero
    /* 78CC4 80088CC4 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 78CC8 80088CC8 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 78CCC 80088CCC 21200002 */  addu       $a0, $s0, $zero
    /* 78CD0 80088CD0 21280000 */  addu       $a1, $zero, $zero
    /* 78CD4 80088CD4 2130E002 */  addu       $a2, $s7, $zero
    /* 78CD8 80088CD8 21384000 */  addu       $a3, $v0, $zero
    /* 78CDC 80088CDC 1280023C */  lui        $v0, %hi(GOLDR)
    /* 78CE0 80088CE0 DAAB4290 */  lbu        $v0, %lo(GOLDR)($v0)
    /* 78CE4 80088CE4 1280033C */  lui        $v1, %hi(GOLDG)
    /* 78CE8 80088CE8 DBAB6390 */  lbu        $v1, %lo(GOLDG)($v1)
    /* 78CEC 80088CEC 1280083C */  lui        $t0, %hi(GOLDB)
    /* 78CF0 80088CF0 DCAB0891 */  lbu        $t0, %lo(GOLDB)($t0)
    /* 78CF4 80088CF4 01001224 */  addiu      $s2, $zero, 0x1
    /* 78CF8 80088CF8 1000B2AF */  sw         $s2, 0x10($sp)
    /* 78CFC 80088CFC 1400B3AF */  sw         $s3, 0x14($sp)
    /* 78D00 80088D00 1800A2AF */  sw         $v0, 0x18($sp)
    /* 78D04 80088D04 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 78D08 80088D08 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 78D0C 80088D0C 2000A8AF */   sw        $t0, 0x20($sp)
    /* 78D10 80088D10 4AED010C */  jal        GetStr__Fi
    /* 78D14 80088D14 21202002 */   addu      $a0, $s1, $zero
    /* 78D18 80088D18 21200002 */  addu       $a0, $s0, $zero
    /* 78D1C 80088D1C A92A020C */  jal        GetStrWidth__5CFontPc
    /* 78D20 80088D20 21284000 */   addu      $a1, $v0, $zero
    /* 78D24 80088D24 21884000 */  addu       $s1, $v0, $zero
    /* 78D28 80088D28 00011024 */  addiu      $s0, $zero, 0x100
    /* 78D2C 80088D2C 23801102 */  subu       $s0, $s0, $s1
    /* 78D30 80088D30 C2171000 */  srl        $v0, $s0, 31
    /* 78D34 80088D34 21800202 */  addu       $s0, $s0, $v0
    /* 78D38 80088D38 43801000 */  sra        $s0, $s0, 1
    /* 78D3C 80088D3C 16000426 */  addiu      $a0, $s0, 0x16
    /* 78D40 80088D40 6000F726 */  addiu      $s7, $s7, 0x60
    /* 78D44 80088D44 2128E002 */  addu       $a1, $s7, $zero
    /* 78D48 80088D48 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 78D4C 80088D4C 40000724 */  addiu      $a3, $zero, 0x40
    /* 78D50 80088D50 F0001624 */  addiu      $s6, $zero, 0xF0
    /* 78D54 80088D54 20001524 */  addiu      $s5, $zero, 0x20
    /* 78D58 80088D58 40001424 */  addiu      $s4, $zero, 0x40
    /* 78D5C 80088D5C 08001324 */  addiu      $s3, $zero, 0x8
    /* 78D60 80088D60 1000B6AF */  sw         $s6, 0x10($sp)
    /* 78D64 80088D64 1400B5AF */  sw         $s5, 0x14($sp)
    /* 78D68 80088D68 1800B4AF */  sw         $s4, 0x18($sp)
    /* 78D6C 80088D6C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 78D70 80088D70 2000B2AF */  sw         $s2, 0x20($sp)
    /* 78D74 80088D74 2400BEAF */  sw         $fp, 0x24($sp)
    /* 78D78 80088D78 2800B2AF */  sw         $s2, 0x28($sp)
    /* 78D7C 80088D7C 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 78D80 80088D80 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 78D84 80088D84 3000B3AF */   sw        $s3, 0x30($sp)
    /* 78D88 80088D88 21883002 */  addu       $s1, $s1, $s0
    /* 78D8C 80088D8C 23002426 */  addiu      $a0, $s1, 0x23
    /* 78D90 80088D90 2128E002 */  addu       $a1, $s7, $zero
    /* 78D94 80088D94 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 78D98 80088D98 40000724 */  addiu      $a3, $zero, 0x40
    /* 78D9C 80088D9C 1000B6AF */  sw         $s6, 0x10($sp)
    /* 78DA0 80088DA0 1400B5AF */  sw         $s5, 0x14($sp)
    /* 78DA4 80088DA4 1800B4AF */  sw         $s4, 0x18($sp)
    /* 78DA8 80088DA8 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 78DAC 80088DAC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 78DB0 80088DB0 2400BEAF */  sw         $fp, 0x24($sp)
    /* 78DB4 80088DB4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 78DB8 80088DB8 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 78DBC 80088DBC 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 78DC0 80088DC0 3000B3AF */   sw        $s3, 0x30($sp)
    /* 78DC4 80088DC4 87230208 */  j          .L80088E1C
    /* 78DC8 80088DC8 00000000 */   nop
  .L80088DCC:
    /* 78DCC 80088DCC 4AED010C */  jal        GetStr__Fi
    /* 78DD0 80088DD0 21202002 */   addu      $a0, $s1, $zero
    /* 78DD4 80088DD4 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 78DD8 80088DD8 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 78DDC 80088DDC 21280000 */  addu       $a1, $zero, $zero
    /* 78DE0 80088DE0 2130E002 */  addu       $a2, $s7, $zero
    /* 78DE4 80088DE4 21384000 */  addu       $a3, $v0, $zero
    /* 78DE8 80088DE8 1280033C */  lui        $v1, %hi(WHITER)
    /* 78DEC 80088DEC D1AB6390 */  lbu        $v1, %lo(WHITER)($v1)
    /* 78DF0 80088DF0 1280083C */  lui        $t0, %hi(WHITEG)
    /* 78DF4 80088DF4 D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 78DF8 80088DF8 1280093C */  lui        $t1, %hi(WHITEB)
    /* 78DFC 80088DFC D3AB2991 */  lbu        $t1, %lo(WHITEB)($t1)
  .L80088E00:
    /* 78E00 80088E00 01000224 */  addiu      $v0, $zero, 0x1
    /* 78E04 80088E04 1000A2AF */  sw         $v0, 0x10($sp)
    /* 78E08 80088E08 1400B3AF */  sw         $s3, 0x14($sp)
    /* 78E0C 80088E0C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 78E10 80088E10 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 78E14 80088E14 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 78E18 80088E18 2000A9AF */   sw        $t1, 0x20($sp)
  .L80088E1C:
    /* 78E1C 80088E1C 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 78E20 80088E20 5800BE8F */  lw         $fp, 0x58($sp)
    /* 78E24 80088E24 5400B78F */  lw         $s7, 0x54($sp)
    /* 78E28 80088E28 5000B68F */  lw         $s6, 0x50($sp)
    /* 78E2C 80088E2C 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 78E30 80088E30 4800B48F */  lw         $s4, 0x48($sp)
    /* 78E34 80088E34 4400B38F */  lw         $s3, 0x44($sp)
    /* 78E38 80088E38 4000B28F */  lw         $s2, 0x40($sp)
    /* 78E3C 80088E3C 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 78E40 80088E40 3800B08F */  lw         $s0, 0x38($sp)
    /* 78E44 80088E44 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 78E48 80088E48 0800E003 */  jr         $ra
    /* 78E4C 80088E4C 00000000 */   nop
endlabel MY_PausePrint__17CTempPauseMessageiiiP4RECT
