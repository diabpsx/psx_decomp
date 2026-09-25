.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_resumeall__Fv, 0x74

glabel STR_resumeall__Fv
    /* 892A8 800992A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 892AC 800992AC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 892B0 800992B0 21900000 */  addu       $s2, $zero, $zero
    /* 892B4 800992B4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 892B8 800992B8 0C80113C */  lui        $s1, %hi(SFXTab)
    /* 892BC 800992BC E09B3126 */  addiu      $s1, $s1, %lo(SFXTab)
    /* 892C0 800992C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 892C4 800992C4 21800000 */  addu       $s0, $zero, $zero
    /* 892C8 800992C8 1C00BFAF */  sw         $ra, 0x1C($sp)
  .L800992CC:
    /* 892CC 800992CC 0C80013C */  lui        $at, %hi(SFXTab)
    /* 892D0 800992D0 21083000 */  addu       $at, $at, $s0
    /* 892D4 800992D4 E09B2280 */  lb         $v0, %lo(SFXTab)($at)
    /* 892D8 800992D8 00000000 */  nop
    /* 892DC 800992DC 03004010 */  beqz       $v0, .L800992EC
    /* 892E0 800992E0 21202002 */   addu      $a0, $s1, $zero
    /* 892E4 800992E4 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 892E8 800992E8 04000524 */   addiu     $a1, $zero, 0x4
  .L800992EC:
    /* 892EC 800992EC 84003126 */  addiu      $s1, $s1, 0x84
    /* 892F0 800992F0 01005226 */  addiu      $s2, $s2, 0x1
    /* 892F4 800992F4 0200422A */  slti       $v0, $s2, 0x2
    /* 892F8 800992F8 F4FF4014 */  bnez       $v0, .L800992CC
    /* 892FC 800992FC 84001026 */   addiu     $s0, $s0, 0x84
    /* 89300 80099300 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 89304 80099304 1800B28F */  lw         $s2, 0x18($sp)
    /* 89308 80099308 1400B18F */  lw         $s1, 0x14($sp)
    /* 8930C 8009930C 1000B08F */  lw         $s0, 0x10($sp)
    /* 89310 80099310 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 89314 80099314 0800E003 */  jr         $ra
    /* 89318 80099318 00000000 */   nop
endlabel STR_resumeall__Fv
