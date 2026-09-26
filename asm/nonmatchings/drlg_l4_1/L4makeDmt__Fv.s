.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4makeDmt__Fv, 0xA4

glabel L4makeDmt__Fv
    /* 15BFC 8014F7F4 21600000 */  addu       $t4, $zero, $zero
    /* 15C00 8014F7F8 01000B24 */  addiu      $t3, $zero, 0x1
    /* 15C04 8014F7FC 15800E3C */  lui        $t6, %hi(L4dungeon)
    /* 15C08 8014F800 18DACE25 */  addiu      $t6, $t6, %lo(L4dungeon)
    /* 15C0C 8014F804 5000D825 */  addiu      $t8, $t6, 0x50
    /* 15C10 8014F808 0E800F3C */  lui        $t7, %hi(dungeon)
    /* 15C14 8014F80C C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
  .L8014F810:
    /* 15C18 8014F810 01000A24 */  addiu      $t2, $zero, 0x1
    /* 15C1C 8014F814 40680C00 */  sll        $t5, $t4, 1
    /* 15C20 8014F818 50000927 */  addiu      $t1, $t8, 0x50
    /* 15C24 8014F81C 5000C825 */  addiu      $t0, $t6, 0x50
    /* 15C28 8014F820 2138E001 */  addu       $a3, $t7, $zero
  .L8014F824:
    /* 15C2C 8014F824 2130A701 */  addu       $a2, $t5, $a3
    /* 15C30 8014F828 6000E724 */  addiu      $a3, $a3, 0x60
    /* 15C34 8014F82C 21282B01 */  addu       $a1, $t1, $t3
    /* 15C38 8014F830 A0002925 */  addiu      $t1, $t1, 0xA0
    /* 15C3C 8014F834 21200B01 */  addu       $a0, $t0, $t3
    /* 15C40 8014F838 0000A390 */  lbu        $v1, 0x0($a1)
    /* 15C44 8014F83C 00008290 */  lbu        $v0, 0x0($a0)
    /* 15C48 8014F840 01008490 */  lbu        $a0, 0x1($a0)
    /* 15C4C 8014F844 40180300 */  sll        $v1, $v1, 1
    /* 15C50 8014F848 21104300 */  addu       $v0, $v0, $v1
    /* 15C54 8014F84C 80200400 */  sll        $a0, $a0, 2
    /* 15C58 8014F850 0100A390 */  lbu        $v1, 0x1($a1)
    /* 15C5C 8014F854 21104400 */  addu       $v0, $v0, $a0
    /* 15C60 8014F858 C0180300 */  sll        $v1, $v1, 3
    /* 15C64 8014F85C 21104300 */  addu       $v0, $v0, $v1
    /* 15C68 8014F860 1580013C */  lui        $at, %hi(L4ConvTbl)
    /* 15C6C 8014F864 21082200 */  addu       $at, $at, $v0
    /* 15C70 8014F868 18F32290 */  lbu        $v0, %lo(L4ConvTbl)($at)
    /* 15C74 8014F86C 02004A25 */  addiu      $t2, $t2, 0x2
    /* 15C78 8014F870 0000C2A4 */  sh         $v0, 0x0($a2)
    /* 15C7C 8014F874 4E004229 */  slti       $v0, $t2, 0x4E
    /* 15C80 8014F878 EAFF4014 */  bnez       $v0, .L8014F824
    /* 15C84 8014F87C A0000825 */   addiu     $t0, $t0, 0xA0
    /* 15C88 8014F880 02006B25 */  addiu      $t3, $t3, 0x2
    /* 15C8C 8014F884 4E006229 */  slti       $v0, $t3, 0x4E
    /* 15C90 8014F888 E1FF4014 */  bnez       $v0, .L8014F810
    /* 15C94 8014F88C 01008C25 */   addiu     $t4, $t4, 0x1
    /* 15C98 8014F890 0800E003 */  jr         $ra
    /* 15C9C 8014F894 00000000 */   nop
endlabel L4makeDmt__Fv
