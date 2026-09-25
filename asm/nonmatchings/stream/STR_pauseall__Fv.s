.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_pauseall__Fv, 0x74

glabel STR_pauseall__Fv
    /* 89234 80099234 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 89238 80099238 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8923C 8009923C 21900000 */  addu       $s2, $zero, $zero
    /* 89240 80099240 1400B1AF */  sw         $s1, 0x14($sp)
    /* 89244 80099244 0C80113C */  lui        $s1, %hi(SFXTab)
    /* 89248 80099248 E09B3126 */  addiu      $s1, $s1, %lo(SFXTab)
    /* 8924C 8009924C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 89250 80099250 21800000 */  addu       $s0, $zero, $zero
    /* 89254 80099254 1C00BFAF */  sw         $ra, 0x1C($sp)
  .L80099258:
    /* 89258 80099258 0C80013C */  lui        $at, %hi(SFXTab)
    /* 8925C 8009925C 21083000 */  addu       $at, $at, $s0
    /* 89260 80099260 E09B2280 */  lb         $v0, %lo(SFXTab)($at)
    /* 89264 80099264 00000000 */  nop
    /* 89268 80099268 03004010 */  beqz       $v0, .L80099278
    /* 8926C 8009926C 21202002 */   addu      $a0, $s1, $zero
    /* 89270 80099270 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 89274 80099274 03000524 */   addiu     $a1, $zero, 0x3
  .L80099278:
    /* 89278 80099278 84003126 */  addiu      $s1, $s1, 0x84
    /* 8927C 8009927C 01005226 */  addiu      $s2, $s2, 0x1
    /* 89280 80099280 0200422A */  slti       $v0, $s2, 0x2
    /* 89284 80099284 F4FF4014 */  bnez       $v0, .L80099258
    /* 89288 80099288 84001026 */   addiu     $s0, $s0, 0x84
    /* 8928C 8009928C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 89290 80099290 1800B28F */  lw         $s2, 0x18($sp)
    /* 89294 80099294 1400B18F */  lw         $s1, 0x14($sp)
    /* 89298 80099298 1000B08F */  lw         $s0, 0x10($sp)
    /* 8929C 8009929C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 892A0 800992A0 0800E003 */  jr         $ra
    /* 892A4 800992A4 00000000 */   nop
endlabel STR_pauseall__Fv
