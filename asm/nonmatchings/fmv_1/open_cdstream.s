.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching open_cdstream, 0x128

glabel open_cdstream
    /* 1CA00 801565F8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1CA04 801565FC 2800B0AF */  sw         $s0, 0x28($sp)
    /* 1CA08 80156600 21808000 */  addu       $s0, $a0, $zero
    /* 1CA0C 80156604 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 1CA10 80156608 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1CA14 8015660C 01A4000C */  jal        fileexists
    /* 1CA18 80156610 2188A000 */   addu      $s1, $a1, $zero
    /* 1CA1C 80156614 06004014 */  bnez       $v0, .L80156630
    /* 1CA20 80156618 00000000 */   nop
    /* 1CA24 8015661C 21200000 */  addu       $a0, $zero, $zero
    /* 1CA28 80156620 1480053C */  lui        $a1, %hi(func_8013B7DC + 0xE8)
    /* 1CA2C 80156624 C4B8A524 */  addiu      $a1, $a1, %lo(func_8013B7DC + 0xE8)
    /* 1CA30 80156628 A583000C */  jal        DBG_Error
    /* 1CA34 8015662C D6020624 */   addiu     $a2, $zero, 0x2D6
  .L80156630:
    /* 1CA38 80156630 DFA3000C */  jal        filesize
    /* 1CA3C 80156634 21200002 */   addu      $a0, $s0, $zero
    /* 1CA40 80156638 1280043C */  lui        $a0, %hi(D_80121CE8)
    /* 1CA44 8015663C E81C8424 */  addiu      $a0, $a0, %lo(D_80121CE8)
    /* 1CA48 80156640 1000A527 */  addiu      $a1, $sp, 0x10
    /* 1CA4C 80156644 9C0D80AF */  sw         $zero, %gp_rel(_discard_count)($gp)
    /* 1CA50 80156648 9C0D838F */  lw         $v1, %gp_rel(_discard_count)($gp)
    /* 1CA54 8015664C C3820200 */  sra        $s0, $v0, 11
    /* 1CA58 80156650 980D83AF */  sw         $v1, %gp_rel(_get_count)($gp)
    /* 1CA5C 80156654 880D80AF */  sw         $zero, %gp_rel(stream_ending)($gp)
    /* 1CA60 80156658 780D80AF */  sw         $zero, %gp_rel(stream_chunks_total)($gp)
    /* 1CA64 8015665C 740E80AF */  sw         $zero, %gp_rel(stream_secnum)($gp)
    /* 1CA68 80156660 A51B020C */  jal        CD_GetCdlFILE__FPCcP7CdlFILE
    /* 1CA6C 80156664 00000000 */   nop
    /* 1CA70 80156668 EF6C000C */  jal        CdPosToInt
    /* 1CA74 8015666C 1000A427 */   addiu     $a0, $sp, 0x10
    /* 1CA78 80156670 740E82AF */  sw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1CA7C 80156674 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1CA80 80156678 00000000 */  nop
    /* 1CA84 8015667C 21105100 */  addu       $v0, $v0, $s1
    /* 1CA88 80156680 740E82AF */  sw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1CA8C 80156684 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1CA90 80156688 00000000 */  nop
    /* 1CA94 8015668C 7C0E82AF */  sw         $v0, %gp_rel(stream_startsec)($gp)
    /* 1CA98 80156690 740E848F */  lw         $a0, %gp_rel(stream_secnum)($gp)
    /* 1CA9C 80156694 8757050C */  jal        _cd_seek
    /* 1CAA0 80156698 00000000 */   nop
    /* 1CAA4 8015669C 700E80AF */  sw         $zero, %gp_rel(stream_subsec)($gp)
    /* 1CAA8 801566A0 940D80AF */  sw         $zero, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1CAAC 801566A4 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1CAB0 801566A8 00000000 */  nop
    /* 1CAB4 801566AC 880E82AF */  sw         $v0, %gp_rel(stream_got_chunks)($gp)
    /* 1CAB8 801566B0 680E828F */  lw         $v0, %gp_rel(stream_chunksize)($gp)
    /* 1CABC 801566B4 00000000 */  nop
    /* 1CAC0 801566B8 1A000202 */  div        $zero, $s0, $v0
    /* 1CAC4 801566BC 12100000 */  mflo       $v0
    /* 1CAC8 801566C0 00000000 */  nop
    /* 1CACC 801566C4 840E82AF */  sw         $v0, %gp_rel(stream_last_chunk)($gp)
    /* 1CAD0 801566C8 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1CAD4 801566CC B80D80AF */  sw         $zero, %gp_rel(sector_dma_in)($gp)
    /* 1CAD8 801566D0 B40D80AF */  sw         $zero, %gp_rel(sector_dma)($gp)
    /* 1CADC 801566D4 21105000 */  addu       $v0, $v0, $s0
    /* 1CAE0 801566D8 780E82AF */  sw         $v0, %gp_rel(stream_last_sector)($gp)
    /* 1CAE4 801566DC 6158050C */  jal        install_stream_handlers
    /* 1CAE8 801566E0 00000000 */   nop
    /* 1CAEC 801566E4 640E828F */  lw         $v0, %gp_rel(time_in_frames)($gp)
    /* 1CAF0 801566E8 A0000424 */  addiu      $a0, $zero, 0xA0
    /* 1CAF4 801566EC 800E82AF */  sw         $v0, %gp_rel(stream_opened)($gp)
    /* 1CAF8 801566F0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1CAFC 801566F4 8C0D82AF */  sw         $v0, %gp_rel(stream_open)($gp)
    /* 1CB00 801566F8 840D80AF */  sw         $zero, %gp_rel(stream_stalled)($gp)
    /* 1CB04 801566FC 3377000C */  jal        CdRead2
    /* 1CB08 80156700 00000000 */   nop
    /* 1CB0C 80156704 C0121000 */  sll        $v0, $s0, 11
    /* 1CB10 80156708 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1CB14 8015670C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 1CB18 80156710 2800B08F */  lw         $s0, 0x28($sp)
    /* 1CB1C 80156714 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1CB20 80156718 0800E003 */  jr         $ra
    /* 1CB24 8015671C 00000000 */   nop
endlabel open_cdstream
