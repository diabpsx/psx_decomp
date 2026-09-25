.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateStoryBook__Fii, 0xF4

glabel OperateStoryBook__Fii
    /* 4D7B8 8005D7B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4D7BC 8005D7BC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4D7C0 8005D7C0 2188A000 */  addu       $s1, $a1, $zero
    /* 4D7C4 8005D7C4 40101100 */  sll        $v0, $s1, 1
    /* 4D7C8 8005D7C8 21105100 */  addu       $v0, $v0, $s1
    /* 4D7CC 8005D7CC 80100200 */  sll        $v0, $v0, 2
    /* 4D7D0 8005D7D0 23105100 */  subu       $v0, $v0, $s1
    /* 4D7D4 8005D7D4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4D7D8 8005D7D8 80800200 */  sll        $s0, $v0, 2
    /* 4D7DC 8005D7DC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4D7E0 8005D7E0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D7E4 8005D7E4 21083000 */  addu       $at, $at, $s0
    /* 4D7E8 8005D7E8 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4D7EC 8005D7EC 00000000 */  nop
    /* 4D7F0 8005D7F0 28004010 */  beqz       $v0, .L8005D894
    /* 4D7F4 8005D7F4 00000000 */   nop
    /* 4D7F8 8005D7F8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4D7FC 8005D7FC 21083000 */  addu       $at, $at, $s0
    /* 4D800 8005D800 608C2294 */  lhu        $v0, %lo(object + 0x14)($at)
    /* 4D804 8005D804 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4D808 8005D808 21083000 */  addu       $at, $at, $s0
    /* 4D80C 8005D80C 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4D810 8005D810 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D814 8005D814 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D818 8005D818 00000000 */  nop
    /* 4D81C 8005D81C 1D004014 */  bnez       $v0, .L8005D894
    /* 4D820 8005D820 01000224 */   addiu     $v0, $zero, 0x1
    /* 4D824 8005D824 1280033C */  lui        $v1, %hi(qtextflag)
    /* 4D828 8005D828 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 4D82C 8005D82C 1280013C */  lui        $at, %hi(PauseMode)
    /* 4D830 8005D830 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 4D834 8005D834 17006014 */  bnez       $v1, .L8005D894
    /* 4D838 8005D838 00000000 */   nop
    /* 4D83C 8005D83C 1280023C */  lui        $v0, %hi(myplr)
    /* 4D840 8005D840 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4D844 8005D844 00000000 */  nop
    /* 4D848 8005D848 12008214 */  bne        $a0, $v0, .L8005D894
    /* 4D84C 8005D84C 00000000 */   nop
    /* 4D850 8005D850 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D854 8005D854 21083000 */  addu       $at, $at, $s0
    /* 4D858 8005D858 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4D85C 8005D85C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D860 8005D860 21083000 */  addu       $at, $at, $s0
    /* 4D864 8005D864 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4D868 8005D868 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4D86C 8005D86C 26000424 */   addiu     $a0, $zero, 0x26
    /* 4D870 8005D870 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4D874 8005D874 21083000 */  addu       $at, $at, $s0
    /* 4D878 8005D878 5C8C2484 */  lh         $a0, %lo(object + 0x10)($at)
    /* 4D87C 8005D87C 1E37010C */  jal        InitQTextMsg__Fi
    /* 4D880 8005D880 00000000 */   nop
    /* 4D884 8005D884 21200000 */  addu       $a0, $zero, $zero
    /* 4D888 8005D888 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4D88C 8005D88C 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4D890 8005D890 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L8005D894:
    /* 4D894 8005D894 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4D898 8005D898 1400B18F */  lw         $s1, 0x14($sp)
    /* 4D89C 8005D89C 1000B08F */  lw         $s0, 0x10($sp)
    /* 4D8A0 8005D8A0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4D8A4 8005D8A4 0800E003 */  jr         $ra
    /* 4D8A8 8005D8A8 00000000 */   nop
endlabel OperateStoryBook__Fii
