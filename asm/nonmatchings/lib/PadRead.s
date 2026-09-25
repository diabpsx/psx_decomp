.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PadRead, 0x28

glabel PadRead
    /* 1AA8 80011AA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1AAC 80011AAC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1AB0 80011AB0 BF46000C */  jal        PAD_dr
    /* 1AB4 80011AB4 00000000 */   nop
    /* 1AB8 80011AB8 1380023C */  lui        $v0, %hi(D_8012FF80)
    /* 1ABC 80011ABC 80FF428C */  lw         $v0, %lo(D_8012FF80)($v0)
    /* 1AC0 80011AC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1AC4 80011AC4 27100200 */  nor        $v0, $zero, $v0
    /* 1AC8 80011AC8 0800E003 */  jr         $ra
    /* 1ACC 80011ACC 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel PadRead
