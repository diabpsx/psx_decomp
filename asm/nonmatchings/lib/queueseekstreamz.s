.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching queueseekstreamz, 0x34

glabel queueseekstreamz
    /* 1D68C 8002D68C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D690 8002D690 2138A000 */  addu       $a3, $a1, $zero
    /* 1D694 8002D694 1280053C */  lui        $a1, %hi(D_8011C500)
    /* 1D698 8002D698 00C5A524 */  addiu      $a1, $a1, %lo(D_8011C500)
    /* 1D69C 8002D69C 10000624 */  addiu      $a2, $zero, 0x10
    /* 1D6A0 8002D6A0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D6A4 8002D6A4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1D6A8 8002D6A8 5EB4000C */  jal        streamcommanda
    /* 1D6AC 8002D6AC 1400A0AF */   sw        $zero, 0x14($sp)
    /* 1D6B0 8002D6B0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D6B4 8002D6B4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D6B8 8002D6B8 0800E003 */  jr         $ra
    /* 1D6BC 8002D6BC 00000000 */   nop
endlabel queueseekstreamz
