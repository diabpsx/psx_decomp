.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5GHall__Fiiii, 0xB4

glabel DRLG_L5GHall__Fiiii
    /* 4D7C 8013E974 1500A714 */  bne        $a1, $a3, .L8013E9CC
    /* 4D80 8013E978 2140A000 */   addu      $t0, $a1, $zero
    /* 4D84 8013E97C 21408000 */  addu       $t0, $a0, $zero
    /* 4D88 8013E980 2A100601 */  slt        $v0, $t0, $a2
    /* 4D8C 8013E984 26004010 */  beqz       $v0, .L8013EA20
    /* 4D90 8013E988 40100800 */   sll       $v0, $t0, 1
    /* 4D94 8013E98C 40380700 */  sll        $a3, $a3, 1
    /* 4D98 8013E990 0C000424 */  addiu      $a0, $zero, 0xC
    /* 4D9C 8013E994 0E80033C */  lui        $v1, %hi(dungeon)
    /* 4DA0 8013E998 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 4DA4 8013E99C 21104800 */  addu       $v0, $v0, $t0
    /* 4DA8 8013E9A0 40110200 */  sll        $v0, $v0, 5
    /* 4DAC 8013E9A4 21184300 */  addu       $v1, $v0, $v1
  .L8013E9A8:
    /* 4DB0 8013E9A8 2110E300 */  addu       $v0, $a3, $v1
    /* 4DB4 8013E9AC 01000825 */  addiu      $t0, $t0, 0x1
    /* 4DB8 8013E9B0 000044A4 */  sh         $a0, 0x0($v0)
    /* 4DBC 8013E9B4 060044A4 */  sh         $a0, 0x6($v0)
    /* 4DC0 8013E9B8 2A100601 */  slt        $v0, $t0, $a2
    /* 4DC4 8013E9BC FAFF4014 */  bnez       $v0, .L8013E9A8
    /* 4DC8 8013E9C0 60006324 */   addiu     $v1, $v1, 0x60
    /* 4DCC 8013E9C4 88FA0408 */  j          .L8013EA20
    /* 4DD0 8013E9C8 00000000 */   nop
  .L8013E9CC:
    /* 4DD4 8013E9CC 2A100701 */  slt        $v0, $t0, $a3
    /* 4DD8 8013E9D0 13004010 */  beqz       $v0, .L8013EA20
    /* 4DDC 8013E9D4 40100400 */   sll       $v0, $a0, 1
    /* 4DE0 8013E9D8 0B000624 */  addiu      $a2, $zero, 0xB
    /* 4DE4 8013E9DC 0E80053C */  lui        $a1, %hi(dungeon)
    /* 4DE8 8013E9E0 C440A524 */  addiu      $a1, $a1, %lo(dungeon)
    /* 4DEC 8013E9E4 21104400 */  addu       $v0, $v0, $a0
    /* 4DF0 8013E9E8 40110200 */  sll        $v0, $v0, 5
    /* 4DF4 8013E9EC 2001A324 */  addiu      $v1, $a1, 0x120
    /* 4DF8 8013E9F0 21184300 */  addu       $v1, $v0, $v1
    /* 4DFC 8013E9F4 40200800 */  sll        $a0, $t0, 1
    /* 4E00 8013E9F8 21188300 */  addu       $v1, $a0, $v1
    /* 4E04 8013E9FC 21104500 */  addu       $v0, $v0, $a1
    /* 4E08 8013EA00 21208200 */  addu       $a0, $a0, $v0
  .L8013EA04:
    /* 4E0C 8013EA04 000086A4 */  sh         $a2, 0x0($a0)
    /* 4E10 8013EA08 000066A4 */  sh         $a2, 0x0($v1)
    /* 4E14 8013EA0C 02006324 */  addiu      $v1, $v1, 0x2
    /* 4E18 8013EA10 01000825 */  addiu      $t0, $t0, 0x1
    /* 4E1C 8013EA14 2A100701 */  slt        $v0, $t0, $a3
    /* 4E20 8013EA18 FAFF4014 */  bnez       $v0, .L8013EA04
    /* 4E24 8013EA1C 02008424 */   addiu     $a0, $a0, 0x2
  .L8013EA20:
    /* 4E28 8013EA20 0800E003 */  jr         $ra
    /* 4E2C 8013EA24 00000000 */   nop
endlabel DRLG_L5GHall__Fiiii
