.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getasyncstatus, 0x10

glabel getasyncstatus
    /* 14258 80024258 1380023C */  lui        $v0, %hi(D_80135190)
    /* 1425C 8002425C 9051428C */  lw         $v0, %lo(D_80135190)($v0)
    /* 14260 80024260 0800E003 */  jr         $ra
    /* 14264 80024264 00000000 */   nop
endlabel getasyncstatus
