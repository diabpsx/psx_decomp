.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800ab5e4, 0x28

glabel ___6Dialog_800ab5e4
    /* 9B5E4 800AB5E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9B5E8 800AB5E8 0100A530 */  andi       $a1, $a1, 0x1
    /* 9B5EC 800AB5EC 0300A010 */  beqz       $a1, .L800AB5FC
    /* 9B5F0 800AB5F0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 9B5F4 800AB5F4 BE44000C */  jal        __builtin_delete
    /* 9B5F8 800AB5F8 00000000 */   nop
  .L800AB5FC:
    /* 9B5FC 800AB5FC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9B600 800AB600 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9B604 800AB604 0800E003 */  jr         $ra
    /* 9B608 800AB608 00000000 */   nop
endlabel ___6Dialog_800ab5e4
