.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CowSFX__Fi, 0x11C

glabel CowSFX__Fi
    /* 2B83C 8003B83C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B840 8003B840 3C20828F */  lw         $v0, %gp_rel(D_8011C7BC)($gp)
    /* 2B844 8003B844 9410838F */  lw         $v1, %gp_rel(CowPlaying)($gp)
    /* 2B848 8003B848 21308000 */  addu       $a2, $a0, $zero
    /* 2B84C 8003B84C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B850 8003B850 01004424 */  addiu      $a0, $v0, 0x1
    /* 2B854 8003B854 3C2084AF */  sw         $a0, %gp_rel(D_8011C7BC)($gp)
    /* 2B858 8003B858 3B006014 */  bnez       $v1, .L8003B948
    /* 2B85C 8003B85C 0400822C */   sltiu     $v0, $a0, 0x4
    /* 2B860 8003B860 21004014 */  bnez       $v0, .L8003B8E8
    /* 2B864 8003B864 01000224 */   addiu     $v0, $zero, 0x1
    /* 2B868 8003B868 1180053C */  lui        $a1, %hi(D_801112CC)
    /* 2B86C 8003B86C CC12A524 */  addiu      $a1, $a1, %lo(D_801112CC)
    /* 2B870 8003B870 40100600 */  sll        $v0, $a2, 1
    /* 2B874 8003B874 21104600 */  addu       $v0, $v0, $a2
    /* 2B878 8003B878 80100200 */  sll        $v0, $v0, 2
    /* 2B87C 8003B87C 21104600 */  addu       $v0, $v0, $a2
    /* 2B880 8003B880 00110200 */  sll        $v0, $v0, 4
    /* 2B884 8003B884 23104600 */  subu       $v0, $v0, $a2
    /* 2B888 8003B888 80100200 */  sll        $v0, $v0, 2
    /* 2B88C 8003B88C 21104600 */  addu       $v0, $v0, $a2
    /* 2B890 8003B890 4020848F */  lw         $a0, %gp_rel(D_8011C7C0)($gp)
    /* 2B894 8003B894 C0100200 */  sll        $v0, $v0, 3
    /* 2B898 8003B898 3C2080AF */  sw         $zero, %gp_rel(D_8011C7BC)($gp)
    /* 2B89C 8003B89C 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2B8A0 8003B8A0 21082200 */  addu       $at, $at, $v0
    /* 2B8A4 8003B8A4 2EA62280 */  lb         $v0, %lo(plr + 0xF6)($at)
    /* 2B8A8 8003B8A8 40180400 */  sll        $v1, $a0, 1
    /* 2B8AC 8003B8AC 21186400 */  addu       $v1, $v1, $a0
    /* 2B8B0 8003B8B0 80180300 */  sll        $v1, $v1, 2
    /* 2B8B4 8003B8B4 21186500 */  addu       $v1, $v1, $a1
    /* 2B8B8 8003B8B8 80100200 */  sll        $v0, $v0, 2
    /* 2B8BC 8003B8BC 21104300 */  addu       $v0, $v0, $v1
    /* 2B8C0 8003B8C0 0000428C */  lw         $v0, 0x0($v0)
    /* 2B8C4 8003B8C4 01008424 */  addiu      $a0, $a0, 0x1
    /* 2B8C8 8003B8C8 402084AF */  sw         $a0, %gp_rel(D_8011C7C0)($gp)
    /* 2B8CC 8003B8CC 03008428 */  slti       $a0, $a0, 0x3
    /* 2B8D0 8003B8D0 981082AF */  sw         $v0, %gp_rel(D_8011B818)($gp)
    /* 2B8D4 8003B8D4 0B008014 */  bnez       $a0, .L8003B904
    /* 2B8D8 8003B8D8 40100600 */   sll       $v0, $a2, 1
    /* 2B8DC 8003B8DC 402080AF */  sw         $zero, %gp_rel(D_8011C7C0)($gp)
    /* 2B8E0 8003B8E0 42EE0008 */  j          .L8003B908
    /* 2B8E4 8003B8E4 21104600 */   addu      $v0, $v0, $a2
  .L8003B8E8:
    /* 2B8E8 8003B8E8 02008214 */  bne        $a0, $v0, .L8003B8F4
    /* 2B8EC 8003B8EC D9000224 */   addiu     $v0, $zero, 0xD9
    /* 2B8F0 8003B8F0 DA000224 */  addiu      $v0, $zero, 0xDA
  .L8003B8F4:
    /* 2B8F4 8003B8F4 981082AF */  sw         $v0, %gp_rel(D_8011B818)($gp)
    /* 2B8F8 8003B8F8 64000224 */  addiu      $v0, $zero, 0x64
    /* 2B8FC 8003B8FC 941082AF */  sw         $v0, %gp_rel(CowPlaying)($gp)
    /* 2B900 8003B900 40100600 */  sll        $v0, $a2, 1
  .L8003B904:
    /* 2B904 8003B904 21104600 */  addu       $v0, $v0, $a2
  .L8003B908:
    /* 2B908 8003B908 80100200 */  sll        $v0, $v0, 2
    /* 2B90C 8003B90C 21104600 */  addu       $v0, $v0, $a2
    /* 2B910 8003B910 00110200 */  sll        $v0, $v0, 4
    /* 2B914 8003B914 23104600 */  subu       $v0, $v0, $a2
    /* 2B918 8003B918 80100200 */  sll        $v0, $v0, 2
    /* 2B91C 8003B91C 21104600 */  addu       $v0, $v0, $a2
    /* 2B920 8003B920 C0100200 */  sll        $v0, $v0, 3
    /* 2B924 8003B924 9810848F */  lw         $a0, %gp_rel(D_8011B818)($gp)
    /* 2B928 8003B928 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 2B92C 8003B92C 21082200 */  addu       $at, $at, $v0
    /* 2B930 8003B930 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* 2B934 8003B934 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 2B938 8003B938 21082200 */  addu       $at, $at, $v0
    /* 2B93C 8003B93C 6AA52684 */  lh         $a2, %lo(plr + 0x32)($at)
    /* 2B940 8003B940 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 2B944 8003B944 00000000 */   nop
  .L8003B948:
    /* 2B948 8003B948 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B94C 8003B94C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B950 8003B950 0800E003 */  jr         $ra
    /* 2B954 8003B954 00000000 */   nop
endlabel CowSFX__Fi
