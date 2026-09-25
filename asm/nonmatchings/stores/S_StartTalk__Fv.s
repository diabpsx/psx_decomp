.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartTalk__Fv, 0x230

glabel S_StartTalk__Fv
    /* 5F49C 8006F49C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 5F4A0 8006F4A0 3400BFAF */  sw         $ra, 0x34($sp)
    /* 5F4A4 8006F4A4 3000B6AF */  sw         $s6, 0x30($sp)
    /* 5F4A8 8006F4A8 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 5F4AC 8006F4AC 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5F4B0 8006F4B0 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5F4B4 8006F4B4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5F4B8 8006F4B8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5F4BC 8006F4BC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5F4C0 8006F4C0 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5F4C4 8006F4C4 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5F4C8 8006F4C8 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5F4CC 8006F4CC 4AED010C */  jal        GetStr__Fi
    /* 5F4D0 8006F4D0 2E040424 */   addiu     $a0, $zero, 0x42E
    /* 5F4D4 8006F4D4 4421838F */  lw         $v1, %gp_rel(D_8011C8C4)($gp)
    /* 5F4D8 8006F4D8 21900000 */  addu       $s2, $zero, $zero
    /* 5F4DC 8006F4DC 80180300 */  sll        $v1, $v1, 2
    /* 5F4E0 8006F4E0 0E80013C */  lui        $at, %hi(talkname)
    /* 5F4E4 8006F4E4 21082300 */  addu       $at, $at, $v1
    /* 5F4E8 8006F4E8 04E4248C */  lw         $a0, %lo(talkname)($at)
    /* 5F4EC 8006F4EC 4AED010C */  jal        GetStr__Fi
    /* 5F4F0 8006F4F0 21804000 */   addu      $s0, $v0, $zero
    /* 5F4F4 8006F4F4 0D80113C */  lui        $s1, %hi(tempstr)
    /* 5F4F8 8006F4F8 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 5F4FC 8006F4FC 21202002 */  addu       $a0, $s1, $zero
    /* 5F500 8006F500 21280002 */  addu       $a1, $s0, $zero
    /* 5F504 8006F504 9767000C */  jal        sprintf
    /* 5F508 8006F508 21304000 */   addu      $a2, $v0, $zero
    /* 5F50C 8006F50C 21200000 */  addu       $a0, $zero, $zero
    /* 5F510 8006F510 01000524 */  addiu      $a1, $zero, 0x1
    /* 5F514 8006F514 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F518 8006F518 21382002 */  addu       $a3, $s1, $zero
    /* 5F51C 8006F51C 03000224 */  addiu      $v0, $zero, 0x3
    /* 5F520 8006F520 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5F524 8006F524 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F528 8006F528 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F52C 8006F52C 5CA7010C */  jal        AddSLine__Fi
    /* 5F530 8006F530 03000424 */   addiu     $a0, $zero, 0x3
    /* 5F534 8006F534 21280000 */  addu       $a1, $zero, $zero
    /* 5F538 8006F538 02000724 */  addiu      $a3, $zero, 0x2
    /* 5F53C 8006F53C FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 5F540 8006F540 21200000 */  addu       $a0, $zero, $zero
    /* 5F544 8006F544 4421828F */  lw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 5F548 8006F548 0D80033C */  lui        $v1, %hi(Qtalklist)
    /* 5F54C 8006F54C C0FB6324 */  addiu      $v1, $v1, %lo(Qtalklist)
    /* 5F550 8006F550 80110200 */  sll        $v0, $v0, 6
    /* 5F554 8006F554 21184300 */  addu       $v1, $v0, $v1
  .L8006F558:
    /* 5F558 8006F558 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 5F55C 8006F55C 21082400 */  addu       $at, $at, $a0
    /* 5F560 8006F560 42DA2290 */  lbu        $v0, %lo(quests + 0x2)($at)
    /* 5F564 8006F564 00000000 */  nop
    /* 5F568 8006F568 0C004714 */  bne        $v0, $a3, .L8006F59C
    /* 5F56C 8006F56C 00000000 */   nop
    /* 5F570 8006F570 0000628C */  lw         $v0, 0x0($v1)
    /* 5F574 8006F574 00000000 */  nop
    /* 5F578 8006F578 08004610 */  beq        $v0, $a2, .L8006F59C
    /* 5F57C 8006F57C 00000000 */   nop
    /* 5F580 8006F580 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 5F584 8006F584 21082400 */  addu       $at, $at, $a0
    /* 5F588 8006F588 51DA2290 */  lbu        $v0, %lo(quests + 0x11)($at)
    /* 5F58C 8006F58C 00000000 */  nop
    /* 5F590 8006F590 02004010 */  beqz       $v0, .L8006F59C
    /* 5F594 8006F594 00000000 */   nop
    /* 5F598 8006F598 0100A524 */  addiu      $a1, $a1, 0x1
  .L8006F59C:
    /* 5F59C 8006F59C 04006324 */  addiu      $v1, $v1, 0x4
    /* 5F5A0 8006F5A0 01005226 */  addiu      $s2, $s2, 0x1
    /* 5F5A4 8006F5A4 1000422A */  slti       $v0, $s2, 0x10
    /* 5F5A8 8006F5A8 EBFF4014 */  bnez       $v0, .L8006F558
    /* 5F5AC 8006F5AC 14008424 */   addiu     $a0, $a0, 0x14
    /* 5F5B0 8006F5B0 43180500 */  sra        $v1, $a1, 1
    /* 5F5B4 8006F5B4 0A000224 */  addiu      $v0, $zero, 0xA
    /* 5F5B8 8006F5B8 23884300 */  subu       $s1, $v0, $v1
    /* 5F5BC 8006F5BC 01001624 */  addiu      $s6, $zero, 0x1
    /* 5F5C0 8006F5C0 FEFF3426 */  addiu      $s4, $s1, -0x2
    /* 5F5C4 8006F5C4 21900000 */  addu       $s2, $zero, $zero
    /* 5F5C8 8006F5C8 0D80153C */  lui        $s5, %hi(Qtalklist)
    /* 5F5CC 8006F5CC C0FBB526 */  addiu      $s5, $s5, %lo(Qtalklist)
    /* 5F5D0 8006F5D0 21980000 */  addu       $s3, $zero, $zero
    /* 5F5D4 8006F5D4 21800000 */  addu       $s0, $zero, $zero
  .L8006F5D8:
    /* 5F5D8 8006F5D8 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 5F5DC 8006F5DC 21083000 */  addu       $at, $at, $s0
    /* 5F5E0 8006F5E0 42DA2390 */  lbu        $v1, %lo(quests + 0x2)($at)
    /* 5F5E4 8006F5E4 02000224 */  addiu      $v0, $zero, 0x2
    /* 5F5E8 8006F5E8 1E006214 */  bne        $v1, $v0, .L8006F664
    /* 5F5EC 8006F5EC 80201200 */   sll       $a0, $s2, 2
    /* 5F5F0 8006F5F0 4421828F */  lw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 5F5F4 8006F5F4 00000000 */  nop
    /* 5F5F8 8006F5F8 80110200 */  sll        $v0, $v0, 6
    /* 5F5FC 8006F5FC 21105500 */  addu       $v0, $v0, $s5
    /* 5F600 8006F600 21108200 */  addu       $v0, $a0, $v0
    /* 5F604 8006F604 0000438C */  lw         $v1, 0x0($v0)
    /* 5F608 8006F608 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5F60C 8006F60C 15006210 */  beq        $v1, $v0, .L8006F664
    /* 5F610 8006F610 00000000 */   nop
    /* 5F614 8006F614 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 5F618 8006F618 21083000 */  addu       $at, $at, $s0
    /* 5F61C 8006F61C 51DA2290 */  lbu        $v0, %lo(quests + 0x11)($at)
    /* 5F620 8006F620 00000000 */  nop
    /* 5F624 8006F624 0F004010 */  beqz       $v0, .L8006F664
    /* 5F628 8006F628 00000000 */   nop
    /* 5F62C 8006F62C 0E80013C */  lui        $at, %hi(questlist + 0xC)
    /* 5F630 8006F630 21083300 */  addu       $at, $at, $s3
    /* 5F634 8006F634 14D9248C */  lw         $a0, %lo(questlist + 0xC)($at)
    /* 5F638 8006F638 4AED010C */  jal        GetStr__Fi
    /* 5F63C 8006F63C 00000000 */   nop
    /* 5F640 8006F640 21200000 */  addu       $a0, $zero, $zero
    /* 5F644 8006F644 21282002 */  addu       $a1, $s1, $zero
    /* 5F648 8006F648 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F64C 8006F64C 21384000 */  addu       $a3, $v0, $zero
    /* 5F650 8006F650 01000224 */  addiu      $v0, $zero, 0x1
    /* 5F654 8006F654 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5F658 8006F658 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F65C 8006F65C 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5F660 8006F660 21883602 */  addu       $s1, $s1, $s6
  .L8006F664:
    /* 5F664 8006F664 10007326 */  addiu      $s3, $s3, 0x10
    /* 5F668 8006F668 01005226 */  addiu      $s2, $s2, 0x1
    /* 5F66C 8006F66C 1000422A */  slti       $v0, $s2, 0x10
    /* 5F670 8006F670 D9FF4014 */  bnez       $v0, .L8006F5D8
    /* 5F674 8006F674 14001026 */   addiu     $s0, $s0, 0x14
    /* 5F678 8006F678 4AED010C */  jal        GetStr__Fi
    /* 5F67C 8006F67C 99010424 */   addiu     $a0, $zero, 0x199
    /* 5F680 8006F680 21200000 */  addu       $a0, $zero, $zero
    /* 5F684 8006F684 21288002 */  addu       $a1, $s4, $zero
    /* 5F688 8006F688 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F68C 8006F68C 21384000 */  addu       $a3, $v0, $zero
    /* 5F690 8006F690 01000224 */  addiu      $v0, $zero, 0x1
    /* 5F694 8006F694 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5F698 8006F698 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F69C 8006F69C 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5F6A0 8006F6A0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 5F6A4 8006F6A4 3000B68F */  lw         $s6, 0x30($sp)
    /* 5F6A8 8006F6A8 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 5F6AC 8006F6AC 2800B48F */  lw         $s4, 0x28($sp)
    /* 5F6B0 8006F6B0 2400B38F */  lw         $s3, 0x24($sp)
    /* 5F6B4 8006F6B4 2000B28F */  lw         $s2, 0x20($sp)
    /* 5F6B8 8006F6B8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5F6BC 8006F6BC 1800B08F */  lw         $s0, 0x18($sp)
    /* 5F6C0 8006F6C0 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 5F6C4 8006F6C4 0800E003 */  jr         $ra
    /* 5F6C8 8006F6C8 00000000 */   nop
endlabel S_StartTalk__Fv
