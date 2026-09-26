.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeNewGameMenuCtrl__Fv, 0x4C

glabel FeNewGameMenuCtrl__Fv
    /* 10B8 8013ACB0 1280023C */  lui        $v0, %hi(qtextflag)
    /* 10BC 8013ACB4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 10C0 8013ACB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10C4 8013ACBC 65004014 */  bnez       $v0, D_8013AE54
    /* 10C8 8013ACC0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 10CC 8013ACC4 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 10D0 8013ACC8 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 10D4 8013ACCC 00000000 */  nop
    /* 10D8 8013ACD0 60004014 */  bnez       $v0, D_8013AE54
    /* 10DC 8013ACD4 00000000 */   nop
    /* 10E0 8013ACD8 1280023C */  lui        $v0, %hi(PauseMode)
    /* 10E4 8013ACDC A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 10E8 8013ACE0 00000000 */  nop
    /* 10EC 8013ACE4 5B004014 */  bnez       $v0, D_8013AE54
    /* 10F0 8013ACE8 21200000 */   addu      $a0, $zero, $zero
    /* 10F4 8013ACEC FD25020C */  jal        PAD_GetPad__FiUc
    /* 10F8 8013ACF0 21280000 */   addu      $a1, $zero, $zero
    /* 10FC 8013ACF4 D1F2040C */  jal        CheckActive__4CPad_8013cb44
    /* 1100 8013ACF8 21204000 */   addu      $a0, $v0, $zero
endlabel FeNewGameMenuCtrl__Fv
