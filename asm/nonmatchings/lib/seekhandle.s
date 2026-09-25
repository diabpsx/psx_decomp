.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching seekhandle, 0x74

glabel seekhandle
    /* 18EE8 80028EE8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18EEC 80028EEC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 18EF0 80028EF0 21888000 */  addu       $s1, $a0, $zero
    /* 18EF4 80028EF4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 18EF8 80028EF8 2180A000 */  addu       $s0, $a1, $zero
    /* 18EFC 80028EFC 0B80043C */  lui        $a0, %hi(currentdirectory)
    /* 18F00 80028F00 84698424 */  addiu      $a0, $a0, %lo(currentdirectory)
    /* 18F04 80028F04 1280053C */  lui        $a1, %hi(D_8011C43C)
    /* 18F08 80028F08 3CC4A524 */  addiu      $a1, $a1, %lo(D_8011C43C)
    /* 18F0C 80028F0C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18F10 80028F10 4375000C */  jal        strncmp
    /* 18F14 80028F14 06000624 */   addiu     $a2, $zero, 0x6
    /* 18F18 80028F18 05004014 */  bnez       $v0, .L80028F30
    /* 18F1C 80028F1C 21202002 */   addu      $a0, $s1, $zero
    /* 18F20 80028F20 E99B000C */  jal        seekblockhandle
    /* 18F24 80028F24 21280002 */   addu      $a1, $s0, $zero
    /* 18F28 80028F28 D1A30008 */  j          .L80028F44
    /* 18F2C 80028F2C 21100002 */   addu      $v0, $s0, $zero
  .L80028F30:
    /* 18F30 80028F30 21280002 */  addu       $a1, $s0, $zero
    /* 18F34 80028F34 DBA3000C */  jal        lseek
    /* 18F38 80028F38 21300000 */   addu      $a2, $zero, $zero
    /* 18F3C 80028F3C 21804000 */  addu       $s0, $v0, $zero
    /* 18F40 80028F40 21100002 */  addu       $v0, $s0, $zero
  .L80028F44:
    /* 18F44 80028F44 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18F48 80028F48 1400B18F */  lw         $s1, 0x14($sp)
    /* 18F4C 80028F4C 1000B08F */  lw         $s0, 0x10($sp)
    /* 18F50 80028F50 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18F54 80028F54 0800E003 */  jr         $ra
    /* 18F58 80028F58 00000000 */   nop
endlabel seekhandle
