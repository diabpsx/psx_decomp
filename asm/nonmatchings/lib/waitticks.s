.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching waitticks, 0x28

glabel waitticks
    /* 200E4 800300E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 200E8 800300E8 1000BFAF */  sw         $ra, 0x10($sp)
  .L800300EC:
    /* 200EC 800300EC 43C0000C */  jal        testticks
    /* 200F0 800300F0 00000000 */   nop
    /* 200F4 800300F4 FDFF4010 */  beqz       $v0, .L800300EC
    /* 200F8 800300F8 00000000 */   nop
    /* 200FC 800300FC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 20100 80030100 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 20104 80030104 0800E003 */  jr         $ra
    /* 20108 80030108 00000000 */   nop
endlabel waitticks
