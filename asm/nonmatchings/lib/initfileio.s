.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initfileio, 0x20

glabel initfileio
    /* 188F8 800288F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 188FC 800288FC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18900 80028900 D7A3000C */  jal        _96_init
    /* 18904 80028904 00000000 */   nop
    /* 18908 80028908 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1890C 8002890C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18910 80028910 0800E003 */  jr         $ra
    /* 18914 80028914 00000000 */   nop
endlabel initfileio
