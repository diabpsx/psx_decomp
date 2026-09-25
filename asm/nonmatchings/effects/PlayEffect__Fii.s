.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlayEffect__Fii, 0x148

glabel PlayEffect__Fii
    /* 2D528 8003D528 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2D52C 8003D52C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2D530 8003D530 21808000 */  addu       $s0, $a0, $zero
    /* 2D534 8003D534 2000B2AF */  sw         $s2, 0x20($sp)
    /* 2D538 8003D538 2190A000 */  addu       $s2, $a1, $zero
    /* 2D53C 8003D53C 02000424 */  addiu      $a0, $zero, 0x2
    /* 2D540 8003D540 2400BFAF */  sw         $ra, 0x24($sp)
    /* 2D544 8003D544 C9F6000C */  jal        ENG_random__Fl
    /* 2D548 8003D548 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 2D54C 8003D54C 1280023C */  lui        $v0, %hi(myplr)
    /* 2D550 8003D550 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 2D554 8003D554 00000000 */  nop
    /* 2D558 8003D558 40180200 */  sll        $v1, $v0, 1
    /* 2D55C 8003D55C 21186200 */  addu       $v1, $v1, $v0
    /* 2D560 8003D560 80180300 */  sll        $v1, $v1, 2
    /* 2D564 8003D564 21186200 */  addu       $v1, $v1, $v0
    /* 2D568 8003D568 00190300 */  sll        $v1, $v1, 4
    /* 2D56C 8003D56C 23186200 */  subu       $v1, $v1, $v0
    /* 2D570 8003D570 80180300 */  sll        $v1, $v1, 2
    /* 2D574 8003D574 21186200 */  addu       $v1, $v1, $v0
    /* 2D578 8003D578 C0180300 */  sll        $v1, $v1, 3
    /* 2D57C 8003D57C 0E80013C */  lui        $at, %hi(plr + 0x19E2)
    /* 2D580 8003D580 21082300 */  addu       $at, $at, $v1
    /* 2D584 8003D584 1ABF2290 */  lbu        $v0, %lo(plr + 0x19E2)($at)
    /* 2D588 8003D588 00000000 */  nop
    /* 2D58C 8003D58C 31004014 */  bnez       $v0, .L8003D654
    /* 2D590 8003D590 00000000 */   nop
    /* 2D594 8003D594 1280023C */  lui        $v0, %hi(gbSndInited)
    /* 2D598 8003D598 99BB4290 */  lbu        $v0, %lo(gbSndInited)($v0)
    /* 2D59C 8003D59C 00000000 */  nop
    /* 2D5A0 8003D5A0 2C004010 */  beqz       $v0, .L8003D654
    /* 2D5A4 8003D5A4 00000000 */   nop
    /* 2D5A8 8003D5A8 1280023C */  lui        $v0, %hi(gbBufferMsgs)
    /* 2D5AC 8003D5AC 7EB94290 */  lbu        $v0, %lo(gbBufferMsgs)($v0)
    /* 2D5B0 8003D5B0 00000000 */  nop
    /* 2D5B4 8003D5B4 27004014 */  bnez       $v0, .L8003D654
    /* 2D5B8 8003D5B8 40101000 */   sll       $v0, $s0, 1
    /* 2D5BC 8003D5BC 21105000 */  addu       $v0, $v0, $s0
    /* 2D5C0 8003D5C0 80100200 */  sll        $v0, $v0, 2
    /* 2D5C4 8003D5C4 21105000 */  addu       $v0, $v0, $s0
    /* 2D5C8 8003D5C8 C0800200 */  sll        $s0, $v0, 3
    /* 2D5CC 8003D5CC 1080013C */  lui        $at, %hi(monster + 0x32)
    /* 2D5D0 8003D5D0 21083000 */  addu       $at, $at, $s0
    /* 2D5D4 8003D5D4 C6532380 */  lb         $v1, %lo(monster + 0x32)($at)
    /* 2D5D8 8003D5D8 00000000 */  nop
    /* 2D5DC 8003D5DC C0100300 */  sll        $v0, $v1, 3
    /* 2D5E0 8003D5E0 23104300 */  subu       $v0, $v0, $v1
    /* 2D5E4 8003D5E4 80880200 */  sll        $s1, $v0, 2
    /* 2D5E8 8003D5E8 1180013C */  lui        $at, %hi(Monsters + 0x10)
    /* 2D5EC 8003D5EC 21083100 */  addu       $at, $at, $s1
    /* 2D5F0 8003D5F0 CCA32494 */  lhu        $a0, %lo(Monsters + 0x10)($at)
    /* 2D5F4 8003D5F4 DCDF010C */  jal        snd_playing__Fi
    /* 2D5F8 8003D5F8 21209200 */   addu      $a0, $a0, $s2
    /* 2D5FC 8003D5FC FF004230 */  andi       $v0, $v0, 0xFF
    /* 2D600 8003D600 14004014 */  bnez       $v0, .L8003D654
    /* 2D604 8003D604 1000A627 */   addiu     $a2, $sp, 0x10
    /* 2D608 8003D608 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 2D60C 8003D60C 21083000 */  addu       $at, $at, $s0
    /* 2D610 8003D610 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 2D614 8003D614 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 2D618 8003D618 21083000 */  addu       $at, $at, $s0
    /* 2D61C 8003D61C C9532580 */  lb         $a1, %lo(monster + 0x35)($at)
    /* 2D620 8003D620 77F4000C */  jal        calc_snd_position__FiiPlT2
    /* 2D624 8003D624 1400A727 */   addiu     $a3, $sp, 0x14
    /* 2D628 8003D628 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2D62C 8003D62C 09004010 */  beqz       $v0, .L8003D654
    /* 2D630 8003D630 00000000 */   nop
    /* 2D634 8003D634 1000A58F */  lw         $a1, 0x10($sp)
    /* 2D638 8003D638 1180013C */  lui        $at, %hi(Monsters + 0x10)
    /* 2D63C 8003D63C 21083100 */  addu       $at, $at, $s1
    /* 2D640 8003D640 CCA32494 */  lhu        $a0, %lo(Monsters + 0x10)($at)
    /* 2D644 8003D644 1400A68F */  lw         $a2, 0x14($sp)
    /* 2D648 8003D648 21209200 */  addu       $a0, $a0, $s2
    /* 2D64C 8003D64C 68DF010C */  jal        snd_play_msnd__FUsll
    /* 2D650 8003D650 FFFF8430 */   andi      $a0, $a0, 0xFFFF
  .L8003D654:
    /* 2D654 8003D654 2400BF8F */  lw         $ra, 0x24($sp)
    /* 2D658 8003D658 2000B28F */  lw         $s2, 0x20($sp)
    /* 2D65C 8003D65C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2D660 8003D660 1800B08F */  lw         $s0, 0x18($sp)
    /* 2D664 8003D664 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2D668 8003D668 0800E003 */  jr         $ra
    /* 2D66C 8003D66C 00000000 */   nop
endlabel PlayEffect__Fii
