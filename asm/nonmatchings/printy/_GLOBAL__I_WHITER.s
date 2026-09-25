.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_WHITER, 0x5C

glabel _GLOBAL__I_WHITER
    /* 7AC80 8008AC80 0C80073C */  lui        $a3, %hi(LargeFont)
    /* 7AC84 8008AC84 F484E724 */  addiu      $a3, $a3, %lo(LargeFont)
    /* 7AC88 8008AC88 0C80063C */  lui        $a2, %hi(MediumFont)
    /* 7AC8C 8008AC8C D882C624 */  addiu      $a2, $a2, %lo(MediumFont)
    /* 7AC90 8008AC90 1002C824 */  addiu      $t0, $a2, 0x210
  .L8008AC94:
    /* 7AC94 8008AC94 0000C28C */  lw         $v0, 0x0($a2)
    /* 7AC98 8008AC98 0400C38C */  lw         $v1, 0x4($a2)
    /* 7AC9C 8008AC9C 0800C48C */  lw         $a0, 0x8($a2)
    /* 7ACA0 8008ACA0 0C00C58C */  lw         $a1, 0xC($a2)
    /* 7ACA4 8008ACA4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 7ACA8 8008ACA8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 7ACAC 8008ACAC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 7ACB0 8008ACB0 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 7ACB4 8008ACB4 1000C624 */  addiu      $a2, $a2, 0x10
    /* 7ACB8 8008ACB8 F6FFC814 */  bne        $a2, $t0, .L8008AC94
    /* 7ACBC 8008ACBC 1000E724 */   addiu     $a3, $a3, 0x10
    /* 7ACC0 8008ACC0 0000C28C */  lw         $v0, 0x0($a2)
    /* 7ACC4 8008ACC4 0400C38C */  lw         $v1, 0x4($a2)
    /* 7ACC8 8008ACC8 0800C48C */  lw         $a0, 0x8($a2)
    /* 7ACCC 8008ACCC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 7ACD0 8008ACD0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 7ACD4 8008ACD4 0800E003 */  jr         $ra
    /* 7ACD8 8008ACD8 0800E4AC */   sw        $a0, 0x8($a3)
endlabel _GLOBAL__I_WHITER
