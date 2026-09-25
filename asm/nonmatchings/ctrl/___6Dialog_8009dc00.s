.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_8009dc00, 0x28

glabel ___6Dialog_8009dc00
    /* 8DC00 8009DC00 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8DC04 8009DC04 0100A530 */  andi       $a1, $a1, 0x1
    /* 8DC08 8009DC08 0300A010 */  beqz       $a1, .L8009DC18
    /* 8DC0C 8009DC0C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 8DC10 8009DC10 BE44000C */  jal        __builtin_delete
    /* 8DC14 8009DC14 00000000 */   nop
  .L8009DC18:
    /* 8DC18 8009DC18 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8DC1C 8009DC1C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8DC20 8009DC20 0800E003 */  jr         $ra
    /* 8DC24 8009DC24 00000000 */   nop
endlabel ___6Dialog_8009dc00
