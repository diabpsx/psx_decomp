.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoShowPanelGFX__FP6GPanelT0, 0xD8

glabel DoShowPanelGFX__FP6GPanelT0
    /* 8BBCC 8009BBCC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8BBD0 8009BBD0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8BBD4 8009BBD4 0E80103C */  lui        $s0, %hi(plr + 0x1D)
    /* 8BBD8 8009BBD8 55A51026 */  addiu      $s0, $s0, %lo(plr + 0x1D)
    /* 8BBDC 8009BBDC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8BBE0 8009BBE0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8BBE4 8009BBE4 00000292 */  lbu        $v0, 0x0($s0)
    /* 8BBE8 8009BBE8 00000000 */  nop
    /* 8BBEC 8009BBEC 1A004010 */  beqz       $v0, .L8009BC58
    /* 8BBF0 8009BBF0 2188A000 */   addu      $s1, $a1, $zero
    /* 8BBF4 8009BBF4 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 8BBF8 8009BBF8 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 8BBFC 8009BBFC 00000000 */  nop
    /* 8BC00 8009BC00 0F004010 */  beqz       $v0, .L8009BC40
    /* 8BC04 8009BC04 00000000 */   nop
    /* 8BC08 8009BC08 0C80053C */  lui        $a1, %hi(DefP1PanelXY2)
    /* 8BC0C 8009BC0C C49AA524 */  addiu      $a1, $a1, %lo(DefP1PanelXY2)
    /* 8BC10 8009BC10 1280013C */  lui        $at, %hi(sel_data)
    /* 8BC14 8009BC14 2CB720AC */  sw         $zero, %lo(sel_data)($at)
    /* 8BC18 8009BC18 0C62020C */  jal        Print__6GPanelP7PanelXYP12PlayerStruct
    /* 8BC1C 8009BC1C E3FF0626 */   addiu     $a2, $s0, -0x1D
    /* 8BC20 8009BC20 21202002 */  addu       $a0, $s1, $zero
    /* 8BC24 8009BC24 0C80053C */  lui        $a1, %hi(DefP2PanelXY2)
    /* 8BC28 8009BC28 749BA524 */  addiu      $a1, $a1, %lo(DefP2PanelXY2)
    /* 8BC2C 8009BC2C 01000224 */  addiu      $v0, $zero, 0x1
    /* 8BC30 8009BC30 1280013C */  lui        $at, %hi(sel_data)
    /* 8BC34 8009BC34 2CB722AC */  sw         $v0, %lo(sel_data)($at)
    /* 8BC38 8009BC38 216F0208 */  j          .L8009BC84
    /* 8BC3C 8009BC3C CB190626 */   addiu     $a2, $s0, 0x19CB
  .L8009BC40:
    /* 8BC40 8009BC40 1280013C */  lui        $at, %hi(sel_data)
    /* 8BC44 8009BC44 2CB720AC */  sw         $zero, %lo(sel_data)($at)
    /* 8BC48 8009BC48 0C80053C */  lui        $a1, %hi(DefP1PanelXY)
    /* 8BC4C 8009BC4C 6C9AA524 */  addiu      $a1, $a1, %lo(DefP1PanelXY)
    /* 8BC50 8009BC50 216F0208 */  j          .L8009BC84
    /* 8BC54 8009BC54 E3FF0626 */   addiu     $a2, $s0, -0x1D
  .L8009BC58:
    /* 8BC58 8009BC58 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 8BC5C 8009BC5C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 8BC60 8009BC60 00000000 */  nop
    /* 8BC64 8009BC64 09004010 */  beqz       $v0, .L8009BC8C
    /* 8BC68 8009BC68 01000224 */   addiu     $v0, $zero, 0x1
    /* 8BC6C 8009BC6C 1280013C */  lui        $at, %hi(sel_data)
    /* 8BC70 8009BC70 2CB722AC */  sw         $v0, %lo(sel_data)($at)
    /* 8BC74 8009BC74 21202002 */  addu       $a0, $s1, $zero
    /* 8BC78 8009BC78 0C80053C */  lui        $a1, %hi(DefP2PanelXY)
    /* 8BC7C 8009BC7C 1C9BA524 */  addiu      $a1, $a1, %lo(DefP2PanelXY)
    /* 8BC80 8009BC80 CB190626 */  addiu      $a2, $s0, 0x19CB
  .L8009BC84:
    /* 8BC84 8009BC84 0C62020C */  jal        Print__6GPanelP7PanelXYP12PlayerStruct
    /* 8BC88 8009BC88 00000000 */   nop
  .L8009BC8C:
    /* 8BC8C 8009BC8C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8BC90 8009BC90 1400B18F */  lw         $s1, 0x14($sp)
    /* 8BC94 8009BC94 1000B08F */  lw         $s0, 0x10($sp)
    /* 8BC98 8009BC98 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8BC9C 8009BC9C 0800E003 */  jr         $ra
    /* 8BCA0 8009BCA0 00000000 */   nop
endlabel DoShowPanelGFX__FP6GPanelT0
