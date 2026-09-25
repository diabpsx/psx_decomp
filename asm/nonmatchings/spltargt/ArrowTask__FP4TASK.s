.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ArrowTask__FP4TASK, 0x3B0

glabel ArrowTask__FP4TASK
    /* 9FEB0 800AFEB0 60FFBD27 */  addiu      $sp, $sp, -0xA0
    /* 9FEB4 800AFEB4 9C00BFAF */  sw         $ra, 0x9C($sp)
    /* 9FEB8 800AFEB8 9800BEAF */  sw         $fp, 0x98($sp)
    /* 9FEBC 800AFEBC 9400B7AF */  sw         $s7, 0x94($sp)
    /* 9FEC0 800AFEC0 9000B6AF */  sw         $s6, 0x90($sp)
    /* 9FEC4 800AFEC4 8C00B5AF */  sw         $s5, 0x8C($sp)
    /* 9FEC8 800AFEC8 8800B4AF */  sw         $s4, 0x88($sp)
    /* 9FECC 800AFECC 8400B3AF */  sw         $s3, 0x84($sp)
    /* 9FED0 800AFED0 8000B2AF */  sw         $s2, 0x80($sp)
    /* 9FED4 800AFED4 7C00B1AF */  sw         $s1, 0x7C($sp)
    /* 9FED8 800AFED8 7800B0AF */  sw         $s0, 0x78($sp)
    /* 9FEDC 800AFEDC 1C00828C */  lw         $v0, 0x1C($a0)
    /* 9FEE0 800AFEE0 7F000A24 */  addiu      $t2, $zero, 0x7F
    /* 9FEE4 800AFEE4 5800AAAF */  sw         $t2, 0x58($sp)
    /* 9FEE8 800AFEE8 6000AAAF */  sw         $t2, 0x60($sp)
    /* 9FEEC 800AFEEC 04004A8C */  lw         $t2, 0x4($v0)
    /* 9FEF0 800AFEF0 00100424 */  addiu      $a0, $zero, 0x1000
    /* 9FEF4 800AFEF4 4800AAAF */  sw         $t2, 0x48($sp)
    /* 9FEF8 800AFEF8 0000558C */  lw         $s5, 0x0($v0)
    /* 9FEFC 800AFEFC 08004A8C */  lw         $t2, 0x8($v0)
    /* 9FF00 800AFF00 00000000 */  nop
    /* 9FF04 800AFF04 5000AAAF */  sw         $t2, 0x50($sp)
    /* 9FF08 800AFF08 0C00578C */  lw         $s7, 0xC($v0)
    /* 9FF0C 800AFF0C C9F6000C */  jal        ENG_random__Fl
    /* 9FF10 800AFF10 7F001E24 */   addiu     $fp, $zero, 0x7F
    /* 9FF14 800AFF14 21B04000 */  addu       $s6, $v0, $zero
    /* 9FF18 800AFF18 40181500 */  sll        $v1, $s5, 1
    /* 9FF1C 800AFF1C 21187500 */  addu       $v1, $v1, $s5
    /* 9FF20 800AFF20 80180300 */  sll        $v1, $v1, 2
    /* 9FF24 800AFF24 21187500 */  addu       $v1, $v1, $s5
    /* 9FF28 800AFF28 00110300 */  sll        $v0, $v1, 4
    /* 9FF2C 800AFF2C 23105500 */  subu       $v0, $v0, $s5
    /* 9FF30 800AFF30 80100200 */  sll        $v0, $v0, 2
    /* 9FF34 800AFF34 21105500 */  addu       $v0, $v0, $s5
    /* 9FF38 800AFF38 C0100200 */  sll        $v0, $v0, 3
    /* 9FF3C 800AFF3C C0180300 */  sll        $v1, $v1, 3
    /* 9FF40 800AFF40 6800A2AF */  sw         $v0, 0x68($sp)
    /* 9FF44 800AFF44 7000A3AF */  sw         $v1, 0x70($sp)
  .L800AFF48:
    /* 9FF48 800AFF48 4800AA8F */  lw         $t2, 0x48($sp)
    /* 9FF4C 800AFF4C 00000000 */  nop
    /* 9FF50 800AFF50 B6004011 */  beqz       $t2, .L800B022C
    /* 9FF54 800AFF54 00000000 */   nop
    /* 9FF58 800AFF58 C16E020C */  jal        GLUE_Finished__Fv
    /* 9FF5C 800AFF5C 00000000 */   nop
    /* 9FF60 800AFF60 01004238 */  xori       $v0, $v0, 0x1
    /* 9FF64 800AFF64 B1004010 */  beqz       $v0, .L800B022C
    /* 9FF68 800AFF68 00000000 */   nop
    /* 9FF6C 800AFF6C 1280023C */  lui        $v0, %hi(deathflag)
    /* 9FF70 800AFF70 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 9FF74 800AFF74 00000000 */  nop
    /* 9FF78 800AFF78 AC004014 */  bnez       $v0, .L800B022C
    /* 9FF7C 800AFF7C 00000000 */   nop
    /* 9FF80 800AFF80 E56E020C */  jal        GLUE_GetShowGameScreenFlag__Fv
    /* 9FF84 800AFF84 00000000 */   nop
    /* 9FF88 800AFF88 A4004010 */  beqz       $v0, .L800B021C
    /* 9FF8C 800AFF8C 01000A24 */   addiu     $t2, $zero, 0x1
    /* 9FF90 800AFF90 2600EA12 */  beq        $s7, $t2, .L800B002C
    /* 9FF94 800AFF94 0200E22A */   slti      $v0, $s7, 0x2
    /* 9FF98 800AFF98 05004010 */  beqz       $v0, .L800AFFB0
    /* 9FF9C 800AFF9C 00000000 */   nop
    /* 9FFA0 800AFFA0 0800E012 */  beqz       $s7, .L800AFFC4
    /* 9FFA4 800AFFA4 7F000A24 */   addiu     $t2, $zero, 0x7F
    /* 9FFA8 800AFFA8 51C00208 */  j          .L800B0144
    /* 9FFAC 800AFFAC 00000000 */   nop
  .L800AFFB0:
    /* 9FFB0 800AFFB0 02000224 */  addiu      $v0, $zero, 0x2
    /* 9FFB4 800AFFB4 2C00E212 */  beq        $s7, $v0, .L800B0068
    /* 9FFB8 800AFFB8 80801500 */   sll       $s0, $s5, 2
    /* 9FFBC 800AFFBC 51C00208 */  j          .L800B0144
    /* 9FFC0 800AFFC0 00000000 */   nop
  .L800AFFC4:
    /* 9FFC4 800AFFC4 5800AAAF */  sw         $t2, 0x58($sp)
    /* 9FFC8 800AFFC8 6800AA8F */  lw         $t2, 0x68($sp)
    /* 9FFCC 800AFFCC 0E80023C */  lui        $v0, %hi(plr)
    /* 9FFD0 800AFFD0 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 9FFD4 800AFFD4 21184201 */  addu       $v1, $t2, $v0
    /* 9FFD8 800AFFD8 0100A232 */  andi       $v0, $s5, 0x1
    /* 9FFDC 800AFFDC 02004010 */  beqz       $v0, .L800AFFE8
    /* 9FFE0 800AFFE0 FF000A24 */   addiu     $t2, $zero, 0xFF
    /* 9FFE4 800AFFE4 5800AAAF */  sw         $t2, 0x58($sp)
  .L800AFFE8:
    /* 9FFE8 800AFFE8 7F000A24 */  addiu      $t2, $zero, 0x7F
    /* 9FFEC 800AFFEC 6000AAAF */  sw         $t2, 0x60($sp)
    /* 9FFF0 800AFFF0 02004010 */  beqz       $v0, .L800AFFFC
    /* 9FFF4 800AFFF4 FF001E24 */   addiu     $fp, $zero, 0xFF
    /* 9FFF8 800AFFF8 7F001E24 */  addiu      $fp, $zero, 0x7F
  .L800AFFFC:
    /* 9FFFC 800AFFFC 4000A427 */  addiu      $a0, $sp, 0x40
    /* A0000 800B0000 2800628C */  lw         $v0, 0x28($v1)
    /* A0004 800B0004 2C00638C */  lw         $v1, 0x2C($v1)
    /* A0008 800B0008 4400A527 */  addiu      $a1, $sp, 0x44
    /* A000C 800B000C 4000A2AF */  sw         $v0, 0x40($sp)
    /* A0010 800B0010 6FBC020C */  jal        GetScrXY__FPiT0
    /* A0014 800B0014 4400A3AF */   sw        $v1, 0x44($sp)
    /* A0018 800B0018 4000A28F */  lw         $v0, 0x40($sp)
    /* A001C 800B001C 4400A38F */  lw         $v1, 0x44($sp)
    /* A0020 800B0020 FDFF4224 */  addiu      $v0, $v0, -0x3
    /* A0024 800B0024 4FC00208 */  j          .L800B013C
    /* A0028 800B0028 05006324 */   addiu     $v1, $v1, 0x5
  .L800B002C:
    /* A002C 800B002C 7000AA8F */  lw         $t2, 0x70($sp)
    /* A0030 800B0030 1080023C */  lui        $v0, %hi(monster)
    /* A0034 800B0034 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* A0038 800B0038 21104201 */  addu       $v0, $t2, $v0
    /* A003C 800B003C 34004380 */  lb         $v1, 0x34($v0)
    /* A0040 800B0040 4000A427 */  addiu      $a0, $sp, 0x40
    /* A0044 800B0044 C0180300 */  sll        $v1, $v1, 3
    /* A0048 800B0048 4000A3AF */  sw         $v1, 0x40($sp)
    /* A004C 800B004C 35004280 */  lb         $v0, 0x35($v0)
    /* A0050 800B0050 4400A527 */  addiu      $a1, $sp, 0x44
    /* A0054 800B0054 C0100200 */  sll        $v0, $v0, 3
    /* A0058 800B0058 6FBC020C */  jal        GetScrXY__FPiT0
    /* A005C 800B005C 4400A2AF */   sw        $v0, 0x44($sp)
    /* A0060 800B0060 51C00208 */  j          .L800B0144
    /* A0064 800B0064 00000000 */   nop
  .L800B0068:
    /* A0068 800B0068 21801502 */  addu       $s0, $s0, $s5
    /* A006C 800B006C 80801000 */  sll        $s0, $s0, 2
    /* A0070 800B0070 23801502 */  subu       $s0, $s0, $s5
    /* A0074 800B0074 80801000 */  sll        $s0, $s0, 2
    /* A0078 800B0078 1080023C */  lui        $v0, %hi(missile)
    /* A007C 800B007C 582C4224 */  addiu      $v0, $v0, %lo(missile)
    /* A0080 800B0080 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* A0084 800B0084 21800202 */   addu      $s0, $s0, $v0
    /* A0088 800B0088 31000382 */  lb         $v1, 0x31($s0)
    /* A008C 800B008C 00000000 */  nop
    /* A0090 800B0090 80300300 */  sll        $a2, $v1, 2
    /* A0094 800B0094 2130C300 */  addu       $a2, $a2, $v1
    /* A0098 800B0098 80300600 */  sll        $a2, $a2, 2
    /* A009C 800B009C 4000A6AF */  sw         $a2, 0x40($sp)
    /* A00A0 800B00A0 32000382 */  lb         $v1, 0x32($s0)
    /* A00A4 800B00A4 6210053C */  lui        $a1, (0x10624DD3 >> 16)
    /* A00A8 800B00A8 80380300 */  sll        $a3, $v1, 2
    /* A00AC 800B00AC 2138E300 */  addu       $a3, $a3, $v1
    /* A00B0 800B00B0 80380700 */  sll        $a3, $a3, 2
    /* A00B4 800B00B4 4400A7AF */  sw         $a3, 0x44($sp)
    /* A00B8 800B00B8 33000382 */  lb         $v1, 0x33($s0)
    /* A00BC 800B00BC D34DA534 */  ori        $a1, $a1, (0x10624DD3 & 0xFFFF)
    /* A00C0 800B00C0 80400300 */  sll        $t0, $v1, 2
    /* A00C4 800B00C4 21400301 */  addu       $t0, $t0, $v1
    /* A00C8 800B00C8 C0400800 */  sll        $t0, $t0, 3
    /* A00CC 800B00CC 23400301 */  subu       $t0, $t0, $v1
    /* A00D0 800B00D0 00410800 */  sll        $t0, $t0, 4
    /* A00D4 800B00D4 21400301 */  addu       $t0, $t0, $v1
    /* A00D8 800B00D8 18000501 */  mult       $t0, $a1
    /* A00DC 800B00DC 34000482 */  lb         $a0, 0x34($s0)
    /* A00E0 800B00E0 00000000 */  nop
    /* A00E4 800B00E4 80180400 */  sll        $v1, $a0, 2
    /* A00E8 800B00E8 21186400 */  addu       $v1, $v1, $a0
    /* A00EC 800B00EC C0180300 */  sll        $v1, $v1, 3
    /* A00F0 800B00F0 23186400 */  subu       $v1, $v1, $a0
    /* A00F4 800B00F4 10480000 */  mfhi       $t1
    /* A00F8 800B00F8 00190300 */  sll        $v1, $v1, 4
    /* A00FC 800B00FC 21186400 */  addu       $v1, $v1, $a0
    /* A0100 800B0100 18006500 */  mult       $v1, $a1
    /* A0104 800B0104 21204000 */  addu       $a0, $v0, $zero
    /* A0108 800B0108 C3470800 */  sra        $t0, $t0, 31
    /* A010C 800B010C 3800A527 */  addiu      $a1, $sp, 0x38
    /* A0110 800B0110 83110900 */  sra        $v0, $t1, 6
    /* A0114 800B0114 23104800 */  subu       $v0, $v0, $t0
    /* A0118 800B0118 C31F0300 */  sra        $v1, $v1, 31
    /* A011C 800B011C 1000A2AF */  sw         $v0, 0x10($sp)
    /* A0120 800B0120 10580000 */  mfhi       $t3
    /* A0124 800B0124 83110B00 */  sra        $v0, $t3, 6
    /* A0128 800B0128 23104300 */  subu       $v0, $v0, $v1
    /* A012C 800B012C 1746020C */  jal        GetScrXY__7CBlocksR4RECTiiii
    /* A0130 800B0130 1400A2AF */   sw        $v0, 0x14($sp)
    /* A0134 800B0134 3800A287 */  lh         $v0, 0x38($sp)
    /* A0138 800B0138 3A00A387 */  lh         $v1, 0x3A($sp)
  .L800B013C:
    /* A013C 800B013C 4000A2AF */  sw         $v0, 0x40($sp)
    /* A0140 800B0140 4400A3AF */  sw         $v1, 0x44($sp)
  .L800B0144:
    /* A0144 800B0144 BBC0020C */  jal        GetOverlayOtBase__7CBlocks_800b02ec
    /* A0148 800B0148 FF00D233 */   andi      $s2, $fp, 0xFF
    /* A014C 800B014C 46001024 */  addiu      $s0, $zero, 0x46
    /* A0150 800B0150 FFFF5324 */  addiu      $s3, $v0, -0x1
    /* A0154 800B0154 08000224 */  addiu      $v0, $zero, 0x8
    /* A0158 800B0158 5800B493 */  lbu        $s4, 0x58($sp)
    /* A015C 800B015C 5000AA8F */  lw         $t2, 0x50($sp)
    /* A0160 800B0160 6000B193 */  lbu        $s1, 0x60($sp)
    /* A0164 800B0164 1000B2AF */  sw         $s2, 0x10($sp)
    /* A0168 800B0168 1800B0AF */  sw         $s0, 0x18($sp)
    /* A016C 800B016C 1C00B6AF */  sw         $s6, 0x1C($sp)
    /* A0170 800B0170 2000A0AF */  sw         $zero, 0x20($sp)
    /* A0174 800B0174 2400B3AF */  sw         $s3, 0x24($sp)
    /* A0178 800B0178 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* A017C 800B017C 3000A2AF */  sw         $v0, 0x30($sp)
    /* A0180 800B0180 21308002 */  addu       $a2, $s4, $zero
    /* A0184 800B0184 C0180A00 */  sll        $v1, $t2, 3
    /* A0188 800B0188 01000A24 */  addiu      $t2, $zero, 0x1
    /* A018C 800B018C 1400A3AF */  sw         $v1, 0x14($sp)
    /* A0190 800B0190 4000A48F */  lw         $a0, 0x40($sp)
    /* A0194 800B0194 4400A58F */  lw         $a1, 0x44($sp)
    /* A0198 800B0198 21382002 */  addu       $a3, $s1, $zero
    /* A019C 800B019C 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* A01A0 800B01A0 2800AAAF */   sw        $t2, 0x28($sp)
    /* A01A4 800B01A4 5000AA8F */  lw         $t2, 0x50($sp)
    /* A01A8 800B01A8 21308002 */  addu       $a2, $s4, $zero
    /* A01AC 800B01AC 1000B2AF */  sw         $s2, 0x10($sp)
    /* A01B0 800B01B0 1800B0AF */  sw         $s0, 0x18($sp)
    /* A01B4 800B01B4 2000A0AF */  sw         $zero, 0x20($sp)
    /* A01B8 800B01B8 2400B3AF */  sw         $s3, 0x24($sp)
    /* A01BC 800B01BC 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* A01C0 800B01C0 80100A00 */  sll        $v0, $t2, 2
    /* A01C4 800B01C4 1400A2AF */  sw         $v0, 0x14($sp)
    /* A01C8 800B01C8 2D00C226 */  addiu      $v0, $s6, 0x2D
    /* A01CC 800B01CC 23100200 */  negu       $v0, $v0
    /* A01D0 800B01D0 01000A24 */  addiu      $t2, $zero, 0x1
    /* A01D4 800B01D4 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* A01D8 800B01D8 04000224 */  addiu      $v0, $zero, 0x4
    /* A01DC 800B01DC 3000A2AF */  sw         $v0, 0x30($sp)
    /* A01E0 800B01E0 4000A48F */  lw         $a0, 0x40($sp)
    /* A01E4 800B01E4 4400A58F */  lw         $a1, 0x44($sp)
    /* A01E8 800B01E8 21382002 */  addu       $a3, $s1, $zero
    /* A01EC 800B01EC 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* A01F0 800B01F0 2800AAAF */   sw        $t2, 0x28($sp)
    /* A01F4 800B01F4 1280023C */  lui        $v0, %hi(PauseMode)
    /* A01F8 800B01F8 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* A01FC 800B01FC 00000000 */  nop
    /* A0200 800B0200 06004014 */  bnez       $v0, .L800B021C
    /* A0204 800B0204 00000000 */   nop
    /* A0208 800B0208 4800AA8F */  lw         $t2, 0x48($sp)
    /* A020C 800B020C 00000000 */  nop
    /* A0210 800B0210 FFFF4A25 */  addiu      $t2, $t2, -0x1
    /* A0214 800B0214 4800AAAF */  sw         $t2, 0x48($sp)
    /* A0218 800B0218 0100D626 */  addiu      $s6, $s6, 0x1
  .L800B021C:
    /* A021C 800B021C EE80000C */  jal        TSK_Sleep
    /* A0220 800B0220 01000424 */   addiu     $a0, $zero, 0x1
    /* A0224 800B0224 D2BF0208 */  j          .L800AFF48
    /* A0228 800B0228 00000000 */   nop
  .L800B022C:
    /* A022C 800B022C 9C00BF8F */  lw         $ra, 0x9C($sp)
    /* A0230 800B0230 9800BE8F */  lw         $fp, 0x98($sp)
    /* A0234 800B0234 9400B78F */  lw         $s7, 0x94($sp)
    /* A0238 800B0238 9000B68F */  lw         $s6, 0x90($sp)
    /* A023C 800B023C 8C00B58F */  lw         $s5, 0x8C($sp)
    /* A0240 800B0240 8800B48F */  lw         $s4, 0x88($sp)
    /* A0244 800B0244 8400B38F */  lw         $s3, 0x84($sp)
    /* A0248 800B0248 8000B28F */  lw         $s2, 0x80($sp)
    /* A024C 800B024C 7C00B18F */  lw         $s1, 0x7C($sp)
    /* A0250 800B0250 7800B08F */  lw         $s0, 0x78($sp)
    /* A0254 800B0254 A000BD27 */  addiu      $sp, $sp, 0xA0
    /* A0258 800B0258 0800E003 */  jr         $ra
    /* A025C 800B025C 00000000 */   nop
endlabel ArrowTask__FP4TASK
