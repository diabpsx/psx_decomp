.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeBackBookMenuCtrl__Fv, 0x244

glabel FeBackBookMenuCtrl__Fv
    /* 23C4 8013BFBC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 23C8 8013BFC0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 23CC 8013BFC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 23D0 8013BFC8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 23D4 8013BFCC 87004014 */  bnez       $v0, .L8013C1EC
    /* 23D8 8013BFD0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 23DC 8013BFD4 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 23E0 8013BFD8 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 23E4 8013BFDC 00000000 */  nop
    /* 23E8 8013BFE0 82004014 */  bnez       $v0, .L8013C1EC
    /* 23EC 8013BFE4 00000000 */   nop
    /* 23F0 8013BFE8 1280023C */  lui        $v0, %hi(PauseMode)
    /* 23F4 8013BFEC A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 23F8 8013BFF0 00000000 */  nop
    /* 23FC 8013BFF4 7D004014 */  bnez       $v0, .L8013C1EC
    /* 2400 8013BFF8 00000000 */   nop
    /* 2404 8013BFFC 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2408 8013C000 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 240C 8013C004 00000000 */  nop
    /* 2410 8013C008 01004230 */  andi       $v0, $v0, 0x1
    /* 2414 8013C00C 03004010 */  beqz       $v0, .L8013C01C
    /* 2418 8013C010 00000000 */   nop
    /* 241C 8013C014 9BE9040C */  jal        FeSelUp__Fi
    /* 2420 8013C018 01000424 */   addiu     $a0, $zero, 0x1
  .L8013C01C:
    /* 2424 8013C01C 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2428 8013C020 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 242C 8013C024 00000000 */  nop
    /* 2430 8013C028 02004230 */  andi       $v0, $v0, 0x2
    /* 2434 8013C02C 03004010 */  beqz       $v0, .L8013C03C
    /* 2438 8013C030 00000000 */   nop
    /* 243C 8013C034 D5E9040C */  jal        FeSelDown__Fi
    /* 2440 8013C038 01000424 */   addiu     $a0, $zero, 0x1
  .L8013C03C:
    /* 2444 8013C03C 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2448 8013C040 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 244C 8013C044 00000000 */  nop
    /* 2450 8013C048 50004230 */  andi       $v0, $v0, 0x50
    /* 2454 8013C04C 5F004010 */  beqz       $v0, .L8013C1CC
    /* 2458 8013C050 00000000 */   nop
    /* 245C 8013C054 C6F5000C */  jal        PlaySFX__Fi
    /* 2460 8013C058 33000424 */   addiu     $a0, $zero, 0x33
    /* 2464 8013C05C 280C828F */  lw         $v0, %gp_rel(BookMenu)($gp)
    /* 2468 8013C060 00000000 */  nop
    /* 246C 8013C064 09004014 */  bnez       $v0, .L8013C08C
    /* 2470 8013C068 00000000 */   nop
    /* 2474 8013C06C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2478 8013C070 00000000 */  nop
    /* 247C 8013C074 0400438C */  lw         $v1, 0x4($v0)
    /* 2480 8013C078 03000224 */  addiu      $v0, $zero, 0x3
    /* 2484 8013C07C 03006214 */  bne        $v1, $v0, .L8013C08C
    /* 2488 8013C080 00000000 */   nop
    /* 248C 8013C084 1E37010C */  jal        InitQTextMsg__Fi
    /* 2490 8013C088 0A010424 */   addiu     $a0, $zero, 0x10A
  .L8013C08C:
    /* 2494 8013C08C 280C838F */  lw         $v1, %gp_rel(BookMenu)($gp)
    /* 2498 8013C090 01000224 */  addiu      $v0, $zero, 0x1
    /* 249C 8013C094 21006214 */  bne        $v1, $v0, .L8013C11C
    /* 24A0 8013C098 00000000 */   nop
    /* 24A4 8013C09C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 24A8 8013C0A0 00000000 */  nop
    /* 24AC 8013C0A4 0400428C */  lw         $v0, 0x4($v0)
    /* 24B0 8013C0A8 00000000 */  nop
    /* 24B4 8013C0AC 03004314 */  bne        $v0, $v1, .L8013C0BC
    /* 24B8 8013C0B0 00000000 */   nop
    /* 24BC 8013C0B4 1E37010C */  jal        InitQTextMsg__Fi
    /* 24C0 8013C0B8 08010424 */   addiu     $a0, $zero, 0x108
  .L8013C0BC:
    /* 24C4 8013C0BC 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 24C8 8013C0C0 00000000 */  nop
    /* 24CC 8013C0C4 0400438C */  lw         $v1, 0x4($v0)
    /* 24D0 8013C0C8 02000224 */  addiu      $v0, $zero, 0x2
    /* 24D4 8013C0CC 03006214 */  bne        $v1, $v0, .L8013C0DC
    /* 24D8 8013C0D0 00000000 */   nop
    /* 24DC 8013C0D4 1E37010C */  jal        InitQTextMsg__Fi
    /* 24E0 8013C0D8 0C010424 */   addiu     $a0, $zero, 0x10C
  .L8013C0DC:
    /* 24E4 8013C0DC 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 24E8 8013C0E0 00000000 */  nop
    /* 24EC 8013C0E4 0400438C */  lw         $v1, 0x4($v0)
    /* 24F0 8013C0E8 03000224 */  addiu      $v0, $zero, 0x3
    /* 24F4 8013C0EC 03006214 */  bne        $v1, $v0, .L8013C0FC
    /* 24F8 8013C0F0 00000000 */   nop
    /* 24FC 8013C0F4 1E37010C */  jal        InitQTextMsg__Fi
    /* 2500 8013C0F8 06010424 */   addiu     $a0, $zero, 0x106
  .L8013C0FC:
    /* 2504 8013C0FC 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2508 8013C100 00000000 */  nop
    /* 250C 8013C104 0400438C */  lw         $v1, 0x4($v0)
    /* 2510 8013C108 04000224 */  addiu      $v0, $zero, 0x4
    /* 2514 8013C10C 03006214 */  bne        $v1, $v0, .L8013C11C
    /* 2518 8013C110 00000000 */   nop
    /* 251C 8013C114 1E37010C */  jal        InitQTextMsg__Fi
    /* 2520 8013C118 04010424 */   addiu     $a0, $zero, 0x104
  .L8013C11C:
    /* 2524 8013C11C 280C908F */  lw         $s0, %gp_rel(BookMenu)($gp)
    /* 2528 8013C120 02000224 */  addiu      $v0, $zero, 0x2
    /* 252C 8013C124 29000216 */  bne        $s0, $v0, .L8013C1CC
    /* 2530 8013C128 00000000 */   nop
    /* 2534 8013C12C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2538 8013C130 00000000 */  nop
    /* 253C 8013C134 0400438C */  lw         $v1, 0x4($v0)
    /* 2540 8013C138 01000224 */  addiu      $v0, $zero, 0x1
    /* 2544 8013C13C 03006214 */  bne        $v1, $v0, .L8013C14C
    /* 2548 8013C140 00000000 */   nop
    /* 254C 8013C144 1E37010C */  jal        InitQTextMsg__Fi
    /* 2550 8013C148 09010424 */   addiu     $a0, $zero, 0x109
  .L8013C14C:
    /* 2554 8013C14C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2558 8013C150 00000000 */  nop
    /* 255C 8013C154 0400428C */  lw         $v0, 0x4($v0)
    /* 2560 8013C158 00000000 */  nop
    /* 2564 8013C15C 03005014 */  bne        $v0, $s0, .L8013C16C
    /* 2568 8013C160 00000000 */   nop
    /* 256C 8013C164 1E37010C */  jal        InitQTextMsg__Fi
    /* 2570 8013C168 03010424 */   addiu     $a0, $zero, 0x103
  .L8013C16C:
    /* 2574 8013C16C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2578 8013C170 00000000 */  nop
    /* 257C 8013C174 0400438C */  lw         $v1, 0x4($v0)
    /* 2580 8013C178 03000224 */  addiu      $v0, $zero, 0x3
    /* 2584 8013C17C 03006214 */  bne        $v1, $v0, .L8013C18C
    /* 2588 8013C180 00000000 */   nop
    /* 258C 8013C184 1E37010C */  jal        InitQTextMsg__Fi
    /* 2590 8013C188 05010424 */   addiu     $a0, $zero, 0x105
  .L8013C18C:
    /* 2594 8013C18C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2598 8013C190 00000000 */  nop
    /* 259C 8013C194 0400438C */  lw         $v1, 0x4($v0)
    /* 25A0 8013C198 04000224 */  addiu      $v0, $zero, 0x4
    /* 25A4 8013C19C 03006214 */  bne        $v1, $v0, .L8013C1AC
    /* 25A8 8013C1A0 00000000 */   nop
    /* 25AC 8013C1A4 1E37010C */  jal        InitQTextMsg__Fi
    /* 25B0 8013C1A8 07010424 */   addiu     $a0, $zero, 0x107
  .L8013C1AC:
    /* 25B4 8013C1AC 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 25B8 8013C1B0 00000000 */  nop
    /* 25BC 8013C1B4 0400438C */  lw         $v1, 0x4($v0)
    /* 25C0 8013C1B8 05000224 */  addiu      $v0, $zero, 0x5
    /* 25C4 8013C1BC 03006214 */  bne        $v1, $v0, .L8013C1CC
    /* 25C8 8013C1C0 00000000 */   nop
    /* 25CC 8013C1C4 1E37010C */  jal        InitQTextMsg__Fi
    /* 25D0 8013C1C8 0B010424 */   addiu     $a0, $zero, 0x10B
  .L8013C1CC:
    /* 25D4 8013C1CC 1280023C */  lui        $v0, %hi(DavesPad)
    /* 25D8 8013C1D0 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 25DC 8013C1D4 00000000 */  nop
    /* 25E0 8013C1D8 00014230 */  andi       $v0, $v0, 0x100
    /* 25E4 8013C1DC 03004010 */  beqz       $v0, .L8013C1EC
    /* 25E8 8013C1E0 00000000 */   nop
    /* 25EC 8013C1E4 49E9040C */  jal        FePrevMenu__Fv
    /* 25F0 8013C1E8 00000000 */   nop
  .L8013C1EC:
    /* 25F4 8013C1EC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 25F8 8013C1F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 25FC 8013C1F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2600 8013C1F8 0800E003 */  jr         $ra
    /* 2604 8013C1FC 00000000 */   nop
endlabel FeBackBookMenuCtrl__Fv
