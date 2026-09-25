.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartSSell__Fv, 0x438

glabel S_StartSSell__Fv
    /* 5B70C 8006B70C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 5B710 8006B710 2800B2AF */  sw         $s2, 0x28($sp)
    /* 5B714 8006B714 21900000 */  addu       $s2, $zero, $zero
    /* 5B718 8006B718 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 5B71C 8006B71C D4130324 */  addiu      $v1, $zero, 0x13D4
    /* 5B720 8006B720 02000224 */  addiu      $v0, $zero, 0x2
    /* 5B724 8006B724 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5B728 8006B728 01000224 */  addiu      $v0, $zero, 0x1
    /* 5B72C 8006B72C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 5B730 8006B730 3000B4AF */  sw         $s4, 0x30($sp)
    /* 5B734 8006B734 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 5B738 8006B738 2400B1AF */  sw         $s1, 0x24($sp)
    /* 5B73C 8006B73C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 5B740 8006B740 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5B744 8006B744 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
  .L8006B748:
    /* 5B748 8006B748 0E80013C */  lui        $at, %hi(storehold + 0x2C)
    /* 5B74C 8006B74C 21082300 */  addu       $at, $at, $v1
    /* 5B750 8006B750 B41D24A4 */  sh         $a0, %lo(storehold + 0x2C)($at)
    /* 5B754 8006B754 94FF6324 */  addiu      $v1, $v1, -0x6C
    /* 5B758 8006B758 FBFF6104 */  bgez       $v1, .L8006B748
    /* 5B75C 8006B75C 00000000 */   nop
    /* 5B760 8006B760 1280023C */  lui        $v0, %hi(myplr)
    /* 5B764 8006B764 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5B768 8006B768 00000000 */  nop
    /* 5B76C 8006B76C 40180200 */  sll        $v1, $v0, 1
    /* 5B770 8006B770 21186200 */  addu       $v1, $v1, $v0
    /* 5B774 8006B774 80180300 */  sll        $v1, $v1, 2
    /* 5B778 8006B778 21186200 */  addu       $v1, $v1, $v0
    /* 5B77C 8006B77C 00190300 */  sll        $v1, $v1, 4
    /* 5B780 8006B780 23186200 */  subu       $v1, $v1, $v0
    /* 5B784 8006B784 80180300 */  sll        $v1, $v1, 2
    /* 5B788 8006B788 21186200 */  addu       $v1, $v1, $v0
    /* 5B78C 8006B78C C0180300 */  sll        $v1, $v1, 3
    /* 5B790 8006B790 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5B794 8006B794 21082300 */  addu       $at, $at, $v1
    /* 5B798 8006B798 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5B79C 8006B79C 00000000 */  nop
    /* 5B7A0 8006B7A0 86004018 */  blez       $v0, .L8006B9BC
    /* 5B7A4 8006B7A4 21800000 */   addu      $s0, $zero, $zero
    /* 5B7A8 8006B7A8 0E80143C */  lui        $s4, %hi(storehold)
    /* 5B7AC 8006B7AC 881D9426 */  addiu      $s4, $s4, %lo(storehold)
    /* 5B7B0 8006B7B0 0E80133C */  lui        $s3, %hi(plr + 0x4A4)
    /* 5B7B4 8006B7B4 DCA97326 */  addiu      $s3, $s3, %lo(plr + 0x4A4)
    /* 5B7B8 8006B7B8 21880000 */  addu       $s1, $zero, $zero
  .L8006B7BC:
    /* 5B7BC 8006B7BC F4AC010C */  jal        SmithSellOk__Fi
    /* 5B7C0 8006B7C0 21200002 */   addu      $a0, $s0, $zero
    /* 5B7C4 8006B7C4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5B7C8 8006B7C8 69004010 */  beqz       $v0, .L8006B970
    /* 5B7CC 8006B7CC 00000000 */   nop
    /* 5B7D0 8006B7D0 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5B7D4 8006B7D4 01001224 */  addiu      $s2, $zero, 0x1
    /* 5B7D8 8006B7D8 C0100300 */  sll        $v0, $v1, 3
    /* 5B7DC 8006B7DC 23104300 */  subu       $v0, $v0, $v1
    /* 5B7E0 8006B7E0 80100200 */  sll        $v0, $v0, 2
    /* 5B7E4 8006B7E4 23104300 */  subu       $v0, $v0, $v1
    /* 5B7E8 8006B7E8 80100200 */  sll        $v0, $v0, 2
    /* 5B7EC 8006B7EC 1280033C */  lui        $v1, %hi(myplr)
    /* 5B7F0 8006B7F0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5B7F4 8006B7F4 21385400 */  addu       $a3, $v0, $s4
    /* 5B7F8 8006B7F8 40100300 */  sll        $v0, $v1, 1
    /* 5B7FC 8006B7FC 21104300 */  addu       $v0, $v0, $v1
    /* 5B800 8006B800 80100200 */  sll        $v0, $v0, 2
    /* 5B804 8006B804 21104300 */  addu       $v0, $v0, $v1
    /* 5B808 8006B808 00110200 */  sll        $v0, $v0, 4
    /* 5B80C 8006B80C 23104300 */  subu       $v0, $v0, $v1
    /* 5B810 8006B810 80100200 */  sll        $v0, $v0, 2
    /* 5B814 8006B814 21104300 */  addu       $v0, $v0, $v1
    /* 5B818 8006B818 C0100200 */  sll        $v0, $v0, 3
    /* 5B81C 8006B81C 21105300 */  addu       $v0, $v0, $s3
    /* 5B820 8006B820 21302202 */  addu       $a2, $s1, $v0
    /* 5B824 8006B824 6000C824 */  addiu      $t0, $a2, 0x60
  .L8006B828:
    /* 5B828 8006B828 0000C28C */  lw         $v0, 0x0($a2)
    /* 5B82C 8006B82C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5B830 8006B830 0800C48C */  lw         $a0, 0x8($a2)
    /* 5B834 8006B834 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5B838 8006B838 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5B83C 8006B83C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5B840 8006B840 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5B844 8006B844 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 5B848 8006B848 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5B84C 8006B84C F6FFC814 */  bne        $a2, $t0, .L8006B828
    /* 5B850 8006B850 1000E724 */   addiu     $a3, $a3, 0x10
    /* 5B854 8006B854 0000C28C */  lw         $v0, 0x0($a2)
    /* 5B858 8006B858 0400C38C */  lw         $v1, 0x4($a2)
    /* 5B85C 8006B85C 0800C48C */  lw         $a0, 0x8($a2)
    /* 5B860 8006B860 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5B864 8006B864 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5B868 8006B868 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5B86C 8006B86C 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5B870 8006B870 00000000 */  nop
    /* 5B874 8006B874 C0100300 */  sll        $v0, $v1, 3
    /* 5B878 8006B878 23104300 */  subu       $v0, $v0, $v1
    /* 5B87C 8006B87C 80100200 */  sll        $v0, $v0, 2
    /* 5B880 8006B880 23104300 */  subu       $v0, $v0, $v1
    /* 5B884 8006B884 80180200 */  sll        $v1, $v0, 2
    /* 5B888 8006B888 0E80013C */  lui        $at, %hi(storehold + 0x51)
    /* 5B88C 8006B88C 21082300 */  addu       $at, $at, $v1
    /* 5B890 8006B890 D91D2280 */  lb         $v0, %lo(storehold + 0x51)($at)
    /* 5B894 8006B894 00000000 */  nop
    /* 5B898 8006B898 0D004010 */  beqz       $v0, .L8006B8D0
    /* 5B89C 8006B89C 00000000 */   nop
    /* 5B8A0 8006B8A0 0E80013C */  lui        $at, %hi(storehold + 0x69)
    /* 5B8A4 8006B8A4 21082300 */  addu       $at, $at, $v1
    /* 5B8A8 8006B8A8 F11D2280 */  lb         $v0, %lo(storehold + 0x69)($at)
    /* 5B8AC 8006B8AC 00000000 */  nop
    /* 5B8B0 8006B8B0 07004010 */  beqz       $v0, .L8006B8D0
    /* 5B8B4 8006B8B4 00000000 */   nop
    /* 5B8B8 8006B8B8 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5B8BC 8006B8BC 21082300 */  addu       $at, $at, $v1
    /* 5B8C0 8006B8C0 A01D228C */  lw         $v0, %lo(storehold + 0x18)($at)
    /* 5B8C4 8006B8C4 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5B8C8 8006B8C8 21082300 */  addu       $at, $at, $v1
    /* 5B8CC 8006B8CC 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
  .L8006B8D0:
    /* 5B8D0 8006B8D0 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5B8D4 8006B8D4 00000000 */  nop
    /* 5B8D8 8006B8D8 C0180200 */  sll        $v1, $v0, 3
    /* 5B8DC 8006B8DC 23186200 */  subu       $v1, $v1, $v0
    /* 5B8E0 8006B8E0 80180300 */  sll        $v1, $v1, 2
    /* 5B8E4 8006B8E4 23186200 */  subu       $v1, $v1, $v0
    /* 5B8E8 8006B8E8 80180300 */  sll        $v1, $v1, 2
    /* 5B8EC 8006B8EC 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5B8F0 8006B8F0 21082300 */  addu       $at, $at, $v1
    /* 5B8F4 8006B8F4 9C1D228C */  lw         $v0, %lo(storehold + 0x14)($at)
    /* 5B8F8 8006B8F8 00000000 */  nop
    /* 5B8FC 8006B8FC 83100200 */  sra        $v0, $v0, 2
    /* 5B900 8006B900 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5B904 8006B904 21082300 */  addu       $at, $at, $v1
    /* 5B908 8006B908 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
    /* 5B90C 8006B90C 04004014 */  bnez       $v0, .L8006B920
    /* 5B910 8006B910 01000224 */   addiu     $v0, $zero, 0x1
    /* 5B914 8006B914 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5B918 8006B918 21082300 */  addu       $at, $at, $v1
    /* 5B91C 8006B91C 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
  .L8006B920:
    /* 5B920 8006B920 2821848F */  lw         $a0, %gp_rel(D_8011C8A8)($gp)
    /* 5B924 8006B924 00000000 */  nop
    /* 5B928 8006B928 C0100400 */  sll        $v0, $a0, 3
    /* 5B92C 8006B92C 23104400 */  subu       $v0, $v0, $a0
    /* 5B930 8006B930 80100200 */  sll        $v0, $v0, 2
    /* 5B934 8006B934 23104400 */  subu       $v0, $v0, $a0
    /* 5B938 8006B938 80100200 */  sll        $v0, $v0, 2
    /* 5B93C 8006B93C 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5B940 8006B940 21082200 */  addu       $at, $at, $v0
    /* 5B944 8006B944 9C1D238C */  lw         $v1, %lo(storehold + 0x14)($at)
    /* 5B948 8006B948 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5B94C 8006B94C 21082200 */  addu       $at, $at, $v0
    /* 5B950 8006B950 A01D23AC */  sw         $v1, %lo(storehold + 0x18)($at)
    /* 5B954 8006B954 0E80013C */  lui        $at, %hi(storehidx)
    /* 5B958 8006B958 21082400 */  addu       $at, $at, $a0
    /* 5B95C 8006B95C C83130A0 */  sb         $s0, %lo(storehidx)($at)
    /* 5B960 8006B960 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5B964 8006B964 00000000 */  nop
    /* 5B968 8006B968 01004224 */  addiu      $v0, $v0, 0x1
    /* 5B96C 8006B96C 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
  .L8006B970:
    /* 5B970 8006B970 1280023C */  lui        $v0, %hi(myplr)
    /* 5B974 8006B974 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5B978 8006B978 00000000 */  nop
    /* 5B97C 8006B97C 40180200 */  sll        $v1, $v0, 1
    /* 5B980 8006B980 21186200 */  addu       $v1, $v1, $v0
    /* 5B984 8006B984 80180300 */  sll        $v1, $v1, 2
    /* 5B988 8006B988 21186200 */  addu       $v1, $v1, $v0
    /* 5B98C 8006B98C 00190300 */  sll        $v1, $v1, 4
    /* 5B990 8006B990 23186200 */  subu       $v1, $v1, $v0
    /* 5B994 8006B994 80180300 */  sll        $v1, $v1, 2
    /* 5B998 8006B998 21186200 */  addu       $v1, $v1, $v0
    /* 5B99C 8006B99C C0180300 */  sll        $v1, $v1, 3
    /* 5B9A0 8006B9A0 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5B9A4 8006B9A4 21082300 */  addu       $at, $at, $v1
    /* 5B9A8 8006B9A8 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5B9AC 8006B9AC 01001026 */  addiu      $s0, $s0, 0x1
    /* 5B9B0 8006B9B0 2A100202 */  slt        $v0, $s0, $v0
    /* 5B9B4 8006B9B4 81FF4014 */  bnez       $v0, .L8006B7BC
    /* 5B9B8 8006B9B8 6C003126 */   addiu     $s1, $s1, 0x6C
  .L8006B9BC:
    /* 5B9BC 8006B9BC FF004232 */  andi       $v0, $s2, 0xFF
    /* 5B9C0 8006B9C0 23004014 */  bnez       $v0, .L8006BA50
    /* 5B9C4 8006B9C4 00000000 */   nop
    /* 5B9C8 8006B9C8 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5B9CC 8006B9CC 4AED010C */  jal        GetStr__Fi
    /* 5B9D0 8006B9D0 EB040424 */   addiu     $a0, $zero, 0x4EB
    /* 5B9D4 8006B9D4 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5B9D8 8006B9D8 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5B9DC 8006B9DC 1280053C */  lui        $a1, %hi(myplr)
    /* 5B9E0 8006B9E0 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5B9E4 8006B9E4 21200002 */  addu       $a0, $s0, $zero
    /* 5B9E8 8006B9E8 40180500 */  sll        $v1, $a1, 1
    /* 5B9EC 8006B9EC 21186500 */  addu       $v1, $v1, $a1
    /* 5B9F0 8006B9F0 80180300 */  sll        $v1, $v1, 2
    /* 5B9F4 8006B9F4 21186500 */  addu       $v1, $v1, $a1
    /* 5B9F8 8006B9F8 00190300 */  sll        $v1, $v1, 4
    /* 5B9FC 8006B9FC 23186500 */  subu       $v1, $v1, $a1
    /* 5BA00 8006BA00 80180300 */  sll        $v1, $v1, 2
    /* 5BA04 8006BA04 21186500 */  addu       $v1, $v1, $a1
    /* 5BA08 8006BA08 C0180300 */  sll        $v1, $v1, 3
    /* 5BA0C 8006BA0C 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5BA10 8006BA10 21082300 */  addu       $at, $at, $v1
    /* 5BA14 8006BA14 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5BA18 8006BA18 9767000C */  jal        sprintf
    /* 5BA1C 8006BA1C 21284000 */   addu      $a1, $v0, $zero
    /* 5BA20 8006BA20 21200000 */  addu       $a0, $zero, $zero
    /* 5BA24 8006BA24 01000524 */  addiu      $a1, $zero, 0x1
    /* 5BA28 8006BA28 01000624 */  addiu      $a2, $zero, 0x1
    /* 5BA2C 8006BA2C 21380002 */  addu       $a3, $s0, $zero
    /* 5BA30 8006BA30 03000224 */  addiu      $v0, $zero, 0x3
    /* 5BA34 8006BA34 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5BA38 8006BA38 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5BA3C 8006BA3C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5BA40 8006BA40 5CA7010C */  jal        AddSLine__Fi
    /* 5BA44 8006BA44 02000424 */   addiu     $a0, $zero, 0x2
    /* 5BA48 8006BA48 C8AE0108 */  j          .L8006BB20
    /* 5BA4C 8006BA4C 00000000 */   nop
  .L8006BA50:
    /* 5BA50 8006BA50 1280033C */  lui        $v1, %hi(myplr)
    /* 5BA54 8006BA54 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5BA58 8006BA58 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5BA5C 8006BA5C 40100300 */  sll        $v0, $v1, 1
    /* 5BA60 8006BA60 21104300 */  addu       $v0, $v0, $v1
    /* 5BA64 8006BA64 80100200 */  sll        $v0, $v0, 2
    /* 5BA68 8006BA68 21104300 */  addu       $v0, $v0, $v1
    /* 5BA6C 8006BA6C 00110200 */  sll        $v0, $v0, 4
    /* 5BA70 8006BA70 23104300 */  subu       $v0, $v0, $v1
    /* 5BA74 8006BA74 80100200 */  sll        $v0, $v0, 2
    /* 5BA78 8006BA78 21104300 */  addu       $v0, $v0, $v1
    /* 5BA7C 8006BA7C C0100200 */  sll        $v0, $v0, 3
    /* 5BA80 8006BA80 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5BA84 8006BA84 21082200 */  addu       $at, $at, $v0
    /* 5BA88 8006BA88 BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 5BA8C 8006BA8C 01000224 */  addiu      $v0, $zero, 0x1
    /* 5BA90 8006BA90 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5BA94 8006BA94 182183AF */  sw         $v1, %gp_rel(D_8011C898)($gp)
    /* 5BA98 8006BA98 4AED010C */  jal        GetStr__Fi
    /* 5BA9C 8006BA9C CF040424 */   addiu     $a0, $zero, 0x4CF
    /* 5BAA0 8006BAA0 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5BAA4 8006BAA4 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5BAA8 8006BAA8 1280053C */  lui        $a1, %hi(myplr)
    /* 5BAAC 8006BAAC 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5BAB0 8006BAB0 21200002 */  addu       $a0, $s0, $zero
    /* 5BAB4 8006BAB4 40180500 */  sll        $v1, $a1, 1
    /* 5BAB8 8006BAB8 21186500 */  addu       $v1, $v1, $a1
    /* 5BABC 8006BABC 80180300 */  sll        $v1, $v1, 2
    /* 5BAC0 8006BAC0 21186500 */  addu       $v1, $v1, $a1
    /* 5BAC4 8006BAC4 00190300 */  sll        $v1, $v1, 4
    /* 5BAC8 8006BAC8 23186500 */  subu       $v1, $v1, $a1
    /* 5BACC 8006BACC 80180300 */  sll        $v1, $v1, 2
    /* 5BAD0 8006BAD0 21186500 */  addu       $v1, $v1, $a1
    /* 5BAD4 8006BAD4 C0180300 */  sll        $v1, $v1, 3
    /* 5BAD8 8006BAD8 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5BADC 8006BADC 21082300 */  addu       $at, $at, $v1
    /* 5BAE0 8006BAE0 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5BAE4 8006BAE4 9767000C */  jal        sprintf
    /* 5BAE8 8006BAE8 21284000 */   addu      $a1, $v0, $zero
    /* 5BAEC 8006BAEC 21200000 */  addu       $a0, $zero, $zero
    /* 5BAF0 8006BAF0 01000524 */  addiu      $a1, $zero, 0x1
    /* 5BAF4 8006BAF4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5BAF8 8006BAF8 21380002 */  addu       $a3, $s0, $zero
    /* 5BAFC 8006BAFC 03000224 */  addiu      $v0, $zero, 0x3
    /* 5BB00 8006BB00 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5BB04 8006BB04 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5BB08 8006BB08 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5BB0C 8006BB0C 5CA7010C */  jal        AddSLine__Fi
    /* 5BB10 8006BB10 02000424 */   addiu     $a0, $zero, 0x2
    /* 5BB14 8006BB14 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5BB18 8006BB18 2EAD010C */  jal        S_ScrollSSell__Fi
    /* 5BB1C 8006BB1C 00000000 */   nop
  .L8006BB20:
    /* 5BB20 8006BB20 3400BF8F */  lw         $ra, 0x34($sp)
    /* 5BB24 8006BB24 3000B48F */  lw         $s4, 0x30($sp)
    /* 5BB28 8006BB28 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 5BB2C 8006BB2C 2800B28F */  lw         $s2, 0x28($sp)
    /* 5BB30 8006BB30 2400B18F */  lw         $s1, 0x24($sp)
    /* 5BB34 8006BB34 2000B08F */  lw         $s0, 0x20($sp)
    /* 5BB38 8006BB38 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 5BB3C 8006BB3C 0800E003 */  jr         $ra
    /* 5BB40 8006BB40 00000000 */   nop
endlabel S_StartSSell__Fv
