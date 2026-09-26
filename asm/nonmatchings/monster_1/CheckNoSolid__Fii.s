.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckNoSolid__Fii, 0x20

glabel CheckNoSolid__Fii
    /* 1B5D8 801551D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B5DC 801551D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1B5E0 801551D8 380B020C */  jal        GetSOLID__Fii
    /* 1B5E4 801551DC 00000000 */   nop
    /* 1B5E8 801551E0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B5EC 801551E4 01004238 */  xori       $v0, $v0, 0x1
    /* 1B5F0 801551E8 0800E003 */  jr         $ra
    /* 1B5F4 801551EC 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel CheckNoSolid__Fii
