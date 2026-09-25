.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_Enemy__Fi, 0x218

glabel M_Enemy__Fi
    /* 6F5B8 8007F5B8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 6F5BC 8007F5BC FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 6F5C0 8007F5C0 40100400 */  sll        $v0, $a0, 1
    /* 6F5C4 8007F5C4 21104400 */  addu       $v0, $v0, $a0
    /* 6F5C8 8007F5C8 80100200 */  sll        $v0, $v0, 2
    /* 6F5CC 8007F5CC 21104400 */  addu       $v0, $v0, $a0
    /* 6F5D0 8007F5D0 C0100200 */  sll        $v0, $v0, 3
    /* 6F5D4 8007F5D4 1080033C */  lui        $v1, %hi(monster)
    /* 6F5D8 8007F5D8 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 6F5DC 8007F5DC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6F5E0 8007F5E0 21904300 */  addu       $s2, $v0, $v1
    /* 6F5E4 8007F5E4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 6F5E8 8007F5E8 0E80153C */  lui        $s5, %hi(plr)
    /* 6F5EC 8007F5EC 38A5B526 */  addiu      $s5, $s5, %lo(plr)
    /* 6F5F0 8007F5F0 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 6F5F4 8007F5F4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 6F5F8 8007F5F8 2800B6AF */  sw         $s6, 0x28($sp)
    /* 6F5FC 8007F5FC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 6F600 8007F600 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 6F604 8007F604 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6F608 8007F608 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6F60C 8007F60C 34005382 */  lb         $s3, 0x34($s2)
    /* 6F610 8007F610 35005482 */  lb         $s4, 0x35($s2)
    /* 6F614 8007F614 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 6F618 8007F618 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 6F61C 8007F61C 3D005092 */  lbu        $s0, 0x3D($s2)
    /* 6F620 8007F620 3C004010 */  beqz       $v0, .L8007F714
    /* 6F624 8007F624 E819B726 */   addiu     $s7, $s5, 0x19E8
    /* 6F628 8007F628 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 6F62C 8007F62C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 6F630 8007F630 00000000 */  nop
    /* 6F634 8007F634 35004010 */  beqz       $v0, .L8007F70C
    /* 6F638 8007F638 21B00000 */   addu      $s6, $zero, $zero
    /* 6F63C 8007F63C 40101000 */  sll        $v0, $s0, 1
    /* 6F640 8007F640 21105000 */  addu       $v0, $v0, $s0
    /* 6F644 8007F644 80100200 */  sll        $v0, $v0, 2
    /* 6F648 8007F648 21105000 */  addu       $v0, $v0, $s0
    /* 6F64C 8007F64C 00110200 */  sll        $v0, $v0, 4
    /* 6F650 8007F650 23105000 */  subu       $v0, $v0, $s0
    /* 6F654 8007F654 80100200 */  sll        $v0, $v0, 2
    /* 6F658 8007F658 21105000 */  addu       $v0, $v0, $s0
    /* 6F65C 8007F65C C0100200 */  sll        $v0, $v0, 3
    /* 6F660 8007F660 21105500 */  addu       $v0, $v0, $s5
    /* 6F664 8007F664 30004484 */  lh         $a0, 0x30($v0)
    /* 6F668 8007F668 32004284 */  lh         $v0, 0x32($v0)
    /* 6F66C 8007F66C 23209300 */  subu       $a0, $a0, $s3
    /* 6F670 8007F670 6D41000C */  jal        abs
    /* 6F674 8007F674 23885400 */   subu      $s1, $v0, $s4
    /* 6F678 8007F678 02004228 */  slti       $v0, $v0, 0x2
    /* 6F67C 8007F67C 06004010 */  beqz       $v0, .L8007F698
    /* 6F680 8007F680 00000000 */   nop
    /* 6F684 8007F684 6D41000C */  jal        abs
    /* 6F688 8007F688 21202002 */   addu      $a0, $s1, $zero
    /* 6F68C 8007F68C 02004228 */  slti       $v0, $v0, 0x2
    /* 6F690 8007F690 02004014 */  bnez       $v0, .L8007F69C
    /* 6F694 8007F694 00000000 */   nop
  .L8007F698:
    /* 6F698 8007F698 01001624 */  addiu      $s6, $zero, 0x1
  .L8007F69C:
    /* 6F69C 8007F69C 2300C012 */  beqz       $s6, .L8007F72C
    /* 6F6A0 8007F6A0 21280002 */   addu      $a1, $s0, $zero
    /* 6F6A4 8007F6A4 3000A486 */  lh         $a0, 0x30($s5)
    /* 6F6A8 8007F6A8 6D41000C */  jal        abs
    /* 6F6AC 8007F6AC 23209300 */   subu      $a0, $a0, $s3
    /* 6F6B0 8007F6B0 3200A486 */  lh         $a0, 0x32($s5)
    /* 6F6B4 8007F6B4 21884000 */  addu       $s1, $v0, $zero
    /* 6F6B8 8007F6B8 6D41000C */  jal        abs
    /* 6F6BC 8007F6BC 23209400 */   subu      $a0, $a0, $s4
    /* 6F6C0 8007F6C0 3000E486 */  lh         $a0, 0x30($s7)
    /* 6F6C4 8007F6C4 00000000 */  nop
    /* 6F6C8 8007F6C8 23209300 */  subu       $a0, $a0, $s3
    /* 6F6CC 8007F6CC 6D41000C */  jal        abs
    /* 6F6D0 8007F6D0 21984000 */   addu      $s3, $v0, $zero
    /* 6F6D4 8007F6D4 3200E486 */  lh         $a0, 0x32($s7)
    /* 6F6D8 8007F6D8 21804000 */  addu       $s0, $v0, $zero
    /* 6F6DC 8007F6DC 6D41000C */  jal        abs
    /* 6F6E0 8007F6E0 23209400 */   subu      $a0, $a0, $s4
    /* 6F6E4 8007F6E4 21184000 */  addu       $v1, $v0, $zero
    /* 6F6E8 8007F6E8 2A103302 */  slt        $v0, $s1, $s3
    /* 6F6EC 8007F6EC 02004010 */  beqz       $v0, .L8007F6F8
    /* 6F6F0 8007F6F0 2A100302 */   slt       $v0, $s0, $v1
    /* 6F6F4 8007F6F4 21886002 */  addu       $s1, $s3, $zero
  .L8007F6F8:
    /* 6F6F8 8007F6F8 0C004010 */  beqz       $v0, .L8007F72C
    /* 6F6FC 8007F6FC 2A281102 */   slt       $a1, $s0, $s1
    /* 6F700 8007F700 21806000 */  addu       $s0, $v1, $zero
    /* 6F704 8007F704 CBFD0108 */  j          .L8007F72C
    /* 6F708 8007F708 2A281102 */   slt       $a1, $s0, $s1
  .L8007F70C:
    /* 6F70C 8007F70C CBFD0108 */  j          .L8007F72C
    /* 6F710 8007F710 21280000 */   addu      $a1, $zero, $zero
  .L8007F714:
    /* 6F714 8007F714 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 6F718 8007F718 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 6F71C 8007F71C 00000000 */  nop
    /* 6F720 8007F720 03004010 */  beqz       $v0, .L8007F730
    /* 6F724 8007F724 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 6F728 8007F728 01000524 */  addiu      $a1, $zero, 0x1
  .L8007F72C:
    /* 6F72C 8007F72C FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8007F730:
    /* 6F730 8007F730 1700A210 */  beq        $a1, $v0, .L8007F790
    /* 6F734 8007F734 40100500 */   sll       $v0, $a1, 1
    /* 6F738 8007F738 21104500 */  addu       $v0, $v0, $a1
    /* 6F73C 8007F73C 80100200 */  sll        $v0, $v0, 2
    /* 6F740 8007F740 21104500 */  addu       $v0, $v0, $a1
    /* 6F744 8007F744 00110200 */  sll        $v0, $v0, 4
    /* 6F748 8007F748 23104500 */  subu       $v0, $v0, $a1
    /* 6F74C 8007F74C 80100200 */  sll        $v0, $v0, 2
    /* 6F750 8007F750 21104500 */  addu       $v0, $v0, $a1
    /* 6F754 8007F754 C0100200 */  sll        $v0, $v0, 3
    /* 6F758 8007F758 3D0045A2 */  sb         $a1, 0x3D($s2)
    /* 6F75C 8007F75C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 6F760 8007F760 21082200 */  addu       $at, $at, $v0
    /* 6F764 8007F764 68A52394 */  lhu        $v1, %lo(plr + 0x30)($at)
    /* 6F768 8007F768 00000000 */  nop
    /* 6F76C 8007F76C 4A0043A2 */  sb         $v1, 0x4A($s2)
    /* 6F770 8007F770 2C004396 */  lhu        $v1, 0x2C($s2)
    /* 6F774 8007F774 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 6F778 8007F778 21082200 */  addu       $at, $at, $v0
    /* 6F77C 8007F77C 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 6F780 8007F780 FFFB6330 */  andi       $v1, $v1, 0xFBFF
    /* 6F784 8007F784 2C0043A6 */  sh         $v1, 0x2C($s2)
    /* 6F788 8007F788 E8FD0108 */  j          .L8007F7A0
    /* 6F78C 8007F78C 4B0042A2 */   sb        $v0, 0x4B($s2)
  .L8007F790:
    /* 6F790 8007F790 2C004296 */  lhu        $v0, 0x2C($s2)
    /* 6F794 8007F794 00000000 */  nop
    /* 6F798 8007F798 00044234 */  ori        $v0, $v0, 0x400
    /* 6F79C 8007F79C 2C0042A6 */  sh         $v0, 0x2C($s2)
  .L8007F7A0:
    /* 6F7A0 8007F7A0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 6F7A4 8007F7A4 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 6F7A8 8007F7A8 2800B68F */  lw         $s6, 0x28($sp)
    /* 6F7AC 8007F7AC 2400B58F */  lw         $s5, 0x24($sp)
    /* 6F7B0 8007F7B0 2000B48F */  lw         $s4, 0x20($sp)
    /* 6F7B4 8007F7B4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 6F7B8 8007F7B8 1800B28F */  lw         $s2, 0x18($sp)
    /* 6F7BC 8007F7BC 1400B18F */  lw         $s1, 0x14($sp)
    /* 6F7C0 8007F7C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6F7C4 8007F7C4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 6F7C8 8007F7C8 0800E003 */  jr         $ra
    /* 6F7CC 8007F7CC 00000000 */   nop
endlabel M_Enemy__Fi
