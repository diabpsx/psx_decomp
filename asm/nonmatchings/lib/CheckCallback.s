.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckCallback, 0x10

glabel CheckCallback
    /* 23D0 800123D0 0B80023C */  lui        $v0, %hi(D_800B4346)
    /* 23D4 800123D4 46434294 */  lhu        $v0, %lo(D_800B4346)($v0)
    /* 23D8 800123D8 0800E003 */  jr         $ra
    /* 23DC 800123DC 00000000 */   nop
endlabel CheckCallback
