.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L2DoorFix__Fv, 0xB0

glabel L2DoorFix__Fv
    /* D880 80147478 01000724 */  addiu      $a3, $zero, 0x1
    /* D884 8014747C 0E800B3C */  lui        $t3, %hi(dungeon)
    /* D888 80147480 C4406B25 */  addiu      $t3, $t3, %lo(dungeon)
    /* D88C 80147484 04000E24 */  addiu      $t6, $zero, 0x4
    /* D890 80147488 03000924 */  addiu      $t1, $zero, 0x3
    /* D894 8014748C 07000D24 */  addiu      $t5, $zero, 0x7
    /* D898 80147490 05000C24 */  addiu      $t4, $zero, 0x5
  .L80147494:
    /* D89C 80147494 40300700 */  sll        $a2, $a3, 1
    /* D8A0 80147498 0E800A3C */  lui        $t2, %hi(D_800E4064)
    /* D8A4 8014749C 64404A25 */  addiu      $t2, $t2, %lo(D_800E4064)
    /* D8A8 801474A0 60006425 */  addiu      $a0, $t3, 0x60
    /* D8AC 801474A4 60000524 */  addiu      $a1, $zero, 0x60
    /* D8B0 801474A8 000F6825 */  addiu      $t0, $t3, 0xF00
  .L801474AC:
    /* D8B4 801474AC 2118C400 */  addu       $v1, $a2, $a0
    /* D8B8 801474B0 00006294 */  lhu        $v0, 0x0($v1)
    /* D8BC 801474B4 00000000 */  nop
    /* D8C0 801474B8 08004E14 */  bne        $v0, $t6, .L801474DC
    /* D8C4 801474BC 00000000 */   nop
    /* D8C8 801474C0 FEFF6294 */  lhu        $v0, -0x2($v1)
    /* D8CC 801474C4 00000000 */  nop
    /* D8D0 801474C8 03004914 */  bne        $v0, $t1, .L801474D8
    /* D8D4 801474CC 00000000 */   nop
    /* D8D8 801474D0 00006DA4 */  sh         $t5, 0x0($v1)
    /* D8DC 801474D4 2118C400 */  addu       $v1, $a2, $a0
  .L801474D8:
    /* D8E0 801474D8 00006294 */  lhu        $v0, 0x0($v1)
  .L801474DC:
    /* D8E4 801474DC 00000000 */  nop
    /* D8E8 801474E0 07004C14 */  bne        $v0, $t4, .L80147500
    /* D8EC 801474E4 2110AA00 */   addu      $v0, $a1, $t2
    /* D8F0 801474E8 2110C200 */  addu       $v0, $a2, $v0
    /* D8F4 801474EC 00004294 */  lhu        $v0, 0x0($v0)
    /* D8F8 801474F0 00000000 */  nop
    /* D8FC 801474F4 02004914 */  bne        $v0, $t1, .L80147500
    /* D900 801474F8 09000224 */   addiu     $v0, $zero, 0x9
    /* D904 801474FC 000062A4 */  sh         $v0, 0x0($v1)
  .L80147500:
    /* D908 80147500 60008424 */  addiu      $a0, $a0, 0x60
    /* D90C 80147504 2A108800 */  slt        $v0, $a0, $t0
    /* D910 80147508 E8FF4014 */  bnez       $v0, .L801474AC
    /* D914 8014750C 6000A524 */   addiu     $a1, $a1, 0x60
    /* D918 80147510 0100E724 */  addiu      $a3, $a3, 0x1
    /* D91C 80147514 2800E228 */  slti       $v0, $a3, 0x28
    /* D920 80147518 DEFF4014 */  bnez       $v0, .L80147494
    /* D924 8014751C 00000000 */   nop
    /* D928 80147520 0800E003 */  jr         $ra
    /* D92C 80147524 00000000 */   nop
endlabel L2DoorFix__Fv
