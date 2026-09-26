.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3Edges__Fv, 0x40

glabel DRLG_L3Edges__Fv
    /* FFD0 80149BC8 27000324 */  addiu      $v1, $zero, 0x27
    /* FFD4 80149BCC 0E80023C */  lui        $v0, %hi(dungeon + 0xEEE)
    /* FFD8 80149BD0 B24F4224 */  addiu      $v0, $v0, %lo(dungeon + 0xEEE)
  .L80149BD4:
    /* FFDC 80149BD4 000040A4 */  sh         $zero, 0x0($v0)
    /* FFE0 80149BD8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* FFE4 80149BDC FDFF6104 */  bgez       $v1, .L80149BD4
    /* FFE8 80149BE0 FEFF4224 */   addiu     $v0, $v0, -0x2
    /* FFEC 80149BE4 A00E0224 */  addiu      $v0, $zero, 0xEA0
  .L80149BE8:
    /* FFF0 80149BE8 0E80013C */  lui        $at, %hi(dungeon + 0x4E)
    /* FFF4 80149BEC 21082200 */  addu       $at, $at, $v0
    /* FFF8 80149BF0 124120A4 */  sh         $zero, %lo(dungeon + 0x4E)($at)
    /* FFFC 80149BF4 A0FF4224 */  addiu      $v0, $v0, -0x60
    /* 10000 80149BF8 FBFF4104 */  bgez       $v0, .L80149BE8
    /* 10004 80149BFC 00000000 */   nop
    /* 10008 80149C00 0800E003 */  jr         $ra
    /* 1000C 80149C04 00000000 */   nop
endlabel DRLG_L3Edges__Fv
