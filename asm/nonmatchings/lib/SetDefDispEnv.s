.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDefDispEnv, 0x3C

glabel SetDefDispEnv
    /* 2FE0 80012FE0 1000A38F */  lw         $v1, 0x10($sp)
    /* 2FE4 80012FE4 21108000 */  addu       $v0, $a0, $zero
    /* 2FE8 80012FE8 000045A4 */  sh         $a1, 0x0($v0)
    /* 2FEC 80012FEC 020046A4 */  sh         $a2, 0x2($v0)
    /* 2FF0 80012FF0 040047A4 */  sh         $a3, 0x4($v0)
    /* 2FF4 80012FF4 080040A4 */  sh         $zero, 0x8($v0)
    /* 2FF8 80012FF8 0A0040A4 */  sh         $zero, 0xA($v0)
    /* 2FFC 80012FFC 0C0040A4 */  sh         $zero, 0xC($v0)
    /* 3000 80013000 0E0040A4 */  sh         $zero, 0xE($v0)
    /* 3004 80013004 110040A0 */  sb         $zero, 0x11($v0)
    /* 3008 80013008 100040A0 */  sb         $zero, 0x10($v0)
    /* 300C 8001300C 130040A0 */  sb         $zero, 0x13($v0)
    /* 3010 80013010 120040A0 */  sb         $zero, 0x12($v0)
    /* 3014 80013014 0800E003 */  jr         $ra
    /* 3018 80013018 060043A4 */   sh        $v1, 0x6($v0)
endlabel SetDefDispEnv
