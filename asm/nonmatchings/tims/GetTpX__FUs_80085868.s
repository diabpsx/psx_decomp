.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpX__FUs_80085868, 0xC

glabel GetTpX__FUs_80085868
    /* 75868 80085868 80110400 */  sll        $v0, $a0, 6
    /* 7586C 8008586C 0800E003 */  jr         $ra
    /* 75870 80085870 C0034230 */   andi      $v0, $v0, 0x3C0
endlabel GetTpX__FUs_80085868
