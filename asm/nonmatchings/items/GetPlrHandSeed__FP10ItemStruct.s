.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPlrHandSeed__FP10ItemStruct, 0x2C

glabel GetPlrHandSeed__FP10ItemStruct
    /* 2FCE0 8003FCE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2FCE4 8003FCE4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2FCE8 8003FCE8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2FCEC 8003FCEC B7F6000C */  jal        GetRndSeed__Fv
    /* 2FCF0 8003FCF0 21808000 */   addu      $s0, $a0, $zero
    /* 2FCF4 8003FCF4 100002AE */  sw         $v0, 0x10($s0)
    /* 2FCF8 8003FCF8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2FCFC 8003FCFC 1000B08F */  lw         $s0, 0x10($sp)
    /* 2FD00 8003FD00 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2FD04 8003FD04 0800E003 */  jr         $ra
    /* 2FD08 8003FD08 00000000 */   nop
endlabel GetPlrHandSeed__FP10ItemStruct
