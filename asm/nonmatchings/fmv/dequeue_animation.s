.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching dequeue_animation, 0x1B0

glabel dequeue_animation
    /* 1E248 80157E40 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1E24C 80157E44 500D858F */  lw         $a1, %gp_rel(mdec_tail)($gp)
    /* 1E250 80157E48 580D848F */  lw         $a0, %gp_rel(mdecs_queued)($gp)
    /* 1E254 80157E4C 1580033C */  lui        $v1, %hi(mdec_queue)
    /* 1E258 80157E50 5C5C6324 */  addiu      $v1, $v1, %lo(mdec_queue)
    /* 1E25C 80157E54 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1E260 80157E58 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E264 80157E5C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1E268 80157E60 80100500 */  sll        $v0, $a1, 2
    /* 1E26C 80157E64 21104500 */  addu       $v0, $v0, $a1
    /* 1E270 80157E68 80100200 */  sll        $v0, $v0, 2
    /* 1E274 80157E6C 5A008010 */  beqz       $a0, .L80157FD8
    /* 1E278 80157E70 21804300 */   addu      $s0, $v0, $v1
    /* 1E27C 80157E74 0100A324 */  addiu      $v1, $a1, 0x1
    /* 1E280 80157E78 02006104 */  bgez       $v1, .L80157E84
    /* 1E284 80157E7C 21106000 */   addu      $v0, $v1, $zero
    /* 1E288 80157E80 1000A224 */  addiu      $v0, $a1, 0x10
  .L80157E84:
    /* 1E28C 80157E84 03110200 */  sra        $v0, $v0, 4
    /* 1E290 80157E88 00110200 */  sll        $v0, $v0, 4
    /* 1E294 80157E8C 0800118E */  lw         $s1, 0x8($s0)
    /* 1E298 80157E90 23106200 */  subu       $v0, $v1, $v0
    /* 1E29C 80157E94 500D82AF */  sw         $v0, %gp_rel(mdec_tail)($gp)
    /* 1E2A0 80157E98 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1E2A4 80157E9C 1E002216 */  bne        $s1, $v0, .L80157F18
    /* 1E2A8 80157EA0 00000000 */   nop
    /* 1E2AC 80157EA4 9F57050C */  jal        flush_cdstream
    /* 1E2B0 80157EA8 00000000 */   nop
    /* 1E2B4 80157EAC 21280000 */  addu       $a1, $zero, $zero
    /* 1E2B8 80157EB0 0000048E */  lw         $a0, 0x0($s0)
    /* 1E2BC 80157EB4 7E59050C */  jal        open_cdstream
    /* 1E2C0 80157EB8 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 1E2C4 80157EBC 480E838F */  lw         $v1, %gp_rel(mdec_sectors_per_frame)($gp)
    /* 1E2C8 80157EC0 00000000 */  nop
    /* 1E2CC 80157EC4 C01A0300 */  sll        $v1, $v1, 11
    /* 1E2D0 80157EC8 1A004300 */  div        $zero, $v0, $v1
    /* 1E2D4 80157ECC 12100000 */  mflo       $v0
    /* 1E2D8 80157ED0 540D858F */  lw         $a1, %gp_rel(mdec_waiting_tail)($gp)
    /* 1E2DC 80157ED4 380E80AF */  sw         $zero, %gp_rel(mdec_framecount)($gp)
    /* 1E2E0 80157ED8 440E91AF */  sw         $s1, %gp_rel(mdec_last_frame)($gp)
    /* 1E2E4 80157EDC 0100A424 */  addiu      $a0, $a1, 0x1
    /* 1E2E8 80157EE0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1E2EC 80157EE4 340E82AF */  sw         $v0, %gp_rel(last_stream_frame)($gp)
    /* 1E2F0 80157EE8 02008104 */  bgez       $a0, .L80157EF4
    /* 1E2F4 80157EEC 21188000 */   addu      $v1, $a0, $zero
    /* 1E2F8 80157EF0 1000A324 */  addiu      $v1, $a1, 0x10
  .L80157EF4:
    /* 1E2FC 80157EF4 03110300 */  sra        $v0, $v1, 4
    /* 1E300 80157EF8 00110200 */  sll        $v0, $v0, 4
    /* 1E304 80157EFC 5C0D838F */  lw         $v1, %gp_rel(mdecs_waiting)($gp)
    /* 1E308 80157F00 23108200 */  subu       $v0, $a0, $v0
    /* 1E30C 80157F04 540D82AF */  sw         $v0, %gp_rel(mdec_waiting_tail)($gp)
    /* 1E310 80157F08 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1E314 80157F0C 5C0D83AF */  sw         $v1, %gp_rel(mdecs_waiting)($gp)
    /* 1E318 80157F10 EE5F0508 */  j          .L80157FB8
    /* 1E31C 80157F14 00000000 */   nop
  .L80157F18:
    /* 1E320 80157F18 1000028E */  lw         $v0, 0x10($s0)
    /* 1E324 80157F1C 00000000 */  nop
    /* 1E328 80157F20 1D004014 */  bnez       $v0, .L80157F98
    /* 1E32C 80157F24 00000000 */   nop
    /* 1E330 80157F28 9F57050C */  jal        flush_cdstream
    /* 1E334 80157F2C 00000000 */   nop
    /* 1E338 80157F30 0800028E */  lw         $v0, 0x8($s0)
    /* 1E33C 80157F34 480E838F */  lw         $v1, %gp_rel(mdec_sectors_per_frame)($gp)
    /* 1E340 80157F38 00000000 */  nop
    /* 1E344 80157F3C 18004300 */  mult       $v0, $v1
    /* 1E348 80157F40 0C00068E */  lw         $a2, 0xC($s0)
    /* 1E34C 80157F44 12280000 */  mflo       $a1
    /* 1E350 80157F48 2330C200 */  subu       $a2, $a2, $v0
    /* 1E354 80157F4C 00000000 */  nop
    /* 1E358 80157F50 1800C300 */  mult       $a2, $v1
    /* 1E35C 80157F54 0000048E */  lw         $a0, 0x0($s0)
    /* 1E360 80157F58 12300000 */  mflo       $a2
    /* 1E364 80157F5C 7E59050C */  jal        open_cdstream
    /* 1E368 80157F60 00000000 */   nop
    /* 1E36C 80157F64 540D838F */  lw         $v1, %gp_rel(mdec_waiting_tail)($gp)
    /* 1E370 80157F68 00000000 */  nop
    /* 1E374 80157F6C 01006424 */  addiu      $a0, $v1, 0x1
    /* 1E378 80157F70 02008104 */  bgez       $a0, .L80157F7C
    /* 1E37C 80157F74 21108000 */   addu      $v0, $a0, $zero
    /* 1E380 80157F78 10006224 */  addiu      $v0, $v1, 0x10
  .L80157F7C:
    /* 1E384 80157F7C 03110200 */  sra        $v0, $v0, 4
    /* 1E388 80157F80 00110200 */  sll        $v0, $v0, 4
    /* 1E38C 80157F84 5C0D838F */  lw         $v1, %gp_rel(mdecs_waiting)($gp)
    /* 1E390 80157F88 23108200 */  subu       $v0, $a0, $v0
    /* 1E394 80157F8C 540D82AF */  sw         $v0, %gp_rel(mdec_waiting_tail)($gp)
    /* 1E398 80157F90 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1E39C 80157F94 5C0D83AF */  sw         $v1, %gp_rel(mdecs_waiting)($gp)
  .L80157F98:
    /* 1E3A0 80157F98 0C00028E */  lw         $v0, 0xC($s0)
    /* 1E3A4 80157F9C 0800038E */  lw         $v1, 0x8($s0)
    /* 1E3A8 80157FA0 340E82AF */  sw         $v0, %gp_rel(last_stream_frame)($gp)
    /* 1E3AC 80157FA4 0800028E */  lw         $v0, 0x8($s0)
    /* 1E3B0 80157FA8 001B0300 */  sll        $v1, $v1, 12
    /* 1E3B4 80157FAC 380E83AF */  sw         $v1, %gp_rel(mdec_framecount)($gp)
    /* 1E3B8 80157FB0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1E3BC 80157FB4 440E82AF */  sw         $v0, %gp_rel(mdec_last_frame)($gp)
  .L80157FB8:
    /* 1E3C0 80157FB8 0400048E */  lw         $a0, 0x4($s0)
    /* 1E3C4 80157FBC 580D838F */  lw         $v1, %gp_rel(mdecs_queued)($gp)
    /* 1E3C8 80157FC0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1E3CC 80157FC4 380D82AF */  sw         $v0, %gp_rel(mdec_streaming)($gp)
    /* 1E3D0 80157FC8 400E82AF */  sw         $v0, %gp_rel(mdec_stream_starting)($gp)
    /* 1E3D4 80157FCC FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1E3D8 80157FD0 3C0E84AF */  sw         $a0, %gp_rel(mdec_speed)($gp)
    /* 1E3DC 80157FD4 580D83AF */  sw         $v1, %gp_rel(mdecs_queued)($gp)
  .L80157FD8:
    /* 1E3E0 80157FD8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1E3E4 80157FDC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1E3E8 80157FE0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E3EC 80157FE4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1E3F0 80157FE8 0800E003 */  jr         $ra
    /* 1E3F4 80157FEC 00000000 */   nop
endlabel dequeue_animation
