.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartWitch__Fv, 0x188

glabel S_StartWitch__Fv
    /* 5C2A4 8006C2A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5C2A8 8006C2A8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5C2AC 8006C2AC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5C2B0 8006C2B0 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5C2B4 8006C2B4 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5C2B8 8006C2B8 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5C2BC 8006C2BC 4AED010C */  jal        GetStr__Fi
    /* 5C2C0 8006C2C0 DC040424 */   addiu     $a0, $zero, 0x4DC
    /* 5C2C4 8006C2C4 21200000 */  addu       $a0, $zero, $zero
    /* 5C2C8 8006C2C8 01000524 */  addiu      $a1, $zero, 0x1
    /* 5C2CC 8006C2CC 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C2D0 8006C2D0 21384000 */  addu       $a3, $v0, $zero
    /* 5C2D4 8006C2D4 03001024 */  addiu      $s0, $zero, 0x3
    /* 5C2D8 8006C2D8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5C2DC 8006C2DC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C2E0 8006C2E0 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5C2E4 8006C2E4 4AED010C */  jal        GetStr__Fi
    /* 5C2E8 8006C2E8 DF040424 */   addiu     $a0, $zero, 0x4DF
    /* 5C2EC 8006C2EC 21200000 */  addu       $a0, $zero, $zero
    /* 5C2F0 8006C2F0 06000524 */  addiu      $a1, $zero, 0x6
    /* 5C2F4 8006C2F4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C2F8 8006C2F8 21384000 */  addu       $a3, $v0, $zero
    /* 5C2FC 8006C2FC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5C300 8006C300 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C304 8006C304 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5C308 8006C308 4AED010C */  jal        GetStr__Fi
    /* 5C30C 8006C30C 26040424 */   addiu     $a0, $zero, 0x426
    /* 5C310 8006C310 21200000 */  addu       $a0, $zero, $zero
    /* 5C314 8006C314 08000524 */  addiu      $a1, $zero, 0x8
    /* 5C318 8006C318 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C31C 8006C31C 21384000 */  addu       $a3, $v0, $zero
    /* 5C320 8006C320 01001024 */  addiu      $s0, $zero, 0x1
    /* 5C324 8006C324 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5C328 8006C328 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C32C 8006C32C 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5C330 8006C330 4AED010C */  jal        GetStr__Fi
    /* 5C334 8006C334 96000424 */   addiu     $a0, $zero, 0x96
    /* 5C338 8006C338 21200000 */  addu       $a0, $zero, $zero
    /* 5C33C 8006C33C 09000524 */  addiu      $a1, $zero, 0x9
    /* 5C340 8006C340 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C344 8006C344 21384000 */  addu       $a3, $v0, $zero
    /* 5C348 8006C348 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C34C 8006C34C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C350 8006C350 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5C354 8006C354 4AED010C */  jal        GetStr__Fi
    /* 5C358 8006C358 98000424 */   addiu     $a0, $zero, 0x98
    /* 5C35C 8006C35C 21200000 */  addu       $a0, $zero, $zero
    /* 5C360 8006C360 0A000524 */  addiu      $a1, $zero, 0xA
    /* 5C364 8006C364 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C368 8006C368 21384000 */  addu       $a3, $v0, $zero
    /* 5C36C 8006C36C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C370 8006C370 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C374 8006C374 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5C378 8006C378 4AED010C */  jal        GetStr__Fi
    /* 5C37C 8006C37C B9030424 */   addiu     $a0, $zero, 0x3B9
    /* 5C380 8006C380 21200000 */  addu       $a0, $zero, $zero
    /* 5C384 8006C384 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5C388 8006C388 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C38C 8006C38C 21384000 */  addu       $a3, $v0, $zero
    /* 5C390 8006C390 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C394 8006C394 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C398 8006C398 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5C39C 8006C39C 4AED010C */  jal        GetStr__Fi
    /* 5C3A0 8006C3A0 BA030424 */   addiu     $a0, $zero, 0x3BA
    /* 5C3A4 8006C3A4 21200000 */  addu       $a0, $zero, $zero
    /* 5C3A8 8006C3A8 0C000524 */  addiu      $a1, $zero, 0xC
    /* 5C3AC 8006C3AC 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C3B0 8006C3B0 21384000 */  addu       $a3, $v0, $zero
    /* 5C3B4 8006C3B4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C3B8 8006C3B8 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C3BC 8006C3BC 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5C3C0 8006C3C0 4AED010C */  jal        GetStr__Fi
    /* 5C3C4 8006C3C4 4D030424 */   addiu     $a0, $zero, 0x34D
    /* 5C3C8 8006C3C8 21200000 */  addu       $a0, $zero, $zero
    /* 5C3CC 8006C3CC 0D000524 */  addiu      $a1, $zero, 0xD
    /* 5C3D0 8006C3D0 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C3D4 8006C3D4 21384000 */  addu       $a3, $v0, $zero
    /* 5C3D8 8006C3D8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C3DC 8006C3DC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C3E0 8006C3E0 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5C3E4 8006C3E4 4AED010C */  jal        GetStr__Fi
    /* 5C3E8 8006C3E8 40020424 */   addiu     $a0, $zero, 0x240
    /* 5C3EC 8006C3EC 21200000 */  addu       $a0, $zero, $zero
    /* 5C3F0 8006C3F0 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5C3F4 8006C3F4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C3F8 8006C3F8 21384000 */  addu       $a3, $v0, $zero
    /* 5C3FC 8006C3FC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5C400 8006C400 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C404 8006C404 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5C408 8006C408 5CA7010C */  jal        AddSLine__Fi
    /* 5C40C 8006C40C 03000424 */   addiu     $a0, $zero, 0x3
    /* 5C410 8006C410 14000224 */  addiu      $v0, $zero, 0x14
    /* 5C414 8006C414 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5C418 8006C418 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5C41C 8006C41C 1800B08F */  lw         $s0, 0x18($sp)
    /* 5C420 8006C420 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5C424 8006C424 0800E003 */  jr         $ra
    /* 5C428 8006C428 00000000 */   nop
endlabel S_StartWitch__Fv
