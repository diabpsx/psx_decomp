.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSYS_GetWorkMemInfo, 0x10

glabel GSYS_GetWorkMemInfo
    /* 1116C 8002116C 0B80023C */  lui        $v0, %hi(WorkMemInfo)
    /* 11170 80021170 94634224 */  addiu      $v0, $v0, %lo(WorkMemInfo)
    /* 11174 80021174 0800E003 */  jr         $ra
    /* 11178 80021178 00000000 */   nop
endlabel GSYS_GetWorkMemInfo
