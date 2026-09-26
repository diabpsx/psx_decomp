.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_8013ca94, 0x28

glabel ___6Dialog_8013ca94
    /* 2E9C 8013CA94 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2EA0 8013CA98 0100A530 */  andi       $a1, $a1, 0x1
    /* 2EA4 8013CA9C 0300A010 */  beqz       $a1, .L8013CAAC
    /* 2EA8 8013CAA0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2EAC 8013CAA4 BE44000C */  jal        __builtin_delete
    /* 2EB0 8013CAA8 00000000 */   nop
  .L8013CAAC:
    /* 2EB4 8013CAAC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2EB8 8013CAB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2EBC 8013CAB4 0800E003 */  jr         $ra
    /* 2EC0 8013CAB8 00000000 */   nop
endlabel ___6Dialog_8013ca94
