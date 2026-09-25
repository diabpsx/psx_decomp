.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SETSTR__FPC4TCmdi, 0x40

glabel On_SETSTR__FPC4TCmdi
    /* 42248 80052248 02008394 */  lhu        $v1, 0x2($a0)
    /* 4224C 8005224C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42250 80052250 EF02622C */  sltiu      $v0, $v1, 0x2EF
    /* 42254 80052254 08004010 */  beqz       $v0, .L80052278
    /* 42258 80052258 1000BFAF */   sw        $ra, 0x10($sp)
    /* 4225C 8005225C 1280023C */  lui        $v0, %hi(myplr)
    /* 42260 80052260 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 42264 80052264 00000000 */  nop
    /* 42268 80052268 0300A210 */  beq        $a1, $v0, .L80052278
    /* 4226C 8005226C 2120A000 */   addu      $a0, $a1, $zero
    /* 42270 80052270 6B98010C */  jal        SetPlrStr__Fii
    /* 42274 80052274 21286000 */   addu      $a1, $v1, $zero
  .L80052278:
    /* 42278 80052278 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4227C 8005227C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42280 80052280 0800E003 */  jr         $ra
    /* 42284 80052284 00000000 */   nop
endlabel On_SETSTR__FPC4TCmdi
