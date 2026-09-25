.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching fileexists, 0x4C

glabel fileexists
    /* 19004 80029004 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 19008 80029008 1000A527 */  addiu      $a1, $sp, 0x10
    /* 1900C 8002900C 1400A627 */  addiu      $a2, $sp, 0x14
    /* 19010 80029010 2000BFAF */  sw         $ra, 0x20($sp)
    /* 19014 80029014 1CA3000C */  jal        openhandlez
    /* 19018 80029018 1800A727 */   addiu     $a3, $sp, 0x18
    /* 1901C 8002901C 1000A48F */  lw         $a0, 0x10($sp)
    /* 19020 80029020 00000000 */  nop
    /* 19024 80029024 05008010 */  beqz       $a0, .L8002903C
    /* 19028 80029028 00000000 */   nop
    /* 1902C 8002902C 76A3000C */  jal        libclosehandle
    /* 19030 80029030 00000000 */   nop
    /* 19034 80029034 01000224 */  addiu      $v0, $zero, 0x1
    /* 19038 80029038 1000A2AF */  sw         $v0, 0x10($sp)
  .L8002903C:
    /* 1903C 8002903C 1000A28F */  lw         $v0, 0x10($sp)
    /* 19040 80029040 2000BF8F */  lw         $ra, 0x20($sp)
    /* 19044 80029044 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 19048 80029048 0800E003 */  jr         $ra
    /* 1904C 8002904C 00000000 */   nop
endlabel fileexists
