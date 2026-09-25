.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching timeout_cursor__FUc, 0xA8

glabel timeout_cursor__FUc
    /* 29DB0 80039DB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29DB4 80039DB4 FF008430 */  andi       $a0, $a0, 0xFF
    /* 29DB8 80039DB8 18008010 */  beqz       $a0, .L80039E1C
    /* 29DBC 80039DBC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 29DC0 80039DC0 2810828F */  lw         $v0, %gp_rel(D_8011B7A8)($gp)
    /* 29DC4 80039DC4 00000000 */  nop
    /* 29DC8 80039DC8 1F004014 */  bnez       $v0, .L80039E48
    /* 29DCC 80039DCC 00000000 */   nop
    /* 29DD0 80039DD0 2C108293 */  lbu        $v0, %gp_rel(sgbMouseDown)($gp)
    /* 29DD4 80039DD4 00000000 */  nop
    /* 29DD8 80039DD8 1B004014 */  bnez       $v0, .L80039E48
    /* 29DDC 80039DDC 00000000 */   nop
    /* 29DE0 80039DE0 1280023C */  lui        $v0, %hi(myplr)
    /* 29DE4 80039DE4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 29DE8 80039DE8 00000000 */  nop
    /* 29DEC 80039DEC 80100200 */  sll        $v0, $v0, 2
    /* 29DF0 80039DF0 1280013C */  lui        $at, %hi(_pcurs)
    /* 29DF4 80039DF4 21082200 */  addu       $at, $at, $v0
    /* 29DF8 80039DF8 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 29DFC 80039DFC 00000000 */  nop
    /* 29E00 80039E00 281082AF */  sw         $v0, %gp_rel(D_8011B7A8)($gp)
    /* 29E04 80039E04 C8C7000C */  jal        ClearPanel__Fv
    /* 29E08 80039E08 00000000 */   nop
    /* 29E0C 80039E0C 01DE000C */  jal        NewCursor__Fi
    /* 29E10 80039E10 0B000424 */   addiu     $a0, $zero, 0xB
    /* 29E14 80039E14 91E70008 */  j          .L80039E44
    /* 29E18 80039E18 FF000224 */   addiu     $v0, $zero, 0xFF
  .L80039E1C:
    /* 29E1C 80039E1C 2810848F */  lw         $a0, %gp_rel(D_8011B7A8)($gp)
    /* 29E20 80039E20 00000000 */  nop
    /* 29E24 80039E24 08008010 */  beqz       $a0, .L80039E48
    /* 29E28 80039E28 00000000 */   nop
    /* 29E2C 80039E2C E8DD000C */  jal        SetCursor__Fi
    /* 29E30 80039E30 00000000 */   nop
    /* 29E34 80039E34 281080AF */  sw         $zero, %gp_rel(D_8011B7A8)($gp)
    /* 29E38 80039E38 C8C7000C */  jal        ClearPanel__Fv
    /* 29E3C 80039E3C 00000000 */   nop
    /* 29E40 80039E40 FF000224 */  addiu      $v0, $zero, 0xFF
  .L80039E44:
    /* 29E44 80039E44 101082AF */  sw         $v0, %gp_rel(force_redraw)($gp)
  .L80039E48:
    /* 29E48 80039E48 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29E4C 80039E4C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29E50 80039E50 0800E003 */  jr         $ra
    /* 29E54 80039E54 00000000 */   nop
endlabel timeout_cursor__FUc
