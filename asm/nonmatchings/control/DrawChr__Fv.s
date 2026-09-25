.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawChr__Fv, 0x4B0

glabel DrawChr__Fv
    /* 25698 80035698 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 2569C 8003569C 5800B0AF */  sw         $s0, 0x58($sp)
    /* 256A0 800356A0 1380103C */  lui        $s0, %hi(D_8012EA88)
    /* 256A4 800356A4 88EA1026 */  addiu      $s0, $s0, %lo(D_8012EA88)
    /* 256A8 800356A8 21200002 */  addu       $a0, $s0, $zero
    /* 256AC 800356AC 6400BFAF */  sw         $ra, 0x64($sp)
    /* 256B0 800356B0 6000B2AF */  sw         $s2, 0x60($sp)
    /* 256B4 800356B4 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 256B8 800356B8 850F80A3 */  sb         $zero, %gp_rel(chrbtnactive)($gp)
    /* 256BC 800356BC 8FDD000C */  jal        SetBorder__6Dialogi
    /* 256C0 800356C0 12000524 */   addiu     $a1, $zero, 0x12
    /* 256C4 800356C4 21200002 */  addu       $a0, $s0, $zero
    /* 256C8 800356C8 40000524 */  addiu      $a1, $zero, 0x40
    /* 256CC 800356CC 40000624 */  addiu      $a2, $zero, 0x40
    /* 256D0 800356D0 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 256D4 800356D4 40000724 */   addiu     $a3, $zero, 0x40
    /* 256D8 800356D8 EC0E828F */  lw         $v0, %gp_rel(initchr)($gp)
    /* 256DC 800356DC 00000000 */  nop
    /* 256E0 800356E0 19004010 */  beqz       $v0, .L80035748
    /* 256E4 800356E4 00000000 */   nop
    /* 256E8 800356E8 1280023C */  lui        $v0, %hi(options_pad)
    /* 256EC 800356EC 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 256F0 800356F0 00000000 */  nop
    /* 256F4 800356F4 40180200 */  sll        $v1, $v0, 1
    /* 256F8 800356F8 21186200 */  addu       $v1, $v1, $v0
    /* 256FC 800356FC 80180300 */  sll        $v1, $v1, 2
    /* 25700 80035700 21186200 */  addu       $v1, $v1, $v0
    /* 25704 80035704 00190300 */  sll        $v1, $v1, 4
    /* 25708 80035708 23186200 */  subu       $v1, $v1, $v0
    /* 2570C 8003570C 80180300 */  sll        $v1, $v1, 2
    /* 25710 80035710 21186200 */  addu       $v1, $v1, $v0
    /* 25714 80035714 C0180300 */  sll        $v1, $v1, 3
    /* 25718 80035718 0E80013C */  lui        $at, %hi(plr + 0x108)
    /* 2571C 8003571C 21082300 */  addu       $at, $at, $v1
    /* 25720 80035720 40A6228C */  lw         $v0, %lo(plr + 0x108)($at)
    /* 25724 80035724 EC0E80AF */  sw         $zero, %gp_rel(initchr)($gp)
    /* 25728 80035728 04004014 */  bnez       $v0, .L8003573C
    /* 2572C 8003572C 40010224 */   addiu     $v0, $zero, 0x140
    /* 25730 80035730 E80E80AF */  sw         $zero, %gp_rel(D_8011B668)($gp)
    /* 25734 80035734 D0D50008 */  j          .L80035740
    /* 25738 80035738 00000000 */   nop
  .L8003573C:
    /* 2573C 8003573C E80E82AF */  sw         $v0, %gp_rel(D_8011B668)($gp)
  .L80035740:
    /* 25740 80035740 0DD1000C */  jal        BuildChr__Fv
    /* 25744 80035744 00000000 */   nop
  .L80035748:
    /* 25748 80035748 F00E828F */  lw         $v0, %gp_rel(NoCSEntries)($gp)
    /* 2574C 8003574C E00E80AF */  sw         $zero, %gp_rel(D_8011B660)($gp)
    /* 25750 80035750 0A004018 */  blez       $v0, .L8003577C
    /* 25754 80035754 00000000 */   nop
  .L80035758:
    /* 25758 80035758 B6CD000C */  jal        MY_PlrStringXY__Fv
    /* 2575C 8003575C 00000000 */   nop
    /* 25760 80035760 E00E828F */  lw         $v0, %gp_rel(D_8011B660)($gp)
    /* 25764 80035764 F00E838F */  lw         $v1, %gp_rel(NoCSEntries)($gp)
    /* 25768 80035768 01004224 */  addiu      $v0, $v0, 0x1
    /* 2576C 8003576C E00E82AF */  sw         $v0, %gp_rel(D_8011B660)($gp)
    /* 25770 80035770 2A104300 */  slt        $v0, $v0, $v1
    /* 25774 80035774 F8FF4014 */  bnez       $v0, .L80035758
    /* 25778 80035778 00000000 */   nop
  .L8003577C:
    /* 2577C 8003577C 1380103C */  lui        $s0, %hi(D_8012EA88)
    /* 25780 80035780 88EA1026 */  addiu      $s0, $s0, %lo(D_8012EA88)
    /* 25784 80035784 21200002 */  addu       $a0, $s0, $zero
    /* 25788 80035788 8DDD000C */  jal        SetBack__6Dialogi
    /* 2578C 8003578C 05000524 */   addiu     $a1, $zero, 0x5
    /* 25790 80035790 21200002 */  addu       $a0, $s0, $zero
    /* 25794 80035794 8FDD000C */  jal        SetBorder__6Dialogi
    /* 25798 80035798 12000524 */   addiu     $a1, $zero, 0x12
    /* 2579C 8003579C 1280053C */  lui        $a1, %hi(BORDERR)
    /* 257A0 800357A0 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 257A4 800357A4 1280063C */  lui        $a2, %hi(BORDERG)
    /* 257A8 800357A8 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 257AC 800357AC 1280073C */  lui        $a3, %hi(BORDERB)
    /* 257B0 800357B0 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 257B4 800357B4 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 257B8 800357B8 21200002 */   addu      $a0, $s0, $zero
    /* 257BC 800357BC 21200002 */  addu       $a0, $s0, $zero
    /* 257C0 800357C0 10000524 */  addiu      $a1, $zero, 0x10
    /* 257C4 800357C4 20000624 */  addiu      $a2, $zero, 0x20
    /* 257C8 800357C8 18010724 */  addiu      $a3, $zero, 0x118
    /* 257CC 800357CC B0000224 */  addiu      $v0, $zero, 0xB0
    /* 257D0 800357D0 B82F020C */  jal        Back__6Dialogiiii
    /* 257D4 800357D4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 257D8 800357D8 1280033C */  lui        $v1, %hi(options_pad)
    /* 257DC 800357DC 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 257E0 800357E0 10000224 */  addiu      $v0, $zero, 0x10
    /* 257E4 800357E4 740F82A7 */  sh         $v0, %gp_rel(CSRect)($gp)
    /* 257E8 800357E8 20000224 */  addiu      $v0, $zero, 0x20
    /* 257EC 800357EC 760F82A7 */  sh         $v0, %gp_rel(CSRect + 0x2)($gp)
    /* 257F0 800357F0 18010224 */  addiu      $v0, $zero, 0x118
    /* 257F4 800357F4 780F82A7 */  sh         $v0, %gp_rel(D_8011B6F8)($gp)
    /* 257F8 800357F8 B0000224 */  addiu      $v0, $zero, 0xB0
    /* 257FC 800357FC 7A0F82A7 */  sh         $v0, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 25800 80035800 40100300 */  sll        $v0, $v1, 1
    /* 25804 80035804 21104300 */  addu       $v0, $v0, $v1
    /* 25808 80035808 80100200 */  sll        $v0, $v0, 2
    /* 2580C 8003580C 21104300 */  addu       $v0, $v0, $v1
    /* 25810 80035810 00110200 */  sll        $v0, $v0, 4
    /* 25814 80035814 23104300 */  subu       $v0, $v0, $v1
    /* 25818 80035818 80100200 */  sll        $v0, $v0, 2
    /* 2581C 8003581C 21104300 */  addu       $v0, $v0, $v1
    /* 25820 80035820 C0100200 */  sll        $v0, $v0, 3
    /* 25824 80035824 0E80013C */  lui        $at, %hi(plr + 0x108)
    /* 25828 80035828 21082200 */  addu       $at, $at, $v0
    /* 2582C 8003582C 40A6228C */  lw         $v0, %lo(plr + 0x108)($at)
    /* 25830 80035830 00000000 */  nop
    /* 25834 80035834 06004018 */  blez       $v0, .L80035850
    /* 25838 80035838 A0040424 */   addiu     $a0, $zero, 0x4A0
    /* 2583C 8003583C E80E828F */  lw         $v0, %gp_rel(D_8011B668)($gp)
    /* 25840 80035840 00000000 */  nop
    /* 25844 80035844 02004010 */  beqz       $v0, .L80035850
    /* 25848 80035848 00000000 */   nop
    /* 2584C 8003584C E6040424 */  addiu      $a0, $zero, 0x4E6
  .L80035850:
    /* 25850 80035850 349A020C */  jal        PrintSelectBack__FUs
    /* 25854 80035854 00000000 */   nop
    /* 25858 80035858 CDD0000C */  jal        DrawArrows__Fv
    /* 2585C 8003585C 00000000 */   nop
    /* 25860 80035860 1280023C */  lui        $v0, %hi(options_pad)
    /* 25864 80035864 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 25868 80035868 00000000 */  nop
    /* 2586C 8003586C 40180200 */  sll        $v1, $v0, 1
    /* 25870 80035870 21186200 */  addu       $v1, $v1, $v0
    /* 25874 80035874 80180300 */  sll        $v1, $v1, 2
    /* 25878 80035878 21186200 */  addu       $v1, $v1, $v0
    /* 2587C 8003587C 00190300 */  sll        $v1, $v1, 4
    /* 25880 80035880 23186200 */  subu       $v1, $v1, $v0
    /* 25884 80035884 80180300 */  sll        $v1, $v1, 2
    /* 25888 80035888 21186200 */  addu       $v1, $v1, $v0
    /* 2588C 8003588C C0180300 */  sll        $v1, $v1, 3
    /* 25890 80035890 0E80013C */  lui        $at, %hi(plr + 0x108)
    /* 25894 80035894 21082300 */  addu       $at, $at, $v1
    /* 25898 80035898 40A6228C */  lw         $v0, %lo(plr + 0x108)($at)
    /* 2589C 8003589C 00000000 */  nop
    /* 258A0 800358A0 5A004018 */  blez       $v0, .L80035A0C
    /* 258A4 800358A4 00000000 */   nop
    /* 258A8 800358A8 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 258AC 800358AC 21082300 */  addu       $at, $at, $v1
    /* 258B0 800358B0 2EA62280 */  lb         $v0, %lo(plr + 0xF6)($at)
    /* 258B4 800358B4 00000000 */  nop
    /* 258B8 800358B8 00810200 */  sll        $s0, $v0, 4
    /* 258BC 800358BC 0E80013C */  lui        $at, %hi(plr + 0xFA)
    /* 258C0 800358C0 21082300 */  addu       $at, $at, $v1
    /* 258C4 800358C4 32A62284 */  lh         $v0, %lo(plr + 0xFA)($at)
    /* 258C8 800358C8 0E80013C */  lui        $at, %hi(MaxStats)
    /* 258CC 800358CC 21083000 */  addu       $at, $at, $s0
    /* 258D0 800358D0 38A4238C */  lw         $v1, %lo(MaxStats)($at)
    /* 258D4 800358D4 00000000 */  nop
    /* 258D8 800358D8 2A104300 */  slt        $v0, $v0, $v1
    /* 258DC 800358DC 03004010 */  beqz       $v0, .L800358EC
    /* 258E0 800358E0 21200000 */   addu      $a0, $zero, $zero
    /* 258E4 800358E4 A4CF000C */  jal        DrawPlus__Fii
    /* 258E8 800358E8 21280000 */   addu      $a1, $zero, $zero
  .L800358EC:
    /* 258EC 800358EC 1280033C */  lui        $v1, %hi(options_pad)
    /* 258F0 800358F0 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 258F4 800358F4 00000000 */  nop
    /* 258F8 800358F8 40100300 */  sll        $v0, $v1, 1
    /* 258FC 800358FC 21104300 */  addu       $v0, $v0, $v1
    /* 25900 80035900 80100200 */  sll        $v0, $v0, 2
    /* 25904 80035904 21104300 */  addu       $v0, $v0, $v1
    /* 25908 80035908 00110200 */  sll        $v0, $v0, 4
    /* 2590C 8003590C 23104300 */  subu       $v0, $v0, $v1
    /* 25910 80035910 80100200 */  sll        $v0, $v0, 2
    /* 25914 80035914 21104300 */  addu       $v0, $v0, $v1
    /* 25918 80035918 C0100200 */  sll        $v0, $v0, 3
    /* 2591C 8003591C 0E80013C */  lui        $at, %hi(plr + 0xFE)
    /* 25920 80035920 21082200 */  addu       $at, $at, $v0
    /* 25924 80035924 36A62284 */  lh         $v0, %lo(plr + 0xFE)($at)
    /* 25928 80035928 0E80013C */  lui        $at, %hi(MaxStats + 0x4)
    /* 2592C 8003592C 21083000 */  addu       $at, $at, $s0
    /* 25930 80035930 3CA4238C */  lw         $v1, %lo(MaxStats + 0x4)($at)
    /* 25934 80035934 00000000 */  nop
    /* 25938 80035938 2A104300 */  slt        $v0, $v0, $v1
    /* 2593C 8003593C 03004010 */  beqz       $v0, .L8003594C
    /* 25940 80035940 01000424 */   addiu     $a0, $zero, 0x1
    /* 25944 80035944 A4CF000C */  jal        DrawPlus__Fii
    /* 25948 80035948 21280000 */   addu      $a1, $zero, $zero
  .L8003594C:
    /* 2594C 8003594C 1280033C */  lui        $v1, %hi(options_pad)
    /* 25950 80035950 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 25954 80035954 00000000 */  nop
    /* 25958 80035958 40100300 */  sll        $v0, $v1, 1
    /* 2595C 8003595C 21104300 */  addu       $v0, $v0, $v1
    /* 25960 80035960 80100200 */  sll        $v0, $v0, 2
    /* 25964 80035964 21104300 */  addu       $v0, $v0, $v1
    /* 25968 80035968 00110200 */  sll        $v0, $v0, 4
    /* 2596C 8003596C 23104300 */  subu       $v0, $v0, $v1
    /* 25970 80035970 80100200 */  sll        $v0, $v0, 2
    /* 25974 80035974 21104300 */  addu       $v0, $v0, $v1
    /* 25978 80035978 C0100200 */  sll        $v0, $v0, 3
    /* 2597C 8003597C 0E80013C */  lui        $at, %hi(plr + 0x102)
    /* 25980 80035980 21082200 */  addu       $at, $at, $v0
    /* 25984 80035984 3AA62284 */  lh         $v0, %lo(plr + 0x102)($at)
    /* 25988 80035988 0E80013C */  lui        $at, %hi(MaxStats + 0x8)
    /* 2598C 8003598C 21083000 */  addu       $at, $at, $s0
    /* 25990 80035990 40A4238C */  lw         $v1, %lo(MaxStats + 0x8)($at)
    /* 25994 80035994 00000000 */  nop
    /* 25998 80035998 2A104300 */  slt        $v0, $v0, $v1
    /* 2599C 8003599C 03004010 */  beqz       $v0, .L800359AC
    /* 259A0 800359A0 02000424 */   addiu     $a0, $zero, 0x2
    /* 259A4 800359A4 A4CF000C */  jal        DrawPlus__Fii
    /* 259A8 800359A8 21280000 */   addu      $a1, $zero, $zero
  .L800359AC:
    /* 259AC 800359AC 1280033C */  lui        $v1, %hi(options_pad)
    /* 259B0 800359B0 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 259B4 800359B4 00000000 */  nop
    /* 259B8 800359B8 40100300 */  sll        $v0, $v1, 1
    /* 259BC 800359BC 21104300 */  addu       $v0, $v0, $v1
    /* 259C0 800359C0 80100200 */  sll        $v0, $v0, 2
    /* 259C4 800359C4 21104300 */  addu       $v0, $v0, $v1
    /* 259C8 800359C8 00110200 */  sll        $v0, $v0, 4
    /* 259CC 800359CC 23104300 */  subu       $v0, $v0, $v1
    /* 259D0 800359D0 80100200 */  sll        $v0, $v0, 2
    /* 259D4 800359D4 21104300 */  addu       $v0, $v0, $v1
    /* 259D8 800359D8 C0100200 */  sll        $v0, $v0, 3
    /* 259DC 800359DC 0E80013C */  lui        $at, %hi(plr + 0x106)
    /* 259E0 800359E0 21082200 */  addu       $at, $at, $v0
    /* 259E4 800359E4 3EA62284 */  lh         $v0, %lo(plr + 0x106)($at)
    /* 259E8 800359E8 0E80013C */  lui        $at, %hi(MaxStats + 0xC)
    /* 259EC 800359EC 21083000 */  addu       $at, $at, $s0
    /* 259F0 800359F0 44A4238C */  lw         $v1, %lo(MaxStats + 0xC)($at)
    /* 259F4 800359F4 00000000 */  nop
    /* 259F8 800359F8 2A104300 */  slt        $v0, $v0, $v1
    /* 259FC 800359FC 03004010 */  beqz       $v0, .L80035A0C
    /* 25A00 80035A00 03000424 */   addiu     $a0, $zero, 0x3
    /* 25A04 80035A04 A4CF000C */  jal        DrawPlus__Fii
    /* 25A08 80035A08 21280000 */   addu      $a1, $zero, $zero
  .L80035A0C:
    /* 25A0C 80035A0C E40E8293 */  lbu        $v0, %gp_rel(D_8011B664)($gp)
    /* 25A10 80035A10 18000324 */  addiu      $v1, $zero, 0x18
    /* 25A14 80035A14 01004224 */  addiu      $v0, $v0, 0x1
    /* 25A18 80035A18 E40E82A3 */  sb         $v0, %gp_rel(D_8011B664)($gp)
    /* 25A1C 80035A1C 00160200 */  sll        $v0, $v0, 24
    /* 25A20 80035A20 03160200 */  sra        $v0, $v0, 24
    /* 25A24 80035A24 02004314 */  bne        $v0, $v1, .L80035A30
    /* 25A28 80035A28 00000000 */   nop
    /* 25A2C 80035A2C E40E80A3 */  sb         $zero, %gp_rel(D_8011B664)($gp)
  .L80035A30:
    /* 25A30 80035A30 1280043C */  lui        $a0, %hi(options_pad)
    /* 25A34 80035A34 50B2848C */  lw         $a0, %lo(options_pad)($a0)
    /* 25A38 80035A38 FD25020C */  jal        PAD_GetPad__FiUc
    /* 25A3C 80035A3C 21280000 */   addu      $a1, $zero, $zero
    /* 25A40 80035A40 21884000 */  addu       $s1, $v0, $zero
    /* 25A44 80035A44 21202002 */  addu       $a0, $s1, $zero
    /* 25A48 80035A48 83DD000C */  jal        SetPadTick__4CPadUs
    /* 25A4C 80035A4C 0A000524 */   addiu     $a1, $zero, 0xA
    /* 25A50 80035A50 21202002 */  addu       $a0, $s1, $zero
    /* 25A54 80035A54 81DD000C */  jal        SetPadTickMask__4CPadUs
    /* 25A58 80035A58 0F000524 */   addiu     $a1, $zero, 0xF
    /* 25A5C 80035A5C 6DDD000C */  jal        GetTick__C4CPad
    /* 25A60 80035A60 21202002 */   addu      $a0, $s1, $zero
    /* 25A64 80035A64 04004230 */  andi       $v0, $v0, 0x4
    /* 25A68 80035A68 08004010 */  beqz       $v0, .L80035A8C
    /* 25A6C 80035A6C 00000000 */   nop
    /* 25A70 80035A70 E80E828F */  lw         $v0, %gp_rel(D_8011B668)($gp)
    /* 25A74 80035A74 00000000 */  nop
    /* 25A78 80035A78 03004010 */  beqz       $v0, .L80035A88
    /* 25A7C 80035A7C 00000000 */   nop
    /* 25A80 80035A80 C6F5000C */  jal        PlaySFX__Fi
    /* 25A84 80035A84 32000424 */   addiu     $a0, $zero, 0x32
  .L80035A88:
    /* 25A88 80035A88 E80E80AF */  sw         $zero, %gp_rel(D_8011B668)($gp)
  .L80035A8C:
    /* 25A8C 80035A8C 6DDD000C */  jal        GetTick__C4CPad
    /* 25A90 80035A90 21202002 */   addu      $a0, $s1, $zero
    /* 25A94 80035A94 08004230 */  andi       $v0, $v0, 0x8
    /* 25A98 80035A98 09004010 */  beqz       $v0, .L80035AC0
    /* 25A9C 80035A9C 00000000 */   nop
    /* 25AA0 80035AA0 E80E828F */  lw         $v0, %gp_rel(D_8011B668)($gp)
    /* 25AA4 80035AA4 00000000 */  nop
    /* 25AA8 80035AA8 04004014 */  bnez       $v0, .L80035ABC
    /* 25AAC 80035AAC 40010224 */   addiu     $v0, $zero, 0x140
    /* 25AB0 80035AB0 C6F5000C */  jal        PlaySFX__Fi
    /* 25AB4 80035AB4 32000424 */   addiu     $a0, $zero, 0x32
    /* 25AB8 80035AB8 40010224 */  addiu      $v0, $zero, 0x140
  .L80035ABC:
    /* 25ABC 80035ABC E80E82AF */  sw         $v0, %gp_rel(D_8011B668)($gp)
  .L80035AC0:
    /* 25AC0 80035AC0 850F8293 */  lbu        $v0, %gp_rel(chrbtnactive)($gp)
    /* 25AC4 80035AC4 00000000 */  nop
    /* 25AC8 80035AC8 18004010 */  beqz       $v0, .L80035B2C
    /* 25ACC 80035ACC 40010224 */   addiu     $v0, $zero, 0x140
    /* 25AD0 80035AD0 E80E838F */  lw         $v1, %gp_rel(D_8011B668)($gp)
    /* 25AD4 80035AD4 00000000 */  nop
    /* 25AD8 80035AD8 14006214 */  bne        $v1, $v0, .L80035B2C
    /* 25ADC 80035ADC 00000000 */   nop
    /* 25AE0 80035AE0 DC0E928F */  lw         $s2, %gp_rel(D_8011B65C)($gp)
    /* 25AE4 80035AE4 6DDD000C */  jal        GetTick__C4CPad
    /* 25AE8 80035AE8 21202002 */   addu      $a0, $s1, $zero
    /* 25AEC 80035AEC 01004230 */  andi       $v0, $v0, 0x1
    /* 25AF0 80035AF0 23800200 */  negu       $s0, $v0
    /* 25AF4 80035AF4 6DDD000C */  jal        GetTick__C4CPad
    /* 25AF8 80035AF8 21202002 */   addu      $a0, $s1, $zero
    /* 25AFC 80035AFC 02004230 */  andi       $v0, $v0, 0x2
    /* 25B00 80035B00 02004010 */  beqz       $v0, .L80035B0C
    /* 25B04 80035B04 00000000 */   nop
    /* 25B08 80035B08 01001024 */  addiu      $s0, $zero, 0x1
  .L80035B0C:
    /* 25B0C 80035B0C 0AD0000C */  jal        ChrCheckValidButton__Fi
    /* 25B10 80035B10 21200002 */   addu      $a0, $s0, $zero
    /* 25B14 80035B14 DC0E828F */  lw         $v0, %gp_rel(D_8011B65C)($gp)
    /* 25B18 80035B18 00000000 */  nop
    /* 25B1C 80035B1C 03004212 */  beq        $s2, $v0, .L80035B2C
    /* 25B20 80035B20 00000000 */   nop
    /* 25B24 80035B24 C6F5000C */  jal        PlaySFX__Fi
    /* 25B28 80035B28 32000424 */   addiu     $a0, $zero, 0x32
  .L80035B2C:
    /* 25B2C 80035B2C 6400BF8F */  lw         $ra, 0x64($sp)
    /* 25B30 80035B30 6000B28F */  lw         $s2, 0x60($sp)
    /* 25B34 80035B34 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 25B38 80035B38 5800B08F */  lw         $s0, 0x58($sp)
    /* 25B3C 80035B3C 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 25B40 80035B40 0800E003 */  jr         $ra
    /* 25B44 80035B44 00000000 */   nop
endlabel DrawChr__Fv
