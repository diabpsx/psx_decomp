.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ping_card__Fi, 0x94

glabel ping_card__Fi
    /* 95340 800A5340 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 95344 800A5344 1000B0AF */  sw         $s0, 0x10($sp)
    /* 95348 800A5348 21808000 */  addu       $s0, $a0, $zero
    /* 9534C 800A534C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 95350 800A5350 EF69000C */  jal        _card_info
    /* 95354 800A5354 00211000 */   sll       $a0, $s0, 4
    /* 95358 800A5358 FB69000C */  jal        _card_wait
    /* 9535C 800A535C 21200002 */   addu      $a0, $s0, $zero
    /* 95360 800A5360 480A848F */  lw         $a0, %gp_rel(card_ev0)($gp)
    /* 95364 800A5364 5B46000C */  jal        TestEvent
    /* 95368 800A5368 01001024 */   addiu     $s0, $zero, 0x1
    /* 9536C 800A536C 14005010 */  beq        $v0, $s0, .L800A53C0
    /* 95370 800A5370 21100000 */   addu      $v0, $zero, $zero
    /* 95374 800A5374 4C0A848F */  lw         $a0, %gp_rel(card_ev1)($gp)
    /* 95378 800A5378 5B46000C */  jal        TestEvent
    /* 9537C 800A537C 00000000 */   nop
    /* 95380 800A5380 0F005010 */  beq        $v0, $s0, .L800A53C0
    /* 95384 800A5384 01000224 */   addiu     $v0, $zero, 0x1
    /* 95388 800A5388 500A848F */  lw         $a0, %gp_rel(card_ev2)($gp)
    /* 9538C 800A538C 5B46000C */  jal        TestEvent
    /* 95390 800A5390 00000000 */   nop
    /* 95394 800A5394 03005014 */  bne        $v0, $s0, .L800A53A4
    /* 95398 800A5398 00000000 */   nop
    /* 9539C 800A539C F0940208 */  j          .L800A53C0
    /* 953A0 800A53A0 02000224 */   addiu     $v0, $zero, 0x2
  .L800A53A4:
    /* 953A4 800A53A4 540A848F */  lw         $a0, %gp_rel(card_ev3)($gp)
    /* 953A8 800A53A8 5B46000C */  jal        TestEvent
    /* 953AC 800A53AC 00000000 */   nop
    /* 953B0 800A53B0 21184000 */  addu       $v1, $v0, $zero
    /* 953B4 800A53B4 02007010 */  beq        $v1, $s0, .L800A53C0
    /* 953B8 800A53B8 03000224 */   addiu     $v0, $zero, 0x3
    /* 953BC 800A53BC 04000224 */  addiu      $v0, $zero, 0x4
  .L800A53C0:
    /* 953C0 800A53C0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 953C4 800A53C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 953C8 800A53C8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 953CC 800A53CC 0800E003 */  jr         $ra
    /* 953D0 800A53D0 00000000 */   nop
endlabel ping_card__Fi
