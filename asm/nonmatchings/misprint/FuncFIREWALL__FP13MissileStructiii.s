.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFIREWALL__FP13MissileStructiii, 0x98

glabel FuncFIREWALL__FP13MissileStructiii
    /* 6C5C4 8007C5C4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C5C8 8007C5C8 8B2E083C */  lui        $t0, (0x2E8BA2E9 >> 16)
    /* 6C5CC 8007C5CC 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C5D0 8007C5D0 47008380 */  lb         $v1, 0x47($a0)
    /* 6C5D4 8007C5D4 E9A20835 */  ori        $t0, $t0, (0x2E8BA2E9 & 0xFFFF)
    /* 6C5D8 8007C5D8 80100300 */  sll        $v0, $v1, 2
    /* 6C5DC 8007C5DC 21104300 */  addu       $v0, $v0, $v1
    /* 6C5E0 8007C5E0 40100200 */  sll        $v0, $v0, 1
    /* 6C5E4 8007C5E4 18004800 */  mult       $v0, $t0
    /* 6C5E8 8007C5E8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C5EC 8007C5EC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C5F0 8007C5F0 C3170200 */  sra        $v0, $v0, 31
    /* 6C5F4 8007C5F4 10480000 */  mfhi       $t1
    /* 6C5F8 8007C5F8 43180900 */  sra        $v1, $t1, 1
    /* 6C5FC 8007C5FC 23186200 */  subu       $v1, $v1, $v0
    /* 6C600 8007C600 1000A3AF */  sw         $v1, 0x10($sp)
    /* 6C604 8007C604 3F008390 */  lbu        $v1, 0x3F($a0)
    /* 6C608 8007C608 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C60C 8007C60C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C610 8007C610 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C614 8007C614 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C618 8007C618 01000224 */  addiu      $v0, $zero, 0x1
    /* 6C61C 8007C61C 2120A000 */  addu       $a0, $a1, $zero
    /* 6C620 8007C620 2128C000 */  addu       $a1, $a2, $zero
    /* 6C624 8007C624 2130E000 */  addu       $a2, $a3, $zero
    /* 6C628 8007C628 02000724 */  addiu      $a3, $zero, 0x2
    /* 6C62C 8007C62C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C630 8007C630 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C634 8007C634 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6C638 8007C638 01006338 */  xori       $v1, $v1, 0x1
    /* 6C63C 8007C63C 001E0300 */  sll        $v1, $v1, 24
    /* 6C640 8007C640 031E0300 */  sra        $v1, $v1, 24
    /* 6C644 8007C644 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C648 8007C648 1C00A3AF */   sw        $v1, 0x1C($sp)
    /* 6C64C 8007C64C 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C650 8007C650 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C654 8007C654 0800E003 */  jr         $ra
    /* 6C658 8007C658 00000000 */   nop
endlabel FuncFIREWALL__FP13MissileStructiii
