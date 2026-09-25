.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openhandlewa, 0x124

glabel openhandlewa
    /* 18C90 80028C90 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 18C94 80028C94 6000B0AF */  sw         $s0, 0x60($sp)
    /* 18C98 80028C98 21808000 */  addu       $s0, $a0, $zero
    /* 18C9C 80028C9C 6400B1AF */  sw         $s1, 0x64($sp)
    /* 18CA0 80028CA0 2188A000 */  addu       $s1, $a1, $zero
    /* 18CA4 80028CA4 6800B2AF */  sw         $s2, 0x68($sp)
    /* 18CA8 80028CA8 2190C000 */  addu       $s2, $a2, $zero
    /* 18CAC 80028CAC 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 18CB0 80028CB0 2198E000 */  addu       $s3, $a3, $zero
    /* 18CB4 80028CB4 7000B4AF */  sw         $s4, 0x70($sp)
    /* 18CB8 80028CB8 8800B48F */  lw         $s4, 0x88($sp)
    /* 18CBC 80028CBC 1280053C */  lui        $a1, %hi(D_8011C43C)
    /* 18CC0 80028CC0 3CC4A524 */  addiu      $a1, $a1, %lo(D_8011C43C)
    /* 18CC4 80028CC4 06000624 */  addiu      $a2, $zero, 0x6
    /* 18CC8 80028CC8 7400BFAF */  sw         $ra, 0x74($sp)
    /* 18CCC 80028CCC 000020AE */  sw         $zero, 0x0($s1)
    /* 18CD0 80028CD0 000040AE */  sw         $zero, 0x0($s2)
    /* 18CD4 80028CD4 4375000C */  jal        strncmp
    /* 18CD8 80028CD8 000060AE */   sw        $zero, 0x0($s3)
    /* 18CDC 80028CDC 07004010 */  beqz       $v0, .L80028CFC
    /* 18CE0 80028CE0 21200002 */   addu      $a0, $s0, $zero
    /* 18CE4 80028CE4 1280053C */  lui        $a1, %hi(D_8011C434)
    /* 18CE8 80028CE8 34C4A524 */  addiu      $a1, $a1, %lo(D_8011C434)
    /* 18CEC 80028CEC 4375000C */  jal        strncmp
    /* 18CF0 80028CF0 06000624 */   addiu     $a2, $zero, 0x6
    /* 18CF4 80028CF4 0B004014 */  bnez       $v0, .L80028D24
    /* 18CF8 80028CF8 1000A427 */   addiu     $a0, $sp, 0x10
  .L80028CFC:
    /* 18CFC 80028CFC 1F008012 */  beqz       $s4, .L80028D7C
    /* 18D00 80028D00 21280002 */   addu      $a1, $s0, $zero
    /* 18D04 80028D04 1180043C */  lui        $a0, %hi(D_8010F1D8)
    /* 18D08 80028D08 D8F18424 */  addiu      $a0, $a0, %lo(D_8010F1D8)
    /* 18D0C 80028D0C 1180023C */  lui        $v0, %hi(D_8010F130)
    /* 18D10 80028D10 30F14224 */  addiu      $v0, $v0, %lo(D_8010F130)
    /* 18D14 80028D14 1280013C */  lui        $at, %hi(abortfile)
    /* 18D18 80028D18 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 18D1C 80028D1C 5BA30008 */  j          .L80028D6C
    /* 18D20 80028D20 9B010224 */   addiu     $v0, $zero, 0x19B
  .L80028D24:
    /* 18D24 80028D24 1280053C */  lui        $a1, %hi(D_8011C450)
    /* 18D28 80028D28 50C4A524 */  addiu      $a1, $a1, %lo(D_8011C450)
    /* 18D2C 80028D2C 9767000C */  jal        sprintf
    /* 18D30 80028D30 21300002 */   addu      $a2, $s0, $zero
    /* 18D34 80028D34 1000A427 */  addiu      $a0, $sp, 0x10
    /* 18D38 80028D38 6F46000C */  jal        open
    /* 18D3C 80028D3C 03020524 */   addiu     $a1, $zero, 0x203
    /* 18D40 80028D40 10004104 */  bgez       $v0, .L80028D84
    /* 18D44 80028D44 000022AE */   sw        $v0, 0x0($s1)
    /* 18D48 80028D48 0C008012 */  beqz       $s4, .L80028D7C
    /* 18D4C 80028D4C 1000A527 */   addiu     $a1, $sp, 0x10
    /* 18D50 80028D50 1180043C */  lui        $a0, %hi(D_8010F234)
    /* 18D54 80028D54 34F28424 */  addiu      $a0, $a0, %lo(D_8010F234)
    /* 18D58 80028D58 1180023C */  lui        $v0, %hi(D_8010F130)
    /* 18D5C 80028D5C 30F14224 */  addiu      $v0, $v0, %lo(D_8010F130)
    /* 18D60 80028D60 1280013C */  lui        $at, %hi(abortfile)
    /* 18D64 80028D64 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 18D68 80028D68 A6010224 */  addiu      $v0, $zero, 0x1A6
  .L80028D6C:
    /* 18D6C 80028D6C 1280013C */  lui        $at, %hi(abortline)
    /* 18D70 80028D70 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 18D74 80028D74 0F95000C */  jal        abortmessage
    /* 18D78 80028D78 00000000 */   nop
  .L80028D7C:
    /* 18D7C 80028D7C 64A30008 */  j          .L80028D90
    /* 18D80 80028D80 21100000 */   addu      $v0, $zero, $zero
  .L80028D84:
    /* 18D84 80028D84 01000224 */  addiu      $v0, $zero, 0x1
    /* 18D88 80028D88 000040AE */  sw         $zero, 0x0($s2)
    /* 18D8C 80028D8C 000060AE */  sw         $zero, 0x0($s3)
  .L80028D90:
    /* 18D90 80028D90 7400BF8F */  lw         $ra, 0x74($sp)
    /* 18D94 80028D94 7000B48F */  lw         $s4, 0x70($sp)
    /* 18D98 80028D98 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 18D9C 80028D9C 6800B28F */  lw         $s2, 0x68($sp)
    /* 18DA0 80028DA0 6400B18F */  lw         $s1, 0x64($sp)
    /* 18DA4 80028DA4 6000B08F */  lw         $s0, 0x60($sp)
    /* 18DA8 80028DA8 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 18DAC 80028DAC 0800E003 */  jr         $ra
    /* 18DB0 80028DB0 00000000 */   nop
endlabel openhandlewa
