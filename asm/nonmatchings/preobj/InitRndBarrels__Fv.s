.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitRndBarrels__Fv, 0x18C

glabel InitRndBarrels__Fv
    /* 1E61C 80158214 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1E620 80158218 05000424 */  addiu      $a0, $zero, 0x5
    /* 1E624 8015821C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 1E628 80158220 3000BEAF */  sw         $fp, 0x30($sp)
    /* 1E62C 80158224 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1E630 80158228 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1E634 8015822C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1E638 80158230 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1E63C 80158234 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1E640 80158238 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1E644 8015823C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E648 80158240 C9F6000C */  jal        ENG_random__Fl
    /* 1E64C 80158244 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1E650 80158248 03005E24 */  addiu      $fp, $v0, 0x3
    /* 1E654 8015824C 21A80000 */  addu       $s5, $zero, $zero
    /* 1E658 80158250 0E80173C */  lui        $s7, %hi(bxadd)
    /* 1E65C 80158254 A88BF726 */  addiu      $s7, $s7, %lo(bxadd)
    /* 1E660 80158258 0E80163C */  lui        $s6, %hi(byadd)
    /* 1E664 8015825C C88BD626 */  addiu      $s6, $s6, %lo(byadd)
  .L80158260:
    /* 1E668 80158260 2A10BE02 */  slt        $v0, $s5, $fp
    /* 1E66C 80158264 41004010 */  beqz       $v0, .L8015836C
    /* 1E670 80158268 00000000 */   nop
  .L8015826C:
    /* 1E674 8015826C C9F6000C */  jal        ENG_random__Fl
    /* 1E678 80158270 40000424 */   addiu     $a0, $zero, 0x40
    /* 1E67C 80158274 10005324 */  addiu      $s3, $v0, 0x10
    /* 1E680 80158278 C9F6000C */  jal        ENG_random__Fl
    /* 1E684 8015827C 40000424 */   addiu     $a0, $zero, 0x40
    /* 1E688 80158280 10005224 */  addiu      $s2, $v0, 0x10
    /* 1E68C 80158284 21206002 */  addu       $a0, $s3, $zero
    /* 1E690 80158288 305D050C */  jal        RndLocOk__Fii
    /* 1E694 8015828C 21284002 */   addu      $a1, $s2, $zero
    /* 1E698 80158290 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1E69C 80158294 F5FF4010 */  beqz       $v0, .L8015826C
    /* 1E6A0 80158298 00000000 */   nop
    /* 1E6A4 8015829C C9F6000C */  jal        ENG_random__Fl
    /* 1E6A8 801582A0 04000424 */   addiu     $a0, $zero, 0x4
    /* 1E6AC 801582A4 02004010 */  beqz       $v0, .L801582B0
    /* 1E6B0 801582A8 3A000424 */   addiu     $a0, $zero, 0x3A
    /* 1E6B4 801582AC 39000424 */  addiu      $a0, $zero, 0x39
  .L801582B0:
    /* 1E6B8 801582B0 21286002 */  addu       $a1, $s3, $zero
    /* 1E6BC 801582B4 BE4E010C */  jal        AddObject__Fiii
    /* 1E6C0 801582B8 21304002 */   addu      $a2, $s2, $zero
    /* 1E6C4 801582BC 01001424 */  addiu      $s4, $zero, 0x1
    /* 1E6C8 801582C0 01001024 */  addiu      $s0, $zero, 0x1
  .L801582C4:
    /* 1E6CC 801582C4 C9F6000C */  jal        ENG_random__Fl
    /* 1E6D0 801582C8 43201400 */   sra       $a0, $s4, 1
    /* 1E6D4 801582CC 25004014 */  bnez       $v0, .L80158364
    /* 1E6D8 801582D0 FF000232 */   andi      $v0, $s0, 0xFF
    /* 1E6DC 801582D4 23004010 */  beqz       $v0, .L80158364
    /* 1E6E0 801582D8 21880000 */   addu      $s1, $zero, $zero
    /* 1E6E4 801582DC 21800000 */  addu       $s0, $zero, $zero
    /* 1E6E8 801582E0 0300222A */  slti       $v0, $s1, 0x3
  .L801582E4:
    /* 1E6EC 801582E4 13004010 */  beqz       $v0, .L80158334
    /* 1E6F0 801582E8 FF000232 */   andi      $v0, $s0, 0xFF
    /* 1E6F4 801582EC C9F6000C */  jal        ENG_random__Fl
    /* 1E6F8 801582F0 08000424 */   addiu     $a0, $zero, 0x8
    /* 1E6FC 801582F4 01003126 */  addiu      $s1, $s1, 0x1
    /* 1E700 801582F8 80100200 */  sll        $v0, $v0, 2
    /* 1E704 801582FC 21185700 */  addu       $v1, $v0, $s7
    /* 1E708 80158300 21105600 */  addu       $v0, $v0, $s6
    /* 1E70C 80158304 0000638C */  lw         $v1, 0x0($v1)
    /* 1E710 80158308 0000428C */  lw         $v0, 0x0($v0)
    /* 1E714 8015830C 21986302 */  addu       $s3, $s3, $v1
    /* 1E718 80158310 21904202 */  addu       $s2, $s2, $v0
    /* 1E71C 80158314 21206002 */  addu       $a0, $s3, $zero
    /* 1E720 80158318 305D050C */  jal        RndLocOk__Fii
    /* 1E724 8015831C 21284002 */   addu      $a1, $s2, $zero
    /* 1E728 80158320 21804000 */  addu       $s0, $v0, $zero
    /* 1E72C 80158324 FF000232 */  andi       $v0, $s0, 0xFF
    /* 1E730 80158328 EEFF4010 */  beqz       $v0, .L801582E4
    /* 1E734 8015832C 0300222A */   slti      $v0, $s1, 0x3
    /* 1E738 80158330 FF000232 */  andi       $v0, $s0, 0xFF
  .L80158334:
    /* 1E73C 80158334 E3FF4010 */  beqz       $v0, .L801582C4
    /* 1E740 80158338 00000000 */   nop
    /* 1E744 8015833C C9F6000C */  jal        ENG_random__Fl
    /* 1E748 80158340 05000424 */   addiu     $a0, $zero, 0x5
    /* 1E74C 80158344 02004010 */  beqz       $v0, .L80158350
    /* 1E750 80158348 3A000424 */   addiu     $a0, $zero, 0x3A
    /* 1E754 8015834C 39000424 */  addiu      $a0, $zero, 0x39
  .L80158350:
    /* 1E758 80158350 21286002 */  addu       $a1, $s3, $zero
    /* 1E75C 80158354 BE4E010C */  jal        AddObject__Fiii
    /* 1E760 80158358 21304002 */   addu      $a2, $s2, $zero
    /* 1E764 8015835C B1600508 */  j          .L801582C4
    /* 1E768 80158360 01009426 */   addiu     $s4, $s4, 0x1
  .L80158364:
    /* 1E76C 80158364 98600508 */  j          .L80158260
    /* 1E770 80158368 0100B526 */   addiu     $s5, $s5, 0x1
  .L8015836C:
    /* 1E774 8015836C 3400BF8F */  lw         $ra, 0x34($sp)
    /* 1E778 80158370 3000BE8F */  lw         $fp, 0x30($sp)
    /* 1E77C 80158374 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1E780 80158378 2800B68F */  lw         $s6, 0x28($sp)
    /* 1E784 8015837C 2400B58F */  lw         $s5, 0x24($sp)
    /* 1E788 80158380 2000B48F */  lw         $s4, 0x20($sp)
    /* 1E78C 80158384 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1E790 80158388 1800B28F */  lw         $s2, 0x18($sp)
    /* 1E794 8015838C 1400B18F */  lw         $s1, 0x14($sp)
    /* 1E798 80158390 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E79C 80158394 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1E7A0 80158398 0800E003 */  jr         $ra
    /* 1E7A4 8015839C 00000000 */   nop
endlabel InitRndBarrels__Fv
