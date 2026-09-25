.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_ADDDEX__FPC4TCmdi, 0x30

glabel On_ADDDEX__FPC4TCmdi
    /* 40054 80050054 2118A000 */  addu       $v1, $a1, $zero
    /* 40058 80050058 02008594 */  lhu        $a1, 0x2($a0)
    /* 4005C 8005005C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 40060 80050060 0101A22C */  sltiu      $v0, $a1, 0x101
    /* 40064 80050064 03004010 */  beqz       $v0, .L80050074
    /* 40068 80050068 1000BFAF */   sw        $ra, 0x10($sp)
    /* 4006C 8005006C EA97010C */  jal        ModifyPlrDex__Fii
    /* 40070 80050070 21206000 */   addu      $a0, $v1, $zero
  .L80050074:
    /* 40074 80050074 1000BF8F */  lw         $ra, 0x10($sp)
    /* 40078 80050078 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4007C 8005007C 0800E003 */  jr         $ra
    /* 40080 80050080 00000000 */   nop
endlabel On_ADDDEX__FPC4TCmdi
