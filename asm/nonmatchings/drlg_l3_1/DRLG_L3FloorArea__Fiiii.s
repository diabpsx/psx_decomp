.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3FloorArea__Fiiii, 0x68

glabel DRLG_L3FloorArea__Fiiii
    /* F9C4 801495BC 2A10E500 */  slt        $v0, $a3, $a1
    /* F9C8 801495C0 16004014 */  bnez       $v0, .L8014961C
    /* F9CC 801495C4 00000000 */   nop
    /* F9D0 801495C8 0E800B3C */  lui        $t3, %hi(dungeon)
    /* F9D4 801495CC C4406B25 */  addiu      $t3, $t3, %lo(dungeon)
    /* F9D8 801495D0 01000A24 */  addiu      $t2, $zero, 0x1
  .L801495D4:
    /* F9DC 801495D4 21188000 */  addu       $v1, $a0, $zero
    /* F9E0 801495D8 2A10C400 */  slt        $v0, $a2, $a0
    /* F9E4 801495DC 0B004014 */  bnez       $v0, .L8014960C
    /* F9E8 801495E0 40100300 */   sll       $v0, $v1, 1
    /* F9EC 801495E4 40480500 */  sll        $t1, $a1, 1
    /* F9F0 801495E8 21104300 */  addu       $v0, $v0, $v1
    /* F9F4 801495EC 40110200 */  sll        $v0, $v0, 5
    /* F9F8 801495F0 21404B00 */  addu       $t0, $v0, $t3
  .L801495F4:
    /* F9FC 801495F4 21102801 */  addu       $v0, $t1, $t0
    /* FA00 801495F8 00004AA4 */  sh         $t2, 0x0($v0)
    /* FA04 801495FC 01006324 */  addiu      $v1, $v1, 0x1
    /* FA08 80149600 2A10C300 */  slt        $v0, $a2, $v1
    /* FA0C 80149604 FBFF4010 */  beqz       $v0, .L801495F4
    /* FA10 80149608 60000825 */   addiu     $t0, $t0, 0x60
  .L8014960C:
    /* FA14 8014960C 0100A524 */  addiu      $a1, $a1, 0x1
    /* FA18 80149610 2A10E500 */  slt        $v0, $a3, $a1
    /* FA1C 80149614 EFFF4010 */  beqz       $v0, .L801495D4
    /* FA20 80149618 00000000 */   nop
  .L8014961C:
    /* FA24 8014961C 0800E003 */  jr         $ra
    /* FA28 80149620 00000000 */   nop
endlabel DRLG_L3FloorArea__Fiiii
