.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DMACallback, 0x30

glabel DMACallback
    /* 22DC 800122DC 0B80023C */  lui        $v0, %hi(D_800B53CC)
    /* 22E0 800122E0 CC53428C */  lw         $v0, %lo(D_800B53CC)($v0)
    /* 22E4 800122E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22E8 800122E8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 22EC 800122EC 0400428C */  lw         $v0, 0x4($v0)
    /* 22F0 800122F0 00000000 */  nop
    /* 22F4 800122F4 09F84000 */  jalr       $v0
    /* 22F8 800122F8 00000000 */   nop
    /* 22FC 800122FC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2300 80012300 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2304 80012304 0800E003 */  jr         $ra
    /* 2308 80012308 00000000 */   nop
endlabel DMACallback
