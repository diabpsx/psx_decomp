.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetRndSeed__Fv, 0x48

glabel GetRndSeed__Fv
    /* 2DADC 8003DADC 5A01033C */  lui        $v1, (0x15A4E35 >> 16)
    /* 2DAE0 8003DAE0 4420828F */  lw         $v0, %gp_rel(D_8011C7C4)($gp)
    /* 2DAE4 8003DAE4 354E6334 */  ori        $v1, $v1, (0x15A4E35 & 0xFFFF)
    /* 2DAE8 8003DAE8 18004300 */  mult       $v0, $v1
    /* 2DAEC 8003DAEC DC10828F */  lw         $v0, %gp_rel(SeedCount)($gp)
    /* 2DAF0 8003DAF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2DAF4 8003DAF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2DAF8 8003DAF8 01004224 */  addiu      $v0, $v0, 0x1
    /* 2DAFC 8003DAFC DC1082AF */  sw         $v0, %gp_rel(SeedCount)($gp)
    /* 2DB00 8003DB00 12280000 */  mflo       $a1
    /* 2DB04 8003DB04 0100A424 */  addiu      $a0, $a1, 0x1
    /* 2DB08 8003DB08 442084AF */  sw         $a0, %gp_rel(D_8011C7C4)($gp)
    /* 2DB0C 8003DB0C 6D41000C */  jal        abs
    /* 2DB10 8003DB10 00000000 */   nop
    /* 2DB14 8003DB14 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2DB18 8003DB18 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2DB1C 8003DB1C 0800E003 */  jr         $ra
    /* 2DB20 8003DB20 00000000 */   nop
endlabel GetRndSeed__Fv
