.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartHBuy__Fv, 0x138

glabel S_StartHBuy__Fv
    /* 5E4EC 8006E4EC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5E4F0 8006E4F0 01000224 */  addiu      $v0, $zero, 0x1
    /* 5E4F4 8006E4F4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5E4F8 8006E4F8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5E4FC 8006E4FC 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5E500 8006E500 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5E504 8006E504 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5E508 8006E508 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5E50C 8006E50C 4AED010C */  jal        GetStr__Fi
    /* 5E510 8006E510 28020424 */   addiu     $a0, $zero, 0x228
    /* 5E514 8006E514 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5E518 8006E518 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5E51C 8006E51C 1280053C */  lui        $a1, %hi(myplr)
    /* 5E520 8006E520 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5E524 8006E524 21200002 */  addu       $a0, $s0, $zero
    /* 5E528 8006E528 40180500 */  sll        $v1, $a1, 1
    /* 5E52C 8006E52C 21186500 */  addu       $v1, $v1, $a1
    /* 5E530 8006E530 80180300 */  sll        $v1, $v1, 2
    /* 5E534 8006E534 21186500 */  addu       $v1, $v1, $a1
    /* 5E538 8006E538 00190300 */  sll        $v1, $v1, 4
    /* 5E53C 8006E53C 23186500 */  subu       $v1, $v1, $a1
    /* 5E540 8006E540 80180300 */  sll        $v1, $v1, 2
    /* 5E544 8006E544 21186500 */  addu       $v1, $v1, $a1
    /* 5E548 8006E548 C0180300 */  sll        $v1, $v1, 3
    /* 5E54C 8006E54C 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5E550 8006E550 21082300 */  addu       $at, $at, $v1
    /* 5E554 8006E554 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5E558 8006E558 9767000C */  jal        sprintf
    /* 5E55C 8006E55C 21284000 */   addu      $a1, $v0, $zero
    /* 5E560 8006E560 21200000 */  addu       $a0, $zero, $zero
    /* 5E564 8006E564 01000524 */  addiu      $a1, $zero, 0x1
    /* 5E568 8006E568 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E56C 8006E56C 03000224 */  addiu      $v0, $zero, 0x3
    /* 5E570 8006E570 21380002 */  addu       $a3, $s0, $zero
    /* 5E574 8006E574 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5E578 8006E578 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E57C 8006E57C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5E580 8006E580 5CA7010C */  jal        AddSLine__Fi
    /* 5E584 8006E584 02000424 */   addiu     $a0, $zero, 0x2
    /* 5E588 8006E588 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5E58C 8006E58C C1B8010C */  jal        S_ScrollHBuy__Fi
    /* 5E590 8006E590 00000000 */   nop
    /* 5E594 8006E594 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5E598 8006E598 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
    /* 5E59C 8006E59C 00110300 */  sll        $v0, $v1, 4
    /* 5E5A0 8006E5A0 21104300 */  addu       $v0, $v0, $v1
    /* 5E5A4 8006E5A4 C0100200 */  sll        $v0, $v0, 3
    /* 5E5A8 8006E5A8 23104300 */  subu       $v0, $v0, $v1
    /* 5E5AC 8006E5AC 00210200 */  sll        $a0, $v0, 4
    /* 5E5B0 8006E5B0 0E80013C */  lui        $at, %hi(_healitem + 0x2C)
    /* 5E5B4 8006E5B4 21082400 */  addu       $at, $at, $a0
    /* 5E5B8 8006E5B8 FC0B2384 */  lh         $v1, %lo(_healitem + 0x2C)($at)
    /* 5E5BC 8006E5BC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5E5C0 8006E5C0 0C006210 */  beq        $v1, $v0, .L8006E5F4
    /* 5E5C4 8006E5C4 00000000 */   nop
    /* 5E5C8 8006E5C8 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 5E5CC 8006E5CC 6C008424 */  addiu      $a0, $a0, 0x6C
  .L8006E5D0:
    /* 5E5D0 8006E5D0 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5E5D4 8006E5D4 0E80013C */  lui        $at, %hi(_healitem + 0x2C)
    /* 5E5D8 8006E5D8 21082400 */  addu       $at, $at, $a0
    /* 5E5DC 8006E5DC FC0B2384 */  lh         $v1, %lo(_healitem + 0x2C)($at)
    /* 5E5E0 8006E5E0 01004224 */  addiu      $v0, $v0, 0x1
    /* 5E5E4 8006E5E4 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5E5E8 8006E5E8 F9FF6514 */  bne        $v1, $a1, .L8006E5D0
    /* 5E5EC 8006E5EC 6C008424 */   addiu     $a0, $a0, 0x6C
    /* 5E5F0 8006E5F0 94FF8424 */  addiu      $a0, $a0, -0x6C
  .L8006E5F4:
    /* 5E5F4 8006E5F4 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5E5F8 8006E5F8 00000000 */  nop
    /* 5E5FC 8006E5FC FDFF4224 */  addiu      $v0, $v0, -0x3
    /* 5E600 8006E600 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5E604 8006E604 02004104 */  bgez       $v0, .L8006E610
    /* 5E608 8006E608 00000000 */   nop
    /* 5E60C 8006E60C 182180AF */  sw         $zero, %gp_rel(D_8011C898)($gp)
  .L8006E610:
    /* 5E610 8006E610 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5E614 8006E614 1800B08F */  lw         $s0, 0x18($sp)
    /* 5E618 8006E618 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5E61C 8006E61C 0800E003 */  jr         $ra
    /* 5E620 8006E620 00000000 */   nop
endlabel S_StartHBuy__Fv
