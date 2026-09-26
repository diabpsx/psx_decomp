.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShowTask__FP4TASK, 0x230

glabel ShowTask__FP4TASK
    /* 1C064 80155C5C 38FFBD27 */  addiu      $sp, $sp, -0xC8
    /* 1C068 80155C60 A000B0AF */  sw         $s0, 0xA0($sp)
    /* 1C06C 80155C64 21808000 */  addu       $s0, $a0, $zero
    /* 1C070 80155C68 C400BFAF */  sw         $ra, 0xC4($sp)
    /* 1C074 80155C6C C000BEAF */  sw         $fp, 0xC0($sp)
    /* 1C078 80155C70 BC00B7AF */  sw         $s7, 0xBC($sp)
    /* 1C07C 80155C74 B800B6AF */  sw         $s6, 0xB8($sp)
    /* 1C080 80155C78 B400B5AF */  sw         $s5, 0xB4($sp)
    /* 1C084 80155C7C B000B4AF */  sw         $s4, 0xB0($sp)
    /* 1C088 80155C80 AC00B3AF */  sw         $s3, 0xAC($sp)
    /* 1C08C 80155C84 A800B2AF */  sw         $s2, 0xA8($sp)
    /* 1C090 80155C88 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 1C094 80155C8C A400B1AF */   sw        $s1, 0xA4($sp)
    /* 1C098 80155C90 1C00028E */  lw         $v0, 0x1C($s0)
    /* 1C09C 80155C94 00000000 */  nop
    /* 1C0A0 80155C98 0000508C */  lw         $s0, 0x0($v0)
    /* 1C0A4 80155C9C 0400428C */  lw         $v0, 0x4($v0)
    /* 1C0A8 80155CA0 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 1C0AC 80155CA4 07000006 */  bltz       $s0, .L80155CC4
    /* 1C0B0 80155CA8 9000A2AF */   sw        $v0, 0x90($sp)
    /* 1C0B4 80155CAC 1280023C */  lui        $v0, %hi(NumOfMonsterListLevels)
    /* 1C0B8 80155CB0 94AA428C */  lw         $v0, %lo(NumOfMonsterListLevels)($v0)
    /* 1C0BC 80155CB4 00000000 */  nop
    /* 1C0C0 80155CB8 2A100202 */  slt        $v0, $s0, $v0
    /* 1C0C4 80155CBC 07004014 */  bnez       $v0, .L80155CDC
    /* 1C0C8 80155CC0 21A00000 */   addu      $s4, $zero, $zero
  .L80155CC4:
    /* 1C0CC 80155CC4 21200000 */  addu       $a0, $zero, $zero
    /* 1C0D0 80155CC8 1280053C */  lui        $a1, %hi(D_80119740)
    /* 1C0D4 80155CCC 4097A524 */  addiu      $a1, $a1, %lo(D_80119740)
    /* 1C0D8 80155CD0 A583000C */  jal        DBG_Error
    /* 1C0DC 80155CD4 F3010624 */   addiu     $a2, $zero, 0x1F3
    /* 1C0E0 80155CD8 21A00000 */  addu       $s4, $zero, $zero
  .L80155CDC:
    /* 1C0E4 80155CDC 2800A427 */  addiu      $a0, $sp, 0x28
    /* 1C0E8 80155CE0 1280053C */  lui        $a1, %hi(D_80119754)
    /* 1C0EC 80155CE4 5497A524 */  addiu      $a1, $a1, %lo(D_80119754)
    /* 1C0F0 80155CE8 01000626 */  addiu      $a2, $s0, 0x1
    /* 1C0F4 80155CEC C0181000 */  sll        $v1, $s0, 3
    /* 1C0F8 80155CF0 0B80023C */  lui        $v0, %hi(AllLevels)
    /* 1C0FC 80155CF4 58754224 */  addiu      $v0, $v0, %lo(AllLevels)
    /* 1C100 80155CF8 21186200 */  addu       $v1, $v1, $v0
    /* 1C104 80155CFC 9767000C */  jal        sprintf
    /* 1C108 80155D00 9800A3AF */   sw        $v1, 0x98($sp)
    /* 1C10C 80155D04 0C80173C */  lui        $s7, %hi(MediumFont)
    /* 1C110 80155D08 D882F726 */  addiu      $s7, $s7, %lo(MediumFont)
    /* 1C114 80155D0C 01001624 */  addiu      $s6, $zero, 0x1
    /* 1C118 80155D10 0E801E3C */  lui        $fp, %hi(D_800E4028)
    /* 1C11C 80155D14 2840DE27 */  addiu      $fp, $fp, %lo(D_800E4028)
    /* 1C120 80155D18 1280153C */  lui        $s5, %hi(WHITER)
    /* 1C124 80155D1C D1ABB592 */  lbu        $s5, %lo(WHITER)($s5)
    /* 1C128 80155D20 1280133C */  lui        $s3, %hi(WHITEG)
    /* 1C12C 80155D24 D2AB7392 */  lbu        $s3, %lo(WHITEG)($s3)
  .L80155D28:
    /* 1C130 80155D28 49008016 */  bnez       $s4, .L80155E50
    /* 1C134 80155D2C 2120E002 */   addu      $a0, $s7, $zero
    /* 1C138 80155D30 64000524 */  addiu      $a1, $zero, 0x64
    /* 1C13C 80155D34 64000624 */  addiu      $a2, $zero, 0x64
    /* 1C140 80155D38 2800A727 */  addiu      $a3, $sp, 0x28
    /* 1C144 80155D3C 40000224 */  addiu      $v0, $zero, 0x40
    /* 1C148 80155D40 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1C14C 80155D44 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 1C150 80155D48 80000224 */  addiu      $v0, $zero, 0x80
    /* 1C154 80155D4C 1000B6AF */  sw         $s6, 0x10($sp)
    /* 1C158 80155D50 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1C15C 80155D54 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1C160 80155D58 2000A2AF */   sw        $v0, 0x20($sp)
    /* 1C164 80155D5C 9800A88F */  lw         $t0, 0x98($sp)
    /* 1C168 80155D60 2120E002 */  addu       $a0, $s7, $zero
    /* 1C16C 80155D64 0400038D */  lw         $v1, 0x4($t0)
    /* 1C170 80155D68 9000A88F */  lw         $t0, 0x90($sp)
    /* 1C174 80155D6C 64000524 */  addiu      $a1, $zero, 0x64
    /* 1C178 80155D70 1000B6AF */  sw         $s6, 0x10($sp)
    /* 1C17C 80155D74 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1C180 80155D78 1800B5AF */  sw         $s5, 0x18($sp)
    /* 1C184 80155D7C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1C188 80155D80 2000B3AF */  sw         $s3, 0x20($sp)
    /* 1C18C 80155D84 00110800 */  sll        $v0, $t0, 4
    /* 1C190 80155D88 21906200 */  addu       $s2, $v1, $v0
    /* 1C194 80155D8C 0800478E */  lw         $a3, 0x8($s2)
    /* 1C198 80155D90 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1C19C 80155D94 78000624 */   addiu     $a2, $zero, 0x78
    /* 1C1A0 80155D98 00004296 */  lhu        $v0, 0x0($s2)
    /* 1C1A4 80155D9C 00000000 */  nop
    /* 1C1A8 80155DA0 2B108202 */  sltu       $v0, $s4, $v0
    /* 1C1AC 80155DA4 18004010 */  beqz       $v0, .L80155E08
    /* 1C1B0 80155DA8 21800000 */   addu      $s0, $zero, $zero
    /* 1C1B4 80155DAC 78001124 */  addiu      $s1, $zero, 0x78
  .L80155DB0:
    /* 1C1B8 80155DB0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 1C1BC 80155DB4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 1C1C0 80155DB8 0400428E */  lw         $v0, 0x4($s2)
    /* 1C1C4 80155DBC 32000524 */  addiu      $a1, $zero, 0x32
    /* 1C1C8 80155DC0 21105000 */  addu       $v0, $v0, $s0
    /* 1C1CC 80155DC4 00004290 */  lbu        $v0, 0x0($v0)
    /* 1C1D0 80155DC8 21302002 */  addu       $a2, $s1, $zero
    /* 1C1D4 80155DCC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1C1D8 80155DD0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1C1DC 80155DD4 1800B5AF */  sw         $s5, 0x18($sp)
    /* 1C1E0 80155DD8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1C1E4 80155DDC 2000B3AF */  sw         $s3, 0x20($sp)
    /* 1C1E8 80155DE0 80100200 */  sll        $v0, $v0, 2
    /* 1C1EC 80155DE4 21105E00 */  addu       $v0, $v0, $fp
    /* 1C1F0 80155DE8 0000478C */  lw         $a3, 0x0($v0)
    /* 1C1F4 80155DEC 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1C1F8 80155DF0 10003126 */   addiu     $s1, $s1, 0x10
    /* 1C1FC 80155DF4 00004296 */  lhu        $v0, 0x0($s2)
    /* 1C200 80155DF8 01001026 */  addiu      $s0, $s0, 0x1
    /* 1C204 80155DFC 2B100202 */  sltu       $v0, $s0, $v0
    /* 1C208 80155E00 EBFF4014 */  bnez       $v0, .L80155DB0
    /* 1C20C 80155E04 00000000 */   nop
  .L80155E08:
    /* 1C210 80155E08 21200000 */  addu       $a0, $zero, $zero
    /* 1C214 80155E0C FD25020C */  jal        PAD_GetPad__FiUc
    /* 1C218 80155E10 01000524 */   addiu     $a1, $zero, 0x1
    /* 1C21C 80155E14 EC57050C */  jal        GetDown__C4CPad_80155fb0
    /* 1C220 80155E18 21204000 */   addu      $a0, $v0, $zero
    /* 1C224 80155E1C 40004230 */  andi       $v0, $v0, 0x40
    /* 1C228 80155E20 06004014 */  bnez       $v0, .L80155E3C
    /* 1C22C 80155E24 00000000 */   nop
    /* 1C230 80155E28 1280023C */  lui        $v0, %hi(demo_pad_time)
    /* 1C234 80155E2C B4AB428C */  lw         $v0, %lo(demo_pad_time)($v0)
    /* 1C238 80155E30 00000000 */  nop
    /* 1C23C 80155E34 02004010 */  beqz       $v0, .L80155E40
    /* 1C240 80155E38 00000000 */   nop
  .L80155E3C:
    /* 1C244 80155E3C 01001424 */  addiu      $s4, $zero, 0x1
  .L80155E40:
    /* 1C248 80155E40 EE80000C */  jal        TSK_Sleep
    /* 1C24C 80155E44 01000424 */   addiu     $a0, $zero, 0x1
    /* 1C250 80155E48 4A570508 */  j          .L80155D28
    /* 1C254 80155E4C 00000000 */   nop
  .L80155E50:
    /* 1C258 80155E50 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 1C25C 80155E54 00000000 */   nop
    /* 1C260 80155E58 C400BF8F */  lw         $ra, 0xC4($sp)
    /* 1C264 80155E5C C000BE8F */  lw         $fp, 0xC0($sp)
    /* 1C268 80155E60 BC00B78F */  lw         $s7, 0xBC($sp)
    /* 1C26C 80155E64 B800B68F */  lw         $s6, 0xB8($sp)
    /* 1C270 80155E68 B400B58F */  lw         $s5, 0xB4($sp)
    /* 1C274 80155E6C B000B48F */  lw         $s4, 0xB0($sp)
    /* 1C278 80155E70 AC00B38F */  lw         $s3, 0xAC($sp)
    /* 1C27C 80155E74 A800B28F */  lw         $s2, 0xA8($sp)
    /* 1C280 80155E78 A400B18F */  lw         $s1, 0xA4($sp)
    /* 1C284 80155E7C A000B08F */  lw         $s0, 0xA0($sp)
    /* 1C288 80155E80 C800BD27 */  addiu      $sp, $sp, 0xC8
    /* 1C28C 80155E84 0800E003 */  jr         $ra
    /* 1C290 80155E88 00000000 */   nop
endlabel ShowTask__FP4TASK
