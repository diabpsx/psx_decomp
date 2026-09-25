.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_Halt, 0x8

glabel DBG_Halt
    /* 10E64 80020E64 99830008 */  j          DBG_Halt
    /* 10E68 80020E68 00000000 */   nop
endlabel DBG_Halt
