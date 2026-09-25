.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearOutOverlays__Fv, 0x58

glabel ClearOutOverlays__Fv
    /* 854F0 800954F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 854F4 800954F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 854F8 800954F8 1280043C */  lui        $a0, %hi(D_8011CC28)
    /* 854FC 800954FC 28CC8424 */  addiu      $a0, $a0, %lo(D_8011CC28)
    /* 85500 80095500 5255020C */  jal        ClearOut__7Overlay
    /* 85504 80095504 00000000 */   nop
    /* 85508 80095508 1280043C */  lui        $a0, %hi(D_8011CC38)
    /* 8550C 8009550C 38CC8424 */  addiu      $a0, $a0, %lo(D_8011CC38)
    /* 85510 80095510 5255020C */  jal        ClearOut__7Overlay
    /* 85514 80095514 00000000 */   nop
    /* 85518 80095518 1280043C */  lui        $a0, %hi(D_8011CC48)
    /* 8551C 8009551C 48CC8424 */  addiu      $a0, $a0, %lo(D_8011CC48)
    /* 85520 80095520 5255020C */  jal        ClearOut__7Overlay
    /* 85524 80095524 00000000 */   nop
    /* 85528 80095528 1280043C */  lui        $a0, %hi(D_8011CC58)
    /* 8552C 8009552C 58CC8424 */  addiu      $a0, $a0, %lo(D_8011CC58)
    /* 85530 80095530 5255020C */  jal        ClearOut__7Overlay
    /* 85534 80095534 00000000 */   nop
    /* 85538 80095538 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8553C 8009553C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 85540 80095540 0800E003 */  jr         $ra
    /* 85544 80095544 00000000 */   nop
endlabel ClearOutOverlays__Fv
