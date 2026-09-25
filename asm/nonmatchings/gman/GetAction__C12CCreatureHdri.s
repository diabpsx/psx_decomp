.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetAction__C12CCreatureHdri, 0x90

glabel GetAction__C12CCreatureHdri
    /* 842EC 800942EC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 842F0 800942F0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 842F4 800942F4 21808000 */  addu       $s0, $a0, $zero
    /* 842F8 800942F8 2000B2AF */  sw         $s2, 0x20($sp)
    /* 842FC 800942FC 2190A000 */  addu       $s2, $a1, $zero
    /* 84300 80094300 2400BFAF */  sw         $ra, 0x24($sp)
    /* 84304 80094304 06004006 */  bltz       $s2, .L80094320
    /* 84308 80094308 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 8430C 8009430C 0000028E */  lw         $v0, 0x0($s0)
    /* 84310 80094310 00000000 */  nop
    /* 84314 80094314 2A105200 */  slt        $v0, $v0, $s2
    /* 84318 80094318 07004010 */  beqz       $v0, .L80094338
    /* 8431C 8009431C 04001126 */   addiu     $s1, $s0, 0x4
  .L80094320:
    /* 84320 80094320 21200000 */  addu       $a0, $zero, $zero
    /* 84324 80094324 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84328 80094328 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 8432C 8009432C A583000C */  jal        DBG_Error
    /* 84330 80094330 38060624 */   addiu     $a2, $zero, 0x638
    /* 84334 80094334 04001126 */  addiu      $s1, $s0, 0x4
  .L80094338:
    /* 84338 80094338 0800401A */  blez       $s2, .L8009435C
    /* 8433C 8009433C 21800000 */   addu      $s0, $zero, $zero
  .L80094340:
    /* 84340 80094340 6450020C */  jal        GetSize__C15CCreatureAction
    /* 84344 80094344 21202002 */   addu      $a0, $s1, $zero
    /* 84348 80094348 21882202 */  addu       $s1, $s1, $v0
    /* 8434C 8009434C 01001026 */  addiu      $s0, $s0, 0x1
    /* 84350 80094350 2A101202 */  slt        $v0, $s0, $s2
    /* 84354 80094354 FAFF4014 */  bnez       $v0, .L80094340
    /* 84358 80094358 00000000 */   nop
  .L8009435C:
    /* 8435C 8009435C 21102002 */  addu       $v0, $s1, $zero
    /* 84360 80094360 2400BF8F */  lw         $ra, 0x24($sp)
    /* 84364 80094364 2000B28F */  lw         $s2, 0x20($sp)
    /* 84368 80094368 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8436C 8009436C 1800B08F */  lw         $s0, 0x18($sp)
    /* 84370 80094370 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 84374 80094374 0800E003 */  jr         $ra
    /* 84378 80094378 00000000 */   nop
endlabel GetAction__C12CCreatureHdri
