.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GM_FinishedUsing__FP7TextDat, 0x54

glabel GM_FinishedUsing__FP7TextDat
    /* 83D80 80093D80 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 83D84 80093D84 1000B0AF */  sw         $s0, 0x10($sp)
    /* 83D88 80093D88 1400BFAF */  sw         $ra, 0x14($sp)
    /* 83D8C 80093D8C B448020C */  jal        FinishedUsing__7TextDat
    /* 83D90 80093D90 21808000 */   addu      $s0, $a0, $zero
    /* 83D94 80093D94 BA54020C */  jal        IsLoaded__C7TextDat
    /* 83D98 80093D98 21200002 */   addu      $a0, $s0, $zero
    /* 83D9C 80093D9C 01004238 */  xori       $v0, $v0, 0x1
    /* 83DA0 80093DA0 07004010 */  beqz       $v0, .L80093DC0
    /* 83DA4 80093DA4 00000000 */   nop
    /* 83DA8 80093DA8 BD54020C */  jal        GetTexNum__C7TextDat
    /* 83DAC 80093DAC 21200002 */   addu      $a0, $s0, $zero
    /* 83DB0 80093DB0 80100200 */  sll        $v0, $v0, 2
    /* 83DB4 80093DB4 0C80013C */  lui        $at, %hi(AllDats)
    /* 83DB8 80093DB8 21082200 */  addu       $at, $at, $v0
    /* 83DBC 80093DBC 549420AC */  sw         $zero, %lo(AllDats)($at)
  .L80093DC0:
    /* 83DC0 80093DC0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 83DC4 80093DC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 83DC8 80093DC8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 83DCC 80093DCC 0800E003 */  jr         $ra
    /* 83DD0 80093DD0 00000000 */   nop
endlabel GM_FinishedUsing__FP7TextDat
