.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StopCARD2, 0xA4

glabel StopCARD2
    /* A94C 8001A94C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* A950 8001A950 08004001 */  jr         $t2
    /* A954 8001A954 4C000924 */   addiu     $t1, $zero, 0x4C
    /* A958 8001A958 00000000 */  nop
    /* A95C 8001A95C 0A006F94 */  lhu        $t7, 0xA($v1)
    /* A960 8001A960 0000083C */  lui        $t0, (0x0 >> 16)
    /* A964 8001A964 25C0E201 */  or         $t8, $t7, $v0
    /* A968 8001A968 12001937 */  ori        $t9, $t8, 0x12
    /* A96C 8001A96C 0A0079A4 */  sh         $t9, 0xA($v1)
    /* A970 8001A970 28000824 */  addiu      $t0, $zero, 0x28
  .L8001A974:
    /* A974 8001A974 FFFF0825 */  addiu      $t0, $t0, -0x1
    /* A978 8001A978 FEFF0015 */  bnez       $t0, .L8001A974
    /* A97C 8001A97C 00000000 */   nop
    /* A980 8001A980 0800E003 */  jr         $ra
    /* A984 8001A984 00000000 */   nop
    /* A988 8001A988 7410628C */  lw         $v0, 0x1074($v1)
    /* A98C 8001A98C 00000000 */  nop
    /* A990 8001A990 80004230 */  andi       $v0, $v0, 0x80
    /* A994 8001A994 0B004010 */  beqz       $v0, .L8001A9C4
    /* A998 8001A998 00000000 */   nop
  .L8001A99C:
    /* A99C 8001A99C 4410628C */  lw         $v0, 0x1044($v1)
    /* A9A0 8001A9A0 00000000 */  nop
    /* A9A4 8001A9A4 80004230 */  andi       $v0, $v0, 0x80
    /* A9A8 8001A9A8 FCFF4014 */  bnez       $v0, .L8001A99C
    /* A9AC 8001A9AC 00000000 */   nop
    /* A9B0 8001A9B0 0100023C */  lui        $v0, (0x10000 >> 16)
    /* A9B4 8001A9B4 FCDF428C */  lw         $v0, -0x2004($v0)
    /* A9B8 8001A9B8 00000000 */  nop
    /* A9BC 8001A9BC 08004000 */  jr         $v0
    /* A9C0 8001A9C0 00000000 */   nop
  .L8001A9C4:
    /* A9C4 8001A9C4 0800E003 */  jr         $ra
    /* A9C8 8001A9C8 00000000 */   nop
  alabel D_8001A9CC
    /* A9CC 8001A9CC 01A0023C */  lui        $v0, %hi(D_A000DFAC)
    /* A9D0 8001A9D0 ACDF4224 */  addiu      $v0, $v0, %lo(D_A000DFAC)
    /* A9D4 8001A9D4 08004000 */  jr         $v0
    /* A9D8 8001A9D8 00000000 */   nop
    /* A9DC 8001A9DC 00000000 */  nop
  alabel D_8001A9E0
    /* A9E0 8001A9E0 01A0083C */  lui        $t0, %hi(D_A000DF80)
    /* A9E4 8001A9E4 80DF0825 */  addiu      $t0, $t0, %lo(D_A000DF80)
    /* A9E8 8001A9E8 09F80001 */  jalr       $t0
    /* A9EC 8001A9EC 00000000 */   nop
endlabel StopCARD2
    /* A9F0 8001A9F0 00000000 */  nop
