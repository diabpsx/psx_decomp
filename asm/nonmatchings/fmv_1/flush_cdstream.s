.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching flush_cdstream, 0x54

glabel flush_cdstream
    /* 1C284 80155E7C 940D80AF */  sw         $zero, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C288 80155E80 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C28C 80155E84 00000000 */  nop
    /* 1C290 80155E88 7C0D82AF */  sw         $v0, %gp_rel(stream_in)($gp)
    /* 1C294 80155E8C 7C0D828F */  lw         $v0, %gp_rel(stream_in)($gp)
    /* 1C298 80155E90 00000000 */  nop
    /* 1C29C 80155E94 800D82AF */  sw         $v0, %gp_rel(stream_out)($gp)
    /* 1C2A0 80155E98 800D828F */  lw         $v0, %gp_rel(stream_out)($gp)
    /* 1C2A4 80155E9C 00000000 */  nop
    /* 1C2A8 80155EA0 780D82AF */  sw         $v0, %gp_rel(stream_chunks_total)($gp)
    /* 1C2AC 80155EA4 780D828F */  lw         $v0, %gp_rel(stream_chunks_total)($gp)
    /* 1C2B0 80155EA8 00000000 */  nop
    /* 1C2B4 80155EAC 740D82AF */  sw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C2B8 80155EB0 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C2BC 80155EB4 00000000 */  nop
    /* 1C2C0 80155EB8 9C0D82AF */  sw         $v0, %gp_rel(_discard_count)($gp)
    /* 1C2C4 80155EBC 9C0D828F */  lw         $v0, %gp_rel(_discard_count)($gp)
    /* 1C2C8 80155EC0 00000000 */  nop
    /* 1C2CC 80155EC4 980D82AF */  sw         $v0, %gp_rel(_get_count)($gp)
    /* 1C2D0 80155EC8 0800E003 */  jr         $ra
    /* 1C2D4 80155ECC 00000000 */   nop
endlabel flush_cdstream
