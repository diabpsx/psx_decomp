.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resync_audio, 0x10

glabel resync_audio
    /* 1E108 80157D00 02000224 */  addiu      $v0, $zero, 0x2
    /* 1E10C 80157D04 D00D82AF */  sw         $v0, %gp_rel(mdec_audio_playing)($gp)
    /* 1E110 80157D08 0800E003 */  jr         $ra
    /* 1E114 80157D0C 00000000 */   nop
endlabel resync_audio
