.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching printxy, 0x68

glabel printxy
    /* 15DA4 80025DA4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 15DA8 80025DA8 2120C000 */  addu       $a0, $a2, $zero
    /* 15DAC 80025DAC 2128E000 */  addu       $a1, $a3, $zero
    /* 15DB0 80025DB0 4000A68F */  lw         $a2, 0x40($sp)
    /* 15DB4 80025DB4 4400A78F */  lw         $a3, 0x44($sp)
    /* 15DB8 80025DB8 4800A88F */  lw         $t0, 0x48($sp)
    /* 15DBC 80025DBC 4C00A98F */  lw         $t1, 0x4C($sp)
    /* 15DC0 80025DC0 5000AA8F */  lw         $t2, 0x50($sp)
    /* 15DC4 80025DC4 5400AB8F */  lw         $t3, 0x54($sp)
    /* 15DC8 80025DC8 5800AC8F */  lw         $t4, 0x58($sp)
    /* 15DCC 80025DCC 5C00AD8F */  lw         $t5, 0x5C($sp)
    /* 15DD0 80025DD0 6000AE8F */  lw         $t6, 0x60($sp)
    /* 15DD4 80025DD4 1000A8AF */  sw         $t0, 0x10($sp)
    /* 15DD8 80025DD8 1400A9AF */  sw         $t1, 0x14($sp)
    /* 15DDC 80025DDC 1800AAAF */  sw         $t2, 0x18($sp)
    /* 15DE0 80025DE0 1C00ABAF */  sw         $t3, 0x1C($sp)
    /* 15DE4 80025DE4 2000ACAF */  sw         $t4, 0x20($sp)
    /* 15DE8 80025DE8 2400ADAF */  sw         $t5, 0x24($sp)
    /* 15DEC 80025DEC 2800AEAF */  sw         $t6, 0x28($sp)
    /* 15DF0 80025DF0 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 15DF4 80025DF4 5F97000C */  jal        print
    /* 15DF8 80025DF8 00000000 */   nop
    /* 15DFC 80025DFC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 15E00 80025E00 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 15E04 80025E04 0800E003 */  jr         $ra
    /* 15E08 80025E08 00000000 */   nop
endlabel printxy
