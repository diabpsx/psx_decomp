.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_SetDBuffer__Fb, 0x294

glabel VID_SetDBuffer__Fb
    /* 74190 80084190 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 74194 80084194 2400BFAF */  sw         $ra, 0x24($sp)
    /* 74198 80084198 2000B2AF */  sw         $s2, 0x20($sp)
    /* 7419C 8008419C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 741A0 800841A0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 741A4 800841A4 480384AF */  sw         $a0, %gp_rel(AddrToAvoid + 0xC)($gp)
    /* 741A8 800841A8 4D008010 */  beqz       $a0, .L800842E0
    /* 741AC 800841AC 21280000 */   addu      $a1, $zero, $zero
    /* 741B0 800841B0 C50E020C */  jal        PRIM_GetCurrentScreen__Fv
    /* 741B4 800841B4 F0001124 */   addiu     $s1, $zero, 0xF0
    /* 741B8 800841B8 1280123C */  lui        $s2, %hi(D_8011CAE0)
    /* 741BC 800841BC E0CA5226 */  addiu      $s2, $s2, %lo(D_8011CAE0)
    /* 741C0 800841C0 21204002 */  addu       $a0, $s2, $zero
    /* 741C4 800841C4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 741C8 800841C8 01004224 */  addiu      $v0, $v0, 0x1
    /* 741CC 800841CC 01004230 */  andi       $v0, $v0, 0x1
    /* 741D0 800841D0 80800200 */  sll        $s0, $v0, 2
    /* 741D4 800841D4 21800202 */  addu       $s0, $s0, $v0
    /* 741D8 800841D8 80811000 */  sll        $s0, $s0, 6
    /* 741DC 800841DC 21280002 */  addu       $a1, $s0, $zero
    /* 741E0 800841E0 21300000 */  addu       $a2, $zero, $zero
    /* 741E4 800841E4 40010724 */  addiu      $a3, $zero, 0x140
    /* 741E8 800841E8 CB4B000C */  jal        SetDefDrawEnv
    /* 741EC 800841EC 1000B1AF */   sw        $s1, 0x10($sp)
    /* 741F0 800841F0 5C004426 */  addiu      $a0, $s2, 0x5C
    /* 741F4 800841F4 21280002 */  addu       $a1, $s0, $zero
    /* 741F8 800841F8 21300000 */  addu       $a2, $zero, $zero
    /* 741FC 800841FC 40010724 */  addiu      $a3, $zero, 0x140
    /* 74200 80084200 F84B000C */  jal        SetDefDispEnv
    /* 74204 80084204 1000B1AF */   sw        $s1, 0x10($sp)
    /* 74208 80084208 70004426 */  addiu      $a0, $s2, 0x70
    /* 7420C 8008420C 21280002 */  addu       $a1, $s0, $zero
    /* 74210 80084210 21300000 */  addu       $a2, $zero, $zero
    /* 74214 80084214 40010724 */  addiu      $a3, $zero, 0x140
    /* 74218 80084218 CB4B000C */  jal        SetDefDrawEnv
    /* 7421C 8008421C 1000B1AF */   sw        $s1, 0x10($sp)
    /* 74220 80084220 CC004426 */  addiu      $a0, $s2, 0xCC
    /* 74224 80084224 21280002 */  addu       $a1, $s0, $zero
    /* 74228 80084228 21300000 */  addu       $a2, $zero, $zero
    /* 7422C 8008422C 40010724 */  addiu      $a3, $zero, 0x140
    /* 74230 80084230 F84B000C */  jal        SetDefDispEnv
    /* 74234 80084234 1000B1AF */   sw        $s1, 0x10($sp)
    /* 74238 80084238 5B10020C */  jal        VID_GetXOff__Fv
    /* 7423C 8008423C 00000000 */   nop
    /* 74240 80084240 1280033C */  lui        $v1, %hi(D_8011CAE8)
    /* 74244 80084244 E8CA6394 */  lhu        $v1, %lo(D_8011CAE8)($v1)
    /* 74248 80084248 00000000 */  nop
    /* 7424C 8008424C 21186200 */  addu       $v1, $v1, $v0
    /* 74250 80084250 1280013C */  lui        $at, %hi(D_8011CAE8)
    /* 74254 80084254 E8CA23A4 */  sh         $v1, %lo(D_8011CAE8)($at)
    /* 74258 80084258 5E10020C */  jal        VID_GetYOff__Fv
    /* 7425C 8008425C 00000000 */   nop
    /* 74260 80084260 1280033C */  lui        $v1, %hi(D_8011CAE8 + 0x2)
    /* 74264 80084264 EACA6394 */  lhu        $v1, %lo(D_8011CAE8 + 0x2)($v1)
    /* 74268 80084268 00000000 */  nop
    /* 7426C 8008426C 21186200 */  addu       $v1, $v1, $v0
    /* 74270 80084270 1280013C */  lui        $at, %hi(D_8011CAE8 + 0x2)
    /* 74274 80084274 EACA23A4 */  sh         $v1, %lo(D_8011CAE8 + 0x2)($at)
    /* 74278 80084278 5B10020C */  jal        VID_GetXOff__Fv
    /* 7427C 8008427C 00000000 */   nop
    /* 74280 80084280 1280033C */  lui        $v1, %hi(D_8011CB58)
    /* 74284 80084284 58CB6394 */  lhu        $v1, %lo(D_8011CB58)($v1)
    /* 74288 80084288 00000000 */  nop
    /* 7428C 8008428C 21186200 */  addu       $v1, $v1, $v0
    /* 74290 80084290 1280013C */  lui        $at, %hi(D_8011CB58)
    /* 74294 80084294 58CB23A4 */  sh         $v1, %lo(D_8011CB58)($at)
    /* 74298 80084298 5E10020C */  jal        VID_GetYOff__Fv
    /* 7429C 8008429C 00000000 */   nop
    /* 742A0 800842A0 1280033C */  lui        $v1, %hi(D_8011CB58 + 0x2)
    /* 742A4 800842A4 5ACB6394 */  lhu        $v1, %lo(D_8011CB58 + 0x2)($v1)
    /* 742A8 800842A8 01000424 */  addiu      $a0, $zero, 0x1
    /* 742AC 800842AC 1280013C */  lui        $at, %hi(D_8011CAF8)
    /* 742B0 800842B0 F8CA20A0 */  sb         $zero, %lo(D_8011CAF8)($at)
    /* 742B4 800842B4 1280013C */  lui        $at, %hi(D_8011CB68)
    /* 742B8 800842B8 68CB20A0 */  sb         $zero, %lo(D_8011CB68)($at)
    /* 742BC 800842BC 1280013C */  lui        $at, %hi(D_8011CAF6)
    /* 742C0 800842C0 F6CA24A0 */  sb         $a0, %lo(D_8011CAF6)($at)
    /* 742C4 800842C4 1280013C */  lui        $at, %hi(D_8011CB66)
    /* 742C8 800842C8 66CB24A0 */  sb         $a0, %lo(D_8011CB66)($at)
    /* 742CC 800842CC 21186200 */  addu       $v1, $v1, $v0
    /* 742D0 800842D0 1280013C */  lui        $at, %hi(D_8011CB58 + 0x2)
    /* 742D4 800842D4 5ACB23A4 */  sh         $v1, %lo(D_8011CB58 + 0x2)($at)
    /* 742D8 800842D8 FA100208 */  j          .L800843E8
    /* 742DC 800842DC 00000000 */   nop
  .L800842E0:
    /* 742E0 800842E0 1280113C */  lui        $s1, %hi(D_8011CAE0)
    /* 742E4 800842E4 E0CA3126 */  addiu      $s1, $s1, %lo(D_8011CAE0)
    /* 742E8 800842E8 21202002 */  addu       $a0, $s1, $zero
    /* 742EC 800842EC 21300000 */  addu       $a2, $zero, $zero
    /* 742F0 800842F0 40010724 */  addiu      $a3, $zero, 0x140
    /* 742F4 800842F4 F0001024 */  addiu      $s0, $zero, 0xF0
    /* 742F8 800842F8 CB4B000C */  jal        SetDefDrawEnv
    /* 742FC 800842FC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 74300 80084300 5C002426 */  addiu      $a0, $s1, 0x5C
    /* 74304 80084304 40010524 */  addiu      $a1, $zero, 0x140
    /* 74308 80084308 21300000 */  addu       $a2, $zero, $zero
    /* 7430C 8008430C 40010724 */  addiu      $a3, $zero, 0x140
    /* 74310 80084310 F84B000C */  jal        SetDefDispEnv
    /* 74314 80084314 1000B0AF */   sw        $s0, 0x10($sp)
    /* 74318 80084318 70002426 */  addiu      $a0, $s1, 0x70
    /* 7431C 8008431C 40010524 */  addiu      $a1, $zero, 0x140
    /* 74320 80084320 21300000 */  addu       $a2, $zero, $zero
    /* 74324 80084324 40010724 */  addiu      $a3, $zero, 0x140
    /* 74328 80084328 CB4B000C */  jal        SetDefDrawEnv
    /* 7432C 8008432C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 74330 80084330 CC002426 */  addiu      $a0, $s1, 0xCC
    /* 74334 80084334 21280000 */  addu       $a1, $zero, $zero
    /* 74338 80084338 21300000 */  addu       $a2, $zero, $zero
    /* 7433C 8008433C 40010724 */  addiu      $a3, $zero, 0x140
    /* 74340 80084340 F84B000C */  jal        SetDefDispEnv
    /* 74344 80084344 1000B0AF */   sw        $s0, 0x10($sp)
    /* 74348 80084348 5B10020C */  jal        VID_GetXOff__Fv
    /* 7434C 8008434C 00000000 */   nop
    /* 74350 80084350 1280033C */  lui        $v1, %hi(D_8011CAE8)
    /* 74354 80084354 E8CA6394 */  lhu        $v1, %lo(D_8011CAE8)($v1)
    /* 74358 80084358 00000000 */  nop
    /* 7435C 8008435C 21186200 */  addu       $v1, $v1, $v0
    /* 74360 80084360 1280013C */  lui        $at, %hi(D_8011CAE8)
    /* 74364 80084364 E8CA23A4 */  sh         $v1, %lo(D_8011CAE8)($at)
    /* 74368 80084368 5E10020C */  jal        VID_GetYOff__Fv
    /* 7436C 8008436C 00000000 */   nop
    /* 74370 80084370 1280033C */  lui        $v1, %hi(D_8011CAE8 + 0x2)
    /* 74374 80084374 EACA6394 */  lhu        $v1, %lo(D_8011CAE8 + 0x2)($v1)
    /* 74378 80084378 00000000 */  nop
    /* 7437C 8008437C 21186200 */  addu       $v1, $v1, $v0
    /* 74380 80084380 1280013C */  lui        $at, %hi(D_8011CAE8 + 0x2)
    /* 74384 80084384 EACA23A4 */  sh         $v1, %lo(D_8011CAE8 + 0x2)($at)
    /* 74388 80084388 5B10020C */  jal        VID_GetXOff__Fv
    /* 7438C 8008438C 00000000 */   nop
    /* 74390 80084390 1280033C */  lui        $v1, %hi(D_8011CB58)
    /* 74394 80084394 58CB6394 */  lhu        $v1, %lo(D_8011CB58)($v1)
    /* 74398 80084398 00000000 */  nop
    /* 7439C 8008439C 21186200 */  addu       $v1, $v1, $v0
    /* 743A0 800843A0 1280013C */  lui        $at, %hi(D_8011CB58)
    /* 743A4 800843A4 58CB23A4 */  sh         $v1, %lo(D_8011CB58)($at)
    /* 743A8 800843A8 5E10020C */  jal        VID_GetYOff__Fv
    /* 743AC 800843AC 00000000 */   nop
    /* 743B0 800843B0 1280043C */  lui        $a0, %hi(D_8011CB58 + 0x2)
    /* 743B4 800843B4 5ACB8494 */  lhu        $a0, %lo(D_8011CB58 + 0x2)($a0)
    /* 743B8 800843B8 01000324 */  addiu      $v1, $zero, 0x1
    /* 743BC 800843BC 1280013C */  lui        $at, %hi(D_8011CAF8)
    /* 743C0 800843C0 F8CA23A0 */  sb         $v1, %lo(D_8011CAF8)($at)
    /* 743C4 800843C4 1280013C */  lui        $at, %hi(D_8011CB68)
    /* 743C8 800843C8 68CB23A0 */  sb         $v1, %lo(D_8011CB68)($at)
    /* 743CC 800843CC 1280013C */  lui        $at, %hi(D_8011CAF6)
    /* 743D0 800843D0 F6CA23A0 */  sb         $v1, %lo(D_8011CAF6)($at)
    /* 743D4 800843D4 1280013C */  lui        $at, %hi(D_8011CB66)
    /* 743D8 800843D8 66CB23A0 */  sb         $v1, %lo(D_8011CB66)($at)
    /* 743DC 800843DC 21208200 */  addu       $a0, $a0, $v0
    /* 743E0 800843E0 1280013C */  lui        $at, %hi(D_8011CB58 + 0x2)
    /* 743E4 800843E4 5ACB24A4 */  sh         $a0, %lo(D_8011CB58 + 0x2)($at)
  .L800843E8:
    /* 743E8 800843E8 1280103C */  lui        $s0, %hi(D_8011CAFC)
    /* 743EC 800843EC FCCA1026 */  addiu      $s0, $s0, %lo(D_8011CAFC)
    /* 743F0 800843F0 21200002 */  addu       $a0, $s0, $zero
    /* 743F4 800843F4 3752000C */  jal        SetDrawEnv
    /* 743F8 800843F8 E4FF0526 */   addiu     $a1, $s0, -0x1C
    /* 743FC 800843FC 70000426 */  addiu      $a0, $s0, 0x70
    /* 74400 80084400 3752000C */  jal        SetDrawEnv
    /* 74404 80084404 54000526 */   addiu     $a1, $s0, 0x54
    /* 74408 80084408 2400BF8F */  lw         $ra, 0x24($sp)
    /* 7440C 8008440C 2000B28F */  lw         $s2, 0x20($sp)
    /* 74410 80084410 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 74414 80084414 1800B08F */  lw         $s0, 0x18($sp)
    /* 74418 80084418 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 7441C 8008441C 0800E003 */  jr         $ra
    /* 74420 80084420 00000000 */   nop
endlabel VID_SetDBuffer__Fb
