.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_8015b8a8, 0x28

glabel ___6Dialog_8015b8a8
    /* 21CB0 8015B8A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 21CB4 8015B8AC 0100A530 */  andi       $a1, $a1, 0x1
    /* 21CB8 8015B8B0 0300A010 */  beqz       $a1, .L8015B8C0
    /* 21CBC 8015B8B4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 21CC0 8015B8B8 BE44000C */  jal        __builtin_delete
    /* 21CC4 8015B8BC 00000000 */   nop
  .L8015B8C0:
    /* 21CC8 8015B8C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 21CCC 8015B8C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 21CD0 8015B8C8 0800E003 */  jr         $ra
    /* 21CD4 8015B8CC 00000000 */   nop
endlabel ___6Dialog_8015b8a8
