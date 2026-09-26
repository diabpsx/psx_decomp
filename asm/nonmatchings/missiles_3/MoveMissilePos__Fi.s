.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveMissilePos__Fi, 0x4

glabel MoveMissilePos__Fi
    /* 12DC 8013AED4 E0FFBD27 */  addiu      $sp, $sp, -0x20
endlabel MoveMissilePos__Fi
