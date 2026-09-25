.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_ConfirmEnter__Fv, 0x11C

glabel S_ConfirmEnter__Fv
    /* 63700 80073700 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 63704 80073704 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63708 80073708 11000224 */  addiu      $v0, $zero, 0x11
    /* 6370C 8007370C 38006214 */  bne        $v1, $v0, .L800737F0
    /* 63710 80073710 1000BFAF */   sw        $ra, 0x10($sp)
    /* 63714 80073714 0C21828F */  lw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 63718 80073718 00000000 */  nop
    /* 6371C 8007371C FEFF4324 */  addiu      $v1, $v0, -0x2
    /* 63720 80073720 1100622C */  sltiu      $v0, $v1, 0x11
    /* 63724 80073724 2D004010 */  beqz       $v0, .L800737DC
    /* 63728 80073728 80100300 */   sll       $v0, $v1, 2
    /* 6372C 8007372C 1180013C */  lui        $at, %hi(jtbl_80117B68)
    /* 63730 80073730 21082200 */  addu       $at, $at, $v0
    /* 63734 80073734 687B228C */  lw         $v0, %lo(jtbl_80117B68)($at)
    /* 63738 80073738 00000000 */  nop
    /* 6373C 8007373C 08004000 */  jr         $v0
    /* 63740 80073740 00000000 */   nop
  jlabel .L80073744
    /* 63744 80073744 E5C2010C */  jal        SmithBuyItem__Fv
    /* 63748 80073748 00000000 */   nop
    /* 6374C 8007374C F7CD0108 */  j          .L800737DC
    /* 63750 80073750 00000000 */   nop
  jlabel .L80073754
    /* 63754 80073754 1EC4010C */  jal        SmithBuyPItem__Fv
    /* 63758 80073758 00000000 */   nop
    /* 6375C 8007375C F7CD0108 */  j          .L800737DC
    /* 63760 80073760 00000000 */   nop
  jlabel .L80073764
    /* 63764 80073764 80C6010C */  jal        StoreSellItem__Fv
    /* 63768 80073768 00000000 */   nop
    /* 6376C 8007376C F7CD0108 */  j          .L800737DC
    /* 63770 80073770 00000000 */   nop
  jlabel .L80073774
    /* 63774 80073774 95C7010C */  jal        SmithRepairItem__Fv
    /* 63778 80073778 00000000 */   nop
    /* 6377C 8007377C F7CD0108 */  j          .L800737DC
    /* 63780 80073780 00000000 */   nop
  jlabel .L80073784
    /* 63784 80073784 C3C8010C */  jal        WitchBuyItem__Fv
    /* 63788 80073788 00000000 */   nop
    /* 6378C 8007378C F7CD0108 */  j          .L800737DC
    /* 63790 80073790 00000000 */   nop
  jlabel .L80073794
    /* 63794 80073794 56CA010C */  jal        WitchRechargeItem__Fv
    /* 63798 80073798 00000000 */   nop
    /* 6379C 8007379C F7CD0108 */  j          .L800737DC
    /* 637A0 800737A0 00000000 */   nop
  jlabel .L800737A4
    /* 637A4 800737A4 74CB010C */  jal        BoyBuyItem__Fv
    /* 637A8 800737A8 00000000 */   nop
    /* 637AC 800737AC F7CD0108 */  j          .L800737DC
    /* 637B0 800737B0 00000000 */   nop
  jlabel .L800737B4
    /* 637B4 800737B4 9CCB010C */  jal        HealerBuyItem__Fv
    /* 637B8 800737B8 00000000 */   nop
    /* 637BC 800737BC F7CD0108 */  j          .L800737DC
    /* 637C0 800737C0 00000000 */   nop
  jlabel .L800737C4
    /* 637C4 800737C4 ECCC010C */  jal        StoryIdItem__Fv
    /* 637C8 800737C8 00000000 */   nop
    /* 637CC 800737CC 5BBE010C */  jal        StartStore__Fc
    /* 637D0 800737D0 14000424 */   addiu     $a0, $zero, 0x14
    /* 637D4 800737D4 03CE0108 */  j          .L8007380C
    /* 637D8 800737D8 00000000 */   nop
  jlabel .L800737DC
    /* 637DC 800737DC 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 637E0 800737E0 5BBE010C */  jal        StartStore__Fc
    /* 637E4 800737E4 00000000 */   nop
    /* 637E8 800737E8 03CE0108 */  j          .L8007380C
    /* 637EC 800737EC 00000000 */   nop
  .L800737F0:
    /* 637F0 800737F0 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 637F4 800737F4 5BBE010C */  jal        StartStore__Fc
    /* 637F8 800737F8 00000000 */   nop
    /* 637FC 800737FC 0821828F */  lw         $v0, %gp_rel(D_8011C888)($gp)
    /* 63800 80073800 1021838F */  lw         $v1, %gp_rel(D_8011C890)($gp)
    /* 63804 80073804 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 63808 80073808 142183AF */  sw         $v1, %gp_rel(D_8011C894)($gp)
  .L8007380C:
    /* 6380C 8007380C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 63810 80073810 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 63814 80073814 0800E003 */  jr         $ra
    /* 63818 80073818 00000000 */   nop
endlabel S_ConfirmEnter__Fv
