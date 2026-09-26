.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMapObjects__FPUcii, 0x2A0

glabel SetMapObjects__FPUcii
    /* 1DE90 80157A88 50FFBD27 */  addiu      $sp, $sp, -0xB0
    /* 1DE94 80157A8C 8C00B1AF */  sw         $s1, 0x8C($sp)
    /* 1DE98 80157A90 21888000 */  addu       $s1, $a0, $zero
    /* 1DE9C 80157A94 9C00B5AF */  sw         $s5, 0x9C($sp)
    /* 1DEA0 80157A98 21A8A000 */  addu       $s5, $a1, $zero
    /* 1DEA4 80157A9C A400B7AF */  sw         $s7, 0xA4($sp)
    /* 1DEA8 80157AA0 21B8C000 */  addu       $s7, $a2, $zero
    /* 1DEAC 80157AA4 A800BFAF */  sw         $ra, 0xA8($sp)
    /* 1DEB0 80157AA8 A000B6AF */  sw         $s6, 0xA0($sp)
    /* 1DEB4 80157AAC 9800B4AF */  sw         $s4, 0x98($sp)
    /* 1DEB8 80157AB0 9400B3AF */  sw         $s3, 0x94($sp)
    /* 1DEBC 80157AB4 9000B2AF */  sw         $s2, 0x90($sp)
    /* 1DEC0 80157AB8 4A5F050C */  jal        ClrAllObjects__Fv
    /* 1DEC4 80157ABC 8800B0AF */   sw        $s0, 0x88($sp)
    /* 1DEC8 80157AC0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1DECC 80157AC4 37001024 */  addiu      $s0, $zero, 0x37
    /* 1DED0 80157AC8 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 1DED4 80157ACC D0B922A0 */  sb         $v0, %lo(InitObjFlag)($at)
    /* 1DED8 80157AD0 4700A227 */  addiu      $v0, $sp, 0x47
  .L80157AD4:
    /* 1DEDC 80157AD4 000040A0 */  sb         $zero, 0x0($v0)
    /* 1DEE0 80157AD8 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 1DEE4 80157ADC FDFF0106 */  bgez       $s0, .L80157AD4
    /* 1DEE8 80157AE0 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1DEEC 80157AE4 0E80033C */  lui        $v1, %hi(AllObjects)
    /* 1DEF0 80157AE8 B0846380 */  lb         $v1, %lo(AllObjects)($v1)
    /* 1DEF4 80157AEC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1DEF8 80157AF0 1E006210 */  beq        $v1, $v0, .L80157B6C
    /* 1DEFC 80157AF4 00000000 */   nop
    /* 1DF00 80157AF8 01000624 */  addiu      $a2, $zero, 0x1
    /* 1DF04 80157AFC 1000A727 */  addiu      $a3, $sp, 0x10
    /* 1DF08 80157B00 FFFF0824 */  addiu      $t0, $zero, -0x1
    /* 1DF0C 80157B04 0E80053C */  lui        $a1, %hi(AllObjects)
    /* 1DF10 80157B08 B084A524 */  addiu      $a1, $a1, %lo(AllObjects)
    /* 1DF14 80157B0C 21200000 */  addu       $a0, $zero, $zero
    /* 1DF18 80157B10 0000A280 */  lb         $v0, 0x0($a1)
  .L80157B14:
    /* 1DF1C 80157B14 00000000 */  nop
    /* 1DF20 80157B18 0F004614 */  bne        $v0, $a2, .L80157B58
    /* 1DF24 80157B1C 00000000 */   nop
    /* 1DF28 80157B20 1280033C */  lui        $v1, %hi(leveltype)
    /* 1DF2C 80157B24 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 1DF30 80157B28 0E80013C */  lui        $at, %hi(AllObjects + 0x4)
    /* 1DF34 80157B2C 21082400 */  addu       $at, $at, $a0
    /* 1DF38 80157B30 B4842280 */  lb         $v0, %lo(AllObjects + 0x4)($at)
    /* 1DF3C 80157B34 00000000 */  nop
    /* 1DF40 80157B38 07006214 */  bne        $v1, $v0, .L80157B58
    /* 1DF44 80157B3C 00000000 */   nop
    /* 1DF48 80157B40 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 1DF4C 80157B44 21082400 */  addu       $at, $at, $a0
    /* 1DF50 80157B48 B1842280 */  lb         $v0, %lo(AllObjects + 0x1)($at)
    /* 1DF54 80157B4C 00000000 */  nop
    /* 1DF58 80157B50 2110E200 */  addu       $v0, $a3, $v0
    /* 1DF5C 80157B54 000046A0 */  sb         $a2, 0x0($v0)
  .L80157B58:
    /* 1DF60 80157B58 1200A524 */  addiu      $a1, $a1, 0x12
    /* 1DF64 80157B5C 0000A280 */  lb         $v0, 0x0($a1)
    /* 1DF68 80157B60 00000000 */  nop
    /* 1DF6C 80157B64 EBFF4814 */  bne        $v0, $t0, .L80157B14
    /* 1DF70 80157B68 12008424 */   addiu     $a0, $a0, 0x12
  .L80157B6C:
    /* 1DF74 80157B6C 00003392 */  lbu        $s3, 0x0($s1)
    /* 1DF78 80157B70 02003126 */  addiu      $s1, $s1, 0x2
    /* 1DF7C 80157B74 00003492 */  lbu        $s4, 0x0($s1)
    /* 1DF80 80157B78 00000000 */  nop
    /* 1DF84 80157B7C 18007402 */  mult       $s3, $s4
    /* 1DF88 80157B80 12100000 */  mflo       $v0
    /* 1DF8C 80157B84 40981300 */  sll        $s3, $s3, 1
    /* 1DF90 80157B88 40A01400 */  sll        $s4, $s4, 1
    /* 1DF94 80157B8C 18007402 */  mult       $s3, $s4
    /* 1DF98 80157B90 21900000 */  addu       $s2, $zero, $zero
    /* 1DF9C 80157B94 40100200 */  sll        $v0, $v0, 1
    /* 1DFA0 80157B98 02004224 */  addiu      $v0, $v0, 0x2
    /* 1DFA4 80157B9C 12180000 */  mflo       $v1
    /* 1DFA8 80157BA0 80180300 */  sll        $v1, $v1, 2
    /* 1DFAC 80157BA4 21104300 */  addu       $v0, $v0, $v1
    /* 1DFB0 80157BA8 21882202 */  addu       $s1, $s1, $v0
    /* 1DFB4 80157BAC 1F008012 */  beqz       $s4, .L80157C2C
    /* 1DFB8 80157BB0 21382002 */   addu      $a3, $s1, $zero
    /* 1DFBC 80157BB4 0E80063C */  lui        $a2, %hi(ObjTypeConv)
    /* 1DFC0 80157BB8 EC82C624 */  addiu      $a2, $a2, %lo(ObjTypeConv)
    /* 1DFC4 80157BBC 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1DFC8 80157BC0 01000524 */  addiu      $a1, $zero, 0x1
  .L80157BC4:
    /* 1DFCC 80157BC4 15006012 */  beqz       $s3, .L80157C1C
    /* 1DFD0 80157BC8 21800000 */   addu      $s0, $zero, $zero
  .L80157BCC:
    /* 1DFD4 80157BCC 00002292 */  lbu        $v0, 0x0($s1)
    /* 1DFD8 80157BD0 00000000 */  nop
    /* 1DFDC 80157BD4 0D004010 */  beqz       $v0, .L80157C0C
    /* 1DFE0 80157BD8 80100200 */   sll       $v0, $v0, 2
    /* 1DFE4 80157BDC 21104600 */  addu       $v0, $v0, $a2
    /* 1DFE8 80157BE0 0000438C */  lw         $v1, 0x0($v0)
    /* 1DFEC 80157BE4 00000000 */  nop
    /* 1DFF0 80157BE8 C0100300 */  sll        $v0, $v1, 3
    /* 1DFF4 80157BEC 21104300 */  addu       $v0, $v0, $v1
    /* 1DFF8 80157BF0 40100200 */  sll        $v0, $v0, 1
    /* 1DFFC 80157BF4 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 1E000 80157BF8 21082200 */  addu       $at, $at, $v0
    /* 1E004 80157BFC B1842280 */  lb         $v0, %lo(AllObjects + 0x1)($at)
    /* 1E008 80157C00 00000000 */  nop
    /* 1E00C 80157C04 21108200 */  addu       $v0, $a0, $v0
    /* 1E010 80157C08 000045A0 */  sb         $a1, 0x0($v0)
  .L80157C0C:
    /* 1E014 80157C0C 01001026 */  addiu      $s0, $s0, 0x1
    /* 1E018 80157C10 2A101302 */  slt        $v0, $s0, $s3
    /* 1E01C 80157C14 EDFF4014 */  bnez       $v0, .L80157BCC
    /* 1E020 80157C18 02003126 */   addiu     $s1, $s1, 0x2
  .L80157C1C:
    /* 1E024 80157C1C 01005226 */  addiu      $s2, $s2, 0x1
    /* 1E028 80157C20 2A105402 */  slt        $v0, $s2, $s4
    /* 1E02C 80157C24 E7FF4014 */  bnez       $v0, .L80157BC4
    /* 1E030 80157C28 00000000 */   nop
  .L80157C2C:
    /* 1E034 80157C2C 21800000 */  addu       $s0, $zero, $zero
    /* 1E038 80157C30 0E80043C */  lui        $a0, %hi(ObjFileList)
    /* 1E03C 80157C34 20A38424 */  addiu      $a0, $a0, %lo(ObjFileList)
    /* 1E040 80157C38 1000A327 */  addiu      $v1, $sp, 0x10
  .L80157C3C:
    /* 1E044 80157C3C 00006290 */  lbu        $v0, 0x0($v1)
    /* 1E048 80157C40 00000000 */  nop
    /* 1E04C 80157C44 0C004010 */  beqz       $v0, .L80157C78
    /* 1E050 80157C48 00000000 */   nop
    /* 1E054 80157C4C 1280023C */  lui        $v0, %hi(numobjfiles)
    /* 1E058 80157C50 C0B9428C */  lw         $v0, %lo(numobjfiles)($v0)
    /* 1E05C 80157C54 00000000 */  nop
    /* 1E060 80157C58 21104400 */  addu       $v0, $v0, $a0
    /* 1E064 80157C5C 000050A0 */  sb         $s0, 0x0($v0)
    /* 1E068 80157C60 1280023C */  lui        $v0, %hi(numobjfiles)
    /* 1E06C 80157C64 C0B9428C */  lw         $v0, %lo(numobjfiles)($v0)
    /* 1E070 80157C68 00000000 */  nop
    /* 1E074 80157C6C 01004224 */  addiu      $v0, $v0, 0x1
    /* 1E078 80157C70 1280013C */  lui        $at, %hi(numobjfiles)
    /* 1E07C 80157C74 C0B922AC */  sw         $v0, %lo(numobjfiles)($at)
  .L80157C78:
    /* 1E080 80157C78 01001026 */  addiu      $s0, $s0, 0x1
    /* 1E084 80157C7C 3800022A */  slti       $v0, $s0, 0x38
    /* 1E088 80157C80 EEFF4014 */  bnez       $v0, .L80157C3C
    /* 1E08C 80157C84 01006324 */   addiu     $v1, $v1, 0x1
    /* 1E090 80157C88 2188E000 */  addu       $s1, $a3, $zero
    /* 1E094 80157C8C 18008012 */  beqz       $s4, .L80157CF0
    /* 1E098 80157C90 21900000 */   addu      $s2, $zero, $zero
    /* 1E09C 80157C94 1000B626 */  addiu      $s6, $s5, 0x10
    /* 1E0A0 80157C98 1000F526 */  addiu      $s5, $s7, 0x10
    /* 1E0A4 80157C9C 0E80173C */  lui        $s7, %hi(ObjTypeConv)
    /* 1E0A8 80157CA0 EC82F726 */  addiu      $s7, $s7, %lo(ObjTypeConv)
  .L80157CA4:
    /* 1E0AC 80157CA4 0E006012 */  beqz       $s3, .L80157CE0
    /* 1E0B0 80157CA8 21800000 */   addu      $s0, $zero, $zero
  .L80157CAC:
    /* 1E0B4 80157CAC 00002292 */  lbu        $v0, 0x0($s1)
    /* 1E0B8 80157CB0 00000000 */  nop
    /* 1E0BC 80157CB4 06004010 */  beqz       $v0, .L80157CD0
    /* 1E0C0 80157CB8 80100200 */   sll       $v0, $v0, 2
    /* 1E0C4 80157CBC 21105700 */  addu       $v0, $v0, $s7
    /* 1E0C8 80157CC0 0000448C */  lw         $a0, 0x0($v0)
    /* 1E0CC 80157CC4 21281602 */  addu       $a1, $s0, $s6
    /* 1E0D0 80157CC8 BE4E010C */  jal        AddObject__Fiii
    /* 1E0D4 80157CCC 21305502 */   addu      $a2, $s2, $s5
  .L80157CD0:
    /* 1E0D8 80157CD0 01001026 */  addiu      $s0, $s0, 0x1
    /* 1E0DC 80157CD4 2A101302 */  slt        $v0, $s0, $s3
    /* 1E0E0 80157CD8 F4FF4014 */  bnez       $v0, .L80157CAC
    /* 1E0E4 80157CDC 02003126 */   addiu     $s1, $s1, 0x2
  .L80157CE0:
    /* 1E0E8 80157CE0 01005226 */  addiu      $s2, $s2, 0x1
    /* 1E0EC 80157CE4 2A105402 */  slt        $v0, $s2, $s4
    /* 1E0F0 80157CE8 EEFF4014 */  bnez       $v0, .L80157CA4
    /* 1E0F4 80157CEC 00000000 */   nop
  .L80157CF0:
    /* 1E0F8 80157CF0 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 1E0FC 80157CF4 D0B920A0 */  sb         $zero, %lo(InitObjFlag)($at)
    /* 1E100 80157CF8 A800BF8F */  lw         $ra, 0xA8($sp)
    /* 1E104 80157CFC A400B78F */  lw         $s7, 0xA4($sp)
    /* 1E108 80157D00 A000B68F */  lw         $s6, 0xA0($sp)
    /* 1E10C 80157D04 9C00B58F */  lw         $s5, 0x9C($sp)
    /* 1E110 80157D08 9800B48F */  lw         $s4, 0x98($sp)
    /* 1E114 80157D0C 9400B38F */  lw         $s3, 0x94($sp)
    /* 1E118 80157D10 9000B28F */  lw         $s2, 0x90($sp)
    /* 1E11C 80157D14 8C00B18F */  lw         $s1, 0x8C($sp)
    /* 1E120 80157D18 8800B08F */  lw         $s0, 0x88($sp)
    /* 1E124 80157D1C B000BD27 */  addiu      $sp, $sp, 0xB0
    /* 1E128 80157D20 0800E003 */  jr         $ra
    /* 1E12C 80157D24 00000000 */   nop
endlabel SetMapObjects__FPUcii
