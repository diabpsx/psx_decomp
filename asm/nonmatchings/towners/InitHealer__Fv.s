.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitHealer__Fv, 0x134

glabel InitHealer__Fv
    /* 2A9A4 8003A9A4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2A9A8 8003A9A8 60000524 */  addiu      $a1, $zero, 0x60
    /* 2A9AC 8003A9AC 01000624 */  addiu      $a2, $zero, 0x1
    /* 2A9B0 8003A9B0 01000724 */  addiu      $a3, $zero, 0x1
    /* 2A9B4 8003A9B4 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A9B8 8003A9B8 37000224 */  addiu      $v0, $zero, 0x37
    /* 2A9BC 8003A9BC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2A9C0 8003A9C0 4F000224 */  addiu      $v0, $zero, 0x4F
    /* 2A9C4 8003A9C4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2A9C8 8003A9C8 01000224 */  addiu      $v0, $zero, 0x1
    /* 2A9CC 8003A9CC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2A9D0 8003A9D0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2A9D4 8003A9D4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2A9D8 8003A9D8 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2A9DC 8003A9DC 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2A9E0 8003A9E0 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A9E4 8003A9E4 69E8000C */  jal        InitQstSnds__Fi
    /* 2A9E8 8003A9E8 00000000 */   nop
    /* 2A9EC 8003A9EC 1180043C */  lui        $a0, %hi(D_8011125C)
    /* 2A9F0 8003A9F0 5C128424 */  addiu      $a0, $a0, %lo(D_8011125C)
    /* 2A9F4 8003A9F4 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2A9F8 8003A9F8 21280000 */   addu      $a1, $zero, $zero
    /* 2A9FC 8003A9FC 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AA00 8003AA00 21280000 */  addu       $a1, $zero, $zero
    /* 2AA04 8003AA04 40180400 */  sll        $v1, $a0, 1
    /* 2AA08 8003AA08 21186400 */  addu       $v1, $v1, $a0
    /* 2AA0C 8003AA0C 00190300 */  sll        $v1, $v1, 4
    /* 2AA10 8003AA10 21186400 */  addu       $v1, $v1, $a0
    /* 2AA14 8003AA14 80180300 */  sll        $v1, $v1, 2
    /* 2AA18 8003AA18 21206000 */  addu       $a0, $v1, $zero
    /* 2AA1C 8003AA1C 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2AA20 8003AA20 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2AA24 8003AA24 21188300 */  addu       $v1, $a0, $v1
    /* 2AA28 8003AA28 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2AA2C 8003AA2C 21082400 */  addu       $at, $at, $a0
    /* 2AA30 8003AA30 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003AA34:
    /* 2AA34 8003AA34 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2AA38 8003AA38 21082400 */  addu       $at, $at, $a0
    /* 2AA3C 8003AA3C 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2AA40 8003AA40 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2AA44 8003AA44 000062AC */  sw         $v0, 0x0($v1)
    /* 2AA48 8003AA48 0800A228 */  slti       $v0, $a1, 0x8
    /* 2AA4C 8003AA4C F9FF4014 */  bnez       $v0, .L8003AA34
    /* 2AA50 8003AA50 04006324 */   addiu     $v1, $v1, 0x4
    /* 2AA54 8003AA54 14000624 */  addiu      $a2, $zero, 0x14
    /* 2AA58 8003AA58 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AA5C 8003AA5C 00000000 */  nop
    /* 2AA60 8003AA60 40100400 */  sll        $v0, $a0, 1
    /* 2AA64 8003AA64 21104400 */  addu       $v0, $v0, $a0
    /* 2AA68 8003AA68 00110200 */  sll        $v0, $v0, 4
    /* 2AA6C 8003AA6C 21104400 */  addu       $v0, $v0, $a0
    /* 2AA70 8003AA70 80100200 */  sll        $v0, $v0, 2
    /* 2AA74 8003AA74 0D80013C */  lui        $at, %hi(towner + 0xB8)
    /* 2AA78 8003AA78 21082200 */  addu       $at, $at, $v0
    /* 2AA7C 8003AA7C 38FF258C */  lw         $a1, %lo(towner + 0xB8)($at)
    /* 2AA80 8003AA80 14000324 */  addiu      $v1, $zero, 0x14
    /* 2AA84 8003AA84 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2AA88 8003AA88 21082200 */  addu       $at, $at, $v0
    /* 2AA8C 8003AA8C 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2AA90 8003AA90 FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2AA94 8003AA94 06000724 */   addiu     $a3, $zero, 0x6
    /* 2AA98 8003AA98 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AA9C 8003AA9C 06030324 */  addiu      $v1, $zero, 0x306
    /* 2AAA0 8003AAA0 40100400 */  sll        $v0, $a0, 1
    /* 2AAA4 8003AAA4 21104400 */  addu       $v0, $v0, $a0
    /* 2AAA8 8003AAA8 00110200 */  sll        $v0, $v0, 4
    /* 2AAAC 8003AAAC 21104400 */  addu       $v0, $v0, $a0
    /* 2AAB0 8003AAB0 80100200 */  sll        $v0, $v0, 2
    /* 2AAB4 8003AAB4 01008424 */  addiu      $a0, $a0, 0x1
    /* 2AAB8 8003AAB8 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2AABC 8003AABC 21082200 */  addu       $at, $at, $v0
    /* 2AAC0 8003AAC0 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2AAC4 8003AAC4 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2AAC8 8003AAC8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2AACC 8003AACC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2AAD0 8003AAD0 0800E003 */  jr         $ra
    /* 2AAD4 8003AAD4 00000000 */   nop
endlabel InitHealer__Fv
