.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgememaboveadr, 0x28

glabel purgememaboveadr
    /* 1B0A8 8002B0A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B0AC 8002B0AC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1B0B0 8002B0B0 B1AB000C */  jal        findmemblock
    /* 1B0B4 8002B0B4 00000000 */   nop
    /* 1B0B8 8002B0B8 34AC000C */  jal        purgememaboveblock
    /* 1B0BC 8002B0BC 21204000 */   addu      $a0, $v0, $zero
    /* 1B0C0 8002B0C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B0C4 8002B0C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B0C8 8002B0C8 0800E003 */  jr         $ra
    /* 1B0CC 8002B0CC 00000000 */   nop
endlabel purgememaboveadr
