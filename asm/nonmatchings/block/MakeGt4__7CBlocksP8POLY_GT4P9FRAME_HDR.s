.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeGt4__7CBlocksP8POLY_GT4P9FRAME_HDR, 0x128

glabel MakeGt4__7CBlocksP8POLY_GT4P9FRAME_HDR
    /* 7DF54 8008DF54 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7DF58 8008DF58 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7DF5C 8008DF5C 2188A000 */  addu       $s1, $a1, $zero
    /* 7DF60 8008DF60 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7DF64 8008DF64 2180C000 */  addu       $s0, $a2, $zero
    /* 7DF68 8008DF68 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7DF6C 8008DF6C 0800038E */  lw         $v1, 0x8($s0)
    /* 7DF70 8008DF70 0C000224 */  addiu      $v0, $zero, 0xC
    /* 7DF74 8008DF74 030022A2 */  sb         $v0, 0x3($s1)
    /* 7DF78 8008DF78 3C000224 */  addiu      $v0, $zero, 0x3C
    /* 7DF7C 8008DF7C 070022A2 */  sb         $v0, 0x7($s1)
    /* 7DF80 8008DF80 080020A6 */  sh         $zero, 0x8($s1)
    /* 7DF84 8008DF84 0A0020A6 */  sh         $zero, 0xA($s1)
    /* 7DF88 8008DF88 160020A6 */  sh         $zero, 0x16($s1)
    /* 7DF8C 8008DF8C 200020A6 */  sh         $zero, 0x20($s1)
    /* 7DF90 8008DF90 42120300 */  srl        $v0, $v1, 9
    /* 7DF94 8008DF94 FF016330 */  andi       $v1, $v1, 0x1FF
    /* 7DF98 8008DF98 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7DF9C 8008DF9C 140023A6 */  sh         $v1, 0x14($s1)
    /* 7DFA0 8008DFA0 220022A6 */  sh         $v0, 0x22($s1)
    /* 7DFA4 8008DFA4 2C0023A6 */  sh         $v1, 0x2C($s1)
    /* 7DFA8 8008DFA8 2E0022A6 */  sh         $v0, 0x2E($s1)
    /* 7DFAC 8008DFAC 06000592 */  lbu        $a1, 0x6($s0)
    /* 7DFB0 8008DFB0 8747020C */  jal        GetPal__7TextDati_80091e1c
    /* 7DFB4 8008DFB4 00000000 */   nop
    /* 7DFB8 8008DFB8 02004294 */  lhu        $v0, 0x2($v0)
    /* 7DFBC 8008DFBC 00000000 */  nop
    /* 7DFC0 8008DFC0 0E0022A6 */  sh         $v0, 0xE($s1)
    /* 7DFC4 8008DFC4 0400038E */  lw         $v1, 0x4($s0)
    /* 7DFC8 8008DFC8 02000996 */  lhu        $t1, 0x2($s0)
    /* 7DFCC 8008DFCC 00000792 */  lbu        $a3, 0x0($s0)
    /* 7DFD0 8008DFD0 01000692 */  lbu        $a2, 0x1($s0)
    /* 7DFD4 8008DFD4 07002292 */  lbu        $v0, 0x7($s1)
    /* 7DFD8 8008DFD8 0800048E */  lw         $a0, 0x8($s0)
    /* 7DFDC 8008DFDC FD004230 */  andi       $v0, $v0, 0xFD
    /* 7DFE0 8008DFE0 421E0300 */  srl        $v1, $v1, 25
    /* 7DFE4 8008DFE4 01006330 */  andi       $v1, $v1, 0x1
    /* 7DFE8 8008DFE8 422A0400 */  srl        $a1, $a0, 9
    /* 7DFEC 8008DFEC FF01A530 */  andi       $a1, $a1, 0x1FF
    /* 7DFF0 8008DFF0 2140C000 */  addu       $t0, $a2, $zero
    /* 7DFF4 8008DFF4 FF018430 */  andi       $a0, $a0, 0x1FF
    /* 7DFF8 8008DFF8 0A006014 */  bnez       $v1, .L8008E024
    /* 7DFFC 8008DFFC 070022A2 */   sb        $v0, 0x7($s1)
    /* 7E000 8008E000 2118E400 */  addu       $v1, $a3, $a0
    /* 7E004 8008E004 2110C500 */  addu       $v0, $a2, $a1
    /* 7E008 8008E008 0C0027A2 */  sb         $a3, 0xC($s1)
    /* 7E00C 8008E00C 0D0026A2 */  sb         $a2, 0xD($s1)
    /* 7E010 8008E010 180023A2 */  sb         $v1, 0x18($s1)
    /* 7E014 8008E014 190026A2 */  sb         $a2, 0x19($s1)
    /* 7E018 8008E018 240027A2 */  sb         $a3, 0x24($s1)
    /* 7E01C 8008E01C 13380208 */  j          .L8008E04C
    /* 7E020 8008E020 250022A2 */   sb        $v0, 0x25($s1)
  .L8008E024:
    /* 7E024 8008E024 21100401 */  addu       $v0, $t0, $a0
    /* 7E028 8008E028 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 7E02C 8008E02C 2118E500 */  addu       $v1, $a3, $a1
    /* 7E030 8008E030 0D0022A2 */  sb         $v0, 0xD($s1)
    /* 7E034 8008E034 250022A2 */  sb         $v0, 0x25($s1)
    /* 7E038 8008E038 FFFF0225 */  addiu      $v0, $t0, -0x1
    /* 7E03C 8008E03C 0C0027A2 */  sb         $a3, 0xC($s1)
    /* 7E040 8008E040 240023A2 */  sb         $v1, 0x24($s1)
    /* 7E044 8008E044 180027A2 */  sb         $a3, 0x18($s1)
    /* 7E048 8008E048 190022A2 */  sb         $v0, 0x19($s1)
  .L8008E04C:
    /* 7E04C 8008E04C 300023A2 */  sb         $v1, 0x30($s1)
    /* 7E050 8008E050 310022A2 */  sb         $v0, 0x31($s1)
    /* 7E054 8008E054 07002292 */  lbu        $v0, 0x7($s1)
    /* 7E058 8008E058 1A0029A6 */  sh         $t1, 0x1A($s1)
    /* 7E05C 8008E05C FE004230 */  andi       $v0, $v0, 0xFE
    /* 7E060 8008E060 070022A2 */  sb         $v0, 0x7($s1)
    /* 7E064 8008E064 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7E068 8008E068 1400B18F */  lw         $s1, 0x14($sp)
    /* 7E06C 8008E06C 1000B08F */  lw         $s0, 0x10($sp)
    /* 7E070 8008E070 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7E074 8008E074 0800E003 */  jr         $ra
    /* 7E078 8008E078 00000000 */   nop
endlabel MakeGt4__7CBlocksP8POLY_GT4P9FRAME_HDR
