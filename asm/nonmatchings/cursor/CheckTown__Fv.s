.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckTown__Fv, 0x294

glabel CheckTown__Fv
    /* 27884 80037884 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 27888 80037888 D00F8B8F */  lw         $t3, %gp_rel(cursmx)($gp)
    /* 2788C 8003788C D40F8A8F */  lw         $t2, %gp_rel(cursmy)($gp)
    /* 27890 80037890 21480000 */  addu       $t1, $zero, $zero
    /* 27894 80037894 1400B1AF */  sw         $s1, 0x14($sp)
    /* 27898 80037898 0D80113C */  lui        $s1, %hi(tempstr)
    /* 2789C 8003789C 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 278A0 800378A0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 278A4 800378A4 1000B0AF */  sw         $s0, 0x10($sp)
  .L800378A8:
    /* 278A8 800378A8 1280023C */  lui        $v0, %hi(nummissiles)
    /* 278AC 800378AC 88C2428C */  lw         $v0, %lo(nummissiles)($v0)
    /* 278B0 800378B0 00000000 */  nop
    /* 278B4 800378B4 2A102201 */  slt        $v0, $t1, $v0
    /* 278B8 800378B8 91004010 */  beqz       $v0, .L80037B00
    /* 278BC 800378BC 40100900 */   sll       $v0, $t1, 1
    /* 278C0 800378C0 1080013C */  lui        $at, %hi(missileactive)
    /* 278C4 800378C4 21082200 */  addu       $at, $at, $v0
    /* 278C8 800378C8 602A2384 */  lh         $v1, %lo(missileactive)($at)
    /* 278CC 800378CC 00000000 */  nop
    /* 278D0 800378D0 80100300 */  sll        $v0, $v1, 2
    /* 278D4 800378D4 21104300 */  addu       $v0, $v0, $v1
    /* 278D8 800378D8 80100200 */  sll        $v0, $v0, 2
    /* 278DC 800378DC 23104300 */  subu       $v0, $v0, $v1
    /* 278E0 800378E0 80200200 */  sll        $a0, $v0, 2
    /* 278E4 800378E4 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 278E8 800378E8 21082400 */  addu       $at, $at, $a0
    /* 278EC 800378EC 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 278F0 800378F0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 278F4 800378F4 80006214 */  bne        $v1, $v0, .L80037AF8
    /* 278F8 800378F8 21400000 */   addu      $t0, $zero, $zero
    /* 278FC 800378FC 21808000 */  addu       $s0, $a0, $zero
  .L80037900:
    /* 27900 80037900 1280013C */  lui        $at, %hi(offset_x)
    /* 27904 80037904 21082800 */  addu       $at, $at, $t0
    /* 27908 80037908 A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 2790C 8003790C 00000000 */  nop
    /* 27910 80037910 21286201 */  addu       $a1, $t3, $v0
    /* 27914 80037914 D00F85AF */  sw         $a1, %gp_rel(cursmx)($gp)
    /* 27918 80037918 1280013C */  lui        $at, %hi(offset_y)
    /* 2791C 8003791C 21082800 */  addu       $at, $at, $t0
    /* 27920 80037920 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 27924 80037924 00000000 */  nop
    /* 27928 80037928 21204201 */  addu       $a0, $t2, $v0
    /* 2792C 8003792C D40F84AF */  sw         $a0, %gp_rel(cursmy)($gp)
    /* 27930 80037930 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 27934 80037934 21083000 */  addu       $at, $at, $s0
    /* 27938 80037938 892C2680 */  lb         $a2, %lo(missile + 0x31)($at)
    /* 2793C 8003793C 00000000 */  nop
    /* 27940 80037940 FFFFC724 */  addiu      $a3, $a2, -0x1
    /* 27944 80037944 0700A714 */  bne        $a1, $a3, .L80037964
    /* 27948 80037948 00000000 */   nop
    /* 2794C 8003794C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27950 80037950 21083000 */  addu       $at, $at, $s0
    /* 27954 80037954 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27958 80037958 00000000 */  nop
    /* 2795C 8003795C 2F008210 */  beq        $a0, $v0, .L80037A1C
    /* 27960 80037960 00000000 */   nop
  .L80037964:
    /* 27964 80037964 0800A614 */  bne        $a1, $a2, .L80037988
    /* 27968 80037968 00000000 */   nop
    /* 2796C 8003796C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27970 80037970 21083000 */  addu       $at, $at, $s0
    /* 27974 80037974 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27978 80037978 00000000 */  nop
    /* 2797C 8003797C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 27980 80037980 26008210 */  beq        $a0, $v0, .L80037A1C
    /* 27984 80037984 00000000 */   nop
  .L80037988:
    /* 27988 80037988 0800A714 */  bne        $a1, $a3, .L800379AC
    /* 2798C 8003798C FEFFC224 */   addiu     $v0, $a2, -0x2
    /* 27990 80037990 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27994 80037994 21083000 */  addu       $at, $at, $s0
    /* 27998 80037998 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 2799C 8003799C 00000000 */  nop
    /* 279A0 800379A0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 279A4 800379A4 1D008210 */  beq        $a0, $v0, .L80037A1C
    /* 279A8 800379A8 FEFFC224 */   addiu     $v0, $a2, -0x2
  .L800379AC:
    /* 279AC 800379AC 0A00A214 */  bne        $a1, $v0, .L800379D8
    /* 279B0 800379B0 00000000 */   nop
    /* 279B4 800379B4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 279B8 800379B8 21083000 */  addu       $at, $at, $s0
    /* 279BC 800379BC 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* 279C0 800379C0 00000000 */  nop
    /* 279C4 800379C4 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 279C8 800379C8 14008210 */  beq        $a0, $v0, .L80037A1C
    /* 279CC 800379CC FEFF6224 */   addiu     $v0, $v1, -0x2
    /* 279D0 800379D0 12008210 */  beq        $a0, $v0, .L80037A1C
    /* 279D4 800379D4 00000000 */   nop
  .L800379D8:
    /* 279D8 800379D8 0800A714 */  bne        $a1, $a3, .L800379FC
    /* 279DC 800379DC 00000000 */   nop
    /* 279E0 800379E0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 279E4 800379E4 21083000 */  addu       $at, $at, $s0
    /* 279E8 800379E8 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 279EC 800379EC 00000000 */  nop
    /* 279F0 800379F0 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 279F4 800379F4 09008210 */  beq        $a0, $v0, .L80037A1C
    /* 279F8 800379F8 00000000 */   nop
  .L800379FC:
    /* 279FC 800379FC 3A00A614 */  bne        $a1, $a2, .L80037AE8
    /* 27A00 80037A00 00000000 */   nop
    /* 27A04 80037A04 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27A08 80037A08 21083000 */  addu       $at, $at, $s0
    /* 27A0C 80037A0C 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27A10 80037A10 00000000 */  nop
    /* 27A14 80037A14 35008214 */  bne        $a0, $v0, .L80037AEC
    /* 27A18 80037A18 01000825 */   addiu     $t0, $t0, 0x1
  .L80037A1C:
    /* 27A1C 80037A1C AC0F838F */  lw         $v1, %gp_rel(sel_data)($gp)
    /* 27A20 80037A20 01000224 */  addiu      $v0, $zero, 0x1
    /* 27A24 80037A24 1280013C */  lui        $at, %hi(_trigflag)
    /* 27A28 80037A28 21082300 */  addu       $at, $at, $v1
    /* 27A2C 80037A2C 74BB22A0 */  sb         $v0, %lo(_trigflag)($at)
    /* 27A30 80037A30 C8C7000C */  jal        ClearPanel__Fv
    /* 27A34 80037A34 00000000 */   nop
    /* 27A38 80037A38 4AED010C */  jal        GetStr__Fi
    /* 27A3C 80037A3C 94040424 */   addiu     $a0, $zero, 0x494
    /* 27A40 80037A40 21284000 */  addu       $a1, $v0, $zero
    /* 27A44 80037A44 AC0F838F */  lw         $v1, %gp_rel(sel_data)($gp)
    /* 27A48 80037A48 0D80043C */  lui        $a0, %hi(_infostr)
    /* 27A4C 80037A4C 10E88424 */  addiu      $a0, $a0, %lo(_infostr)
    /* 27A50 80037A50 001A0300 */  sll        $v1, $v1, 8
    /* 27A54 80037A54 F240000C */  jal        strcpy
    /* 27A58 80037A58 21206400 */   addu      $a0, $v1, $a0
    /* 27A5C 80037A5C 4AED010C */  jal        GetStr__Fi
    /* 27A60 80037A60 6E010424 */   addiu     $a0, $zero, 0x16E
    /* 27A64 80037A64 21202002 */  addu       $a0, $s1, $zero
    /* 27A68 80037A68 21284000 */  addu       $a1, $v0, $zero
    /* 27A6C 80037A6C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 27A70 80037A70 21083000 */  addu       $at, $at, $s0
    /* 27A74 80037A74 862C2384 */  lh         $v1, %lo(missile + 0x2E)($at)
    /* 27A78 80037A78 0E80023C */  lui        $v0, %hi(plr + 0xD6)
    /* 27A7C 80037A7C 0EA64224 */  addiu      $v0, $v0, %lo(plr + 0xD6)
    /* 27A80 80037A80 40300300 */  sll        $a2, $v1, 1
    /* 27A84 80037A84 2130C300 */  addu       $a2, $a2, $v1
    /* 27A88 80037A88 80300600 */  sll        $a2, $a2, 2
    /* 27A8C 80037A8C 2130C300 */  addu       $a2, $a2, $v1
    /* 27A90 80037A90 00310600 */  sll        $a2, $a2, 4
    /* 27A94 80037A94 2330C300 */  subu       $a2, $a2, $v1
    /* 27A98 80037A98 80300600 */  sll        $a2, $a2, 2
    /* 27A9C 80037A9C 2130C300 */  addu       $a2, $a2, $v1
    /* 27AA0 80037AA0 C0300600 */  sll        $a2, $a2, 3
    /* 27AA4 80037AA4 9767000C */  jal        sprintf
    /* 27AA8 80037AA8 2130C200 */   addu      $a2, $a2, $v0
    /* 27AAC 80037AAC 21202002 */  addu       $a0, $s1, $zero
    /* 27AB0 80037AB0 98C7000C */  jal        AddPanelString__FPCci
    /* 27AB4 80037AB4 01000524 */   addiu     $a1, $zero, 0x1
    /* 27AB8 80037AB8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 27ABC 80037ABC 21083000 */  addu       $at, $at, $s0
    /* 27AC0 80037AC0 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* 27AC4 80037AC4 00000000 */  nop
    /* 27AC8 80037AC8 D00F82AF */  sw         $v0, %gp_rel(cursmx)($gp)
    /* 27ACC 80037ACC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 27AD0 80037AD0 21083000 */  addu       $at, $at, $s0
    /* 27AD4 80037AD4 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* 27AD8 80037AD8 00000000 */  nop
    /* 27ADC 80037ADC D40F82AF */  sw         $v0, %gp_rel(cursmy)($gp)
    /* 27AE0 80037AE0 C0DE0008 */  j          .L80037B00
    /* 27AE4 80037AE4 00000000 */   nop
  .L80037AE8:
    /* 27AE8 80037AE8 01000825 */  addiu      $t0, $t0, 0x1
  .L80037AEC:
    /* 27AEC 80037AEC 08000229 */  slti       $v0, $t0, 0x8
    /* 27AF0 80037AF0 83FF4014 */  bnez       $v0, .L80037900
    /* 27AF4 80037AF4 00000000 */   nop
  .L80037AF8:
    /* 27AF8 80037AF8 2ADE0008 */  j          .L800378A8
    /* 27AFC 80037AFC 01002925 */   addiu     $t1, $t1, 0x1
  .L80037B00:
    /* 27B00 80037B00 1800BF8F */  lw         $ra, 0x18($sp)
    /* 27B04 80037B04 1400B18F */  lw         $s1, 0x14($sp)
    /* 27B08 80037B08 1000B08F */  lw         $s0, 0x10($sp)
    /* 27B0C 80037B0C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 27B10 80037B10 0800E003 */  jr         $ra
    /* 27B14 80037B14 00000000 */   nop
endlabel CheckTown__Fv
