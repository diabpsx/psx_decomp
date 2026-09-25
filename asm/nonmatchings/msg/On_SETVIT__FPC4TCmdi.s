.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SETVIT__FPC4TCmdi, 0x40

glabel On_SETVIT__FPC4TCmdi
    /* 42308 80052308 02008394 */  lhu        $v1, 0x2($a0)
    /* 4230C 8005230C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42310 80052310 EF02622C */  sltiu      $v0, $v1, 0x2EF
    /* 42314 80052314 08004010 */  beqz       $v0, .L80052338
    /* 42318 80052318 1000BFAF */   sw        $ra, 0x10($sp)
    /* 4231C 8005231C 1280023C */  lui        $v0, %hi(myplr)
    /* 42320 80052320 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 42324 80052324 00000000 */  nop
    /* 42328 80052328 0300A210 */  beq        $a1, $v0, .L80052338
    /* 4232C 8005232C 2120A000 */   addu      $a0, $a1, $zero
    /* 42330 80052330 F598010C */  jal        SetPlrVit__Fii
    /* 42334 80052334 21286000 */   addu      $a1, $v1, $zero
  .L80052338:
    /* 42338 80052338 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4233C 8005233C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42340 80052340 0800E003 */  jr         $ra
    /* 42344 80052344 00000000 */   nop
endlabel On_SETVIT__FPC4TCmdi
