.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_cdstream, 0x28

glabel init_cdstream
    /* 1C25C 80155E54 1800C400 */  mult       $a2, $a0
    /* 1C260 80155E58 680E84AF */  sw         $a0, %gp_rel(stream_chunksize)($gp)
    /* 1C264 80155E5C 700D85AF */  sw         $a1, %gp_rel(stream_bufh)($gp)
    /* 1C268 80155E60 6C0E86AF */  sw         $a2, %gp_rel(stream_bufsize)($gp)
    /* 1C26C 80155E64 12180000 */  mflo       $v1
    /* 1C270 80155E68 40110300 */  sll        $v0, $v1, 5
    /* 1C274 80155E6C 2128A200 */  addu       $a1, $a1, $v0
    /* 1C278 80155E70 6C0D85AF */  sw         $a1, %gp_rel(stream_buf)($gp)
    /* 1C27C 80155E74 0800E003 */  jr         $ra
    /* 1C280 80155E78 00000000 */   nop
endlabel init_cdstream
