.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLighting__Fv, 0x44

glabel InitLighting__Fv
    /* 3D2A4 8004D2A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3D2A8 8004D2A8 4F000224 */  addiu      $v0, $zero, 0x4F
    /* 3D2AC 8004D2AC 0D80033C */  lui        $v1, %hi(lightactive + 0x4F)
    /* 3D2B0 8004D2B0 CF656324 */  addiu      $v1, $v1, %lo(lightactive + 0x4F)
    /* 3D2B4 8004D2B4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3D2B8 8004D2B8 941180AF */  sw         $zero, %gp_rel(numlights)($gp)
  .L8004D2BC:
    /* 3D2BC 8004D2BC 000062A0 */  sb         $v0, 0x0($v1)
    /* 3D2C0 8004D2C0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 3D2C4 8004D2C4 FDFF4104 */  bgez       $v0, .L8004D2BC
    /* 3D2C8 8004D2C8 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 3D2CC 8004D2CC 342F010C */  jal        set_light_bands__Fv
    /* 3D2D0 8004D2D0 00000000 */   nop
    /* 3D2D4 8004D2D4 602080AF */  sw         $zero, %gp_rel(D_8011C7E0)($gp)
    /* 3D2D8 8004D2D8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3D2DC 8004D2DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3D2E0 8004D2E0 0800E003 */  jr         $ra
    /* 3D2E4 8004D2E4 00000000 */   nop
endlabel InitLighting__Fv
