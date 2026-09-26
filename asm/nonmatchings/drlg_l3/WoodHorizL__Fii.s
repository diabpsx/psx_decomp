.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WoodHorizL__Fii, 0x94

glabel WoodHorizL__Fii
    /* 11CBC 8014B8B4 0E80033C */  lui        $v1, %hi(dungeon)
    /* 11CC0 8014B8B8 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 11CC4 8014B8BC 40100400 */  sll        $v0, $a0, 1
    /* 11CC8 8014B8C0 21104400 */  addu       $v0, $v0, $a0
    /* 11CCC 8014B8C4 40110200 */  sll        $v0, $v0, 5
    /* 11CD0 8014B8C8 21104300 */  addu       $v0, $v0, $v1
    /* 11CD4 8014B8CC 40280500 */  sll        $a1, $a1, 1
    /* 11CD8 8014B8D0 2128A200 */  addu       $a1, $a1, $v0
    /* 11CDC 8014B8D4 0200A294 */  lhu        $v0, 0x2($a1)
    /* 11CE0 8014B8D8 00000000 */  nop
    /* 11CE4 8014B8DC 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11CE8 8014B8E0 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11CEC 8014B8E4 16004014 */  bnez       $v0, .L8014B940
    /* 11CF0 8014B8E8 21100000 */   addu      $v0, $zero, $zero
    /* 11CF4 8014B8EC FEFFA294 */  lhu        $v0, -0x2($a1)
    /* 11CF8 8014B8F0 00000000 */  nop
    /* 11CFC 8014B8F4 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11D00 8014B8F8 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11D04 8014B8FC 10004014 */  bnez       $v0, .L8014B940
    /* 11D08 8014B900 21100000 */   addu      $v0, $zero, $zero
    /* 11D0C 8014B904 0000A594 */  lhu        $a1, 0x0($a1)
    /* 11D10 8014B908 07000224 */  addiu      $v0, $zero, 0x7
    /* 11D14 8014B90C 0B00A210 */  beq        $a1, $v0, .L8014B93C
    /* 11D18 8014B910 09000224 */   addiu     $v0, $zero, 0x9
    /* 11D1C 8014B914 0900A210 */  beq        $a1, $v0, .L8014B93C
    /* 11D20 8014B918 79000224 */   addiu     $v0, $zero, 0x79
    /* 11D24 8014B91C 0700A210 */  beq        $a1, $v0, .L8014B93C
    /* 11D28 8014B920 7C000224 */   addiu     $v0, $zero, 0x7C
    /* 11D2C 8014B924 0500A210 */  beq        $a1, $v0, .L8014B93C
    /* 11D30 8014B928 87000224 */   addiu     $v0, $zero, 0x87
    /* 11D34 8014B92C 0300A210 */  beq        $a1, $v0, .L8014B93C
    /* 11D38 8014B930 89000224 */   addiu     $v0, $zero, 0x89
    /* 11D3C 8014B934 0200A214 */  bne        $a1, $v0, .L8014B940
    /* 11D40 8014B938 21100000 */   addu      $v0, $zero, $zero
  .L8014B93C:
    /* 11D44 8014B93C 01000224 */  addiu      $v0, $zero, 0x1
  .L8014B940:
    /* 11D48 8014B940 0800E003 */  jr         $ra
    /* 11D4C 8014B944 00000000 */   nop
endlabel WoodHorizL__Fii
