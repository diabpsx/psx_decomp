.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching availablemem, 0x4C

glabel availablemem
    /* 1B58C 8002B58C 201D828F */  lw         $v0, %gp_rel(defaultmc)($gp)
    /* 1B590 8002B590 00000000 */  nop
    /* 1B594 8002B594 0000458C */  lw         $a1, 0x0($v0)
    /* 1B598 8002B598 0400428C */  lw         $v0, 0x4($v0)
    /* 1B59C 8002B59C 2000A68C */  lw         $a2, 0x20($a1)
    /* 1B5A0 8002B5A0 0B00A210 */  beq        $a1, $v0, .L8002B5D0
    /* 1B5A4 8002B5A4 21380000 */   addu      $a3, $zero, $zero
    /* 1B5A8 8002B5A8 21404000 */  addu       $t0, $v0, $zero
  .L8002B5AC:
    /* 1B5AC 8002B5AC 0000A28C */  lw         $v0, 0x0($a1)
    /* 1B5B0 8002B5B0 1000A48C */  lw         $a0, 0x10($a1)
    /* 1B5B4 8002B5B4 0000C38C */  lw         $v1, 0x0($a2)
    /* 1B5B8 8002B5B8 2128C000 */  addu       $a1, $a2, $zero
    /* 1B5BC 8002B5BC 2000A68C */  lw         $a2, 0x20($a1)
    /* 1B5C0 8002B5C0 21104400 */  addu       $v0, $v0, $a0
    /* 1B5C4 8002B5C4 23186200 */  subu       $v1, $v1, $v0
    /* 1B5C8 8002B5C8 F8FFA814 */  bne        $a1, $t0, .L8002B5AC
    /* 1B5CC 8002B5CC 2138E300 */   addu      $a3, $a3, $v1
  .L8002B5D0:
    /* 1B5D0 8002B5D0 0800E003 */  jr         $ra
    /* 1B5D4 8002B5D4 2110E000 */   addu      $v0, $a3, $zero
endlabel availablemem
