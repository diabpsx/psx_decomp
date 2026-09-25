.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Crunch__FPUcT0, 0x74

glabel Crunch__FPUcT0
    /* 9DA34 800ADA34 21308000 */  addu       $a2, $a0, $zero
    /* 9DA38 800ADA38 2140A000 */  addu       $t0, $a1, $zero
    /* 9DA3C 800ADA3C 21480000 */  addu       $t1, $zero, $zero
  .L800ADA40:
    /* 9DA40 800ADA40 0C002229 */  slti       $v0, $t1, 0xC
    /* 9DA44 800ADA44 16004010 */  beqz       $v0, .L800ADAA0
    /* 9DA48 800ADA48 21380000 */   addu      $a3, $zero, $zero
  .L800ADA4C:
    /* 9DA4C 800ADA4C 0000C290 */  lbu        $v0, 0x0($a2)
    /* 9DA50 800ADA50 0100C624 */  addiu      $a2, $a2, 0x1
    /* 9DA54 800ADA54 0000C390 */  lbu        $v1, 0x0($a2)
    /* 9DA58 800ADA58 0100C624 */  addiu      $a2, $a2, 0x1
    /* 9DA5C 800ADA5C 0000C490 */  lbu        $a0, 0x0($a2)
    /* 9DA60 800ADA60 0100C624 */  addiu      $a2, $a2, 0x1
    /* 9DA64 800ADA64 0000C590 */  lbu        $a1, 0x0($a2)
    /* 9DA68 800ADA68 0100C624 */  addiu      $a2, $a2, 0x1
    /* 9DA6C 800ADA6C 0100E724 */  addiu      $a3, $a3, 0x1
    /* 9DA70 800ADA70 00190300 */  sll        $v1, $v1, 4
    /* 9DA74 800ADA74 25104300 */  or         $v0, $v0, $v1
    /* 9DA78 800ADA78 00220400 */  sll        $a0, $a0, 8
    /* 9DA7C 800ADA7C 25104400 */  or         $v0, $v0, $a0
    /* 9DA80 800ADA80 002B0500 */  sll        $a1, $a1, 12
    /* 9DA84 800ADA84 25104500 */  or         $v0, $v0, $a1
    /* 9DA88 800ADA88 000002A5 */  sh         $v0, 0x0($t0)
    /* 9DA8C 800ADA8C 0300E228 */  slti       $v0, $a3, 0x3
    /* 9DA90 800ADA90 EEFF4014 */  bnez       $v0, .L800ADA4C
    /* 9DA94 800ADA94 02000825 */   addiu     $t0, $t0, 0x2
    /* 9DA98 800ADA98 90B60208 */  j          .L800ADA40
    /* 9DA9C 800ADA9C 01002925 */   addiu     $t1, $t1, 0x1
  .L800ADAA0:
    /* 9DAA0 800ADAA0 0800E003 */  jr         $ra
    /* 9DAA4 800ADAA4 00000000 */   nop
endlabel Crunch__FPUcT0
