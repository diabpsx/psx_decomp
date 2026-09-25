.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckCollisions, 0xAC

glabel CheckCollisions
    /* 12564 80022564 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 12568 80022568 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1256C 8002256C 21908000 */  addu       $s2, $a0, $zero
    /* 12570 80022570 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 12574 80022574 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12578 80022578 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1257C 8002257C 2400508E */  lw         $s0, 0x24($s2)
    /* 12580 80022580 00000000 */  nop
    /* 12584 80022584 0C000012 */  beqz       $s0, .L800225B8
    /* 12588 80022588 2188A000 */   addu      $s1, $a1, $zero
  .L8002258C:
    /* 1258C 8002258C 06001112 */  beq        $s0, $s1, .L800225A8
    /* 12590 80022590 21202002 */   addu      $a0, $s1, $zero
    /* 12594 80022594 8489000C */  jal        AreBlocksColliding
    /* 12598 80022598 21280002 */   addu      $a1, $s0, $zero
    /* 1259C 8002259C FF004230 */  andi       $v0, $v0, 0xFF
    /* 125A0 800225A0 14004014 */  bnez       $v0, .L800225F4
    /* 125A4 800225A4 01000234 */   ori       $v0, $zero, 0x1
  .L800225A8:
    /* 125A8 800225A8 0400108E */  lw         $s0, 0x4($s0)
    /* 125AC 800225AC 00000000 */  nop
    /* 125B0 800225B0 F6FF0016 */  bnez       $s0, .L8002258C
    /* 125B4 800225B4 00000000 */   nop
  .L800225B8:
    /* 125B8 800225B8 2000508E */  lw         $s0, 0x20($s2)
    /* 125BC 800225BC 00000000 */  nop
    /* 125C0 800225C0 0C000012 */  beqz       $s0, .L800225F4
    /* 125C4 800225C4 21100000 */   addu      $v0, $zero, $zero
  .L800225C8:
    /* 125C8 800225C8 06001112 */  beq        $s0, $s1, .L800225E4
    /* 125CC 800225CC 21202002 */   addu      $a0, $s1, $zero
    /* 125D0 800225D0 8489000C */  jal        AreBlocksColliding
    /* 125D4 800225D4 21280002 */   addu      $a1, $s0, $zero
    /* 125D8 800225D8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 125DC 800225DC 05004014 */  bnez       $v0, .L800225F4
    /* 125E0 800225E0 01000234 */   ori       $v0, $zero, 0x1
  .L800225E4:
    /* 125E4 800225E4 0400108E */  lw         $s0, 0x4($s0)
    /* 125E8 800225E8 00000000 */  nop
    /* 125EC 800225EC F6FF0016 */  bnez       $s0, .L800225C8
    /* 125F0 800225F0 21100000 */   addu      $v0, $zero, $zero
  .L800225F4:
    /* 125F4 800225F4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 125F8 800225F8 1800B28F */  lw         $s2, 0x18($sp)
    /* 125FC 800225FC 1400B18F */  lw         $s1, 0x14($sp)
    /* 12600 80022600 1000B08F */  lw         $s0, 0x10($sp)
    /* 12604 80022604 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 12608 80022608 0800E003 */  jr         $ra
    /* 1260C 8002260C 00000000 */   nop
endlabel CheckCollisions
