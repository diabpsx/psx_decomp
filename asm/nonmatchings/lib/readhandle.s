.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching readhandle, 0x90

glabel readhandle
    /* 18E38 80028E38 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 18E3C 80028E3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 18E40 80028E40 21808000 */  addu       $s0, $a0, $zero
    /* 18E44 80028E44 1400B1AF */  sw         $s1, 0x14($sp)
    /* 18E48 80028E48 2188A000 */  addu       $s1, $a1, $zero
    /* 18E4C 80028E4C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 18E50 80028E50 2190C000 */  addu       $s2, $a2, $zero
    /* 18E54 80028E54 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 18E58 80028E58 01001324 */  addiu      $s3, $zero, 0x1
    /* 18E5C 80028E5C 0B80043C */  lui        $a0, %hi(currentdirectory)
    /* 18E60 80028E60 84698424 */  addiu      $a0, $a0, %lo(currentdirectory)
    /* 18E64 80028E64 1280053C */  lui        $a1, %hi(D_8011C43C)
    /* 18E68 80028E68 3CC4A524 */  addiu      $a1, $a1, %lo(D_8011C43C)
    /* 18E6C 80028E6C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 18E70 80028E70 4375000C */  jal        strncmp
    /* 18E74 80028E74 06000624 */   addiu     $a2, $zero, 0x6
    /* 18E78 80028E78 06004014 */  bnez       $v0, .L80028E94
    /* 18E7C 80028E7C 21200002 */   addu      $a0, $s0, $zero
    /* 18E80 80028E80 21282002 */  addu       $a1, $s1, $zero
    /* 18E84 80028E84 8999000C */  jal        readblockhandle
    /* 18E88 80028E88 21304002 */   addu      $a2, $s2, $zero
    /* 18E8C 80028E8C AAA30008 */  j          .L80028EA8
    /* 18E90 80028E90 21106002 */   addu      $v0, $s3, $zero
  .L80028E94:
    /* 18E94 80028E94 21282002 */  addu       $a1, $s1, $zero
    /* 18E98 80028E98 7346000C */  jal        read
    /* 18E9C 80028E9C 21304002 */   addu      $a2, $s2, $zero
    /* 18EA0 80028EA0 21984000 */  addu       $s3, $v0, $zero
    /* 18EA4 80028EA4 21106002 */  addu       $v0, $s3, $zero
  .L80028EA8:
    /* 18EA8 80028EA8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 18EAC 80028EAC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 18EB0 80028EB0 1800B28F */  lw         $s2, 0x18($sp)
    /* 18EB4 80028EB4 1400B18F */  lw         $s1, 0x14($sp)
    /* 18EB8 80028EB8 1000B08F */  lw         $s0, 0x10($sp)
    /* 18EBC 80028EBC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 18EC0 80028EC0 0800E003 */  jr         $ra
    /* 18EC4 80028EC4 00000000 */   nop
endlabel readhandle
