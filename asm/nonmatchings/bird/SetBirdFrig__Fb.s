.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBirdFrig__Fb, 0x34

glabel SetBirdFrig__Fb
    /* 9B6B0 800AB6B0 280B828F */  lw         $v0, %gp_rel(D_8011B2A8)($gp)
    /* 9B6B4 800AB6B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9B6B8 800AB6B8 06008210 */  beq        $a0, $v0, .L800AB6D4
    /* 9B6BC 800AB6BC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 9B6C0 800AB6C0 280B84AF */  sw         $a0, %gp_rel(D_8011B2A8)($gp)
    /* 9B6C4 800AB6C4 2B200400 */  sltu       $a0, $zero, $a0
    /* 9B6C8 800AB6C8 23200400 */  negu       $a0, $a0
    /* 9B6CC 800AB6CC FBDF010C */  jal        HappyMan__Fi
    /* 9B6D0 800AB6D0 1C008430 */   andi      $a0, $a0, 0x1C
  .L800AB6D4:
    /* 9B6D4 800AB6D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9B6D8 800AB6D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9B6DC 800AB6DC 0800E003 */  jr         $ra
    /* 9B6E0 800AB6E0 00000000 */   nop
endlabel SetBirdFrig__Fb
