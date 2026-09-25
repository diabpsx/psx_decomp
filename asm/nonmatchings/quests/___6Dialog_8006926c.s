.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_8006926c, 0x28

glabel ___6Dialog_8006926c
    /* 5926C 8006926C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 59270 80069270 0100A530 */  andi       $a1, $a1, 0x1
    /* 59274 80069274 0300A010 */  beqz       $a1, .L80069284
    /* 59278 80069278 1000BFAF */   sw        $ra, 0x10($sp)
    /* 5927C 8006927C BE44000C */  jal        __builtin_delete
    /* 59280 80069280 00000000 */   nop
  .L80069284:
    /* 59284 80069284 1000BF8F */  lw         $ra, 0x10($sp)
    /* 59288 80069288 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5928C 8006928C 0800E003 */  jr         $ra
    /* 59290 80069290 00000000 */   nop
endlabel ___6Dialog_8006926c
