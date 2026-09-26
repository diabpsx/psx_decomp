.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FixL3Dungeon__Fv, 0x74

glabel FixL3Dungeon__Fv
    /* F480 80149078 21300000 */  addu       $a2, $zero, $zero
    /* F484 8014907C 0E800B3C */  lui        $t3, %hi(dungeon)
    /* F488 80149080 C4406B25 */  addiu      $t3, $t3, %lo(dungeon)
    /* F48C 80149084 0D000A24 */  addiu      $t2, $zero, 0xD
    /* F490 80149088 09000924 */  addiu      $t1, $zero, 0x9
    /* F494 8014908C 0C000824 */  addiu      $t0, $zero, 0xC
  .L80149090:
    /* F498 80149090 21280000 */  addu       $a1, $zero, $zero
    /* F49C 80149094 40380600 */  sll        $a3, $a2, 1
    /* F4A0 80149098 21206001 */  addu       $a0, $t3, $zero
  .L8014909C:
    /* F4A4 8014909C 2118E400 */  addu       $v1, $a3, $a0
    /* F4A8 801490A0 00006294 */  lhu        $v0, 0x0($v1)
    /* F4AC 801490A4 00000000 */  nop
    /* F4B0 801490A8 06004A14 */  bne        $v0, $t2, .L801490C4
    /* F4B4 801490AC 00000000 */   nop
    /* F4B8 801490B0 FEFF6294 */  lhu        $v0, -0x2($v1)
    /* F4BC 801490B4 00000000 */  nop
    /* F4C0 801490B8 02004914 */  bne        $v0, $t1, .L801490C4
    /* F4C4 801490BC 00000000 */   nop
    /* F4C8 801490C0 FEFF68A4 */  sh         $t0, -0x2($v1)
  .L801490C4:
    /* F4CC 801490C4 0100A524 */  addiu      $a1, $a1, 0x1
    /* F4D0 801490C8 2F00A228 */  slti       $v0, $a1, 0x2F
    /* F4D4 801490CC F3FF4014 */  bnez       $v0, .L8014909C
    /* F4D8 801490D0 60008424 */   addiu     $a0, $a0, 0x60
    /* F4DC 801490D4 0100C624 */  addiu      $a2, $a2, 0x1
    /* F4E0 801490D8 2F00C228 */  slti       $v0, $a2, 0x2F
    /* F4E4 801490DC ECFF4014 */  bnez       $v0, .L80149090
    /* F4E8 801490E0 00000000 */   nop
    /* F4EC 801490E4 0800E003 */  jr         $ra
    /* F4F0 801490E8 00000000 */   nop
endlabel FixL3Dungeon__Fv
