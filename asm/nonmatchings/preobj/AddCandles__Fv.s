.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddCandles__Fv, 0x88

glabel AddCandles__Fv
    /* 1E3A0 80157F98 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1E3A4 80157F9C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1E3A8 80157FA0 0E80103C */  lui        $s0, %hi(quests + 0x108)
    /* 1E3AC 80157FA4 48DB108E */  lw         $s0, %lo(quests + 0x108)($s0)
    /* 1E3B0 80157FA8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E3B4 80157FAC 0E80113C */  lui        $s1, %hi(quests + 0x10C)
    /* 1E3B8 80157FB0 4CDB318E */  lw         $s1, %lo(quests + 0x10C)($s1)
    /* 1E3BC 80157FB4 57000424 */  addiu      $a0, $zero, 0x57
    /* 1E3C0 80157FB8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1E3C4 80157FBC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1E3C8 80157FC0 FEFF0526 */  addiu      $a1, $s0, -0x2
    /* 1E3CC 80157FC4 01003226 */  addiu      $s2, $s1, 0x1
    /* 1E3D0 80157FC8 BE4E010C */  jal        AddObject__Fiii
    /* 1E3D4 80157FCC 21304002 */   addu      $a2, $s2, $zero
    /* 1E3D8 80157FD0 57000424 */  addiu      $a0, $zero, 0x57
    /* 1E3DC 80157FD4 03000526 */  addiu      $a1, $s0, 0x3
    /* 1E3E0 80157FD8 BE4E010C */  jal        AddObject__Fiii
    /* 1E3E4 80157FDC 21304002 */   addu      $a2, $s2, $zero
    /* 1E3E8 80157FE0 57000424 */  addiu      $a0, $zero, 0x57
    /* 1E3EC 80157FE4 FFFF0526 */  addiu      $a1, $s0, -0x1
    /* 1E3F0 80157FE8 02003126 */  addiu      $s1, $s1, 0x2
    /* 1E3F4 80157FEC BE4E010C */  jal        AddObject__Fiii
    /* 1E3F8 80157FF0 21302002 */   addu      $a2, $s1, $zero
    /* 1E3FC 80157FF4 57000424 */  addiu      $a0, $zero, 0x57
    /* 1E400 80157FF8 02000526 */  addiu      $a1, $s0, 0x2
    /* 1E404 80157FFC BE4E010C */  jal        AddObject__Fiii
    /* 1E408 80158000 21302002 */   addu      $a2, $s1, $zero
    /* 1E40C 80158004 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1E410 80158008 1800B28F */  lw         $s2, 0x18($sp)
    /* 1E414 8015800C 1400B18F */  lw         $s1, 0x14($sp)
    /* 1E418 80158010 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E41C 80158014 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1E420 80158018 0800E003 */  jr         $ra
    /* 1E424 8015801C 00000000 */   nop
endlabel AddCandles__Fv
