.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TestButtons__7GamePad, 0x10C

glabel TestButtons__7GamePad
    /* 6907C 8007907C 5014828F */  lw         $v0, %gp_rel(ignore_buttons)($gp)
    /* 69080 80079080 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 69084 80079084 1400B1AF */  sw         $s1, 0x14($sp)
    /* 69088 80079088 21888000 */  addu       $s1, $a0, $zero
    /* 6908C 8007908C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 69090 80079090 01001024 */  addiu      $s0, $zero, 0x1
    /* 69094 80079094 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 69098 80079098 04004010 */  beqz       $v0, .L800790AC
    /* 6909C 8007909C 1800B2AF */   sw        $s2, 0x18($sp)
    /* 690A0 800790A0 501480AF */  sw         $zero, %gp_rel(ignore_buttons)($gp)
    /* 690A4 800790A4 5BE40108 */  j          .L8007916C
    /* 690A8 800790A8 00000000 */   nop
  .L800790AC:
    /* 690AC 800790AC ABFB010C */  jal        GetFadeState__Fv
    /* 690B0 800790B0 00000000 */   nop
    /* 690B4 800790B4 2D004014 */  bnez       $v0, .L8007916C
    /* 690B8 800790B8 00000000 */   nop
    /* 690BC 800790BC 5800248E */  lw         $a0, 0x58($s1)
    /* 690C0 800790C0 3EEC010C */  jal        GetDown__C4CPad_8007b0f8
    /* 690C4 800790C4 00000000 */   nop
    /* 690C8 800790C8 5800248E */  lw         $a0, 0x58($s1)
    /* 690CC 800790CC 48EC010C */  jal        GetUp__C4CPad
    /* 690D0 800790D0 FF3F5230 */   andi      $s2, $v0, 0x3FFF
  .L800790D4:
    /* 690D4 800790D4 4C002382 */  lb         $v1, 0x4C($s1)
    /* 690D8 800790D8 1280023C */  lui        $v0, %hi(myplr)
    /* 690DC 800790DC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 690E0 800790E0 00000000 */  nop
    /* 690E4 800790E4 21006214 */  bne        $v1, $v0, .L8007916C
    /* 690E8 800790E8 00000000 */   nop
    /* 690EC 800790EC 1280023C */  lui        $v0, %hi(sel_data)
    /* 690F0 800790F0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 690F4 800790F4 00000000 */  nop
    /* 690F8 800790F8 1C006214 */  bne        $v1, $v0, .L8007916C
    /* 690FC 800790FC 24105002 */   and       $v0, $s2, $s0
    /* 69100 80079100 17004010 */  beqz       $v0, .L80079160
    /* 69104 80079104 21202002 */   addu      $a0, $s1, $zero
    /* 69108 80079108 19E3010C */  jal        ButtonDown__7GamePadi
    /* 6910C 8007910C 21280002 */   addu      $a1, $s0, $zero
    /* 69110 80079110 1280023C */  lui        $v0, %hi(invflag)
    /* 69114 80079114 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 69118 80079118 1280033C */  lui        $v1, %hi(stextflag)
    /* 6911C 8007911C E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 69120 80079120 00000000 */  nop
    /* 69124 80079124 25104300 */  or         $v0, $v0, $v1
    /* 69128 80079128 1280033C */  lui        $v1, %hi(qtextflag)
    /* 6912C 8007912C 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 69130 80079130 1280043C */  lui        $a0, %hi(sbookflag)
    /* 69134 80079134 C6B68490 */  lbu        $a0, %lo(sbookflag)($a0)
    /* 69138 80079138 25104300 */  or         $v0, $v0, $v1
    /* 6913C 8007913C 25104400 */  or         $v0, $v0, $a0
    /* 69140 80079140 1280033C */  lui        $v1, %hi(questlog)
    /* 69144 80079144 29BA6390 */  lbu        $v1, %lo(questlog)($v1)
    /* 69148 80079148 1280043C */  lui        $a0, %hi(optionsflag)
    /* 6914C 8007914C 48B2848C */  lw         $a0, %lo(optionsflag)($a0)
    /* 69150 80079150 25104300 */  or         $v0, $v0, $v1
    /* 69154 80079154 25104400 */  or         $v0, $v0, $a0
    /* 69158 80079158 04004014 */  bnez       $v0, .L8007916C
    /* 6915C 8007915C 00000000 */   nop
  .L80079160:
    /* 69160 80079160 40801000 */  sll        $s0, $s0, 1
    /* 69164 80079164 DBFF0016 */  bnez       $s0, .L800790D4
    /* 69168 80079168 00000000 */   nop
  .L8007916C:
    /* 6916C 8007916C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 69170 80079170 1800B28F */  lw         $s2, 0x18($sp)
    /* 69174 80079174 1400B18F */  lw         $s1, 0x14($sp)
    /* 69178 80079178 1000B08F */  lw         $s0, 0x10($sp)
    /* 6917C 8007917C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 69180 80079180 0800E003 */  jr         $ra
    /* 69184 80079184 00000000 */   nop
endlabel TestButtons__7GamePad
