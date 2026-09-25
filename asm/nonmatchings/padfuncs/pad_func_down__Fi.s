.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_down__Fi, 0x2C

glabel pad_func_down__Fi
    /* 90D5C 800A0D5C 1280023C */  lui        $v0, %hi(questlog)
    /* 90D60 800A0D60 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 90D64 800A0D64 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90D68 800A0D68 03004010 */  beqz       $v0, .L800A0D78
    /* 90D6C 800A0D6C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 90D70 800A0D70 C3A3010C */  jal        QuestlogDown__Fv
    /* 90D74 800A0D74 00000000 */   nop
  .L800A0D78:
    /* 90D78 800A0D78 1000BF8F */  lw         $ra, 0x10($sp)
    /* 90D7C 800A0D7C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90D80 800A0D80 0800E003 */  jr         $ra
    /* 90D84 800A0D84 00000000 */   nop
endlabel pad_func_down__Fi
