.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5GetArea__Fv, 0x60

glabel L5GetArea__Fv
    /* 3FA4 8013DB9C 21300000 */  addu       $a2, $zero, $zero
    /* 3FA8 8013DBA0 21280000 */  addu       $a1, $zero, $zero
    /* 3FAC 8013DBA4 0E80093C */  lui        $t1, %hi(dungeon)
    /* 3FB0 8013DBA8 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* 3FB4 8013DBAC 01000824 */  addiu      $t0, $zero, 0x1
  .L8013DBB0:
    /* 3FB8 8013DBB0 21200000 */  addu       $a0, $zero, $zero
    /* 3FBC 8013DBB4 40380500 */  sll        $a3, $a1, 1
    /* 3FC0 8013DBB8 21182001 */  addu       $v1, $t1, $zero
  .L8013DBBC:
    /* 3FC4 8013DBBC 2110E300 */  addu       $v0, $a3, $v1
    /* 3FC8 8013DBC0 00004294 */  lhu        $v0, 0x0($v0)
    /* 3FCC 8013DBC4 00000000 */  nop
    /* 3FD0 8013DBC8 02004814 */  bne        $v0, $t0, .L8013DBD4
    /* 3FD4 8013DBCC 00000000 */   nop
    /* 3FD8 8013DBD0 0100C624 */  addiu      $a2, $a2, 0x1
  .L8013DBD4:
    /* 3FDC 8013DBD4 01008424 */  addiu      $a0, $a0, 0x1
    /* 3FE0 8013DBD8 28008228 */  slti       $v0, $a0, 0x28
    /* 3FE4 8013DBDC F7FF4014 */  bnez       $v0, .L8013DBBC
    /* 3FE8 8013DBE0 60006324 */   addiu     $v1, $v1, 0x60
    /* 3FEC 8013DBE4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3FF0 8013DBE8 2800A228 */  slti       $v0, $a1, 0x28
    /* 3FF4 8013DBEC F0FF4014 */  bnez       $v0, .L8013DBB0
    /* 3FF8 8013DBF0 00000000 */   nop
    /* 3FFC 8013DBF4 0800E003 */  jr         $ra
    /* 4000 8013DBF8 2110C000 */   addu      $v0, $a2, $zero
endlabel L5GetArea__Fv
