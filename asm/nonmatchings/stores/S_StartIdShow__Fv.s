.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartIdShow__Fv, 0x1D8

glabel S_StartIdShow__Fv
    /* 5F2C4 8006F2C4 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 5F2C8 8006F2C8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5F2CC 8006F2CC 2400BFAF */  sw         $ra, 0x24($sp)
    /* 5F2D0 8006F2D0 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5F2D4 8006F2D4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5F2D8 8006F2D8 5BBE010C */  jal        StartStore__Fc
    /* 5F2DC 8006F2DC 1800B0AF */   sw        $s0, 0x18($sp)
    /* 5F2E0 8006F2E0 05000424 */  addiu      $a0, $zero, 0x5
    /* 5F2E4 8006F2E4 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5F2E8 8006F2E8 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5F2EC 8006F2EC 36A7010C */  jal        ClearSText__Fii
    /* 5F2F0 8006F2F0 17000524 */   addiu     $a1, $zero, 0x17
    /* 5F2F4 8006F2F4 1280033C */  lui        $v1, %hi(myplr)
    /* 5F2F8 8006F2F8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5F2FC 8006F2FC 00000000 */  nop
    /* 5F300 8006F300 40100300 */  sll        $v0, $v1, 1
    /* 5F304 8006F304 21104300 */  addu       $v0, $v0, $v1
    /* 5F308 8006F308 80100200 */  sll        $v0, $v0, 2
    /* 5F30C 8006F30C 21104300 */  addu       $v0, $v0, $v1
    /* 5F310 8006F310 00110200 */  sll        $v0, $v0, 4
    /* 5F314 8006F314 23104300 */  subu       $v0, $v0, $v1
    /* 5F318 8006F318 80100200 */  sll        $v0, $v0, 2
    /* 5F31C 8006F31C 21104300 */  addu       $v0, $v0, $v1
    /* 5F320 8006F320 C0100200 */  sll        $v0, $v0, 3
    /* 5F324 8006F324 0E80013C */  lui        $at, %hi(plr + 0x1961)
    /* 5F328 8006F328 21082200 */  addu       $at, $at, $v0
    /* 5F32C 8006F32C 99BE2480 */  lb         $a0, %lo(plr + 0x1961)($at)
    /* 5F330 8006F330 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 5F334 8006F334 21082200 */  addu       $at, $at, $v0
    /* 5F338 8006F338 AEBE2280 */  lb         $v0, %lo(plr + 0x1976)($at)
    /* 5F33C 8006F33C 2B180400 */  sltu       $v1, $zero, $a0
    /* 5F340 8006F340 02004014 */  bnez       $v0, .L8006F34C
    /* 5F344 8006F344 21886000 */   addu      $s1, $v1, $zero
    /* 5F348 8006F348 02001124 */  addiu      $s1, $zero, 0x2
  .L8006F34C:
    /* 5F34C 8006F34C 02000224 */  addiu      $v0, $zero, 0x2
    /* 5F350 8006F350 02008214 */  bne        $a0, $v0, .L8006F35C
    /* 5F354 8006F354 00000000 */   nop
    /* 5F358 8006F358 03001124 */  addiu      $s1, $zero, 0x3
  .L8006F35C:
    /* 5F35C 8006F35C 4AED010C */  jal        GetStr__Fi
    /* 5F360 8006F360 83040424 */   addiu     $a0, $zero, 0x483
    /* 5F364 8006F364 21200000 */  addu       $a0, $zero, $zero
    /* 5F368 8006F368 05000524 */  addiu      $a1, $zero, 0x5
    /* 5F36C 8006F36C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F370 8006F370 21384000 */  addu       $a3, $v0, $zero
    /* 5F374 8006F374 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5F378 8006F378 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F37C 8006F37C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F380 8006F380 00010624 */  addiu      $a2, $zero, 0x100
    /* 5F384 8006F384 1280023C */  lui        $v0, %hi(myplr)
    /* 5F388 8006F388 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5F38C 8006F38C 0E80123C */  lui        $s2, %hi(plr + 0x1910)
    /* 5F390 8006F390 48BE5226 */  addiu      $s2, $s2, %lo(plr + 0x1910)
    /* 5F394 8006F394 40200200 */  sll        $a0, $v0, 1
    /* 5F398 8006F398 21208200 */  addu       $a0, $a0, $v0
    /* 5F39C 8006F39C 80200400 */  sll        $a0, $a0, 2
    /* 5F3A0 8006F3A0 21208200 */  addu       $a0, $a0, $v0
    /* 5F3A4 8006F3A4 00210400 */  sll        $a0, $a0, 4
    /* 5F3A8 8006F3A8 23208200 */  subu       $a0, $a0, $v0
    /* 5F3AC 8006F3AC 80200400 */  sll        $a0, $a0, 2
    /* 5F3B0 8006F3B0 21208200 */  addu       $a0, $a0, $v0
    /* 5F3B4 8006F3B4 C0200400 */  sll        $a0, $a0, 3
    /* 5F3B8 8006F3B8 0E80013C */  lui        $at, %hi(plr + 0x1938)
    /* 5F3BC 8006F3BC 21082400 */  addu       $at, $at, $a0
    /* 5F3C0 8006F3C0 70BE2594 */  lhu        $a1, %lo(plr + 0x1938)($at)
    /* 5F3C4 8006F3C4 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5F3C8 8006F3C8 21209200 */   addu      $a0, $a0, $s2
    /* 5F3CC 8006F3CC 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5F3D0 8006F3D0 08000524 */  addiu      $a1, $zero, 0x8
    /* 5F3D4 8006F3D4 21300000 */  addu       $a2, $zero, $zero
    /* 5F3D8 8006F3D8 21804000 */  addu       $s0, $v0, $zero
    /* 5F3DC 8006F3DC 21380002 */  addu       $a3, $s0, $zero
    /* 5F3E0 8006F3E0 1000B1AF */  sw         $s1, 0x10($sp)
    /* 5F3E4 8006F3E4 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F3E8 8006F3E8 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F3EC 8006F3EC 08000424 */  addiu      $a0, $zero, 0x8
    /* 5F3F0 8006F3F0 70A7010C */  jal        AddSTextVal__Fii
    /* 5F3F4 8006F3F4 21280000 */   addu      $a1, $zero, $zero
    /* 5F3F8 8006F3F8 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5F3FC 8006F3FC D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5F400 8006F400 1280063C */  lui        $a2, %hi(D_8011C8BC)
    /* 5F404 8006F404 BCC8C624 */  addiu      $a2, $a2, %lo(D_8011C8BC)
    /* 5F408 8006F408 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 5F40C 8006F40C 21280002 */   addu      $a1, $s0, $zero
    /* 5F410 8006F410 08004524 */  addiu      $a1, $v0, 0x8
    /* 5F414 8006F414 1280023C */  lui        $v0, %hi(myplr)
    /* 5F418 8006F418 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5F41C 8006F41C 21302002 */  addu       $a2, $s1, $zero
    /* 5F420 8006F420 40200200 */  sll        $a0, $v0, 1
    /* 5F424 8006F424 21208200 */  addu       $a0, $a0, $v0
    /* 5F428 8006F428 80200400 */  sll        $a0, $a0, 2
    /* 5F42C 8006F42C 21208200 */  addu       $a0, $a0, $v0
    /* 5F430 8006F430 00210400 */  sll        $a0, $a0, 4
    /* 5F434 8006F434 23208200 */  subu       $a0, $a0, $v0
    /* 5F438 8006F438 80200400 */  sll        $a0, $a0, 2
    /* 5F43C 8006F43C 21208200 */  addu       $a0, $a0, $v0
    /* 5F440 8006F440 C0200400 */  sll        $a0, $a0, 3
    /* 5F444 8006F444 B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5F448 8006F448 21209200 */   addu      $a0, $a0, $s2
    /* 5F44C 8006F44C 4AED010C */  jal        GetStr__Fi
    /* 5F450 8006F450 08010424 */   addiu     $a0, $zero, 0x108
    /* 5F454 8006F454 21200000 */  addu       $a0, $zero, $zero
    /* 5F458 8006F458 0F000524 */  addiu      $a1, $zero, 0xF
    /* 5F45C 8006F45C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F460 8006F460 21384000 */  addu       $a3, $v0, $zero
    /* 5F464 8006F464 01000224 */  addiu      $v0, $zero, 0x1
    /* 5F468 8006F468 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5F46C 8006F46C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F470 8006F470 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5F474 8006F474 01000424 */  addiu      $a0, $zero, 0x1
    /* 5F478 8006F478 7AA7010C */  jal        OffsetSTextY__Fii
    /* 5F47C 8006F47C FCFF0524 */   addiu     $a1, $zero, -0x4
    /* 5F480 8006F480 2400BF8F */  lw         $ra, 0x24($sp)
    /* 5F484 8006F484 2000B28F */  lw         $s2, 0x20($sp)
    /* 5F488 8006F488 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5F48C 8006F48C 1800B08F */  lw         $s0, 0x18($sp)
    /* 5F490 8006F490 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 5F494 8006F494 0800E003 */  jr         $ra
    /* 5F498 8006F498 00000000 */   nop
endlabel S_StartIdShow__Fv
