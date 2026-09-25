.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SETMAG__FPC4TCmdi, 0x40

glabel On_SETMAG__FPC4TCmdi
    /* 422C8 800522C8 02008394 */  lhu        $v1, 0x2($a0)
    /* 422CC 800522CC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 422D0 800522D0 EF02622C */  sltiu      $v0, $v1, 0x2EF
    /* 422D4 800522D4 08004010 */  beqz       $v0, .L800522F8
    /* 422D8 800522D8 1000BFAF */   sw        $ra, 0x10($sp)
    /* 422DC 800522DC 1280023C */  lui        $v0, %hi(myplr)
    /* 422E0 800522E0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 422E4 800522E4 00000000 */  nop
    /* 422E8 800522E8 0300A210 */  beq        $a1, $v0, .L800522F8
    /* 422EC 800522EC 2120A000 */   addu      $a0, $a1, $zero
    /* 422F0 800522F0 A298010C */  jal        SetPlrMag__Fii
    /* 422F4 800522F4 21286000 */   addu      $a1, $v1, $zero
  .L800522F8:
    /* 422F8 800522F8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 422FC 800522FC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42300 80052300 0800E003 */  jr         $ra
    /* 42304 80052304 00000000 */   nop
endlabel On_SETMAG__FPC4TCmdi
