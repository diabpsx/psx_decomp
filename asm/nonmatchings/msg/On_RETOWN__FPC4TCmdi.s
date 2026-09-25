.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_RETOWN__FPC4TCmdi, 0x38

glabel On_RETOWN__FPC4TCmdi
    /* 42210 80052210 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42214 80052214 1280023C */  lui        $v0, %hi(myplr)
    /* 42218 80052218 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4221C 8005221C 2120A000 */  addu       $a0, $a1, $zero
    /* 42220 80052220 03008214 */  bne        $a0, $v0, .L80052230
    /* 42224 80052224 1000BFAF */   sw        $ra, 0x10($sp)
    /* 42228 80052228 1280013C */  lui        $at, %hi(deathflag)
    /* 4222C 8005222C 0CBA20A0 */  sb         $zero, %lo(deathflag)($at)
  .L80052230:
    /* 42230 80052230 BB9C010C */  jal        RestartTownLvl__Fi
    /* 42234 80052234 00000000 */   nop
    /* 42238 80052238 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4223C 8005223C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42240 80052240 0800E003 */  jr         $ra
    /* 42244 80052244 00000000 */   nop
endlabel On_RETOWN__FPC4TCmdi
