.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateSarc__FiiUc, 0x1B8

glabel OperateSarc__FiiUc
    /* 4979C 8005979C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 497A0 800597A0 2400B3AF */  sw         $s3, 0x24($sp)
    /* 497A4 800597A4 21988000 */  addu       $s3, $a0, $zero
    /* 497A8 800597A8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 497AC 800597AC 2188A000 */  addu       $s1, $a1, $zero
    /* 497B0 800597B0 40101100 */  sll        $v0, $s1, 1
    /* 497B4 800597B4 21105100 */  addu       $v0, $v0, $s1
    /* 497B8 800597B8 80100200 */  sll        $v0, $v0, 2
    /* 497BC 800597BC 23105100 */  subu       $v0, $v0, $s1
    /* 497C0 800597C0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 497C4 800597C4 80800200 */  sll        $s0, $v0, 2
    /* 497C8 800597C8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 497CC 800597CC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 497D0 800597D0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 497D4 800597D4 21083000 */  addu       $at, $at, $s0
    /* 497D8 800597D8 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 497DC 800597DC 00000000 */  nop
    /* 497E0 800597E0 54004010 */  beqz       $v0, .L80059934
    /* 497E4 800597E4 2190C000 */   addu      $s2, $a2, $zero
    /* 497E8 800597E8 1280023C */  lui        $v0, %hi(deltaload)
    /* 497EC 800597EC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 497F0 800597F0 00000000 */  nop
    /* 497F4 800597F4 09004014 */  bnez       $v0, .L8005981C
    /* 497F8 800597F8 00000000 */   nop
    /* 497FC 800597FC 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 49800 80059800 21083000 */  addu       $at, $at, $s0
    /* 49804 80059804 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 49808 80059808 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4980C 8005980C 21083000 */  addu       $at, $at, $s0
    /* 49810 80059810 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 49814 80059814 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 49818 80059818 2F000424 */   addiu     $a0, $zero, 0x2F
  .L8005981C:
    /* 4981C 8005981C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 49820 80059820 21083000 */  addu       $at, $at, $s0
    /* 49824 80059824 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 49828 80059828 1280023C */  lui        $v0, %hi(deltaload)
    /* 4982C 8005982C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 49830 80059830 00000000 */  nop
    /* 49834 80059834 09004010 */  beqz       $v0, .L8005985C
    /* 49838 80059838 01000224 */   addiu     $v0, $zero, 0x1
    /* 4983C 8005983C 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 49840 80059840 21083000 */  addu       $at, $at, $s0
    /* 49844 80059844 588C2294 */  lhu        $v0, %lo(object + 0xC)($at)
    /* 49848 80059848 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4984C 8005984C 21083000 */  addu       $at, $at, $s0
    /* 49850 80059850 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 49854 80059854 4D660108 */  j          .L80059934
    /* 49858 80059858 00000000 */   nop
  .L8005985C:
    /* 4985C 8005985C 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 49860 80059860 21083000 */  addu       $at, $at, $s0
    /* 49864 80059864 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 49868 80059868 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 4986C 8005986C 21083000 */  addu       $at, $at, $s0
    /* 49870 80059870 718C22A0 */  sb         $v0, %lo(object + 0x25)($at)
    /* 49874 80059874 03000224 */  addiu      $v0, $zero, 0x3
    /* 49878 80059878 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 4987C 8005987C 21083000 */  addu       $at, $at, $s0
    /* 49880 80059880 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 49884 80059884 B3F6000C */  jal        SetRndSeed__Fl
    /* 49888 80059888 00000000 */   nop
    /* 4988C 8005988C 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 49890 80059890 21083000 */  addu       $at, $at, $s0
    /* 49894 80059894 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 49898 80059898 00000000 */  nop
    /* 4989C 8005989C 03004228 */  slti       $v0, $v0, 0x3
    /* 498A0 800598A0 0A004010 */  beqz       $v0, .L800598CC
    /* 498A4 800598A4 21300000 */   addu      $a2, $zero, $zero
    /* 498A8 800598A8 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 498AC 800598AC 21083000 */  addu       $at, $at, $s0
    /* 498B0 800598B0 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 498B4 800598B4 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 498B8 800598B8 21083000 */  addu       $at, $at, $s0
    /* 498BC 800598BC 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 498C0 800598C0 FF004732 */  andi       $a3, $s2, 0xFF
    /* 498C4 800598C4 F612010C */  jal        CreateRndItem__FiiUcUcUc
    /* 498C8 800598C8 1000A0AF */   sw        $zero, 0x10($sp)
  .L800598CC:
    /* 498CC 800598CC 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 498D0 800598D0 21083000 */  addu       $at, $at, $s0
    /* 498D4 800598D4 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 498D8 800598D8 00000000 */  nop
    /* 498DC 800598DC 08004228 */  slti       $v0, $v0, 0x8
    /* 498E0 800598E0 0C004014 */  bnez       $v0, .L80059914
    /* 498E4 800598E4 00000000 */   nop
    /* 498E8 800598E8 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 498EC 800598EC 21083000 */  addu       $at, $at, $s0
    /* 498F0 800598F0 5C8C2484 */  lh         $a0, %lo(object + 0x10)($at)
    /* 498F4 800598F4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 498F8 800598F8 21083000 */  addu       $at, $at, $s0
    /* 498FC 800598FC 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 49900 80059900 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 49904 80059904 21083000 */  addu       $at, $at, $s0
    /* 49908 80059908 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4990C 8005990C 6100020C */  jal        SpawnSkeleton__Fiii
    /* 49910 80059910 00000000 */   nop
  .L80059914:
    /* 49914 80059914 1280023C */  lui        $v0, %hi(myplr)
    /* 49918 80059918 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4991C 8005991C 00000000 */  nop
    /* 49920 80059920 04006216 */  bne        $s3, $v0, .L80059934
    /* 49924 80059924 21200000 */   addu      $a0, $zero, $zero
    /* 49928 80059928 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4992C 8005992C 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 49930 80059930 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80059934:
    /* 49934 80059934 2800BF8F */  lw         $ra, 0x28($sp)
    /* 49938 80059938 2400B38F */  lw         $s3, 0x24($sp)
    /* 4993C 8005993C 2000B28F */  lw         $s2, 0x20($sp)
    /* 49940 80059940 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 49944 80059944 1800B08F */  lw         $s0, 0x18($sp)
    /* 49948 80059948 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4994C 8005994C 0800E003 */  jr         $ra
    /* 49950 80059950 00000000 */   nop
endlabel OperateSarc__FiiUc
