.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching queueseekstream, 0x38

glabel queueseekstream
    /* 1D654 8002D654 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D658 8002D658 2138A000 */  addu       $a3, $a1, $zero
    /* 1D65C 8002D65C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D660 8002D660 1280053C */  lui        $a1, %hi(D_8011C500)
    /* 1D664 8002D664 00C5A524 */  addiu      $a1, $a1, %lo(D_8011C500)
    /* 1D668 8002D668 10000624 */  addiu      $a2, $zero, 0x10
    /* 1D66C 8002D66C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D670 8002D670 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1D674 8002D674 5EB4000C */  jal        streamcommanda
    /* 1D678 8002D678 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1D67C 8002D67C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D680 8002D680 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D684 8002D684 0800E003 */  jr         $ra
    /* 1D688 8002D688 00000000 */   nop
endlabel queueseekstream
