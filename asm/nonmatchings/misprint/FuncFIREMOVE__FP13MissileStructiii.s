.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFIREMOVE__FP13MissileStructiii, 0x98

glabel FuncFIREMOVE__FP13MissileStructiii
    /* 6C65C 8007C65C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C660 8007C660 8B2E083C */  lui        $t0, (0x2E8BA2E9 >> 16)
    /* 6C664 8007C664 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C668 8007C668 47008380 */  lb         $v1, 0x47($a0)
    /* 6C66C 8007C66C E9A20835 */  ori        $t0, $t0, (0x2E8BA2E9 & 0xFFFF)
    /* 6C670 8007C670 80100300 */  sll        $v0, $v1, 2
    /* 6C674 8007C674 21104300 */  addu       $v0, $v0, $v1
    /* 6C678 8007C678 40100200 */  sll        $v0, $v0, 1
    /* 6C67C 8007C67C 18004800 */  mult       $v0, $t0
    /* 6C680 8007C680 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C684 8007C684 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C688 8007C688 C3170200 */  sra        $v0, $v0, 31
    /* 6C68C 8007C68C 10480000 */  mfhi       $t1
    /* 6C690 8007C690 43180900 */  sra        $v1, $t1, 1
    /* 6C694 8007C694 23186200 */  subu       $v1, $v1, $v0
    /* 6C698 8007C698 1000A3AF */  sw         $v1, 0x10($sp)
    /* 6C69C 8007C69C 3F008390 */  lbu        $v1, 0x3F($a0)
    /* 6C6A0 8007C6A0 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C6A4 8007C6A4 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C6A8 8007C6A8 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C6AC 8007C6AC 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C6B0 8007C6B0 01000224 */  addiu      $v0, $zero, 0x1
    /* 6C6B4 8007C6B4 2120A000 */  addu       $a0, $a1, $zero
    /* 6C6B8 8007C6B8 2128C000 */  addu       $a1, $a2, $zero
    /* 6C6BC 8007C6BC 2130E000 */  addu       $a2, $a3, $zero
    /* 6C6C0 8007C6C0 02000724 */  addiu      $a3, $zero, 0x2
    /* 6C6C4 8007C6C4 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C6C8 8007C6C8 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C6CC 8007C6CC 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6C6D0 8007C6D0 01006338 */  xori       $v1, $v1, 0x1
    /* 6C6D4 8007C6D4 001E0300 */  sll        $v1, $v1, 24
    /* 6C6D8 8007C6D8 031E0300 */  sra        $v1, $v1, 24
    /* 6C6DC 8007C6DC 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C6E0 8007C6E0 1C00A3AF */   sw        $v1, 0x1C($sp)
    /* 6C6E4 8007C6E4 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C6E8 8007C6E8 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C6EC 8007C6EC 0800E003 */  jr         $ra
    /* 6C6F0 8007C6F0 00000000 */   nop
endlabel FuncFIREMOVE__FP13MissileStructiii
