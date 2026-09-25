.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6Dialog_800825e8, 0x28

glabel ___6Dialog_800825e8
    /* 725E8 800825E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 725EC 800825EC 0100A530 */  andi       $a1, $a1, 0x1
    /* 725F0 800825F0 0300A010 */  beqz       $a1, .L80082600
    /* 725F4 800825F4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 725F8 800825F8 BE44000C */  jal        __builtin_delete
    /* 725FC 800825FC 00000000 */   nop
  .L80082600:
    /* 72600 80082600 1000BF8F */  lw         $ra, 0x10($sp)
    /* 72604 80082604 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 72608 80082608 0800E003 */  jr         $ra
    /* 7260C 8008260C 00000000 */   nop
endlabel ___6Dialog_800825e8
