.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_8013B37C, 0x34

glabel func_8013B37C
    /* 1784 8013B37C FFFFFF00 */  .word      0x00FFFFFF                    # dsra32     $ra, $ra, 31 # 00E00000 <InstrIdType: CPU_SPECIAL>
    /* 1788 8013B380 1480083C */  lui        $t0, %hi(func_8013B37C)
    /* 178C 8013B384 7CB30825 */  addiu      $t0, $t0, %lo(func_8013B37C)
    /* 1790 8013B388 FFFF8120 */  addi       $at, $a0, -0x1 /* handwritten instruction */
    /* 1794 8013B38C 04002018 */  blez       $at, .L8013B3A0
    /* 1798 8013B390 0000028D */   lw        $v0, 0x0($t0)
    /* 179C 8013B394 40080400 */  sll        $at, $a0, 1
    /* 17A0 8013B398 0800E003 */  jr         $ra
    /* 17A4 8013B39C 000001AD */   sw        $at, 0x0($t0)
  .L8013B3A0:
    /* 17A8 8013B3A0 FF00013C */  lui        $at, (0xFFFFFF >> 16)
    /* 17AC 8013B3A4 FFFF2134 */  ori        $at, $at, (0xFFFFFF & 0xFFFF)
    /* 17B0 8013B3A8 0800E003 */  jr         $ra
    /* 17B4 8013B3AC 000001AD */   sw        $at, 0x0($t0)
endlabel func_8013B37C
