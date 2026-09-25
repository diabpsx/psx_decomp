.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdGetToc, 0x24

glabel CdGetToc
    /* 185B4 800285B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 185B8 800285B8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 185BC 800285BC 21288000 */  addu       $a1, $a0, $zero
    /* 185C0 800285C0 76A1000C */  jal        CdGetToc2
    /* 185C4 800285C4 01000424 */   addiu     $a0, $zero, 0x1
    /* 185C8 800285C8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 185CC 800285CC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 185D0 800285D0 0800E003 */  jr         $ra
    /* 185D4 800285D4 00000000 */   nop
endlabel CdGetToc
