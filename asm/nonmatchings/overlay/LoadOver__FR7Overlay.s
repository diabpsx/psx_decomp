.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadOver__FR7Overlay, 0x54

glabel LoadOver__FR7Overlay
    /* 85674 80095674 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 85678 80095678 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8567C 8009567C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 85680 80095680 0E56020C */  jal        GetOverType__7Overlay
    /* 85684 80095684 21808000 */   addu      $s0, $a0, $zero
    /* 85688 80095688 B405838F */  lw         $v1, %gp_rel(CurrentOverlay)($gp)
    /* 8568C 8009568C 00000000 */  nop
    /* 85690 80095690 08006210 */  beq        $v1, $v0, .L800956B4
    /* 85694 80095694 00000000 */   nop
    /* 85698 80095698 3C55020C */  jal        ClearOutOverlays__Fv
    /* 8569C 8009569C 00000000 */   nop
    /* 856A0 800956A0 8355020C */  jal        Load__7Overlay
    /* 856A4 800956A4 21200002 */   addu      $a0, $s0, $zero
    /* 856A8 800956A8 0E56020C */  jal        GetOverType__7Overlay
    /* 856AC 800956AC 21200002 */   addu      $a0, $s0, $zero
    /* 856B0 800956B0 B40582AF */  sw         $v0, %gp_rel(CurrentOverlay)($gp)
  .L800956B4:
    /* 856B4 800956B4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 856B8 800956B8 1000B08F */  lw         $s0, 0x10($sp)
    /* 856BC 800956BC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 856C0 800956C0 0800E003 */  jr         $ra
    /* 856C4 800956C4 00000000 */   nop
endlabel LoadOver__FR7Overlay
