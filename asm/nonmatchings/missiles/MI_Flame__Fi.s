.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Flame__Fi, 0x21C

glabel MI_Flame__Fi
    /* F180 80148D78 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* F184 80148D7C 2800B2AF */  sw         $s2, 0x28($sp)
    /* F188 80148D80 21908000 */  addu       $s2, $a0, $zero
    /* F18C 80148D84 80101200 */  sll        $v0, $s2, 2
    /* F190 80148D88 21105200 */  addu       $v0, $v0, $s2
    /* F194 80148D8C 80100200 */  sll        $v0, $v0, 2
    /* F198 80148D90 23105200 */  subu       $v0, $v0, $s2
    /* F19C 80148D94 2000B0AF */  sw         $s0, 0x20($sp)
    /* F1A0 80148D98 80800200 */  sll        $s0, $v0, 2
    /* F1A4 80148D9C 1080033C */  lui        $v1, %hi(missile)
    /* F1A8 80148DA0 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* F1AC 80148DA4 3000BFAF */  sw         $ra, 0x30($sp)
    /* F1B0 80148DA8 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* F1B4 80148DAC 2400B1AF */  sw         $s1, 0x24($sp)
    /* F1B8 80148DB0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F1BC 80148DB4 21083000 */  addu       $at, $at, $s0
    /* F1C0 80148DB8 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F1C4 80148DBC 21180302 */  addu       $v1, $s0, $v1
    /* F1C8 80148DC0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* F1CC 80148DC4 180062A4 */  sh         $v0, 0x18($v1)
    /* F1D0 80148DC8 1080013C */  lui        $at, %hi(missile + 0x20)
    /* F1D4 80148DCC 21083000 */  addu       $at, $at, $s0
    /* F1D8 80148DD0 782C2294 */  lhu        $v0, %lo(missile + 0x20)($at)
    /* F1DC 80148DD4 01000724 */  addiu      $a3, $zero, 0x1
    /* F1E0 80148DD8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* F1E4 80148DDC 200062A4 */  sh         $v0, 0x20($v1)
    /* F1E8 80148DE0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F1EC 80148DE4 21083000 */  addu       $at, $at, $s0
    /* F1F0 80148DE8 702C3194 */  lhu        $s1, %lo(missile + 0x18)($at)
    /* F1F4 80148DEC 1080013C */  lui        $at, %hi(missile + 0x10)
    /* F1F8 80148DF0 21083000 */  addu       $at, $at, $s0
    /* F1FC 80148DF4 682C258C */  lw         $a1, %lo(missile + 0x10)($at)
    /* F200 80148DF8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F204 80148DFC 21083000 */  addu       $at, $at, $s0
    /* F208 80148E00 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* F20C 80148E04 01001324 */  addiu      $s3, $zero, 0x1
    /* F210 80148E08 1000A2AF */  sw         $v0, 0x10($sp)
    /* F214 80148E0C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F218 80148E10 21083000 */  addu       $at, $at, $s0
    /* F21C 80148E14 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* F220 80148E18 2130A000 */  addu       $a2, $a1, $zero
    /* F224 80148E1C 1800A0AF */  sw         $zero, 0x18($sp)
    /* F228 80148E20 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* F22C 80148E24 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* F230 80148E28 1400A2AF */   sw        $v0, 0x14($sp)
    /* F234 80148E2C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F238 80148E30 21083000 */  addu       $at, $at, $s0
    /* F23C 80148E34 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F240 80148E38 00000000 */  nop
    /* F244 80148E3C 0A004014 */  bnez       $v0, .L80148E68
    /* F248 80148E40 80101200 */   sll       $v0, $s2, 2
    /* F24C 80148E44 1080013C */  lui        $at, %hi(missile + 0x3D)
    /* F250 80148E48 21083000 */  addu       $at, $at, $s0
    /* F254 80148E4C 952C2290 */  lbu        $v0, %lo(missile + 0x3D)($at)
    /* F258 80148E50 00000000 */  nop
    /* F25C 80148E54 04005314 */  bne        $v0, $s3, .L80148E68
    /* F260 80148E58 80101200 */   sll       $v0, $s2, 2
    /* F264 80148E5C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F268 80148E60 21083000 */  addu       $at, $at, $s0
    /* F26C 80148E64 702C31A4 */  sh         $s1, %lo(missile + 0x18)($at)
  .L80148E68:
    /* F270 80148E68 21105200 */  addu       $v0, $v0, $s2
    /* F274 80148E6C 80100200 */  sll        $v0, $v0, 2
    /* F278 80148E70 23105200 */  subu       $v0, $v0, $s2
    /* F27C 80148E74 80180200 */  sll        $v1, $v0, 2
    /* F280 80148E78 1080013C */  lui        $at, %hi(missile + 0x20)
    /* F284 80148E7C 21082300 */  addu       $at, $at, $v1
    /* F288 80148E80 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* F28C 80148E84 00000000 */  nop
    /* F290 80148E88 08004014 */  bnez       $v0, .L80148EAC
    /* F294 80148E8C 00000000 */   nop
    /* F298 80148E90 14000224 */  addiu      $v0, $zero, 0x14
    /* F29C 80148E94 1080013C */  lui        $at, %hi(missile + 0x47)
    /* F2A0 80148E98 21082300 */  addu       $at, $at, $v1
    /* F2A4 80148E9C 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
    /* F2A8 80148EA0 1080013C */  lui        $at, %hi(missile + 0x20)
    /* F2AC 80148EA4 21082300 */  addu       $at, $at, $v1
    /* F2B0 80148EA8 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
  .L80148EAC:
    /* F2B4 80148EAC 00000000 */  nop
    /* F2B8 80148EB0 1600401C */  bgtz       $v0, .L80148F0C
    /* F2BC 80148EB4 80101200 */   sll       $v0, $s2, 2
    /* F2C0 80148EB8 1080013C */  lui        $at, %hi(missile + 0x47)
    /* F2C4 80148EBC 21082300 */  addu       $at, $at, $v1
    /* F2C8 80148EC0 9F2C3180 */  lb         $s1, %lo(missile + 0x47)($at)
    /* F2CC 80148EC4 00000000 */  nop
    /* F2D0 80148EC8 0C00222A */  slti       $v0, $s1, 0xC
    /* F2D4 80148ECC 02004014 */  bnez       $v0, .L80148ED8
    /* F2D8 80148ED0 18000224 */   addiu     $v0, $zero, 0x18
    /* F2DC 80148ED4 23885100 */  subu       $s1, $v0, $s1
  .L80148ED8:
    /* F2E0 80148ED8 C3381100 */  sra        $a3, $s1, 3
    /* F2E4 80148EDC 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* F2E8 80148EE0 21082300 */  addu       $at, $at, $v1
    /* F2EC 80148EE4 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* F2F0 80148EE8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F2F4 80148EEC 21082300 */  addu       $at, $at, $v1
    /* F2F8 80148EF0 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* F2FC 80148EF4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F300 80148EF8 21082300 */  addu       $at, $at, $v1
    /* F304 80148EFC 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* F308 80148F00 F834010C */  jal        ChangeLight__Fiiii
    /* F30C 80148F04 9400E724 */   addiu     $a3, $a3, 0x94
    /* F310 80148F08 80101200 */  sll        $v0, $s2, 2
  .L80148F0C:
    /* F314 80148F0C 21105200 */  addu       $v0, $v0, $s2
    /* F318 80148F10 80100200 */  sll        $v0, $v0, 2
    /* F31C 80148F14 23105200 */  subu       $v0, $v0, $s2
    /* F320 80148F18 80800200 */  sll        $s0, $v0, 2
    /* F324 80148F1C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F328 80148F20 21083000 */  addu       $at, $at, $s0
    /* F32C 80148F24 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F330 80148F28 00000000 */  nop
    /* F334 80148F2C 09004014 */  bnez       $v0, .L80148F54
    /* F338 80148F30 01000224 */   addiu     $v0, $zero, 0x1
    /* F33C 80148F34 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* F340 80148F38 21083000 */  addu       $at, $at, $s0
    /* F344 80148F3C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* F348 80148F40 1080013C */  lui        $at, %hi(missile + 0x38)
    /* F34C 80148F44 21083000 */  addu       $at, $at, $s0
    /* F350 80148F48 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* F354 80148F4C D034010C */  jal        AddUnLight__Fi
    /* F358 80148F50 00000000 */   nop
  .L80148F54:
    /* F35C 80148F54 1080013C */  lui        $at, %hi(missile + 0x20)
    /* F360 80148F58 21083000 */  addu       $at, $at, $s0
    /* F364 80148F5C 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* F368 80148F60 00000000 */  nop
    /* F36C 80148F64 0300401C */  bgtz       $v0, .L80148F74
    /* F370 80148F68 00000000 */   nop
    /* F374 80148F6C D1EA040C */  jal        PutMissile__Fi
    /* F378 80148F70 21204002 */   addu      $a0, $s2, $zero
  .L80148F74:
    /* F37C 80148F74 3000BF8F */  lw         $ra, 0x30($sp)
    /* F380 80148F78 2C00B38F */  lw         $s3, 0x2C($sp)
    /* F384 80148F7C 2800B28F */  lw         $s2, 0x28($sp)
    /* F388 80148F80 2400B18F */  lw         $s1, 0x24($sp)
    /* F38C 80148F84 2000B08F */  lw         $s0, 0x20($sp)
    /* F390 80148F88 3800BD27 */  addiu      $sp, $sp, 0x38
    /* F394 80148F8C 0800E003 */  jr         $ra
    /* F398 80148F90 00000000 */   nop
endlabel MI_Flame__Fi
