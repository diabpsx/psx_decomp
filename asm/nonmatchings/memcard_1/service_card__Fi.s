.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching service_card__Fi, 0x148

glabel service_card__Fi
    /* 98A8 801434A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 98AC 801434A4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 98B0 801434A8 21808000 */  addu       $s0, $a0, $zero
    /* 98B4 801434AC 80101000 */  sll        $v0, $s0, 2
    /* 98B8 801434B0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 98BC 801434B4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 98C0 801434B8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 98C4 801434BC 1280013C */  lui        $at, %hi(card_status)
    /* 98C8 801434C0 21082200 */  addu       $at, $at, $v0
    /* 98CC 801434C4 DCB3258C */  lw         $a1, %lo(card_status)($at)
    /* 98D0 801434C8 1280013C */  lui        $at, %hi(last_card_status)
    /* 98D4 801434CC 21082200 */  addu       $at, $at, $v0
    /* 98D8 801434D0 FCB3248C */  lw         $a0, %lo(last_card_status)($at)
    /* 98DC 801434D4 0500A32C */  sltiu      $v1, $a1, 0x5
    /* 98E0 801434D8 29006010 */  beqz       $v1, .L80143580
    /* 98E4 801434DC 80100500 */   sll       $v0, $a1, 2
    /* 98E8 801434E0 1480013C */  lui        $at, %hi(jtbl_801434F8)
    /* 98EC 801434E4 21082200 */  addu       $at, $at, $v0
    /* 98F0 801434E8 F834228C */  lw         $v0, %lo(jtbl_801434F8)($at)
    /* 98F4 801434EC 00000000 */  nop
    /* 98F8 801434F0 08004000 */  jr         $v0
    /* 98FC 801434F4 00000000 */   nop
  jtbl_801434F8:
    /* 9900 801434F8 0C351480 */  lb         $s4, 0x350C($zero)
    /* 9904 801434FC 80351480 */  lb         $s4, 0x3580($zero)
    /* 9908 80143500 30351480 */  lb         $s4, 0x3530($zero)
    /* 990C 80143504 6C351480 */  lb         $s4, 0x356C($zero)
    /* 9910 80143508 80351480 */  lb         $s4, 0x3580($zero)
    /* 9914 8014350C FFFF8224 */  addiu      $v0, $a0, -0x1
    /* 9918 80143510 0200422C */  sltiu      $v0, $v0, 0x2
    /* 991C 80143514 16004014 */  bnez       $v0, .L80143570
    /* 9920 80143518 80181000 */   sll       $v1, $s0, 2
    /* 9924 8014351C 04000224 */  addiu      $v0, $zero, 0x4
    /* 9928 80143520 17008214 */  bne        $a0, $v0, .L80143580
    /* 992C 80143524 01000224 */   addiu     $v0, $zero, 0x1
    /* 9930 80143528 5D0D0508 */  j          .L80143574
    /* 9934 8014352C 00000000 */   nop
    /* 9938 80143530 13008014 */  bnez       $a0, .L80143580
    /* 993C 80143534 00000000 */   nop
    /* 9940 80143538 1280023C */  lui        $v0, %hi(mem_card_event_handler)
    /* 9944 8014353C 74B1428C */  lw         $v0, %lo(mem_card_event_handler)($v0)
    /* 9948 80143540 00000000 */  nop
    /* 994C 80143544 03004010 */  beqz       $v0, .L80143554
    /* 9950 80143548 08000424 */   addiu     $a0, $zero, 0x8
    /* 9954 8014354C 09F84000 */  jalr       $v0
    /* 9958 80143550 21280002 */   addu      $a1, $s0, $zero
  .L80143554:
    /* 995C 80143554 80101000 */  sll        $v0, $s0, 2
    /* 9960 80143558 1280013C */  lui        $at, %hi(card_usable)
    /* 9964 8014355C 21082200 */  addu       $at, $at, $v0
    /* 9968 80143560 E4B320AC */  sw         $zero, %lo(card_usable)($at)
    /* 996C 80143564 600D0508 */  j          .L80143580
    /* 9970 80143568 00000000 */   nop
    /* 9974 8014356C 80181000 */  sll        $v1, $s0, 2
  .L80143570:
    /* 9978 80143570 01000224 */  addiu      $v0, $zero, 0x1
  .L80143574:
    /* 997C 80143574 1280013C */  lui        $at, %hi(new_card_flag)
    /* 9980 80143578 21082300 */  addu       $at, $at, $v1
    /* 9984 8014357C 10B222AC */  sw         $v0, %lo(new_card_flag)($at)
  .L80143580:
    /* 9988 80143580 1280023C */  lui        $v0, %hi(card_dirty)
    /* 998C 80143584 E8B14224 */  addiu      $v0, $v0, %lo(card_dirty)
    /* 9990 80143588 80881000 */  sll        $s1, $s0, 2
    /* 9994 8014358C 21902202 */  addu       $s2, $s1, $v0
    /* 9998 80143590 0000428E */  lw         $v0, 0x0($s2)
    /* 999C 80143594 00000000 */  nop
    /* 99A0 80143598 0C004010 */  beqz       $v0, .L801435CC
    /* 99A4 8014359C 00000000 */   nop
    /* 99A8 801435A0 FD0A050C */  jal        test_card_format__Fi
    /* 99AC 801435A4 21200002 */   addu      $a0, $s0, $zero
    /* 99B0 801435A8 1280013C */  lui        $at, %hi(card_usable)
    /* 99B4 801435AC 21083100 */  addu       $at, $at, $s1
    /* 99B8 801435B0 E4B322AC */  sw         $v0, %lo(card_usable)($at)
    /* 99BC 801435B4 01000224 */  addiu      $v0, $zero, 0x1
    /* 99C0 801435B8 5B0C82A3 */  sb         $v0, %gp_rel(dirflag)($gp)
    /* 99C4 801435BC 660A050C */  jal        read_card_directory__Fi
    /* 99C8 801435C0 21200002 */   addu      $a0, $s0, $zero
    /* 99CC 801435C4 5B0C80A3 */  sb         $zero, %gp_rel(dirflag)($gp)
    /* 99D0 801435C8 000040AE */  sw         $zero, 0x0($s2)
  .L801435CC:
    /* 99D4 801435CC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 99D8 801435D0 1800B28F */  lw         $s2, 0x18($sp)
    /* 99DC 801435D4 1400B18F */  lw         $s1, 0x14($sp)
    /* 99E0 801435D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 99E4 801435DC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 99E8 801435E0 0800E003 */  jr         $ra
    /* 99EC 801435E4 00000000 */   nop
endlabel service_card__Fi
