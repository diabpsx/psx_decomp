.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AFEC, 0x90

glabel func_8013AFEC
    /* 13F4 8013AFEC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 13F8 8013AFF0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 13FC 8013AFF4 21888000 */  addu       $s1, $a0, $zero
    /* 1400 8013AFF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1404 8013AFFC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1408 8013B000 42EC040C */  jal        func_8013B108
    /* 140C 8013B004 2180A000 */   addu      $s0, $a1, $zero
    /* 1410 8013B008 1480033C */  lui        $v1, %hi(D_80139DF4)
    /* 1414 8013B00C F49D638C */  lw         $v1, %lo(D_80139DF4)($v1)
    /* 1418 8013B010 42811000 */  srl        $s0, $s0, 5
    /* 141C 8013B014 0000628C */  lw         $v0, 0x0($v1)
    /* 1420 8013B018 00841000 */  sll        $s0, $s0, 16
    /* 1424 8013B01C 88004234 */  ori        $v0, $v0, 0x88
    /* 1428 8013B020 000062AC */  sw         $v0, 0x0($v1)
    /* 142C 8013B024 1480033C */  lui        $v1, %hi(D_80139DBC)
    /* 1430 8013B028 BC9D638C */  lw         $v1, %lo(D_80139DBC)($v1)
    /* 1434 8013B02C 04002226 */  addiu      $v0, $s1, 0x4
    /* 1438 8013B030 000062AC */  sw         $v0, 0x0($v1)
    /* 143C 8013B034 1480023C */  lui        $v0, %hi(D_80139DC0)
    /* 1440 8013B038 C09D428C */  lw         $v0, %lo(D_80139DC0)($v0)
    /* 1444 8013B03C 20001036 */  ori        $s0, $s0, 0x20
    /* 1448 8013B040 000050AC */  sw         $s0, 0x0($v0)
    /* 144C 8013B044 1480033C */  lui        $v1, %hi(D_80139DEC)
    /* 1450 8013B048 EC9D638C */  lw         $v1, %lo(D_80139DEC)($v1)
    /* 1454 8013B04C 0000228E */  lw         $v0, 0x0($s1)
    /* 1458 8013B050 0001043C */  lui        $a0, (0x1000201 >> 16)
    /* 145C 8013B054 000062AC */  sw         $v0, 0x0($v1)
    /* 1460 8013B058 1480023C */  lui        $v0, %hi(D_80139DC4)
    /* 1464 8013B05C C49D428C */  lw         $v0, %lo(D_80139DC4)($v0)
    /* 1468 8013B060 01028434 */  ori        $a0, $a0, (0x1000201 & 0xFFFF)
    /* 146C 8013B064 000044AC */  sw         $a0, 0x0($v0)
    /* 1470 8013B068 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1474 8013B06C 1400B18F */  lw         $s1, 0x14($sp)
    /* 1478 8013B070 1000B08F */  lw         $s0, 0x10($sp)
    /* 147C 8013B074 0800E003 */  jr         $ra
    /* 1480 8013B078 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel func_8013AFEC
