.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceTownTrig__Fv, 0x1EC

glabel ForceTownTrig__Fv
    /* 6569C 8007569C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 656A0 800756A0 1280043C */  lui        $a0, %hi(cursmx)
    /* 656A4 800756A4 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 656A8 800756A8 1280053C */  lui        $a1, %hi(cursmy)
    /* 656AC 800756AC 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 656B0 800756B0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 656B4 800756B4 18D4010C */  jal        FindLevTrig__Fiii
    /* 656B8 800756B8 21300000 */   addu      $a2, $zero, $zero
    /* 656BC 800756BC 13004010 */  beqz       $v0, .L8007570C
    /* 656C0 800756C0 00000000 */   nop
    /* 656C4 800756C4 4AED010C */  jal        GetStr__Fi
    /* 656C8 800756C8 13010424 */   addiu     $a0, $zero, 0x113
    /* 656CC 800756CC 21284000 */  addu       $a1, $v0, $zero
    /* 656D0 800756D0 1280043C */  lui        $a0, %hi(sel_data)
    /* 656D4 800756D4 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 656D8 800756D8 0D80023C */  lui        $v0, %hi(_infostr)
    /* 656DC 800756DC 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 656E0 800756E0 00220400 */  sll        $a0, $a0, 8
    /* 656E4 800756E4 F240000C */  jal        strcpy
    /* 656E8 800756E8 21208200 */   addu      $a0, $a0, $v0
    /* 656EC 800756EC 19000324 */  addiu      $v1, $zero, 0x19
    /* 656F0 800756F0 1280013C */  lui        $at, %hi(cursmx)
    /* 656F4 800756F4 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 656F8 800756F8 1D000324 */  addiu      $v1, $zero, 0x1D
    /* 656FC 800756FC 1280013C */  lui        $at, %hi(cursmy)
    /* 65700 80075700 54B723AC */  sw         $v1, %lo(cursmy)($at)
    /* 65704 80075704 1ED60108 */  j          .L80075878
    /* 65708 80075708 01000224 */   addiu     $v0, $zero, 0x1
  .L8007570C:
    /* 6570C 8007570C FC138293 */  lbu        $v0, %gp_rel(townwarps)($gp)
    /* 65710 80075710 00000000 */  nop
    /* 65714 80075714 1B004010 */  beqz       $v0, .L80075784
    /* 65718 80075718 00000000 */   nop
    /* 6571C 8007571C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65720 80075720 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65724 80075724 1280053C */  lui        $a1, %hi(cursmy)
    /* 65728 80075728 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 6572C 8007572C 18D4010C */  jal        FindLevTrig__Fiii
    /* 65730 80075730 01000624 */   addiu     $a2, $zero, 0x1
    /* 65734 80075734 13004010 */  beqz       $v0, .L80075784
    /* 65738 80075738 00000000 */   nop
    /* 6573C 8007573C 4AED010C */  jal        GetStr__Fi
    /* 65740 80075740 10010424 */   addiu     $a0, $zero, 0x110
    /* 65744 80075744 21284000 */  addu       $a1, $v0, $zero
    /* 65748 80075748 1280043C */  lui        $a0, %hi(sel_data)
    /* 6574C 8007574C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 65750 80075750 0D80023C */  lui        $v0, %hi(_infostr)
    /* 65754 80075754 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 65758 80075758 00220400 */  sll        $a0, $a0, 8
    /* 6575C 8007575C F240000C */  jal        strcpy
    /* 65760 80075760 21208200 */   addu      $a0, $a0, $v0
    /* 65764 80075764 31000324 */  addiu      $v1, $zero, 0x31
    /* 65768 80075768 1280013C */  lui        $at, %hi(cursmx)
    /* 6576C 8007576C 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 65770 80075770 15000324 */  addiu      $v1, $zero, 0x15
    /* 65774 80075774 1280013C */  lui        $at, %hi(cursmy)
    /* 65778 80075778 54B723AC */  sw         $v1, %lo(cursmy)($at)
    /* 6577C 8007577C 1ED60108 */  j          .L80075878
    /* 65780 80075780 01000224 */   addiu     $v0, $zero, 0x1
  .L80075784:
    /* 65784 80075784 FD138293 */  lbu        $v0, %gp_rel(townwarps + 0x1)($gp)
    /* 65788 80075788 00000000 */  nop
    /* 6578C 8007578C 1B004010 */  beqz       $v0, .L800757FC
    /* 65790 80075790 00000000 */   nop
    /* 65794 80075794 1280043C */  lui        $a0, %hi(cursmx)
    /* 65798 80075798 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 6579C 8007579C 1280053C */  lui        $a1, %hi(cursmy)
    /* 657A0 800757A0 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 657A4 800757A4 18D4010C */  jal        FindLevTrig__Fiii
    /* 657A8 800757A8 02000624 */   addiu     $a2, $zero, 0x2
    /* 657AC 800757AC 13004010 */  beqz       $v0, .L800757FC
    /* 657B0 800757B0 00000000 */   nop
    /* 657B4 800757B4 4AED010C */  jal        GetStr__Fi
    /* 657B8 800757B8 11010424 */   addiu     $a0, $zero, 0x111
    /* 657BC 800757BC 21284000 */  addu       $a1, $v0, $zero
    /* 657C0 800757C0 1280043C */  lui        $a0, %hi(sel_data)
    /* 657C4 800757C4 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 657C8 800757C8 0D80023C */  lui        $v0, %hi(_infostr)
    /* 657CC 800757CC 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 657D0 800757D0 00220400 */  sll        $a0, $a0, 8
    /* 657D4 800757D4 F240000C */  jal        strcpy
    /* 657D8 800757D8 21208200 */   addu      $a0, $a0, $v0
    /* 657DC 800757DC 11000324 */  addiu      $v1, $zero, 0x11
    /* 657E0 800757E0 1280013C */  lui        $at, %hi(cursmx)
    /* 657E4 800757E4 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 657E8 800757E8 45000324 */  addiu      $v1, $zero, 0x45
    /* 657EC 800757EC 1280013C */  lui        $at, %hi(cursmy)
    /* 657F0 800757F0 54B723AC */  sw         $v1, %lo(cursmy)($at)
    /* 657F4 800757F4 1ED60108 */  j          .L80075878
    /* 657F8 800757F8 01000224 */   addiu     $v0, $zero, 0x1
  .L800757FC:
    /* 657FC 800757FC FE138293 */  lbu        $v0, %gp_rel(townwarps + 0x2)($gp)
    /* 65800 80075800 00000000 */  nop
    /* 65804 80075804 1C004010 */  beqz       $v0, .L80075878
    /* 65808 80075808 21100000 */   addu      $v0, $zero, $zero
    /* 6580C 8007580C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65810 80075810 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65814 80075814 1280053C */  lui        $a1, %hi(cursmy)
    /* 65818 80075818 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 6581C 8007581C 18D4010C */  jal        FindLevTrig__Fiii
    /* 65820 80075820 03000624 */   addiu     $a2, $zero, 0x3
    /* 65824 80075824 13004010 */  beqz       $v0, .L80075874
    /* 65828 80075828 00000000 */   nop
    /* 6582C 8007582C 4AED010C */  jal        GetStr__Fi
    /* 65830 80075830 14010424 */   addiu     $a0, $zero, 0x114
    /* 65834 80075834 21284000 */  addu       $a1, $v0, $zero
    /* 65838 80075838 1280043C */  lui        $a0, %hi(sel_data)
    /* 6583C 8007583C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 65840 80075840 0D80023C */  lui        $v0, %hi(_infostr)
    /* 65844 80075844 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 65848 80075848 00220400 */  sll        $a0, $a0, 8
    /* 6584C 8007584C F240000C */  jal        strcpy
    /* 65850 80075850 21208200 */   addu      $a0, $a0, $v0
    /* 65854 80075854 29000324 */  addiu      $v1, $zero, 0x29
    /* 65858 80075858 1280013C */  lui        $at, %hi(cursmx)
    /* 6585C 8007585C 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 65860 80075860 50000324 */  addiu      $v1, $zero, 0x50
    /* 65864 80075864 1280013C */  lui        $at, %hi(cursmy)
    /* 65868 80075868 54B723AC */  sw         $v1, %lo(cursmy)($at)
    /* 6586C 8007586C 1ED60108 */  j          .L80075878
    /* 65870 80075870 01000224 */   addiu     $v0, $zero, 0x1
  .L80075874:
    /* 65874 80075874 21100000 */  addu       $v0, $zero, $zero
  .L80075878:
    /* 65878 80075878 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6587C 8007587C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 65880 80075880 0800E003 */  jr         $ra
    /* 65884 80075884 00000000 */   nop
endlabel ForceTownTrig__Fv
