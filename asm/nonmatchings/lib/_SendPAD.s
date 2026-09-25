.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _SendPAD, 0x2C

glabel _SendPAD
    /* 1F1C 80011F1C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F20 80011F20 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1F24 80011F24 1380093C */  lui        $t1, %hi(D_8012FFB4)
    /* 1F28 80011F28 B4FF298D */  lw         $t1, %lo(D_8012FFB4)($t1)
    /* 1F2C 80011F2C 00000000 */  nop
    /* 1F30 80011F30 09F82001 */  jalr       $t1
    /* 1F34 80011F34 00000000 */   nop
    /* 1F38 80011F38 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1F3C 80011F3C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F40 80011F40 0800E003 */  jr         $ra
    /* 1F44 80011F44 00000000 */   nop
endlabel _SendPAD
