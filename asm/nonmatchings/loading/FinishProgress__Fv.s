.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FinishProgress__Fv, 0x60

glabel FinishProgress__Fv
    /* 94DD8 800A4DD8 CC09828F */  lw         $v0, %gp_rel(D_8011B14C)($gp)
    /* 94DDC 800A4DDC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94DE0 800A4DE0 0F004014 */  bnez       $v0, .L800A4E20
    /* 94DE4 800A4DE4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 94DE8 800A4DE8 6C1F8297 */  lhu        $v0, %gp_rel(D_8011C6EC)($gp)
    /* 94DEC 800A4DEC 00000000 */  nop
    /* 94DF0 800A4DF0 0001422C */  sltiu      $v0, $v0, 0x100
    /* 94DF4 800A4DF4 0C004010 */  beqz       $v0, .L800A4E28
    /* 94DF8 800A4DF8 00000000 */   nop
  .L800A4DFC:
    /* 94DFC 800A4DFC 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 94E00 800A4E00 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 94E04 800A4E04 6C1F8297 */  lhu        $v0, %gp_rel(D_8011C6EC)($gp)
    /* 94E08 800A4E08 00000000 */  nop
    /* 94E0C 800A4E0C 0001422C */  sltiu      $v0, $v0, 0x100
    /* 94E10 800A4E10 05004010 */  beqz       $v0, .L800A4E28
    /* 94E14 800A4E14 00000000 */   nop
    /* 94E18 800A4E18 7F930208 */  j          .L800A4DFC
    /* 94E1C 800A4E1C 00000000 */   nop
  .L800A4E20:
    /* 94E20 800A4E20 5393020C */  jal        FinishBootProgress__Fv
    /* 94E24 800A4E24 00000000 */   nop
  .L800A4E28:
    /* 94E28 800A4E28 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94E2C 800A4E2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94E30 800A4E30 0800E003 */  jr         $ra
    /* 94E34 800A4E34 00000000 */   nop
endlabel FinishProgress__Fv
