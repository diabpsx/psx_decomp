.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_8004e9b4, 0x28

glabel ___6Dialog_8004e9b4
    /* 3E9B4 8004E9B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3E9B8 8004E9B8 0100A530 */  andi       $a1, $a1, 0x1
    /* 3E9BC 8004E9BC 0300A010 */  beqz       $a1, .L8004E9CC
    /* 3E9C0 8004E9C0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 3E9C4 8004E9C4 BE44000C */  jal        __builtin_delete
    /* 3E9C8 8004E9C8 00000000 */   nop
  .L8004E9CC:
    /* 3E9CC 8004E9CC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3E9D0 8004E9D0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3E9D4 8004E9D4 0800E003 */  jr         $ra
    /* 3E9D8 8004E9D8 00000000 */   nop
endlabel ___6Dialog_8004e9b4
