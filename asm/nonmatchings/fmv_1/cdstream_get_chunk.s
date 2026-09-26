.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cdstream_get_chunk, 0x118

glabel cdstream_get_chunk
    /* 1C6B8 801562B0 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C6BC 801562B4 940D838F */  lw         $v1, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C6C0 801562B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1C6C4 801562BC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C6C8 801562C0 21808000 */  addu       $s0, $a0, $zero
    /* 1C6CC 801562C4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1C6D0 801562C8 2188A000 */  addu       $s1, $a1, $zero
    /* 1C6D4 801562CC 23104300 */  subu       $v0, $v0, $v1
    /* 1C6D8 801562D0 05004104 */  bgez       $v0, .L801562E8
    /* 1C6DC 801562D4 1800BFAF */   sw        $ra, 0x18($sp)
    /* 1C6E0 801562D8 1480043C */  lui        $a0, %hi(func_8013B7DC + 0x48)
    /* 1C6E4 801562DC 24B88424 */  addiu      $a0, $a0, %lo(func_8013B7DC + 0x48)
    /* 1C6E8 801562E0 9367000C */  jal        printf
    /* 1C6EC 801562E4 00000000 */   nop
  .L801562E8:
    /* 1C6F0 801562E8 740D838F */  lw         $v1, %gp_rel(stream_chunks_in)($gp)
    /* 1C6F4 801562EC 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C6F8 801562F0 00000000 */  nop
    /* 1C6FC 801562F4 04006214 */  bne        $v1, $v0, .L80156308
    /* 1C700 801562F8 21100000 */   addu      $v0, $zero, $zero
    /* 1C704 801562FC 000000AE */  sw         $zero, 0x0($s0)
    /* 1C708 80156300 EC580508 */  j          .L801563B0
    /* 1C70C 80156304 000020AE */   sw        $zero, 0x0($s1)
  .L80156308:
    /* 1C710 80156308 800D838F */  lw         $v1, %gp_rel(stream_out)($gp)
    /* 1C714 8015630C 680E828F */  lw         $v0, %gp_rel(stream_chunksize)($gp)
    /* 1C718 80156310 00000000 */  nop
    /* 1C71C 80156314 18006200 */  mult       $v1, $v0
    /* 1C720 80156318 12180000 */  mflo       $v1
    /* 1C724 8015631C 80110300 */  sll        $v0, $v1, 6
    /* 1C728 80156320 23104300 */  subu       $v0, $v0, $v1
    /* 1C72C 80156324 6C0D838F */  lw         $v1, %gp_rel(stream_buf)($gp)
    /* 1C730 80156328 40110200 */  sll        $v0, $v0, 5
    /* 1C734 8015632C 21186200 */  addu       $v1, $v1, $v0
    /* 1C738 80156330 000003AE */  sw         $v1, 0x0($s0)
    /* 1C73C 80156334 800D838F */  lw         $v1, %gp_rel(stream_out)($gp)
    /* 1C740 80156338 680E828F */  lw         $v0, %gp_rel(stream_chunksize)($gp)
    /* 1C744 8015633C 00000000 */  nop
    /* 1C748 80156340 18006200 */  mult       $v1, $v0
    /* 1C74C 80156344 700D828F */  lw         $v0, %gp_rel(stream_bufh)($gp)
    /* 1C750 80156348 12180000 */  mflo       $v1
    /* 1C754 8015634C 40190300 */  sll        $v1, $v1, 5
    /* 1C758 80156350 21104300 */  addu       $v0, $v0, $v1
    /* 1C75C 80156354 000022AE */  sw         $v0, 0x0($s1)
    /* 1C760 80156358 980D828F */  lw         $v0, %gp_rel(_get_count)($gp)
    /* 1C764 8015635C 00000000 */  nop
    /* 1C768 80156360 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C76C 80156364 980D82AF */  sw         $v0, %gp_rel(_get_count)($gp)
    /* 1C770 80156368 980D828F */  lw         $v0, %gp_rel(_get_count)($gp)
    /* 1C774 8015636C 800D828F */  lw         $v0, %gp_rel(stream_out)($gp)
    /* 1C778 80156370 6C0E838F */  lw         $v1, %gp_rel(stream_bufsize)($gp)
    /* 1C77C 80156374 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C780 80156378 1A004300 */  div        $zero, $v0, $v1
    /* 1C784 8015637C 10180000 */  mfhi       $v1
    /* 1C788 80156380 00000000 */  nop
    /* 1C78C 80156384 800D83AF */  sw         $v1, %gp_rel(stream_out)($gp)
    /* 1C790 80156388 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C794 8015638C 00000000 */  nop
    /* 1C798 80156390 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C79C 80156394 940D82AF */  sw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C7A0 80156398 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C7A4 8015639C 880E838F */  lw         $v1, %gp_rel(stream_got_chunks)($gp)
    /* 1C7A8 801563A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C7AC 801563A4 01006324 */  addiu      $v1, $v1, 0x1
    /* 1C7B0 801563A8 880E83AF */  sw         $v1, %gp_rel(stream_got_chunks)($gp)
    /* 1C7B4 801563AC 880E838F */  lw         $v1, %gp_rel(stream_got_chunks)($gp)
  .L801563B0:
    /* 1C7B8 801563B0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1C7BC 801563B4 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C7C0 801563B8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C7C4 801563BC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1C7C8 801563C0 0800E003 */  jr         $ra
    /* 1C7CC 801563C4 00000000 */   nop
endlabel cdstream_get_chunk
