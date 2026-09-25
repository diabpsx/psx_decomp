.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800893f4, 0x28

glabel ___6Dialog_800893f4
    /* 793F4 800893F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 793F8 800893F8 0100A530 */  andi       $a1, $a1, 0x1
    /* 793FC 800893FC 0300A010 */  beqz       $a1, .L8008940C
    /* 79400 80089400 1000BFAF */   sw        $ra, 0x10($sp)
    /* 79404 80089404 BE44000C */  jal        __builtin_delete
    /* 79408 80089408 00000000 */   nop
  .L8008940C:
    /* 7940C 8008940C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 79410 80089410 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79414 80089414 0800E003 */  jr         $ra
    /* 79418 80089418 00000000 */   nop
endlabel ___6Dialog_800893f4
