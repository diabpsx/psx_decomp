.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_questlog, 0x28

glabel _GLOBAL__I_questlog
    /* 59214 80069214 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 59218 80069218 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5921C 8006921C 1380043C */  lui        $a0, %hi(D_8012EE38)
    /* 59220 80069220 38EE8424 */  addiu      $a0, $a0, %lo(D_8012EE38)
    /* 59224 80069224 A5A4010C */  jal        __6Dialog_80069294
    /* 59228 80069228 00000000 */   nop
    /* 5922C 8006922C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 59230 80069230 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 59234 80069234 0800E003 */  jr         $ra
    /* 59238 80069238 00000000 */   nop
endlabel _GLOBAL__I_questlog
