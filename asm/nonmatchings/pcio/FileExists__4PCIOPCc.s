.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FileExists__4PCIOPCc, 0x44

glabel FileExists__4PCIOPCc
    /* 76174 80086174 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 76178 80086178 1000BFAF */  sw         $ra, 0x10($sp)
    /* 7617C 8008617C 2120A000 */  addu       $a0, $a1, $zero
    /* 76180 80086180 21280000 */  addu       $a1, $zero, $zero
    /* 76184 80086184 AB43000C */  jal        PCopen
    /* 76188 80086188 21300000 */   addu      $a2, $zero, $zero
    /* 7618C 8008618C 21204000 */  addu       $a0, $v0, $zero
    /* 76190 80086190 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 76194 80086194 04008210 */  beq        $a0, $v0, .L800861A8
    /* 76198 80086198 21100000 */   addu      $v0, $zero, $zero
    /* 7619C 8008619C B343000C */  jal        PCclose
    /* 761A0 800861A0 00000000 */   nop
    /* 761A4 800861A4 01000224 */  addiu      $v0, $zero, 0x1
  .L800861A8:
    /* 761A8 800861A8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 761AC 800861AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 761B0 800861B0 0800E003 */  jr         $ra
    /* 761B4 800861B4 00000000 */   nop
endlabel FileExists__4PCIOPCc
