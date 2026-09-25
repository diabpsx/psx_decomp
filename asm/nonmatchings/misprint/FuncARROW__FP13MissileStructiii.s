.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncARROW__FP13MissileStructiii, 0xB0

glabel FuncARROW__FP13MissileStructiii
    /* 6C760 8007C760 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C764 8007C764 21600000 */  addu       $t4, $zero, $zero
    /* 6C768 8007C768 21580000 */  addu       $t3, $zero, $zero
    /* 6C76C 8007C76C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C770 8007C770 47008A80 */  lb         $t2, 0x47($a0)
    /* 6C774 8007C774 28008284 */  lh         $v0, 0x28($a0)
    /* 6C778 8007C778 2A008384 */  lh         $v1, 0x2A($a0)
    /* 6C77C 8007C77C FFFF4825 */  addiu      $t0, $t2, -0x1
    /* 6C780 8007C780 21480001 */  addu       $t1, $t0, $zero
    /* 6C784 8007C784 2128A200 */  addu       $a1, $a1, $v0
    /* 6C788 8007C788 02000105 */  bgez       $t0, .L8007C794
    /* 6C78C 8007C78C 2130C300 */   addu      $a2, $a2, $v1
    /* 6C790 8007C790 0E004925 */  addiu      $t1, $t2, 0xE
  .L8007C794:
    /* 6C794 8007C794 03190900 */  sra        $v1, $t1, 4
    /* 6C798 8007C798 00110300 */  sll        $v0, $v1, 4
    /* 6C79C 8007C79C 23180201 */  subu       $v1, $t0, $v0
    /* 6C7A0 8007C7A0 09006228 */  slti       $v0, $v1, 0x9
    /* 6C7A4 8007C7A4 02004014 */  bnez       $v0, .L8007C7B0
    /* 6C7A8 8007C7A8 FBFF6224 */   addiu     $v0, $v1, -0x5
    /* 6C7AC 8007C7AC 01000C24 */  addiu      $t4, $zero, 0x1
  .L8007C7B0:
    /* 6C7B0 8007C7B0 0700422C */  sltiu      $v0, $v0, 0x7
    /* 6C7B4 8007C7B4 02004010 */  beqz       $v0, .L8007C7C0
    /* 6C7B8 8007C7B8 80000224 */   addiu     $v0, $zero, 0x80
    /* 6C7BC 8007C7BC 01000B24 */  addiu      $t3, $zero, 0x1
  .L8007C7C0:
    /* 6C7C0 8007C7C0 1000A3AF */  sw         $v1, 0x10($sp)
    /* 6C7C4 8007C7C4 3F008380 */  lb         $v1, 0x3F($a0)
    /* 6C7C8 8007C7C8 2120A000 */  addu       $a0, $a1, $zero
    /* 6C7CC 8007C7CC 2128C000 */  addu       $a1, $a2, $zero
    /* 6C7D0 8007C7D0 2130E000 */  addu       $a2, $a3, $zero
    /* 6C7D4 8007C7D4 04000724 */  addiu      $a3, $zero, 0x4
    /* 6C7D8 8007C7D8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C7DC 8007C7DC 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C7E0 8007C7E0 2000ACAF */  sw         $t4, 0x20($sp)
    /* 6C7E4 8007C7E4 2400ABAF */  sw         $t3, 0x24($sp)
    /* 6C7E8 8007C7E8 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C7EC 8007C7EC 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C7F0 8007C7F0 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C7F4 8007C7F4 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6C7F8 8007C7F8 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C7FC 8007C7FC 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6C800 8007C800 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C804 8007C804 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C808 8007C808 0800E003 */  jr         $ra
    /* 6C80C 8007C80C 00000000 */   nop
endlabel FuncARROW__FP13MissileStructiii
