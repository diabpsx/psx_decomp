.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800743c8, 0x28

glabel ___6Dialog_800743c8
    /* 643C8 800743C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 643CC 800743CC 0100A530 */  andi       $a1, $a1, 0x1
    /* 643D0 800743D0 0300A010 */  beqz       $a1, .L800743E0
    /* 643D4 800743D4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 643D8 800743D8 BE44000C */  jal        __builtin_delete
    /* 643DC 800743DC 00000000 */   nop
  .L800743E0:
    /* 643E0 800743E0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 643E4 800743E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 643E8 800743E8 0800E003 */  jr         $ra
    /* 643EC 800743EC 00000000 */   nop
endlabel ___6Dialog_800743c8
