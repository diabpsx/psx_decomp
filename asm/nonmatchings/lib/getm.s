.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getm, 0x68

glabel getm
    /* 1CAE4 8002CAE4 00008990 */  lbu        $t1, 0x0($a0)
    /* 1CAE8 8002CAE8 FDFFA824 */  addiu      $t0, $a1, -0x3
    /* 1CAEC 8002CAEC 0F000005 */  bltz       $t0, .L8002CB2C
    /* 1CAF0 8002CAF0 00120900 */   sll       $v0, $t1, 8
    /* 1CAF4 8002CAF4 01008A90 */  lbu        $t2, 0x1($a0)
    /* 1CAF8 8002CAF8 08000011 */  beqz       $t0, .L8002CB1C
    /* 1CAFC 8002CAFC 25104A00 */   or        $v0, $v0, $t2
    /* 1CB00 8002CB00 02008B90 */  lbu        $t3, 0x2($a0)
    /* 1CB04 8002CB04 03008C90 */  lbu        $t4, 0x3($a0)
    /* 1CB08 8002CB08 00140200 */  sll        $v0, $v0, 16
    /* 1CB0C 8002CB0C 005A0B00 */  sll        $t3, $t3, 8
    /* 1CB10 8002CB10 25586C01 */  or         $t3, $t3, $t4
    /* 1CB14 8002CB14 0800E003 */  jr         $ra
    /* 1CB18 8002CB18 25104B00 */   or        $v0, $v0, $t3
  .L8002CB1C:
    /* 1CB1C 8002CB1C 02008B90 */  lbu        $t3, 0x2($a0)
    /* 1CB20 8002CB20 00120200 */  sll        $v0, $v0, 8
    /* 1CB24 8002CB24 0800E003 */  jr         $ra
    /* 1CB28 8002CB28 25104B00 */   or        $v0, $v0, $t3
  .L8002CB2C:
    /* 1CB2C 8002CB2C 01008A90 */  lbu        $t2, 0x1($a0)
    /* 1CB30 8002CB30 FEFFA824 */  addiu      $t0, $a1, -0x2
    /* 1CB34 8002CB34 03000005 */  bltz       $t0, .L8002CB44
    /* 1CB38 8002CB38 00000000 */   nop
    /* 1CB3C 8002CB3C 0800E003 */  jr         $ra
    /* 1CB40 8002CB40 25104A00 */   or        $v0, $v0, $t2
  .L8002CB44:
    /* 1CB44 8002CB44 0800E003 */  jr         $ra
    /* 1CB48 8002CB48 25100900 */   or        $v0, $zero, $t1
endlabel getm
