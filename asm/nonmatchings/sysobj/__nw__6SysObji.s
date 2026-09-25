.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __nw__6SysObji, 0x2C

glabel __nw__6SysObji
    /* 76630 80086630 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 76634 80086634 1000BFAF */  sw         $ra, 0x10($sp)
    /* 76638 80086638 21200000 */  addu       $a0, $zero, $zero
    /* 7663C 8008663C 1180053C */  lui        $a1, %hi(D_80110198)
    /* 76640 80086640 9801A524 */  addiu      $a1, $a1, %lo(D_80110198)
    /* 76644 80086644 A583000C */  jal        DBG_Error
    /* 76648 80086648 4E000624 */   addiu     $a2, $zero, 0x4E
    /* 7664C 8008664C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 76650 80086650 21100000 */  addu       $v0, $zero, $zero
    /* 76654 80086654 0800E003 */  jr         $ra
    /* 76658 80086658 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel __nw__6SysObji
