.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitFromGt4__9LittleGt4P8POLY_GT4ii, 0x8C

glabel InitFromGt4__9LittleGt4P8POLY_GT4ii
    /* 81CF8 80091CF8 0E00A294 */  lhu        $v0, 0xE($a1)
    /* 81CFC 80091CFC 00000000 */  nop
    /* 81D00 80091D00 020082A4 */  sh         $v0, 0x2($a0)
    /* 81D04 80091D04 1A00A294 */  lhu        $v0, 0x1A($a1)
    /* 81D08 80091D08 00000000 */  nop
    /* 81D0C 80091D0C 060082A4 */  sh         $v0, 0x6($a0)
    /* 81D10 80091D10 0700A290 */  lbu        $v0, 0x7($a1)
    /* 81D14 80091D14 00000000 */  nop
    /* 81D18 80091D18 0E0082A0 */  sb         $v0, 0xE($a0)
    /* 81D1C 80091D1C 0C00A290 */  lbu        $v0, 0xC($a1)
    /* 81D20 80091D20 00000000 */  nop
    /* 81D24 80091D24 000082A0 */  sb         $v0, 0x0($a0)
    /* 81D28 80091D28 0D00A290 */  lbu        $v0, 0xD($a1)
    /* 81D2C 80091D2C 00000000 */  nop
    /* 81D30 80091D30 010082A0 */  sb         $v0, 0x1($a0)
    /* 81D34 80091D34 1800A290 */  lbu        $v0, 0x18($a1)
    /* 81D38 80091D38 00000000 */  nop
    /* 81D3C 80091D3C 040082A0 */  sb         $v0, 0x4($a0)
    /* 81D40 80091D40 1900A290 */  lbu        $v0, 0x19($a1)
    /* 81D44 80091D44 00000000 */  nop
    /* 81D48 80091D48 050082A0 */  sb         $v0, 0x5($a0)
    /* 81D4C 80091D4C 2400A290 */  lbu        $v0, 0x24($a1)
    /* 81D50 80091D50 00000000 */  nop
    /* 81D54 80091D54 080082A0 */  sb         $v0, 0x8($a0)
    /* 81D58 80091D58 2500A290 */  lbu        $v0, 0x25($a1)
    /* 81D5C 80091D5C 00000000 */  nop
    /* 81D60 80091D60 090082A0 */  sb         $v0, 0x9($a0)
    /* 81D64 80091D64 3000A290 */  lbu        $v0, 0x30($a1)
    /* 81D68 80091D68 00000000 */  nop
    /* 81D6C 80091D6C 0A0082A0 */  sb         $v0, 0xA($a0)
    /* 81D70 80091D70 3100A290 */  lbu        $v0, 0x31($a1)
    /* 81D74 80091D74 0C0086A0 */  sb         $a2, 0xC($a0)
    /* 81D78 80091D78 0D0087A0 */  sb         $a3, 0xD($a0)
    /* 81D7C 80091D7C 0800E003 */  jr         $ra
    /* 81D80 80091D80 0B0082A0 */   sb        $v0, 0xB($a0)
endlabel InitFromGt4__9LittleGt4P8POLY_GT4ii
