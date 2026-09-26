.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching wait_cdstream, 0xB8

glabel wait_cdstream
    /* 1C948 80156540 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1C94C 80156544 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1C950 80156548 01000424 */  addiu      $a0, $zero, 0x1
  .L8015654C:
    /* 1C954 8015654C 8C0D828F */  lw         $v0, %gp_rel(stream_open)($gp)
    /* 1C958 80156550 00000000 */  nop
    /* 1C95C 80156554 05004014 */  bnez       $v0, .L8015656C
    /* 1C960 80156558 21180000 */   addu      $v1, $zero, $zero
    /* 1C964 8015655C 880D828F */  lw         $v0, %gp_rel(stream_ending)($gp)
    /* 1C968 80156560 00000000 */  nop
    /* 1C96C 80156564 02004010 */  beqz       $v0, .L80156570
    /* 1C970 80156568 00000000 */   nop
  .L8015656C:
    /* 1C974 8015656C 01000324 */  addiu      $v1, $zero, 0x1
  .L80156570:
    /* 1C978 80156570 03006010 */  beqz       $v1, .L80156580
    /* 1C97C 80156574 00000000 */   nop
    /* 1C980 80156578 F4FF8014 */  bnez       $a0, .L8015654C
    /* 1C984 8015657C 00000000 */   nop
  .L80156580:
    /* 1C988 80156580 8C0D828F */  lw         $v0, %gp_rel(stream_open)($gp)
    /* 1C98C 80156584 00000000 */  nop
    /* 1C990 80156588 05004014 */  bnez       $v0, .L801565A0
    /* 1C994 8015658C 21180000 */   addu      $v1, $zero, $zero
    /* 1C998 80156590 880D828F */  lw         $v0, %gp_rel(stream_ending)($gp)
    /* 1C99C 80156594 00000000 */  nop
    /* 1C9A0 80156598 02004010 */  beqz       $v0, .L801565A4
    /* 1C9A4 8015659C 00000000 */   nop
  .L801565A0:
    /* 1C9A8 801565A0 01000324 */  addiu      $v1, $zero, 0x1
  .L801565A4:
    /* 1C9AC 801565A4 10006010 */  beqz       $v1, .L801565E8
    /* 1C9B0 801565A8 00000000 */   nop
    /* 1C9B4 801565AC 1480043C */  lui        $a0, %hi(D_8013B89C)
    /* 1C9B8 801565B0 9CB88424 */  addiu      $a0, $a0, %lo(D_8013B89C)
    /* 1C9BC 801565B4 9367000C */  jal        printf
    /* 1C9C0 801565B8 00000000 */   nop
    /* 1C9C4 801565BC 840D80AF */  sw         $zero, %gp_rel(stream_stalled)($gp)
    /* 1C9C8 801565C0 840D828F */  lw         $v0, %gp_rel(stream_stalled)($gp)
    /* 1C9CC 801565C4 00000000 */  nop
    /* 1C9D0 801565C8 880D82AF */  sw         $v0, %gp_rel(stream_ending)($gp)
    /* 1C9D4 801565CC 880D828F */  lw         $v0, %gp_rel(stream_ending)($gp)
    /* 1C9D8 801565D0 00000000 */  nop
    /* 1C9DC 801565D4 8C0D82AF */  sw         $v0, %gp_rel(stream_open)($gp)
    /* 1C9E0 801565D8 4059050C */  jal        close_cdstream
    /* 1C9E4 801565DC 00000000 */   nop
    /* 1C9E8 801565E0 5059050C */  jal        wait_cdstream
    /* 1C9EC 801565E4 00000000 */   nop
  .L801565E8:
    /* 1C9F0 801565E8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1C9F4 801565EC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1C9F8 801565F0 0800E003 */  jr         $ra
    /* 1C9FC 801565F4 00000000 */   nop
endlabel wait_cdstream
