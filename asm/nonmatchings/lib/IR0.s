.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IR0, 0x4

glabel IR0
    /* 22C 8001022C 00080000 */  sll        $at, $zero, 0
endlabel IR0
