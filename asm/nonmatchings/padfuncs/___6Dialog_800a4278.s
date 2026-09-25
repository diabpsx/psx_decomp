.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800a4278, 0x28

glabel ___6Dialog_800a4278
    /* 94278 800A4278 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9427C 800A427C 0100A530 */  andi       $a1, $a1, 0x1
    /* 94280 800A4280 0300A010 */  beqz       $a1, .L800A4290
    /* 94284 800A4284 1000BFAF */   sw        $ra, 0x10($sp)
    /* 94288 800A4288 BE44000C */  jal        __builtin_delete
    /* 9428C 800A428C 00000000 */   nop
  .L800A4290:
    /* 94290 800A4290 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94294 800A4294 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94298 800A4298 0800E003 */  jr         $ra
    /* 9429C 800A429C 00000000 */   nop
endlabel ___6Dialog_800a4278
