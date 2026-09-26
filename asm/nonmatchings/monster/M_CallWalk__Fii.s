.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_CallWalk__Fii, 0x1A0

glabel M_CallWalk__Fii
    /* 15B58 8014F750 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 15B5C 8014F754 1800B2AF */  sw         $s2, 0x18($sp)
    /* 15B60 8014F758 21908000 */  addu       $s2, $a0, $zero
    /* 15B64 8014F75C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 15B68 8014F760 2188A000 */  addu       $s1, $a1, $zero
    /* 15B6C 8014F764 2400BFAF */  sw         $ra, 0x24($sp)
    /* 15B70 8014F768 2000B4AF */  sw         $s4, 0x20($sp)
    /* 15B74 8014F76C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 15B78 8014F770 EB53050C */  jal        DirOK__Fii
    /* 15B7C 8014F774 1000B0AF */   sw        $s0, 0x10($sp)
    /* 15B80 8014F778 21804000 */  addu       $s0, $v0, $zero
    /* 15B84 8014F77C 02000424 */  addiu      $a0, $zero, 0x2
    /* 15B88 8014F780 C9F6000C */  jal        ENG_random__Fl
    /* 15B8C 8014F784 21982002 */   addu      $s3, $s1, $zero
    /* 15B90 8014F788 0D004010 */  beqz       $v0, .L8014F7C0
    /* 15B94 8014F78C FF000232 */   andi      $v0, $s0, 0xFF
    /* 15B98 8014F790 1C004014 */  bnez       $v0, .L8014F804
    /* 15B9C 8014F794 21A00000 */   addu      $s4, $zero, $zero
    /* 15BA0 8014F798 FFFF2226 */  addiu      $v0, $s1, -0x1
    /* 15BA4 8014F79C 07005130 */  andi       $s1, $v0, 0x7
    /* 15BA8 8014F7A0 21204002 */  addu       $a0, $s2, $zero
    /* 15BAC 8014F7A4 EB53050C */  jal        DirOK__Fii
    /* 15BB0 8014F7A8 21282002 */   addu      $a1, $s1, $zero
    /* 15BB4 8014F7AC FF004230 */  andi       $v0, $v0, 0xFF
    /* 15BB8 8014F7B0 14004014 */  bnez       $v0, .L8014F804
    /* 15BBC 8014F7B4 01006226 */   addiu     $v0, $s3, 0x1
    /* 15BC0 8014F7B8 FB3D0508 */  j          .L8014F7EC
    /* 15BC4 8014F7BC 07005130 */   andi      $s1, $v0, 0x7
  .L8014F7C0:
    /* 15BC8 8014F7C0 10004014 */  bnez       $v0, .L8014F804
    /* 15BCC 8014F7C4 21A00000 */   addu      $s4, $zero, $zero
    /* 15BD0 8014F7C8 01002226 */  addiu      $v0, $s1, 0x1
    /* 15BD4 8014F7CC 07005130 */  andi       $s1, $v0, 0x7
    /* 15BD8 8014F7D0 21204002 */  addu       $a0, $s2, $zero
    /* 15BDC 8014F7D4 EB53050C */  jal        DirOK__Fii
    /* 15BE0 8014F7D8 21282002 */   addu      $a1, $s1, $zero
    /* 15BE4 8014F7DC FF004230 */  andi       $v0, $v0, 0xFF
    /* 15BE8 8014F7E0 08004014 */  bnez       $v0, .L8014F804
    /* 15BEC 8014F7E4 FFFF6226 */   addiu     $v0, $s3, -0x1
    /* 15BF0 8014F7E8 07005130 */  andi       $s1, $v0, 0x7
  .L8014F7EC:
    /* 15BF4 8014F7EC 21204002 */  addu       $a0, $s2, $zero
    /* 15BF8 8014F7F0 EB53050C */  jal        DirOK__Fii
    /* 15BFC 8014F7F4 21282002 */   addu      $a1, $s1, $zero
    /* 15C00 8014F7F8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 15C04 8014F7FC 03004010 */  beqz       $v0, .L8014F80C
    /* 15C08 8014F800 21808002 */   addu      $s0, $s4, $zero
  .L8014F804:
    /* 15C0C 8014F804 01001424 */  addiu      $s4, $zero, 0x1
    /* 15C10 8014F808 21808002 */  addu       $s0, $s4, $zero
  .L8014F80C:
    /* 15C14 8014F80C C9F6000C */  jal        ENG_random__Fl
    /* 15C18 8014F810 02000424 */   addiu     $a0, $zero, 0x2
    /* 15C1C 8014F814 10004010 */  beqz       $v0, .L8014F858
    /* 15C20 8014F818 FF000232 */   andi      $v0, $s0, 0xFF
    /* 15C24 8014F81C 23004014 */  bnez       $v0, .L8014F8AC
    /* 15C28 8014F820 21A00000 */   addu      $s4, $zero, $zero
    /* 15C2C 8014F824 01006226 */  addiu      $v0, $s3, 0x1
    /* 15C30 8014F828 07004230 */  andi       $v0, $v0, 0x7
    /* 15C34 8014F82C 01004224 */  addiu      $v0, $v0, 0x1
    /* 15C38 8014F830 07005130 */  andi       $s1, $v0, 0x7
    /* 15C3C 8014F834 21204002 */  addu       $a0, $s2, $zero
    /* 15C40 8014F838 EB53050C */  jal        DirOK__Fii
    /* 15C44 8014F83C 21282002 */   addu      $a1, $s1, $zero
    /* 15C48 8014F840 FF004230 */  andi       $v0, $v0, 0xFF
    /* 15C4C 8014F844 19004014 */  bnez       $v0, .L8014F8AC
    /* 15C50 8014F848 FFFF6226 */   addiu     $v0, $s3, -0x1
    /* 15C54 8014F84C 07004230 */  andi       $v0, $v0, 0x7
    /* 15C58 8014F850 243E0508 */  j          .L8014F890
    /* 15C5C 8014F854 FFFF4224 */   addiu     $v0, $v0, -0x1
  .L8014F858:
    /* 15C60 8014F858 14004014 */  bnez       $v0, .L8014F8AC
    /* 15C64 8014F85C 21A00000 */   addu      $s4, $zero, $zero
    /* 15C68 8014F860 FFFF6226 */  addiu      $v0, $s3, -0x1
    /* 15C6C 8014F864 07004230 */  andi       $v0, $v0, 0x7
    /* 15C70 8014F868 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 15C74 8014F86C 07005130 */  andi       $s1, $v0, 0x7
    /* 15C78 8014F870 21204002 */  addu       $a0, $s2, $zero
    /* 15C7C 8014F874 EB53050C */  jal        DirOK__Fii
    /* 15C80 8014F878 21282002 */   addu      $a1, $s1, $zero
    /* 15C84 8014F87C FF004230 */  andi       $v0, $v0, 0xFF
    /* 15C88 8014F880 0A004014 */  bnez       $v0, .L8014F8AC
    /* 15C8C 8014F884 01006226 */   addiu     $v0, $s3, 0x1
    /* 15C90 8014F888 07004230 */  andi       $v0, $v0, 0x7
    /* 15C94 8014F88C 01004224 */  addiu      $v0, $v0, 0x1
  .L8014F890:
    /* 15C98 8014F890 07005130 */  andi       $s1, $v0, 0x7
    /* 15C9C 8014F894 21204002 */  addu       $a0, $s2, $zero
    /* 15CA0 8014F898 EB53050C */  jal        DirOK__Fii
    /* 15CA4 8014F89C 21282002 */   addu      $a1, $s1, $zero
    /* 15CA8 8014F8A0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 15CAC 8014F8A4 03004010 */  beqz       $v0, .L8014F8B4
    /* 15CB0 8014F8A8 21808002 */   addu      $s0, $s4, $zero
  .L8014F8AC:
    /* 15CB4 8014F8AC 01001424 */  addiu      $s4, $zero, 0x1
    /* 15CB8 8014F8B0 21808002 */  addu       $s0, $s4, $zero
  .L8014F8B4:
    /* 15CBC 8014F8B4 FF001032 */  andi       $s0, $s0, 0xFF
    /* 15CC0 8014F8B8 03000012 */  beqz       $s0, .L8014F8C8
    /* 15CC4 8014F8BC 21204002 */   addu      $a0, $s2, $zero
    /* 15CC8 8014F8C0 433C050C */  jal        M_WalkDir__Fii
    /* 15CCC 8014F8C4 21282002 */   addu      $a1, $s1, $zero
  .L8014F8C8:
    /* 15CD0 8014F8C8 21100002 */  addu       $v0, $s0, $zero
    /* 15CD4 8014F8CC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 15CD8 8014F8D0 2000B48F */  lw         $s4, 0x20($sp)
    /* 15CDC 8014F8D4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 15CE0 8014F8D8 1800B28F */  lw         $s2, 0x18($sp)
    /* 15CE4 8014F8DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 15CE8 8014F8E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 15CEC 8014F8E4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 15CF0 8014F8E8 0800E003 */  jr         $ra
    /* 15CF4 8014F8EC 00000000 */   nop
endlabel M_CallWalk__Fii
