.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800a4f34, 0x28

glabel ___6Dialog_800a4f34
    /* 94F34 800A4F34 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94F38 800A4F38 0100A530 */  andi       $a1, $a1, 0x1
    /* 94F3C 800A4F3C 0300A010 */  beqz       $a1, .L800A4F4C
    /* 94F40 800A4F40 1000BFAF */   sw        $ra, 0x10($sp)
    /* 94F44 800A4F44 BE44000C */  jal        __builtin_delete
    /* 94F48 800A4F48 00000000 */   nop
  .L800A4F4C:
    /* 94F4C 800A4F4C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94F50 800A4F50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94F54 800A4F54 0800E003 */  jr         $ra
    /* 94F58 800A4F58 00000000 */   nop
endlabel ___6Dialog_800a4f34
