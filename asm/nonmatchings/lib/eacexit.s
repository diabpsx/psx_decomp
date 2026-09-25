.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching eacexit, 0x74

glabel eacexit
    /* 1F664 8002F664 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1F668 8002F668 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1F66C 8002F66C 1F001124 */  addiu      $s1, $zero, 0x1F
    /* 1F670 8002F670 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1F674 8002F674 0B80103C */  lui        $s0, %hi(D_800B7040)
    /* 1F678 8002F678 40701026 */  addiu      $s0, $s0, %lo(D_800B7040)
    /* 1F67C 8002F67C 1800BFAF */  sw         $ra, 0x18($sp)
  .L8002F680:
    /* 1F680 8002F680 0000028E */  lw         $v0, 0x0($s0)
    /* 1F684 8002F684 00000000 */  nop
    /* 1F688 8002F688 03004010 */  beqz       $v0, .L8002F698
    /* 1F68C 8002F68C 00000000 */   nop
    /* 1F690 8002F690 09F84000 */  jalr       $v0
    /* 1F694 8002F694 00000000 */   nop
  .L8002F698:
    /* 1F698 8002F698 000000AE */  sw         $zero, 0x0($s0)
    /* 1F69C 8002F69C FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 1F6A0 8002F6A0 F7FF2106 */  bgez       $s1, .L8002F680
    /* 1F6A4 8002F6A4 FCFF1026 */   addiu     $s0, $s0, -0x4
    /* 1F6A8 8002F6A8 1280043C */  lui        $a0, %hi(D_8011C51C)
    /* 1F6AC 8002F6AC 1CC58424 */  addiu      $a0, $a0, %lo(D_8011C51C)
    /* 1F6B0 8002F6B0 9367000C */  jal        printf
    /* 1F6B4 8002F6B4 1A000524 */   addiu     $a1, $zero, 0x1A
    /* 1F6B8 8002F6B8 DFBD000C */  jal        exit
    /* 1F6BC 8002F6BC 21200000 */   addu      $a0, $zero, $zero
    /* 1F6C0 8002F6C0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1F6C4 8002F6C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 1F6C8 8002F6C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1F6CC 8002F6CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1F6D0 8002F6D0 0800E003 */  jr         $ra
    /* 1F6D4 8002F6D4 00000000 */   nop
endlabel eacexit
