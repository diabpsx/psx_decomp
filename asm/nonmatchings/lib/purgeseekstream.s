.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgeseekstream, 0x34

glabel purgeseekstream
    /* 1D6C0 8002D6C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D6C4 8002D6C4 2138A000 */  addu       $a3, $a1, $zero
    /* 1D6C8 8002D6C8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D6CC 8002D6CC 1280053C */  lui        $a1, %hi(D_8011C500)
    /* 1D6D0 8002D6D0 00C5A524 */  addiu      $a1, $a1, %lo(D_8011C500)
    /* 1D6D4 8002D6D4 0B000624 */  addiu      $a2, $zero, 0xB
    /* 1D6D8 8002D6D8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D6DC 8002D6DC ABB4000C */  jal        purgestreamcommanda
    /* 1D6E0 8002D6E0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1D6E4 8002D6E4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D6E8 8002D6E8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D6EC 8002D6EC 0800E003 */  jr         $ra
    /* 1D6F0 8002D6F0 00000000 */   nop
endlabel purgeseekstream
