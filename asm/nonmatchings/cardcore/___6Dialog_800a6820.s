.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800a6820, 0x28

glabel ___6Dialog_800a6820
    /* 96820 800A6820 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 96824 800A6824 0100A530 */  andi       $a1, $a1, 0x1
    /* 96828 800A6828 0300A010 */  beqz       $a1, .L800A6838
    /* 9682C 800A682C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 96830 800A6830 BE44000C */  jal        __builtin_delete
    /* 96834 800A6834 00000000 */   nop
  .L800A6838:
    /* 96838 800A6838 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9683C 800A683C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 96840 800A6840 0800E003 */  jr         $ra
    /* 96844 800A6844 00000000 */   nop
endlabel ___6Dialog_800a6820
