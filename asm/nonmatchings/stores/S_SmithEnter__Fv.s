.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_SmithEnter__Fv, 0xD8

glabel S_SmithEnter__Fv
    /* 60570 80070570 0421828F */  lw         $v0, %gp_rel(D_8011C884)($gp)
    /* 60574 80070574 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 60578 80070578 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6057C 8007057C 211380A3 */  sb         $zero, %gp_rel(WFlag)($gp)
    /* 60580 80070580 F8FF4324 */  addiu      $v1, $v0, -0x8
    /* 60584 80070584 0600622C */  sltiu      $v0, $v1, 0x6
    /* 60588 80070588 25004010 */  beqz       $v0, .L80070620
    /* 6058C 8007058C 80100300 */   sll       $v0, $v1, 2
    /* 60590 80070590 1180013C */  lui        $at, %hi(jtbl_80117B30)
    /* 60594 80070594 21082200 */  addu       $at, $at, $v0
    /* 60598 80070598 307B228C */  lw         $v0, %lo(jtbl_80117B30)($at)
    /* 6059C 8007059C 00000000 */  nop
    /* 605A0 800705A0 08004000 */  jr         $v0
    /* 605A4 800705A4 00000000 */   nop
  jlabel .L800705A8
    /* 605A8 800705A8 01000224 */  addiu      $v0, $zero, 0x1
    /* 605AC 800705AC 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 605B0 800705B0 08000224 */  addiu      $v0, $zero, 0x8
    /* 605B4 800705B4 082182AF */  sw         $v0, %gp_rel(D_8011C888)($gp)
    /* 605B8 800705B8 BD000224 */  addiu      $v0, $zero, 0xBD
    /* 605BC 800705BC 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 605C0 800705C0 C7000224 */  addiu      $v0, $zero, 0xC7
    /* 605C4 800705C4 442180AF */  sw         $zero, %gp_rel(D_8011C8C4)($gp)
    /* 605C8 800705C8 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 605CC 800705CC 5BBE010C */  jal        StartStore__Fc
    /* 605D0 800705D0 13000424 */   addiu     $a0, $zero, 0x13
    /* 605D4 800705D4 88C10108 */  j          .L80070620
    /* 605D8 800705D8 00000000 */   nop
  jlabel .L800705DC
    /* 605DC 800705DC 5BBE010C */  jal        StartStore__Fc
    /* 605E0 800705E0 02000424 */   addiu     $a0, $zero, 0x2
    /* 605E4 800705E4 88C10108 */  j          .L80070620
    /* 605E8 800705E8 00000000 */   nop
  jlabel .L800705EC
    /* 605EC 800705EC 5BBE010C */  jal        StartStore__Fc
    /* 605F0 800705F0 12000424 */   addiu     $a0, $zero, 0x12
    /* 605F4 800705F4 88C10108 */  j          .L80070620
    /* 605F8 800705F8 00000000 */   nop
  jlabel .L800705FC
    /* 605FC 800705FC 5BBE010C */  jal        StartStore__Fc
    /* 60600 80070600 03000424 */   addiu     $a0, $zero, 0x3
    /* 60604 80070604 88C10108 */  j          .L80070620
    /* 60608 80070608 00000000 */   nop
  jlabel .L8007060C
    /* 6060C 8007060C 5BBE010C */  jal        StartStore__Fc
    /* 60610 80070610 04000424 */   addiu     $a0, $zero, 0x4
    /* 60614 80070614 88C10108 */  j          .L80070620
    /* 60618 80070618 00000000 */   nop
  jlabel .L8007061C
    /* 6061C 8007061C 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L80070620:
    /* 60620 80070620 60138283 */  lb         $v0, %gp_rel(stextflag)($gp)
    /* 60624 80070624 00000000 */  nop
    /* 60628 80070628 03004014 */  bnez       $v0, .L80070638
    /* 6062C 8007062C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 60630 80070630 1280013C */  lui        $at, %hi(options_pad)
    /* 60634 80070634 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L80070638:
    /* 60638 80070638 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6063C 8007063C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 60640 80070640 0800E003 */  jr         $ra
    /* 60644 80070644 00000000 */   nop
endlabel S_SmithEnter__Fv
