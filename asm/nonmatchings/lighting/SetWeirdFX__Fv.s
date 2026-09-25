.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetWeirdFX__Fv, 0x74

glabel SetWeirdFX__Fv
    /* 3BDAC 8004BDAC 7411828F */  lw         $v0, %gp_rel(weird_cheat)($gp)
    /* 3BDB0 8004BDB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3BDB4 8004BDB4 16004014 */  bnez       $v0, .L8004BE10
    /* 3BDB8 8004BDB8 1000BFAF */   sw        $ra, 0x10($sp)
    /* 3BDBC 8004BDBC 00400224 */  addiu      $v0, $zero, 0x4000
    /* 3BDC0 8004BDC0 642082AF */  sw         $v0, %gp_rel(D_8011C7E4)($gp)
    /* 3BDC4 8004BDC4 00200224 */  addiu      $v0, $zero, 0x2000
    /* 3BDC8 8004BDC8 6C2082AF */  sw         $v0, %gp_rel(D_8011C7EC)($gp)
    /* 3BDCC 8004BDCC 00100224 */  addiu      $v0, $zero, 0x1000
    /* 3BDD0 8004BDD0 742082AF */  sw         $v0, %gp_rel(D_8011C7F4)($gp)
    /* 3BDD4 8004BDD4 800A0224 */  addiu      $v0, $zero, 0xA80
    /* 3BDD8 8004BDD8 682082AF */  sw         $v0, %gp_rel(D_8011C7E8)($gp)
    /* 3BDDC 8004BDDC F0F50224 */  addiu      $v0, $zero, -0xA10
    /* 3BDE0 8004BDE0 702082AF */  sw         $v0, %gp_rel(D_8011C7F0)($gp)
    /* 3BDE4 8004BDE4 A00A0224 */  addiu      $v0, $zero, 0xAA0
    /* 3BDE8 8004BDE8 0E80043C */  lui        $a0, %hi(plr + 0x5B)
    /* 3BDEC 8004BDEC 93A58480 */  lb         $a0, %lo(plr + 0x5B)($a0)
    /* 3BDF0 8004BDF0 801180AF */  sw         $zero, %gp_rel(restore_b)($gp)
    /* 3BDF4 8004BDF4 7C1180AF */  sw         $zero, %gp_rel(restore_g)($gp)
    /* 3BDF8 8004BDF8 781180AF */  sw         $zero, %gp_rel(restore_r)($gp)
    /* 3BDFC 8004BDFC 782082AF */  sw         $v0, %gp_rel(D_8011C7F8)($gp)
    /* 3BE00 8004BE00 0335010C */  jal        ChangeLightColour__Fii
    /* 3BE04 8004BE04 70E00534 */   ori       $a1, $zero, 0xE070
    /* 3BE08 8004BE08 01000224 */  addiu      $v0, $zero, 0x1
    /* 3BE0C 8004BE0C 741182AF */  sw         $v0, %gp_rel(weird_cheat)($gp)
  .L8004BE10:
    /* 3BE10 8004BE10 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3BE14 8004BE14 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3BE18 8004BE18 0800E003 */  jr         $ra
    /* 3BE1C 8004BE1C 00000000 */   nop
endlabel SetWeirdFX__Fv
