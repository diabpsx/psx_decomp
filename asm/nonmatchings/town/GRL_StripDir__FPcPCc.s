.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GRL_StripDir__FPcPCc, 0x98

glabel GRL_StripDir__FPcPCc
    /* 64F80 80074F80 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 64F84 80074F84 1800B2AF */  sw         $s2, 0x18($sp)
    /* 64F88 80074F88 21908000 */  addu       $s2, $a0, $zero
    /* 64F8C 80074F8C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 64F90 80074F90 2180A000 */  addu       $s0, $a1, $zero
    /* 64F94 80074F94 21200002 */  addu       $a0, $s0, $zero
    /* 64F98 80074F98 5C000524 */  addiu      $a1, $zero, 0x5C
    /* 64F9C 80074F9C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 64FA0 80074FA0 0441000C */  jal        strrchr
    /* 64FA4 80074FA4 1400B1AF */   sw        $s1, 0x14($sp)
    /* 64FA8 80074FA8 21884000 */  addu       $s1, $v0, $zero
    /* 64FAC 80074FAC 21200002 */  addu       $a0, $s0, $zero
    /* 64FB0 80074FB0 0441000C */  jal        strrchr
    /* 64FB4 80074FB4 2F000524 */   addiu     $a1, $zero, 0x2F
    /* 64FB8 80074FB8 03002016 */  bnez       $s1, .L80074FC8
    /* 64FBC 80074FBC 21184000 */   addu      $v1, $v0, $zero
    /* 64FC0 80074FC0 0A006010 */  beqz       $v1, .L80074FEC
    /* 64FC4 80074FC4 21880002 */   addu      $s1, $s0, $zero
  .L80074FC8:
    /* 64FC8 80074FC8 02006014 */  bnez       $v1, .L80074FD4
    /* 64FCC 80074FCC 21282002 */   addu      $a1, $s1, $zero
    /* 64FD0 80074FD0 21180002 */  addu       $v1, $s0, $zero
  .L80074FD4:
    /* 64FD4 80074FD4 2B10A300 */  sltu       $v0, $a1, $v1
    /* 64FD8 80074FD8 02004010 */  beqz       $v0, .L80074FE4
    /* 64FDC 80074FDC 21204002 */   addu      $a0, $s2, $zero
    /* 64FE0 80074FE0 21286000 */  addu       $a1, $v1, $zero
  .L80074FE4:
    /* 64FE4 80074FE4 FDD30108 */  j          .L80074FF4
    /* 64FE8 80074FE8 0100A524 */   addiu     $a1, $a1, 0x1
  .L80074FEC:
    /* 64FEC 80074FEC 21204002 */  addu       $a0, $s2, $zero
    /* 64FF0 80074FF0 21280002 */  addu       $a1, $s0, $zero
  .L80074FF4:
    /* 64FF4 80074FF4 F240000C */  jal        strcpy
    /* 64FF8 80074FF8 00000000 */   nop
    /* 64FFC 80074FFC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 65000 80075000 1800B28F */  lw         $s2, 0x18($sp)
    /* 65004 80075004 1400B18F */  lw         $s1, 0x14($sp)
    /* 65008 80075008 1000B08F */  lw         $s0, 0x10($sp)
    /* 6500C 8007500C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 65010 80075010 0800E003 */  jr         $ra
    /* 65014 80075014 00000000 */   nop
endlabel GRL_StripDir__FPcPCc
