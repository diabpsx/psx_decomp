.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Save__6FileIOPCcPUci, 0x3C

glabel Save__6FileIOPCcPUci
    /* 76078 80086078 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7607C 8008607C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 76080 80086080 1000838C */  lw         $v1, 0x10($a0)
    /* 76084 80086084 00000000 */  nop
    /* 76088 80086088 28006284 */  lh         $v0, 0x28($v1)
    /* 7608C 8008608C 00000000 */  nop
    /* 76090 80086090 21208200 */  addu       $a0, $a0, $v0
    /* 76094 80086094 2C00628C */  lw         $v0, 0x2C($v1)
    /* 76098 80086098 00000000 */  nop
    /* 7609C 8008609C 09F84000 */  jalr       $v0
    /* 760A0 800860A0 00000000 */   nop
    /* 760A4 800860A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 760A8 800860A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 760AC 800860AC 0800E003 */  jr         $ra
    /* 760B0 800860B0 00000000 */   nop
endlabel Save__6FileIOPCcPUci
