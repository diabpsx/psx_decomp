.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4Shadows__Fv, 0xC4

glabel DRLG_L4Shadows__Fv
    /* 158B0 8014F4A8 01000824 */  addiu      $t0, $zero, 0x1
    /* 158B4 8014F4AC 04000D24 */  addiu      $t5, $zero, 0x4
    /* 158B8 8014F4B0 08000C24 */  addiu      $t4, $zero, 0x8
    /* 158BC 8014F4B4 0F000B24 */  addiu      $t3, $zero, 0xF
    /* 158C0 8014F4B8 0E800A3C */  lui        $t2, %hi(dungeon)
    /* 158C4 8014F4BC C4404A25 */  addiu      $t2, $t2, %lo(dungeon)
    /* 158C8 8014F4C0 A0FF4E25 */  addiu      $t6, $t2, -0x60
  .L8014F4C4:
    /* 158CC 8014F4C4 01000624 */  addiu      $a2, $zero, 0x1
    /* 158D0 8014F4C8 40380800 */  sll        $a3, $t0, 1
    /* 158D4 8014F4CC 06000924 */  addiu      $t1, $zero, 0x6
    /* 158D8 8014F4D0 6000C525 */  addiu      $a1, $t6, 0x60
    /* 158DC 8014F4D4 60004425 */  addiu      $a0, $t2, 0x60
  .L8014F4D8:
    /* 158E0 8014F4D8 2110E400 */  addu       $v0, $a3, $a0
    /* 158E4 8014F4DC 00004394 */  lhu        $v1, 0x0($v0)
    /* 158E8 8014F4E0 00000000 */  nop
    /* 158EC 8014F4E4 03006238 */  xori       $v0, $v1, 0x3
    /* 158F0 8014F4E8 02006D14 */  bne        $v1, $t5, .L8014F4F4
    /* 158F4 8014F4EC 0100422C */   sltiu     $v0, $v0, 0x1
    /* 158F8 8014F4F0 01000224 */  addiu      $v0, $zero, 0x1
  .L8014F4F4:
    /* 158FC 8014F4F4 02006C14 */  bne        $v1, $t4, .L8014F500
    /* 15900 8014F4F8 00000000 */   nop
    /* 15904 8014F4FC 01000224 */  addiu      $v0, $zero, 0x1
  .L8014F500:
    /* 15908 8014F500 03006B14 */  bne        $v1, $t3, .L8014F510
    /* 1590C 8014F504 FF004230 */   andi      $v0, $v0, 0xFF
    /* 15910 8014F508 01000224 */  addiu      $v0, $zero, 0x1
    /* 15914 8014F50C FF004230 */  andi       $v0, $v0, 0xFF
  .L8014F510:
    /* 15918 8014F510 0B004010 */  beqz       $v0, .L8014F540
    /* 1591C 8014F514 2118E500 */   addu      $v1, $a3, $a1
    /* 15920 8014F518 00006294 */  lhu        $v0, 0x0($v1)
    /* 15924 8014F51C 00000000 */  nop
    /* 15928 8014F520 02004914 */  bne        $v0, $t1, .L8014F52C
    /* 1592C 8014F524 2F000224 */   addiu     $v0, $zero, 0x2F
    /* 15930 8014F528 000062A4 */  sh         $v0, 0x0($v1)
  .L8014F52C:
    /* 15934 8014F52C FEFF6294 */  lhu        $v0, -0x2($v1)
    /* 15938 8014F530 00000000 */  nop
    /* 1593C 8014F534 02004914 */  bne        $v0, $t1, .L8014F540
    /* 15940 8014F538 30000224 */   addiu     $v0, $zero, 0x30
    /* 15944 8014F53C FEFF62A4 */  sh         $v0, -0x2($v1)
  .L8014F540:
    /* 15948 8014F540 6000A524 */  addiu      $a1, $a1, 0x60
    /* 1594C 8014F544 0100C624 */  addiu      $a2, $a2, 0x1
    /* 15950 8014F548 2800C228 */  slti       $v0, $a2, 0x28
    /* 15954 8014F54C E2FF4014 */  bnez       $v0, .L8014F4D8
    /* 15958 8014F550 60008424 */   addiu     $a0, $a0, 0x60
    /* 1595C 8014F554 01000825 */  addiu      $t0, $t0, 0x1
    /* 15960 8014F558 28000229 */  slti       $v0, $t0, 0x28
    /* 15964 8014F55C D9FF4014 */  bnez       $v0, .L8014F4C4
    /* 15968 8014F560 00000000 */   nop
    /* 1596C 8014F564 0800E003 */  jr         $ra
    /* 15970 8014F568 00000000 */   nop
endlabel DRLG_L4Shadows__Fv
