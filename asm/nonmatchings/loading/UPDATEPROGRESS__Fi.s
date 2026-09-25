.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UPDATEPROGRESS__Fi, 0xCC

glabel UPDATEPROGRESS__Fi
    /* 9457C 800A457C CC09828F */  lw         $v0, %gp_rel(D_8011B14C)($gp)
    /* 94580 800A4580 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 94584 800A4584 2800BFAF */  sw         $ra, 0x28($sp)
    /* 94588 800A4588 2400B1AF */  sw         $s1, 0x24($sp)
    /* 9458C 800A458C 28004014 */  bnez       $v0, .L800A4630
    /* 94590 800A4590 2000B0AF */   sw        $s0, 0x20($sp)
    /* 94594 800A4594 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 94598 800A4598 09008214 */  bne        $a0, $v0, .L800A45C0
    /* 9459C 800A459C 80200400 */   sll       $a0, $a0, 2
    /* 945A0 800A45A0 6C1F8297 */  lhu        $v0, %gp_rel(D_8011C6EC)($gp)
    /* 945A4 800A45A4 00000000 */  nop
    /* 945A8 800A45A8 04004224 */  addiu      $v0, $v0, 0x4
    /* 945AC 800A45AC 6C1F82A7 */  sh         $v0, %gp_rel(D_8011C6EC)($gp)
    /* 945B0 800A45B0 EE80000C */  jal        TSK_Sleep
    /* 945B4 800A45B4 01000424 */   addiu     $a0, $zero, 0x1
    /* 945B8 800A45B8 8C910208 */  j          .L800A4630
    /* 945BC 800A45BC 00000000 */   nop
  .L800A45C0:
    /* 945C0 800A45C0 1B008018 */  blez       $a0, .L800A4630
    /* 945C4 800A45C4 21800000 */   addu      $s0, $zero, $zero
    /* 945C8 800A45C8 21888000 */  addu       $s1, $a0, $zero
  .L800A45CC:
    /* 945CC 800A45CC 6C1F8297 */  lhu        $v0, %gp_rel(D_8011C6EC)($gp)
    /* 945D0 800A45D0 CC09838F */  lw         $v1, %gp_rel(D_8011B14C)($gp)
    /* 945D4 800A45D4 01004224 */  addiu      $v0, $v0, 0x1
    /* 945D8 800A45D8 6C1F82A7 */  sh         $v0, %gp_rel(D_8011C6EC)($gp)
    /* 945DC 800A45DC 05006014 */  bnez       $v1, .L800A45F4
    /* 945E0 800A45E0 0B000624 */   addiu     $a2, $zero, 0xB
    /* 945E4 800A45E4 EE80000C */  jal        TSK_Sleep
    /* 945E8 800A45E8 01000424 */   addiu     $a0, $zero, 0x1
    /* 945EC 800A45EC 89910208 */  j          .L800A4624
    /* 945F0 800A45F0 01001026 */   addiu     $s0, $s0, 0x1
  .L800A45F4:
    /* 945F4 800A45F4 0D80043C */  lui        $a0, %hi(CutScr)
    /* 945F8 800A45F8 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 945FC 800A45FC 1180053C */  lui        $a1, %hi(D_80110CBE)
    /* 94600 800A4600 BE0CA594 */  lhu        $a1, %lo(D_80110CBE)($a1)
    /* 94604 800A4604 21380000 */  addu       $a3, $zero, $zero
    /* 94608 800A4608 F252020C */  jal        Display__7CScreeniiii
    /* 9460C 800A460C 1000A0AF */   sw        $zero, 0x10($sp)
    /* 94610 800A4610 9591020C */  jal        DrawCutScreen__Fi
    /* 94614 800A4614 0B000424 */   addiu     $a0, $zero, 0xB
    /* 94618 800A4618 4991020C */  jal        MY_TSK_Sleep__Fi
    /* 9461C 800A461C 01000424 */   addiu     $a0, $zero, 0x1
    /* 94620 800A4620 01001026 */  addiu      $s0, $s0, 0x1
  .L800A4624:
    /* 94624 800A4624 2A101102 */  slt        $v0, $s0, $s1
    /* 94628 800A4628 E8FF4014 */  bnez       $v0, .L800A45CC
    /* 9462C 800A462C 00000000 */   nop
  .L800A4630:
    /* 94630 800A4630 2800BF8F */  lw         $ra, 0x28($sp)
    /* 94634 800A4634 2400B18F */  lw         $s1, 0x24($sp)
    /* 94638 800A4638 2000B08F */  lw         $s0, 0x20($sp)
    /* 9463C 800A463C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 94640 800A4640 0800E003 */  jr         $ra
    /* 94644 800A4644 00000000 */   nop
endlabel UPDATEPROGRESS__Fi
