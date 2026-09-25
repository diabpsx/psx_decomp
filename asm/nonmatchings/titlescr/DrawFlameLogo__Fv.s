.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawFlameLogo__Fv, 0x1B0

glabel DrawFlameLogo__Fv
    /* 8E1F0 8009E1F0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8E1F4 8009E1F4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 8E1F8 8009E1F8 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 8E1FC 8009E1FC 2800B2AF */  sw         $s2, 0x28($sp)
    /* 8E200 8009E200 2400B1AF */  sw         $s1, 0x24($sp)
    /* 8E204 8009E204 3E10020C */  jal        VID_GetTick__Fv
    /* 8E208 8009E208 2000B0AF */   sw        $s0, 0x20($sp)
    /* 8E20C 8009E20C 4409838F */  lw         $v1, %gp_rel(D_8011B0C4)($gp)
    /* 8E210 8009E210 0D80123C */  lui        $s2, %hi(D_800CC68C)
    /* 8E214 8009E214 8CC65226 */  addiu      $s2, $s2, %lo(D_800CC68C)
    /* 8E218 8009E218 3E10020C */  jal        VID_GetTick__Fv
    /* 8E21C 8009E21C 23804300 */   subu      $s0, $v0, $v1
    /* 8E220 8009E220 4009838F */  lw         $v1, %gp_rel(D_8011B0C0)($gp)
    /* 8E224 8009E224 0D80113C */  lui        $s1, %hi(D_800CC6A4)
    /* 8E228 8009E228 A4C63126 */  addiu      $s1, $s1, %lo(D_800CC6A4)
    /* 8E22C 8009E22C 440982AF */  sw         $v0, %gp_rel(D_8011B0C4)($gp)
    /* 8E230 8009E230 21187000 */  addu       $v1, $v1, $s0
    /* 8E234 8009E234 400983AF */  sw         $v1, %gp_rel(D_8011B0C0)($gp)
    /* 8E238 8009E238 39006328 */  slti       $v1, $v1, 0x39
    /* 8E23C 8009E23C 02006014 */  bnez       $v1, .L8009E248
    /* 8E240 8009E240 21800000 */   addu      $s0, $zero, $zero
    /* 8E244 8009E244 400980AF */  sw         $zero, %gp_rel(D_8011B0C0)($gp)
  .L8009E248:
    /* 8E248 8009E248 64000724 */  addiu      $a3, $zero, 0x64
    /* 8E24C 8009E24C 0000268E */  lw         $a2, 0x0($s1)
    /* 8E250 8009E250 0000428E */  lw         $v0, 0x0($s2)
    /* 8E254 8009E254 1280043C */  lui        $a0, %hi(FlameTData)
    /* 8E258 8009E258 24B3848C */  lw         $a0, %lo(FlameTData)($a0)
    /* 8E25C 8009E25C 4009858F */  lw         $a1, %gp_rel(D_8011B0C0)($gp)
    /* 8E260 8009E260 20001324 */  addiu      $s3, $zero, 0x20
    /* 8E264 8009E264 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8E268 8009E268 1400B3AF */  sw         $s3, 0x14($sp)
    /* 8E26C 8009E26C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 8E270 8009E270 43280500 */  sra        $a1, $a1, 1
    /* 8E274 8009E274 21284500 */  addu       $a1, $v0, $a1
    /* 8E278 8009E278 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 8E27C 8009E27C F8FFC624 */   addiu     $a2, $a2, -0x8
    /* 8E280 8009E280 21404000 */  addu       $t0, $v0, $zero
    /* 8E284 8009E284 07000291 */  lbu        $v0, 0x7($t0)
    /* 8E288 8009E288 04003126 */  addiu      $s1, $s1, 0x4
    /* 8E28C 8009E28C 02004234 */  ori        $v0, $v0, 0x2
    /* 8E290 8009E290 FE004230 */  andi       $v0, $v0, 0xFE
    /* 8E294 8009E294 070002A1 */  sb         $v0, 0x7($t0)
    /* 8E298 8009E298 4809828F */  lw         $v0, %gp_rel(flamecol)($gp)
    /* 8E29C 8009E29C 04005226 */  addiu      $s2, $s2, 0x4
    /* 8E2A0 8009E2A0 040002A1 */  sb         $v0, 0x4($t0)
    /* 8E2A4 8009E2A4 4809828F */  lw         $v0, %gp_rel(flamecol)($gp)
    /* 8E2A8 8009E2A8 01001026 */  addiu      $s0, $s0, 0x1
    /* 8E2AC 8009E2AC 050002A1 */  sb         $v0, 0x5($t0)
    /* 8E2B0 8009E2B0 16000295 */  lhu        $v0, 0x16($t0)
    /* 8E2B4 8009E2B4 4809838F */  lw         $v1, %gp_rel(flamecol)($gp)
    /* 8E2B8 8009E2B8 20004234 */  ori        $v0, $v0, 0x20
    /* 8E2BC 8009E2BC 160002A5 */  sh         $v0, 0x16($t0)
    /* 8E2C0 8009E2C0 0600022A */  slti       $v0, $s0, 0x6
    /* 8E2C4 8009E2C4 E0FF4014 */  bnez       $v0, .L8009E248
    /* 8E2C8 8009E2C8 060003A1 */   sb        $v1, 0x6($t0)
    /* 8E2CC 8009E2CC 1280033C */  lui        $v1, %hi(AttractNo)
    /* 8E2D0 8009E2D0 50B3638C */  lw         $v1, %lo(AttractNo)($v1)
    /* 8E2D4 8009E2D4 05000224 */  addiu      $v0, $zero, 0x5
    /* 8E2D8 8009E2D8 29006214 */  bne        $v1, $v0, .L8009E380
    /* 8E2DC 8009E2DC AF000524 */   addiu     $a1, $zero, 0xAF
    /* 8E2E0 8009E2E0 14010624 */  addiu      $a2, $zero, 0x114
    /* 8E2E4 8009E2E4 1280043C */  lui        $a0, %hi(FlameTData)
    /* 8E2E8 8009E2E8 24B3848C */  lw         $a0, %lo(FlameTData)($a0)
    /* 8E2EC 8009E2EC 98000724 */  addiu      $a3, $zero, 0x98
    /* 8E2F0 8009E2F0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8E2F4 8009E2F4 1400B3AF */  sw         $s3, 0x14($sp)
    /* 8E2F8 8009E2F8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 8E2FC 8009E2FC 1800A0AF */   sw        $zero, 0x18($sp)
    /* 8E300 8009E300 21404000 */  addu       $t0, $v0, $zero
    /* 8E304 8009E304 AE000524 */  addiu      $a1, $zero, 0xAE
    /* 8E308 8009E308 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 8E30C 8009E30C E4000724 */  addiu      $a3, $zero, 0xE4
    /* 8E310 8009E310 07000291 */  lbu        $v0, 0x7($t0)
    /* 8E314 8009E314 80001024 */  addiu      $s0, $zero, 0x80
    /* 8E318 8009E318 040010A1 */  sb         $s0, 0x4($t0)
    /* 8E31C 8009E31C 050010A1 */  sb         $s0, 0x5($t0)
    /* 8E320 8009E320 060010A1 */  sb         $s0, 0x6($t0)
    /* 8E324 8009E324 02004234 */  ori        $v0, $v0, 0x2
    /* 8E328 8009E328 FE004230 */  andi       $v0, $v0, 0xFE
    /* 8E32C 8009E32C 070002A1 */  sb         $v0, 0x7($t0)
    /* 8E330 8009E330 16000295 */  lhu        $v0, 0x16($t0)
    /* 8E334 8009E334 1280043C */  lui        $a0, %hi(FlameTData)
    /* 8E338 8009E338 24B3848C */  lw         $a0, %lo(FlameTData)($a0)
    /* 8E33C 8009E33C 20004234 */  ori        $v0, $v0, 0x20
    /* 8E340 8009E340 160002A5 */  sh         $v0, 0x16($t0)
    /* 8E344 8009E344 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8E348 8009E348 1400B3AF */  sw         $s3, 0x14($sp)
    /* 8E34C 8009E34C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 8E350 8009E350 1800A0AF */   sw        $zero, 0x18($sp)
    /* 8E354 8009E354 21404000 */  addu       $t0, $v0, $zero
    /* 8E358 8009E358 16000295 */  lhu        $v0, 0x16($t0)
    /* 8E35C 8009E35C 07000391 */  lbu        $v1, 0x7($t0)
    /* 8E360 8009E360 040010A1 */  sb         $s0, 0x4($t0)
    /* 8E364 8009E364 050010A1 */  sb         $s0, 0x5($t0)
    /* 8E368 8009E368 060010A1 */  sb         $s0, 0x6($t0)
    /* 8E36C 8009E36C 20004234 */  ori        $v0, $v0, 0x20
    /* 8E370 8009E370 02006334 */  ori        $v1, $v1, 0x2
    /* 8E374 8009E374 FE006330 */  andi       $v1, $v1, 0xFE
    /* 8E378 8009E378 160002A5 */  sh         $v0, 0x16($t0)
    /* 8E37C 8009E37C 070003A1 */  sb         $v1, 0x7($t0)
  .L8009E380:
    /* 8E380 8009E380 3000BF8F */  lw         $ra, 0x30($sp)
    /* 8E384 8009E384 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 8E388 8009E388 2800B28F */  lw         $s2, 0x28($sp)
    /* 8E38C 8009E38C 2400B18F */  lw         $s1, 0x24($sp)
    /* 8E390 8009E390 2000B08F */  lw         $s0, 0x20($sp)
    /* 8E394 8009E394 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8E398 8009E398 0800E003 */  jr         $ra
    /* 8E39C 8009E39C 00000000 */   nop
endlabel DrawFlameLogo__Fv
