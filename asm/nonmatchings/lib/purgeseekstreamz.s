.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgeseekstreamz, 0x30

glabel purgeseekstreamz
    /* 1D6F4 8002D6F4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D6F8 8002D6F8 2138A000 */  addu       $a3, $a1, $zero
    /* 1D6FC 8002D6FC 1280053C */  lui        $a1, %hi(D_8011C500)
    /* 1D700 8002D700 00C5A524 */  addiu      $a1, $a1, %lo(D_8011C500)
    /* 1D704 8002D704 0B000624 */  addiu      $a2, $zero, 0xB
    /* 1D708 8002D708 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D70C 8002D70C ABB4000C */  jal        purgestreamcommanda
    /* 1D710 8002D710 1000A0AF */   sw        $zero, 0x10($sp)
    /* 1D714 8002D714 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D718 8002D718 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D71C 8002D71C 0800E003 */  jr         $ra
    /* 1D720 8002D720 00000000 */   nop
endlabel purgeseekstreamz
