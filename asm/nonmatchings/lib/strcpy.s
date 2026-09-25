.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strcpy, 0x28

glabel strcpy
    /* 3C8 800103C8 21388000 */  addu       $a3, $a0, $zero
  .L800103CC:
    /* 3CC 800103CC 0000A680 */  lb         $a2, 0x0($a1)
    /* 3D0 800103D0 00000000 */  nop
    /* 3D4 800103D4 04000610 */  beq        $zero, $a2, .L800103E8
    /* 3D8 800103D8 000086A0 */   sb        $a2, 0x0($a0)
    /* 3DC 800103DC 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3E0 800103E0 F3400008 */  j          .L800103CC
    /* 3E4 800103E4 01008424 */   addiu     $a0, $a0, 0x1
  .L800103E8:
    /* 3E8 800103E8 0800E003 */  jr         $ra
    /* 3EC 800103EC 2110E000 */   addu      $v0, $a3, $zero
endlabel strcpy
