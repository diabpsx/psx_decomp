.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncopenblockhandlez, 0x28

glabel asyncopenblockhandlez
    /* 16534 80026534 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 16538 80026538 3000A28F */  lw         $v0, 0x30($sp)
    /* 1653C 8002653C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 16540 80026540 1400A0AF */  sw         $zero, 0x14($sp)
    /* 16544 80026544 4298000C */  jal        asyncopenblockhandlea
    /* 16548 80026548 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1654C 8002654C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 16550 80026550 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 16554 80026554 0800E003 */  jr         $ra
    /* 16558 80026558 00000000 */   nop
endlabel asyncopenblockhandlez
