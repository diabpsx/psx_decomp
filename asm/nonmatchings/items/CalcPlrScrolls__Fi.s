.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcPlrScrolls__Fi, 0x380

glabel CalcPlrScrolls__Fi
    /* 2F130 8003F130 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 2F134 8003F134 21508000 */  addu       $t2, $a0, $zero
    /* 2F138 8003F138 40180A00 */  sll        $v1, $t2, 1
    /* 2F13C 8003F13C 21106A00 */  addu       $v0, $v1, $t2
    /* 2F140 8003F140 80100200 */  sll        $v0, $v0, 2
    /* 2F144 8003F144 21104A00 */  addu       $v0, $v0, $t2
    /* 2F148 8003F148 00110200 */  sll        $v0, $v0, 4
    /* 2F14C 8003F14C 23104A00 */  subu       $v0, $v0, $t2
    /* 2F150 8003F150 80100200 */  sll        $v0, $v0, 2
    /* 2F154 8003F154 21104A00 */  addu       $v0, $v0, $t2
    /* 2F158 8003F158 C0100200 */  sll        $v0, $v0, 3
    /* 2F15C 8003F15C 21700000 */  addu       $t6, $zero, $zero
    /* 2F160 8003F160 21780000 */  addu       $t7, $zero, $zero
    /* 2F164 8003F164 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 2F168 8003F168 21082200 */  addu       $at, $at, $v0
    /* 2F16C 8003F16C 00A62EAC */  sw         $t6, %lo(plr + 0xC8)($at)
    /* 2F170 8003F170 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 2F174 8003F174 21082200 */  addu       $at, $at, $v0
    /* 2F178 8003F178 04A62FAC */  sw         $t7, %lo(plr + 0xCC)($at)
    /* 2F17C 8003F17C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2F180 8003F180 21082200 */  addu       $at, $at, $v0
    /* 2F184 8003F184 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 2F188 8003F188 00000000 */  nop
    /* 2F18C 8003F18C 52004018 */  blez       $v0, .L8003F2D8
    /* 2F190 8003F190 21580000 */   addu      $t3, $zero, $zero
    /* 2F194 8003F194 FFFF0D24 */  addiu      $t5, $zero, -0x1
    /* 2F198 8003F198 21600000 */  addu       $t4, $zero, $zero
  .L8003F19C:
    /* 2F19C 8003F19C 21106A00 */  addu       $v0, $v1, $t2
    /* 2F1A0 8003F1A0 80100200 */  sll        $v0, $v0, 2
    /* 2F1A4 8003F1A4 21104A00 */  addu       $v0, $v0, $t2
    /* 2F1A8 8003F1A8 00110200 */  sll        $v0, $v0, 4
    /* 2F1AC 8003F1AC 23104A00 */  subu       $v0, $v0, $t2
    /* 2F1B0 8003F1B0 80100200 */  sll        $v0, $v0, 2
    /* 2F1B4 8003F1B4 21104A00 */  addu       $v0, $v0, $t2
    /* 2F1B8 8003F1B8 C0380200 */  sll        $a3, $v0, 3
    /* 2F1BC 8003F1BC 21188701 */  addu       $v1, $t4, $a3
    /* 2F1C0 8003F1C0 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 2F1C4 8003F1C4 21082300 */  addu       $at, $at, $v1
    /* 2F1C8 8003F1C8 08AA2284 */  lh         $v0, %lo(plr + 0x4D0)($at)
    /* 2F1CC 8003F1CC 00000000 */  nop
    /* 2F1D0 8003F1D0 31004D10 */  beq        $v0, $t5, .L8003F298
    /* 2F1D4 8003F1D4 00000000 */   nop
    /* 2F1D8 8003F1D8 0E80013C */  lui        $at, %hi(plr + 0x4F1)
    /* 2F1DC 8003F1DC 21082300 */  addu       $at, $at, $v1
    /* 2F1E0 8003F1E0 29AA2290 */  lbu        $v0, %lo(plr + 0x4F1)($at)
    /* 2F1E4 8003F1E4 00000000 */  nop
    /* 2F1E8 8003F1E8 EBFF4224 */  addiu      $v0, $v0, -0x15
    /* 2F1EC 8003F1EC 0200422C */  sltiu      $v0, $v0, 0x2
    /* 2F1F0 8003F1F0 29004010 */  beqz       $v0, .L8003F298
    /* 2F1F4 8003F1F4 00000000 */   nop
    /* 2F1F8 8003F1F8 0E80013C */  lui        $at, %hi(plr + 0x50A)
    /* 2F1FC 8003F1FC 21082300 */  addu       $at, $at, $v1
    /* 2F200 8003F200 42AA2280 */  lb         $v0, %lo(plr + 0x50A)($at)
    /* 2F204 8003F204 00000000 */  nop
    /* 2F208 8003F208 23004010 */  beqz       $v0, .L8003F298
    /* 2F20C 8003F20C 00000000 */   nop
    /* 2F210 8003F210 00000924 */  addiu      $t1, $zero, 0x0
    /* 2F214 8003F214 01000824 */  addiu      $t0, $zero, 0x1
    /* 2F218 8003F218 0E80013C */  lui        $at, %hi(plr + 0x4E1)
    /* 2F21C 8003F21C 21082300 */  addu       $at, $at, $v1
    /* 2F220 8003F220 19AA2480 */  lb         $a0, %lo(plr + 0x4E1)($at)
    /* 2F224 8003F224 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 2F228 8003F228 21082700 */  addu       $at, $at, $a3
    /* 2F22C 8003F22C 00A6228C */  lw         $v0, %lo(plr + 0xC8)($at)
    /* 2F230 8003F230 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 2F234 8003F234 21082700 */  addu       $at, $at, $a3
    /* 2F238 8003F238 04A6238C */  lw         $v1, %lo(plr + 0xCC)($at)
    /* 2F23C 8003F23C FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 2F240 8003F240 80360400 */  sll        $a2, $a0, 26
    /* 2F244 8003F244 0400C104 */  bgez       $a2, .L8003F258
    /* 2F248 8003F248 00000000 */   nop
    /* 2F24C 8003F24C 04788800 */  sllv       $t7, $t0, $a0
    /* 2F250 8003F250 07000104 */  bgez       $zero, .L8003F270
    /* 2F254 8003F254 21700000 */   addu      $t6, $zero, $zero
  .L8003F258:
    /* 2F258 8003F258 0400C010 */  beqz       $a2, .L8003F26C
    /* 2F25C 8003F25C 04788900 */   sllv      $t7, $t1, $a0
    /* 2F260 8003F260 23300400 */  negu       $a2, $a0
    /* 2F264 8003F264 0630C800 */  srlv       $a2, $t0, $a2
    /* 2F268 8003F268 2578E601 */  or         $t7, $t7, $a2
  .L8003F26C:
    /* 2F26C 8003F26C 04708800 */  sllv       $t6, $t0, $a0
  .L8003F270:
    /* 2F270 8003F270 2120C001 */  addu       $a0, $t6, $zero
    /* 2F274 8003F274 2128E001 */  addu       $a1, $t7, $zero
    /* 2F278 8003F278 25186F00 */  or         $v1, $v1, $t7
    /* 2F27C 8003F27C 25104E00 */  or         $v0, $v0, $t6
    /* 2F280 8003F280 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 2F284 8003F284 21082700 */  addu       $at, $at, $a3
    /* 2F288 8003F288 00A622AC */  sw         $v0, %lo(plr + 0xC8)($at)
    /* 2F28C 8003F28C 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 2F290 8003F290 21082700 */  addu       $at, $at, $a3
    /* 2F294 8003F294 04A623AC */  sw         $v1, %lo(plr + 0xCC)($at)
  .L8003F298:
    /* 2F298 8003F298 40180A00 */  sll        $v1, $t2, 1
    /* 2F29C 8003F29C 21106A00 */  addu       $v0, $v1, $t2
    /* 2F2A0 8003F2A0 80100200 */  sll        $v0, $v0, 2
    /* 2F2A4 8003F2A4 21104A00 */  addu       $v0, $v0, $t2
    /* 2F2A8 8003F2A8 00110200 */  sll        $v0, $v0, 4
    /* 2F2AC 8003F2AC 23104A00 */  subu       $v0, $v0, $t2
    /* 2F2B0 8003F2B0 80100200 */  sll        $v0, $v0, 2
    /* 2F2B4 8003F2B4 21104A00 */  addu       $v0, $v0, $t2
    /* 2F2B8 8003F2B8 C0100200 */  sll        $v0, $v0, 3
    /* 2F2BC 8003F2BC 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2F2C0 8003F2C0 21082200 */  addu       $at, $at, $v0
    /* 2F2C4 8003F2C4 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 2F2C8 8003F2C8 01006B25 */  addiu      $t3, $t3, 0x1
    /* 2F2CC 8003F2CC 2A106201 */  slt        $v0, $t3, $v0
    /* 2F2D0 8003F2D0 B2FF4014 */  bnez       $v0, .L8003F19C
    /* 2F2D4 8003F2D4 6C008C25 */   addiu     $t4, $t4, 0x6C
  .L8003F2D8:
    /* 2F2D8 8003F2D8 21580000 */  addu       $t3, $zero, $zero
    /* 2F2DC 8003F2DC 40100A00 */  sll        $v0, $t2, 1
    /* 2F2E0 8003F2E0 21104A00 */  addu       $v0, $v0, $t2
    /* 2F2E4 8003F2E4 80100200 */  sll        $v0, $v0, 2
    /* 2F2E8 8003F2E8 21104A00 */  addu       $v0, $v0, $t2
    /* 2F2EC 8003F2EC 00110200 */  sll        $v0, $v0, 4
    /* 2F2F0 8003F2F0 23104A00 */  subu       $v0, $v0, $t2
    /* 2F2F4 8003F2F4 80100200 */  sll        $v0, $v0, 2
    /* 2F2F8 8003F2F8 21104A00 */  addu       $v0, $v0, $t2
    /* 2F2FC 8003F2FC C0380200 */  sll        $a3, $v0, 3
    /* 2F300 8003F300 2160E000 */  addu       $t4, $a3, $zero
  .L8003F304:
    /* 2F304 8003F304 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 2F308 8003F308 21082700 */  addu       $at, $at, $a3
    /* 2F30C 8003F30C 14BB2384 */  lh         $v1, %lo(plr + 0x15DC)($at)
    /* 2F310 8003F310 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2F314 8003F314 31006210 */  beq        $v1, $v0, .L8003F3DC
    /* 2F318 8003F318 00000000 */   nop
    /* 2F31C 8003F31C 0E80013C */  lui        $at, %hi(plr + 0x15FD)
    /* 2F320 8003F320 21082700 */  addu       $at, $at, $a3
    /* 2F324 8003F324 35BB2290 */  lbu        $v0, %lo(plr + 0x15FD)($at)
    /* 2F328 8003F328 00000000 */  nop
    /* 2F32C 8003F32C EBFF4224 */  addiu      $v0, $v0, -0x15
    /* 2F330 8003F330 0200422C */  sltiu      $v0, $v0, 0x2
    /* 2F334 8003F334 29004010 */  beqz       $v0, .L8003F3DC
    /* 2F338 8003F338 00000000 */   nop
    /* 2F33C 8003F33C 0E80013C */  lui        $at, %hi(plr + 0x1616)
    /* 2F340 8003F340 21082700 */  addu       $at, $at, $a3
    /* 2F344 8003F344 4EBB2280 */  lb         $v0, %lo(plr + 0x1616)($at)
    /* 2F348 8003F348 00000000 */  nop
    /* 2F34C 8003F34C 23004010 */  beqz       $v0, .L8003F3DC
    /* 2F350 8003F350 00000000 */   nop
    /* 2F354 8003F354 00000924 */  addiu      $t1, $zero, 0x0
    /* 2F358 8003F358 01000824 */  addiu      $t0, $zero, 0x1
    /* 2F35C 8003F35C 0E80013C */  lui        $at, %hi(plr + 0x15ED)
    /* 2F360 8003F360 21082700 */  addu       $at, $at, $a3
    /* 2F364 8003F364 25BB2480 */  lb         $a0, %lo(plr + 0x15ED)($at)
    /* 2F368 8003F368 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 2F36C 8003F36C 21082C00 */  addu       $at, $at, $t4
    /* 2F370 8003F370 00A6228C */  lw         $v0, %lo(plr + 0xC8)($at)
    /* 2F374 8003F374 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 2F378 8003F378 21082C00 */  addu       $at, $at, $t4
    /* 2F37C 8003F37C 04A6238C */  lw         $v1, %lo(plr + 0xCC)($at)
    /* 2F380 8003F380 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 2F384 8003F384 80360400 */  sll        $a2, $a0, 26
    /* 2F388 8003F388 0400C104 */  bgez       $a2, .L8003F39C
    /* 2F38C 8003F38C 00000000 */   nop
    /* 2F390 8003F390 04788800 */  sllv       $t7, $t0, $a0
    /* 2F394 8003F394 07000104 */  bgez       $zero, .L8003F3B4
    /* 2F398 8003F398 21700000 */   addu      $t6, $zero, $zero
  .L8003F39C:
    /* 2F39C 8003F39C 0400C010 */  beqz       $a2, .L8003F3B0
    /* 2F3A0 8003F3A0 04788900 */   sllv      $t7, $t1, $a0
    /* 2F3A4 8003F3A4 23300400 */  negu       $a2, $a0
    /* 2F3A8 8003F3A8 0630C800 */  srlv       $a2, $t0, $a2
    /* 2F3AC 8003F3AC 2578E601 */  or         $t7, $t7, $a2
  .L8003F3B0:
    /* 2F3B0 8003F3B0 04708800 */  sllv       $t6, $t0, $a0
  .L8003F3B4:
    /* 2F3B4 8003F3B4 2120C001 */  addu       $a0, $t6, $zero
    /* 2F3B8 8003F3B8 2128E001 */  addu       $a1, $t7, $zero
    /* 2F3BC 8003F3BC 25186F00 */  or         $v1, $v1, $t7
    /* 2F3C0 8003F3C0 25104E00 */  or         $v0, $v0, $t6
    /* 2F3C4 8003F3C4 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 2F3C8 8003F3C8 21082C00 */  addu       $at, $at, $t4
    /* 2F3CC 8003F3CC 00A622AC */  sw         $v0, %lo(plr + 0xC8)($at)
    /* 2F3D0 8003F3D0 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 2F3D4 8003F3D4 21082C00 */  addu       $at, $at, $t4
    /* 2F3D8 8003F3D8 04A623AC */  sw         $v1, %lo(plr + 0xCC)($at)
  .L8003F3DC:
    /* 2F3DC 8003F3DC 01006B25 */  addiu      $t3, $t3, 0x1
    /* 2F3E0 8003F3E0 08006229 */  slti       $v0, $t3, 0x8
    /* 2F3E4 8003F3E4 C7FF4014 */  bnez       $v0, .L8003F304
    /* 2F3E8 8003F3E8 6C00E724 */   addiu     $a3, $a3, 0x6C
    /* 2F3EC 8003F3EC 40100A00 */  sll        $v0, $t2, 1
    /* 2F3F0 8003F3F0 21104A00 */  addu       $v0, $v0, $t2
    /* 2F3F4 8003F3F4 80100200 */  sll        $v0, $v0, 2
    /* 2F3F8 8003F3F8 21104A00 */  addu       $v0, $v0, $t2
    /* 2F3FC 8003F3FC 00110200 */  sll        $v0, $v0, 4
    /* 2F400 8003F400 23104A00 */  subu       $v0, $v0, $t2
    /* 2F404 8003F404 80100200 */  sll        $v0, $v0, 2
    /* 2F408 8003F408 21104A00 */  addu       $v0, $v0, $t2
    /* 2F40C 8003F40C C0300200 */  sll        $a2, $v0, 3
    /* 2F410 8003F410 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 2F414 8003F414 21082600 */  addu       $at, $at, $a2
    /* 2F418 8003F418 A0A52380 */  lb         $v1, %lo(plr + 0x68)($at)
    /* 2F41C 8003F41C 02000224 */  addiu      $v0, $zero, 0x2
    /* 2F420 8003F420 20006214 */  bne        $v1, $v0, .L8003F4A4
    /* 2F424 8003F424 01000424 */   addiu     $a0, $zero, 0x1
    /* 2F428 8003F428 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 2F42C 8003F42C 21082600 */  addu       $at, $at, $a2
    /* 2F430 8003F430 9CA5258C */  lw         $a1, %lo(plr + 0x64)($at)
    /* 2F434 8003F434 00000000 */  nop
    /* 2F438 8003F438 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 2F43C 8003F43C 0420A400 */  sllv       $a0, $a0, $a1
    /* 2F440 8003F440 21108000 */  addu       $v0, $a0, $zero
    /* 2F444 8003F444 C31F0400 */  sra        $v1, $a0, 31
    /* 2F448 8003F448 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 2F44C 8003F44C 21082600 */  addu       $at, $at, $a2
    /* 2F450 8003F450 00A6248C */  lw         $a0, %lo(plr + 0xC8)($at)
    /* 2F454 8003F454 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 2F458 8003F458 21082600 */  addu       $at, $at, $a2
    /* 2F45C 8003F45C 04A6258C */  lw         $a1, %lo(plr + 0xCC)($at)
    /* 2F460 8003F460 00000000 */  nop
    /* 2F464 8003F464 2428A300 */  and        $a1, $a1, $v1
    /* 2F468 8003F468 24208200 */  and        $a0, $a0, $v0
    /* 2F46C 8003F46C 0D008014 */  bnez       $a0, .L8003F4A4
    /* 2F470 8003F470 00000000 */   nop
    /* 2F474 8003F474 0B00A014 */  bnez       $a1, .L8003F4A4
    /* 2F478 8003F478 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 2F47C 8003F47C 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 2F480 8003F480 21082600 */  addu       $at, $at, $a2
    /* 2F484 8003F484 9CA522AC */  sw         $v0, %lo(plr + 0x64)($at)
    /* 2F488 8003F488 04000224 */  addiu      $v0, $zero, 0x4
    /* 2F48C 8003F48C 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 2F490 8003F490 21082600 */  addu       $at, $at, $a2
    /* 2F494 8003F494 A0A522A0 */  sb         $v0, %lo(plr + 0x68)($at)
    /* 2F498 8003F498 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 2F49C 8003F49C 1280013C */  lui        $at, %hi(force_redraw)
    /* 2F4A0 8003F4A0 90B722AC */  sw         $v0, %lo(force_redraw)($at)
  .L8003F4A4:
    /* 2F4A4 8003F4A4 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 2F4A8 8003F4A8 0800E003 */  jr         $ra
    /* 2F4AC 8003F4AC 00000000 */   nop
endlabel CalcPlrScrolls__Fi
