.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BubbleSwapItem__FP10ItemStructT0, 0x108

glabel BubbleSwapItem__FP10ItemStructT0
    /* 399B0 800499B0 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 399B4 800499B4 21408000 */  addu       $t0, $a0, $zero
    /* 399B8 800499B8 2148A000 */  addu       $t1, $a1, $zero
    /* 399BC 800499BC 2138A003 */  addu       $a3, $sp, $zero
    /* 399C0 800499C0 21300001 */  addu       $a2, $t0, $zero
    /* 399C4 800499C4 60000A25 */  addiu      $t2, $t0, 0x60
  .L800499C8:
    /* 399C8 800499C8 0000C28C */  lw         $v0, 0x0($a2)
    /* 399CC 800499CC 0400C38C */  lw         $v1, 0x4($a2)
    /* 399D0 800499D0 0800C48C */  lw         $a0, 0x8($a2)
    /* 399D4 800499D4 0C00C58C */  lw         $a1, 0xC($a2)
    /* 399D8 800499D8 0000E2AC */  sw         $v0, 0x0($a3)
    /* 399DC 800499DC 0400E3AC */  sw         $v1, 0x4($a3)
    /* 399E0 800499E0 0800E4AC */  sw         $a0, 0x8($a3)
    /* 399E4 800499E4 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 399E8 800499E8 1000C624 */  addiu      $a2, $a2, 0x10
    /* 399EC 800499EC F6FFCA14 */  bne        $a2, $t2, .L800499C8
    /* 399F0 800499F0 1000E724 */   addiu     $a3, $a3, 0x10
    /* 399F4 800499F4 0000C28C */  lw         $v0, 0x0($a2)
    /* 399F8 800499F8 0400C38C */  lw         $v1, 0x4($a2)
    /* 399FC 800499FC 0800C48C */  lw         $a0, 0x8($a2)
    /* 39A00 80049A00 0000E2AC */  sw         $v0, 0x0($a3)
    /* 39A04 80049A04 0400E3AC */  sw         $v1, 0x4($a3)
    /* 39A08 80049A08 0800E4AC */  sw         $a0, 0x8($a3)
    /* 39A0C 80049A0C 21380001 */  addu       $a3, $t0, $zero
    /* 39A10 80049A10 21302001 */  addu       $a2, $t1, $zero
    /* 39A14 80049A14 60002825 */  addiu      $t0, $t1, 0x60
  .L80049A18:
    /* 39A18 80049A18 0000C28C */  lw         $v0, 0x0($a2)
    /* 39A1C 80049A1C 0400C38C */  lw         $v1, 0x4($a2)
    /* 39A20 80049A20 0800C48C */  lw         $a0, 0x8($a2)
    /* 39A24 80049A24 0C00C58C */  lw         $a1, 0xC($a2)
    /* 39A28 80049A28 0000E2AC */  sw         $v0, 0x0($a3)
    /* 39A2C 80049A2C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 39A30 80049A30 0800E4AC */  sw         $a0, 0x8($a3)
    /* 39A34 80049A34 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 39A38 80049A38 1000C624 */  addiu      $a2, $a2, 0x10
    /* 39A3C 80049A3C F6FFC814 */  bne        $a2, $t0, .L80049A18
    /* 39A40 80049A40 1000E724 */   addiu     $a3, $a3, 0x10
    /* 39A44 80049A44 0000C28C */  lw         $v0, 0x0($a2)
    /* 39A48 80049A48 0400C38C */  lw         $v1, 0x4($a2)
    /* 39A4C 80049A4C 0800C48C */  lw         $a0, 0x8($a2)
    /* 39A50 80049A50 0000E2AC */  sw         $v0, 0x0($a3)
    /* 39A54 80049A54 0400E3AC */  sw         $v1, 0x4($a3)
    /* 39A58 80049A58 0800E4AC */  sw         $a0, 0x8($a3)
    /* 39A5C 80049A5C 21282001 */  addu       $a1, $t1, $zero
    /* 39A60 80049A60 2130A003 */  addu       $a2, $sp, $zero
    /* 39A64 80049A64 6000A727 */  addiu      $a3, $sp, 0x60
  .L80049A68:
    /* 39A68 80049A68 0000C28C */  lw         $v0, 0x0($a2)
    /* 39A6C 80049A6C 0400C38C */  lw         $v1, 0x4($a2)
    /* 39A70 80049A70 0800C48C */  lw         $a0, 0x8($a2)
    /* 39A74 80049A74 0C00CB8C */  lw         $t3, 0xC($a2)
    /* 39A78 80049A78 0000A2AC */  sw         $v0, 0x0($a1)
    /* 39A7C 80049A7C 0400A3AC */  sw         $v1, 0x4($a1)
    /* 39A80 80049A80 0800A4AC */  sw         $a0, 0x8($a1)
    /* 39A84 80049A84 0C00ABAC */  sw         $t3, 0xC($a1)
    /* 39A88 80049A88 1000C624 */  addiu      $a2, $a2, 0x10
    /* 39A8C 80049A8C F6FFC714 */  bne        $a2, $a3, .L80049A68
    /* 39A90 80049A90 1000A524 */   addiu     $a1, $a1, 0x10
    /* 39A94 80049A94 0000CC8C */  lw         $t4, 0x0($a2)
    /* 39A98 80049A98 0400C28C */  lw         $v0, 0x4($a2)
    /* 39A9C 80049A9C 0800C38C */  lw         $v1, 0x8($a2)
    /* 39AA0 80049AA0 0000ACAC */  sw         $t4, 0x0($a1)
    /* 39AA4 80049AA4 0400A2AC */  sw         $v0, 0x4($a1)
    /* 39AA8 80049AA8 0800A3AC */  sw         $v1, 0x8($a1)
    /* 39AAC 80049AAC 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 39AB0 80049AB0 0800E003 */  jr         $ra
    /* 39AB4 80049AB4 00000000 */   nop
endlabel BubbleSwapItem__FP10ItemStructT0
