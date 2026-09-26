.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching close_cdstream, 0x40

glabel close_cdstream
    /* 1C908 80156500 8C0D828F */  lw         $v0, %gp_rel(stream_open)($gp)
    /* 1C90C 80156504 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C910 80156508 06004010 */  beqz       $v0, .L80156524
    /* 1C914 8015650C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1C918 80156510 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C91C 80156514 880D82AF */  sw         $v0, %gp_rel(stream_ending)($gp)
    /* 1C920 80156518 840D80AF */  sw         $zero, %gp_rel(stream_stalled)($gp)
    /* 1C924 8015651C 4B590508 */  j          .L8015652C
    /* 1C928 80156520 00000000 */   nop
  .L80156524:
    /* 1C92C 80156524 C057050C */  jal        kill_stream_handlers
    /* 1C930 80156528 00000000 */   nop
  .L8015652C:
    /* 1C934 8015652C BC0D80AF */  sw         $zero, %gp_rel(first_handler_event)($gp)
    /* 1C938 80156530 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C93C 80156534 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C940 80156538 0800E003 */  jr         $ra
    /* 1C944 8015653C 00000000 */   nop
endlabel close_cdstream
