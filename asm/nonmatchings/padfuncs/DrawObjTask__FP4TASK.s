.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawObjTask__FP4TASK, 0x33C

glabel DrawObjTask__FP4TASK
    /* 93378 800A3378 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 9337C 800A337C 02000624 */  addiu      $a2, $zero, 0x2
    /* 93380 800A3380 0E80033C */  lui        $v1, %hi(plr)
    /* 93384 800A3384 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 93388 800A3388 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 9338C 800A338C 4800BEAF */  sw         $fp, 0x48($sp)
    /* 93390 800A3390 4400B7AF */  sw         $s7, 0x44($sp)
    /* 93394 800A3394 4000B6AF */  sw         $s6, 0x40($sp)
    /* 93398 800A3398 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 9339C 800A339C 3800B4AF */  sw         $s4, 0x38($sp)
    /* 933A0 800A33A0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 933A4 800A33A4 3000B2AF */  sw         $s2, 0x30($sp)
    /* 933A8 800A33A8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 933AC 800A33AC 2800B0AF */  sw         $s0, 0x28($sp)
    /* 933B0 800A33B0 1C00828C */  lw         $v0, 0x1C($a0)
    /* 933B4 800A33B4 1280133C */  lui        $s3, %hi(sel_data)
    /* 933B8 800A33B8 2CB7738E */  lw         $s3, %lo(sel_data)($s3)
    /* 933BC 800A33BC 1280143C */  lui        $s4, %hi(myplr)
    /* 933C0 800A33C0 08BA948E */  lw         $s4, %lo(myplr)($s4)
    /* 933C4 800A33C4 0000528C */  lw         $s2, 0x0($v0)
    /* 933C8 800A33C8 1280173C */  lui        $s7, %hi(PauseMode)
    /* 933CC 800A33CC A4B7F792 */  lbu        $s7, %lo(PauseMode)($s7)
    /* 933D0 800A33D0 40101200 */  sll        $v0, $s2, 1
    /* 933D4 800A33D4 21105200 */  addu       $v0, $v0, $s2
    /* 933D8 800A33D8 80100200 */  sll        $v0, $v0, 2
    /* 933DC 800A33DC 21105200 */  addu       $v0, $v0, $s2
    /* 933E0 800A33E0 00110200 */  sll        $v0, $v0, 4
    /* 933E4 800A33E4 23105200 */  subu       $v0, $v0, $s2
    /* 933E8 800A33E8 80100200 */  sll        $v0, $v0, 2
    /* 933EC 800A33EC 21105200 */  addu       $v0, $v0, $s2
    /* 933F0 800A33F0 C0100200 */  sll        $v0, $v0, 3
    /* 933F4 800A33F4 21A84300 */  addu       $s5, $v0, $v1
    /* 933F8 800A33F8 3000A486 */  lh         $a0, 0x30($s5)
    /* 933FC 800A33FC 3200A586 */  lh         $a1, 0x32($s5)
    /* 93400 800A3400 1280023C */  lui        $v0, %hi(automapflag)
    /* 93404 800A3404 7BC34290 */  lbu        $v0, %lo(automapflag)($v0)
    /* 93408 800A3408 01000724 */  addiu      $a3, $zero, 0x1
    /* 9340C 800A340C 1280013C */  lui        $at, %hi(sel_data)
    /* 93410 800A3410 2CB732AC */  sw         $s2, %lo(sel_data)($at)
    /* 93414 800A3414 1280013C */  lui        $at, %hi(myplr)
    /* 93418 800A3418 08BA32AC */  sw         $s2, %lo(myplr)($at)
    /* 9341C 800A341C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 93420 800A3420 A78E020C */  jal        CheckArea__FiiiUci
    /* 93424 800A3424 2BF00200 */   sltu      $fp, $zero, $v0
    /* 93428 800A3428 978A020C */  jal        sort_gold__Fi
    /* 9342C 800A342C 21204002 */   addu      $a0, $s2, $zero
    /* 93430 800A3430 07004010 */  beqz       $v0, .L800A3450
    /* 93434 800A3434 00000000 */   nop
    /* 93438 800A3438 1280013C */  lui        $at, %hi(sel_data)
    /* 9343C 800A343C 2CB733AC */  sw         $s3, %lo(sel_data)($at)
    /* 93440 800A3440 1280013C */  lui        $at, %hi(myplr)
    /* 93444 800A3444 08BA34AC */  sw         $s4, %lo(myplr)($at)
    /* 93448 800A3448 A08D0208 */  j          .L800A3680
    /* 9344C 800A344C 00000000 */   nop
  .L800A3450:
    /* 93450 800A3450 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 93454 800A3454 00000000 */   nop
    /* 93458 800A3458 01000224 */  addiu      $v0, $zero, 0x1
    /* 9345C 800A345C 9D0982A3 */  sb         $v0, %gp_rel(select_flag)($gp)
    /* 93460 800A3460 681F80A3 */  sb         $zero, %gp_rel(D_8011C6E8)($gp)
    /* 93464 800A3464 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 93468 800A3468 21200000 */   addu      $a0, $zero, $zero
    /* 9346C 800A346C 21B04000 */  addu       $s6, $v0, $zero
    /* 93470 800A3470 1280013C */  lui        $at, %hi(_pfind_index)
    /* 93474 800A3474 21083200 */  addu       $at, $at, $s2
    /* 93478 800A3478 DCBB2380 */  lb         $v1, %lo(_pfind_index)($at)
    /* 9347C 800A347C 01000224 */  addiu      $v0, $zero, 0x1
    /* 93480 800A3480 2F006214 */  bne        $v1, $v0, .L800A3540
    /* 93484 800A3484 00191200 */   sll       $v1, $s2, 4
    /* 93488 800A3488 23187200 */  subu       $v1, $v1, $s2
    /* 9348C 800A348C 40180300 */  sll        $v1, $v1, 1
    /* 93490 800A3490 1280043C */  lui        $a0, %hi(sel_data)
    /* 93494 800A3494 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 93498 800A3498 0E80013C */  lui        $at, %hi(_pfind_list)
    /* 9349C 800A349C 21082300 */  addu       $at, $at, $v1
    /* 934A0 800A34A0 A8382290 */  lbu        $v0, %lo(_pfind_list)($at)
    /* 934A4 800A34A4 1280013C */  lui        $at, %hi(_pcursitem)
    /* 934A8 800A34A8 21082400 */  addu       $at, $at, $a0
    /* 934AC 800A34AC 64B722A0 */  sb         $v0, %lo(_pcursitem)($at)
    /* 934B0 800A34B0 2120A002 */  addu       $a0, $s5, $zero
    /* 934B4 800A34B4 1280023C */  lui        $v0, %hi(sel_data)
    /* 934B8 800A34B8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 934BC 800A34BC 0E80013C */  lui        $at, %hi(_pfind_list + 0x1)
    /* 934C0 800A34C0 21082300 */  addu       $at, $at, $v1
    /* 934C4 800A34C4 A9383080 */  lb         $s0, %lo(_pfind_list + 0x1)($at)
    /* 934C8 800A34C8 1280013C */  lui        $at, %hi(_pcursitem)
    /* 934CC 800A34CC 21082200 */  addu       $at, $at, $v0
    /* 934D0 800A34D0 64B72280 */  lb         $v0, %lo(_pcursitem)($at)
    /* 934D4 800A34D4 0E80013C */  lui        $at, %hi(_pfind_list + 0x2)
    /* 934D8 800A34D8 21082300 */  addu       $at, $at, $v1
    /* 934DC 800A34DC AA383180 */  lb         $s1, %lo(_pfind_list + 0x2)($at)
    /* 934E0 800A34E0 C0280200 */  sll        $a1, $v0, 3
    /* 934E4 800A34E4 2328A200 */  subu       $a1, $a1, $v0
    /* 934E8 800A34E8 80280500 */  sll        $a1, $a1, 2
    /* 934EC 800A34EC 2328A200 */  subu       $a1, $a1, $v0
    /* 934F0 800A34F0 80280500 */  sll        $a1, $a1, 2
    /* 934F4 800A34F4 0D80023C */  lui        $v0, %hi(item)
    /* 934F8 800A34F8 541D4224 */  addiu      $v0, $v0, %lo(item)
    /* 934FC 800A34FC CAFD000C */  jal        SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 93500 800A3500 2128A200 */   addu      $a1, $a1, $v0
    /* 93504 800A3504 01000424 */  addiu      $a0, $zero, 0x1
    /* 93508 800A3508 2A000524 */  addiu      $a1, $zero, 0x2A
    /* 9350C 800A350C 1280023C */  lui        $v0, %hi(sel_data)
    /* 93510 800A3510 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93514 800A3514 FF000632 */  andi       $a2, $s0, 0xFF
    /* 93518 800A3518 1280013C */  lui        $at, %hi(_pcursitem)
    /* 9351C 800A351C 21082200 */  addu       $at, $at, $v0
    /* 93520 800A3520 64B72290 */  lbu        $v0, %lo(_pcursitem)($at)
    /* 93524 800A3524 FF002732 */  andi       $a3, $s1, 0xFF
    /* 93528 800A3528 00160200 */  sll        $v0, $v0, 24
    /* 9352C 800A352C 03160200 */  sra        $v0, $v0, 24
    /* 93530 800A3530 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 93534 800A3534 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 93538 800A3538 1000A2AF */   sw        $v0, 0x10($sp)
    /* 9353C 800A353C 9D0980A3 */  sb         $zero, %gp_rel(select_flag)($gp)
  .L800A3540:
    /* 93540 800A3540 9D098293 */  lbu        $v0, %gp_rel(select_flag)($gp)
    /* 93544 800A3544 1280103C */  lui        $s0, %hi(DoShowPanel)
    /* 93548 800A3548 00B0108E */  lw         $s0, %lo(DoShowPanel)($s0)
    /* 9354C 800A354C 1280013C */  lui        $at, %hi(sel_data)
    /* 93550 800A3550 2CB733AC */  sw         $s3, %lo(sel_data)($at)
    /* 93554 800A3554 1280013C */  lui        $at, %hi(myplr)
    /* 93558 800A3558 08BA34AC */  sw         $s4, %lo(myplr)($at)
    /* 9355C 800A355C 34004010 */  beqz       $v0, .L800A3630
    /* 93560 800A3560 00000000 */   nop
  .L800A3564:
    /* 93564 800A3564 C16E020C */  jal        GLUE_Finished__Fv
    /* 93568 800A3568 00000000 */   nop
    /* 9356C 800A356C 01004238 */  xori       $v0, $v0, 0x1
    /* 93570 800A3570 2F004010 */  beqz       $v0, .L800A3630
    /* 93574 800A3574 00000000 */   nop
    /* 93578 800A3578 1280013C */  lui        $at, %hi(automapflag)
    /* 9357C 800A357C 7BC320A0 */  sb         $zero, %lo(automapflag)($at)
    /* 93580 800A3580 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 93584 800A3584 21200000 */   addu      $a0, $zero, $zero
    /* 93588 800A3588 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 9358C 800A358C 00000000 */   nop
    /* 93590 800A3590 1280143C */  lui        $s4, %hi(myplr)
    /* 93594 800A3594 08BA948E */  lw         $s4, %lo(myplr)($s4)
    /* 93598 800A3598 1280133C */  lui        $s3, %hi(sel_data)
    /* 9359C 800A359C 2CB7738E */  lw         $s3, %lo(sel_data)($s3)
    /* 935A0 800A35A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 935A4 800A35A4 1280013C */  lui        $at, %hi(PauseMode)
    /* 935A8 800A35A8 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 935AC 800A35AC EE80000C */  jal        TSK_Sleep
    /* 935B0 800A35B0 01000424 */   addiu     $a0, $zero, 0x1
    /* 935B4 800A35B4 02000424 */  addiu      $a0, $zero, 0x2
    /* 935B8 800A35B8 21280000 */  addu       $a1, $zero, $zero
    /* 935BC 800A35BC 21300000 */  addu       $a2, $zero, $zero
    /* 935C0 800A35C0 53EB010C */  jal        PostGamePad__Fiiii
    /* 935C4 800A35C4 21380000 */   addu      $a3, $zero, $zero
    /* 935C8 800A35C8 21204002 */  addu       $a0, $s2, $zero
    /* 935CC 800A35CC 1280013C */  lui        $at, %hi(sel_data)
    /* 935D0 800A35D0 2CB732AC */  sw         $s2, %lo(sel_data)($at)
    /* 935D4 800A35D4 1280013C */  lui        $at, %hi(myplr)
    /* 935D8 800A35D8 08BA32AC */  sw         $s2, %lo(myplr)($at)
    /* 935DC 800A35DC D98A020C */  jal        DrawObjSelector__FiP12PlayerStruct
    /* 935E0 800A35E0 2128A002 */   addu      $a1, $s5, $zero
    /* 935E4 800A35E4 E4DF010C */  jal        ClrCursor__Fi
    /* 935E8 800A35E8 21200000 */   addu      $a0, $zero, $zero
    /* 935EC 800A35EC E4DF010C */  jal        ClrCursor__Fi
    /* 935F0 800A35F0 01000424 */   addiu     $a0, $zero, 0x1
    /* 935F4 800A35F4 C8C7000C */  jal        ClearPanel__Fv
    /* 935F8 800A35F8 00000000 */   nop
    /* 935FC 800A35FC FF000224 */  addiu      $v0, $zero, 0xFF
    /* 93600 800A3600 1280013C */  lui        $at, %hi(force_redraw)
    /* 93604 800A3604 90B722AC */  sw         $v0, %lo(force_redraw)($at)
    /* 93608 800A3608 1280013C */  lui        $at, %hi(sel_data)
    /* 9360C 800A360C 2CB733AC */  sw         $s3, %lo(sel_data)($at)
    /* 93610 800A3610 1280013C */  lui        $at, %hi(myplr)
    /* 93614 800A3614 08BA34AC */  sw         $s4, %lo(myplr)($at)
    /* 93618 800A3618 34A5010C */  jal        DrawAndBlit__Fv
    /* 9361C 800A361C 00000000 */   nop
    /* 93620 800A3620 9D098293 */  lbu        $v0, %gp_rel(select_flag)($gp)
    /* 93624 800A3624 00000000 */  nop
    /* 93628 800A3628 CEFF4014 */  bnez       $v0, .L800A3564
    /* 9362C 800A362C 00000000 */   nop
  .L800A3630:
    /* 93630 800A3630 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 93634 800A3634 21200002 */   addu      $a0, $s0, $zero
    /* 93638 800A3638 05000424 */  addiu      $a0, $zero, 0x5
    /* 9363C 800A363C 21280000 */  addu       $a1, $zero, $zero
    /* 93640 800A3640 21300000 */  addu       $a2, $zero, $zero
    /* 93644 800A3644 53EB010C */  jal        PostGamePad__Fiiii
    /* 93648 800A3648 21380000 */   addu      $a3, $zero, $zero
    /* 9364C 800A364C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 93650 800A3650 1280013C */  lui        $at, %hi(PauseMode)
    /* 93654 800A3654 A4B737A0 */  sb         $s7, %lo(PauseMode)($at)
    /* 93658 800A3658 1280013C */  lui        $at, %hi(options_pad)
    /* 9365C 800A365C 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 93660 800A3660 1280013C */  lui        $at, %hi(sel_data)
    /* 93664 800A3664 2CB722AC */  sw         $v0, %lo(sel_data)($at)
    /* 93668 800A3668 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 9366C 800A366C 2120C002 */   addu      $a0, $s6, $zero
    /* 93670 800A3670 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 93674 800A3674 00000000 */   nop
    /* 93678 800A3678 1280013C */  lui        $at, %hi(automapflag)
    /* 9367C 800A367C 7BC33EA0 */  sb         $fp, %lo(automapflag)($at)
  .L800A3680:
    /* 93680 800A3680 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 93684 800A3684 4800BE8F */  lw         $fp, 0x48($sp)
    /* 93688 800A3688 4400B78F */  lw         $s7, 0x44($sp)
    /* 9368C 800A368C 4000B68F */  lw         $s6, 0x40($sp)
    /* 93690 800A3690 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 93694 800A3694 3800B48F */  lw         $s4, 0x38($sp)
    /* 93698 800A3698 3400B38F */  lw         $s3, 0x34($sp)
    /* 9369C 800A369C 3000B28F */  lw         $s2, 0x30($sp)
    /* 936A0 800A36A0 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 936A4 800A36A4 2800B08F */  lw         $s0, 0x28($sp)
    /* 936A8 800A36A8 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 936AC 800A36AC 0800E003 */  jr         $ra
    /* 936B0 800A36B0 00000000 */   nop
endlabel DrawObjTask__FP4TASK
