.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlayFMV__FPcii, 0x1D0

glabel PlayFMV__FPcii
    /* 9CF58 800ACF58 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 9CF5C 800ACF5C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9CF60 800ACF60 21808000 */  addu       $s0, $a0, $zero
    /* 9CF64 800ACF64 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9CF68 800ACF68 2190A000 */  addu       $s2, $a1, $zero
    /* 9CF6C 800ACF6C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9CF70 800ACF70 2198C000 */  addu       $s3, $a2, $zero
    /* 9CF74 800ACF74 21200000 */  addu       $a0, $zero, $zero
    /* 9CF78 800ACF78 2800BFAF */  sw         $ra, 0x28($sp)
    /* 9CF7C 800ACF7C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 9CF80 800ACF80 2000B4AF */  sw         $s4, 0x20($sp)
    /* 9CF84 800ACF84 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 9CF88 800ACF88 1400B1AF */   sw        $s1, 0x14($sp)
    /* 9CF8C 800ACF8C 9A55020C */  jal        OVR_GetCurrentOverlay__Fv
    /* 9CF90 800ACF90 00000000 */   nop
    /* 9CF94 800ACF94 94DF010C */  jal        music_stop__Fv
    /* 9CF98 800ACF98 21A84000 */   addu      $s5, $v0, $zero
    /* 9CF9C 800ACF9C 2755020C */  jal        OVR_LoadFmv__Fv
    /* 9CFA0 800ACFA0 00000000 */   nop
    /* 9CFA4 800ACFA4 21200002 */  addu       $a0, $s0, $zero
    /* 9CFA8 800ACFA8 21284002 */  addu       $a1, $s2, $zero
    /* 9CFAC 800ACFAC D660050C */  jal        func_80158358
    /* 9CFB0 800ACFB0 21306002 */   addu      $a2, $s3, $zero
    /* 9CFB4 800ACFB4 21884000 */  addu       $s1, $v0, $zero
    /* 9CFB8 800ACFB8 1180053C */  lui        $a1, %hi(D_80110E40)
    /* 9CFBC 800ACFBC 400EA524 */  addiu      $a1, $a1, %lo(D_80110E40)
    /* 9CFC0 800ACFC0 7F67000C */  jal        strcmp
    /* 9CFC4 800ACFC4 21200002 */   addu      $a0, $s0, $zero
    /* 9CFC8 800ACFC8 16004014 */  bnez       $v0, .L800AD024
    /* 9CFCC 800ACFCC 21A00000 */   addu      $s4, $zero, $zero
    /* 9CFD0 800ACFD0 1280023C */  lui        $v0, %hi(user_start)
    /* 9CFD4 800ACFD4 E4B4428C */  lw         $v0, %lo(user_start)($v0)
    /* 9CFD8 800ACFD8 00000000 */  nop
    /* 9CFDC 800ACFDC 11004014 */  bnez       $v0, .L800AD024
    /* 9CFE0 800ACFE0 21284002 */   addu      $a1, $s2, $zero
    /* 9CFE4 800ACFE4 1180043C */  lui        $a0, %hi(D_80110E94)
    /* 9CFE8 800ACFE8 940E8424 */  addiu      $a0, $a0, %lo(D_80110E94)
    /* 9CFEC 800ACFEC D660050C */  jal        func_80158358
    /* 9CFF0 800ACFF0 21306002 */   addu      $a2, $s3, $zero
    /* 9CFF4 800ACFF4 1280033C */  lui        $v1, %hi(user_start)
    /* 9CFF8 800ACFF8 E4B4638C */  lw         $v1, %lo(user_start)($v1)
    /* 9CFFC 800ACFFC 00000000 */  nop
    /* 9D000 800AD000 07006014 */  bnez       $v1, .L800AD020
    /* 9D004 800AD004 21884000 */   addu      $s1, $v0, $zero
    /* 9D008 800AD008 1180043C */  lui        $a0, %hi(D_80110EA4)
    /* 9D00C 800AD00C A40E8424 */  addiu      $a0, $a0, %lo(D_80110EA4)
    /* 9D010 800AD010 21284002 */  addu       $a1, $s2, $zero
    /* 9D014 800AD014 D660050C */  jal        func_80158358
    /* 9D018 800AD018 21306002 */   addu      $a2, $s3, $zero
    /* 9D01C 800AD01C 21884000 */  addu       $s1, $v0, $zero
  .L800AD020:
    /* 9D020 800AD020 21A00000 */  addu       $s4, $zero, $zero
  .L800AD024:
    /* 9D024 800AD024 1180053C */  lui        $a1, %hi(D_80110E64)
    /* 9D028 800AD028 640EA524 */  addiu      $a1, $a1, %lo(D_80110E64)
    /* 9D02C 800AD02C 7F67000C */  jal        strcmp
    /* 9D030 800AD030 21200002 */   addu      $a0, $s0, $zero
    /* 9D034 800AD034 0D004010 */  beqz       $v0, .L800AD06C
    /* 9D038 800AD038 00000000 */   nop
    /* 9D03C 800AD03C 1180053C */  lui        $a1, %hi(D_80110E74)
    /* 9D040 800AD040 740EA524 */  addiu      $a1, $a1, %lo(D_80110E74)
    /* 9D044 800AD044 7F67000C */  jal        strcmp
    /* 9D048 800AD048 21200002 */   addu      $a0, $s0, $zero
    /* 9D04C 800AD04C 07004010 */  beqz       $v0, .L800AD06C
    /* 9D050 800AD050 00000000 */   nop
    /* 9D054 800AD054 1180053C */  lui        $a1, %hi(D_80110E84)
    /* 9D058 800AD058 840EA524 */  addiu      $a1, $a1, %lo(D_80110E84)
    /* 9D05C 800AD05C 7F67000C */  jal        strcmp
    /* 9D060 800AD060 21200002 */   addu      $a0, $s0, $zero
    /* 9D064 800AD064 02004014 */  bnez       $v0, .L800AD070
    /* 9D068 800AD068 00000000 */   nop
  .L800AD06C:
    /* 9D06C 800AD06C 01001424 */  addiu      $s4, $zero, 0x1
  .L800AD070:
    /* 9D070 800AD070 0D008012 */  beqz       $s4, .L800AD0A8
    /* 9D074 800AD074 0500A22E */   sltiu     $v0, $s5, 0x5
    /* 9D078 800AD078 1280023C */  lui        $v0, %hi(user_start)
    /* 9D07C 800AD07C E4B4428C */  lw         $v0, %lo(user_start)($v0)
    /* 9D080 800AD080 00000000 */  nop
    /* 9D084 800AD084 08004014 */  bnez       $v0, .L800AD0A8
    /* 9D088 800AD088 0500A22E */   sltiu     $v0, $s5, 0x5
    /* 9D08C 800AD08C 1180043C */  lui        $a0, %hi(D_80110E4C)
    /* 9D090 800AD090 4C0E8424 */  addiu      $a0, $a0, %lo(D_80110E4C)
    /* 9D094 800AD094 21284002 */  addu       $a1, $s2, $zero
    /* 9D098 800AD098 D660050C */  jal        func_80158358
    /* 9D09C 800AD09C 21306002 */   addu      $a2, $s3, $zero
    /* 9D0A0 800AD0A0 21884000 */  addu       $s1, $v0, $zero
    /* 9D0A4 800AD0A4 0500A22E */  sltiu      $v0, $s5, 0x5
  .L800AD0A8:
    /* 9D0A8 800AD0A8 11004010 */  beqz       $v0, .L800AD0F0
    /* 9D0AC 800AD0AC 80101500 */   sll       $v0, $s5, 2
    /* 9D0B0 800AD0B0 1180013C */  lui        $at, %hi(jtbl_80110EB0)
    /* 9D0B4 800AD0B4 21082200 */  addu       $at, $at, $v0
    /* 9D0B8 800AD0B8 B00E228C */  lw         $v0, %lo(jtbl_80110EB0)($at)
    /* 9D0BC 800AD0BC 00000000 */  nop
    /* 9D0C0 800AD0C0 08004000 */  jr         $v0
    /* 9D0C4 800AD0C4 00000000 */   nop
  jlabel .L800AD0C8
    /* 9D0C8 800AD0C8 0955020C */  jal        OVR_LoadPregame__Fv
    /* 9D0CC 800AD0CC 00000000 */   nop
    /* 9D0D0 800AD0D0 3CB40208 */  j          .L800AD0F0
    /* 9D0D4 800AD0D4 00000000 */   nop
  jlabel .L800AD0D8
    /* 9D0D8 800AD0D8 1D55020C */  jal        OVR_LoadGame__Fv
    /* 9D0DC 800AD0DC 00000000 */   nop
    /* 9D0E0 800AD0E0 3CB40208 */  j          .L800AD0F0
    /* 9D0E4 800AD0E4 00000000 */   nop
  jlabel .L800AD0E8
    /* 9D0E8 800AD0E8 1355020C */  jal        OVR_LoadFrontend__Fv
    /* 9D0EC 800AD0EC 00000000 */   nop
  jlabel .L800AD0F0
    /* 9D0F0 800AD0F0 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 9D0F4 800AD0F4 01000424 */   addiu     $a0, $zero, 0x1
    /* 9D0F8 800AD0F8 00141100 */  sll        $v0, $s1, 16
    /* 9D0FC 800AD0FC 03140200 */  sra        $v0, $v0, 16
    /* 9D100 800AD100 2800BF8F */  lw         $ra, 0x28($sp)
    /* 9D104 800AD104 2400B58F */  lw         $s5, 0x24($sp)
    /* 9D108 800AD108 2000B48F */  lw         $s4, 0x20($sp)
    /* 9D10C 800AD10C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9D110 800AD110 1800B28F */  lw         $s2, 0x18($sp)
    /* 9D114 800AD114 1400B18F */  lw         $s1, 0x14($sp)
    /* 9D118 800AD118 1000B08F */  lw         $s0, 0x10($sp)
    /* 9D11C 800AD11C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 9D120 800AD120 0800E003 */  jr         $ra
    /* 9D124 800AD124 00000000 */   nop
endlabel PlayFMV__FPcii
