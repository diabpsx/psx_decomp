.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveTargetCursor__Fi, 0x48

glabel RemoveTargetCursor__Fi
    /* 9178C 800A178C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 91790 800A1790 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91794 800A1794 07008214 */  bne        $a0, $v0, .L800A17B4
    /* 91798 800A1798 1000BFAF */   sw        $ra, 0x10($sp)
    /* 9179C 800A179C E385020C */  jal        RemoveTargetCursor__Fi
    /* 917A0 800A17A0 21200000 */   addu      $a0, $zero, $zero
    /* 917A4 800A17A4 E385020C */  jal        RemoveTargetCursor__Fi
    /* 917A8 800A17A8 01000424 */   addiu     $a0, $zero, 0x1
    /* 917AC 800A17AC F1850208 */  j          .L800A17C4
    /* 917B0 800A17B0 00000000 */   nop
  .L800A17B4:
    /* 917B4 800A17B4 4BEB010C */  jal        GetGamePad__Fi
    /* 917B8 800A17B8 00000000 */   nop
    /* 917BC 800A17BC 46BD020C */  jal        Remove__11SpellTarget
    /* 917C0 800A17C0 04004424 */   addiu     $a0, $v0, 0x4
  .L800A17C4:
    /* 917C4 800A17C4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 917C8 800A17C8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 917CC 800A17CC 0800E003 */  jr         $ra
    /* 917D0 800A17D0 00000000 */   nop
endlabel RemoveTargetCursor__Fi
