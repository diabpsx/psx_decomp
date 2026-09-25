.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800aefd8, 0x28

glabel ___6Dialog_800aefd8
    /* 9EFD8 800AEFD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9EFDC 800AEFDC 0100A530 */  andi       $a1, $a1, 0x1
    /* 9EFE0 800AEFE0 0300A010 */  beqz       $a1, .L800AEFF0
    /* 9EFE4 800AEFE4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 9EFE8 800AEFE8 BE44000C */  jal        __builtin_delete
    /* 9EFEC 800AEFEC 00000000 */   nop
  .L800AEFF0:
    /* 9EFF0 800AEFF0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9EFF4 800AEFF4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9EFF8 800AEFF8 0800E003 */  jr         $ra
    /* 9EFFC 800AEFFC 00000000 */   nop
endlabel ___6Dialog_800aefd8
