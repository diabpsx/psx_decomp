.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPortalLvlPos__Fv, 0xB4

glabel GetPortalLvlPos__Fv
    /* 71554 80081554 1280023C */  lui        $v0, %hi(currlevel)
    /* 71558 80081558 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 7155C 8008155C 00000000 */  nop
    /* 71560 80081560 0F004014 */  bnez       $v0, .L800815A0
    /* 71564 80081564 00000000 */   nop
    /* 71568 80081568 5021828F */  lw         $v0, %gp_rel(D_8011C8D0)($gp)
    /* 7156C 8008156C 00000000 */  nop
    /* 71570 80081570 80100200 */  sll        $v0, $v0, 2
    /* 71574 80081574 0E80013C */  lui        $at, %hi(D_800E3BCC)
    /* 71578 80081578 21082200 */  addu       $at, $at, $v0
    /* 7157C 8008157C CC3B238C */  lw         $v1, %lo(D_800E3BCC)($at)
    /* 71580 80081580 0E80013C */  lui        $at, %hi(D_800E3BDC)
    /* 71584 80081584 21082200 */  addu       $at, $at, $v0
    /* 71588 80081588 DC3B228C */  lw         $v0, %lo(D_800E3BDC)($at)
    /* 7158C 8008158C 01006324 */  addiu      $v1, $v1, 0x1
    /* 71590 80081590 1280013C */  lui        $at, %hi(ViewX)
    /* 71594 80081594 14C123AC */  sw         $v1, %lo(ViewX)($at)
    /* 71598 80081598 7E050208 */  j          .L800815F8
    /* 7159C 8008159C 01004224 */   addiu     $v0, $v0, 0x1
  .L800815A0:
    /* 715A0 800815A0 5021828F */  lw         $v0, %gp_rel(D_8011C8D0)($gp)
    /* 715A4 800815A4 00000000 */  nop
    /* 715A8 800815A8 40180200 */  sll        $v1, $v0, 1
    /* 715AC 800815AC 21186200 */  addu       $v1, $v1, $v0
    /* 715B0 800815B0 80180300 */  sll        $v1, $v1, 2
    /* 715B4 800815B4 0E80013C */  lui        $at, %hi(portal + 0x4)
    /* 715B8 800815B8 21082300 */  addu       $at, $at, $v1
    /* 715BC 800815BC F03B2480 */  lb         $a0, %lo(portal + 0x4)($at)
    /* 715C0 800815C0 1280013C */  lui        $at, %hi(ViewX)
    /* 715C4 800815C4 14C124AC */  sw         $a0, %lo(ViewX)($at)
    /* 715C8 800815C8 0E80013C */  lui        $at, %hi(portal + 0x5)
    /* 715CC 800815CC 21082300 */  addu       $at, $at, $v1
    /* 715D0 800815D0 F13B2580 */  lb         $a1, %lo(portal + 0x5)($at)
    /* 715D4 800815D4 1280033C */  lui        $v1, %hi(myplr)
    /* 715D8 800815D8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 715DC 800815DC 1280013C */  lui        $at, %hi(ViewY)
    /* 715E0 800815E0 18C125AC */  sw         $a1, %lo(ViewY)($at)
    /* 715E4 800815E4 06004310 */  beq        $v0, $v1, .L80081600
    /* 715E8 800815E8 01008224 */   addiu     $v0, $a0, 0x1
    /* 715EC 800815EC 1280013C */  lui        $at, %hi(ViewX)
    /* 715F0 800815F0 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 715F4 800815F4 0100A224 */  addiu      $v0, $a1, 0x1
  .L800815F8:
    /* 715F8 800815F8 1280013C */  lui        $at, %hi(ViewY)
    /* 715FC 800815FC 18C122AC */  sw         $v0, %lo(ViewY)($at)
  .L80081600:
    /* 71600 80081600 0800E003 */  jr         $ra
    /* 71604 80081604 00000000 */   nop
endlabel GetPortalLvlPos__Fv
