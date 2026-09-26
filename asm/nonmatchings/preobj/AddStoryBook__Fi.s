.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddStoryBook__Fi, 0x180

glabel AddStoryBook__Fi
    /* 1D3D0 80156FC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D3D4 80156FCC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D3D8 80156FD0 21808000 */  addu       $s0, $a0, $zero
    /* 1D3DC 80156FD4 0D80043C */  lui        $a0, %hi(glSeedTbl + 0x40)
    /* 1D3E0 80156FD8 9CF7848C */  lw         $a0, %lo(glSeedTbl + 0x40)($a0)
    /* 1D3E4 80156FDC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1D3E8 80156FE0 B3F6000C */  jal        SetRndSeed__Fl
    /* 1D3EC 80156FE4 00000000 */   nop
    /* 1D3F0 80156FE8 C9F6000C */  jal        ENG_random__Fl
    /* 1D3F4 80156FEC 03000424 */   addiu     $a0, $zero, 0x3
    /* 1D3F8 80156FF0 21204000 */  addu       $a0, $v0, $zero
    /* 1D3FC 80156FF4 40101000 */  sll        $v0, $s0, 1
    /* 1D400 80156FF8 21105000 */  addu       $v0, $v0, $s0
    /* 1D404 80156FFC 80100200 */  sll        $v0, $v0, 2
    /* 1D408 80157000 23105000 */  subu       $v0, $v0, $s0
    /* 1D40C 80157004 80280200 */  sll        $a1, $v0, 2
    /* 1D410 80157008 1280033C */  lui        $v1, %hi(currlevel)
    /* 1D414 8015700C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1D418 80157010 04000224 */  addiu      $v0, $zero, 0x4
    /* 1D41C 80157014 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1D420 80157018 21082500 */  addu       $at, $at, $a1
    /* 1D424 8015701C 5A8C24A4 */  sh         $a0, %lo(object + 0xE)($at)
    /* 1D428 80157020 0B006214 */  bne        $v1, $v0, .L80157050
    /* 1D42C 80157024 00140400 */   sll       $v0, $a0, 16
    /* 1D430 80157028 03140200 */  sra        $v0, $v0, 16
    /* 1D434 8015702C 40180200 */  sll        $v1, $v0, 1
    /* 1D438 80157030 21186200 */  addu       $v1, $v1, $v0
    /* 1D43C 80157034 40180300 */  sll        $v1, $v1, 1
    /* 1D440 80157038 0E80013C */  lui        $at, %hi(StoryText)
    /* 1D444 8015703C 21082300 */  addu       $at, $at, $v1
    /* 1D448 80157040 B0402294 */  lhu        $v0, %lo(StoryText)($at)
    /* 1D44C 80157044 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1D450 80157048 21082500 */  addu       $at, $at, $a1
    /* 1D454 8015704C 5C8C22A4 */  sh         $v0, %lo(object + 0x10)($at)
  .L80157050:
    /* 1D458 80157050 1280033C */  lui        $v1, %hi(currlevel)
    /* 1D45C 80157054 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1D460 80157058 08000224 */  addiu      $v0, $zero, 0x8
    /* 1D464 8015705C 11006214 */  bne        $v1, $v0, .L801570A4
    /* 1D468 80157060 0C000224 */   addiu     $v0, $zero, 0xC
    /* 1D46C 80157064 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1D470 80157068 21082500 */  addu       $at, $at, $a1
    /* 1D474 8015706C 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 1D478 80157070 00000000 */  nop
    /* 1D47C 80157074 40180200 */  sll        $v1, $v0, 1
    /* 1D480 80157078 21186200 */  addu       $v1, $v1, $v0
    /* 1D484 8015707C 40180300 */  sll        $v1, $v1, 1
    /* 1D488 80157080 0E80013C */  lui        $at, %hi(StoryText + 0x2)
    /* 1D48C 80157084 21082300 */  addu       $at, $at, $v1
    /* 1D490 80157088 B2402294 */  lhu        $v0, %lo(StoryText + 0x2)($at)
    /* 1D494 8015708C 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1D498 80157090 21082500 */  addu       $at, $at, $a1
    /* 1D49C 80157094 5C8C22A4 */  sh         $v0, %lo(object + 0x10)($at)
    /* 1D4A0 80157098 1280033C */  lui        $v1, %hi(currlevel)
    /* 1D4A4 8015709C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1D4A8 801570A0 0C000224 */  addiu      $v0, $zero, 0xC
  .L801570A4:
    /* 1D4AC 801570A4 0E006214 */  bne        $v1, $v0, .L801570E0
    /* 1D4B0 801570A8 00000000 */   nop
    /* 1D4B4 801570AC 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1D4B8 801570B0 21082500 */  addu       $at, $at, $a1
    /* 1D4BC 801570B4 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 1D4C0 801570B8 00000000 */  nop
    /* 1D4C4 801570BC 40180200 */  sll        $v1, $v0, 1
    /* 1D4C8 801570C0 21186200 */  addu       $v1, $v1, $v0
    /* 1D4CC 801570C4 40180300 */  sll        $v1, $v1, 1
    /* 1D4D0 801570C8 0E80013C */  lui        $at, %hi(StoryText + 0x4)
    /* 1D4D4 801570CC 21082300 */  addu       $at, $at, $v1
    /* 1D4D8 801570D0 B4402294 */  lhu        $v0, %lo(StoryText + 0x4)($at)
    /* 1D4DC 801570D4 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1D4E0 801570D8 21082500 */  addu       $at, $at, $a1
    /* 1D4E4 801570DC 5C8C22A4 */  sh         $v0, %lo(object + 0x10)($at)
  .L801570E0:
    /* 1D4E8 801570E0 1280023C */  lui        $v0, %hi(currlevel)
    /* 1D4EC 801570E4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1D4F0 801570E8 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1D4F4 801570EC 21082500 */  addu       $at, $at, $a1
    /* 1D4F8 801570F0 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 1D4FC 801570F4 01000324 */  addiu      $v1, $zero, 0x1
    /* 1D500 801570F8 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1D504 801570FC 21082500 */  addu       $at, $at, $a1
    /* 1D508 80157100 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
    /* 1D50C 80157104 02000324 */  addiu      $v1, $zero, 0x2
    /* 1D510 80157108 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1D514 8015710C 21082500 */  addu       $at, $at, $a1
    /* 1D518 80157110 608C23A4 */  sh         $v1, %lo(object + 0x14)($at)
    /* 1D51C 80157114 82100200 */  srl        $v0, $v0, 2
    /* 1D520 80157118 40180400 */  sll        $v1, $a0, 1
    /* 1D524 8015711C 21186400 */  addu       $v1, $v1, $a0
    /* 1D528 80157120 21104300 */  addu       $v0, $v0, $v1
    /* 1D52C 80157124 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1D530 80157128 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1D534 8015712C 21082500 */  addu       $at, $at, $a1
    /* 1D538 80157130 5E8C22A4 */  sh         $v0, %lo(object + 0x12)($at)
    /* 1D53C 80157134 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D540 80157138 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D544 8015713C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D548 80157140 0800E003 */  jr         $ra
    /* 1D54C 80157144 00000000 */   nop
endlabel AddStoryBook__Fi
