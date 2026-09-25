.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetUVTpGT3__7TextDatP9FRAME_HDRP8POLY_GT3, 0x84

glabel SetUVTpGT3__7TextDatP9FRAME_HDRP8POLY_GT3
    /* 831CC 800931CC 0400A28C */  lw         $v0, 0x4($a1)
    /* 831D0 800931D0 0800A38C */  lw         $v1, 0x8($a1)
    /* 831D4 800931D4 0100A790 */  lbu        $a3, 0x1($a1)
    /* 831D8 800931D8 0200AA94 */  lhu        $t2, 0x2($a1)
    /* 831DC 800931DC 0000A490 */  lbu        $a0, 0x0($a1)
    /* 831E0 800931E0 42160200 */  srl        $v0, $v0, 25
    /* 831E4 800931E4 01004230 */  andi       $v0, $v0, 0x1
    /* 831E8 800931E8 42420300 */  srl        $t0, $v1, 9
    /* 831EC 800931EC FF010831 */  andi       $t0, $t0, 0x1FF
    /* 831F0 800931F0 2148E000 */  addu       $t1, $a3, $zero
    /* 831F4 800931F4 0A004014 */  bnez       $v0, .L80093220
    /* 831F8 800931F8 FF016330 */   andi      $v1, $v1, 0x1FF
    /* 831FC 800931FC 21108300 */  addu       $v0, $a0, $v1
    /* 83200 80093200 1800C2A0 */  sb         $v0, 0x18($a2)
    /* 83204 80093204 2110E800 */  addu       $v0, $a3, $t0
    /* 83208 80093208 0C00C4A0 */  sb         $a0, 0xC($a2)
    /* 8320C 8009320C 2400C4A0 */  sb         $a0, 0x24($a2)
    /* 83210 80093210 0D00C7A0 */  sb         $a3, 0xD($a2)
    /* 83214 80093214 1900C7A0 */  sb         $a3, 0x19($a2)
    /* 83218 80093218 924C0208 */  j          .L80093248
    /* 8321C 8009321C 2500C2A0 */   sb        $v0, 0x25($a2)
  .L80093220:
    /* 83220 80093220 21102301 */  addu       $v0, $t1, $v1
    /* 83224 80093224 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 83228 80093228 0D00C2A0 */  sb         $v0, 0xD($a2)
    /* 8322C 8009322C 2500C2A0 */  sb         $v0, 0x25($a2)
    /* 83230 80093230 FFFF2225 */  addiu      $v0, $t1, -0x1
    /* 83234 80093234 1900C2A0 */  sb         $v0, 0x19($a2)
    /* 83238 80093238 21108800 */  addu       $v0, $a0, $t0
    /* 8323C 8009323C 0C00C4A0 */  sb         $a0, 0xC($a2)
    /* 83240 80093240 1800C4A0 */  sb         $a0, 0x18($a2)
    /* 83244 80093244 2400C2A0 */  sb         $v0, 0x24($a2)
  .L80093248:
    /* 83248 80093248 0800E003 */  jr         $ra
    /* 8324C 8009324C 1A00CAA4 */   sh        $t2, 0x1A($a2)
endlabel SetUVTpGT3__7TextDatP9FRAME_HDRP8POLY_GT3
