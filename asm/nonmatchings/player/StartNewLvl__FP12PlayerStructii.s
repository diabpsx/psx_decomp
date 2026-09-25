.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartNewLvl__FP12PlayerStructii, 0x1B4

glabel StartNewLvl__FP12PlayerStructii
    /* 521EC 800621EC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 521F0 800621F0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 521F4 800621F4 21888000 */  addu       $s1, $a0, $zero
    /* 521F8 800621F8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 521FC 800621FC 2198A000 */  addu       $s3, $a1, $zero
    /* 52200 80062200 2400BFAF */  sw         $ra, 0x24($sp)
    /* 52204 80062204 2000B4AF */  sw         $s4, 0x20($sp)
    /* 52208 80062208 1800B2AF */  sw         $s2, 0x18($sp)
    /* 5220C 8006220C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 52210 80062210 1D002292 */  lbu        $v0, 0x1D($s1)
    /* 52214 80062214 00000000 */  nop
    /* 52218 80062218 58004010 */  beqz       $v0, .L8006237C
    /* 5221C 8006221C 2190C000 */   addu      $s2, $a2, $zero
    /* 52220 80062220 6688010C */  jal        CheckPlrDead__Fi
    /* 52224 80062224 21200000 */   addu      $a0, $zero, $zero
    /* 52228 80062228 6688010C */  jal        CheckPlrDead__Fi
    /* 5222C 8006222C 01000424 */   addiu     $a0, $zero, 0x1
    /* 52230 80062230 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 52234 80062234 21200000 */   addu      $a0, $zero, $zero
    /* 52238 80062238 A0EB010C */  jal        InitGamePadVars__Fv
    /* 5223C 8006223C 21A04000 */   addu      $s4, $v0, $zero
    /* 52240 80062240 0E80103C */  lui        $s0, %hi(plr)
    /* 52244 80062244 38A51026 */  addiu      $s0, $s0, %lo(plr)
    /* 52248 80062248 3A88010C */  jal        InitLevelChange__FP12PlayerStruct
    /* 5224C 8006224C 21200002 */   addu      $a0, $s0, $zero
    /* 52250 80062250 3A88010C */  jal        InitLevelChange__FP12PlayerStruct
    /* 52254 80062254 E8190426 */   addiu     $a0, $s0, 0x19E8
    /* 52258 80062258 BEFF6326 */  addiu      $v1, $s3, -0x42
    /* 5225C 8006225C 0B00622C */  sltiu      $v0, $v1, 0xB
    /* 52260 80062260 37004010 */  beqz       $v0, .L80062340
    /* 52264 80062264 80100300 */   sll       $v0, $v1, 2
    /* 52268 80062268 1180013C */  lui        $at, %hi(jtbl_801177AC)
    /* 5226C 8006226C 21082200 */  addu       $at, $at, $v0
    /* 52270 80062270 AC77228C */  lw         $v0, %lo(jtbl_801177AC)($at)
    /* 52274 80062274 00000000 */  nop
    /* 52278 80062278 08004000 */  jr         $v0
    /* 5227C 8006227C 00000000 */   nop
  jlabel .L80062280
    /* 52280 80062280 01000524 */  addiu      $a1, $zero, 0x1
    /* 52284 80062284 8812838F */  lw         $v1, %gp_rel(myplr)($gp)
    /* 52288 80062288 1280043C */  lui        $a0, %hi(leveltype)
    /* 5228C 8006228C 0DC18490 */  lbu        $a0, %lo(leveltype)($a0)
    /* 52290 80062290 40100300 */  sll        $v0, $v1, 1
    /* 52294 80062294 21104300 */  addu       $v0, $v0, $v1
    /* 52298 80062298 80100200 */  sll        $v0, $v0, 2
    /* 5229C 8006229C 21104300 */  addu       $v0, $v0, $v1
    /* 522A0 800622A0 00110200 */  sll        $v0, $v0, 4
    /* 522A4 800622A4 23104300 */  subu       $v0, $v0, $v1
    /* 522A8 800622A8 80100200 */  sll        $v0, $v0, 2
    /* 522AC 800622AC 21104300 */  addu       $v0, $v0, $v1
    /* 522B0 800622B0 C0100200 */  sll        $v0, $v0, 3
    /* 522B4 800622B4 FEFF8424 */  addiu      $a0, $a0, -0x2
    /* 522B8 800622B8 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 522BC 800622BC 21082200 */  addu       $at, $at, $v0
    /* 522C0 800622C0 18BF2390 */  lbu        $v1, %lo(plr + 0x19E0)($at)
    /* 522C4 800622C4 04208500 */  sllv       $a0, $a1, $a0
    /* 522C8 800622C8 25186400 */  or         $v1, $v1, $a0
    /* 522CC 800622CC 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 522D0 800622D0 21082200 */  addu       $at, $at, $v0
    /* 522D4 800622D4 18BF23A0 */  sb         $v1, %lo(plr + 0x19E0)($at)
    /* 522D8 800622D8 8812838F */  lw         $v1, %gp_rel(myplr)($gp)
    /* 522DC 800622DC 1280043C */  lui        $a0, %hi(leveltype)
    /* 522E0 800622E0 0DC18490 */  lbu        $a0, %lo(leveltype)($a0)
    /* 522E4 800622E4 01006338 */  xori       $v1, $v1, 0x1
    /* 522E8 800622E8 40100300 */  sll        $v0, $v1, 1
    /* 522EC 800622EC 21104300 */  addu       $v0, $v0, $v1
    /* 522F0 800622F0 80100200 */  sll        $v0, $v0, 2
    /* 522F4 800622F4 21104300 */  addu       $v0, $v0, $v1
    /* 522F8 800622F8 00110200 */  sll        $v0, $v0, 4
    /* 522FC 800622FC 23104300 */  subu       $v0, $v0, $v1
    /* 52300 80062300 80100200 */  sll        $v0, $v0, 2
    /* 52304 80062304 21104300 */  addu       $v0, $v0, $v1
    /* 52308 80062308 C0100200 */  sll        $v0, $v0, 3
    /* 5230C 8006230C FEFF8424 */  addiu      $a0, $a0, -0x2
    /* 52310 80062310 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 52314 80062314 21082200 */  addu       $at, $at, $v0
    /* 52318 80062318 18BF2390 */  lbu        $v1, %lo(plr + 0x19E0)($at)
    /* 5231C 8006231C 04288500 */  sllv       $a1, $a1, $a0
    /* 52320 80062320 25186500 */  or         $v1, $v1, $a1
    /* 52324 80062324 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 52328 80062328 21082200 */  addu       $at, $at, $v0
    /* 5232C 8006232C 18BF23A0 */  sb         $v1, %lo(plr + 0x19E0)($at)
  jlabel .L80062330
    /* 52330 80062330 D0880108 */  j          .L80062340
    /* 52334 80062334 240032AE */   sw        $s2, 0x24($s1)
  jlabel .L80062338
    /* 52338 80062338 1280013C */  lui        $at, %hi(setlvlnum)
    /* 5233C 8006233C 0FC132A0 */  sb         $s2, %lo(setlvlnum)($at)
  jlabel .L80062340
    /* 52340 80062340 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 52344 80062344 21202002 */   addu      $a0, $s1, $zero
    /* 52348 80062348 0A004010 */  beqz       $v0, .L80062374
    /* 5234C 8006234C 01000224 */   addiu     $v0, $zero, 0x1
    /* 52350 80062350 D30022A2 */  sb         $v0, 0xD3($s1)
    /* 52354 80062354 0A000224 */  addiu      $v0, $zero, 0xA
    /* 52358 80062358 21286002 */  addu       $a1, $s3, $zero
    /* 5235C 8006235C 21300000 */  addu       $a2, $zero, $zero
    /* 52360 80062360 1280043C */  lui        $a0, %hi(ghMainWnd)
    /* 52364 80062364 88B7848C */  lw         $a0, %lo(ghMainWnd)($a0)
    /* 52368 80062368 21380000 */  addu       $a3, $zero, $zero
    /* 5236C 8006236C 95EC010C */  jal        GRL_PostMessage__FUlUilUl
    /* 52370 80062370 000022AE */   sw        $v0, 0x0($s1)
  .L80062374:
    /* 52374 80062374 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 52378 80062378 21208002 */   addu      $a0, $s4, $zero
  .L8006237C:
    /* 5237C 8006237C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 52380 80062380 2000B48F */  lw         $s4, 0x20($sp)
    /* 52384 80062384 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 52388 80062388 1800B28F */  lw         $s2, 0x18($sp)
    /* 5238C 8006238C 1400B18F */  lw         $s1, 0x14($sp)
    /* 52390 80062390 1000B08F */  lw         $s0, 0x10($sp)
    /* 52394 80062394 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 52398 80062398 0800E003 */  jr         $ra
    /* 5239C 8006239C 00000000 */   nop
endlabel StartNewLvl__FP12PlayerStructii
