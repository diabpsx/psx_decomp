.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitVision__Fv, 0x54

glabel InitVision__Fv
    /* 3D554 8004D554 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 3D558 8004D558 1280033C */  lui        $v1, %hi(TransVal)
    /* 3D55C 8004D55C 48C16380 */  lb         $v1, %lo(TransVal)($v1)
    /* 3D560 8004D560 01000224 */  addiu      $v0, $zero, 0x1
    /* 3D564 8004D564 9C1180AF */  sw         $zero, %gp_rel(numvision)($gp)
    /* 3D568 8004D568 A01180A3 */  sb         $zero, %gp_rel(dovision)($gp)
    /* 3D56C 8004D56C A41182AF */  sw         $v0, %gp_rel(visionid)($gp)
    /* 3D570 8004D570 0A006018 */  blez       $v1, .L8004D59C
    /* 3D574 8004D574 21200000 */   addu      $a0, $zero, $zero
  .L8004D578:
    /* 3D578 8004D578 0E80013C */  lui        $at, %hi(TransList)
    /* 3D57C 8004D57C 21082400 */  addu       $at, $at, $a0
    /* 3D580 8004D580 287920A0 */  sb         $zero, %lo(TransList)($at)
    /* 3D584 8004D584 1280023C */  lui        $v0, %hi(TransVal)
    /* 3D588 8004D588 48C14280 */  lb         $v0, %lo(TransVal)($v0)
    /* 3D58C 8004D58C 01008424 */  addiu      $a0, $a0, 0x1
    /* 3D590 8004D590 2A108200 */  slt        $v0, $a0, $v0
    /* 3D594 8004D594 F8FF4014 */  bnez       $v0, .L8004D578
    /* 3D598 8004D598 00000000 */   nop
  .L8004D59C:
    /* 3D59C 8004D59C 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 3D5A0 8004D5A0 0800E003 */  jr         $ra
    /* 3D5A4 8004D5A4 00000000 */   nop
endlabel InitVision__Fv
