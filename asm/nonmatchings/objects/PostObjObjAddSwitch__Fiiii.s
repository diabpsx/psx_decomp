.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostObjObjAddSwitch__Fiiii, 0x9C

glabel PostObjObjAddSwitch__Fiiii
    /* 43488 80053488 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4348C 8005348C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 43490 80053490 21188000 */  addu       $v1, $a0, $zero
    /* 43494 80053494 5D00622C */  sltiu      $v0, $v1, 0x5D
    /* 43498 80053498 1E004010 */  beqz       $v0, .L80053514
    /* 4349C 8005349C 2120E000 */   addu      $a0, $a3, $zero
    /* 434A0 800534A0 80100300 */  sll        $v0, $v1, 2
    /* 434A4 800534A4 1180013C */  lui        $at, %hi(jtbl_80116B28)
    /* 434A8 800534A8 21082200 */  addu       $at, $at, $v0
    /* 434AC 800534AC 286B228C */  lw         $v0, %lo(jtbl_80116B28)($at)
    /* 434B0 800534B0 00000000 */  nop
    /* 434B4 800534B4 08004000 */  jr         $v0
    /* 434B8 800534B8 00000000 */   nop
  jlabel .L800534BC
    /* 434BC 800534BC CF4C010C */  jal        PostAddObjLight__Fii
    /* 434C0 800534C0 B8010524 */   addiu     $a1, $zero, 0x1B8
    /* 434C4 800534C4 454D0108 */  j          .L80053514
    /* 434C8 800534C8 00000000 */   nop
  jlabel .L800534CC
    /* 434CC 800534CC 5A4C010C */  jal        PostAddL2Door__Fiiii
    /* 434D0 800534D0 21386000 */   addu      $a3, $v1, $zero
    /* 434D4 800534D4 454D0108 */  j          .L80053514
    /* 434D8 800534D8 00000000 */   nop
  jlabel .L800534DC
    /* 434DC 800534DC AD4C010C */  jal        PostAddArmorStand__Fi
    /* 434E0 800534E0 00000000 */   nop
    /* 434E4 800534E4 454D0108 */  j          .L80053514
    /* 434E8 800534E8 00000000 */   nop
  jlabel .L800534EC
    /* 434EC 800534EC CF4C010C */  jal        PostAddObjLight__Fii
    /* 434F0 800534F0 B6010524 */   addiu     $a1, $zero, 0x1B6
    /* 434F4 800534F4 454D0108 */  j          .L80053514
    /* 434F8 800534F8 00000000 */   nop
  jlabel .L800534FC
    /* 434FC 800534FC 204C010C */  jal        PostAddL1Door__Fiiii
    /* 43500 80053500 21386000 */   addu      $a3, $v1, $zero
    /* 43504 80053504 454D0108 */  j          .L80053514
    /* 43508 80053508 00000000 */   nop
  jlabel .L8005350C
    /* 4350C 8005350C 004D010C */  jal        PostAddWeaponRack__Fi
    /* 43510 80053510 00000000 */   nop
  jlabel .L80053514
    /* 43514 80053514 1000BF8F */  lw         $ra, 0x10($sp)
    /* 43518 80053518 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4351C 8005351C 0800E003 */  jr         $ra
    /* 43520 80053520 00000000 */   nop
endlabel PostObjObjAddSwitch__Fiiii
