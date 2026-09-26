.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBlankL3Dungeon__Fv, 0x5C

glabel SetBlankL3Dungeon__Fv
    /* F424 8014901C 21300000 */  addu       $a2, $zero, $zero
    /* F428 80149020 0E80093C */  lui        $t1, %hi(dungeon)
    /* F42C 80149024 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* F430 80149028 08000824 */  addiu      $t0, $zero, 0x8
  .L8014902C:
    /* F434 8014902C 21280000 */  addu       $a1, $zero, $zero
    /* F438 80149030 40380600 */  sll        $a3, $a2, 1
    /* F43C 80149034 21202001 */  addu       $a0, $t1, $zero
  .L80149038:
    /* F440 80149038 2118E400 */  addu       $v1, $a3, $a0
    /* F444 8014903C 00006294 */  lhu        $v0, 0x0($v1)
    /* F448 80149040 00000000 */  nop
    /* F44C 80149044 02004014 */  bnez       $v0, .L80149050
    /* F450 80149048 00000000 */   nop
    /* F454 8014904C 000068A4 */  sh         $t0, 0x0($v1)
  .L80149050:
    /* F458 80149050 0100A524 */  addiu      $a1, $a1, 0x1
    /* F45C 80149054 2F00A228 */  slti       $v0, $a1, 0x2F
    /* F460 80149058 F7FF4014 */  bnez       $v0, .L80149038
    /* F464 8014905C 60008424 */   addiu     $a0, $a0, 0x60
    /* F468 80149060 0100C624 */  addiu      $a2, $a2, 0x1
    /* F46C 80149064 2F00C228 */  slti       $v0, $a2, 0x2F
    /* F470 80149068 F0FF4014 */  bnez       $v0, .L8014902C
    /* F474 8014906C 00000000 */   nop
    /* F478 80149070 0800E003 */  jr         $ra
    /* F47C 80149074 00000000 */   nop
endlabel SetBlankL3Dungeon__Fv
