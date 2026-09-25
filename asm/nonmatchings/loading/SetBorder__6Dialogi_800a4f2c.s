.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800a4f2c, 0x8

glabel SetBorder__6Dialogi_800a4f2c
    /* 94F2C 800A4F2C 0800E003 */  jr         $ra
    /* 94F30 800A4F30 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800a4f2c
