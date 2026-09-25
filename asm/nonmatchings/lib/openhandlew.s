.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openhandlew, 0x24

glabel openhandlew
    /* 18DB4 80028DB4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18DB8 80028DB8 01000224 */  addiu      $v0, $zero, 0x1
    /* 18DBC 80028DBC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18DC0 80028DC0 24A3000C */  jal        openhandlewa
    /* 18DC4 80028DC4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 18DC8 80028DC8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18DCC 80028DCC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18DD0 80028DD0 0800E003 */  jr         $ra
    /* 18DD4 80028DD4 00000000 */   nop
endlabel openhandlew
