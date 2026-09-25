.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_Open__FiiiP10SCREEN_ENVUl, 0x11C

glabel PRIM_Open__FiiiP10SCREEN_ENVUl
    /* 737F4 800837F4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 737F8 800837F8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 737FC 800837FC 4000B18F */  lw         $s1, 0x40($sp)
    /* 73800 80083800 2800B4AF */  sw         $s4, 0x28($sp)
    /* 73804 80083804 21A08000 */  addu       $s4, $a0, $zero
    /* 73808 80083808 2400B3AF */  sw         $s3, 0x24($sp)
    /* 7380C 8008380C 2198A000 */  addu       $s3, $a1, $zero
    /* 73810 80083810 2000B2AF */  sw         $s2, 0x20($sp)
    /* 73814 80083814 2190C000 */  addu       $s2, $a2, $zero
    /* 73818 80083818 1800B0AF */  sw         $s0, 0x18($sp)
    /* 7381C 8008381C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 73820 80083820 0E5A020C */  jal        PROF_Open__Fv
    /* 73824 80083824 2180E000 */   addu      $s0, $a3, $zero
    /* 73828 80083828 C0201200 */  sll        $a0, $s2, 3
    /* 7382C 8008382C 23209200 */  subu       $a0, $a0, $s2
    /* 73830 80083830 1180063C */  lui        $a2, %hi(D_8010FFD4)
    /* 73834 80083834 D4FFC624 */  addiu      $a2, $a2, %lo(D_8010FFD4)
    /* 73838 80083838 941E90AF */  sw         $s0, %gp_rel(D_8011C614)($gp)
    /* 7383C 8008383C 901E92A3 */  sb         $s2, %gp_rel(D_8011C610)($gp)
    /* 73840 80083840 21282002 */  addu       $a1, $s1, $zero
    /* 73844 80083844 911E85A3 */  sb         $a1, %gp_rel(D_8011C611)($gp)
    /* 73848 80083848 7785000C */  jal        GAL_Alloc
    /* 7384C 8008384C 80200400 */   sll       $a0, $a0, 2
    /* 73850 80083850 21204000 */  addu       $a0, $v0, $zero
    /* 73854 80083854 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 73858 80083858 881E84AF */  sw         $a0, %gp_rel(D_8011C608)($gp)
    /* 7385C 8008385C A41E93AF */  sw         $s3, %gp_rel(D_8011C624)($gp)
    /* 73860 80083860 22008210 */  beq        $a0, $v0, .L800838EC
    /* 73864 80083864 21100000 */   addu      $v0, $zero, $zero
    /* 73868 80083868 DD85000C */  jal        GAL_Lock
    /* 7386C 8008386C 00000000 */   nop
    /* 73870 80083870 8C1E82AF */  sw         $v0, %gp_rel(D_8011C60C)($gp)
    /* 73874 80083874 1C004010 */  beqz       $v0, .L800838E8
    /* 73878 80083878 00000000 */   nop
    /* 7387C 8008387C 0D00401A */  blez       $s2, .L800838B4
    /* 73880 80083880 21800000 */   addu      $s0, $zero, $zero
    /* 73884 80083884 21880000 */  addu       $s1, $zero, $zero
  .L80083888:
    /* 73888 80083888 21288002 */  addu       $a1, $s4, $zero
    /* 7388C 8008388C 8C1E848F */  lw         $a0, %gp_rel(D_8011C60C)($gp)
    /* 73890 80083890 21306002 */  addu       $a2, $s3, $zero
    /* 73894 80083894 440E020C */  jal        InitPrimBuffer__FP11PRIM_BUFFERii
    /* 73898 80083898 21209100 */   addu      $a0, $a0, $s1
    /* 7389C 8008389C FF004230 */  andi       $v0, $v0, 0xFF
    /* 738A0 800838A0 11004010 */  beqz       $v0, .L800838E8
    /* 738A4 800838A4 01001026 */   addiu     $s0, $s0, 0x1
    /* 738A8 800838A8 2A101202 */  slt        $v0, $s0, $s2
    /* 738AC 800838AC F6FF4014 */  bnez       $v0, .L80083888
    /* 738B0 800838B0 1C003126 */   addiu     $s1, $s1, 0x1C
  .L800838B4:
    /* 738B4 800838B4 0880043C */  lui        $a0, %hi(PrimDrawSycnCallBack)
    /* 738B8 800838B8 E03D8424 */  addiu      $a0, $a0, %lo(PrimDrawSycnCallBack)
    /* 738BC 800838BC 981E80AF */  sw         $zero, %gp_rel(D_8011C618)($gp)
    /* 738C0 800838C0 604E000C */  jal        DrawSyncCallback
    /* 738C4 800838C4 00000000 */   nop
    /* 738C8 800838C8 FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 738CC 800838CC 9C1E80A3 */  sb         $zero, %gp_rel(D_8011C61C)($gp)
    /* 738D0 800838D0 9D1E82A3 */  sb         $v0, %gp_rel(D_8011C61D)($gp)
    /* 738D4 800838D4 921E80A3 */  sb         $zero, %gp_rel(D_8011C612)($gp)
    /* 738D8 800838D8 D70E020C */  jal        PRIM_Flush__Fv
    /* 738DC 800838DC 00000000 */   nop
    /* 738E0 800838E0 3B0E0208 */  j          .L800838EC
    /* 738E4 800838E4 01000224 */   addiu     $v0, $zero, 0x1
  .L800838E8:
    /* 738E8 800838E8 21100000 */  addu       $v0, $zero, $zero
  .L800838EC:
    /* 738EC 800838EC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 738F0 800838F0 2800B48F */  lw         $s4, 0x28($sp)
    /* 738F4 800838F4 2400B38F */  lw         $s3, 0x24($sp)
    /* 738F8 800838F8 2000B28F */  lw         $s2, 0x20($sp)
    /* 738FC 800838FC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 73900 80083900 1800B08F */  lw         $s0, 0x18($sp)
    /* 73904 80083904 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 73908 80083908 0800E003 */  jr         $ra
    /* 7390C 8008390C 00000000 */   nop
endlabel PRIM_Open__FiiiP10SCREEN_ENVUl
