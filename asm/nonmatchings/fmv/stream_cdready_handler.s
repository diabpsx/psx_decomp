.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stream_cdready_handler, 0x254

glabel stream_cdready_handler
    /* 1C338 80155F30 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1C33C 80155F34 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C340 80155F38 21808000 */  addu       $s0, $a0, $zero
    /* 1C344 80155F3C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1C348 80155F40 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1C34C 80155F44 7443000C */  jal        ReloadGP
    /* 1C350 80155F48 1400B1AF */   sw        $s1, 0x14($sp)
    /* 1C354 80155F4C 880D838F */  lw         $v1, %gp_rel(stream_ending)($gp)
    /* 1C358 80155F50 00000000 */  nop
    /* 1C35C 80155F54 03006014 */  bnez       $v1, .L80155F64
    /* 1C360 80155F58 21904000 */   addu      $s2, $v0, $zero
    /* 1C364 80155F5C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C368 80155F60 BC0D82AF */  sw         $v0, %gp_rel(first_handler_event)($gp)
  .L80155F64:
    /* 1C36C 80155F64 640E828F */  lw         $v0, %gp_rel(time_in_frames)($gp)
    /* 1C370 80155F68 00000000 */  nop
    /* 1C374 80155F6C 9C0E82AF */  sw         $v0, %gp_rel(last_handler_event)($gp)
    /* 1C378 80155F70 7C0D858F */  lw         $a1, %gp_rel(stream_in)($gp)
    /* 1C37C 80155F74 680E848F */  lw         $a0, %gp_rel(stream_chunksize)($gp)
    /* 1C380 80155F78 700E828F */  lw         $v0, %gp_rel(stream_subsec)($gp)
    /* 1C384 80155F7C 680E838F */  lw         $v1, %gp_rel(stream_chunksize)($gp)
    /* 1C388 80155F80 00000000 */  nop
    /* 1C38C 80155F84 1A004300 */  div        $zero, $v0, $v1
    /* 1C390 80155F88 10180000 */  mfhi       $v1
    /* 1C394 80155F8C 00000000 */  nop
    /* 1C398 80155F90 00000000 */  nop
    /* 1C39C 80155F94 1800A400 */  mult       $a1, $a0
    /* 1C3A0 80155F98 B00D828F */  lw         $v0, %gp_rel(cdstream_resetting)($gp)
    /* 1C3A4 80155F9C 12300000 */  mflo       $a2
    /* 1C3A8 80155FA0 2118C300 */  addu       $v1, $a2, $v1
    /* 1C3AC 80155FA4 CC1F83AF */  sw         $v1, %gp_rel(D_8011C74C)($gp)
    /* 1C3B0 80155FA8 6C004014 */  bnez       $v0, .L8015615C
    /* 1C3B4 80155FAC 00000000 */   nop
    /* 1C3B8 80155FB0 8C0D828F */  lw         $v0, %gp_rel(stream_open)($gp)
    /* 1C3BC 80155FB4 00000000 */  nop
    /* 1C3C0 80155FB8 68004010 */  beqz       $v0, .L8015615C
    /* 1C3C4 80155FBC FF001132 */   andi      $s1, $s0, 0xFF
    /* 1C3C8 80155FC0 01000324 */  addiu      $v1, $zero, 0x1
    /* 1C3CC 80155FC4 07002312 */  beq        $s1, $v1, .L80155FE4
    /* 1C3D0 80155FC8 00000000 */   nop
    /* 1C3D4 80155FCC 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1C3D8 80155FD0 B00D83AF */  sw         $v1, %gp_rel(cdstream_resetting)($gp)
    /* 1C3DC 80155FD4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1C3E0 80155FD8 980E82AF */  sw         $v0, %gp_rel(cdstream_resetsec)($gp)
    /* 1C3E4 80155FDC 58580508 */  j          .L80156160
    /* 1C3E8 80155FE0 21204002 */   addu      $a0, $s2, $zero
  .L80155FE4:
    /* 1C3EC 80155FE4 880D828F */  lw         $v0, %gp_rel(stream_ending)($gp)
    /* 1C3F0 80155FE8 00000000 */  nop
    /* 1C3F4 80155FEC 09004010 */  beqz       $v0, .L80156014
    /* 1C3F8 80155FF0 00000000 */   nop
    /* 1C3FC 80155FF4 C057050C */  jal        kill_stream_handlers
    /* 1C400 80155FF8 00000000 */   nop
    /* 1C404 80155FFC 21204002 */  addu       $a0, $s2, $zero
    /* 1C408 80156000 BC0D80AF */  sw         $zero, %gp_rel(first_handler_event)($gp)
    /* 1C40C 80156004 880D80AF */  sw         $zero, %gp_rel(stream_ending)($gp)
    /* 1C410 80156008 8C0D80AF */  sw         $zero, %gp_rel(stream_open)($gp)
    /* 1C414 8015600C 58580508 */  j          .L80156160
    /* 1C418 80156010 00000000 */   nop
  .L80156014:
    /* 1C41C 80156014 840D828F */  lw         $v0, %gp_rel(stream_stalled)($gp)
    /* 1C420 80156018 00000000 */  nop
    /* 1C424 8015601C 4F004014 */  bnez       $v0, .L8015615C
    /* 1C428 80156020 00000000 */   nop
    /* 1C42C 80156024 1280103C */  lui        $s0, %hi(D_80121C98)
    /* 1C430 80156028 981C1026 */  addiu      $s0, $s0, %lo(D_80121C98)
    /* 1C434 8015602C 21200002 */  addu       $a0, $s0, $zero
    /* 1C438 80156030 8D6C000C */  jal        CdGetSector
    /* 1C43C 80156034 03000524 */   addiu     $a1, $zero, 0x3
    /* 1C440 80156038 EF6C000C */  jal        CdPosToInt
    /* 1C444 8015603C 21200002 */   addu      $a0, $s0, $zero
    /* 1C448 80156040 740E838F */  lw         $v1, %gp_rel(stream_secnum)($gp)
    /* 1C44C 80156044 D41F82AF */  sw         $v0, %gp_rel(D_8011C754)($gp)
    /* 1C450 80156048 06004310 */  beq        $v0, $v1, .L80156064
    /* 1C454 8015604C 08000524 */   addiu     $a1, $zero, 0x8
    /* 1C458 80156050 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1C45C 80156054 B00D91AF */  sw         $s1, %gp_rel(cdstream_resetting)($gp)
    /* 1C460 80156058 980E82AF */  sw         $v0, %gp_rel(cdstream_resetsec)($gp)
    /* 1C464 8015605C 5A580508 */  j          .L80156168
    /* 1C468 80156060 00000000 */   nop
  .L80156064:
    /* 1C46C 80156064 CC1F848F */  lw         $a0, %gp_rel(D_8011C74C)($gp)
    /* 1C470 80156068 700D828F */  lw         $v0, %gp_rel(stream_bufh)($gp)
    /* 1C474 8015606C 40210400 */  sll        $a0, $a0, 5
    /* 1C478 80156070 8D6C000C */  jal        CdGetSector
    /* 1C47C 80156074 21204400 */   addu      $a0, $v0, $a0
    /* 1C480 80156078 CC1F828F */  lw         $v0, %gp_rel(D_8011C74C)($gp)
    /* 1C484 8015607C F8010524 */  addiu      $a1, $zero, 0x1F8
    /* 1C488 80156080 80210200 */  sll        $a0, $v0, 6
    /* 1C48C 80156084 23208200 */  subu       $a0, $a0, $v0
    /* 1C490 80156088 6C0D828F */  lw         $v0, %gp_rel(stream_buf)($gp)
    /* 1C494 8015608C 40210400 */  sll        $a0, $a0, 5
    /* 1C498 80156090 8D6C000C */  jal        CdGetSector
    /* 1C49C 80156094 21204400 */   addu      $a0, $v0, $a0
    /* 1C4A0 80156098 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1C4A4 8015609C 00000000 */  nop
    /* 1C4A8 801560A0 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C4AC 801560A4 740E82AF */  sw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1C4B0 801560A8 740E828F */  lw         $v0, %gp_rel(stream_secnum)($gp)
    /* 1C4B4 801560AC 700E828F */  lw         $v0, %gp_rel(stream_subsec)($gp)
    /* 1C4B8 801560B0 00000000 */  nop
    /* 1C4BC 801560B4 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C4C0 801560B8 700E82AF */  sw         $v0, %gp_rel(stream_subsec)($gp)
    /* 1C4C4 801560BC 700E838F */  lw         $v1, %gp_rel(stream_subsec)($gp)
    /* 1C4C8 801560C0 680E828F */  lw         $v0, %gp_rel(stream_chunksize)($gp)
    /* 1C4CC 801560C4 00000000 */  nop
    /* 1C4D0 801560C8 19006214 */  bne        $v1, $v0, .L80156130
    /* 1C4D4 801560CC 00000000 */   nop
    /* 1C4D8 801560D0 700E80AF */  sw         $zero, %gp_rel(stream_subsec)($gp)
    /* 1C4DC 801560D4 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C4E0 801560D8 00000000 */  nop
    /* 1C4E4 801560DC 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C4E8 801560E0 740D82AF */  sw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C4EC 801560E4 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1C4F0 801560E8 780D828F */  lw         $v0, %gp_rel(stream_chunks_total)($gp)
    /* 1C4F4 801560EC 00000000 */  nop
    /* 1C4F8 801560F0 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C4FC 801560F4 780D82AF */  sw         $v0, %gp_rel(stream_chunks_total)($gp)
    /* 1C500 801560F8 780D828F */  lw         $v0, %gp_rel(stream_chunks_total)($gp)
    /* 1C504 801560FC 7C0D828F */  lw         $v0, %gp_rel(stream_in)($gp)
    /* 1C508 80156100 6C0E838F */  lw         $v1, %gp_rel(stream_bufsize)($gp)
    /* 1C50C 80156104 01004224 */  addiu      $v0, $v0, 0x1
    /* 1C510 80156108 1A004300 */  div        $zero, $v0, $v1
    /* 1C514 8015610C 10180000 */  mfhi       $v1
    /* 1C518 80156110 00000000 */  nop
    /* 1C51C 80156114 7C0D83AF */  sw         $v1, %gp_rel(stream_in)($gp)
    /* 1C520 80156118 740D838F */  lw         $v1, %gp_rel(stream_chunks_in)($gp)
    /* 1C524 8015611C 6C0E828F */  lw         $v0, %gp_rel(stream_bufsize)($gp)
    /* 1C528 80156120 00000000 */  nop
    /* 1C52C 80156124 02006214 */  bne        $v1, $v0, .L80156130
    /* 1C530 80156128 00000000 */   nop
    /* 1C534 8015612C 840D91AF */  sw         $s1, %gp_rel(stream_stalled)($gp)
  .L80156130:
    /* 1C538 80156130 740E838F */  lw         $v1, %gp_rel(stream_secnum)($gp)
    /* 1C53C 80156134 780E828F */  lw         $v0, %gp_rel(stream_last_sector)($gp)
    /* 1C540 80156138 00000000 */  nop
    /* 1C544 8015613C 08006214 */  bne        $v1, $v0, .L80156160
    /* 1C548 80156140 21204002 */   addu      $a0, $s2, $zero
    /* 1C54C 80156144 9983000C */  jal        DBG_Halt
    /* 1C550 80156148 00000000 */   nop
    /* 1C554 8015614C C057050C */  jal        kill_stream_handlers
    /* 1C558 80156150 00000000 */   nop
    /* 1C55C 80156154 880D80AF */  sw         $zero, %gp_rel(stream_ending)($gp)
    /* 1C560 80156158 8C0D80AF */  sw         $zero, %gp_rel(stream_open)($gp)
  .L8015615C:
    /* 1C564 8015615C 21204002 */  addu       $a0, $s2, $zero
  .L80156160:
    /* 1C568 80156160 7943000C */  jal        SetGP
    /* 1C56C 80156164 00000000 */   nop
  .L80156168:
    /* 1C570 80156168 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1C574 8015616C 1800B28F */  lw         $s2, 0x18($sp)
    /* 1C578 80156170 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C57C 80156174 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C580 80156178 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1C584 8015617C 0800E003 */  jr         $ra
    /* 1C588 80156180 00000000 */   nop
endlabel stream_cdready_handler
