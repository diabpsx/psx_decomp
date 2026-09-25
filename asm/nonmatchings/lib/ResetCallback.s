.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ResetCallback, 0x30

glabel ResetCallback
    /* 227C 8001227C 0B80023C */  lui        $v0, %hi(D_800B53CC)
    /* 2280 80012280 CC53428C */  lw         $v0, %lo(D_800B53CC)($v0)
    /* 2284 80012284 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2288 80012288 1000BFAF */  sw         $ra, 0x10($sp)
    /* 228C 8001228C 0C00428C */  lw         $v0, 0xC($v0)
    /* 2290 80012290 00000000 */  nop
    /* 2294 80012294 09F84000 */  jalr       $v0
    /* 2298 80012298 00000000 */   nop
    /* 229C 8001229C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 22A0 800122A0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22A4 800122A4 0800E003 */  jr         $ra
    /* 22A8 800122A8 00000000 */   nop
endlabel ResetCallback
