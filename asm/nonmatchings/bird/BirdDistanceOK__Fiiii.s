.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BirdDistanceOK__Fiiii, 0x58

glabel BirdDistanceOK__Fiiii
    /* 9B6E4 800AB6E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9B6E8 800AB6E8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9B6EC 800AB6EC 2188A000 */  addu       $s1, $a1, $zero
    /* 9B6F0 800AB6F0 23208600 */  subu       $a0, $a0, $a2
    /* 9B6F4 800AB6F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9B6F8 800AB6F8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9B6FC 800AB6FC 6D41000C */  jal        abs
    /* 9B700 800AB700 2180E000 */   addu      $s0, $a3, $zero
    /* 9B704 800AB704 23203002 */  subu       $a0, $s1, $s0
    /* 9B708 800AB708 6D41000C */  jal        abs
    /* 9B70C 800AB70C 21804000 */   addu      $s0, $v0, $zero
    /* 9B710 800AB710 21184000 */  addu       $v1, $v0, $zero
    /* 9B714 800AB714 1900102A */  slti       $s0, $s0, 0x19
    /* 9B718 800AB718 02000012 */  beqz       $s0, .L800AB724
    /* 9B71C 800AB71C 21100000 */   addu      $v0, $zero, $zero
    /* 9B720 800AB720 19006228 */  slti       $v0, $v1, 0x19
  .L800AB724:
    /* 9B724 800AB724 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9B728 800AB728 1400B18F */  lw         $s1, 0x14($sp)
    /* 9B72C 800AB72C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9B730 800AB730 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9B734 800AB734 0800E003 */  jr         $ra
    /* 9B738 800AB738 00000000 */   nop
endlabel BirdDistanceOK__Fiiii
