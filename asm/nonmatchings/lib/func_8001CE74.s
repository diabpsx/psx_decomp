.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001CE74, 0x20

glabel func_8001CE74
    /* CE74 8001CE74 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* CE78 8001CE78 1000BFAF */  sw         $ra, 0x10($sp)
    /* CE7C 8001CE7C 4375000C */  jal        strncmp
    /* CE80 8001CE80 0C000624 */   addiu     $a2, $zero, 0xC
    /* CE84 8001CE84 1000BF8F */  lw         $ra, 0x10($sp)
    /* CE88 8001CE88 0100422C */  sltiu      $v0, $v0, 0x1
    /* CE8C 8001CE8C 0800E003 */  jr         $ra
    /* CE90 8001CE90 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel func_8001CE74
