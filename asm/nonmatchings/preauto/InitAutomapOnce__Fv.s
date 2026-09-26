.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitAutomapOnce__Fv, 0x2C

glabel InitAutomapOnce__Fv
    /* 25AC4 8015F6BC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 25AC8 8015F6C0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 25ACC 8015F6C4 1280013C */  lui        $at, %hi(automapflag)
    /* 25AD0 8015F6C8 7BC320A0 */  sb         $zero, %lo(automapflag)($at)
    /* 25AD4 8015F6CC 044F020C */  jal        GM_UseTexData__Fi
    /* 25AD8 8015F6D0 21200000 */   addu      $a0, $zero, $zero
    /* 25ADC 8015F6D4 801A82AF */  sw         $v0, %gp_rel(AutoMapTData)($gp)
    /* 25AE0 8015F6D8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 25AE4 8015F6DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 25AE8 8015F6E0 0800E003 */  jr         $ra
    /* 25AEC 8015F6E4 00000000 */   nop
endlabel InitAutomapOnce__Fv
