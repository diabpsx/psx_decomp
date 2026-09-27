.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SCR_Handler__Fv, 0x28

glabel SCR_Handler__Fv
    /* 8B0AC 8009B0AC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B0B0 8009B0B0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8B0B4 8009B0B4 0D80043C */  lui        $a0, %hi(ThePals)
    /* 8B0B8 8009B0B8 ACBD8424 */  addiu      $a0, $a0, %lo(ThePals)
    /* 8B0BC 8009B0BC 0E6C020C */  jal        UpdatePals__13PalCollection
    /* 8B0C0 8009B0C0 00000000 */   nop
    /* 8B0C4 8009B0C4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8B0C8 8009B0C8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B0CC 8009B0CC 0800E003 */  jr         $ra
    /* 8B0D0 8009B0D0 00000000 */   nop
endlabel SCR_Handler__Fv
