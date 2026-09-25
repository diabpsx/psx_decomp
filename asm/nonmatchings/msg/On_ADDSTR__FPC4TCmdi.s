.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_ADDSTR__FPC4TCmdi, 0x30

glabel On_ADDSTR__FPC4TCmdi
    /* 3FFF4 8004FFF4 2118A000 */  addu       $v1, $a1, $zero
    /* 3FFF8 8004FFF8 02008594 */  lhu        $a1, 0x2($a0)
    /* 3FFFC 8004FFFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 40000 80050000 0101A22C */  sltiu      $v0, $a1, 0x101
    /* 40004 80050004 03004010 */  beqz       $v0, .L80050014
    /* 40008 80050008 1000BFAF */   sw        $ra, 0x10($sp)
    /* 4000C 8005000C 6897010C */  jal        ModifyPlrStr__Fii
    /* 40010 80050010 21206000 */   addu      $a0, $v1, $zero
  .L80050014:
    /* 40014 80050014 1000BF8F */  lw         $ra, 0x10($sp)
    /* 40018 80050018 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4001C 8005001C 0800E003 */  jr         $ra
    /* 40020 80050020 00000000 */   nop
endlabel On_ADDSTR__FPC4TCmdi
