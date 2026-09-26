.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3GetFloorArea__Fv, 0x50

glabel DRLG_L3GetFloorArea__Fv
    /* 10010 80149C08 21300000 */  addu       $a2, $zero, $zero
    /* 10014 80149C0C 21280000 */  addu       $a1, $zero, $zero
    /* 10018 80149C10 0E80083C */  lui        $t0, %hi(dungeon)
    /* 1001C 80149C14 C4400825 */  addiu      $t0, $t0, %lo(dungeon)
  .L80149C18:
    /* 10020 80149C18 21200000 */  addu       $a0, $zero, $zero
    /* 10024 80149C1C 40380500 */  sll        $a3, $a1, 1
    /* 10028 80149C20 21180001 */  addu       $v1, $t0, $zero
  .L80149C24:
    /* 1002C 80149C24 2110E300 */  addu       $v0, $a3, $v1
    /* 10030 80149C28 00004294 */  lhu        $v0, 0x0($v0)
    /* 10034 80149C2C 01008424 */  addiu      $a0, $a0, 0x1
    /* 10038 80149C30 2130C200 */  addu       $a2, $a2, $v0
    /* 1003C 80149C34 28008228 */  slti       $v0, $a0, 0x28
    /* 10040 80149C38 FAFF4014 */  bnez       $v0, .L80149C24
    /* 10044 80149C3C 60006324 */   addiu     $v1, $v1, 0x60
    /* 10048 80149C40 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1004C 80149C44 2800A228 */  slti       $v0, $a1, 0x28
    /* 10050 80149C48 F3FF4014 */  bnez       $v0, .L80149C18
    /* 10054 80149C4C 00000000 */   nop
    /* 10058 80149C50 0800E003 */  jr         $ra
    /* 1005C 80149C54 2110C000 */   addu      $v0, $a2, $zero
endlabel DRLG_L3GetFloorArea__Fv
