.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_ADDMAG__FPC4TCmdi, 0x30

glabel On_ADDMAG__FPC4TCmdi
    /* 40024 80050024 2118A000 */  addu       $v1, $a1, $zero
    /* 40028 80050028 02008594 */  lhu        $a1, 0x2($a0)
    /* 4002C 8005002C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 40030 80050030 0101A22C */  sltiu      $v0, $a1, 0x101
    /* 40034 80050034 03004010 */  beqz       $v0, .L80050044
    /* 40038 80050038 1000BFAF */   sw        $ra, 0x10($sp)
    /* 4003C 8005003C AF97010C */  jal        ModifyPlrMag__Fii
    /* 40040 80050040 21206000 */   addu      $a0, $v1, $zero
  .L80050044:
    /* 40044 80050044 1000BF8F */  lw         $ra, 0x10($sp)
    /* 40048 80050048 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4004C 8005004C 0800E003 */  jr         $ra
    /* 40050 80050050 00000000 */   nop
endlabel On_ADDMAG__FPC4TCmdi
