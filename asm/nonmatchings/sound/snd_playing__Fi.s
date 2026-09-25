.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching snd_playing__Fi, 0x20

glabel snd_playing__Fi
    /* 67F70 80077F70 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 67F74 80077F74 1000BFAF */  sw         $ra, 0x10($sp)
    /* 67F78 80077F78 BB69020C */  jal        SND_IsSfxPlaying__Fi
    /* 67F7C 80077F7C 00000000 */   nop
    /* 67F80 80077F80 1000BF8F */  lw         $ra, 0x10($sp)
    /* 67F84 80077F84 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 67F88 80077F88 0800E003 */  jr         $ra
    /* 67F8C 80077F8C 00000000 */   nop
endlabel snd_playing__Fi
