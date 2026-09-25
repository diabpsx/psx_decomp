.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartSPBuy__Fv, 0x1C0

glabel S_StartSPBuy__Fv
    /* 5B210 8006B210 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5B214 8006B214 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5B218 8006B218 21880000 */  addu       $s1, $zero, $zero
    /* 5B21C 8006B21C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5B220 8006B220 21800000 */  addu       $s0, $zero, $zero
    /* 5B224 8006B224 02000224 */  addiu      $v0, $zero, 0x2
    /* 5B228 8006B228 2000BFAF */  sw         $ra, 0x20($sp)
    /* 5B22C 8006B22C 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5B230 8006B230 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
  .L8006B234:
    /* 5B234 8006B234 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5B238 8006B238 00000000 */  nop
    /* 5B23C 8006B23C 80100300 */  sll        $v0, $v1, 2
    /* 5B240 8006B240 21104300 */  addu       $v0, $v0, $v1
    /* 5B244 8006B244 00110200 */  sll        $v0, $v0, 4
    /* 5B248 8006B248 21104300 */  addu       $v0, $v0, $v1
    /* 5B24C 8006B24C C0200200 */  sll        $a0, $v0, 3
    /* 5B250 8006B250 21100402 */  addu       $v0, $s0, $a0
    /* 5B254 8006B254 0E80013C */  lui        $at, %hi(_premiumitem + 0x2C)
    /* 5B258 8006B258 21082200 */  addu       $at, $at, $v0
    /* 5B25C 8006B25C 34F52384 */  lh         $v1, %lo(_premiumitem + 0x2C)($at)
    /* 5B260 8006B260 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5B264 8006B264 18006210 */  beq        $v1, $v0, .L8006B2C8
    /* 5B268 8006B268 00000000 */   nop
    /* 5B26C 8006B26C 0E80053C */  lui        $a1, %hi(_premiumitem)
    /* 5B270 8006B270 08F5A524 */  addiu      $a1, $a1, %lo(_premiumitem)
    /* 5B274 8006B274 21280502 */  addu       $a1, $s0, $a1
    /* 5B278 8006B278 1280023C */  lui        $v0, %hi(options_pad)
    /* 5B27C 8006B27C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 5B280 8006B280 21288500 */  addu       $a1, $a0, $a1
    /* 5B284 8006B284 40200200 */  sll        $a0, $v0, 1
    /* 5B288 8006B288 21208200 */  addu       $a0, $a0, $v0
    /* 5B28C 8006B28C 80200400 */  sll        $a0, $a0, 2
    /* 5B290 8006B290 21208200 */  addu       $a0, $a0, $v0
    /* 5B294 8006B294 00210400 */  sll        $a0, $a0, 4
    /* 5B298 8006B298 23208200 */  subu       $a0, $a0, $v0
    /* 5B29C 8006B29C 80200400 */  sll        $a0, $a0, 2
    /* 5B2A0 8006B2A0 21208200 */  addu       $a0, $a0, $v0
    /* 5B2A4 8006B2A4 C0200400 */  sll        $a0, $a0, 3
    /* 5B2A8 8006B2A8 0E80023C */  lui        $v0, %hi(plr)
    /* 5B2AC 8006B2AC 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 5B2B0 8006B2B0 CAFD000C */  jal        SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 5B2B4 8006B2B4 21208200 */   addu      $a0, $a0, $v0
    /* 5B2B8 8006B2B8 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5B2BC 8006B2BC 00000000 */  nop
    /* 5B2C0 8006B2C0 01004224 */  addiu      $v0, $v0, 0x1
    /* 5B2C4 8006B2C4 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
  .L8006B2C8:
    /* 5B2C8 8006B2C8 01003126 */  addiu      $s1, $s1, 0x1
    /* 5B2CC 8006B2CC 0600222A */  slti       $v0, $s1, 0x6
    /* 5B2D0 8006B2D0 D8FF4014 */  bnez       $v0, .L8006B234
    /* 5B2D4 8006B2D4 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 5B2D8 8006B2D8 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5B2DC 8006B2DC 00000000 */  nop
    /* 5B2E0 8006B2E0 07004014 */  bnez       $v0, .L8006B300
    /* 5B2E4 8006B2E4 00000000 */   nop
    /* 5B2E8 8006B2E8 5BBE010C */  jal        StartStore__Fc
    /* 5B2EC 8006B2EC 01000424 */   addiu     $a0, $zero, 0x1
    /* 5B2F0 8006B2F0 0E000224 */  addiu      $v0, $zero, 0xE
    /* 5B2F4 8006B2F4 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 5B2F8 8006B2F8 EEAC0108 */  j          .L8006B3B8
    /* 5B2FC 8006B2FC 21100000 */   addu      $v0, $zero, $zero
  .L8006B300:
    /* 5B300 8006B300 01000224 */  addiu      $v0, $zero, 0x1
    /* 5B304 8006B304 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5B308 8006B308 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5B30C 8006B30C 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5B310 8006B310 4AED010C */  jal        GetStr__Fi
    /* 5B314 8006B314 29020424 */   addiu     $a0, $zero, 0x229
    /* 5B318 8006B318 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5B31C 8006B31C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5B320 8006B320 1280053C */  lui        $a1, %hi(myplr)
    /* 5B324 8006B324 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5B328 8006B328 21200002 */  addu       $a0, $s0, $zero
    /* 5B32C 8006B32C 40180500 */  sll        $v1, $a1, 1
    /* 5B330 8006B330 21186500 */  addu       $v1, $v1, $a1
    /* 5B334 8006B334 80180300 */  sll        $v1, $v1, 2
    /* 5B338 8006B338 21186500 */  addu       $v1, $v1, $a1
    /* 5B33C 8006B33C 00190300 */  sll        $v1, $v1, 4
    /* 5B340 8006B340 23186500 */  subu       $v1, $v1, $a1
    /* 5B344 8006B344 80180300 */  sll        $v1, $v1, 2
    /* 5B348 8006B348 21186500 */  addu       $v1, $v1, $a1
    /* 5B34C 8006B34C C0180300 */  sll        $v1, $v1, 3
    /* 5B350 8006B350 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5B354 8006B354 21082300 */  addu       $at, $at, $v1
    /* 5B358 8006B358 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5B35C 8006B35C 9767000C */  jal        sprintf
    /* 5B360 8006B360 21284000 */   addu      $a1, $v0, $zero
    /* 5B364 8006B364 21200000 */  addu       $a0, $zero, $zero
    /* 5B368 8006B368 01000524 */  addiu      $a1, $zero, 0x1
    /* 5B36C 8006B36C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5B370 8006B370 03000224 */  addiu      $v0, $zero, 0x3
    /* 5B374 8006B374 21380002 */  addu       $a3, $s0, $zero
    /* 5B378 8006B378 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5B37C 8006B37C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5B380 8006B380 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5B384 8006B384 5CA7010C */  jal        AddSLine__Fi
    /* 5B388 8006B388 02000424 */   addiu     $a0, $zero, 0x2
    /* 5B38C 8006B38C 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5B390 8006B390 00000000 */  nop
    /* 5B394 8006B394 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 5B398 8006B398 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5B39C 8006B39C 02004104 */  bgez       $v0, .L8006B3A8
    /* 5B3A0 8006B3A0 00000000 */   nop
    /* 5B3A4 8006B3A4 182180AF */  sw         $zero, %gp_rel(D_8011C898)($gp)
  .L8006B3A8:
    /* 5B3A8 8006B3A8 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5B3AC 8006B3AC ECAB010C */  jal        S_ScrollSPBuy__Fi
    /* 5B3B0 8006B3B0 00000000 */   nop
    /* 5B3B4 8006B3B4 01000224 */  addiu      $v0, $zero, 0x1
  .L8006B3B8:
    /* 5B3B8 8006B3B8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 5B3BC 8006B3BC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5B3C0 8006B3C0 1800B08F */  lw         $s0, 0x18($sp)
    /* 5B3C4 8006B3C4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 5B3C8 8006B3C8 0800E003 */  jr         $ra
    /* 5B3CC 8006B3CC 00000000 */   nop
endlabel S_StartSPBuy__Fv
