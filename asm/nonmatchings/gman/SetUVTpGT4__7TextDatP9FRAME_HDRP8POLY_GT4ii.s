.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetUVTpGT4__7TextDatP9FRAME_HDRP8POLY_GT4ii, 0x100

glabel SetUVTpGT4__7TextDatP9FRAME_HDRP8POLY_GT4ii
    /* 82E74 80092E74 0400A28C */  lw         $v0, 0x4($a1)
    /* 82E78 80092E78 0800A38C */  lw         $v1, 0x8($a1)
    /* 82E7C 80092E7C 0100A490 */  lbu        $a0, 0x1($a1)
    /* 82E80 80092E80 1000AB8F */  lw         $t3, 0x10($sp)
    /* 82E84 80092E84 0200AC94 */  lhu        $t4, 0x2($a1)
    /* 82E88 80092E88 42160200 */  srl        $v0, $v0, 25
    /* 82E8C 80092E8C 01004230 */  andi       $v0, $v0, 0x1
    /* 82E90 80092E90 42520300 */  srl        $t2, $v1, 9
    /* 82E94 80092E94 FF014A31 */  andi       $t2, $t2, 0x1FF
    /* 82E98 80092E98 FF016830 */  andi       $t0, $v1, 0x1FF
    /* 82E9C 80092E9C 0000A390 */  lbu        $v1, 0x0($a1)
    /* 82EA0 80092EA0 1A004014 */  bnez       $v0, .L80092F0C
    /* 82EA4 80092EA4 21488000 */   addu      $t1, $a0, $zero
    /* 82EA8 80092EA8 0800E010 */  beqz       $a3, .L80092ECC
    /* 82EAC 80092EAC 21106800 */   addu      $v0, $v1, $t0
    /* 82EB0 80092EB0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 82EB4 80092EB4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 82EB8 80092EB8 0C00C2A0 */  sb         $v0, 0xC($a2)
    /* 82EBC 80092EBC 1800C3A0 */  sb         $v1, 0x18($a2)
    /* 82EC0 80092EC0 2400C2A0 */  sb         $v0, 0x24($a2)
    /* 82EC4 80092EC4 B74B0208 */  j          .L80092EDC
    /* 82EC8 80092EC8 3000C3A0 */   sb        $v1, 0x30($a2)
  .L80092ECC:
    /* 82ECC 80092ECC 0C00C3A0 */  sb         $v1, 0xC($a2)
    /* 82ED0 80092ED0 1800C2A0 */  sb         $v0, 0x18($a2)
    /* 82ED4 80092ED4 2400C3A0 */  sb         $v1, 0x24($a2)
    /* 82ED8 80092ED8 3000C2A0 */  sb         $v0, 0x30($a2)
  .L80092EDC:
    /* 82EDC 80092EDC 06006011 */  beqz       $t3, .L80092EF8
    /* 82EE0 80092EE0 21102A01 */   addu      $v0, $t1, $t2
    /* 82EE4 80092EE4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 82EE8 80092EE8 0D00C2A0 */  sb         $v0, 0xD($a2)
    /* 82EEC 80092EEC 1900C2A0 */  sb         $v0, 0x19($a2)
    /* 82EF0 80092EF0 C04B0208 */  j          .L80092F00
    /* 82EF4 80092EF4 FFFF2225 */   addiu     $v0, $t1, -0x1
  .L80092EF8:
    /* 82EF8 80092EF8 0D00C9A0 */  sb         $t1, 0xD($a2)
    /* 82EFC 80092EFC 1900C9A0 */  sb         $t1, 0x19($a2)
  .L80092F00:
    /* 82F00 80092F00 2500C2A0 */  sb         $v0, 0x25($a2)
    /* 82F04 80092F04 DB4B0208 */  j          .L80092F6C
    /* 82F08 80092F08 3100C2A0 */   sb        $v0, 0x31($a2)
  .L80092F0C:
    /* 82F0C 80092F0C 0400E010 */  beqz       $a3, .L80092F20
    /* 82F10 80092F10 21108800 */   addu      $v0, $a0, $t0
    /* 82F14 80092F14 0D00C4A0 */  sb         $a0, 0xD($a2)
    /* 82F18 80092F18 CD4B0208 */  j          .L80092F34
    /* 82F1C 80092F1C 2500C4A0 */   sb        $a0, 0x25($a2)
  .L80092F20:
    /* 82F20 80092F20 21102801 */  addu       $v0, $t1, $t0
    /* 82F24 80092F24 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 82F28 80092F28 0D00C2A0 */  sb         $v0, 0xD($a2)
    /* 82F2C 80092F2C 2500C2A0 */  sb         $v0, 0x25($a2)
    /* 82F30 80092F30 FFFF2225 */  addiu      $v0, $t1, -0x1
  .L80092F34:
    /* 82F34 80092F34 1900C2A0 */  sb         $v0, 0x19($a2)
    /* 82F38 80092F38 07006011 */  beqz       $t3, .L80092F58
    /* 82F3C 80092F3C 3100C2A0 */   sb        $v0, 0x31($a2)
    /* 82F40 80092F40 21106A00 */  addu       $v0, $v1, $t2
    /* 82F44 80092F44 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 82F48 80092F48 0C00C2A0 */  sb         $v0, 0xC($a2)
    /* 82F4C 80092F4C 1800C2A0 */  sb         $v0, 0x18($a2)
    /* 82F50 80092F50 D94B0208 */  j          .L80092F64
    /* 82F54 80092F54 FFFF6224 */   addiu     $v0, $v1, -0x1
  .L80092F58:
    /* 82F58 80092F58 21106A00 */  addu       $v0, $v1, $t2
    /* 82F5C 80092F5C 0C00C3A0 */  sb         $v1, 0xC($a2)
    /* 82F60 80092F60 1800C3A0 */  sb         $v1, 0x18($a2)
  .L80092F64:
    /* 82F64 80092F64 2400C2A0 */  sb         $v0, 0x24($a2)
    /* 82F68 80092F68 3000C2A0 */  sb         $v0, 0x30($a2)
  .L80092F6C:
    /* 82F6C 80092F6C 0800E003 */  jr         $ra
    /* 82F70 80092F70 1A00CCA4 */   sh        $t4, 0x1A($a2)
endlabel SetUVTpGT4__7TextDatP9FRAME_HDRP8POLY_GT4ii
