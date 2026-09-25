.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetVideoMode, 0x10

glabel GetVideoMode
    /* 2D60 80012D60 0B80023C */  lui        $v0, %hi(D_800B544C)
    /* 2D64 80012D64 4C54428C */  lw         $v0, %lo(D_800B544C)($v0)
    /* 2D68 80012D68 0800E003 */  jr         $ra
    /* 2D6C 80012D6C 00000000 */   nop
endlabel GetVideoMode
    /* 2D70 80012D70 00000000 */  nop
    /* 2D74 80012D74 00000000 */  nop
    /* 2D78 80012D78 00000000 */  nop
