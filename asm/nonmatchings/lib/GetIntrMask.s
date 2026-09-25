.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetIntrMask, 0x18

glabel GetIntrMask
    /* 23E0 800123E0 0B80023C */  lui        $v0, %hi(D_800B53D4)
    /* 23E4 800123E4 D453428C */  lw         $v0, %lo(D_800B53D4)($v0)
    /* 23E8 800123E8 00000000 */  nop
    /* 23EC 800123EC 00004294 */  lhu        $v0, 0x0($v0)
    /* 23F0 800123F0 0800E003 */  jr         $ra
    /* 23F4 800123F4 00000000 */   nop
endlabel GetIntrMask
