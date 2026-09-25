.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAD_Handler__Fv, 0x1FC

glabel PAD_Handler__Fv
    /* 795F8 800895F8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 795FC 800895FC 2400BFAF */  sw         $ra, 0x24($sp)
    /* 79600 80089600 2000B4AF */  sw         $s4, 0x20($sp)
    /* 79604 80089604 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 79608 80089608 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7960C 8008960C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 79610 80089610 9291020C */  jal        IsGameLoading__Fv
    /* 79614 80089614 1000B0AF */   sw        $s0, 0x10($sp)
    /* 79618 80089618 C16E020C */  jal        GLUE_Finished__Fv
    /* 7961C 8008961C 21804000 */   addu      $s0, $v0, $zero
    /* 79620 80089620 3825020C */  jal        ReadPadStream__Fv
    /* 79624 80089624 25800202 */   or        $s0, $s0, $v0
    /* 79628 80089628 21A04000 */  addu       $s4, $v0, $zero
    /* 7962C 8008962C FF000232 */  andi       $v0, $s0, 0xFF
    /* 79630 80089630 04004010 */  beqz       $v0, .L80089644
    /* 79634 80089634 00000000 */   nop
    /* 79638 80089638 440480AF */  sw         $zero, %gp_rel(cac_pad)($gp)
    /* 7963C 8008963C 92250208 */  j          .L80089648
    /* 79640 80089640 00000000 */   nop
  .L80089644:
    /* 79644 80089644 440494AF */  sw         $s4, %gp_rel(cac_pad)($gp)
  .L80089648:
    /* 79648 80089648 1280023C */  lui        $v0, %hi(demo_record_load)
    /* 7964C 8008964C 40AE428C */  lw         $v0, %lo(demo_record_load)($v0)
    /* 79650 80089650 01001124 */  addiu      $s1, $zero, 0x1
    /* 79654 80089654 21005114 */  bne        $v0, $s1, .L800896DC
    /* 79658 80089658 FF000232 */   andi      $v0, $s0, 0xFF
    /* 7965C 8008965C 48004014 */  bnez       $v0, .L80089780
    /* 79660 80089660 00000000 */   nop
    /* 79664 80089664 3404828F */  lw         $v0, %gp_rel(demo_pad_time)($gp)
    /* 79668 80089668 00000000 */  nop
    /* 7966C 8008966C 44004010 */  beqz       $v0, .L80089780
    /* 79670 80089670 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 79674 80089674 F0008332 */  andi       $v1, $s4, 0xF0
    /* 79678 80089678 3804848F */  lw         $a0, %gp_rel(demo_pad_count)($gp)
    /* 7967C 8008967C 02190300 */  srl        $v1, $v1, 4
    /* 79680 80089680 340482AF */  sw         $v0, %gp_rel(demo_pad_time)($gp)
    /* 79684 80089684 01008224 */  addiu      $v0, $a0, 0x1
    /* 79688 80089688 380482AF */  sw         $v0, %gp_rel(demo_pad_count)($gp)
    /* 7968C 8008968C 00F08232 */  andi       $v0, $s4, 0xF000
    /* 79690 80089690 02120200 */  srl        $v0, $v0, 8
    /* 79694 80089694 25186200 */  or         $v1, $v1, $v0
    /* 79698 80089698 0B80013C */  lui        $at, %hi(demo_buffer)
    /* 7969C 8008969C 21082400 */  addu       $at, $at, $a0
    /* 796A0 800896A0 547F23A0 */  sb         $v1, %lo(demo_buffer)($at)
    /* 796A4 800896A4 3404828F */  lw         $v0, %gp_rel(demo_pad_time)($gp)
    /* 796A8 800896A8 00000000 */  nop
    /* 796AC 800896AC 34004014 */  bnez       $v0, .L80089780
    /* 796B0 800896B0 00000000 */   nop
    /* 796B4 800896B4 1280043C */  lui        $a0, %hi(demo_level)
    /* 796B8 800896B8 88AE848C */  lw         $a0, %lo(demo_level)($a0)
    /* 796BC 800896BC 346E020C */  jal        save_demo_pad_data__FUl
    /* 796C0 800896C0 00000000 */   nop
    /* 796C4 800896C4 1180043C */  lui        $a0, %hi(D_80110490)
    /* 796C8 800896C8 90048424 */  addiu      $a0, $a0, %lo(D_80110490)
    /* 796CC 800896CC 9367000C */  jal        printf
    /* 796D0 800896D0 00000000 */   nop
    /* 796D4 800896D4 E0250208 */  j          .L80089780
    /* 796D8 800896D8 00000000 */   nop
  .L800896DC:
    /* 796DC 800896DC 28004014 */  bnez       $v0, .L80089780
    /* 796E0 800896E0 00000000 */   nop
    /* 796E4 800896E4 3404828F */  lw         $v0, %gp_rel(demo_pad_time)($gp)
    /* 796E8 800896E8 00000000 */  nop
    /* 796EC 800896EC 24004010 */  beqz       $v0, .L80089780
    /* 796F0 800896F0 00000000 */   nop
    /* 796F4 800896F4 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 796F8 800896F8 21200000 */   addu      $a0, $zero, $zero
    /* 796FC 800896FC FFFF043C */  lui        $a0, (0xFFFF0F0F >> 16)
    /* 79700 80089700 0F0F8434 */  ori        $a0, $a0, (0xFFFF0F0F & 0xFFFF)
    /* 79704 80089704 3404858F */  lw         $a1, %gp_rel(demo_pad_time)($gp)
    /* 79708 80089708 3804838F */  lw         $v1, %gp_rel(demo_pad_count)($gp)
    /* 7970C 8008970C FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 79710 80089710 01006224 */  addiu      $v0, $v1, 0x1
    /* 79714 80089714 340485AF */  sw         $a1, %gp_rel(demo_pad_time)($gp)
    /* 79718 80089718 380482AF */  sw         $v0, %gp_rel(demo_pad_count)($gp)
    /* 7971C 8008971C 0B80013C */  lui        $at, %hi(demo_buffer)
    /* 79720 80089720 21082300 */  addu       $at, $at, $v1
    /* 79724 80089724 547F2390 */  lbu        $v1, %lo(demo_buffer)($at)
    /* 79728 80089728 24208402 */  and        $a0, $s4, $a0
    /* 7972C 8008972C F0006230 */  andi       $v0, $v1, 0xF0
    /* 79730 80089730 00120200 */  sll        $v0, $v0, 8
    /* 79734 80089734 25208200 */  or         $a0, $a0, $v0
    /* 79738 80089738 0F006330 */  andi       $v1, $v1, 0xF
    /* 7973C 8008973C 00190300 */  sll        $v1, $v1, 4
    /* 79740 80089740 0500A010 */  beqz       $a1, .L80089758
    /* 79744 80089744 25A08300 */   or        $s4, $a0, $v1
    /* 79748 80089748 4404828F */  lw         $v0, %gp_rel(cac_pad)($gp)
    /* 7974C 8008974C 00000000 */  nop
    /* 79750 80089750 0B004010 */  beqz       $v0, .L80089780
    /* 79754 80089754 00000000 */   nop
  .L80089758:
    /* 79758 80089758 4404838F */  lw         $v1, %gp_rel(cac_pad)($gp)
    /* 7975C 8008975C 3C0491AF */  sw         $s1, %gp_rel(demo_finish)($gp)
    /* 79760 80089760 07006010 */  beqz       $v1, .L80089780
    /* 79764 80089764 02000224 */   addiu     $v0, $zero, 0x2
    /* 79768 80089768 3C0482AF */  sw         $v0, %gp_rel(demo_finish)($gp)
    /* 7976C 8008976C 00086230 */  andi       $v0, $v1, 0x800
    /* 79770 80089770 03004010 */  beqz       $v0, .L80089780
    /* 79774 80089774 00000000 */   nop
    /* 79778 80089778 1280013C */  lui        $at, %hi(user_start)
    /* 7977C 8008977C E4B431AC */  sw         $s1, %lo(user_start)($at)
  .L80089780:
    /* 79780 80089780 0B80133C */  lui        $s3, %hi(Pad0)
    /* 79784 80089784 347D7326 */  addiu      $s3, $s3, %lo(Pad0)
    /* 79788 80089788 21206002 */  addu       $a0, $s3, $zero
    /* 7978C 8008978C FFFF9132 */  andi       $s1, $s4, 0xFFFF
    /* 79790 80089790 2926020C */  jal        NewVal__4CPadUs
    /* 79794 80089794 21282002 */   addu      $a1, $s1, $zero
    /* 79798 80089798 0B80123C */  lui        $s2, %hi(Pad1)
    /* 7979C 8008979C 207E5226 */  addiu      $s2, $s2, %lo(Pad1)
    /* 797A0 800897A0 21204002 */  addu       $a0, $s2, $zero
    /* 797A4 800897A4 02841400 */  srl        $s0, $s4, 16
    /* 797A8 800897A8 2926020C */  jal        NewVal__4CPadUs
    /* 797AC 800897AC 21280002 */   addu      $a1, $s0, $zero
    /* 797B0 800897B0 21206002 */  addu       $a0, $s3, $zero
    /* 797B4 800897B4 21282002 */  addu       $a1, $s1, $zero
    /* 797B8 800897B8 4626020C */  jal        BothNewVal__4CPadUsUs
    /* 797BC 800897BC 21300002 */   addu      $a2, $s0, $zero
    /* 797C0 800897C0 21204002 */  addu       $a0, $s2, $zero
    /* 797C4 800897C4 21282002 */  addu       $a1, $s1, $zero
    /* 797C8 800897C8 4626020C */  jal        BothNewVal__4CPadUsUs
    /* 797CC 800897CC 21300002 */   addu      $a2, $s0, $zero
    /* 797D0 800897D0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 797D4 800897D4 2000B48F */  lw         $s4, 0x20($sp)
    /* 797D8 800897D8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 797DC 800897DC 1800B28F */  lw         $s2, 0x18($sp)
    /* 797E0 800897E0 1400B18F */  lw         $s1, 0x14($sp)
    /* 797E4 800897E4 1000B08F */  lw         $s0, 0x10($sp)
    /* 797E8 800897E8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 797EC 800897EC 0800E003 */  jr         $ra
    /* 797F0 800897F0 00000000 */   nop
endlabel PAD_Handler__Fv
