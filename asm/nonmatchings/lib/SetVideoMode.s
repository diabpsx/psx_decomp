.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetVideoMode, 0x14

glabel SetVideoMode
    /* 2D4C 80012D4C 0B80023C */  lui        $v0, %hi(D_800B544C)
    /* 2D50 80012D50 4C54428C */  lw         $v0, %lo(D_800B544C)($v0)
    /* 2D54 80012D54 0B80013C */  lui        $at, %hi(D_800B544C)
    /* 2D58 80012D58 0800E003 */  jr         $ra
    /* 2D5C 80012D5C 4C5424AC */   sw        $a0, %lo(D_800B544C)($at)
endlabel SetVideoMode
