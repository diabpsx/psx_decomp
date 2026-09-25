.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncopenblockhandle, 0x2C

glabel asyncopenblockhandle
    /* 16508 80026508 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1650C 8002650C 3000A38F */  lw         $v1, 0x30($sp)
    /* 16510 80026510 01000224 */  addiu      $v0, $zero, 0x1
    /* 16514 80026514 1800BFAF */  sw         $ra, 0x18($sp)
    /* 16518 80026518 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1651C 8002651C 4298000C */  jal        asyncopenblockhandlea
    /* 16520 80026520 1000A3AF */   sw        $v1, 0x10($sp)
    /* 16524 80026524 1800BF8F */  lw         $ra, 0x18($sp)
    /* 16528 80026528 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1652C 8002652C 0800E003 */  jr         $ra
    /* 16530 80026530 00000000 */   nop
endlabel asyncopenblockhandle
