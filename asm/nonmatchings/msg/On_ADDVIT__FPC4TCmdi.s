.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_ADDVIT__FPC4TCmdi, 0x30

glabel On_ADDVIT__FPC4TCmdi
    /* 40084 80050084 2118A000 */  addu       $v1, $a1, $zero
    /* 40088 80050088 02008594 */  lhu        $a1, 0x2($a0)
    /* 4008C 8005008C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 40090 80050090 0101A22C */  sltiu      $v0, $a1, 0x101
    /* 40094 80050094 03004010 */  beqz       $v0, .L800500A4
    /* 40098 80050098 1000BFAF */   sw        $ra, 0x10($sp)
    /* 4009C 8005009C 2398010C */  jal        ModifyPlrVit__Fii
    /* 400A0 800500A0 21206000 */   addu      $a0, $v1, $zero
  .L800500A4:
    /* 400A4 800500A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 400A8 800500A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 400AC 800500AC 0800E003 */  jr         $ra
    /* 400B0 800500B0 00000000 */   nop
endlabel On_ADDVIT__FPC4TCmdi
