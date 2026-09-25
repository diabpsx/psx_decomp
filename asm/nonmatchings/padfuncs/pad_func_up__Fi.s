.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_up__Fi, 0x2C

glabel pad_func_up__Fi
    /* 90D30 800A0D30 1280023C */  lui        $v0, %hi(questlog)
    /* 90D34 800A0D34 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 90D38 800A0D38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90D3C 800A0D3C 03004010 */  beqz       $v0, .L800A0D4C
    /* 90D40 800A0D40 1000BFAF */   sw        $ra, 0x10($sp)
    /* 90D44 800A0D44 9DA3010C */  jal        QuestlogUp__Fv
    /* 90D48 800A0D48 00000000 */   nop
  .L800A0D4C:
    /* 90D4C 800A0D4C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 90D50 800A0D50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90D54 800A0D54 0800E003 */  jr         $ra
    /* 90D58 800A0D58 00000000 */   nop
endlabel pad_func_up__Fi
