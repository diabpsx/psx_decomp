.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdMode, 0x10

glabel CdMode
    /* ACBC 8001ACBC 0B80023C */  lui        $v0, %hi(CD_mode)
    /* ACC0 8001ACC0 145F4290 */  lbu        $v0, %lo(CD_mode)($v0)
    /* ACC4 8001ACC4 0800E003 */  jr         $ra
    /* ACC8 8001ACC8 00000000 */   nop
endlabel CdMode
