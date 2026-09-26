.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cdstream_is_last_chunk, 0x18

glabel cdstream_is_last_chunk
    /* 1C7D0 801563C8 880E828F */  lw         $v0, %gp_rel(stream_got_chunks)($gp)
    /* 1C7D4 801563CC 840E838F */  lw         $v1, %gp_rel(stream_last_chunk)($gp)
    /* 1C7D8 801563D0 00000000 */  nop
    /* 1C7DC 801563D4 26104300 */  xor        $v0, $v0, $v1
    /* 1C7E0 801563D8 0800E003 */  jr         $ra
    /* 1C7E4 801563DC 0100422C */   sltiu     $v0, $v0, 0x1
endlabel cdstream_is_last_chunk
