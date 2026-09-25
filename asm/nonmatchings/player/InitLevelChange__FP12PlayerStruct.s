.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLevelChange__FP12PlayerStruct, 0xB0

glabel InitLevelChange__FP12PlayerStruct
    /* 520E8 800620E8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 520EC 800620EC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 520F0 800620F0 21888000 */  addu       $s1, $a0, $zero
    /* 520F4 800620F4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 520F8 800620F8 7487010C */  jal        RemovePlrMissiles__FP12PlayerStruct
    /* 520FC 800620FC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 52100 80062100 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 52104 80062104 21202002 */   addu      $a0, $s1, $zero
    /* 52108 80062108 0C004010 */  beqz       $v0, .L8006213C
    /* 5210C 8006210C 00000000 */   nop
    /* 52110 80062110 1280023C */  lui        $v0, %hi(qtextflag)
    /* 52114 80062114 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 52118 80062118 00000000 */  nop
    /* 5211C 8006211C 07004010 */  beqz       $v0, .L8006213C
    /* 52120 80062120 00000000 */   nop
    /* 52124 80062124 69ED010C */  jal        LANG_ReloadMainTXT__Fv
    /* 52128 80062128 00000000 */   nop
    /* 5212C 8006212C 1280013C */  lui        $at, %hi(qtextflag)
    /* 52130 80062130 60B920A0 */  sb         $zero, %lo(qtextflag)($at)
    /* 52134 80062134 D7F3000C */  jal        stream_stop__Fv
    /* 52138 80062138 00000000 */   nop
  .L8006213C:
    /* 5213C 8006213C BD84010C */  jal        RemovePlrFromMap__FP12PlayerStruct
    /* 52140 80062140 21202002 */   addu      $a0, $s1, $zero
    /* 52144 80062144 7F83010C */  jal        SetPlayerOld__FP12PlayerStruct
    /* 52148 80062148 21202002 */   addu      $a0, $s1, $zero
    /* 5214C 8006214C 21202002 */  addu       $a0, $s1, $zero
    /* 52150 80062150 2400228E */  lw         $v0, 0x24($s1)
    /* 52154 80062154 01001024 */  addiu      $s0, $zero, 0x1
    /* 52158 80062158 21102202 */  addu       $v0, $s1, $v0
    /* 5215C 8006215C 1395010C */  jal        ClrPlrPath__FP12PlayerStruct
    /* 52160 80062160 660150A0 */   sb        $s0, 0x166($v0)
    /* 52164 80062164 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 52168 80062168 0A000224 */  addiu      $v0, $zero, 0xA
    /* 5216C 8006216C 1E0023A2 */  sb         $v1, 0x1E($s1)
    /* 52170 80062170 D50030A2 */  sb         $s0, 0xD5($s1)
    /* 52174 80062174 E21922A2 */  sb         $v0, 0x19E2($s1)
    /* 52178 80062178 1280013C */  lui        $at, %hi(visible_level)
    /* 5217C 8006217C A8B023A0 */  sb         $v1, %lo(visible_level)($at)
    /* 52180 80062180 1800BF8F */  lw         $ra, 0x18($sp)
    /* 52184 80062184 1400B18F */  lw         $s1, 0x14($sp)
    /* 52188 80062188 1000B08F */  lw         $s0, 0x10($sp)
    /* 5218C 8006218C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 52190 80062190 0800E003 */  jr         $ra
    /* 52194 80062194 00000000 */   nop
endlabel InitLevelChange__FP12PlayerStruct
