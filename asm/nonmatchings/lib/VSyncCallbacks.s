.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VSyncCallbacks, 0x30

glabel VSyncCallbacks
    /* 2340 80012340 0B80023C */  lui        $v0, %hi(D_800B53CC)
    /* 2344 80012344 CC53428C */  lw         $v0, %lo(D_800B53CC)($v0)
    /* 2348 80012348 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 234C 8001234C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2350 80012350 1400428C */  lw         $v0, 0x14($v0)
    /* 2354 80012354 00000000 */  nop
    /* 2358 80012358 09F84000 */  jalr       $v0
    /* 235C 8001235C 00000000 */   nop
    /* 2360 80012360 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2364 80012364 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2368 80012368 0800E003 */  jr         $ra
    /* 236C 8001236C 00000000 */   nop
endlabel VSyncCallbacks
