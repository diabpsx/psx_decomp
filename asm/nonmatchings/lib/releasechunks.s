.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching releasechunks, 0xD8

glabel releasechunks
    /* 1EE88 8002EE88 1800838C */  lw         $v1, 0x18($a0)
    /* 1EE8C 8002EE8C 1400828C */  lw         $v0, 0x14($a0)
    /* 1EE90 8002EE90 00000000 */  nop
    /* 1EE94 8002EE94 30006210 */  beq        $v1, $v0, .L8002EF58
    /* 1EE98 8002EE98 00000000 */   nop
    /* 1EE9C 8002EE9C FEFF0624 */  addiu      $a2, $zero, -0x2
    /* 1EEA0 8002EEA0 FFFF0524 */  addiu      $a1, $zero, -0x1
  .L8002EEA4:
    /* 1EEA4 8002EEA4 1800838C */  lw         $v1, 0x18($a0)
    /* 1EEA8 8002EEA8 1000828C */  lw         $v0, 0x10($a0)
    /* 1EEAC 8002EEAC 00000000 */  nop
    /* 1EEB0 8002EEB0 29006210 */  beq        $v1, $v0, .L8002EF58
    /* 1EEB4 8002EEB4 00000000 */   nop
    /* 1EEB8 8002EEB8 1800828C */  lw         $v0, 0x18($a0)
    /* 1EEBC 8002EEBC 00000000 */  nop
    /* 1EEC0 8002EEC0 0000428C */  lw         $v0, 0x0($v0)
    /* 1EEC4 8002EEC4 00000000 */  nop
    /* 1EEC8 8002EEC8 0D004614 */  bne        $v0, $a2, .L8002EF00
    /* 1EECC 8002EECC 00000000 */   nop
    /* 1EED0 8002EED0 9400838C */  lw         $v1, 0x94($a0)
    /* 1EED4 8002EED4 1800828C */  lw         $v0, 0x18($a0)
    /* 1EED8 8002EED8 00000000 */  nop
    /* 1EEDC 8002EEDC 0400428C */  lw         $v0, 0x4($v0)
    /* 1EEE0 8002EEE0 08006324 */  addiu      $v1, $v1, 0x8
    /* 1EEE4 8002EEE4 23186200 */  subu       $v1, $v1, $v0
    /* 1EEE8 8002EEE8 940083AC */  sw         $v1, 0x94($a0)
    /* 1EEEC 8002EEEC 1800838C */  lw         $v1, 0x18($a0)
    /* 1EEF0 8002EEF0 1800828C */  lw         $v0, 0x18($a0)
    /* 1EEF4 8002EEF4 0400638C */  lw         $v1, 0x4($v1)
    /* 1EEF8 8002EEF8 CFBB0008 */  j          .L8002EF3C
    /* 1EEFC 8002EEFC 21104300 */   addu      $v0, $v0, $v1
  .L8002EF00:
    /* 1EF00 8002EF00 1800828C */  lw         $v0, 0x18($a0)
    /* 1EF04 8002EF04 00000000 */  nop
    /* 1EF08 8002EF08 0000428C */  lw         $v0, 0x0($v0)
    /* 1EF0C 8002EF0C 00000000 */  nop
    /* 1EF10 8002EF10 11004514 */  bne        $v0, $a1, .L8002EF58
    /* 1EF14 8002EF14 00000000 */   nop
    /* 1EF18 8002EF18 1800838C */  lw         $v1, 0x18($a0)
    /* 1EF1C 8002EF1C 1400828C */  lw         $v0, 0x14($a0)
    /* 1EF20 8002EF20 00000000 */  nop
    /* 1EF24 8002EF24 04006214 */  bne        $v1, $v0, .L8002EF38
    /* 1EF28 8002EF28 00000000 */   nop
    /* 1EF2C 8002EF2C 0400828C */  lw         $v0, 0x4($a0)
    /* 1EF30 8002EF30 00000000 */  nop
    /* 1EF34 8002EF34 140082AC */  sw         $v0, 0x14($a0)
  .L8002EF38:
    /* 1EF38 8002EF38 0400828C */  lw         $v0, 0x4($a0)
  .L8002EF3C:
    /* 1EF3C 8002EF3C 00000000 */  nop
    /* 1EF40 8002EF40 180082AC */  sw         $v0, 0x18($a0)
    /* 1EF44 8002EF44 1800838C */  lw         $v1, 0x18($a0)
    /* 1EF48 8002EF48 1400828C */  lw         $v0, 0x14($a0)
    /* 1EF4C 8002EF4C 00000000 */  nop
    /* 1EF50 8002EF50 D4FF6214 */  bne        $v1, $v0, .L8002EEA4
    /* 1EF54 8002EF54 00000000 */   nop
  .L8002EF58:
    /* 1EF58 8002EF58 0800E003 */  jr         $ra
    /* 1EF5C 8002EF5C 00000000 */   nop
endlabel releasechunks
