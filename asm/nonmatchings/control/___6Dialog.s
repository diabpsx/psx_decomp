.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog, 0x28

glabel ___6Dialog
    /* 27644 80037644 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27648 80037648 0100A530 */  andi       $a1, $a1, 0x1
    /* 2764C 8003764C 0300A010 */  beqz       $a1, .L8003765C
    /* 27650 80037650 1000BFAF */   sw        $ra, 0x10($sp)
    /* 27654 80037654 BE44000C */  jal        __builtin_delete
    /* 27658 80037658 00000000 */   nop
  .L8003765C:
    /* 2765C 8003765C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 27660 80037660 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 27664 80037664 0800E003 */  jr         $ra
    /* 27668 80037668 00000000 */   nop
endlabel ___6Dialog
