.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTortures__Fv, 0x180

glabel AddTortures__Fv
    /* 1E220 80157E18 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1E224 80157E1C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1E228 80157E20 21980000 */  addu       $s3, $zero, $zero
    /* 1E22C 80157E24 3400BFAF */  sw         $ra, 0x34($sp)
    /* 1E230 80157E28 3000BEAF */  sw         $fp, 0x30($sp)
    /* 1E234 80157E2C 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1E238 80157E30 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1E23C 80157E34 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1E240 80157E38 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1E244 80157E3C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1E248 80157E40 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E24C 80157E44 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1E250 80157E48 21900000 */  addu       $s2, $zero, $zero
  .L80157E4C:
    /* 1E254 80157E4C 01007E26 */  addiu      $fp, $s3, 0x1
    /* 1E258 80157E50 FFFF7726 */  addiu      $s7, $s3, -0x1
    /* 1E25C 80157E54 03007626 */  addiu      $s6, $s3, 0x3
    /* 1E260 80157E58 05007526 */  addiu      $s5, $s3, 0x5
    /* 1E264 80157E5C 02007426 */  addiu      $s4, $s3, 0x2
    /* 1E268 80157E60 21204002 */  addu       $a0, $s2, $zero
  .L80157E64:
    /* 1E26C 80157E64 910A020C */  jal        GetDPiece__Fii
    /* 1E270 80157E68 21286002 */   addu      $a1, $s3, $zero
    /* 1E274 80157E6C 00140200 */  sll        $v0, $v0, 16
    /* 1E278 80157E70 03140200 */  sra        $v0, $v0, 16
    /* 1E27C 80157E74 6F010324 */  addiu      $v1, $zero, 0x16F
    /* 1E280 80157E78 32004314 */  bne        $v0, $v1, .L80157F44
    /* 1E284 80157E7C 24000424 */   addiu     $a0, $zero, 0x24
    /* 1E288 80157E80 21284002 */  addu       $a1, $s2, $zero
    /* 1E28C 80157E84 BE4E010C */  jal        AddObject__Fiii
    /* 1E290 80157E88 2130C003 */   addu      $a2, $fp, $zero
    /* 1E294 80157E8C 26000424 */  addiu      $a0, $zero, 0x26
    /* 1E298 80157E90 02005026 */  addiu      $s0, $s2, 0x2
    /* 1E29C 80157E94 21280002 */  addu       $a1, $s0, $zero
    /* 1E2A0 80157E98 BE4E010C */  jal        AddObject__Fiii
    /* 1E2A4 80157E9C 2130E002 */   addu      $a2, $s7, $zero
    /* 1E2A8 80157EA0 25000424 */  addiu      $a0, $zero, 0x25
    /* 1E2AC 80157EA4 21284002 */  addu       $a1, $s2, $zero
    /* 1E2B0 80157EA8 BE4E010C */  jal        AddObject__Fiii
    /* 1E2B4 80157EAC 2130C002 */   addu      $a2, $s6, $zero
    /* 1E2B8 80157EB0 27000424 */  addiu      $a0, $zero, 0x27
    /* 1E2BC 80157EB4 04005126 */  addiu      $s1, $s2, 0x4
    /* 1E2C0 80157EB8 21282002 */  addu       $a1, $s1, $zero
    /* 1E2C4 80157EBC BE4E010C */  jal        AddObject__Fiii
    /* 1E2C8 80157EC0 2130E002 */   addu      $a2, $s7, $zero
    /* 1E2CC 80157EC4 28000424 */  addiu      $a0, $zero, 0x28
    /* 1E2D0 80157EC8 21284002 */  addu       $a1, $s2, $zero
    /* 1E2D4 80157ECC BE4E010C */  jal        AddObject__Fiii
    /* 1E2D8 80157ED0 2130A002 */   addu      $a2, $s5, $zero
    /* 1E2DC 80157ED4 1D000424 */  addiu      $a0, $zero, 0x1D
    /* 1E2E0 80157ED8 01004526 */  addiu      $a1, $s2, 0x1
    /* 1E2E4 80157EDC BE4E010C */  jal        AddObject__Fiii
    /* 1E2E8 80157EE0 2130C002 */   addu      $a2, $s6, $zero
    /* 1E2EC 80157EE4 1E000424 */  addiu      $a0, $zero, 0x1E
    /* 1E2F0 80157EE8 21282002 */  addu       $a1, $s1, $zero
    /* 1E2F4 80157EEC BE4E010C */  jal        AddObject__Fiii
    /* 1E2F8 80157EF0 2130A002 */   addu      $a2, $s5, $zero
    /* 1E2FC 80157EF4 1F000424 */  addiu      $a0, $zero, 0x1F
    /* 1E300 80157EF8 21280002 */  addu       $a1, $s0, $zero
    /* 1E304 80157EFC BE4E010C */  jal        AddObject__Fiii
    /* 1E308 80157F00 21306002 */   addu      $a2, $s3, $zero
    /* 1E30C 80157F04 20000424 */  addiu      $a0, $zero, 0x20
    /* 1E310 80157F08 03004526 */  addiu      $a1, $s2, 0x3
    /* 1E314 80157F0C BE4E010C */  jal        AddObject__Fiii
    /* 1E318 80157F10 21308002 */   addu      $a2, $s4, $zero
    /* 1E31C 80157F14 21000424 */  addiu      $a0, $zero, 0x21
    /* 1E320 80157F18 21280002 */  addu       $a1, $s0, $zero
    /* 1E324 80157F1C BE4E010C */  jal        AddObject__Fiii
    /* 1E328 80157F20 04006626 */   addiu     $a2, $s3, 0x4
    /* 1E32C 80157F24 22000424 */  addiu      $a0, $zero, 0x22
    /* 1E330 80157F28 21280002 */  addu       $a1, $s0, $zero
    /* 1E334 80157F2C BE4E010C */  jal        AddObject__Fiii
    /* 1E338 80157F30 2130C003 */   addu      $a2, $fp, $zero
    /* 1E33C 80157F34 23000424 */  addiu      $a0, $zero, 0x23
    /* 1E340 80157F38 21282002 */  addu       $a1, $s1, $zero
    /* 1E344 80157F3C BE4E010C */  jal        AddObject__Fiii
    /* 1E348 80157F40 21308002 */   addu      $a2, $s4, $zero
  .L80157F44:
    /* 1E34C 80157F44 01005226 */  addiu      $s2, $s2, 0x1
    /* 1E350 80157F48 6000422A */  slti       $v0, $s2, 0x60
    /* 1E354 80157F4C C5FF4014 */  bnez       $v0, .L80157E64
    /* 1E358 80157F50 21204002 */   addu      $a0, $s2, $zero
    /* 1E35C 80157F54 01007326 */  addiu      $s3, $s3, 0x1
    /* 1E360 80157F58 6000622A */  slti       $v0, $s3, 0x60
    /* 1E364 80157F5C BBFF4014 */  bnez       $v0, .L80157E4C
    /* 1E368 80157F60 21900000 */   addu      $s2, $zero, $zero
    /* 1E36C 80157F64 3400BF8F */  lw         $ra, 0x34($sp)
    /* 1E370 80157F68 3000BE8F */  lw         $fp, 0x30($sp)
    /* 1E374 80157F6C 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1E378 80157F70 2800B68F */  lw         $s6, 0x28($sp)
    /* 1E37C 80157F74 2400B58F */  lw         $s5, 0x24($sp)
    /* 1E380 80157F78 2000B48F */  lw         $s4, 0x20($sp)
    /* 1E384 80157F7C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1E388 80157F80 1800B28F */  lw         $s2, 0x18($sp)
    /* 1E38C 80157F84 1400B18F */  lw         $s1, 0x14($sp)
    /* 1E390 80157F88 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E394 80157F8C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1E398 80157F90 0800E003 */  jr         $ra
    /* 1E39C 80157F94 00000000 */   nop
endlabel AddTortures__Fv
