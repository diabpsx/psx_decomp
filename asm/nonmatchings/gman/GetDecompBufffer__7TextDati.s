.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDecompBufffer__7TextDati, 0x160

glabel GetDecompBufffer__7TextDati
    /* 82D14 80092D14 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 82D18 80092D18 1400B1AF */  sw         $s1, 0x14($sp)
    /* 82D1C 80092D1C 21888000 */  addu       $s1, $a0, $zero
    /* 82D20 80092D20 2400BFAF */  sw         $ra, 0x24($sp)
    /* 82D24 80092D24 2000B4AF */  sw         $s4, 0x20($sp)
    /* 82D28 80092D28 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 82D2C 80092D2C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 82D30 80092D30 1000B0AF */  sw         $s0, 0x10($sp)
    /* 82D34 80092D34 6000228E */  lw         $v0, 0x60($s1)
    /* 82D38 80092D38 00000000 */  nop
    /* 82D3C 80092D3C 80100200 */  sll        $v0, $v0, 2
    /* 82D40 80092D40 21105100 */  addu       $v0, $v0, $s1
    /* 82D44 80092D44 6400538C */  lw         $s3, 0x64($v0)
    /* 82D48 80092D48 28000224 */  addiu      $v0, $zero, 0x28
    /* 82D4C 80092D4C 06006216 */  bne        $s3, $v0, .L80092D68
    /* 82D50 80092D50 2180A000 */   addu      $s0, $a1, $zero
    /* 82D54 80092D54 21200000 */  addu       $a0, $zero, $zero
    /* 82D58 80092D58 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82D5C 80092D5C 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 82D60 80092D60 A583000C */  jal        DBG_Error
    /* 82D64 80092D64 CE020624 */   addiu     $a2, $zero, 0x2CE
  .L80092D68:
    /* 82D68 80092D68 6C00248E */  lw         $a0, 0x6C($s1)
    /* 82D6C 80092D6C DD85000C */  jal        GAL_Lock
    /* 82D70 80092D70 00000000 */   nop
    /* 82D74 80092D74 21904000 */  addu       $s2, $v0, $zero
    /* 82D78 80092D78 07004016 */  bnez       $s2, .L80092D98
    /* 82D7C 80092D7C 21200002 */   addu      $a0, $s0, $zero
    /* 82D80 80092D80 21200000 */  addu       $a0, $zero, $zero
    /* 82D84 80092D84 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82D88 80092D88 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 82D8C 80092D8C A583000C */  jal        DBG_Error
    /* 82D90 80092D90 D1020624 */   addiu     $a2, $zero, 0x2D1
    /* 82D94 80092D94 21200002 */  addu       $a0, $s0, $zero
  .L80092D98:
    /* 82D98 80092D98 01000524 */  addiu      $a1, $zero, 0x1
    /* 82D9C 80092D9C 6000228E */  lw         $v0, 0x60($s1)
    /* 82DA0 80092DA0 1280063C */  lui        $a2, %hi(D_8011ACF8)
    /* 82DA4 80092DA4 F8ACC624 */  addiu      $a2, $a2, %lo(D_8011ACF8)
    /* 82DA8 80092DA8 80180200 */  sll        $v1, $v0, 2
    /* 82DAC 80092DAC 21186200 */  addu       $v1, $v1, $v0
    /* 82DB0 80092DB0 40190300 */  sll        $v1, $v1, 5
    /* 82DB4 80092DB4 7785000C */  jal        GAL_Alloc
    /* 82DB8 80092DB8 21904302 */   addu      $s2, $s2, $v1
    /* 82DBC 80092DBC 21804000 */  addu       $s0, $v0, $zero
    /* 82DC0 80092DC0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 82DC4 80092DC4 05000216 */  bne        $s0, $v0, .L80092DDC
    /* 82DC8 80092DC8 21200000 */   addu      $a0, $zero, $zero
    /* 82DCC 80092DCC 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82DD0 80092DD0 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 82DD4 80092DD4 A583000C */  jal        DBG_Error
    /* 82DD8 80092DD8 D6020624 */   addiu     $a2, $zero, 0x2D6
  .L80092DDC:
    /* 82DDC 80092DDC DD85000C */  jal        GAL_Lock
    /* 82DE0 80092DE0 21200002 */   addu      $a0, $s0, $zero
    /* 82DE4 80092DE4 21A04000 */  addu       $s4, $v0, $zero
    /* 82DE8 80092DE8 07008016 */  bnez       $s4, .L80092E08
    /* 82DEC 80092DEC 80101300 */   sll       $v0, $s3, 2
    /* 82DF0 80092DF0 21200000 */  addu       $a0, $zero, $zero
    /* 82DF4 80092DF4 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82DF8 80092DF8 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 82DFC 80092DFC A583000C */  jal        DBG_Error
    /* 82E00 80092E00 D9020624 */   addiu     $a2, $zero, 0x2D9
    /* 82E04 80092E04 80101300 */  sll        $v0, $s3, 2
  .L80092E08:
    /* 82E08 80092E08 21105200 */  addu       $v0, $v0, $s2
    /* 82E0C 80092E0C 000050AC */  sw         $s0, 0x0($v0)
    /* 82E10 80092E10 6C00248E */  lw         $a0, 0x6C($s1)
    /* 82E14 80092E14 F785000C */  jal        GAL_Unlock
    /* 82E18 80092E18 00000000 */   nop
    /* 82E1C 80092E1C FF004230 */  andi       $v0, $v0, 0xFF
    /* 82E20 80092E20 05004014 */  bnez       $v0, .L80092E38
    /* 82E24 80092E24 21200000 */   addu      $a0, $zero, $zero
    /* 82E28 80092E28 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82E2C 80092E2C 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 82E30 80092E30 A583000C */  jal        DBG_Error
    /* 82E34 80092E34 DE020624 */   addiu     $a2, $zero, 0x2DE
  .L80092E38:
    /* 82E38 80092E38 01007326 */  addiu      $s3, $s3, 0x1
    /* 82E3C 80092E3C 6000238E */  lw         $v1, 0x60($s1)
    /* 82E40 80092E40 21108002 */  addu       $v0, $s4, $zero
    /* 82E44 80092E44 80180300 */  sll        $v1, $v1, 2
    /* 82E48 80092E48 21187100 */  addu       $v1, $v1, $s1
    /* 82E4C 80092E4C 640073AC */  sw         $s3, 0x64($v1)
    /* 82E50 80092E50 2400BF8F */  lw         $ra, 0x24($sp)
    /* 82E54 80092E54 2000B48F */  lw         $s4, 0x20($sp)
    /* 82E58 80092E58 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 82E5C 80092E5C 1800B28F */  lw         $s2, 0x18($sp)
    /* 82E60 80092E60 1400B18F */  lw         $s1, 0x14($sp)
    /* 82E64 80092E64 1000B08F */  lw         $s0, 0x10($sp)
    /* 82E68 80092E68 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 82E6C 80092E6C 0800E003 */  jr         $ra
    /* 82E70 80092E70 00000000 */   nop
endlabel GetDecompBufffer__7TextDati
