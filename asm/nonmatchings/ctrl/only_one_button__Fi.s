.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching only_one_button__Fi, 0x2C

glabel only_one_button__Fi
    /* 8CB7C 8009CB7C 01000324 */  addiu      $v1, $zero, 0x1
    /* 8CB80 8009CB80 21280000 */  addu       $a1, $zero, $zero
  .L8009CB84:
    /* 8CB84 8009CB84 24106400 */  and        $v0, $v1, $a0
    /* 8CB88 8009CB88 02004010 */  beqz       $v0, .L8009CB94
    /* 8CB8C 8009CB8C 00000000 */   nop
    /* 8CB90 8009CB90 0100A524 */  addiu      $a1, $a1, 0x1
  .L8009CB94:
    /* 8CB94 8009CB94 40180300 */  sll        $v1, $v1, 1
    /* 8CB98 8009CB98 FAFF6014 */  bnez       $v1, .L8009CB84
    /* 8CB9C 8009CB9C 00000000 */   nop
    /* 8CBA0 8009CBA0 0800E003 */  jr         $ra
    /* 8CBA4 8009CBA4 0200A228 */   slti      $v0, $a1, 0x2
endlabel only_one_button__Fi
