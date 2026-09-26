.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching decode_mdec_stream, 0x1E0

glabel decode_mdec_stream
    /* 1E3F8 80157FF0 5C0D828F */  lw         $v0, %gp_rel(mdecs_waiting)($gp)
    /* 1E3FC 80157FF4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1E400 80157FF8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 1E404 80157FFC 21808000 */  addu       $s0, $a0, $zero
    /* 1E408 80158000 2400BFAF */  sw         $ra, 0x24($sp)
    /* 1E40C 80158004 07004010 */  beqz       $v0, .L80158024
    /* 1E410 80158008 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1E414 8015800C 8C0D828F */  lw         $v0, %gp_rel(stream_open)($gp)
    /* 1E418 80158010 00000000 */  nop
    /* 1E41C 80158014 03004014 */  bnez       $v0, .L80158024
    /* 1E420 80158018 00000000 */   nop
    /* 1E424 8015801C 555F050C */  jal        dequeue_stream
    /* 1E428 80158020 00000000 */   nop
  .L80158024:
    /* 1E42C 80158024 7058050C */  jal        cdstream_service
    /* 1E430 80158028 00000000 */   nop
    /* 1E434 8015802C 380D828F */  lw         $v0, %gp_rel(mdec_streaming)($gp)
    /* 1E438 80158030 00000000 */  nop
    /* 1E43C 80158034 61004010 */  beqz       $v0, .L801581BC
    /* 1E440 80158038 00000000 */   nop
    /* 1E444 8015803C 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1E448 80158040 00000000 */  nop
    /* 1E44C 80158044 5D004010 */  beqz       $v0, .L801581BC
    /* 1E450 80158048 00000000 */   nop
    /* 1E454 8015804C 400E828F */  lw         $v0, %gp_rel(mdec_stream_starting)($gp)
    /* 1E458 80158050 00000000 */  nop
    /* 1E45C 80158054 25004014 */  bnez       $v0, .L801580EC
    /* 1E460 80158058 1800A427 */   addiu     $a0, $sp, 0x18
    /* 1E464 8015805C 3C0E828F */  lw         $v0, %gp_rel(mdec_speed)($gp)
    /* 1E468 80158060 00000000 */  nop
    /* 1E46C 80158064 18005000 */  mult       $v0, $s0
    /* 1E470 80158068 380E838F */  lw         $v1, %gp_rel(mdec_framecount)($gp)
    /* 1E474 8015806C 440E828F */  lw         $v0, %gp_rel(mdec_last_frame)($gp)
    /* 1E478 80158070 12480000 */  mflo       $t1
    /* 1E47C 80158074 21186900 */  addu       $v1, $v1, $t1
    /* 1E480 80158078 03830300 */  sra        $s0, $v1, 12
    /* 1E484 8015807C 2A105000 */  slt        $v0, $v0, $s0
    /* 1E488 80158080 380E83AF */  sw         $v1, %gp_rel(mdec_framecount)($gp)
    /* 1E48C 80158084 1B004010 */  beqz       $v0, .L801580F4
    /* 1E490 80158088 00000000 */   nop
  .L8015808C:
    /* 1E494 8015808C AC58050C */  jal        cdstream_get_chunk
    /* 1E498 80158090 1C00A527 */   addiu     $a1, $sp, 0x1C
    /* 1E49C 80158094 380D828F */  lw         $v0, %gp_rel(mdec_streaming)($gp)
    /* 1E4A0 80158098 00000000 */  nop
    /* 1E4A4 8015809C 15004010 */  beqz       $v0, .L801580F4
    /* 1E4A8 801580A0 00000000 */   nop
    /* 1E4AC 801580A4 1C00A28F */  lw         $v0, 0x1C($sp)
    /* 1E4B0 801580A8 00000000 */  nop
    /* 1E4B4 801580AC 0800438C */  lw         $v1, 0x8($v0)
    /* 1E4B8 801580B0 340E828F */  lw         $v0, %gp_rel(last_stream_frame)($gp)
    /* 1E4BC 801580B4 00000000 */  nop
    /* 1E4C0 801580B8 0E006210 */  beq        $v1, $v0, .L801580F4
    /* 1E4C4 801580BC 2A107000 */   slt       $v0, $v1, $s0
    /* 1E4C8 801580C0 0C004010 */  beqz       $v0, .L801580F4
    /* 1E4CC 801580C4 00000000 */   nop
    /* 1E4D0 801580C8 740D828F */  lw         $v0, %gp_rel(stream_chunks_in)($gp)
    /* 1E4D4 801580CC 00000000 */  nop
    /* 1E4D8 801580D0 02004228 */  slti       $v0, $v0, 0x2
    /* 1E4DC 801580D4 07004014 */  bnez       $v0, .L801580F4
    /* 1E4E0 801580D8 00000000 */   nop
    /* 1E4E4 801580DC F858050C */  jal        cdstream_discard_chunk
    /* 1E4E8 801580E0 00000000 */   nop
    /* 1E4EC 801580E4 23600508 */  j          .L8015808C
    /* 1E4F0 801580E8 1800A427 */   addiu     $a0, $sp, 0x18
  .L801580EC:
    /* 1E4F4 801580EC AC58050C */  jal        cdstream_get_chunk
    /* 1E4F8 801580F0 1C00A527 */   addiu     $a1, $sp, 0x1C
  .L801580F4:
    /* 1E4FC 801580F4 1800A48F */  lw         $a0, 0x18($sp)
    /* 1E500 801580F8 00000000 */  nop
    /* 1E504 801580FC 2F008010 */  beqz       $a0, .L801581BC
    /* 1E508 80158100 00000000 */   nop
    /* 1E50C 80158104 1C0D828F */  lw         $v0, %gp_rel(mbuf)($gp)
    /* 1E510 80158108 1C00A38F */  lw         $v1, 0x1C($sp)
    /* 1E514 8015810C C0100200 */  sll        $v0, $v0, 3
    /* 1E518 80158110 0800688C */  lw         $t0, 0x8($v1)
    /* 1E51C 80158114 1580013C */  lui        $at, %hi(mdc_buf)
    /* 1E520 80158118 21082200 */  addu       $at, $at, $v0
    /* 1E524 8015811C E4552584 */  lh         $a1, %lo(mdc_buf)($at)
    /* 1E528 80158120 1580013C */  lui        $at, %hi(mdc_buf + 0x2)
    /* 1E52C 80158124 21082200 */  addu       $at, $at, $v0
    /* 1E530 80158128 E6552684 */  lh         $a2, %lo(mdc_buf + 0x2)($at)
    /* 1E534 8015812C 10006784 */  lh         $a3, 0x10($v1)
    /* 1E538 80158130 12006284 */  lh         $v0, 0x12($v1)
    /* 1E53C 80158134 400E80AF */  sw         $zero, %gp_rel(mdec_stream_starting)($gp)
    /* 1E540 80158138 440E88AF */  sw         $t0, %gp_rel(mdec_last_frame)($gp)
    /* 1E544 8015813C D559050C */  jal        start_mdec_decode
    /* 1E548 80158140 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1E54C 80158144 1800A48F */  lw         $a0, 0x18($sp)
    /* 1E550 80158148 1C00A58F */  lw         $a1, 0x1C($sp)
    /* 1E554 8015814C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1E558 80158150 340D82AF */  sw         $v0, %gp_rel(frame_decoded)($gp)
    /* 1E55C 80158154 300D82AF */  sw         $v0, %gp_rel(do_brightness)($gp)
    /* 1E560 80158158 1C0D828F */  lw         $v0, %gp_rel(mbuf)($gp)
    /* 1E564 8015815C 003F8424 */  addiu      $a0, $a0, 0x3F00
    /* 1E568 80158160 01004238 */  xori       $v0, $v0, 0x1
    /* 1E56C 80158164 1C0D82AF */  sw         $v0, %gp_rel(mbuf)($gp)
    /* 1E570 80158168 405E050C */  jal        play_mdec_audio
    /* 1E574 8015816C 0001A524 */   addiu     $a1, $a1, 0x100
    /* 1E578 80158170 F858050C */  jal        cdstream_discard_chunk
    /* 1E57C 80158174 00000000 */   nop
    /* 1E580 80158178 1C00A28F */  lw         $v0, 0x1C($sp)
    /* 1E584 8015817C 00000000 */  nop
    /* 1E588 80158180 0800438C */  lw         $v1, 0x8($v0)
    /* 1E58C 80158184 340E828F */  lw         $v0, %gp_rel(last_stream_frame)($gp)
    /* 1E590 80158188 00000000 */  nop
    /* 1E594 8015818C 0B006214 */  bne        $v1, $v0, .L801581BC
    /* 1E598 80158190 00000000 */   nop
    /* 1E59C 80158194 580D828F */  lw         $v0, %gp_rel(mdecs_queued)($gp)
    /* 1E5A0 80158198 00000000 */  nop
    /* 1E5A4 8015819C 05004010 */  beqz       $v0, .L801581B4
    /* 1E5A8 801581A0 00000000 */   nop
    /* 1E5AC 801581A4 905F050C */  jal        dequeue_animation
    /* 1E5B0 801581A8 00000000 */   nop
    /* 1E5B4 801581AC 6F600508 */  j          .L801581BC
    /* 1E5B8 801581B0 00000000 */   nop
  .L801581B4:
    /* 1E5BC 801581B4 445F050C */  jal        stop_mdec_stream
    /* 1E5C0 801581B8 00000000 */   nop
  .L801581BC:
    /* 1E5C4 801581BC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 1E5C8 801581C0 2000B08F */  lw         $s0, 0x20($sp)
    /* 1E5CC 801581C4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1E5D0 801581C8 0800E003 */  jr         $ra
    /* 1E5D4 801581CC 00000000 */   nop
endlabel decode_mdec_stream
