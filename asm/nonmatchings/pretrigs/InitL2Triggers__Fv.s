.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitL2Triggers__Fv, 0x1C8

glabel InitL2Triggers__Fv
    /* 28A64 8016265C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28A68 80162660 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28A6C 80162664 21880000 */  addu       $s1, $zero, $zero
    /* 28A70 80162668 1800B2AF */  sw         $s2, 0x18($sp)
    /* 28A74 8016266C 0E80123C */  lui        $s2, %hi(quests + 0x11C)
    /* 28A78 80162670 5CDB5226 */  addiu      $s2, $s2, %lo(quests + 0x11C)
    /* 28A7C 80162674 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 28A80 80162678 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28A84 8016267C 1280013C */  lui        $at, %hi(numtrigs)
    /* 28A88 80162680 78BB20AC */  sw         $zero, %lo(numtrigs)($at)
  .L80162684:
    /* 28A8C 80162684 21800000 */  addu       $s0, $zero, $zero
    /* 28A90 80162688 21200002 */  addu       $a0, $s0, $zero
  .L8016268C:
    /* 28A94 8016268C 910A020C */  jal        GetDPiece__Fii
    /* 28A98 80162690 21282002 */   addu      $a1, $s1, $zero
    /* 28A9C 80162694 00140200 */  sll        $v0, $v0, 16
    /* 28AA0 80162698 03140200 */  sra        $v0, $v0, 16
    /* 28AA4 8016269C 0B010324 */  addiu      $v1, $zero, 0x10B
    /* 28AA8 801626A0 1A004314 */  bne        $v0, $v1, .L8016270C
    /* 28AAC 801626A4 21200002 */   addu      $a0, $s0, $zero
    /* 28AB0 801626A8 0000428E */  lw         $v0, 0x0($s2)
    /* 28AB4 801626AC 00000000 */  nop
    /* 28AB8 801626B0 05000216 */  bne        $s0, $v0, .L801626C8
    /* 28ABC 801626B4 00000000 */   nop
    /* 28AC0 801626B8 0400428E */  lw         $v0, 0x4($s2)
    /* 28AC4 801626BC 00000000 */  nop
    /* 28AC8 801626C0 12002212 */  beq        $s1, $v0, .L8016270C
    /* 28ACC 801626C4 00000000 */   nop
  .L801626C8:
    /* 28AD0 801626C8 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28AD4 801626CC 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28AD8 801626D0 43000224 */  addiu      $v0, $zero, 0x43
    /* 28ADC 801626D4 00190400 */  sll        $v1, $a0, 4
    /* 28AE0 801626D8 01008424 */  addiu      $a0, $a0, 0x1
    /* 28AE4 801626DC 0E80013C */  lui        $at, %hi(trigs)
    /* 28AE8 801626E0 21082300 */  addu       $at, $at, $v1
    /* 28AEC 801626E4 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28AF0 801626E8 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28AF4 801626EC 21082300 */  addu       $at, $at, $v1
    /* 28AF8 801626F0 D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28AFC 801626F4 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28B00 801626F8 21082300 */  addu       $at, $at, $v1
    /* 28B04 801626FC D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28B08 80162700 1280013C */  lui        $at, %hi(numtrigs)
    /* 28B0C 80162704 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28B10 80162708 21200002 */  addu       $a0, $s0, $zero
  .L8016270C:
    /* 28B14 8016270C 910A020C */  jal        GetDPiece__Fii
    /* 28B18 80162710 21282002 */   addu      $a1, $s1, $zero
    /* 28B1C 80162714 00140200 */  sll        $v0, $v0, 16
    /* 28B20 80162718 03140200 */  sra        $v0, $v0, 16
    /* 28B24 8016271C 2F020324 */  addiu      $v1, $zero, 0x22F
    /* 28B28 80162720 15004314 */  bne        $v0, $v1, .L80162778
    /* 28B2C 80162724 21200002 */   addu      $a0, $s0, $zero
    /* 28B30 80162728 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28B34 8016272C 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28B38 80162730 48000224 */  addiu      $v0, $zero, 0x48
    /* 28B3C 80162734 00190400 */  sll        $v1, $a0, 4
    /* 28B40 80162738 01008424 */  addiu      $a0, $a0, 0x1
    /* 28B44 8016273C 0E80013C */  lui        $at, %hi(trigs)
    /* 28B48 80162740 21082300 */  addu       $at, $at, $v1
    /* 28B4C 80162744 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28B50 80162748 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28B54 8016274C 21082300 */  addu       $at, $at, $v1
    /* 28B58 80162750 D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28B5C 80162754 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28B60 80162758 21082300 */  addu       $at, $at, $v1
    /* 28B64 8016275C D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28B68 80162760 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 28B6C 80162764 21082300 */  addu       $at, $at, $v1
    /* 28B70 80162768 D83320AC */  sw         $zero, %lo(trigs + 0xC)($at)
    /* 28B74 8016276C 1280013C */  lui        $at, %hi(numtrigs)
    /* 28B78 80162770 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28B7C 80162774 21200002 */  addu       $a0, $s0, $zero
  .L80162778:
    /* 28B80 80162778 910A020C */  jal        GetDPiece__Fii
    /* 28B84 8016277C 21282002 */   addu      $a1, $s1, $zero
    /* 28B88 80162780 00140200 */  sll        $v0, $v0, 16
    /* 28B8C 80162784 03140200 */  sra        $v0, $v0, 16
    /* 28B90 80162788 0F010324 */  addiu      $v1, $zero, 0x10F
    /* 28B94 8016278C 11004314 */  bne        $v0, $v1, .L801627D4
    /* 28B98 80162790 42000224 */   addiu     $v0, $zero, 0x42
    /* 28B9C 80162794 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28BA0 80162798 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28BA4 8016279C 00000000 */  nop
    /* 28BA8 801627A0 00190400 */  sll        $v1, $a0, 4
    /* 28BAC 801627A4 01008424 */  addiu      $a0, $a0, 0x1
    /* 28BB0 801627A8 0E80013C */  lui        $at, %hi(trigs)
    /* 28BB4 801627AC 21082300 */  addu       $at, $at, $v1
    /* 28BB8 801627B0 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28BBC 801627B4 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28BC0 801627B8 21082300 */  addu       $at, $at, $v1
    /* 28BC4 801627BC D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28BC8 801627C0 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28BCC 801627C4 21082300 */  addu       $at, $at, $v1
    /* 28BD0 801627C8 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28BD4 801627CC 1280013C */  lui        $at, %hi(numtrigs)
    /* 28BD8 801627D0 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
  .L801627D4:
    /* 28BDC 801627D4 01001026 */  addiu      $s0, $s0, 0x1
    /* 28BE0 801627D8 6000022A */  slti       $v0, $s0, 0x60
    /* 28BE4 801627DC ABFF4014 */  bnez       $v0, .L8016268C
    /* 28BE8 801627E0 21200002 */   addu      $a0, $s0, $zero
    /* 28BEC 801627E4 01003126 */  addiu      $s1, $s1, 0x1
    /* 28BF0 801627E8 6000222A */  slti       $v0, $s1, 0x60
    /* 28BF4 801627EC A5FF4014 */  bnez       $v0, .L80162684
    /* 28BF8 801627F0 00000000 */   nop
    /* 28BFC 801627F4 1280023C */  lui        $v0, %hi(sel_data)
    /* 28C00 801627F8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 28C04 801627FC 1280013C */  lui        $at, %hi(_trigflag)
    /* 28C08 80162800 21082200 */  addu       $at, $at, $v0
    /* 28C0C 80162804 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 28C10 80162808 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 28C14 8016280C 1800B28F */  lw         $s2, 0x18($sp)
    /* 28C18 80162810 1400B18F */  lw         $s1, 0x14($sp)
    /* 28C1C 80162814 1000B08F */  lw         $s0, 0x10($sp)
    /* 28C20 80162818 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28C24 8016281C 0800E003 */  jr         $ra
    /* 28C28 80162820 00000000 */   nop
endlabel InitL2Triggers__Fv
