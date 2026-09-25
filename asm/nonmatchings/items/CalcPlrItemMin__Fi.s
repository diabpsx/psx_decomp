.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcPlrItemMin__Fi, 0xE0

glabel CalcPlrItemMin__Fi
    /* 2F754 8003F754 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2F758 8003F758 40100400 */  sll        $v0, $a0, 1
    /* 2F75C 8003F75C 21104400 */  addu       $v0, $v0, $a0
    /* 2F760 8003F760 80100200 */  sll        $v0, $v0, 2
    /* 2F764 8003F764 21104400 */  addu       $v0, $v0, $a0
    /* 2F768 8003F768 00110200 */  sll        $v0, $v0, 4
    /* 2F76C 8003F76C 23104400 */  subu       $v0, $v0, $a0
    /* 2F770 8003F770 80100200 */  sll        $v0, $v0, 2
    /* 2F774 8003F774 21104400 */  addu       $v0, $v0, $a0
    /* 2F778 8003F778 C0100200 */  sll        $v0, $v0, 3
    /* 2F77C 8003F77C 0E80033C */  lui        $v1, %hi(plr)
    /* 2F780 8003F780 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 2F784 8003F784 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2F788 8003F788 21984300 */  addu       $s3, $v0, $v1
    /* 2F78C 8003F78C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2F790 8003F790 2400BFAF */  sw         $ra, 0x24($sp)
    /* 2F794 8003F794 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2F798 8003F798 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2F79C 8003F79C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2F7A0 8003F7A0 8415708E */  lw         $s0, 0x1584($s3)
    /* 2F7A4 8003F7A4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2F7A8 8003F7A8 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 2F7AC 8003F7AC 09000212 */  beq        $s0, $v0, .L8003F7D4
    /* 2F7B0 8003F7B0 A4047126 */   addiu     $s1, $s3, 0x4A4
    /* 2F7B4 8003F7B4 FFFF1224 */  addiu      $s2, $zero, -0x1
  .L8003F7B8:
    /* 2F7B8 8003F7B8 21206002 */  addu       $a0, $s3, $zero
    /* 2F7BC 8003F7BC B7FD000C */  jal        ItemMinStats__FPC12PlayerStructPC10ItemStruct
    /* 2F7C0 8003F7C0 21282002 */   addu      $a1, $s1, $zero
    /* 2F7C4 8003F7C4 660022A2 */  sb         $v0, 0x66($s1)
    /* 2F7C8 8003F7C8 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 2F7CC 8003F7CC FAFF1216 */  bne        $s0, $s2, .L8003F7B8
    /* 2F7D0 8003F7D0 6C003126 */   addiu     $s1, $s1, 0x6C
  .L8003F7D4:
    /* 2F7D4 8003F7D4 B0157126 */  addiu      $s1, $s3, 0x15B0
    /* 2F7D8 8003F7D8 07001024 */  addiu      $s0, $zero, 0x7
    /* 2F7DC 8003F7DC FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 2F7E0 8003F7E0 16167226 */  addiu      $s2, $s3, 0x1616
  .L8003F7E4:
    /* 2F7E4 8003F7E4 C6FF4286 */  lh         $v0, -0x3A($s2)
    /* 2F7E8 8003F7E8 00000000 */  nop
    /* 2F7EC 8003F7EC 04005410 */  beq        $v0, $s4, .L8003F800
    /* 2F7F0 8003F7F0 21206002 */   addu      $a0, $s3, $zero
    /* 2F7F4 8003F7F4 B7FD000C */  jal        ItemMinStats__FPC12PlayerStructPC10ItemStruct
    /* 2F7F8 8003F7F8 21282002 */   addu      $a1, $s1, $zero
    /* 2F7FC 8003F7FC 000042A2 */  sb         $v0, 0x0($s2)
  .L8003F800:
    /* 2F800 8003F800 6C005226 */  addiu      $s2, $s2, 0x6C
    /* 2F804 8003F804 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 2F808 8003F808 F6FF1416 */  bne        $s0, $s4, .L8003F7E4
    /* 2F80C 8003F80C 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 2F810 8003F810 2400BF8F */  lw         $ra, 0x24($sp)
    /* 2F814 8003F814 2000B48F */  lw         $s4, 0x20($sp)
    /* 2F818 8003F818 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 2F81C 8003F81C 1800B28F */  lw         $s2, 0x18($sp)
    /* 2F820 8003F820 1400B18F */  lw         $s1, 0x14($sp)
    /* 2F824 8003F824 1000B08F */  lw         $s0, 0x10($sp)
    /* 2F828 8003F828 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2F82C 8003F82C 0800E003 */  jr         $ra
    /* 2F830 8003F830 00000000 */   nop
endlabel CalcPlrItemMin__Fi
