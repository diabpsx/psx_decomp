.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setUVparams__FP8POLY_FT4P9FRAME_HDR, 0x90

glabel setUVparams__FP8POLY_FT4P9FRAME_HDR
    /* 8EB50 8009EB50 0002033C */  lui        $v1, (0x2000000 >> 16)
    /* 8EB54 8009EB54 0800A28C */  lw         $v0, 0x8($a1)
    /* 8EB58 8009EB58 0100A690 */  lbu        $a2, 0x1($a1)
    /* 8EB5C 8009EB5C 423A0200 */  srl        $a3, $v0, 9
    /* 8EB60 8009EB60 FF01E730 */  andi       $a3, $a3, 0x1FF
    /* 8EB64 8009EB64 FF014830 */  andi       $t0, $v0, 0x1FF
    /* 8EB68 8009EB68 0400A28C */  lw         $v0, 0x4($a1)
    /* 8EB6C 8009EB6C 0000A590 */  lbu        $a1, 0x0($a1)
    /* 8EB70 8009EB70 24104300 */  and        $v0, $v0, $v1
    /* 8EB74 8009EB74 0C004014 */  bnez       $v0, .L8009EBA8
    /* 8EB78 8009EB78 2148C000 */   addu      $t1, $a2, $zero
    /* 8EB7C 8009EB7C 2118A800 */  addu       $v1, $a1, $t0
    /* 8EB80 8009EB80 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 8EB84 8009EB84 2110C700 */  addu       $v0, $a2, $a3
    /* 8EB88 8009EB88 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 8EB8C 8009EB8C 0C0085A0 */  sb         $a1, 0xC($a0)
    /* 8EB90 8009EB90 0D0086A0 */  sb         $a2, 0xD($a0)
    /* 8EB94 8009EB94 140083A0 */  sb         $v1, 0x14($a0)
    /* 8EB98 8009EB98 150086A0 */  sb         $a2, 0x15($a0)
    /* 8EB9C 8009EB9C 1C0085A0 */  sb         $a1, 0x1C($a0)
    /* 8EBA0 8009EBA0 F57A0208 */  j          .L8009EBD4
    /* 8EBA4 8009EBA4 1D0082A0 */   sb        $v0, 0x1D($a0)
  .L8009EBA8:
    /* 8EBA8 8009EBA8 21102801 */  addu       $v0, $t1, $t0
    /* 8EBAC 8009EBAC FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 8EBB0 8009EBB0 2118A700 */  addu       $v1, $a1, $a3
    /* 8EBB4 8009EBB4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 8EBB8 8009EBB8 0D0082A0 */  sb         $v0, 0xD($a0)
    /* 8EBBC 8009EBBC 1D0082A0 */  sb         $v0, 0x1D($a0)
    /* 8EBC0 8009EBC0 FFFF2225 */  addiu      $v0, $t1, -0x1
    /* 8EBC4 8009EBC4 0C0085A0 */  sb         $a1, 0xC($a0)
    /* 8EBC8 8009EBC8 1C0083A0 */  sb         $v1, 0x1C($a0)
    /* 8EBCC 8009EBCC 140085A0 */  sb         $a1, 0x14($a0)
    /* 8EBD0 8009EBD0 150082A0 */  sb         $v0, 0x15($a0)
  .L8009EBD4:
    /* 8EBD4 8009EBD4 240083A0 */  sb         $v1, 0x24($a0)
    /* 8EBD8 8009EBD8 0800E003 */  jr         $ra
    /* 8EBDC 8009EBDC 250082A0 */   sb        $v0, 0x25($a0)
endlabel setUVparams__FP8POLY_FT4P9FRAME_HDR
