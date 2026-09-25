.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintChar__5CFontUsUsUcUcUcUc, 0x1A4

glabel PrintChar__5CFontUsUsUcUcUcUc
    /* 79EEC 80089EEC B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 79EF0 80089EF0 3400B5AF */  sw         $s5, 0x34($sp)
    /* 79EF4 80089EF4 5800B593 */  lbu        $s5, 0x58($sp)
    /* 79EF8 80089EF8 3800B6AF */  sw         $s6, 0x38($sp)
    /* 79EFC 80089EFC 5C00B693 */  lbu        $s6, 0x5C($sp)
    /* 79F00 80089F00 2400B1AF */  sw         $s1, 0x24($sp)
    /* 79F04 80089F04 21888000 */  addu       $s1, $a0, $zero
    /* 79F08 80089F08 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 79F0C 80089F0C 2198A000 */  addu       $s3, $a1, $zero
    /* 79F10 80089F10 3000B4AF */  sw         $s4, 0x30($sp)
    /* 79F14 80089F14 21A0C000 */  addu       $s4, $a2, $zero
    /* 79F18 80089F18 2800B2AF */  sw         $s2, 0x28($sp)
    /* 79F1C 80089F1C 2190E000 */  addu       $s2, $a3, $zero
    /* 79F20 80089F20 2000B0AF */  sw         $s0, 0x20($sp)
    /* 79F24 80089F24 FF005032 */  andi       $s0, $s2, 0xFF
    /* 79F28 80089F28 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 79F2C 80089F2C 6000B793 */  lbu        $s7, 0x60($sp)
    /* 79F30 80089F30 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 79F34 80089F34 09000212 */  beq        $s0, $v0, .L80089F5C
    /* 79F38 80089F38 4000BFAF */   sw        $ra, 0x40($sp)
    /* 79F3C 80089F3C 21202002 */  addu       $a0, $s1, $zero
    /* 79F40 80089F40 422B020C */  jal        IsDefined__5CFontUc
    /* 79F44 80089F44 21280002 */   addu      $a1, $s0, $zero
    /* 79F48 80089F48 01004238 */  xori       $v0, $v0, 0x1
    /* 79F4C 80089F4C 05004010 */  beqz       $v0, .L80089F64
    /* 79F50 80089F50 0A000224 */   addiu     $v0, $zero, 0xA
    /* 79F54 80089F54 04000212 */  beq        $s0, $v0, .L80089F68
    /* 79F58 80089F58 21202002 */   addu      $a0, $s1, $zero
  .L80089F5C:
    /* 79F5C 80089F5C 18280208 */  j          .L8008A060
    /* 79F60 80089F60 21100000 */   addu      $v0, $zero, $zero
  .L80089F64:
    /* 79F64 80089F64 21202002 */  addu       $a0, $s1, $zero
  .L80089F68:
    /* 79F68 80089F68 FF005032 */  andi       $s0, $s2, 0xFF
    /* 79F6C 80089F6C EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 79F70 80089F70 21280002 */   addu      $a1, $s0, $zero
    /* 79F74 80089F74 21202002 */  addu       $a0, $s1, $zero
    /* 79F78 80089F78 21280002 */  addu       $a1, $s0, $zero
    /* 79F7C 80089F7C 4A2B020C */  jal        GetCharFrameNum__5CFontUc
    /* 79F80 80089F80 21904000 */   addu      $s2, $v0, $zero
    /* 79F84 80089F84 21284000 */  addu       $a1, $v0, $zero
    /* 79F88 80089F88 680485AF */  sw         $a1, %gp_rel(CharFrm)($gp)
    /* 79F8C 80089F8C 20000224 */  addiu      $v0, $zero, 0x20
    /* 79F90 80089F90 32000212 */  beq        $s0, $v0, .L8008A05C
    /* 79F94 80089F94 00000000 */   nop
    /* 79F98 80089F98 3000401A */  blez       $s2, .L8008A05C
    /* 79F9C 80089F9C FFFF6632 */   andi      $a2, $s3, 0xFFFF
    /* 79FA0 80089FA0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 79FA4 80089FA4 0402228E */  lw         $v0, 0x204($s1)
    /* 79FA8 80089FA8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 79FAC 80089FAC 01004224 */  addiu      $v0, $v0, 0x1
    /* 79FB0 80089FB0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 79FB4 80089FB4 1402248E */  lw         $a0, 0x214($s1)
    /* 79FB8 80089FB8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 79FBC 80089FBC FFFF8732 */   andi      $a3, $s4, 0xFFFF
    /* 79FC0 80089FC0 6004838F */  lw         $v1, %gp_rel(buttoncol)($gp)
    /* 79FC4 80089FC4 21204000 */  addu       $a0, $v0, $zero
    /* 79FC8 80089FC8 640484AF */  sw         $a0, %gp_rel(CharFt4)($gp)
    /* 79FCC 80089FCC 0E006014 */  bnez       $v1, .L8008A008
    /* 79FD0 80089FD0 00000000 */   nop
    /* 79FD4 80089FD4 6804828F */  lw         $v0, %gp_rel(CharFrm)($gp)
    /* 79FD8 80089FD8 00000000 */  nop
    /* 79FDC 80089FDC 8DFF4224 */  addiu      $v0, $v0, -0x73
    /* 79FE0 80089FE0 0800422C */  sltiu      $v0, $v0, 0x8
    /* 79FE4 80089FE4 08004010 */  beqz       $v0, .L8008A008
    /* 79FE8 80089FE8 80000224 */   addiu     $v0, $zero, 0x80
    /* 79FEC 80089FEC 040082A0 */  sb         $v0, 0x4($a0)
    /* 79FF0 80089FF0 6404838F */  lw         $v1, %gp_rel(CharFt4)($gp)
    /* 79FF4 80089FF4 00000000 */  nop
    /* 79FF8 80089FF8 050062A0 */  sb         $v0, 0x5($v1)
    /* 79FFC 80089FFC 6404838F */  lw         $v1, %gp_rel(CharFt4)($gp)
    /* 7A000 8008A000 0B280208 */  j          .L8008A02C
    /* 7A004 8008A004 060062A0 */   sb        $v0, 0x6($v1)
  .L8008A008:
    /* 7A008 8008A008 6404828F */  lw         $v0, %gp_rel(CharFt4)($gp)
    /* 7A00C 8008A00C 00000000 */  nop
    /* 7A010 8008A010 040055A0 */  sb         $s5, 0x4($v0)
    /* 7A014 8008A014 6404828F */  lw         $v0, %gp_rel(CharFt4)($gp)
    /* 7A018 8008A018 00000000 */  nop
    /* 7A01C 8008A01C 050056A0 */  sb         $s6, 0x5($v0)
    /* 7A020 8008A020 6404828F */  lw         $v0, %gp_rel(CharFt4)($gp)
    /* 7A024 8008A024 00000000 */  nop
    /* 7A028 8008A028 060057A0 */  sb         $s7, 0x6($v0)
  .L8008A02C:
    /* 7A02C 8008A02C 6404838F */  lw         $v1, %gp_rel(CharFt4)($gp)
    /* 7A030 8008A030 00000000 */  nop
    /* 7A034 8008A034 07006290 */  lbu        $v0, 0x7($v1)
    /* 7A038 8008A038 00000000 */  nop
    /* 7A03C 8008A03C FD004230 */  andi       $v0, $v0, 0xFD
    /* 7A040 8008A040 070062A0 */  sb         $v0, 0x7($v1)
    /* 7A044 8008A044 6404838F */  lw         $v1, %gp_rel(CharFt4)($gp)
    /* 7A048 8008A048 00000000 */  nop
    /* 7A04C 8008A04C 07006290 */  lbu        $v0, 0x7($v1)
    /* 7A050 8008A050 00000000 */  nop
    /* 7A054 8008A054 FE004230 */  andi       $v0, $v0, 0xFE
    /* 7A058 8008A058 070062A0 */  sb         $v0, 0x7($v1)
  .L8008A05C:
    /* 7A05C 8008A05C 21104002 */  addu       $v0, $s2, $zero
  .L8008A060:
    /* 7A060 8008A060 4000BF8F */  lw         $ra, 0x40($sp)
    /* 7A064 8008A064 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 7A068 8008A068 3800B68F */  lw         $s6, 0x38($sp)
    /* 7A06C 8008A06C 3400B58F */  lw         $s5, 0x34($sp)
    /* 7A070 8008A070 3000B48F */  lw         $s4, 0x30($sp)
    /* 7A074 8008A074 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 7A078 8008A078 2800B28F */  lw         $s2, 0x28($sp)
    /* 7A07C 8008A07C 2400B18F */  lw         $s1, 0x24($sp)
    /* 7A080 8008A080 2000B08F */  lw         $s0, 0x20($sp)
    /* 7A084 8008A084 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 7A088 8008A088 0800E003 */  jr         $ra
    /* 7A08C 8008A08C 00000000 */   nop
endlabel PrintChar__5CFontUsUsUcUcUcUc
