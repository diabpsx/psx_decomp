.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __builtin_delete, 0x24

glabel __builtin_delete
    /* 12F8 800112F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12FC 800112FC 03008010 */  beqz       $a0, .L8001130C
    /* 1300 80011300 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1304 80011304 8F67000C */  jal        free
    /* 1308 80011308 00000000 */   nop
  .L8001130C:
    /* 130C 8001130C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1310 80011310 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1314 80011314 0800E003 */  jr         $ra
    /* 1318 80011318 00000000 */   nop
endlabel __builtin_delete
