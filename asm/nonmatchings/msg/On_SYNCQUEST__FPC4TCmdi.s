.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SYNCQUEST__FPC4TCmdi, 0x48

glabel On_SYNCQUEST__FPC4TCmdi
    /* 42348 80052348 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4234C 8005234C 1280023C */  lui        $v0, %hi(myplr)
    /* 42350 80052350 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 42354 80052354 21188000 */  addu       $v1, $a0, $zero
    /* 42358 80052358 0700A210 */  beq        $a1, $v0, .L80052378
    /* 4235C 8005235C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 42360 80052360 01006490 */  lbu        $a0, 0x1($v1)
    /* 42364 80052364 02006590 */  lbu        $a1, 0x2($v1)
    /* 42368 80052368 03006690 */  lbu        $a2, 0x3($v1)
    /* 4236C 8005236C 04006790 */  lbu        $a3, 0x4($v1)
    /* 42370 80052370 5BA4010C */  jal        SetMultiQuest__FiiUci
    /* 42374 80052374 00000000 */   nop
  .L80052378:
    /* 42378 80052378 01000224 */  addiu      $v0, $zero, 0x1
    /* 4237C 8005237C B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 42380 80052380 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42384 80052384 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42388 80052388 0800E003 */  jr         $ra
    /* 4238C 8005238C 00000000 */   nop
endlabel On_SYNCQUEST__FPC4TCmdi
