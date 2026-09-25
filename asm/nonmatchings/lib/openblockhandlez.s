.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openblockhandlez, 0x28

glabel openblockhandlez
    /* 160E0 800260E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 160E4 800260E4 3000A28F */  lw         $v0, 0x30($sp)
    /* 160E8 800260E8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 160EC 800260EC 1400A0AF */  sw         $zero, 0x14($sp)
    /* 160F0 800260F0 8B97000C */  jal        openblockhandlea
    /* 160F4 800260F4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 160F8 800260F8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 160FC 800260FC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 16100 80026100 0800E003 */  jr         $ra
    /* 16104 80026104 00000000 */   nop
endlabel openblockhandlez
