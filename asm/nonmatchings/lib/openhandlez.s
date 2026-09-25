.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openhandlez, 0x20

glabel openhandlez
    /* 18C70 80028C70 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18C74 80028C74 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18C78 80028C78 86A2000C */  jal        openhandlea
    /* 18C7C 80028C7C 1000A0AF */   sw        $zero, 0x10($sp)
    /* 18C80 80028C80 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18C84 80028C84 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18C88 80028C88 0800E003 */  jr         $ra
    /* 18C8C 80028C8C 00000000 */   nop
endlabel openhandlez
