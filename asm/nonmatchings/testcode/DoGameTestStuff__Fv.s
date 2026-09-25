.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoGameTestStuff__Fv, 0x2C

glabel DoGameTestStuff__Fv
    /* 6B170 8007B170 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B174 8007B174 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6B178 8007B178 84EC010C */  jal        GRL_InitGwin__Fv
    /* 6B17C 8007B17C 00000000 */   nop
    /* 6B180 8007B180 01000424 */  addiu      $a0, $zero, 0x1
    /* 6B184 8007B184 83E0000C */  jal        StartGame__FUcUc
    /* 6B188 8007B188 01000524 */   addiu     $a1, $zero, 0x1
    /* 6B18C 8007B18C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B190 8007B190 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B194 8007B194 0800E003 */  jr         $ra
    /* 6B198 8007B198 00000000 */   nop
endlabel DoGameTestStuff__Fv
