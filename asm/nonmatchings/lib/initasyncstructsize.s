.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initasyncstructsize, 0x34

glabel initasyncstructsize
    /* 138CC 800238CC C116023C */  lui        $v0, (0x16C16C17 >> 16)
    /* 138D0 800238D0 176C4234 */  ori        $v0, $v0, (0x16C16C17 & 0xFFFF)
    /* 138D4 800238D4 82280500 */  srl        $a1, $a1, 2
    /* 138D8 800238D8 1900A200 */  multu      $a1, $v0
    /* 138DC 800238DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 138E0 800238E0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 138E4 800238E4 10180000 */  mfhi       $v1
    /* 138E8 800238E8 E68D000C */  jal        initasyncstruct
    /* 138EC 800238EC 82280300 */   srl       $a1, $v1, 2
    /* 138F0 800238F0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 138F4 800238F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 138F8 800238F8 0800E003 */  jr         $ra
    /* 138FC 800238FC 00000000 */   nop
endlabel initasyncstructsize
