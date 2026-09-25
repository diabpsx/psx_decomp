.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncRESURRECTBEAM__FP13MissileStructiii, 0x34

glabel FuncRESURRECTBEAM__FP13MissileStructiii
    /* 6D414 8007D414 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6D418 8007D418 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6D41C 8007D41C C2170600 */  srl        $v0, $a2, 31
    /* 6D420 8007D420 21104600 */  addu       $v0, $v0, $a2
    /* 6D424 8007D424 43100200 */  sra        $v0, $v0, 1
    /* 6D428 8007D428 FCFFA424 */  addiu      $a0, $a1, -0x4
    /* 6D42C 8007D42C 18004524 */  addiu      $a1, $v0, 0x18
    /* 6D430 8007D430 707F020C */  jal        ResurrectFX__Fiiii
    /* 6D434 8007D434 00400624 */   addiu     $a2, $zero, 0x4000
    /* 6D438 8007D438 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6D43C 8007D43C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6D440 8007D440 0800E003 */  jr         $ra
    /* 6D444 8007D444 00000000 */   nop
endlabel FuncRESURRECTBEAM__FP13MissileStructiii
