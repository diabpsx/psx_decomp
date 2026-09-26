.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PackItem__FP12PkItemStructPC10ItemStruct, 0xAC

glabel PackItem__FP12PkItemStructPC10ItemStruct
    /* 20EF4 8015AAEC 2150A000 */  addu       $t2, $a1, $zero
    /* 20EF8 8015AAF0 2C004385 */  lh         $v1, 0x2C($t2)
    /* 20EFC 8015AAF4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 20F00 8015AAF8 04006214 */  bne        $v1, $v0, .L8015AB0C
    /* 20F04 8015AAFC 21588000 */   addu      $t3, $a0, $zero
    /* 20F08 8015AB00 FFFF0234 */  ori        $v0, $zero, 0xFFFF
    /* 20F0C 8015AB04 E46A0508 */  j          .L8015AB90
    /* 20F10 8015AB08 0A0062A5 */   sh        $v0, 0xA($t3)
  .L8015AB0C:
    /* 20F14 8015AB0C 1000428D */  lw         $v0, 0x10($t2)
    /* 20F18 8015AB10 2E004995 */  lhu        $t1, 0x2E($t2)
    /* 20F1C 8015AB14 24004495 */  lhu        $a0, 0x24($t2)
    /* 20F20 8015AB18 51004391 */  lbu        $v1, 0x51($t2)
    /* 20F24 8015AB1C 40004595 */  lhu        $a1, 0x40($t2)
    /* 20F28 8015AB20 49004691 */  lbu        $a2, 0x49($t2)
    /* 20F2C 8015AB24 4B004791 */  lbu        $a3, 0x4B($t2)
    /* 20F30 8015AB28 65004881 */  lb         $t0, 0x65($t2)
    /* 20F34 8015AB2C 040062AD */  sw         $v0, 0x4($t3)
    /* 20F38 8015AB30 69004291 */  lbu        $v0, 0x69($t2)
    /* 20F3C 8015AB34 080064A5 */  sh         $a0, 0x8($t3)
    /* 20F40 8015AB38 3E004495 */  lhu        $a0, 0x3E($t2)
    /* 20F44 8015AB3C 40180300 */  sll        $v1, $v1, 1
    /* 20F48 8015AB40 0A0069A5 */  sh         $t1, 0xA($t3)
    /* 20F4C 8015AB44 100065A1 */  sb         $a1, 0x10($t3)
    /* 20F50 8015AB48 110066A1 */  sb         $a2, 0x11($t3)
    /* 20F54 8015AB4C 120067A1 */  sb         $a3, 0x12($t3)
    /* 20F58 8015AB50 000068AD */  sw         $t0, 0x0($t3)
    /* 20F5C 8015AB54 21104300 */  addu       $v0, $v0, $v1
    /* 20F60 8015AB58 0E0062A1 */  sb         $v0, 0xE($t3)
    /* 20F64 8015AB5C 04002015 */  bnez       $t1, .L8015AB70
    /* 20F68 8015AB60 0F0064A1 */   sb        $a0, 0xF($t3)
    /* 20F6C 8015AB64 1400428D */  lw         $v0, 0x14($t2)
    /* 20F70 8015AB68 E46A0508 */  j          .L8015AB90
    /* 20F74 8015AB6C 0C0062A5 */   sh        $v0, 0xC($t3)
  .L8015AB70:
    /* 20F78 8015AB70 3C004291 */  lbu        $v0, 0x3C($t2)
    /* 20F7C 8015AB74 4A004391 */  lbu        $v1, 0x4A($t2)
    /* 20F80 8015AB78 00160200 */  sll        $v0, $v0, 24
    /* 20F84 8015AB7C 03160200 */  sra        $v0, $v0, 24
    /* 20F88 8015AB80 001E0300 */  sll        $v1, $v1, 24
    /* 20F8C 8015AB84 031C0300 */  sra        $v1, $v1, 16
    /* 20F90 8015AB88 25104300 */  or         $v0, $v0, $v1
    /* 20F94 8015AB8C 0C0062A5 */  sh         $v0, 0xC($t3)
  .L8015AB90:
    /* 20F98 8015AB90 0800E003 */  jr         $ra
    /* 20F9C 8015AB94 00000000 */   nop
endlabel PackItem__FP12PkItemStructPC10ItemStruct
