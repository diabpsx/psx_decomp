.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FrontEndTask__FP4TASK, 0x4AC

glabel FrontEndTask__FP4TASK
    /* 2914 8013C50C CC0B828F */  lw         $v0, %gp_rel(FeAttractMode)($gp)
    /* 2918 8013C510 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 291C 8013C514 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 2920 8013C518 21880000 */  addu       $s1, $zero, $zero
    /* 2924 8013C51C 3400B3AF */  sw         $s3, 0x34($sp)
    /* 2928 8013C520 3800BFAF */  sw         $ra, 0x38($sp)
    /* 292C 8013C524 3000B2AF */  sw         $s2, 0x30($sp)
    /* 2930 8013C528 2800B0AF */  sw         $s0, 0x28($sp)
    /* 2934 8013C52C BC0B80AF */  sw         $zero, %gp_rel(D_8011B33C)($gp)
    /* 2938 8013C530 1A004010 */  beqz       $v0, .L8013C59C
    /* 293C 8013C534 21980000 */   addu      $s3, $zero, $zero
    /* 2940 8013C538 5393020C */  jal        FinishBootProgress__Fv
    /* 2944 8013C53C 00000000 */   nop
    /* 2948 8013C540 1280023C */  lui        $v0, %hi(ADirtyFlagThatGaryWillLove)
    /* 294C 8013C544 5ABE4290 */  lbu        $v0, %lo(ADirtyFlagThatGaryWillLove)($v0)
    /* 2950 8013C548 00000000 */  nop
    /* 2954 8013C54C 19004010 */  beqz       $v0, .L8013C5B4
    /* 2958 8013C550 00000000 */   nop
    /* 295C 8013C554 1280043C */  lui        $a0, %hi(DirtyVidx)
    /* 2960 8013C558 5CBE848C */  lw         $a0, %lo(DirtyVidx)($a0)
    /* 2964 8013C55C 00000000 */  nop
    /* 2968 8013C560 06008014 */  bnez       $a0, .L8013C57C
    /* 296C 8013C564 00000000 */   nop
    /* 2970 8013C568 1280023C */  lui        $v0, %hi(DirtyVidY)
    /* 2974 8013C56C 60BE428C */  lw         $v0, %lo(DirtyVidY)($v0)
    /* 2978 8013C570 00000000 */  nop
    /* 297C 8013C574 05004010 */  beqz       $v0, .L8013C58C
    /* 2980 8013C578 00000000 */   nop
  .L8013C57C:
    /* 2984 8013C57C 1280053C */  lui        $a1, %hi(DirtyVidY)
    /* 2988 8013C580 60BEA58C */  lw         $a1, %lo(DirtyVidY)($a1)
    /* 298C 8013C584 5710020C */  jal        VID_SetXYOff__Fii
    /* 2990 8013C588 00000000 */   nop
  .L8013C58C:
    /* 2994 8013C58C 1280013C */  lui        $at, %hi(ADirtyFlagThatGaryWillLove)
    /* 2998 8013C590 5ABE20A0 */  sb         $zero, %lo(ADirtyFlagThatGaryWillLove)($at)
    /* 299C 8013C594 6DF10408 */  j          .L8013C5B4
    /* 29A0 8013C598 00000000 */   nop
  .L8013C59C:
    /* 29A4 8013C59C 18F1040C */  jal        FeInitMainStuff__FP4TASK
    /* 29A8 8013C5A0 21200000 */   addu      $a0, $zero, $zero
    /* 29AC 8013C5A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 29B0 8013C5A8 CC0B82AF */  sw         $v0, %gp_rel(FeAttractMode)($gp)
    /* 29B4 8013C5AC 06000224 */  addiu      $v0, $zero, 0x6
    /* 29B8 8013C5B0 D00B82AF */  sw         $v0, %gp_rel(AttractNo)($gp)
  .L8013C5B4:
    /* 29BC 8013C5B4 3E10020C */  jal        VID_GetTick__Fv
    /* 29C0 8013C5B8 00000000 */   nop
    /* 29C4 8013C5BC 0D80043C */  lui        $a0, %hi(FeMainMenu)
    /* 29C8 8013C5C0 9CD68424 */  addiu      $a0, $a0, %lo(FeMainMenu)
    /* 29CC 8013C5C4 200C82AF */  sw         $v0, %gp_rel(FeCount)($gp)
    /* 29D0 8013C5C8 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* 29D4 8013C5CC 00000000 */   nop
    /* 29D8 8013C5D0 F40B8393 */  lbu        $v1, %gp_rel(FeFlag)($gp)
    /* 29DC 8013C5D4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 29E0 8013C5D8 040C82AF */  sw         $v0, %gp_rel(FeNoOfPlayers)($gp)
    /* 29E4 8013C5DC 02000224 */  addiu      $v0, $zero, 0x2
    /* 29E8 8013C5E0 E1006210 */  beq        $v1, $v0, .L8013C968
    /* 29EC 8013C5E4 00000000 */   nop
    /* 29F0 8013C5E8 0C80123C */  lui        $s2, %hi(MediumFont)
    /* 29F4 8013C5EC D8825226 */  addiu      $s2, $s2, %lo(MediumFont)
  .L8013C5F0:
    /* 29F8 8013C5F0 1280023C */  lui        $v0, %hi(PlayDemoFlag)
    /* 29FC 8013C5F4 81AC4290 */  lbu        $v0, %lo(PlayDemoFlag)($v0)
    /* 2A00 8013C5F8 00000000 */  nop
    /* 2A04 8013C5FC 02004010 */  beqz       $v0, .L8013C608
    /* 2A08 8013C600 02000224 */   addiu     $v0, $zero, 0x2
    /* 2A0C 8013C604 F40B82A3 */  sb         $v0, %gp_rel(FeFlag)($gp)
  .L8013C608:
    /* 2A10 8013C608 8F11020C */  jal        ReadPad__Fi
    /* 2A14 8013C60C FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 2A18 8013C610 CC0B828F */  lw         $v0, %gp_rel(FeAttractMode)($gp)
    /* 2A1C 8013C614 00000000 */  nop
    /* 2A20 8013C618 98004010 */  beqz       $v0, .L8013C87C
    /* 2A24 8013C61C 1300222A */   slti      $v0, $s1, 0x13
    /* 2A28 8013C620 1280023C */  lui        $v0, %hi(PlayDemoFlag)
    /* 2A2C 8013C624 81AC4290 */  lbu        $v0, %lo(PlayDemoFlag)($v0)
    /* 2A30 8013C628 00000000 */  nop
    /* 2A34 8013C62C C8004014 */  bnez       $v0, .L8013C950
    /* 2A38 8013C630 00000000 */   nop
    /* 2A3C 8013C634 D00B838F */  lw         $v1, %gp_rel(AttractNo)($gp)
    /* 2A40 8013C638 00000000 */  nop
    /* 2A44 8013C63C 0700622C */  sltiu      $v0, $v1, 0x7
    /* 2A48 8013C640 C3004010 */  beqz       $v0, .L8013C950
    /* 2A4C 8013C644 80100300 */   sll       $v0, $v1, 2
    /* 2A50 8013C648 1180013C */  lui        $at, %hi(jtbl_80111000)
    /* 2A54 8013C64C 21082200 */  addu       $at, $at, $v0
    /* 2A58 8013C650 0010228C */  lw         $v0, %lo(jtbl_80111000)($at)
    /* 2A5C 8013C654 00000000 */  nop
    /* 2A60 8013C658 08004000 */  jr         $v0
    /* 2A64 8013C65C 00000000 */   nop
    /* 2A68 8013C660 D00B828F */  lw         $v0, %gp_rel(AttractNo)($gp)
    /* 2A6C 8013C664 00000000 */  nop
    /* 2A70 8013C668 01004224 */  addiu      $v0, $v0, 0x1
    /* 2A74 8013C66C D00B82AF */  sw         $v0, %gp_rel(AttractNo)($gp)
    /* 2A78 8013C670 85F0040C */  jal        FadeFEOut__Fv
    /* 2A7C 8013C674 00000000 */   nop
    /* 2A80 8013C678 C80B80AF */  sw         $zero, %gp_rel(D_8011B348)($gp)
  .L8013C67C:
    /* 2A84 8013C67C ABFB010C */  jal        GetFadeState__Fv
    /* 2A88 8013C680 00000000 */   nop
    /* 2A8C 8013C684 05004010 */  beqz       $v0, .L8013C69C
    /* 2A90 8013C688 00000000 */   nop
    /* 2A94 8013C68C EE80000C */  jal        TSK_Sleep
    /* 2A98 8013C690 01000424 */   addiu     $a0, $zero, 0x1
    /* 2A9C 8013C694 9FF10408 */  j          .L8013C67C
    /* 2AA0 8013C698 00000000 */   nop
  .L8013C69C:
    /* 2AA4 8013C69C BC0B80AF */  sw         $zero, %gp_rel(D_8011B33C)($gp)
    /* 2AA8 8013C6A0 1280013C */  lui        $at, %hi(user_start)
    /* 2AAC 8013C6A4 E4B420AC */  sw         $zero, %lo(user_start)($at)
    /* 2AB0 8013C6A8 54F20408 */  j          .L8013C950
    /* 2AB4 8013C6AC 21880000 */   addu      $s1, $zero, $zero
    /* 2AB8 8013C6B0 1280023C */  lui        $v0, %hi(user_start)
    /* 2ABC 8013C6B4 E4B4428C */  lw         $v0, %lo(user_start)($v0)
    /* 2AC0 8013C6B8 00000000 */  nop
    /* 2AC4 8013C6BC 05004014 */  bnez       $v0, .L8013C6D4
    /* 2AC8 8013C6C0 00000000 */   nop
    /* 2ACC 8013C6C4 1180043C */  lui        $a0, %hi(D_80110FF4)
    /* 2AD0 8013C6C8 F40F8424 */  addiu      $a0, $a0, %lo(D_80110FF4)
    /* 2AD4 8013C6CC 4AB4020C */  jal        play_movie
    /* 2AD8 8013C6D0 00000000 */   nop
  .L8013C6D4:
    /* 2ADC 8013C6D4 D00B828F */  lw         $v0, %gp_rel(AttractNo)($gp)
    /* 2AE0 8013C6D8 03F20408 */  j          .L8013C80C
    /* 2AE4 8013C6DC 01004224 */   addiu     $v0, $v0, 0x1
    /* 2AE8 8013C6E0 D00B828F */  lw         $v0, %gp_rel(AttractNo)($gp)
    /* 2AEC 8013C6E4 03F20408 */  j          .L8013C80C
    /* 2AF0 8013C6E8 01004224 */   addiu     $v0, $v0, 0x1
    /* 2AF4 8013C6EC D00B828F */  lw         $v0, %gp_rel(AttractNo)($gp)
    /* 2AF8 8013C6F0 03F20408 */  j          .L8013C80C
    /* 2AFC 8013C6F4 01004224 */   addiu     $v0, $v0, 0x1
    /* 2B00 8013C6F8 18F1040C */  jal        FeInitMainStuff__FP4TASK
    /* 2B04 8013C6FC 21206002 */   addu      $a0, $s3, $zero
    /* 2B08 8013C700 3E10020C */  jal        VID_GetTick__Fv
    /* 2B0C 8013C704 00000000 */   nop
    /* 2B10 8013C708 D00B838F */  lw         $v1, %gp_rel(AttractNo)($gp)
    /* 2B14 8013C70C 200C82AF */  sw         $v0, %gp_rel(FeCount)($gp)
    /* 2B18 8013C710 01006324 */  addiu      $v1, $v1, 0x1
    /* 2B1C 8013C714 D00B83AF */  sw         $v1, %gp_rel(AttractNo)($gp)
    /* 2B20 8013C718 54F20408 */  j          .L8013C950
    /* 2B24 8013C71C 00000000 */   nop
    /* 2B28 8013C720 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 2B2C 8013C724 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 2B30 8013C728 00000000 */  nop
    /* 2B34 8013C72C 88004014 */  bnez       $v0, .L8013C950
    /* 2B38 8013C730 00000000 */   nop
    /* 2B3C 8013C734 9291020C */  jal        IsGameLoading__Fv
    /* 2B40 8013C738 00000000 */   nop
    /* 2B44 8013C73C 01004238 */  xori       $v0, $v0, 0x1
    /* 2B48 8013C740 83004010 */  beqz       $v0, .L8013C950
    /* 2B4C 8013C744 00000000 */   nop
    /* 2B50 8013C748 4AED010C */  jal        GetStr__Fi
    /* 2B54 8013C74C 2E030424 */   addiu     $a0, $zero, 0x32E
    /* 2B58 8013C750 21204002 */  addu       $a0, $s2, $zero
    /* 2B5C 8013C754 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 2B60 8013C758 21284000 */   addu      $a1, $v0, $zero
    /* 2B64 8013C75C 2E030424 */  addiu      $a0, $zero, 0x32E
    /* 2B68 8013C760 4AED010C */  jal        GetStr__Fi
    /* 2B6C 8013C764 21804000 */   addu      $s0, $v0, $zero
    /* 2B70 8013C768 21204002 */  addu       $a0, $s2, $zero
    /* 2B74 8013C76C 00010524 */  addiu      $a1, $zero, 0x100
    /* 2B78 8013C770 2328B000 */  subu       $a1, $a1, $s0
    /* 2B7C 8013C774 C21F0500 */  srl        $v1, $a1, 31
    /* 2B80 8013C778 2128A300 */  addu       $a1, $a1, $v1
    /* 2B84 8013C77C 43280500 */  sra        $a1, $a1, 1
    /* 2B88 8013C780 1280033C */  lui        $v1, %hi(WHITER)
    /* 2B8C 8013C784 D1AB6390 */  lbu        $v1, %lo(WHITER)($v1)
    /* 2B90 8013C788 1280063C */  lui        $a2, %hi(WHITEG)
    /* 2B94 8013C78C D2ABC690 */  lbu        $a2, %lo(WHITEG)($a2)
    /* 2B98 8013C790 1280073C */  lui        $a3, %hi(WHITEB)
    /* 2B9C 8013C794 D3ABE790 */  lbu        $a3, %lo(WHITEB)($a3)
    /* 2BA0 8013C798 2000A524 */  addiu      $a1, $a1, 0x20
    /* 2BA4 8013C79C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 2BA8 8013C7A0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 2BAC 8013C7A4 1C00A6AF */  sw         $a2, 0x1C($sp)
    /* 2BB0 8013C7A8 20000624 */  addiu      $a2, $zero, 0x20
    /* 2BB4 8013C7AC 2000A7AF */  sw         $a3, 0x20($sp)
    /* 2BB8 8013C7B0 21384000 */  addu       $a3, $v0, $zero
    /* 2BBC 8013C7B4 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 2BC0 8013C7B8 1800A3AF */   sw        $v1, 0x18($sp)
    /* 2BC4 8013C7BC 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2BC8 8013C7C0 12AB4284 */  lh         $v0, %lo(DavesPad)($v0)
    /* 2BCC 8013C7C4 00000000 */  nop
    /* 2BD0 8013C7C8 04004010 */  beqz       $v0, .L8013C7DC
    /* 2BD4 8013C7CC 00000000 */   nop
    /* 2BD8 8013C7D0 3E10020C */  jal        VID_GetTick__Fv
    /* 2BDC 8013C7D4 00000000 */   nop
    /* 2BE0 8013C7D8 200C82AF */  sw         $v0, %gp_rel(FeCount)($gp)
  .L8013C7DC:
    /* 2BE4 8013C7DC 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2BE8 8013C7E0 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 2BEC 8013C7E4 00000000 */  nop
    /* 2BF0 8013C7E8 10004230 */  andi       $v0, $v0, 0x10
    /* 2BF4 8013C7EC 0A004010 */  beqz       $v0, .L8013C818
    /* 2BF8 8013C7F0 00000000 */   nop
    /* 2BFC 8013C7F4 C6F5000C */  jal        PlaySFX__Fi
    /* 2C00 8013C7F8 33000424 */   addiu     $a0, $zero, 0x33
    /* 2C04 8013C7FC D00B828F */  lw         $v0, %gp_rel(AttractNo)($gp)
    /* 2C08 8013C800 21880000 */  addu       $s1, $zero, $zero
    /* 2C0C 8013C804 BC0B80AF */  sw         $zero, %gp_rel(D_8011B33C)($gp)
    /* 2C10 8013C808 01004224 */  addiu      $v0, $v0, 0x1
  .L8013C80C:
    /* 2C14 8013C80C D00B82AF */  sw         $v0, %gp_rel(AttractNo)($gp)
    /* 2C18 8013C810 54F20408 */  j          .L8013C950
    /* 2C1C 8013C814 00000000 */   nop
  .L8013C818:
    /* 2C20 8013C818 3E10020C */  jal        VID_GetTick__Fv
    /* 2C24 8013C81C 00000000 */   nop
    /* 2C28 8013C820 200C838F */  lw         $v1, %gp_rel(FeCount)($gp)
    /* 2C2C 8013C824 D40B848F */  lw         $a0, %gp_rel(AttractTitleDelay)($gp)
    /* 2C30 8013C828 23104300 */  subu       $v0, $v0, $v1
    /* 2C34 8013C82C 2B208200 */  sltu       $a0, $a0, $v0
    /* 2C38 8013C830 47008010 */  beqz       $a0, .L8013C950
    /* 2C3C 8013C834 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 2C40 8013C838 DC0B82AF */  sw         $v0, %gp_rel(FMVEndPad)($gp)
    /* 2C44 8013C83C 08070224 */  addiu      $v0, $zero, 0x708
    /* 2C48 8013C840 1280013C */  lui        $at, %hi(user_start)
    /* 2C4C 8013C844 E4B420AC */  sw         $zero, %lo(user_start)($at)
    /* 2C50 8013C848 D00B80AF */  sw         $zero, %gp_rel(AttractNo)($gp)
    /* 2C54 8013C84C D40B82AF */  sw         $v0, %gp_rel(AttractTitleDelay)($gp)
    /* 2C58 8013C850 54F20408 */  j          .L8013C950
    /* 2C5C 8013C854 00000000 */   nop
    /* 2C60 8013C858 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2C64 8013C85C CC0B80AF */  sw         $zero, %gp_rel(FeAttractMode)($gp)
    /* 2C68 8013C860 D00B80AF */  sw         $zero, %gp_rel(AttractNo)($gp)
    /* 2C6C 8013C864 DC0B82AF */  sw         $v0, %gp_rel(FMVEndPad)($gp)
    /* 2C70 8013C868 3E10020C */  jal        VID_GetTick__Fv
    /* 2C74 8013C86C 00000000 */   nop
    /* 2C78 8013C870 200C82AF */  sw         $v0, %gp_rel(FeCount)($gp)
    /* 2C7C 8013C874 54F20408 */  j          .L8013C950
    /* 2C80 8013C878 00000000 */   nop
  .L8013C87C:
    /* 2C84 8013C87C 0F004014 */  bnez       $v0, .L8013C8BC
    /* 2C88 8013C880 00000000 */   nop
    /* 2C8C 8013C884 9EE7040C */  jal        FeDrawBuffer__Fv
    /* 2C90 8013C888 00000000 */   nop
    /* 2C94 8013C88C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2C98 8013C890 00000000 */  nop
    /* 2C9C 8013C894 1400428C */  lw         $v0, 0x14($v0)
    /* 2CA0 8013C898 00000000 */  nop
    /* 2CA4 8013C89C 05004014 */  bnez       $v0, .L8013C8B4
    /* 2CA8 8013C8A0 00000000 */   nop
    /* 2CAC 8013C8A4 28EA040C */  jal        FeMainKeyCtrl__FP7CScreen
    /* 2CB0 8013C8A8 21200000 */   addu      $a0, $zero, $zero
    /* 2CB4 8013C8AC 2FF20408 */  j          .L8013C8BC
    /* 2CB8 8013C8B0 00000000 */   nop
  .L8013C8B4:
    /* 2CBC 8013C8B4 09F84000 */  jalr       $v0
    /* 2CC0 8013C8B8 00000000 */   nop
  .L8013C8BC:
    /* 2CC4 8013C8BC 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 2CC8 8013C8C0 0D80023C */  lui        $v0, %hi(FeMainMenu)
    /* 2CCC 8013C8C4 9CD64224 */  addiu      $v0, $v0, %lo(FeMainMenu)
    /* 2CD0 8013C8C8 15006214 */  bne        $v1, $v0, .L8013C920
    /* 2CD4 8013C8CC 00000000 */   nop
    /* 2CD8 8013C8D0 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2CDC 8013C8D4 12AB4284 */  lh         $v0, %lo(DavesPad)($v0)
    /* 2CE0 8013C8D8 00000000 */  nop
    /* 2CE4 8013C8DC 06004010 */  beqz       $v0, .L8013C8F8
    /* 2CE8 8013C8E0 00000000 */   nop
    /* 2CEC 8013C8E4 3E10020C */  jal        VID_GetTick__Fv
    /* 2CF0 8013C8E8 00000000 */   nop
    /* 2CF4 8013C8EC 200C82AF */  sw         $v0, %gp_rel(FeCount)($gp)
    /* 2CF8 8013C8F0 48F20408 */  j          .L8013C920
    /* 2CFC 8013C8F4 00000000 */   nop
  .L8013C8F8:
    /* 2D00 8013C8F8 3E10020C */  jal        VID_GetTick__Fv
    /* 2D04 8013C8FC 00000000 */   nop
    /* 2D08 8013C900 200C838F */  lw         $v1, %gp_rel(FeCount)($gp)
    /* 2D0C 8013C904 D80B848F */  lw         $a0, %gp_rel(AttractMainDelay)($gp)
    /* 2D10 8013C908 23104300 */  subu       $v0, $v0, $v1
    /* 2D14 8013C90C 2B208200 */  sltu       $a0, $a0, $v0
    /* 2D18 8013C910 03008010 */  beqz       $a0, .L8013C920
    /* 2D1C 8013C914 01000224 */   addiu     $v0, $zero, 0x1
    /* 2D20 8013C918 D00B80AF */  sw         $zero, %gp_rel(AttractNo)($gp)
    /* 2D24 8013C91C CC0B82AF */  sw         $v0, %gp_rel(FeAttractMode)($gp)
  .L8013C920:
    /* 2D28 8013C920 BC0B838F */  lw         $v1, %gp_rel(D_8011B33C)($gp)
    /* 2D2C 8013C924 00000000 */  nop
    /* 2D30 8013C928 0F006228 */  slti       $v0, $v1, 0xF
    /* 2D34 8013C92C 04004010 */  beqz       $v0, .L8013C940
    /* 2D38 8013C930 01006224 */   addiu     $v0, $v1, 0x1
    /* 2D3C 8013C934 BC0B82AF */  sw         $v0, %gp_rel(D_8011B33C)($gp)
    /* 2D40 8013C938 54F20408 */  j          .L8013C950
    /* 2D44 8013C93C 21884000 */   addu      $s1, $v0, $zero
  .L8013C940:
    /* 2D48 8013C940 1F00222A */  slti       $v0, $s1, 0x1F
    /* 2D4C 8013C944 02004010 */  beqz       $v0, .L8013C950
    /* 2D50 8013C948 00000000 */   nop
    /* 2D54 8013C94C 01003126 */  addiu      $s1, $s1, 0x1
  .L8013C950:
    /* 2D58 8013C950 EE80000C */  jal        TSK_Sleep
    /* 2D5C 8013C954 01000424 */   addiu     $a0, $zero, 0x1
    /* 2D60 8013C958 F40B8393 */  lbu        $v1, %gp_rel(FeFlag)($gp)
    /* 2D64 8013C95C 02000224 */  addiu      $v0, $zero, 0x2
    /* 2D68 8013C960 23FF6214 */  bne        $v1, $v0, .L8013C5F0
    /* 2D6C 8013C964 00000000 */   nop
  .L8013C968:
    /* 2D70 8013C968 85F0040C */  jal        FadeFEOut__Fv
    /* 2D74 8013C96C 00000000 */   nop
    /* 2D78 8013C970 C80B80AF */  sw         $zero, %gp_rel(D_8011B348)($gp)
    /* 2D7C 8013C974 EE80000C */  jal        TSK_Sleep
    /* 2D80 8013C978 01000424 */   addiu     $a0, $zero, 0x1
    /* 2D84 8013C97C 1280023C */  lui        $v0, %hi(PlayDemoFlag)
    /* 2D88 8013C980 81AC4290 */  lbu        $v0, %lo(PlayDemoFlag)($v0)
    /* 2D8C 8013C984 F40B80A3 */  sb         $zero, %gp_rel(FeFlag)($gp)
    /* 2D90 8013C988 03004014 */  bnez       $v0, .L8013C998
    /* 2D94 8013C98C 01000224 */   addiu     $v0, $zero, 0x1
    /* 2D98 8013C990 D00B82AF */  sw         $v0, %gp_rel(AttractNo)($gp)
    /* 2D9C 8013C994 CC0B80AF */  sw         $zero, %gp_rel(FeAttractMode)($gp)
  .L8013C998:
    /* 2DA0 8013C998 3800BF8F */  lw         $ra, 0x38($sp)
    /* 2DA4 8013C99C 3400B38F */  lw         $s3, 0x34($sp)
    /* 2DA8 8013C9A0 3000B28F */  lw         $s2, 0x30($sp)
    /* 2DAC 8013C9A4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 2DB0 8013C9A8 2800B08F */  lw         $s0, 0x28($sp)
    /* 2DB4 8013C9AC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 2DB8 8013C9B0 0800E003 */  jr         $ra
    /* 2DBC 8013C9B4 00000000 */   nop
endlabel FrontEndTask__FP4TASK
