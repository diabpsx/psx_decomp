.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching longjmp, 0x38

glabel longjmp
    /* 334 80010334 00009F8C */  lw         $ra, 0x0($a0)
    /* 338 80010338 04009D8C */  lw         $sp, 0x4($a0)
    /* 33C 8001033C 08009E8C */  lw         $fp, 0x8($a0)
    /* 340 80010340 0C00908C */  lw         $s0, 0xC($a0)
    /* 344 80010344 1000918C */  lw         $s1, 0x10($a0)
    /* 348 80010348 1400928C */  lw         $s2, 0x14($a0)
    /* 34C 8001034C 1800938C */  lw         $s3, 0x18($a0)
    /* 350 80010350 1C00948C */  lw         $s4, 0x1C($a0)
    /* 354 80010354 2000958C */  lw         $s5, 0x20($a0)
    /* 358 80010358 2400968C */  lw         $s6, 0x24($a0)
    /* 35C 8001035C 2800978C */  lw         $s7, 0x28($a0)
    /* 360 80010360 2C009C8C */  lw         $gp, 0x2C($a0)
    /* 364 80010364 0800E003 */  jr         $ra
    /* 368 80010368 2110A000 */   addu      $v0, $a1, $zero
endlabel longjmp
