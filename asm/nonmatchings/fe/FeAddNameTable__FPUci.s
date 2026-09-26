.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeAddNameTable__FPUci, 0x128

glabel FeAddNameTable__FPUci
    /* 158 80139D50 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 15C 80139D54 3000B6AF */  sw         $s6, 0x30($sp)
    /* 160 80139D58 21B08000 */  addu       $s6, $a0, $zero
    /* 164 80139D5C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 168 80139D60 2180A000 */  addu       $s0, $a1, $zero
    /* 16C 80139D64 3800BFAF */  sw         $ra, 0x38($sp)
    /* 170 80139D68 3400B7AF */  sw         $s7, 0x34($sp)
    /* 174 80139D6C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 178 80139D70 2800B4AF */  sw         $s4, 0x28($sp)
    /* 17C 80139D74 2400B3AF */  sw         $s3, 0x24($sp)
    /* 180 80139D78 2000B2AF */  sw         $s2, 0x20($sp)
    /* 184 80139D7C 09E7040C */  jal        FeInitBuffer__Fv
    /* 188 80139D80 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 18C 80139D84 21200000 */  addu       $a0, $zero, $zero
    /* 190 80139D88 21280000 */  addu       $a1, $zero, $zero
    /* 194 80139D8C 01000624 */  addiu      $a2, $zero, 0x1
    /* 198 80139D90 31010724 */  addiu      $a3, $zero, 0x131
    /* 19C 80139D94 0C80023C */  lui        $v0, %hi(LargeFont)
    /* 1A0 80139D98 F4844224 */  addiu      $v0, $v0, %lo(LargeFont)
    /* 1A4 80139D9C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1A8 80139DA0 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 1AC 80139DA4 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B0 80139DA8 6666023C */  lui        $v0, (0x66666667 >> 16)
    /* 1B4 80139DAC 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
    /* 1B8 80139DB0 18000202 */  mult       $s0, $v0
    /* 1BC 80139DB4 21A80000 */  addu       $s5, $zero, $zero
    /* 1C0 80139DB8 21A00000 */  addu       $s4, $zero, $zero
    /* 1C4 80139DBC 23001324 */  addiu      $s3, $zero, 0x23
    /* 1C8 80139DC0 C3871000 */  sra        $s0, $s0, 31
    /* 1CC 80139DC4 10400000 */  mfhi       $t0
    /* 1D0 80139DC8 83100800 */  sra        $v0, $t0, 2
    /* 1D4 80139DCC 23B85000 */  subu       $s7, $v0, $s0
  .L80139DD0:
    /* 1D8 80139DD0 2A10B702 */  slt        $v0, $s5, $s7
    /* 1DC 80139DD4 1C004010 */  beqz       $v0, .L80139E48
    /* 1E0 80139DD8 21180000 */   addu      $v1, $zero, $zero
    /* 1E4 80139DDC 21906002 */  addu       $s2, $s3, $zero
    /* 1E8 80139DE0 21888002 */  addu       $s1, $s4, $zero
    /* 1EC 80139DE4 01007024 */  addiu      $s0, $v1, 0x1
  .L80139DE8:
    /* 1F0 80139DE8 40201000 */  sll        $a0, $s0, 1
    /* 1F4 80139DEC 21209000 */  addu       $a0, $a0, $s0
    /* 1F8 80139DF0 80200400 */  sll        $a0, $a0, 2
    /* 1FC 80139DF4 21209000 */  addu       $a0, $a0, $s0
    /* 200 80139DF8 02008424 */  addiu      $a0, $a0, 0x2
    /* 204 80139DFC 40281200 */  sll        $a1, $s2, 1
    /* 208 80139E00 21102302 */  addu       $v0, $s1, $v1
    /* 20C 80139E04 2110C202 */  addu       $v0, $s6, $v0
    /* 210 80139E08 01000624 */  addiu      $a2, $zero, 0x1
    /* 214 80139E0C 00004790 */  lbu        $a3, 0x0($v0)
    /* 218 80139E10 0C80023C */  lui        $v0, %hi(MediumFont)
    /* 21C 80139E14 D8824224 */  addiu      $v0, $v0, %lo(MediumFont)
    /* 220 80139E18 1000A0AF */  sw         $zero, 0x10($sp)
    /* 224 80139E1C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 228 80139E20 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 22C 80139E24 0010E734 */   ori       $a3, $a3, 0x1000
    /* 230 80139E28 21180002 */  addu       $v1, $s0, $zero
    /* 234 80139E2C 0A006228 */  slti       $v0, $v1, 0xA
    /* 238 80139E30 EDFF4014 */  bnez       $v0, .L80139DE8
    /* 23C 80139E34 01007024 */   addiu     $s0, $v1, 0x1
    /* 240 80139E38 0A009426 */  addiu      $s4, $s4, 0xA
    /* 244 80139E3C 07007326 */  addiu      $s3, $s3, 0x7
    /* 248 80139E40 74E70408 */  j          .L80139DD0
    /* 24C 80139E44 0100B526 */   addiu     $s5, $s5, 0x1
  .L80139E48:
    /* 250 80139E48 3800BF8F */  lw         $ra, 0x38($sp)
    /* 254 80139E4C 3400B78F */  lw         $s7, 0x34($sp)
    /* 258 80139E50 3000B68F */  lw         $s6, 0x30($sp)
    /* 25C 80139E54 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 260 80139E58 2800B48F */  lw         $s4, 0x28($sp)
    /* 264 80139E5C 2400B38F */  lw         $s3, 0x24($sp)
    /* 268 80139E60 2000B28F */  lw         $s2, 0x20($sp)
    /* 26C 80139E64 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 270 80139E68 1800B08F */  lw         $s0, 0x18($sp)
    /* 274 80139E6C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 278 80139E70 0800E003 */  jr         $ra
    /* 27C 80139E74 00000000 */   nop
endlabel FeAddNameTable__FPUci
