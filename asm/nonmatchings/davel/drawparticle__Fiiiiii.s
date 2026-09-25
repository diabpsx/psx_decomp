.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching drawparticle__Fiiiiii, 0x1F8

glabel drawparticle__Fiiiiii
    /* 8EBE0 8009EBE0 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 8EBE4 8009EBE4 4400B5AF */  sw         $s5, 0x44($sp)
    /* 8EBE8 8009EBE8 21A88000 */  addu       $s5, $a0, $zero
    /* 8EBEC 8009EBEC 4800B6AF */  sw         $s6, 0x48($sp)
    /* 8EBF0 8009EBF0 21B0A000 */  addu       $s6, $a1, $zero
    /* 8EBF4 8009EBF4 3000B0AF */  sw         $s0, 0x30($sp)
    /* 8EBF8 8009EBF8 2180C000 */  addu       $s0, $a2, $zero
    /* 8EBFC 8009EBFC 3800B2AF */  sw         $s2, 0x38($sp)
    /* 8EC00 8009EC00 6800B28F */  lw         $s2, 0x68($sp)
    /* 8EC04 8009EC04 21200000 */  addu       $a0, $zero, $zero
    /* 8EC08 8009EC08 5000BEAF */  sw         $fp, 0x50($sp)
    /* 8EC0C 8009EC0C D000FE24 */  addiu      $fp, $a3, 0xD0
    /* 8EC10 8009EC10 5400BFAF */  sw         $ra, 0x54($sp)
    /* 8EC14 8009EC14 4C00B7AF */  sw         $s7, 0x4C($sp)
    /* 8EC18 8009EC18 4000B4AF */  sw         $s4, 0x40($sp)
    /* 8EC1C 8009EC1C 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 8EC20 8009EC20 044F020C */  jal        GM_UseTexData__Fi
    /* 8EC24 8009EC24 3400B1AF */   sw        $s1, 0x34($sp)
    /* 8EC28 8009EC28 21B84000 */  addu       $s7, $v0, $zero
    /* 8EC2C 8009EC2C 2120E002 */  addu       $a0, $s7, $zero
    /* 8EC30 8009EC30 7082020C */  jal        GetFr__7TextDati_800a09c0
    /* 8EC34 8009EC34 2128C003 */   addu      $a1, $fp, $zero
    /* 8EC38 8009EC38 2800A2AF */  sw         $v0, 0x28($sp)
    /* 8EC3C 8009EC3C 0800428C */  lw         $v0, 0x8($v0)
    /* 8EC40 8009EC40 00000000 */  nop
    /* 8EC44 8009EC44 FF015430 */  andi       $s4, $v0, 0x1FF
    /* 8EC48 8009EC48 18009002 */  mult       $s4, $s0
    /* 8EC4C 8009EC4C 429A0200 */  srl        $s3, $v0, 9
    /* 8EC50 8009EC50 12180000 */  mflo       $v1
    /* 8EC54 8009EC54 02006104 */  bgez       $v1, .L8009EC60
    /* 8EC58 8009EC58 FF017332 */   andi      $s3, $s3, 0x1FF
    /* 8EC5C 8009EC5C FF7F6324 */  addiu      $v1, $v1, 0x7FFF
  .L8009EC60:
    /* 8EC60 8009EC60 18007002 */  mult       $s3, $s0
    /* 8EC64 8009EC64 12300000 */  mflo       $a2
    /* 8EC68 8009EC68 0200C104 */  bgez       $a2, .L8009EC74
    /* 8EC6C 8009EC6C C3A30300 */   sra       $s4, $v1, 15
    /* 8EC70 8009EC70 FF7FC624 */  addiu      $a2, $a2, 0x7FFF
  .L8009EC74:
    /* 8EC74 8009EC74 C39B0600 */  sra        $s3, $a2, 15
    /* 8EC78 8009EC78 C2170300 */  srl        $v0, $v1, 31
    /* 8EC7C 8009EC7C 21108202 */  addu       $v0, $s4, $v0
    /* 8EC80 8009EC80 43100200 */  sra        $v0, $v0, 1
    /* 8EC84 8009EC84 23A8A202 */  subu       $s5, $s5, $v0
    /* 8EC88 8009EC88 C2170600 */  srl        $v0, $a2, 31
    /* 8EC8C 8009EC8C 21106202 */  addu       $v0, $s3, $v0
    /* 8EC90 8009EC90 43100200 */  sra        $v0, $v0, 1
    /* 8EC94 8009EC94 23B0C202 */  subu       $s6, $s6, $v0
    /* 8EC98 8009EC98 02841200 */  srl        $s0, $s2, 16
    /* 8EC9C 8009EC9C 028A1200 */  srl        $s1, $s2, 8
    /* 8ECA0 8009ECA0 2B82020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_800a08ac
    /* 8ECA4 8009ECA4 2000A427 */   addiu     $a0, $sp, 0x20
    /* 8ECA8 8009ECA8 2120E002 */  addu       $a0, $s7, $zero
    /* 8ECAC 8009ECAC 2130C003 */  addu       $a2, $fp, $zero
    /* 8ECB0 8009ECB0 1000B6AF */  sw         $s6, 0x10($sp)
    /* 8ECB4 8009ECB4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8ECB8 8009ECB8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 8ECBC 8009ECBC 2000A58F */  lw         $a1, 0x20($sp)
    /* 8ECC0 8009ECC0 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 8ECC4 8009ECC4 2138A002 */   addu      $a3, $s5, $zero
    /* 8ECC8 8009ECC8 2000A28F */  lw         $v0, 0x20($sp)
    /* 8ECCC 8009ECCC 2128B402 */  addu       $a1, $s5, $s4
    /* 8ECD0 8009ECD0 080055A4 */  sh         $s5, 0x8($v0)
    /* 8ECD4 8009ECD4 0A0056A4 */  sh         $s6, 0xA($v0)
    /* 8ECD8 8009ECD8 100045A4 */  sh         $a1, 0x10($v0)
    /* 8ECDC 8009ECDC 120056A4 */  sh         $s6, 0x12($v0)
    /* 8ECE0 8009ECE0 180055A4 */  sh         $s5, 0x18($v0)
    /* 8ECE4 8009ECE4 040050A0 */  sb         $s0, 0x4($v0)
    /* 8ECE8 8009ECE8 2000A48F */  lw         $a0, 0x20($sp)
    /* 8ECEC 8009ECEC 2118D302 */  addu       $v1, $s6, $s3
    /* 8ECF0 8009ECF0 1A0043A4 */  sh         $v1, 0x1A($v0)
    /* 8ECF4 8009ECF4 200045A4 */  sh         $a1, 0x20($v0)
    /* 8ECF8 8009ECF8 220043A4 */  sh         $v1, 0x22($v0)
    /* 8ECFC 8009ECFC 050091A0 */  sb         $s1, 0x5($a0)
    /* 8ED00 8009ED00 2000A28F */  lw         $v0, 0x20($sp)
    /* 8ED04 8009ED04 00000000 */  nop
    /* 8ED08 8009ED08 060052A0 */  sb         $s2, 0x6($v0)
    /* 8ED0C 8009ED0C 2000A38F */  lw         $v1, 0x20($sp)
    /* 8ED10 8009ED10 00000000 */  nop
    /* 8ED14 8009ED14 07006290 */  lbu        $v0, 0x7($v1)
    /* 8ED18 8009ED18 00000000 */  nop
    /* 8ED1C 8009ED1C FD004230 */  andi       $v0, $v0, 0xFD
    /* 8ED20 8009ED20 070062A0 */  sb         $v0, 0x7($v1)
    /* 8ED24 8009ED24 2000A38F */  lw         $v1, 0x20($sp)
    /* 8ED28 8009ED28 00000000 */  nop
    /* 8ED2C 8009ED2C 07006290 */  lbu        $v0, 0x7($v1)
    /* 8ED30 8009ED30 00000000 */  nop
    /* 8ED34 8009ED34 FE004230 */  andi       $v0, $v0, 0xFE
    /* 8ED38 8009ED38 070062A0 */  sb         $v0, 0x7($v1)
    /* 8ED3C 8009ED3C 2000A48F */  lw         $a0, 0x20($sp)
    /* 8ED40 8009ED40 2800A58F */  lw         $a1, 0x28($sp)
    /* 8ED44 8009ED44 D47A020C */  jal        setUVparams__FP8POLY_FT4P9FRAME_HDR
    /* 8ED48 8009ED48 00000000 */   nop
    /* 8ED4C 8009ED4C FF00073C */  lui        $a3, (0xFFFFFF >> 16)
    /* 8ED50 8009ED50 FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
    /* 8ED54 8009ED54 00FF083C */  lui        $t0, (0xFF000000 >> 16)
    /* 8ED58 8009ED58 2120E002 */  addu       $a0, $s7, $zero
    /* 8ED5C 8009ED5C 2000A68F */  lw         $a2, 0x20($sp)
    /* 8ED60 8009ED60 6C00A98F */  lw         $t1, 0x6C($sp)
    /* 8ED64 8009ED64 1280023C */  lui        $v0, %hi(ThisOt)
    /* 8ED68 8009ED68 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 8ED6C 8009ED6C 80280900 */  sll        $a1, $t1, 2
    /* 8ED70 8009ED70 2128A200 */  addu       $a1, $a1, $v0
    /* 8ED74 8009ED74 0000C38C */  lw         $v1, 0x0($a2)
    /* 8ED78 8009ED78 0000A28C */  lw         $v0, 0x0($a1)
    /* 8ED7C 8009ED7C 24186800 */  and        $v1, $v1, $t0
    /* 8ED80 8009ED80 24104700 */  and        $v0, $v0, $a3
    /* 8ED84 8009ED84 25186200 */  or         $v1, $v1, $v0
    /* 8ED88 8009ED88 0000C3AC */  sw         $v1, 0x0($a2)
    /* 8ED8C 8009ED8C 0000A28C */  lw         $v0, 0x0($a1)
    /* 8ED90 8009ED90 2430C700 */  and        $a2, $a2, $a3
    /* 8ED94 8009ED94 24104800 */  and        $v0, $v0, $t0
    /* 8ED98 8009ED98 25104600 */  or         $v0, $v0, $a2
    /* 8ED9C 8009ED9C 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 8EDA0 8009EDA0 0000A2AC */   sw        $v0, 0x0($a1)
    /* 8EDA4 8009EDA4 5400BF8F */  lw         $ra, 0x54($sp)
    /* 8EDA8 8009EDA8 5000BE8F */  lw         $fp, 0x50($sp)
    /* 8EDAC 8009EDAC 4C00B78F */  lw         $s7, 0x4C($sp)
    /* 8EDB0 8009EDB0 4800B68F */  lw         $s6, 0x48($sp)
    /* 8EDB4 8009EDB4 4400B58F */  lw         $s5, 0x44($sp)
    /* 8EDB8 8009EDB8 4000B48F */  lw         $s4, 0x40($sp)
    /* 8EDBC 8009EDBC 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 8EDC0 8009EDC0 3800B28F */  lw         $s2, 0x38($sp)
    /* 8EDC4 8009EDC4 3400B18F */  lw         $s1, 0x34($sp)
    /* 8EDC8 8009EDC8 3000B08F */  lw         $s0, 0x30($sp)
    /* 8EDCC 8009EDCC 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 8EDD0 8009EDD0 0800E003 */  jr         $ra
    /* 8EDD4 8009EDD4 00000000 */   nop
endlabel drawparticle__Fiiiiii
