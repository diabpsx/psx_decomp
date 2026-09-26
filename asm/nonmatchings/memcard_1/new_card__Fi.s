.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching new_card__Fi, 0x94

glabel new_card__Fi
    /* 9814 8014340C 1280023C */  lui        $v0, %hi(mem_card_event_handler)
    /* 9818 80143410 74B1428C */  lw         $v0, %lo(mem_card_event_handler)($v0)
    /* 981C 80143414 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9820 80143418 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9824 8014341C 21808000 */  addu       $s0, $a0, $zero
    /* 9828 80143420 04004010 */  beqz       $v0, .L80143434
    /* 982C 80143424 1400BFAF */   sw        $ra, 0x14($sp)
    /* 9830 80143428 01000424 */  addiu      $a0, $zero, 0x1
    /* 9834 8014342C 09F84000 */  jalr       $v0
    /* 9838 80143430 21280002 */   addu      $a1, $s0, $zero
  .L80143434:
    /* 983C 80143434 5346000C */  jal        _bu_init
    /* 9840 80143438 00000000 */   nop
    /* 9844 8014343C FF69000C */  jal        _card_clear
    /* 9848 80143440 00211000 */   sll       $a0, $s0, 4
    /* 984C 80143444 FB69000C */  jal        _card_wait
    /* 9850 80143448 21200002 */   addu      $a0, $s0, $zero
    /* 9854 8014344C C495020C */  jal        test_hw_event__Fv
    /* 9858 80143450 00000000 */   nop
    /* 985C 80143454 0B004014 */  bnez       $v0, .L80143484
    /* 9860 80143458 00000000 */   nop
    /* 9864 8014345C FD0A050C */  jal        test_card_format__Fi
    /* 9868 80143460 21200002 */   addu      $a0, $s0, $zero
    /* 986C 80143464 80181000 */  sll        $v1, $s0, 2
    /* 9870 80143468 1280013C */  lui        $at, %hi(card_usable)
    /* 9874 8014346C 21082300 */  addu       $at, $at, $v1
    /* 9878 80143470 E4B322AC */  sw         $v0, %lo(card_usable)($at)
    /* 987C 80143474 660A050C */  jal        read_card_directory__Fi
    /* 9880 80143478 21200002 */   addu      $a0, $s0, $zero
    /* 9884 8014347C 230D0508 */  j          .L8014348C
    /* 9888 80143480 00000000 */   nop
  .L80143484:
    /* 988C 80143484 A495020C */  jal        card_removed__Fi
    /* 9890 80143488 21200002 */   addu      $a0, $s0, $zero
  .L8014348C:
    /* 9894 8014348C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9898 80143490 1000B08F */  lw         $s0, 0x10($sp)
    /* 989C 80143494 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 98A0 80143498 0800E003 */  jr         $ra
    /* 98A4 8014349C 00000000 */   nop
endlabel new_card__Fi
