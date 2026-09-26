.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SwapItem__FP10ItemStructT0, 0x114

glabel SwapItem__FP10ItemStructT0
    /* 21164 8015AD5C 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 21168 8015AD60 21408000 */  addu       $t0, $a0, $zero
    /* 2116C 8015AD64 2148A000 */  addu       $t1, $a1, $zero
    /* 21170 8015AD68 2138A003 */  addu       $a3, $sp, $zero
    /* 21174 8015AD6C 21300001 */  addu       $a2, $t0, $zero
    /* 21178 8015AD70 60000A25 */  addiu      $t2, $t0, 0x60
  .L8015AD74:
    /* 2117C 8015AD74 0000C28C */  lw         $v0, 0x0($a2)
    /* 21180 8015AD78 0400C38C */  lw         $v1, 0x4($a2)
    /* 21184 8015AD7C 0800C48C */  lw         $a0, 0x8($a2)
    /* 21188 8015AD80 0C00C58C */  lw         $a1, 0xC($a2)
    /* 2118C 8015AD84 0000E2AC */  sw         $v0, 0x0($a3)
    /* 21190 8015AD88 0400E3AC */  sw         $v1, 0x4($a3)
    /* 21194 8015AD8C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 21198 8015AD90 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 2119C 8015AD94 1000C624 */  addiu      $a2, $a2, 0x10
    /* 211A0 8015AD98 F6FFCA14 */  bne        $a2, $t2, .L8015AD74
    /* 211A4 8015AD9C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 211A8 8015ADA0 0000C28C */  lw         $v0, 0x0($a2)
    /* 211AC 8015ADA4 0400C38C */  lw         $v1, 0x4($a2)
    /* 211B0 8015ADA8 0800C48C */  lw         $a0, 0x8($a2)
    /* 211B4 8015ADAC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 211B8 8015ADB0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 211BC 8015ADB4 0800E4AC */  sw         $a0, 0x8($a3)
    /* 211C0 8015ADB8 21380001 */  addu       $a3, $t0, $zero
    /* 211C4 8015ADBC 21302001 */  addu       $a2, $t1, $zero
    /* 211C8 8015ADC0 60002825 */  addiu      $t0, $t1, 0x60
  .L8015ADC4:
    /* 211CC 8015ADC4 0000C28C */  lw         $v0, 0x0($a2)
    /* 211D0 8015ADC8 0400C38C */  lw         $v1, 0x4($a2)
    /* 211D4 8015ADCC 0800C48C */  lw         $a0, 0x8($a2)
    /* 211D8 8015ADD0 0C00C58C */  lw         $a1, 0xC($a2)
    /* 211DC 8015ADD4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 211E0 8015ADD8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 211E4 8015ADDC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 211E8 8015ADE0 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 211EC 8015ADE4 1000C624 */  addiu      $a2, $a2, 0x10
    /* 211F0 8015ADE8 F6FFC814 */  bne        $a2, $t0, .L8015ADC4
    /* 211F4 8015ADEC 1000E724 */   addiu     $a3, $a3, 0x10
    /* 211F8 8015ADF0 0000C28C */  lw         $v0, 0x0($a2)
    /* 211FC 8015ADF4 0400C38C */  lw         $v1, 0x4($a2)
    /* 21200 8015ADF8 0800C48C */  lw         $a0, 0x8($a2)
    /* 21204 8015ADFC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 21208 8015AE00 0400E3AC */  sw         $v1, 0x4($a3)
    /* 2120C 8015AE04 0800E4AC */  sw         $a0, 0x8($a3)
    /* 21210 8015AE08 21382001 */  addu       $a3, $t1, $zero
    /* 21214 8015AE0C 2130A003 */  addu       $a2, $sp, $zero
    /* 21218 8015AE10 6000A827 */  addiu      $t0, $sp, 0x60
  .L8015AE14:
    /* 2121C 8015AE14 0000C28C */  lw         $v0, 0x0($a2)
    /* 21220 8015AE18 0400C38C */  lw         $v1, 0x4($a2)
    /* 21224 8015AE1C 0800C48C */  lw         $a0, 0x8($a2)
    /* 21228 8015AE20 0C00C58C */  lw         $a1, 0xC($a2)
    /* 2122C 8015AE24 0000E2AC */  sw         $v0, 0x0($a3)
    /* 21230 8015AE28 0400E3AC */  sw         $v1, 0x4($a3)
    /* 21234 8015AE2C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 21238 8015AE30 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 2123C 8015AE34 1000C624 */  addiu      $a2, $a2, 0x10
    /* 21240 8015AE38 F6FFC814 */  bne        $a2, $t0, .L8015AE14
    /* 21244 8015AE3C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 21248 8015AE40 0000C28C */  lw         $v0, 0x0($a2)
    /* 2124C 8015AE44 0400C38C */  lw         $v1, 0x4($a2)
    /* 21250 8015AE48 0800CB8C */  lw         $t3, 0x8($a2)
    /* 21254 8015AE4C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 21258 8015AE50 0400E3AC */  sw         $v1, 0x4($a3)
    /* 2125C 8015AE54 0800EBAC */  sw         $t3, 0x8($a3)
    /* 21260 8015AE58 4C00A293 */  lbu        $v0, 0x4C($sp)
    /* 21264 8015AE5C 00000000 */  nop
    /* 21268 8015AE60 0C004224 */  addiu      $v0, $v0, 0xC
    /* 2126C 8015AE64 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 21270 8015AE68 0800E003 */  jr         $ra
    /* 21274 8015AE6C 00000000 */   nop
endlabel SwapItem__FP10ItemStructT0
