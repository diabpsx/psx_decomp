.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MonstPlace__Fii, 0xCC

glabel MonstPlace__Fii
    /* 25B64 8015F75C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 25B68 8015F760 1000B0AF */  sw         $s0, 0x10($sp)
    /* 25B6C 8015F764 21808000 */  addu       $s0, $a0, $zero
    /* 25B70 8015F768 1400B1AF */  sw         $s1, 0x14($sp)
    /* 25B74 8015F76C 2188A000 */  addu       $s1, $a1, $zero
    /* 25B78 8015F770 6000022E */  sltiu      $v0, $s0, 0x60
    /* 25B7C 8015F774 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 25B80 8015F778 1E004010 */  beqz       $v0, .L8015F7F4
    /* 25B84 8015F77C 1800B2AF */   sw        $s2, 0x18($sp)
    /* 25B88 8015F780 6000222E */  sltiu      $v0, $s1, 0x60
    /* 25B8C 8015F784 1B004010 */  beqz       $v0, .L8015F7F4
    /* 25B90 8015F788 C0101100 */   sll       $v0, $s1, 3
    /* 25B94 8015F78C C0181000 */  sll        $v1, $s0, 3
    /* 25B98 8015F790 23187000 */  subu       $v1, $v1, $s0
    /* 25B9C 8015F794 C0190300 */  sll        $v1, $v1, 7
    /* 25BA0 8015F798 21904300 */  addu       $s2, $v0, $v1
    /* 25BA4 8015F79C 0E80013C */  lui        $at, %hi(dung_map)
    /* 25BA8 8015F7A0 21083200 */  addu       $at, $at, $s2
    /* 25BAC 8015F7A4 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 25BB0 8015F7A8 00000000 */  nop
    /* 25BB4 8015F7AC 17004014 */  bnez       $v0, .L8015F80C
    /* 25BB8 8015F7B0 21100000 */   addu      $v0, $zero, $zero
    /* 25BBC 8015F7B4 21200002 */  addu       $a0, $s0, $zero
    /* 25BC0 8015F7B8 447F010C */  jal        IsDplayer__Fii
    /* 25BC4 8015F7BC 21282002 */   addu      $a1, $s1, $zero
    /* 25BC8 8015F7C0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 25BCC 8015F7C4 11004014 */  bnez       $v0, .L8015F80C
    /* 25BD0 8015F7C8 21100000 */   addu      $v0, $zero, $zero
    /* 25BD4 8015F7CC 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 25BD8 8015F7D0 21083200 */  addu       $at, $at, $s2
    /* 25BDC 8015F7D4 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 25BE0 8015F7D8 00000000 */  nop
    /* 25BE4 8015F7DC 04006230 */  andi       $v0, $v1, 0x4
    /* 25BE8 8015F7E0 0A004014 */  bnez       $v0, .L8015F80C
    /* 25BEC 8015F7E4 21100000 */   addu      $v0, $zero, $zero
    /* 25BF0 8015F7E8 08006230 */  andi       $v0, $v1, 0x8
    /* 25BF4 8015F7EC 03004010 */  beqz       $v0, .L8015F7FC
    /* 25BF8 8015F7F0 21200002 */   addu      $a0, $s0, $zero
  .L8015F7F4:
    /* 25BFC 8015F7F4 037E0508 */  j          .L8015F80C
    /* 25C00 8015F7F8 21100000 */   addu      $v0, $zero, $zero
  .L8015F7FC:
    /* 25C04 8015F7FC 1383010C */  jal        SolidLoc__Fii
    /* 25C08 8015F800 21282002 */   addu      $a1, $s1, $zero
    /* 25C0C 8015F804 FF004230 */  andi       $v0, $v0, 0xFF
    /* 25C10 8015F808 0100422C */  sltiu      $v0, $v0, 0x1
  .L8015F80C:
    /* 25C14 8015F80C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 25C18 8015F810 1800B28F */  lw         $s2, 0x18($sp)
    /* 25C1C 8015F814 1400B18F */  lw         $s1, 0x14($sp)
    /* 25C20 8015F818 1000B08F */  lw         $s0, 0x10($sp)
    /* 25C24 8015F81C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 25C28 8015F820 0800E003 */  jr         $ra
    /* 25C2C 8015F824 00000000 */   nop
endlabel MonstPlace__Fii
