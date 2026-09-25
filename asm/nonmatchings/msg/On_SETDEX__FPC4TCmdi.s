.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SETDEX__FPC4TCmdi, 0x40

glabel On_SETDEX__FPC4TCmdi
    /* 42288 80052288 02008394 */  lhu        $v1, 0x2($a0)
    /* 4228C 8005228C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42290 80052290 EF02622C */  sltiu      $v0, $v1, 0x2EF
    /* 42294 80052294 08004010 */  beqz       $v0, .L800522B8
    /* 42298 80052298 1000BFAF */   sw        $ra, 0x10($sp)
    /* 4229C 8005229C 1280023C */  lui        $v0, %hi(myplr)
    /* 422A0 800522A0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 422A4 800522A4 00000000 */  nop
    /* 422A8 800522A8 0300A210 */  beq        $a1, $v0, .L800522B8
    /* 422AC 800522AC 2120A000 */   addu      $a0, $a1, $zero
    /* 422B0 800522B0 BE98010C */  jal        SetPlrDex__Fii
    /* 422B4 800522B4 21286000 */   addu      $a1, $v1, $zero
  .L800522B8:
    /* 422B8 800522B8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 422BC 800522BC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 422C0 800522C0 0800E003 */  jr         $ra
    /* 422C4 800522C4 00000000 */   nop
endlabel On_SETDEX__FPC4TCmdi
