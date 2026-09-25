.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPlayer__7CPlayeri_8007d560, 0x50

glabel GetPlayer__7CPlayeri_8007d560
    /* 6D560 8007D560 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6D564 8007D564 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6D568 8007D568 21808000 */  addu       $s0, $a0, $zero
    /* 6D56C 8007D56C 0200022E */  sltiu      $v0, $s0, 0x2
    /* 6D570 8007D570 06004014 */  bnez       $v0, .L8007D58C
    /* 6D574 8007D574 1400BFAF */   sw        $ra, 0x14($sp)
    /* 6D578 8007D578 21200000 */  addu       $a0, $zero, $zero
    /* 6D57C 8007D57C 1280053C */  lui        $a1, %hi(D_80118CA8)
    /* 6D580 8007D580 A88CA524 */  addiu      $a1, $a1, %lo(D_80118CA8)
    /* 6D584 8007D584 A583000C */  jal        DBG_Error
    /* 6D588 8007D588 41000624 */   addiu     $a2, $zero, 0x41
  .L8007D58C:
    /* 6D58C 8007D58C 80101000 */  sll        $v0, $s0, 2
    /* 6D590 8007D590 1280013C */  lui        $at, %hi(_7CPlayer_PActiveArray)
    /* 6D594 8007D594 21082200 */  addu       $at, $at, $v0
    /* 6D598 8007D598 50AD228C */  lw         $v0, %lo(_7CPlayer_PActiveArray)($at)
    /* 6D59C 8007D59C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6D5A0 8007D5A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6D5A4 8007D5A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6D5A8 8007D5A8 0800E003 */  jr         $ra
    /* 6D5AC 8007D5AC 00000000 */   nop
endlabel GetPlayer__7CPlayeri_8007d560
