.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching libclosehandle, 0x60

glabel libclosehandle
    /* 18DD8 80028DD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18DDC 80028DDC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 18DE0 80028DE0 21808000 */  addu       $s0, $a0, $zero
    /* 18DE4 80028DE4 0F00001A */  blez       $s0, .L80028E24
    /* 18DE8 80028DE8 1400BFAF */   sw        $ra, 0x14($sp)
    /* 18DEC 80028DEC 0B80043C */  lui        $a0, %hi(currentdirectory)
    /* 18DF0 80028DF0 84698424 */  addiu      $a0, $a0, %lo(currentdirectory)
    /* 18DF4 80028DF4 1280053C */  lui        $a1, %hi(D_8011C43C)
    /* 18DF8 80028DF8 3CC4A524 */  addiu      $a1, $a1, %lo(D_8011C43C)
    /* 18DFC 80028DFC 4375000C */  jal        strncmp
    /* 18E00 80028E00 06000624 */   addiu     $a2, $zero, 0x6
    /* 18E04 80028E04 05004014 */  bnez       $v0, .L80028E1C
    /* 18E08 80028E08 00000000 */   nop
    /* 18E0C 80028E0C 5E99000C */  jal        closeblockhandle
    /* 18E10 80028E10 21200002 */   addu      $a0, $s0, $zero
    /* 18E14 80028E14 89A30008 */  j          .L80028E24
    /* 18E18 80028E18 00000000 */   nop
  .L80028E1C:
    /* 18E1C 80028E1C 7B46000C */  jal        close
    /* 18E20 80028E20 21200002 */   addu      $a0, $s0, $zero
  .L80028E24:
    /* 18E24 80028E24 1400BF8F */  lw         $ra, 0x14($sp)
    /* 18E28 80028E28 1000B08F */  lw         $s0, 0x10($sp)
    /* 18E2C 80028E2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18E30 80028E30 0800E003 */  jr         $ra
    /* 18E34 80028E34 00000000 */   nop
endlabel libclosehandle
