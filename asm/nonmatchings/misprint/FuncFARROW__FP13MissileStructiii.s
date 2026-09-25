.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFARROW__FP13MissileStructiii, 0xF8

glabel FuncFARROW__FP13MissileStructiii
    /* 6C810 8007C810 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C814 8007C814 21488000 */  addu       $t1, $a0, $zero
    /* 6C818 8007C818 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C81C 8007C81C 28002285 */  lh         $v0, 0x28($t1)
    /* 6C820 8007C820 2A002385 */  lh         $v1, 0x2A($t1)
    /* 6C824 8007C824 2120A200 */  addu       $a0, $a1, $v0
    /* 6C828 8007C828 2128C300 */  addu       $a1, $a2, $v1
    /* 6C82C 8007C82C 37002391 */  lbu        $v1, 0x37($t1)
    /* 6C830 8007C830 05000224 */  addiu      $v0, $zero, 0x5
    /* 6C834 8007C834 11006214 */  bne        $v1, $v0, .L8007C87C
    /* 6C838 8007C838 21580000 */   addu      $t3, $zero, $zero
    /* 6C83C 8007C83C 2130E000 */  addu       $a2, $a3, $zero
    /* 6C840 8007C840 0C000724 */  addiu      $a3, $zero, 0xC
    /* 6C844 8007C844 47002381 */  lb         $v1, 0x47($t1)
    /* 6C848 8007C848 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6C84C 8007C84C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C850 8007C850 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C854 8007C854 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C858 8007C858 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C85C 8007C85C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6C860 8007C860 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C864 8007C864 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C868 8007C868 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C86C 8007C86C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C870 8007C870 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C874 8007C874 3CF20108 */  j          .L8007C8F0
    /* 6C878 8007C878 3400A2AF */   sw        $v0, 0x34($sp)
  .L8007C87C:
    /* 6C87C 8007C87C 3F002881 */  lb         $t0, 0x3F($t1)
    /* 6C880 8007C880 21500000 */  addu       $t2, $zero, $zero
    /* 6C884 8007C884 09000229 */  slti       $v0, $t0, 0x9
    /* 6C888 8007C888 03004014 */  bnez       $v0, .L8007C898
    /* 6C88C 8007C88C 21180001 */   addu      $v1, $t0, $zero
    /* 6C890 8007C890 01000B24 */  addiu      $t3, $zero, 0x1
    /* 6C894 8007C894 F8FF0825 */  addiu      $t0, $t0, -0x8
  .L8007C898:
    /* 6C898 8007C898 FBFF6224 */  addiu      $v0, $v1, -0x5
    /* 6C89C 8007C89C 0700422C */  sltiu      $v0, $v0, 0x7
    /* 6C8A0 8007C8A0 02004010 */  beqz       $v0, .L8007C8AC
    /* 6C8A4 8007C8A4 05000229 */   slti      $v0, $t0, 0x5
    /* 6C8A8 8007C8A8 01000A24 */  addiu      $t2, $zero, 0x1
  .L8007C8AC:
    /* 6C8AC 8007C8AC 03004014 */  bnez       $v0, .L8007C8BC
    /* 6C8B0 8007C8B0 2130E000 */   addu      $a2, $a3, $zero
    /* 6C8B4 8007C8B4 08000224 */  addiu      $v0, $zero, 0x8
    /* 6C8B8 8007C8B8 23404800 */  subu       $t0, $v0, $t0
  .L8007C8BC:
    /* 6C8BC 8007C8BC 06000724 */  addiu      $a3, $zero, 0x6
    /* 6C8C0 8007C8C0 47002391 */  lbu        $v1, 0x47($t1)
    /* 6C8C4 8007C8C4 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C8C8 8007C8C8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C8CC 8007C8CC 1800A8AF */  sw         $t0, 0x18($sp)
    /* 6C8D0 8007C8D0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C8D4 8007C8D4 2000ABAF */  sw         $t3, 0x20($sp)
    /* 6C8D8 8007C8D8 2400AAAF */  sw         $t2, 0x24($sp)
    /* 6C8DC 8007C8DC 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C8E0 8007C8E0 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C8E4 8007C8E4 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C8E8 8007C8E8 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6C8EC 8007C8EC 01006330 */  andi       $v1, $v1, 0x1
  .L8007C8F0:
    /* 6C8F0 8007C8F0 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C8F4 8007C8F4 1000A3AF */   sw        $v1, 0x10($sp)
    /* 6C8F8 8007C8F8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C8FC 8007C8FC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C900 8007C900 0800E003 */  jr         $ra
    /* 6C904 8007C904 00000000 */   nop
endlabel FuncFARROW__FP13MissileStructiii
