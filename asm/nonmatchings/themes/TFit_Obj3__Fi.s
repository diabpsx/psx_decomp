.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TFit_Obj3__Fi, 0xC0

glabel TFit_Obj3__Fi
    /* 2275C 8015C354 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 22760 8015C358 2400B3AF */  sw         $s3, 0x24($sp)
    /* 22764 8015C35C 21988000 */  addu       $s3, $a0, $zero
    /* 22768 8015C360 2800BFAF */  sw         $ra, 0x28($sp)
    /* 2276C 8015C364 2000B2AF */  sw         $s2, 0x20($sp)
    /* 22770 8015C368 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 22774 8015C36C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 22778 8015C370 1280053C */  lui        $a1, %hi(D_8011C15C)
    /* 2277C 8015C374 5CC1A524 */  addiu      $a1, $a1, %lo(D_8011C15C)
    /* 22780 8015C378 0300A288 */  lwl        $v0, 0x3($a1)
    /* 22784 8015C37C 0000A298 */  lwr        $v0, 0x0($a1)
    /* 22788 8015C380 00000000 */  nop
    /* 2278C 8015C384 1300A2AB */  swl        $v0, 0x13($sp)
    /* 22790 8015C388 1000A2BB */  swr        $v0, 0x10($sp)
    /* 22794 8015C38C 01001124 */  addiu      $s1, $zero, 0x1
    /* 22798 8015C390 0F00B227 */  addiu      $s2, $sp, 0xF
  .L8015C394:
    /* 2279C 8015C394 01001024 */  addiu      $s0, $zero, 0x1
    /* 227A0 8015C398 21200002 */  addu       $a0, $s0, $zero
  .L8015C39C:
    /* 227A4 8015C39C 1280023C */  lui        $v0, %hi(leveltype)
    /* 227A8 8015C3A0 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 227AC 8015C3A4 21282002 */  addu       $a1, $s1, $zero
    /* 227B0 8015C3A8 21104202 */  addu       $v0, $s2, $v0
    /* 227B4 8015C3AC 00004780 */  lb         $a3, 0x0($v0)
    /* 227B8 8015C3B0 8270050C */  jal        CheckThemeObj3__Fiiii
    /* 227BC 8015C3B4 21306002 */   addu      $a2, $s3, $zero
    /* 227C0 8015C3B8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 227C4 8015C3BC 05004010 */  beqz       $v0, .L8015C3D4
    /* 227C8 8015C3C0 01000224 */   addiu     $v0, $zero, 0x1
    /* 227CC 8015C3C4 181A90AF */  sw         $s0, %gp_rel(themex)($gp)
    /* 227D0 8015C3C8 1C1A91AF */  sw         $s1, %gp_rel(themey)($gp)
    /* 227D4 8015C3CC FD700508 */  j          .L8015C3F4
    /* 227D8 8015C3D0 00000000 */   nop
  .L8015C3D4:
    /* 227DC 8015C3D4 01001026 */  addiu      $s0, $s0, 0x1
    /* 227E0 8015C3D8 5F00022A */  slti       $v0, $s0, 0x5F
    /* 227E4 8015C3DC EFFF4014 */  bnez       $v0, .L8015C39C
    /* 227E8 8015C3E0 21200002 */   addu      $a0, $s0, $zero
    /* 227EC 8015C3E4 01003126 */  addiu      $s1, $s1, 0x1
    /* 227F0 8015C3E8 5F00222A */  slti       $v0, $s1, 0x5F
    /* 227F4 8015C3EC E9FF4014 */  bnez       $v0, .L8015C394
    /* 227F8 8015C3F0 21100000 */   addu      $v0, $zero, $zero
  .L8015C3F4:
    /* 227FC 8015C3F4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 22800 8015C3F8 2400B38F */  lw         $s3, 0x24($sp)
    /* 22804 8015C3FC 2000B28F */  lw         $s2, 0x20($sp)
    /* 22808 8015C400 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2280C 8015C404 1800B08F */  lw         $s0, 0x18($sp)
    /* 22810 8015C408 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 22814 8015C40C 0800E003 */  jr         $ra
    /* 22818 8015C410 00000000 */   nop
endlabel TFit_Obj3__Fi
