.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GM_ForceTpLoad__Fi, 0x3C

glabel GM_ForceTpLoad__Fi
    /* 83D44 80093D44 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 83D48 80093D48 80200400 */  sll        $a0, $a0, 2
    /* 83D4C 80093D4C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 83D50 80093D50 0C80013C */  lui        $at, %hi(AllDats)
    /* 83D54 80093D54 21082400 */  addu       $at, $at, $a0
    /* 83D58 80093D58 5494248C */  lw         $a0, %lo(AllDats)($at)
    /* 83D5C 80093D5C 00000000 */  nop
    /* 83D60 80093D60 03008010 */  beqz       $a0, .L80093D70
    /* 83D64 80093D64 00000000 */   nop
    /* 83D68 80093D68 BC47020C */  jal        ReloadTP__7TextDat
    /* 83D6C 80093D6C 00000000 */   nop
  .L80093D70:
    /* 83D70 80093D70 1000BF8F */  lw         $ra, 0x10($sp)
    /* 83D74 80093D74 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 83D78 80093D78 0800E003 */  jr         $ra
    /* 83D7C 80093D7C 00000000 */   nop
endlabel GM_ForceTpLoad__Fi
