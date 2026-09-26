.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSlainHero__Fv, 0x40

glabel AddSlainHero__Fv
    /* 1D888 80157480 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D88C 80157484 05000424 */  addiu      $a0, $zero, 0x5
    /* 1D890 80157488 1000A527 */  addiu      $a1, $sp, 0x10
    /* 1D894 8015748C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D898 80157490 A25C050C */  jal        GetRndObjLoc__FiRiT1
    /* 1D89C 80157494 1400A627 */   addiu     $a2, $sp, 0x14
    /* 1D8A0 80157498 60000424 */  addiu      $a0, $zero, 0x60
    /* 1D8A4 8015749C 1000A58F */  lw         $a1, 0x10($sp)
    /* 1D8A8 801574A0 1400A68F */  lw         $a2, 0x14($sp)
    /* 1D8AC 801574A4 0200A524 */  addiu      $a1, $a1, 0x2
    /* 1D8B0 801574A8 BE4E010C */  jal        AddObject__Fiii
    /* 1D8B4 801574AC 0200C624 */   addiu     $a2, $a2, 0x2
    /* 1D8B8 801574B0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D8BC 801574B4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D8C0 801574B8 0800E003 */  jr         $ra
    /* 1D8C4 801574BC 00000000 */   nop
endlabel AddSlainHero__Fv
