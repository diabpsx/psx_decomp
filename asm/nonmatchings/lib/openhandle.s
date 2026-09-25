.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openhandle, 0x24

glabel openhandle
    /* 18C4C 80028C4C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18C50 80028C50 01000224 */  addiu      $v0, $zero, 0x1
    /* 18C54 80028C54 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18C58 80028C58 86A2000C */  jal        openhandlea
    /* 18C5C 80028C5C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 18C60 80028C60 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18C64 80028C64 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18C68 80028C68 0800E003 */  jr         $ra
    /* 18C6C 80028C6C 00000000 */   nop
endlabel openhandle
