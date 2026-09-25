.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_Draw__FPUl, 0x1F4

glabel PROF_Draw__FPUl
    /* 86948 80096948 E005828F */  lw         $v0, %gp_rel(ProfOn)($gp)
    /* 8694C 8009694C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 86950 80096950 3000BEAF */  sw         $fp, 0x30($sp)
    /* 86954 80096954 21F08000 */  addu       $fp, $a0, $zero
    /* 86958 80096958 3400BFAF */  sw         $ra, 0x34($sp)
    /* 8695C 8009695C 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 86960 80096960 2800B6AF */  sw         $s6, 0x28($sp)
    /* 86964 80096964 2400B5AF */  sw         $s5, 0x24($sp)
    /* 86968 80096968 2000B4AF */  sw         $s4, 0x20($sp)
    /* 8696C 8009696C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 86970 80096970 1800B2AF */  sw         $s2, 0x18($sp)
    /* 86974 80096974 1400B1AF */  sw         $s1, 0x14($sp)
    /* 86978 80096978 63004010 */  beqz       $v0, .L80096B08
    /* 8697C 8009697C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 86980 80096980 0C1F828F */  lw         $v0, %gp_rel(D_8011C68C)($gp)
    /* 86984 80096984 46000724 */  addiu      $a3, $zero, 0x46
    /* 86988 80096988 18004700 */  mult       $v0, $a3
    /* 8698C 8009698C 12100000 */  mflo       $v0
    /* 86990 80096990 041F908F */  lw         $s0, %gp_rel(D_8011C684)($gp)
    /* 86994 80096994 00000000 */  nop
    /* 86998 80096998 1A005000 */  div        $zero, $v0, $s0
    /* 8699C 8009699C 12900000 */  mflo       $s2
    /* 869A0 800969A0 101F828F */  lw         $v0, %gp_rel(D_8011C690)($gp)
    /* 869A4 800969A4 00000000 */  nop
    /* 869A8 800969A8 18004700 */  mult       $v0, $a3
    /* 869AC 800969AC 12100000 */  mflo       $v0
    /* 869B0 800969B0 14001624 */  addiu      $s6, $zero, 0x14
    /* 869B4 800969B4 00000000 */  nop
    /* 869B8 800969B8 1A005000 */  div        $zero, $v0, $s0
    /* 869BC 800969BC 12800000 */  mflo       $s0
    /* 869C0 800969C0 890F020C */  jal        PRIM_GetNextPolyF4__Fv
    /* 869C4 800969C4 21B80000 */   addu      $s7, $zero, $zero
    /* 869C8 800969C8 2120C003 */  addu       $a0, $fp, $zero
    /* 869CC 800969CC 21284000 */  addu       $a1, $v0, $zero
    /* 869D0 800969D0 05001424 */  addiu      $s4, $zero, 0x5
    /* 869D4 800969D4 28001324 */  addiu      $s3, $zero, 0x28
    /* 869D8 800969D8 14001124 */  addiu      $s1, $zero, 0x14
    /* 869DC 800969DC 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 869E0 800969E0 0A00A2A4 */  sh         $v0, 0xA($a1)
    /* 869E4 800969E4 0E00A2A4 */  sh         $v0, 0xE($a1)
    /* 869E8 800969E8 20000224 */  addiu      $v0, $zero, 0x20
    /* 869EC 800969EC 0700B3A0 */  sb         $s3, 0x7($a1)
    /* 869F0 800969F0 1200A2A4 */  sh         $v0, 0x12($a1)
    /* 869F4 800969F4 1600A2A4 */  sh         $v0, 0x16($a1)
    /* 869F8 800969F8 0700A290 */  lbu        $v0, 0x7($a1)
    /* 869FC 800969FC FF001524 */  addiu      $s5, $zero, 0xFF
    /* 86A00 80096A00 0300B4A0 */  sb         $s4, 0x3($a1)
    /* 86A04 80096A04 0800B1A4 */  sh         $s1, 0x8($a1)
    /* 86A08 80096A08 1000B1A4 */  sh         $s1, 0x10($a1)
    /* 86A0C 80096A0C 0400B5A0 */  sb         $s5, 0x4($a1)
    /* 86A10 80096A10 0500A0A0 */  sb         $zero, 0x5($a1)
    /* 86A14 80096A14 0600A0A0 */  sb         $zero, 0x6($a1)
    /* 86A18 80096A18 02004234 */  ori        $v0, $v0, 0x2
    /* 86A1C 80096A1C 0700A2A0 */  sb         $v0, 0x7($a1)
    /* 86A20 80096A20 14005226 */  addiu      $s2, $s2, 0x14
    /* 86A24 80096A24 0C00B2A4 */  sh         $s2, 0xC($a1)
    /* 86A28 80096A28 524C000C */  jal        AddPrim
    /* 86A2C 80096A2C 1400B2A4 */   sh        $s2, 0x14($a1)
    /* 86A30 80096A30 890F020C */  jal        PRIM_GetNextPolyF4__Fv
    /* 86A34 80096A34 14001026 */   addiu     $s0, $s0, 0x14
    /* 86A38 80096A38 2120C003 */  addu       $a0, $fp, $zero
    /* 86A3C 80096A3C 21284000 */  addu       $a1, $v0, $zero
    /* 86A40 80096A40 0700B3A0 */  sb         $s3, 0x7($a1)
    /* 86A44 80096A44 0700A390 */  lbu        $v1, 0x7($a1)
    /* 86A48 80096A48 22000224 */  addiu      $v0, $zero, 0x22
    /* 86A4C 80096A4C 0A00A2A4 */  sh         $v0, 0xA($a1)
    /* 86A50 80096A50 0E00A2A4 */  sh         $v0, 0xE($a1)
    /* 86A54 80096A54 24000224 */  addiu      $v0, $zero, 0x24
    /* 86A58 80096A58 0300B4A0 */  sb         $s4, 0x3($a1)
    /* 86A5C 80096A5C 0800B1A4 */  sh         $s1, 0x8($a1)
    /* 86A60 80096A60 1000B1A4 */  sh         $s1, 0x10($a1)
    /* 86A64 80096A64 1200A2A4 */  sh         $v0, 0x12($a1)
    /* 86A68 80096A68 1600A2A4 */  sh         $v0, 0x16($a1)
    /* 86A6C 80096A6C 0400A0A0 */  sb         $zero, 0x4($a1)
    /* 86A70 80096A70 0500B5A0 */  sb         $s5, 0x5($a1)
    /* 86A74 80096A74 0600A0A0 */  sb         $zero, 0x6($a1)
    /* 86A78 80096A78 02006334 */  ori        $v1, $v1, 0x2
    /* 86A7C 80096A7C 0700A3A0 */  sb         $v1, 0x7($a1)
    /* 86A80 80096A80 0C00B0A4 */  sh         $s0, 0xC($a1)
    /* 86A84 80096A84 1400B0A4 */  sh         $s0, 0x14($a1)
  .L80096A88:
    /* 86A88 80096A88 524C000C */  jal        AddPrim
    /* 86A8C 80096A8C 00000000 */   nop
    /* 86A90 80096A90 0500E22A */  slti       $v0, $s7, 0x5
    /* 86A94 80096A94 1C004010 */  beqz       $v0, .L80096B08
    /* 86A98 80096A98 00000000 */   nop
    /* 86A9C 80096A9C A10F020C */  jal        PRIM_GetNextPolyF3__Fv
    /* 86AA0 80096AA0 0100F726 */   addiu     $s7, $s7, 0x1
    /* 86AA4 80096AA4 FEFFC326 */  addiu      $v1, $s6, -0x2
    /* 86AA8 80096AA8 0200C626 */  addiu      $a2, $s6, 0x2
    /* 86AAC 80096AAC 100056A4 */  sh         $s6, 0x10($v0)
    /* 86AB0 80096AB0 4600D626 */  addiu      $s6, $s6, 0x46
    /* 86AB4 80096AB4 2120C003 */  addu       $a0, $fp, $zero
    /* 86AB8 80096AB8 21284000 */  addu       $a1, $v0, $zero
    /* 86ABC 80096ABC 04000224 */  addiu      $v0, $zero, 0x4
    /* 86AC0 80096AC0 0300A2A0 */  sb         $v0, 0x3($a1)
    /* 86AC4 80096AC4 20000224 */  addiu      $v0, $zero, 0x20
    /* 86AC8 80096AC8 0700A2A0 */  sb         $v0, 0x7($a1)
    /* 86ACC 80096ACC FF000224 */  addiu      $v0, $zero, 0xFF
    /* 86AD0 80096AD0 0800A3A4 */  sh         $v1, 0x8($a1)
    /* 86AD4 80096AD4 0700A390 */  lbu        $v1, 0x7($a1)
    /* 86AD8 80096AD8 1C000724 */  addiu      $a3, $zero, 0x1C
    /* 86ADC 80096ADC 0A00A7A4 */  sh         $a3, 0xA($a1)
    /* 86AE0 80096AE0 0600A2A0 */  sb         $v0, 0x6($a1)
    /* 86AE4 80096AE4 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 86AE8 80096AE8 0400A0A0 */  sb         $zero, 0x4($a1)
    /* 86AEC 80096AEC 0500A0A0 */  sb         $zero, 0x5($a1)
    /* 86AF0 80096AF0 0C00A6A4 */  sh         $a2, 0xC($a1)
    /* 86AF4 80096AF4 0E00A7A4 */  sh         $a3, 0xE($a1)
    /* 86AF8 80096AF8 1200A2A4 */  sh         $v0, 0x12($a1)
    /* 86AFC 80096AFC 02006334 */  ori        $v1, $v1, 0x2
    /* 86B00 80096B00 A25A0208 */  j          .L80096A88
    /* 86B04 80096B04 0700A3A0 */   sb        $v1, 0x7($a1)
  .L80096B08:
    /* 86B08 80096B08 3400BF8F */  lw         $ra, 0x34($sp)
    /* 86B0C 80096B0C 3000BE8F */  lw         $fp, 0x30($sp)
    /* 86B10 80096B10 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 86B14 80096B14 2800B68F */  lw         $s6, 0x28($sp)
    /* 86B18 80096B18 2400B58F */  lw         $s5, 0x24($sp)
    /* 86B1C 80096B1C 2000B48F */  lw         $s4, 0x20($sp)
    /* 86B20 80096B20 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 86B24 80096B24 1800B28F */  lw         $s2, 0x18($sp)
    /* 86B28 80096B28 1400B18F */  lw         $s1, 0x14($sp)
    /* 86B2C 80096B2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 86B30 80096B30 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 86B34 80096B34 0800E003 */  jr         $ra
    /* 86B38 80096B38 00000000 */   nop
endlabel PROF_Draw__FPUl
