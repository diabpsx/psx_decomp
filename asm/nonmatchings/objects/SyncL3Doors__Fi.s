.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncL3Doors__Fi, 0x12C

glabel SyncL3Doors__Fi
    /* 4F25C 8005F25C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4F260 8005F260 40100400 */  sll        $v0, $a0, 1
    /* 4F264 8005F264 21104400 */  addu       $v0, $v0, $a0
    /* 4F268 8005F268 80100200 */  sll        $v0, $v0, 2
    /* 4F26C 8005F26C 23104400 */  subu       $v0, $v0, $a0
    /* 4F270 8005F270 80300200 */  sll        $a2, $v0, 2
    /* 4F274 8005F274 01000224 */  addiu      $v0, $zero, 0x1
    /* 4F278 8005F278 2000BFAF */  sw         $ra, 0x20($sp)
    /* 4F27C 8005F27C 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 4F280 8005F280 21082600 */  addu       $at, $at, $a2
    /* 4F284 8005F284 748C22A0 */  sb         $v0, %lo(object + 0x28)($at)
    /* 4F288 8005F288 02000224 */  addiu      $v0, $zero, 0x2
    /* 4F28C 8005F28C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4F290 8005F290 21082600 */  addu       $at, $at, $a2
    /* 4F294 8005F294 6B8C2780 */  lb         $a3, %lo(object + 0x1F)($at)
    /* 4F298 8005F298 4A000324 */  addiu      $v1, $zero, 0x4A
    /* 4F29C 8005F29C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4F2A0 8005F2A0 21082600 */  addu       $at, $at, $a2
    /* 4F2A4 8005F2A4 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 4F2A8 8005F2A8 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F2AC 8005F2AC 21082600 */  addu       $at, $at, $a2
    /* 4F2B0 8005F2B0 6A8C2280 */  lb         $v0, %lo(object + 0x1E)($at)
    /* 4F2B4 8005F2B4 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4F2B8 8005F2B8 21082600 */  addu       $at, $at, $a2
    /* 4F2BC 8005F2BC 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4F2C0 8005F2C0 12004314 */  bne        $v0, $v1, .L8005F30C
    /* 4F2C4 8005F2C4 40100400 */   sll       $v0, $a0, 1
    /* 4F2C8 8005F2C8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F2CC 8005F2CC 21082600 */  addu       $at, $at, $a2
    /* 4F2D0 8005F2D0 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4F2D4 8005F2D4 00000000 */  nop
    /* 4F2D8 8005F2D8 04004014 */  bnez       $v0, .L8005F2EC
    /* 4F2DC 8005F2DC 21184000 */   addu      $v1, $v0, $zero
    /* 4F2E0 8005F2E0 2120E000 */  addu       $a0, $a3, $zero
    /* 4F2E4 8005F2E4 DC7C0108 */  j          .L8005F370
    /* 4F2E8 8005F2E8 13020624 */   addiu     $a2, $zero, 0x213
  .L8005F2EC:
    /* 4F2EC 8005F2EC FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 4F2F0 8005F2F0 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 4F2F4 8005F2F4 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4F2F8 8005F2F8 03004010 */  beqz       $v0, .L8005F308
    /* 4F2FC 8005F2FC 1A020624 */   addiu     $a2, $zero, 0x21A
    /* 4F300 8005F300 DC7C0108 */  j          .L8005F370
    /* 4F304 8005F304 2120E000 */   addu      $a0, $a3, $zero
  .L8005F308:
    /* 4F308 8005F308 40100400 */  sll        $v0, $a0, 1
  .L8005F30C:
    /* 4F30C 8005F30C 21104400 */  addu       $v0, $v0, $a0
    /* 4F310 8005F310 80100200 */  sll        $v0, $v0, 2
    /* 4F314 8005F314 23104400 */  subu       $v0, $v0, $a0
    /* 4F318 8005F318 80300200 */  sll        $a2, $v0, 2
    /* 4F31C 8005F31C 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F320 8005F320 21082600 */  addu       $at, $at, $a2
    /* 4F324 8005F324 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4F328 8005F328 4B000224 */  addiu      $v0, $zero, 0x4B
    /* 4F32C 8005F32C 12006214 */  bne        $v1, $v0, .L8005F378
    /* 4F330 8005F330 00000000 */   nop
    /* 4F334 8005F334 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F338 8005F338 21082600 */  addu       $at, $at, $a2
    /* 4F33C 8005F33C 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4F340 8005F340 00000000 */  nop
    /* 4F344 8005F344 04004014 */  bnez       $v0, .L8005F358
    /* 4F348 8005F348 21184000 */   addu      $v1, $v0, $zero
    /* 4F34C 8005F34C 2120E000 */  addu       $a0, $a3, $zero
    /* 4F350 8005F350 DC7C0108 */  j          .L8005F370
    /* 4F354 8005F354 16020624 */   addiu     $a2, $zero, 0x216
  .L8005F358:
    /* 4F358 8005F358 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 4F35C 8005F35C FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 4F360 8005F360 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4F364 8005F364 04004010 */  beqz       $v0, .L8005F378
    /* 4F368 8005F368 2120E000 */   addu      $a0, $a3, $zero
    /* 4F36C 8005F36C 1D020624 */  addiu      $a2, $zero, 0x21D
  .L8005F370:
    /* 4F370 8005F370 D555010C */  jal        ObjSetMicro__Fiii
    /* 4F374 8005F374 00000000 */   nop
  .L8005F378:
    /* 4F378 8005F378 2000BF8F */  lw         $ra, 0x20($sp)
    /* 4F37C 8005F37C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4F380 8005F380 0800E003 */  jr         $ra
    /* 4F384 8005F384 00000000 */   nop
endlabel SyncL3Doors__Fi
