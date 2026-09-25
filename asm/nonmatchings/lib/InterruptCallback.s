.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InterruptCallback, 0x30

glabel InterruptCallback
    /* 22AC 800122AC 0B80023C */  lui        $v0, %hi(D_800B53CC)
    /* 22B0 800122B0 CC53428C */  lw         $v0, %lo(D_800B53CC)($v0)
    /* 22B4 800122B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22B8 800122B8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 22BC 800122BC 0800428C */  lw         $v0, 0x8($v0)
    /* 22C0 800122C0 00000000 */  nop
    /* 22C4 800122C4 09F84000 */  jalr       $v0
    /* 22C8 800122C8 00000000 */   nop
    /* 22CC 800122CC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 22D0 800122D0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22D4 800122D4 0800E003 */  jr         $ra
    /* 22D8 800122D8 00000000 */   nop
endlabel InterruptCallback
