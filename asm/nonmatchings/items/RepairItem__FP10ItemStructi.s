.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RepairItem__FP10ItemStructi, 0xF0

glabel RepairItem__FP10ItemStructi
    /* 35E1C 80045E1C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 35E20 80045E20 2800B0AF */  sw         $s0, 0x28($sp)
    /* 35E24 80045E24 21808000 */  addu       $s0, $a0, $zero
    /* 35E28 80045E28 3800BFAF */  sw         $ra, 0x38($sp)
    /* 35E2C 80045E2C 3400B3AF */  sw         $s3, 0x34($sp)
    /* 35E30 80045E30 3000B2AF */  sw         $s2, 0x30($sp)
    /* 35E34 80045E34 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 35E38 80045E38 3E000286 */  lh         $v0, 0x3E($s0)
    /* 35E3C 80045E3C 40000386 */  lh         $v1, 0x40($s0)
    /* 35E40 80045E40 00000000 */  nop
    /* 35E44 80045E44 29004310 */  beq        $v0, $v1, .L80045EEC
    /* 35E48 80045E48 2198A000 */   addu      $s3, $a1, $zero
    /* 35E4C 80045E4C 0400601C */  bgtz       $v1, .L80045E60
    /* 35E50 80045E50 21880000 */   addu      $s1, $zero, $zero
    /* 35E54 80045E54 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80045E58:
    /* 35E58 80045E58 BB170108 */  j          .L80045EEC
    /* 35E5C 80045E5C 2C0002A6 */   sh        $v0, 0x2C($s0)
  .L80045E60:
    /* 35E60 80045E60 09007226 */  addiu      $s2, $s3, 0x9
  .L80045E64:
    /* 35E64 80045E64 C9F6000C */  jal        ENG_random__Fl
    /* 35E68 80045E68 21206002 */   addu      $a0, $s3, $zero
    /* 35E6C 80045E6C 40000486 */  lh         $a0, 0x40($s0)
    /* 35E70 80045E70 00000000 */  nop
    /* 35E74 80045E74 1A009200 */  div        $zero, $a0, $s2
    /* 35E78 80045E78 12280000 */  mflo       $a1
    /* 35E7C 80045E7C 21105300 */  addu       $v0, $v0, $s3
    /* 35E80 80045E80 21882202 */  addu       $s1, $s1, $v0
    /* 35E84 80045E84 0200A01C */  bgtz       $a1, .L80045E90
    /* 35E88 80045E88 21108000 */   addu      $v0, $a0, $zero
    /* 35E8C 80045E8C 01000524 */  addiu      $a1, $zero, 0x1
  .L80045E90:
    /* 35E90 80045E90 23104500 */  subu       $v0, $v0, $a1
    /* 35E94 80045E94 400002A6 */  sh         $v0, 0x40($s0)
    /* 35E98 80045E98 00140200 */  sll        $v0, $v0, 16
    /* 35E9C 80045E9C 031C0200 */  sra        $v1, $v0, 16
    /* 35EA0 80045EA0 EDFF6010 */  beqz       $v1, .L80045E58
    /* 35EA4 80045EA4 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 35EA8 80045EA8 3E000286 */  lh         $v0, 0x3E($s0)
    /* 35EAC 80045EAC 00000000 */  nop
    /* 35EB0 80045EB0 21204000 */  addu       $a0, $v0, $zero
    /* 35EB4 80045EB4 21105100 */  addu       $v0, $v0, $s1
    /* 35EB8 80045EB8 2A104300 */  slt        $v0, $v0, $v1
    /* 35EBC 80045EBC E9FF4014 */  bnez       $v0, .L80045E64
    /* 35EC0 80045EC0 00000000 */   nop
    /* 35EC4 80045EC4 21109100 */  addu       $v0, $a0, $s1
    /* 35EC8 80045EC8 3E0002A6 */  sh         $v0, 0x3E($s0)
    /* 35ECC 80045ECC 00140200 */  sll        $v0, $v0, 16
    /* 35ED0 80045ED0 40000386 */  lh         $v1, 0x40($s0)
    /* 35ED4 80045ED4 03140200 */  sra        $v0, $v0, 16
    /* 35ED8 80045ED8 21206000 */  addu       $a0, $v1, $zero
    /* 35EDC 80045EDC 2A186200 */  slt        $v1, $v1, $v0
    /* 35EE0 80045EE0 02006010 */  beqz       $v1, .L80045EEC
    /* 35EE4 80045EE4 00000000 */   nop
    /* 35EE8 80045EE8 3E0004A6 */  sh         $a0, 0x3E($s0)
  .L80045EEC:
    /* 35EEC 80045EEC 3800BF8F */  lw         $ra, 0x38($sp)
    /* 35EF0 80045EF0 3400B38F */  lw         $s3, 0x34($sp)
    /* 35EF4 80045EF4 3000B28F */  lw         $s2, 0x30($sp)
    /* 35EF8 80045EF8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 35EFC 80045EFC 2800B08F */  lw         $s0, 0x28($sp)
    /* 35F00 80045F00 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 35F04 80045F04 0800E003 */  jr         $ra
    /* 35F08 80045F08 00000000 */   nop
endlabel RepairItem__FP10ItemStructi
