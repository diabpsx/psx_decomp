.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cdstream_discard_chunk, 0x120

glabel cdstream_discard_chunk
    /* 1C7E8 801563E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C7EC 801563E4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1C7F0 801563E8 6346000C */  jal        EnterCriticalSection
    /* 1C7F4 801563EC 00000000 */   nop
    /* 1C7F8 801563F0 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C7FC 801563F4 00000000 */  nop
    /* 1C800 801563F8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1C804 801563FC 740D82AF */  sw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C808 80156400 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C80C 80156404 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C810 80156408 00000000 */  nop
    /* 1C814 8015640C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1C818 80156410 940D82AF */  sw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C81C 80156414 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C820 80156418 6746000C */  jal        ExitCriticalSection
    /* 1C824 8015641C 00000000 */   nop
    /* 1C828 80156420 9C0D828F */  lw         $v0, %gp_rel(_discard_count)($gp)
    /* 1C82C 80156424 00000000 */  nop
    /* 1C830 80156428 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C834 8015642C 9C0D82AF */  sw         $v0, %gp_rel(_discard_count)($gp)
    /* 1C838 80156430 9C0D828F */  lw         $v0, %gp_rel(_discard_count)($gp)
    /* 1C83C 80156434 9C0D838F */  lw         $v1, %gp_rel(_discard_count)($gp)
    /* 1C840 80156438 980D828F */  lw         $v0, %gp_rel(_get_count)($gp)
    /* 1C844 8015643C 00000000 */  nop
    /* 1C848 80156440 2A104300 */  slt        $v0, $v0, $v1
    /* 1C84C 80156444 05004010 */  beqz       $v0, .L8015645C
    /* 1C850 80156448 00000000 */   nop
    /* 1C854 8015644C 1480043C */  lui        $a0, %hi(func_8013B7DC + 0x60)
    /* 1C858 80156450 3CB88424 */  addiu      $a0, $a0, %lo(func_8013B7DC + 0x60)
    /* 1C85C 80156454 9367000C */  jal        printf
    /* 1C860 80156458 00000000 */   nop
  .L8015645C:
    /* 1C864 8015645C 940D838F */  lw         $v1, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C868 80156460 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C86C 80156464 00000000 */  nop
    /* 1C870 80156468 2A104300 */  slt        $v0, $v0, $v1
    /* 1C874 8015646C 05004010 */  beqz       $v0, .L80156484
    /* 1C878 80156470 00000000 */   nop
    /* 1C87C 80156474 1480043C */  lui        $a0, %hi(func_8013B7DC + 0x7C)
    /* 1C880 80156478 58B88424 */  addiu      $a0, $a0, %lo(func_8013B7DC + 0x7C)
    /* 1C884 8015647C 9367000C */  jal        printf
    /* 1C888 80156480 00000000 */   nop
  .L80156484:
    /* 1C88C 80156484 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C890 80156488 00000000 */  nop
    /* 1C894 8015648C 05004004 */  bltz       $v0, .L801564A4
    /* 1C898 80156490 21180000 */   addu      $v1, $zero, $zero
    /* 1C89C 80156494 940D828F */  lw         $v0, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C8A0 80156498 00000000 */  nop
    /* 1C8A4 8015649C 02004104 */  bgez       $v0, .L801564A8
    /* 1C8A8 801564A0 00000000 */   nop
  .L801564A4:
    /* 1C8AC 801564A4 01000324 */  addiu      $v1, $zero, 0x1
  .L801564A8:
    /* 1C8B0 801564A8 07006010 */  beqz       $v1, .L801564C8
    /* 1C8B4 801564AC 00000000 */   nop
    /* 1C8B8 801564B0 740D858F */  lw         $a1, %gp_rel(stream_chunks_in)($gp)
    /* 1C8BC 801564B4 940D868F */  lw         $a2, %gp_rel(stream_chunks_borrowed)($gp)
    /* 1C8C0 801564B8 1480043C */  lui        $a0, %hi(func_8013B7DC + 0x94)
    /* 1C8C4 801564BC 70B88424 */  addiu      $a0, $a0, %lo(func_8013B7DC + 0x94)
    /* 1C8C8 801564C0 9367000C */  jal        printf
    /* 1C8CC 801564C4 00000000 */   nop
  .L801564C8:
    /* 1C8D0 801564C8 840D828F */  lw         $v0, %gp_rel(stream_stalled)($gp)
    /* 1C8D4 801564CC 00000000 */  nop
    /* 1C8D8 801564D0 07004010 */  beqz       $v0, .L801564F0
    /* 1C8DC 801564D4 00000000 */   nop
    /* 1C8E0 801564D8 740E848F */  lw         $a0, %gp_rel(stream_secnum)($gp)
    /* 1C8E4 801564DC 8757050C */  jal        _cd_seek
    /* 1C8E8 801564E0 00000000 */   nop
    /* 1C8EC 801564E4 3377000C */  jal        CdRead2
    /* 1C8F0 801564E8 A0000424 */   addiu     $a0, $zero, 0xA0
    /* 1C8F4 801564EC 840D80AF */  sw         $zero, %gp_rel(stream_stalled)($gp)
  .L801564F0:
    /* 1C8F8 801564F0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C8FC 801564F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C900 801564F8 0800E003 */  jr         $ra
    /* 1C904 801564FC 00000000 */   nop
endlabel cdstream_discard_chunk
