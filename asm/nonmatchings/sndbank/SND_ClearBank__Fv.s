.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_ClearBank__Fv, 0x70

glabel SND_ClearBank__Fv
    /* 8A3D0 8009A3D0 8006848F */  lw         $a0, %gp_rel(D_8011AE00)($gp)
    /* 8A3D4 8009A3D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8A3D8 8009A3D8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8A3DC 8009A3DC 03008010 */  beqz       $a0, .L8009A3EC
    /* 8A3E0 8009A3E0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8A3E4 8009A3E4 635E000C */  jal        SpuFree
    /* 8A3E8 8009A3E8 00000000 */   nop
  .L8009A3EC:
    /* 8A3EC 8009A3EC 7C06848F */  lw         $a0, %gp_rel(D_8011ADFC)($gp)
    /* 8A3F0 8009A3F0 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 8A3F4 8009A3F4 0B009010 */  beq        $a0, $s0, .L8009A424
    /* 8A3F8 8009A3F8 00000000 */   nop
    /* 8A3FC 8009A3FC 1886000C */  jal        GAL_Free
    /* 8A400 8009A400 00000000 */   nop
    /* 8A404 8009A404 FF004230 */  andi       $v0, $v0, 0xFF
    /* 8A408 8009A408 05004014 */  bnez       $v0, .L8009A420
    /* 8A40C 8009A40C 21200000 */   addu      $a0, $zero, $zero
    /* 8A410 8009A410 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A414 8009A414 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A418 8009A418 A583000C */  jal        DBG_Error
    /* 8A41C 8009A41C 07010624 */   addiu     $a2, $zero, 0x107
  .L8009A420:
    /* 8A420 8009A420 7C0690AF */  sw         $s0, %gp_rel(D_8011ADFC)($gp)
  .L8009A424:
    /* 8A424 8009A424 800680AF */  sw         $zero, %gp_rel(D_8011AE00)($gp)
    /* 8A428 8009A428 2C1F80A7 */  sh         $zero, %gp_rel(D_8011C6AC)($gp)
    /* 8A42C 8009A42C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8A430 8009A430 1000B08F */  lw         $s0, 0x10($sp)
    /* 8A434 8009A434 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8A438 8009A438 0800E003 */  jr         $ra
    /* 8A43C 8009A43C 00000000 */   nop
endlabel SND_ClearBank__Fv
