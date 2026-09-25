.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RestartCallback, 0x30

glabel RestartCallback
    /* 23A0 800123A0 0B80023C */  lui        $v0, %hi(D_800B53CC)
    /* 23A4 800123A4 CC53428C */  lw         $v0, %lo(D_800B53CC)($v0)
    /* 23A8 800123A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 23AC 800123AC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 23B0 800123B0 1800428C */  lw         $v0, 0x18($v0)
    /* 23B4 800123B4 00000000 */  nop
    /* 23B8 800123B8 09F84000 */  jalr       $v0
    /* 23BC 800123BC 00000000 */   nop
    /* 23C0 800123C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 23C4 800123C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 23C8 800123C8 0800E003 */  jr         $ra
    /* 23CC 800123CC 00000000 */   nop
endlabel RestartCallback
