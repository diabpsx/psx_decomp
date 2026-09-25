.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StopCallback, 0x30

glabel StopCallback
    /* 2370 80012370 0B80023C */  lui        $v0, %hi(D_800B53CC)
    /* 2374 80012374 CC53428C */  lw         $v0, %lo(D_800B53CC)($v0)
    /* 2378 80012378 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 237C 8001237C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2380 80012380 1000428C */  lw         $v0, 0x10($v0)
    /* 2384 80012384 00000000 */  nop
    /* 2388 80012388 09F84000 */  jalr       $v0
    /* 238C 8001238C 00000000 */   nop
    /* 2390 80012390 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2394 80012394 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2398 80012398 0800E003 */  jr         $ra
    /* 239C 8001239C 00000000 */   nop
endlabel StopCallback
