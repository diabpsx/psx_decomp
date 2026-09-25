.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdStatus, 0x10

glabel CdStatus
    /* ACAC 8001ACAC 0B80023C */  lui        $v0, %hi(CD_status)
    /* ACB0 8001ACB0 045F4290 */  lbu        $v0, %lo(CD_status)($v0)
    /* ACB4 8001ACB4 0800E003 */  jr         $ra
    /* ACB8 8001ACB8 00000000 */   nop
endlabel CdStatus
