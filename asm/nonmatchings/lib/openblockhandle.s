.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openblockhandle, 0x2C

glabel openblockhandle
    /* 160B4 800260B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 160B8 800260B8 3000A38F */  lw         $v1, 0x30($sp)
    /* 160BC 800260BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 160C0 800260C0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 160C4 800260C4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 160C8 800260C8 8B97000C */  jal        openblockhandlea
    /* 160CC 800260CC 1000A3AF */   sw        $v1, 0x10($sp)
    /* 160D0 800260D0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 160D4 800260D4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 160D8 800260D8 0800E003 */  jr         $ra
    /* 160DC 800260DC 00000000 */   nop
endlabel openblockhandle
