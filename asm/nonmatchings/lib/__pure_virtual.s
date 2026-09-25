.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __pure_virtual, 0x4

glabel __pure_virtual
    /* 125C 8001125C 0D000000 */  break      0
endlabel __pure_virtual
