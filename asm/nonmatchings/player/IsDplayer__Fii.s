.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsDplayer__Fii, 0x8C

glabel IsDplayer__Fii
    /* 4FD10 8005FD10 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 4FD14 8005FD14 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 4FD18 8005FD18 00000000 */  nop
    /* 4FD1C 8005FD1C 0D004010 */  beqz       $v0, .L8005FD54
    /* 4FD20 8005FD20 00000000 */   nop
    /* 4FD24 8005FD24 0E80023C */  lui        $v0, %hi(plr + 0x30)
    /* 4FD28 8005FD28 68A54284 */  lh         $v0, %lo(plr + 0x30)($v0)
    /* 4FD2C 8005FD2C 00000000 */  nop
    /* 4FD30 8005FD30 08004414 */  bne        $v0, $a0, .L8005FD54
    /* 4FD34 8005FD34 00000000 */   nop
    /* 4FD38 8005FD38 0E80023C */  lui        $v0, %hi(plr + 0x32)
    /* 4FD3C 8005FD3C 6AA54284 */  lh         $v0, %lo(plr + 0x32)($v0)
    /* 4FD40 8005FD40 00000000 */  nop
    /* 4FD44 8005FD44 03004514 */  bne        $v0, $a1, .L8005FD54
    /* 4FD48 8005FD48 00000000 */   nop
    /* 4FD4C 8005FD4C 657F0108 */  j          .L8005FD94
    /* 4FD50 8005FD50 01000224 */   addiu     $v0, $zero, 0x1
  .L8005FD54:
    /* 4FD54 8005FD54 0E80033C */  lui        $v1, %hi(plr + 0x1A05)
    /* 4FD58 8005FD58 3DBF6390 */  lbu        $v1, %lo(plr + 0x1A05)($v1)
    /* 4FD5C 8005FD5C 00000000 */  nop
    /* 4FD60 8005FD60 0C006010 */  beqz       $v1, .L8005FD94
    /* 4FD64 8005FD64 21100000 */   addu      $v0, $zero, $zero
    /* 4FD68 8005FD68 0E80033C */  lui        $v1, %hi(plr + 0x1A18)
    /* 4FD6C 8005FD6C 50BF6384 */  lh         $v1, %lo(plr + 0x1A18)($v1)
    /* 4FD70 8005FD70 00000000 */  nop
    /* 4FD74 8005FD74 07006414 */  bne        $v1, $a0, .L8005FD94
    /* 4FD78 8005FD78 00000000 */   nop
    /* 4FD7C 8005FD7C 0E80023C */  lui        $v0, %hi(plr + 0x1A1A)
    /* 4FD80 8005FD80 52BF4284 */  lh         $v0, %lo(plr + 0x1A1A)($v0)
    /* 4FD84 8005FD84 00000000 */  nop
    /* 4FD88 8005FD88 26104500 */  xor        $v0, $v0, $a1
    /* 4FD8C 8005FD8C 0100422C */  sltiu      $v0, $v0, 0x1
    /* 4FD90 8005FD90 40100200 */  sll        $v0, $v0, 1
  .L8005FD94:
    /* 4FD94 8005FD94 0800E003 */  jr         $ra
    /* 4FD98 8005FD98 00000000 */   nop
endlabel IsDplayer__Fii
