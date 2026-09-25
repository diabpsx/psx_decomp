.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StopPAD, 0x38

glabel StopPAD
    /* 1C88 80011C88 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C8C 80011C8C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1C90 80011C90 A447000C */  jal        DisablePAD
    /* 1C94 80011C94 00000000 */   nop
    /* 1C98 80011C98 8F47000C */  jal        StopPAD2
    /* 1C9C 80011C9C 00000000 */   nop
    /* 1CA0 80011CA0 4E47000C */  jal        func_80011D38
    /* 1CA4 80011CA4 00000000 */   nop
    /* 1CA8 80011CA8 0B80013C */  lui        $at, %hi(D_800B42BC)
    /* 1CAC 80011CAC BC4220AC */  sw         $zero, %lo(D_800B42BC)($at)
    /* 1CB0 80011CB0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1CB4 80011CB4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CB8 80011CB8 0800E003 */  jr         $ra
    /* 1CBC 80011CBC 00000000 */   nop
endlabel StopPAD
