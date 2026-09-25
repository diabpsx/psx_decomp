.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching seekstreamz, 0x38

glabel seekstreamz
    /* 1D61C 8002D61C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D620 8002D620 2138A000 */  addu       $a3, $a1, $zero
    /* 1D624 8002D624 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D628 8002D628 1280053C */  lui        $a1, %hi(D_8011C500)
    /* 1D62C 8002D62C 00C5A524 */  addiu      $a1, $a1, %lo(D_8011C500)
    /* 1D630 8002D630 02000624 */  addiu      $a2, $zero, 0x2
    /* 1D634 8002D634 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D638 8002D638 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1D63C 8002D63C 5EB4000C */  jal        streamcommanda
    /* 1D640 8002D640 1400A0AF */   sw        $zero, 0x14($sp)
    /* 1D644 8002D644 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D648 8002D648 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D64C 8002D64C 0800E003 */  jr         $ra
    /* 1D650 8002D650 00000000 */   nop
endlabel seekstreamz
