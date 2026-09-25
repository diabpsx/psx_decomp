.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_initintr, 0x4C

glabel CD_initintr
    /* C538 8001C538 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* C53C 8001C53C 1000BFAF */  sw         $ra, 0x10($sp)
    /* C540 8001C540 0B80013C */  lui        $at, %hi(CD_cbready)
    /* C544 8001C544 F85E20AC */  sw         $zero, %lo(CD_cbready)($at)
    /* C548 8001C548 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* C54C 8001C54C F45E20AC */  sw         $zero, %lo(CD_cbsync)($at)
    /* C550 8001C550 0B80013C */  lui        $at, %hi(CD_status1)
    /* C554 8001C554 085F20AC */  sw         $zero, %lo(CD_status1)($at)
    /* C558 8001C558 0B80013C */  lui        $at, %hi(CD_status)
    /* C55C 8001C55C 9F48000C */  jal        ResetCallback
    /* C560 8001C560 045F20AC */   sw        $zero, %lo(CD_status)($at)
    /* C564 8001C564 0280053C */  lui        $a1, %hi(D_8001CAC4)
    /* C568 8001C568 C4CAA524 */  addiu      $a1, $a1, %lo(D_8001CAC4)
    /* C56C 8001C56C AB48000C */  jal        InterruptCallback
    /* C570 8001C570 02000424 */   addiu     $a0, $zero, 0x2
    /* C574 8001C574 1000BF8F */  lw         $ra, 0x10($sp)
    /* C578 8001C578 1800BD27 */  addiu      $sp, $sp, 0x18
    /* C57C 8001C57C 0800E003 */  jr         $ra
    /* C580 8001C580 00000000 */   nop
endlabel CD_initintr
