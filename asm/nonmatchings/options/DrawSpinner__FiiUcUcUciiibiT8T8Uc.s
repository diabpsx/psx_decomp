.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSpinner__FiiUcUcUciiibiT8T8Uc, 0x67C

glabel DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 96A44 800A6A44 58FFBD27 */  addiu      $sp, $sp, -0xA8
    /* 96A48 800A6A48 9400B5AF */  sw         $s5, 0x94($sp)
    /* 96A4C 800A6A4C BC00B58F */  lw         $s5, 0xBC($sp)
    /* 96A50 800A6A50 9000B4AF */  sw         $s4, 0x90($sp)
    /* 96A54 800A6A54 C000B48F */  lw         $s4, 0xC0($sp)
    /* 96A58 800A6A58 9800B6AF */  sw         $s6, 0x98($sp)
    /* 96A5C 800A6A5C C800B68F */  lw         $s6, 0xC8($sp)
    /* 96A60 800A6A60 8400B1AF */  sw         $s1, 0x84($sp)
    /* 96A64 800A6A64 B800B193 */  lbu        $s1, 0xB8($sp)
    /* 96A68 800A6A68 D800AC93 */  lbu        $t4, 0xD8($sp)
    /* 96A6C 800A6A6C A000BEAF */  sw         $fp, 0xA0($sp)
    /* 96A70 800A6A70 21F08000 */  addu       $fp, $a0, $zero
    /* 96A74 800A6A74 8800B2AF */  sw         $s2, 0x88($sp)
    /* 96A78 800A6A78 2190C000 */  addu       $s2, $a2, $zero
    /* 96A7C 800A6A7C 8C00B3AF */  sw         $s3, 0x8C($sp)
    /* 96A80 800A6A80 2198E000 */  addu       $s3, $a3, $zero
    /* 96A84 800A6A84 2800ACA3 */  sb         $t4, 0x28($sp)
    /* 96A88 800A6A88 CC00AC8F */  lw         $t4, 0xCC($sp)
    /* 96A8C 800A6A8C FFFF0234 */  ori        $v0, $zero, 0xFFFF
    /* 96A90 800A6A90 A400BFAF */  sw         $ra, 0xA4($sp)
    /* 96A94 800A6A94 9C00B7AF */  sw         $s7, 0x9C($sp)
    /* 96A98 800A6A98 8000B0AF */  sw         $s0, 0x80($sp)
    /* 96A9C 800A6A9C 05008215 */  bne        $t4, $v0, .L800A6AB4
    /* 96AA0 800A6AA0 2000A5AF */   sw        $a1, 0x20($sp)
    /* 96AA4 800A6AA4 A3AD020C */  jal        GetOverlayOtBase__7CBlocks_800ab68c
    /* 96AA8 800A6AA8 00000000 */   nop
    /* 96AAC 800A6AAC 04004224 */  addiu      $v0, $v0, 0x4
    /* 96AB0 800A6AB0 CC00A2AF */  sw         $v0, 0xCC($sp)
  .L800A6AB4:
    /* 96AB4 800A6AB4 044F020C */  jal        GM_UseTexData__Fi
    /* 96AB8 800A6AB8 21200000 */   addu      $a0, $zero, $zero
    /* 96ABC 800A6ABC 1280033C */  lui        $v1, %hi(PauseMode)
    /* 96AC0 800A6AC0 A4B76390 */  lbu        $v1, %lo(PauseMode)($v1)
    /* 96AC4 800A6AC4 00000000 */  nop
    /* 96AC8 800A6AC8 05006010 */  beqz       $v1, .L800A6AE0
    /* 96ACC 800A6ACC 3000A2AF */   sw        $v0, 0x30($sp)
    /* 96AD0 800A6AD0 0300C016 */  bnez       $s6, .L800A6AE0
    /* 96AD4 800A6AD4 10001024 */   addiu     $s0, $zero, 0x10
    /* 96AD8 800A6AD8 BE9A0208 */  j          .L800A6AF8
    /* 96ADC 800A6ADC 04000524 */   addiu     $a1, $zero, 0x4
  .L800A6AE0:
    /* 96AE0 800A6AE0 3D83000C */  jal        GU_GetRnd
    /* 96AE4 800A6AE4 00000000 */   nop
    /* 96AE8 800A6AE8 3E10020C */  jal        VID_GetTick__Fv
    /* 96AEC 800A6AEC 1F005030 */   andi      $s0, $v0, 0x1F
    /* 96AF0 800A6AF0 82100200 */  srl        $v0, $v0, 2
    /* 96AF4 800A6AF4 07004530 */  andi       $a1, $v0, 0x7
  .L800A6AF8:
    /* 96AF8 800A6AF8 21101402 */  addu       $v0, $s0, $s4
    /* 96AFC 800A6AFC 21204000 */  addu       $a0, $v0, $zero
    /* 96B00 800A6B00 00140200 */  sll        $v0, $v0, 16
    /* 96B04 800A6B04 02004104 */  bgez       $v0, .L800A6B10
    /* 96B08 800A6B08 43B81500 */   sra       $s7, $s5, 1
    /* 96B0C 800A6B0C 21200000 */  addu       $a0, $zero, $zero
  .L800A6B10:
    /* 96B10 800A6B10 FF004332 */  andi       $v1, $s2, 0xFF
    /* 96B14 800A6B14 FFFF8230 */  andi       $v0, $a0, 0xFFFF
    /* 96B18 800A6B18 18006200 */  mult       $v1, $v0
    /* 96B1C 800A6B1C 12200000 */  mflo       $a0
    /* 96B20 800A6B20 FF006332 */  andi       $v1, $s3, 0xFF
    /* 96B24 800A6B24 00000000 */  nop
    /* 96B28 800A6B28 18006200 */  mult       $v1, $v0
    /* 96B2C 800A6B2C 12180000 */  mflo       $v1
    /* 96B30 800A6B30 00000000 */  nop
    /* 96B34 800A6B34 00000000 */  nop
    /* 96B38 800A6B38 18002202 */  mult       $s1, $v0
    /* 96B3C 800A6B3C 02220400 */  srl        $a0, $a0, 8
    /* 96B40 800A6B40 3800A4A7 */  sh         $a0, 0x38($sp)
    /* 96B44 800A6B44 021A0300 */  srl        $v1, $v1, 8
    /* 96B48 800A6B48 4000A3A7 */  sh         $v1, 0x40($sp)
    /* 96B4C 800A6B4C 12100000 */  mflo       $v0
    /* 96B50 800A6B50 02120200 */  srl        $v0, $v0, 8
    /* 96B54 800A6B54 4800A2A7 */  sh         $v0, 0x48($sp)
    /* 96B58 800A6B58 0001822C */  sltiu      $v0, $a0, 0x100
    /* 96B5C 800A6B5C 02004014 */  bnez       $v0, .L800A6B68
    /* 96B60 800A6B60 FF000C24 */   addiu     $t4, $zero, 0xFF
    /* 96B64 800A6B64 3800ACA7 */  sh         $t4, 0x38($sp)
  .L800A6B68:
    /* 96B68 800A6B68 4000AC97 */  lhu        $t4, 0x40($sp)
    /* 96B6C 800A6B6C 00000000 */  nop
    /* 96B70 800A6B70 0001822D */  sltiu      $v0, $t4, 0x100
    /* 96B74 800A6B74 02004014 */  bnez       $v0, .L800A6B80
    /* 96B78 800A6B78 FF000C24 */   addiu     $t4, $zero, 0xFF
    /* 96B7C 800A6B7C 4000ACA7 */  sh         $t4, 0x40($sp)
  .L800A6B80:
    /* 96B80 800A6B80 4800AC97 */  lhu        $t4, 0x48($sp)
    /* 96B84 800A6B84 00000000 */  nop
    /* 96B88 800A6B88 0001822D */  sltiu      $v0, $t4, 0x100
    /* 96B8C 800A6B8C 03004014 */  bnez       $v0, .L800A6B9C
    /* 96B90 800A6B90 00000000 */   nop
    /* 96B94 800A6B94 FF000C24 */  addiu      $t4, $zero, 0xFF
    /* 96B98 800A6B98 4800ACA7 */  sh         $t4, 0x48($sp)
  .L800A6B9C:
    /* 96B9C 800A6B9C 1000C012 */  beqz       $s6, .L800A6BE0
    /* 96BA0 800A6BA0 D000A524 */   addiu     $a1, $a1, 0xD0
    /* 96BA4 800A6BA4 3000A48F */  lw         $a0, 0x30($sp)
    /* 96BA8 800A6BA8 2000A78F */  lw         $a3, 0x20($sp)
    /* 96BAC 800A6BAC CC00AC8F */  lw         $t4, 0xCC($sp)
    /* 96BB0 800A6BB0 2130C003 */  addu       $a2, $fp, $zero
    /* 96BB4 800A6BB4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 96BB8 800A6BB8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 96BBC 800A6BBC 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 96BC0 800A6BC0 1400ACAF */   sw        $t4, 0x14($sp)
    /* 96BC4 800A6BC4 07004390 */  lbu        $v1, 0x7($v0)
    /* 96BC8 800A6BC8 040052A0 */  sb         $s2, 0x4($v0)
    /* 96BCC 800A6BCC 050053A0 */  sb         $s3, 0x5($v0)
    /* 96BD0 800A6BD0 060051A0 */  sb         $s1, 0x6($v0)
    /* 96BD4 800A6BD4 02006334 */  ori        $v1, $v1, 0x2
    /* 96BD8 800A6BD8 FE006330 */  andi       $v1, $v1, 0xFE
    /* 96BDC 800A6BDC 070043A0 */  sb         $v1, 0x7($v0)
  .L800A6BE0:
    /* 96BE0 800A6BE0 2000AC8F */  lw         $t4, 0x20($sp)
    /* 96BE4 800A6BE4 00000000 */  nop
    /* 96BE8 800A6BE8 FDFF8C25 */  addiu      $t4, $t4, -0x3
    /* 96BEC 800A6BEC 2000ACAF */  sw         $t4, 0x20($sp)
    /* 96BF0 800A6BF0 3800AC97 */  lhu        $t4, 0x38($sp)
    /* 96BF4 800A6BF4 00000000 */  nop
    /* 96BF8 800A6BF8 82600C00 */  srl        $t4, $t4, 2
    /* 96BFC 800A6BFC 5000ACA7 */  sh         $t4, 0x50($sp)
    /* 96C00 800A6C00 4000AC97 */  lhu        $t4, 0x40($sp)
    /* 96C04 800A6C04 0300DE27 */  addiu      $fp, $fp, 0x3
    /* 96C08 800A6C08 82600C00 */  srl        $t4, $t4, 2
    /* 96C0C 800A6C0C 5800ACA7 */  sh         $t4, 0x58($sp)
    /* 96C10 800A6C10 4800AC97 */  lhu        $t4, 0x48($sp)
    /* 96C14 800A6C14 C400B58F */  lw         $s5, 0xC4($sp)
    /* 96C18 800A6C18 82600C00 */  srl        $t4, $t4, 2
    /* 96C1C 800A6C1C 6000ACA7 */  sh         $t4, 0x60($sp)
    /* 96C20 800A6C20 2800AC93 */  lbu        $t4, 0x28($sp)
    /* 96C24 800A6C24 0D800A3C */  lui        $t2, %hi(Circle)
    /* 96C28 800A6C28 E0D24A25 */  addiu      $t2, $t2, %lo(Circle)
    /* 96C2C 800A6C2C 6800A0AF */  sw         $zero, 0x68($sp)
    /* 96C30 800A6C30 40580C00 */  sll        $t3, $t4, 1
    /* 96C34 800A6C34 7000ACAF */  sw         $t4, 0x70($sp)
  .L800A6C38:
    /* 96C38 800A6C38 D8000524 */  addiu      $a1, $zero, 0xD8
    /* 96C3C 800A6C3C 3000A48F */  lw         $a0, 0x30($sp)
    /* 96C40 800A6C40 2000A78F */  lw         $a3, 0x20($sp)
    /* 96C44 800A6C44 CC00AC8F */  lw         $t4, 0xCC($sp)
    /* 96C48 800A6C48 2130C003 */  addu       $a2, $fp, $zero
    /* 96C4C 800A6C4C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 96C50 800A6C50 1800A0AF */  sw         $zero, 0x18($sp)
    /* 96C54 800A6C54 7800AAAF */  sw         $t2, 0x78($sp)
    /* 96C58 800A6C58 7C00ABAF */  sw         $t3, 0x7C($sp)
    /* 96C5C 800A6C5C 01008225 */  addiu      $v0, $t4, 0x1
    /* 96C60 800A6C60 5B4D020C */  jal        PrintGt4__7TextDatiiiiii
    /* 96C64 800A6C64 1400A2AF */   sw        $v0, 0x14($sp)
    /* 96C68 800A6C68 21204000 */  addu       $a0, $v0, $zero
    /* 96C6C 800A6C6C 1A008294 */  lhu        $v0, 0x1A($a0)
    /* 96C70 800A6C70 25008390 */  lbu        $v1, 0x25($a0)
    /* 96C74 800A6C74 20004234 */  ori        $v0, $v0, 0x20
    /* 96C78 800A6C78 1A0082A4 */  sh         $v0, 0x1A($a0)
    /* 96C7C 800A6C7C 18008290 */  lbu        $v0, 0x18($a0)
    /* 96C80 800A6C80 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 96C84 800A6C84 250083A0 */  sb         $v1, 0x25($a0)
    /* 96C88 800A6C88 31008390 */  lbu        $v1, 0x31($a0)
    /* 96C8C 800A6C8C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 96C90 800A6C90 180082A0 */  sb         $v0, 0x18($a0)
    /* 96C94 800A6C94 30008290 */  lbu        $v0, 0x30($a0)
    /* 96C98 800A6C98 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 96C9C 800A6C9C 310083A0 */  sb         $v1, 0x31($a0)
    /* 96CA0 800A6CA0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 96CA4 800A6CA4 300082A0 */  sb         $v0, 0x30($a0)
    /* 96CA8 800A6CA8 7800AA8F */  lw         $t2, 0x78($sp)
    /* 96CAC 800A6CAC D400AC8F */  lw         $t4, 0xD4($sp)
    /* 96CB0 800A6CB0 7C00AB8F */  lw         $t3, 0x7C($sp)
    /* 96CB4 800A6CB4 3C008015 */  bnez       $t4, .L800A6DA8
    /* 96CB8 800A6CB8 3F00A232 */   andi      $v0, $s5, 0x3F
    /* 96CBC 800A6CBC 40100200 */  sll        $v0, $v0, 1
    /* 96CC0 800A6CC0 21104A00 */  addu       $v0, $v0, $t2
    /* 96CC4 800A6CC4 00004284 */  lh         $v0, 0x0($v0)
    /* 96CC8 800A6CC8 00000000 */  nop
    /* 96CCC 800A6CCC 18005700 */  mult       $v0, $s7
    /* 96CD0 800A6CD0 1000A226 */  addiu      $v0, $s5, 0x10
    /* 96CD4 800A6CD4 3F004230 */  andi       $v0, $v0, 0x3F
    /* 96CD8 800A6CD8 40100200 */  sll        $v0, $v0, 1
    /* 96CDC 800A6CDC 21104A00 */  addu       $v0, $v0, $t2
    /* 96CE0 800A6CE0 12480000 */  mflo       $t1
    /* 96CE4 800A6CE4 00004284 */  lh         $v0, 0x0($v0)
    /* 96CE8 800A6CE8 00000000 */  nop
    /* 96CEC 800A6CEC 18005700 */  mult       $v0, $s7
    /* 96CF0 800A6CF0 7000AC8F */  lw         $t4, 0x70($sp)
    /* 96CF4 800A6CF4 00000000 */  nop
    /* 96CF8 800A6CF8 2118AC02 */  addu       $v1, $s5, $t4
    /* 96CFC 800A6CFC 3F006230 */  andi       $v0, $v1, 0x3F
    /* 96D00 800A6D00 40100200 */  sll        $v0, $v0, 1
    /* 96D04 800A6D04 21104A00 */  addu       $v0, $v0, $t2
    /* 96D08 800A6D08 12400000 */  mflo       $t0
    /* 96D0C 800A6D0C 00004284 */  lh         $v0, 0x0($v0)
    /* 96D10 800A6D10 00000000 */  nop
    /* 96D14 800A6D14 18005700 */  mult       $v0, $s7
    /* 96D18 800A6D18 10006324 */  addiu      $v1, $v1, 0x10
    /* 96D1C 800A6D1C 3F006330 */  andi       $v1, $v1, 0x3F
    /* 96D20 800A6D20 40180300 */  sll        $v1, $v1, 1
    /* 96D24 800A6D24 21186A00 */  addu       $v1, $v1, $t2
    /* 96D28 800A6D28 12380000 */  mflo       $a3
    /* 96D2C 800A6D2C 00006284 */  lh         $v0, 0x0($v1)
    /* 96D30 800A6D30 00000000 */  nop
    /* 96D34 800A6D34 18005700 */  mult       $v0, $s7
    /* 96D38 800A6D38 2118AB02 */  addu       $v1, $s5, $t3
    /* 96D3C 800A6D3C 3F006230 */  andi       $v0, $v1, 0x3F
    /* 96D40 800A6D40 40100200 */  sll        $v0, $v0, 1
    /* 96D44 800A6D44 21104A00 */  addu       $v0, $v0, $t2
    /* 96D48 800A6D48 12300000 */  mflo       $a2
    /* 96D4C 800A6D4C 00004284 */  lh         $v0, 0x0($v0)
    /* 96D50 800A6D50 00000000 */  nop
    /* 96D54 800A6D54 18005700 */  mult       $v0, $s7
    /* 96D58 800A6D58 10006324 */  addiu      $v1, $v1, 0x10
    /* 96D5C 800A6D5C 3F006330 */  andi       $v1, $v1, 0x3F
    /* 96D60 800A6D60 40180300 */  sll        $v1, $v1, 1
    /* 96D64 800A6D64 21186A00 */  addu       $v1, $v1, $t2
    /* 96D68 800A6D68 12280000 */  mflo       $a1
    /* 96D6C 800A6D6C 00006284 */  lh         $v0, 0x0($v1)
    /* 96D70 800A6D70 00000000 */  nop
    /* 96D74 800A6D74 18005700 */  mult       $v0, $s7
    /* 96D78 800A6D78 2000AC8F */  lw         $t4, 0x20($sp)
    /* 96D7C 800A6D7C 03820700 */  sra        $s0, $a3, 8
    /* 96D80 800A6D80 038A0600 */  sra        $s1, $a2, 8
    /* 96D84 800A6D84 03120900 */  sra        $v0, $t1, 8
    /* 96D88 800A6D88 21B0C203 */  addu       $s6, $fp, $v0
    /* 96D8C 800A6D8C 03120800 */  sra        $v0, $t0, 8
    /* 96D90 800A6D90 21A08201 */  addu       $s4, $t4, $v0
    /* 96D94 800A6D94 03120500 */  sra        $v0, $a1, 8
    /* 96D98 800A6D98 2198C203 */  addu       $s3, $fp, $v0
    /* 96D9C 800A6D9C 12180000 */  mflo       $v1
    /* 96DA0 800A6DA0 A49B0208 */  j          .L800A6E90
    /* 96DA4 800A6DA4 03120300 */   sra       $v0, $v1, 8
  .L800A6DA8:
    /* 96DA8 800A6DA8 40100200 */  sll        $v0, $v0, 1
    /* 96DAC 800A6DAC 21104A00 */  addu       $v0, $v0, $t2
    /* 96DB0 800A6DB0 00004284 */  lh         $v0, 0x0($v0)
    /* 96DB4 800A6DB4 00000000 */  nop
    /* 96DB8 800A6DB8 18005700 */  mult       $v0, $s7
    /* 96DBC 800A6DBC 1000A226 */  addiu      $v0, $s5, 0x10
    /* 96DC0 800A6DC0 3F004230 */  andi       $v0, $v0, 0x3F
    /* 96DC4 800A6DC4 40100200 */  sll        $v0, $v0, 1
    /* 96DC8 800A6DC8 21104A00 */  addu       $v0, $v0, $t2
    /* 96DCC 800A6DCC 12480000 */  mflo       $t1
    /* 96DD0 800A6DD0 00004284 */  lh         $v0, 0x0($v0)
    /* 96DD4 800A6DD4 00000000 */  nop
    /* 96DD8 800A6DD8 18005700 */  mult       $v0, $s7
    /* 96DDC 800A6DDC 7000AC8F */  lw         $t4, 0x70($sp)
    /* 96DE0 800A6DE0 00000000 */  nop
    /* 96DE4 800A6DE4 2118AC02 */  addu       $v1, $s5, $t4
    /* 96DE8 800A6DE8 3F006230 */  andi       $v0, $v1, 0x3F
    /* 96DEC 800A6DEC 40100200 */  sll        $v0, $v0, 1
    /* 96DF0 800A6DF0 21104A00 */  addu       $v0, $v0, $t2
    /* 96DF4 800A6DF4 12400000 */  mflo       $t0
    /* 96DF8 800A6DF8 00004284 */  lh         $v0, 0x0($v0)
    /* 96DFC 800A6DFC 00000000 */  nop
    /* 96E00 800A6E00 18005700 */  mult       $v0, $s7
    /* 96E04 800A6E04 10006324 */  addiu      $v1, $v1, 0x10
    /* 96E08 800A6E08 3F006330 */  andi       $v1, $v1, 0x3F
    /* 96E0C 800A6E0C 40180300 */  sll        $v1, $v1, 1
    /* 96E10 800A6E10 21186A00 */  addu       $v1, $v1, $t2
    /* 96E14 800A6E14 12380000 */  mflo       $a3
    /* 96E18 800A6E18 00006284 */  lh         $v0, 0x0($v1)
    /* 96E1C 800A6E1C 00000000 */  nop
    /* 96E20 800A6E20 18005700 */  mult       $v0, $s7
    /* 96E24 800A6E24 2118AB02 */  addu       $v1, $s5, $t3
    /* 96E28 800A6E28 3F006230 */  andi       $v0, $v1, 0x3F
    /* 96E2C 800A6E2C 40100200 */  sll        $v0, $v0, 1
    /* 96E30 800A6E30 21104A00 */  addu       $v0, $v0, $t2
    /* 96E34 800A6E34 12300000 */  mflo       $a2
    /* 96E38 800A6E38 00004284 */  lh         $v0, 0x0($v0)
    /* 96E3C 800A6E3C 00000000 */  nop
    /* 96E40 800A6E40 18005700 */  mult       $v0, $s7
    /* 96E44 800A6E44 10006324 */  addiu      $v1, $v1, 0x10
    /* 96E48 800A6E48 3F006330 */  andi       $v1, $v1, 0x3F
    /* 96E4C 800A6E4C 40180300 */  sll        $v1, $v1, 1
    /* 96E50 800A6E50 21186A00 */  addu       $v1, $v1, $t2
    /* 96E54 800A6E54 12280000 */  mflo       $a1
    /* 96E58 800A6E58 00006284 */  lh         $v0, 0x0($v1)
    /* 96E5C 800A6E5C 00000000 */  nop
    /* 96E60 800A6E60 18005700 */  mult       $v0, $s7
    /* 96E64 800A6E64 2000AC8F */  lw         $t4, 0x20($sp)
    /* 96E68 800A6E68 03820700 */  sra        $s0, $a3, 8
    /* 96E6C 800A6E6C 438A0600 */  sra        $s1, $a2, 9
    /* 96E70 800A6E70 03120900 */  sra        $v0, $t1, 8
    /* 96E74 800A6E74 21B0C203 */  addu       $s6, $fp, $v0
    /* 96E78 800A6E78 43120800 */  sra        $v0, $t0, 9
    /* 96E7C 800A6E7C 21A08201 */  addu       $s4, $t4, $v0
    /* 96E80 800A6E80 03120500 */  sra        $v0, $a1, 8
    /* 96E84 800A6E84 2198C203 */  addu       $s3, $fp, $v0
    /* 96E88 800A6E88 12180000 */  mflo       $v1
    /* 96E8C 800A6E8C 43120300 */  sra        $v0, $v1, 9
  .L800A6E90:
    /* 96E90 800A6E90 21908201 */  addu       $s2, $t4, $v0
    /* 96E94 800A6E94 080096A4 */  sh         $s6, 0x8($a0)
    /* 96E98 800A6E98 0A0094A4 */  sh         $s4, 0xA($a0)
    /* 96E9C 800A6E9C 14009EA4 */  sh         $fp, 0x14($a0)
    /* 96EA0 800A6EA0 2000AC97 */  lhu        $t4, 0x20($sp)
    /* 96EA4 800A6EA4 07008390 */  lbu        $v1, 0x7($a0)
    /* 96EA8 800A6EA8 2110D003 */  addu       $v0, $fp, $s0
    /* 96EAC 800A6EAC 200082A4 */  sh         $v0, 0x20($a0)
    /* 96EB0 800A6EB0 02006334 */  ori        $v1, $v1, 0x2
    /* 96EB4 800A6EB4 16008CA4 */  sh         $t4, 0x16($a0)
    /* 96EB8 800A6EB8 2000AC8F */  lw         $t4, 0x20($sp)
    /* 96EBC 800A6EBC FE006330 */  andi       $v1, $v1, 0xFE
    /* 96EC0 800A6EC0 2C0093A4 */  sh         $s3, 0x2C($a0)
    /* 96EC4 800A6EC4 2E0092A4 */  sh         $s2, 0x2E($a0)
    /* 96EC8 800A6EC8 040080A0 */  sb         $zero, 0x4($a0)
    /* 96ECC 800A6ECC 050080A0 */  sb         $zero, 0x5($a0)
    /* 96ED0 800A6ED0 060080A0 */  sb         $zero, 0x6($a0)
    /* 96ED4 800A6ED4 21109101 */  addu       $v0, $t4, $s1
    /* 96ED8 800A6ED8 220082A4 */  sh         $v0, 0x22($a0)
    /* 96EDC 800A6EDC 3800AC93 */  lbu        $t4, 0x38($sp)
    /* 96EE0 800A6EE0 00000000 */  nop
    /* 96EE4 800A6EE4 10008CA0 */  sb         $t4, 0x10($a0)
    /* 96EE8 800A6EE8 4000AC93 */  lbu        $t4, 0x40($sp)
    /* 96EEC 800A6EEC 00000000 */  nop
    /* 96EF0 800A6EF0 11008CA0 */  sb         $t4, 0x11($a0)
    /* 96EF4 800A6EF4 4800AC93 */  lbu        $t4, 0x48($sp)
    /* 96EF8 800A6EF8 1C0080A0 */  sb         $zero, 0x1C($a0)
    /* 96EFC 800A6EFC 1D0080A0 */  sb         $zero, 0x1D($a0)
    /* 96F00 800A6F00 1E0080A0 */  sb         $zero, 0x1E($a0)
    /* 96F04 800A6F04 280080A0 */  sb         $zero, 0x28($a0)
    /* 96F08 800A6F08 290080A0 */  sb         $zero, 0x29($a0)
    /* 96F0C 800A6F0C 2A0080A0 */  sb         $zero, 0x2A($a0)
    /* 96F10 800A6F10 070083A0 */  sb         $v1, 0x7($a0)
    /* 96F14 800A6F14 12008CA0 */  sb         $t4, 0x12($a0)
    /* 96F18 800A6F18 D000AC8F */  lw         $t4, 0xD0($sp)
    /* 96F1C 800A6F1C 00000000 */  nop
    /* 96F20 800A6F20 51008011 */  beqz       $t4, .L800A7068
    /* 96F24 800A6F24 D8000524 */   addiu     $a1, $zero, 0xD8
    /* 96F28 800A6F28 3000A48F */  lw         $a0, 0x30($sp)
    /* 96F2C 800A6F2C 2000A78F */  lw         $a3, 0x20($sp)
    /* 96F30 800A6F30 CC00AC8F */  lw         $t4, 0xCC($sp)
    /* 96F34 800A6F34 2130C003 */  addu       $a2, $fp, $zero
    /* 96F38 800A6F38 1000A0AF */  sw         $zero, 0x10($sp)
    /* 96F3C 800A6F3C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 96F40 800A6F40 7800AAAF */  sw         $t2, 0x78($sp)
    /* 96F44 800A6F44 7C00ABAF */  sw         $t3, 0x7C($sp)
    /* 96F48 800A6F48 01008225 */  addiu      $v0, $t4, 0x1
    /* 96F4C 800A6F4C 5B4D020C */  jal        PrintGt4__7TextDatiiiiii
    /* 96F50 800A6F50 1400A2AF */   sw        $v0, 0x14($sp)
    /* 96F54 800A6F54 21204000 */  addu       $a0, $v0, $zero
    /* 96F58 800A6F58 C3801000 */  sra        $s0, $s0, 3
    /* 96F5C 800A6F5C 080096A4 */  sh         $s6, 0x8($a0)
    /* 96F60 800A6F60 0A0094A4 */  sh         $s4, 0xA($a0)
    /* 96F64 800A6F64 14009EA4 */  sh         $fp, 0x14($a0)
    /* 96F68 800A6F68 2000AC97 */  lhu        $t4, 0x20($sp)
    /* 96F6C 800A6F6C 2110D003 */  addu       $v0, $fp, $s0
    /* 96F70 800A6F70 200082A4 */  sh         $v0, 0x20($a0)
    /* 96F74 800A6F74 16008CA4 */  sh         $t4, 0x16($a0)
    /* 96F78 800A6F78 2000AC8F */  lw         $t4, 0x20($sp)
    /* 96F7C 800A6F7C C3881100 */  sra        $s1, $s1, 3
    /* 96F80 800A6F80 2C0093A4 */  sh         $s3, 0x2C($a0)
    /* 96F84 800A6F84 2E0092A4 */  sh         $s2, 0x2E($a0)
    /* 96F88 800A6F88 21109101 */  addu       $v0, $t4, $s1
    /* 96F8C 800A6F8C 220082A4 */  sh         $v0, 0x22($a0)
    /* 96F90 800A6F90 5000AC93 */  lbu        $t4, 0x50($sp)
    /* 96F94 800A6F94 00000000 */  nop
    /* 96F98 800A6F98 04008CA0 */  sb         $t4, 0x4($a0)
    /* 96F9C 800A6F9C 5800AC93 */  lbu        $t4, 0x58($sp)
    /* 96FA0 800A6FA0 00000000 */  nop
    /* 96FA4 800A6FA4 05008CA0 */  sb         $t4, 0x5($a0)
    /* 96FA8 800A6FA8 6000AC93 */  lbu        $t4, 0x60($sp)
    /* 96FAC 800A6FAC 00000000 */  nop
    /* 96FB0 800A6FB0 06008CA0 */  sb         $t4, 0x6($a0)
    /* 96FB4 800A6FB4 3800AC93 */  lbu        $t4, 0x38($sp)
    /* 96FB8 800A6FB8 00000000 */  nop
    /* 96FBC 800A6FBC 10008CA0 */  sb         $t4, 0x10($a0)
    /* 96FC0 800A6FC0 4000AC93 */  lbu        $t4, 0x40($sp)
    /* 96FC4 800A6FC4 00000000 */  nop
    /* 96FC8 800A6FC8 11008CA0 */  sb         $t4, 0x11($a0)
    /* 96FCC 800A6FCC 4800AC93 */  lbu        $t4, 0x48($sp)
    /* 96FD0 800A6FD0 00000000 */  nop
    /* 96FD4 800A6FD4 12008CA0 */  sb         $t4, 0x12($a0)
    /* 96FD8 800A6FD8 5000AC93 */  lbu        $t4, 0x50($sp)
    /* 96FDC 800A6FDC 00000000 */  nop
    /* 96FE0 800A6FE0 1C008CA0 */  sb         $t4, 0x1C($a0)
    /* 96FE4 800A6FE4 5800AC93 */  lbu        $t4, 0x58($sp)
    /* 96FE8 800A6FE8 00000000 */  nop
    /* 96FEC 800A6FEC 1D008CA0 */  sb         $t4, 0x1D($a0)
    /* 96FF0 800A6FF0 6000AC93 */  lbu        $t4, 0x60($sp)
    /* 96FF4 800A6FF4 1A008294 */  lhu        $v0, 0x1A($a0)
    /* 96FF8 800A6FF8 18008390 */  lbu        $v1, 0x18($a0)
    /* 96FFC 800A6FFC 1E008CA0 */  sb         $t4, 0x1E($a0)
    /* 97000 800A7000 5000AC93 */  lbu        $t4, 0x50($sp)
    /* 97004 800A7004 20004234 */  ori        $v0, $v0, 0x20
    /* 97008 800A7008 28008CA0 */  sb         $t4, 0x28($a0)
    /* 9700C 800A700C 5800AC93 */  lbu        $t4, 0x58($sp)
    /* 97010 800A7010 00000000 */  nop
    /* 97014 800A7014 29008CA0 */  sb         $t4, 0x29($a0)
    /* 97018 800A7018 6000AC93 */  lbu        $t4, 0x60($sp)
    /* 9701C 800A701C 1A0082A4 */  sh         $v0, 0x1A($a0)
    /* 97020 800A7020 25008290 */  lbu        $v0, 0x25($a0)
    /* 97024 800A7024 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 97028 800A7028 180083A0 */  sb         $v1, 0x18($a0)
    /* 9702C 800A702C 30008390 */  lbu        $v1, 0x30($a0)
    /* 97030 800A7030 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 97034 800A7034 250082A0 */  sb         $v0, 0x25($a0)
    /* 97038 800A7038 31008290 */  lbu        $v0, 0x31($a0)
    /* 9703C 800A703C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 97040 800A7040 300083A0 */  sb         $v1, 0x30($a0)
    /* 97044 800A7044 07008390 */  lbu        $v1, 0x7($a0)
    /* 97048 800A7048 2A008CA0 */  sb         $t4, 0x2A($a0)
    /* 9704C 800A704C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 97050 800A7050 02006334 */  ori        $v1, $v1, 0x2
    /* 97054 800A7054 FE006330 */  andi       $v1, $v1, 0xFE
    /* 97058 800A7058 310082A0 */  sb         $v0, 0x31($a0)
    /* 9705C 800A705C 070083A0 */  sb         $v1, 0x7($a0)
    /* 97060 800A7060 7C00AB8F */  lw         $t3, 0x7C($sp)
    /* 97064 800A7064 7800AA8F */  lw         $t2, 0x78($sp)
  .L800A7068:
    /* 97068 800A7068 6800AC8F */  lw         $t4, 0x68($sp)
    /* 9706C 800A706C 21A8AB02 */  addu       $s5, $s5, $t3
    /* 97070 800A7070 21608B01 */  addu       $t4, $t4, $t3
    /* 97074 800A7074 40008229 */  slti       $v0, $t4, 0x40
    /* 97078 800A7078 EFFE4014 */  bnez       $v0, .L800A6C38
    /* 9707C 800A707C 6800ACAF */   sw        $t4, 0x68($sp)
    /* 97080 800A7080 3000A48F */  lw         $a0, 0x30($sp)
    /* 97084 800A7084 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 97088 800A7088 00000000 */   nop
    /* 9708C 800A708C A400BF8F */  lw         $ra, 0xA4($sp)
    /* 97090 800A7090 A000BE8F */  lw         $fp, 0xA0($sp)
    /* 97094 800A7094 9C00B78F */  lw         $s7, 0x9C($sp)
    /* 97098 800A7098 9800B68F */  lw         $s6, 0x98($sp)
    /* 9709C 800A709C 9400B58F */  lw         $s5, 0x94($sp)
    /* 970A0 800A70A0 9000B48F */  lw         $s4, 0x90($sp)
    /* 970A4 800A70A4 8C00B38F */  lw         $s3, 0x8C($sp)
    /* 970A8 800A70A8 8800B28F */  lw         $s2, 0x88($sp)
    /* 970AC 800A70AC 8400B18F */  lw         $s1, 0x84($sp)
    /* 970B0 800A70B0 8000B08F */  lw         $s0, 0x80($sp)
    /* 970B4 800A70B4 A800BD27 */  addiu      $sp, $sp, 0xA8
    /* 970B8 800A70B8 0800E003 */  jr         $ra
    /* 970BC 800A70BC 00000000 */   nop
endlabel DrawSpinner__FiiUcUcUciiibiT8T8Uc
