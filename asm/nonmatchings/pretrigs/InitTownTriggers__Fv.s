.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTownTriggers__Fv, 0x360

glabel InitTownTriggers__Fv
    /* 285D8 801621D0 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 285DC 801621D4 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 285E0 801621D8 19000224 */  addiu      $v0, $zero, 0x19
    /* 285E4 801621DC 0E80013C */  lui        $at, %hi(trigs)
    /* 285E8 801621E0 CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 285EC 801621E4 1D000224 */  addiu      $v0, $zero, 0x1D
    /* 285F0 801621E8 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 285F4 801621EC D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 285F8 801621F0 42000224 */  addiu      $v0, $zero, 0x42
    /* 285FC 801621F4 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28600 801621F8 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28604 801621FC 01000224 */  addiu      $v0, $zero, 0x1
    /* 28608 80162200 1280013C */  lui        $at, %hi(numtrigs)
    /* 2860C 80162204 78BB22AC */  sw         $v0, %lo(numtrigs)($at)
    /* 28610 80162208 04000224 */  addiu      $v0, $zero, 0x4
    /* 28614 8016220C 37006214 */  bne        $v1, $v0, .L801622EC
    /* 28618 80162210 02000324 */   addiu     $v1, $zero, 0x2
    /* 2861C 80162214 01000424 */  addiu      $a0, $zero, 0x1
    /* 28620 80162218 1280023C */  lui        $v0, %hi(townwarps + 0x2)
    /* 28624 8016221C 7EBB4224 */  addiu      $v0, $v0, %lo(townwarps + 0x2)
  .L80162220:
    /* 28628 80162220 000044A0 */  sb         $a0, 0x0($v0)
    /* 2862C 80162224 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 28630 80162228 FDFF6104 */  bgez       $v1, .L80162220
    /* 28634 8016222C FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 28638 80162230 47000324 */  addiu      $v1, $zero, 0x47
    /* 2863C 80162234 0E80013C */  lui        $at, %hi(trigs + 0x18)
    /* 28640 80162238 E43323AC */  sw         $v1, %lo(trigs + 0x18)($at)
    /* 28644 8016223C 0E80013C */  lui        $at, %hi(trigs + 0x28)
    /* 28648 80162240 F43323AC */  sw         $v1, %lo(trigs + 0x28)($at)
    /* 2864C 80162244 0E80013C */  lui        $at, %hi(trigs + 0x38)
    /* 28650 80162248 043423AC */  sw         $v1, %lo(trigs + 0x38)($at)
    /* 28654 8016224C 1280033C */  lui        $v1, %hi(numtrigs)
    /* 28658 80162250 78BB638C */  lw         $v1, %lo(numtrigs)($v1)
    /* 2865C 80162254 31000224 */  addiu      $v0, $zero, 0x31
    /* 28660 80162258 0E80013C */  lui        $at, %hi(trigs + 0x10)
    /* 28664 8016225C DC3322AC */  sw         $v0, %lo(trigs + 0x10)($at)
    /* 28668 80162260 15000224 */  addiu      $v0, $zero, 0x15
    /* 2866C 80162264 0E80013C */  lui        $at, %hi(trigs + 0x14)
    /* 28670 80162268 E03322AC */  sw         $v0, %lo(trigs + 0x14)($at)
    /* 28674 8016226C 05000224 */  addiu      $v0, $zero, 0x5
    /* 28678 80162270 0E80013C */  lui        $at, %hi(trigs + 0x1C)
    /* 2867C 80162274 E83322AC */  sw         $v0, %lo(trigs + 0x1C)($at)
    /* 28680 80162278 11000224 */  addiu      $v0, $zero, 0x11
    /* 28684 8016227C 0E80013C */  lui        $at, %hi(trigs + 0x20)
    /* 28688 80162280 EC3322AC */  sw         $v0, %lo(trigs + 0x20)($at)
    /* 2868C 80162284 45000224 */  addiu      $v0, $zero, 0x45
    /* 28690 80162288 0E80013C */  lui        $at, %hi(trigs + 0x24)
    /* 28694 8016228C F03322AC */  sw         $v0, %lo(trigs + 0x24)($at)
    /* 28698 80162290 09000224 */  addiu      $v0, $zero, 0x9
    /* 2869C 80162294 0E80013C */  lui        $at, %hi(trigs + 0x2C)
    /* 286A0 80162298 F83322AC */  sw         $v0, %lo(trigs + 0x2C)($at)
    /* 286A4 8016229C 29000224 */  addiu      $v0, $zero, 0x29
    /* 286A8 801622A0 0E80013C */  lui        $at, %hi(trigs + 0x30)
    /* 286AC 801622A4 FC3322AC */  sw         $v0, %lo(trigs + 0x30)($at)
    /* 286B0 801622A8 50000224 */  addiu      $v0, $zero, 0x50
    /* 286B4 801622AC 0E80013C */  lui        $at, %hi(trigs + 0x34)
    /* 286B8 801622B0 003422AC */  sw         $v0, %lo(trigs + 0x34)($at)
    /* 286BC 801622B4 0D000224 */  addiu      $v0, $zero, 0xD
    /* 286C0 801622B8 0E80013C */  lui        $at, %hi(trigs + 0x3C)
    /* 286C4 801622BC 083422AC */  sw         $v0, %lo(trigs + 0x3C)($at)
    /* 286C8 801622C0 01006224 */  addiu      $v0, $v1, 0x1
    /* 286CC 801622C4 1280013C */  lui        $at, %hi(numtrigs)
    /* 286D0 801622C8 78BB22AC */  sw         $v0, %lo(numtrigs)($at)
    /* 286D4 801622CC 02006224 */  addiu      $v0, $v1, 0x2
    /* 286D8 801622D0 03006324 */  addiu      $v1, $v1, 0x3
    /* 286DC 801622D4 1280013C */  lui        $at, %hi(numtrigs)
    /* 286E0 801622D8 78BB22AC */  sw         $v0, %lo(numtrigs)($at)
    /* 286E4 801622DC 1280013C */  lui        $at, %hi(numtrigs)
    /* 286E8 801622E0 78BB23AC */  sw         $v1, %lo(numtrigs)($at)
    /* 286EC 801622E4 45890508 */  j          .L80162514
    /* 286F0 801622E8 00000000 */   nop
  .L801622EC:
    /* 286F4 801622EC 1280023C */  lui        $v0, %hi(townwarps + 0x2)
    /* 286F8 801622F0 7EBB4224 */  addiu      $v0, $v0, %lo(townwarps + 0x2)
  .L801622F4:
    /* 286FC 801622F4 000040A0 */  sb         $zero, 0x0($v0)
    /* 28700 801622F8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 28704 801622FC FDFF6104 */  bgez       $v1, .L801622F4
    /* 28708 80162300 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 2870C 80162304 1280023C */  lui        $v0, %hi(myplr)
    /* 28710 80162308 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 28714 8016230C 00000000 */  nop
    /* 28718 80162310 40180200 */  sll        $v1, $v0, 1
    /* 2871C 80162314 21186200 */  addu       $v1, $v1, $v0
    /* 28720 80162318 80180300 */  sll        $v1, $v1, 2
    /* 28724 8016231C 21186200 */  addu       $v1, $v1, $v0
    /* 28728 80162320 00190300 */  sll        $v1, $v1, 4
    /* 2872C 80162324 23186200 */  subu       $v1, $v1, $v0
    /* 28730 80162328 80180300 */  sll        $v1, $v1, 2
    /* 28734 8016232C 21186200 */  addu       $v1, $v1, $v0
    /* 28738 80162330 C0180300 */  sll        $v1, $v1, 3
    /* 2873C 80162334 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 28740 80162338 21082300 */  addu       $at, $at, $v1
    /* 28744 8016233C 18BF2290 */  lbu        $v0, %lo(plr + 0x19E0)($at)
    /* 28748 80162340 00000000 */  nop
    /* 2874C 80162344 01004230 */  andi       $v0, $v0, 0x1
    /* 28750 80162348 1A004010 */  beqz       $v0, .L801623B4
    /* 28754 8016234C 31000224 */   addiu     $v0, $zero, 0x31
    /* 28758 80162350 1280043C */  lui        $a0, %hi(numtrigs)
    /* 2875C 80162354 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28760 80162358 00000000 */  nop
    /* 28764 8016235C 00190400 */  sll        $v1, $a0, 4
    /* 28768 80162360 0E80013C */  lui        $at, %hi(trigs)
    /* 2876C 80162364 21082300 */  addu       $at, $at, $v1
    /* 28770 80162368 CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 28774 8016236C 15000224 */  addiu      $v0, $zero, 0x15
    /* 28778 80162370 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 2877C 80162374 21082300 */  addu       $at, $at, $v1
    /* 28780 80162378 D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 28784 8016237C 47000224 */  addiu      $v0, $zero, 0x47
    /* 28788 80162380 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 2878C 80162384 21082300 */  addu       $at, $at, $v1
    /* 28790 80162388 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28794 8016238C 05000224 */  addiu      $v0, $zero, 0x5
    /* 28798 80162390 01008424 */  addiu      $a0, $a0, 0x1
    /* 2879C 80162394 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 287A0 80162398 21082300 */  addu       $at, $at, $v1
    /* 287A4 8016239C D83322AC */  sw         $v0, %lo(trigs + 0xC)($at)
    /* 287A8 801623A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 287AC 801623A4 1280013C */  lui        $at, %hi(numtrigs)
    /* 287B0 801623A8 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 287B4 801623AC 1280013C */  lui        $at, %hi(townwarps)
    /* 287B8 801623B0 7CBB22A0 */  sb         $v0, %lo(townwarps)($at)
  .L801623B4:
    /* 287BC 801623B4 1280023C */  lui        $v0, %hi(myplr)
    /* 287C0 801623B8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 287C4 801623BC 00000000 */  nop
    /* 287C8 801623C0 40180200 */  sll        $v1, $v0, 1
    /* 287CC 801623C4 21186200 */  addu       $v1, $v1, $v0
    /* 287D0 801623C8 80180300 */  sll        $v1, $v1, 2
    /* 287D4 801623CC 21186200 */  addu       $v1, $v1, $v0
    /* 287D8 801623D0 00190300 */  sll        $v1, $v1, 4
    /* 287DC 801623D4 23186200 */  subu       $v1, $v1, $v0
    /* 287E0 801623D8 80180300 */  sll        $v1, $v1, 2
    /* 287E4 801623DC 21186200 */  addu       $v1, $v1, $v0
    /* 287E8 801623E0 C0180300 */  sll        $v1, $v1, 3
    /* 287EC 801623E4 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 287F0 801623E8 21082300 */  addu       $at, $at, $v1
    /* 287F4 801623EC 18BF2290 */  lbu        $v0, %lo(plr + 0x19E0)($at)
    /* 287F8 801623F0 00000000 */  nop
    /* 287FC 801623F4 02004230 */  andi       $v0, $v0, 0x2
    /* 28800 801623F8 1A004010 */  beqz       $v0, .L80162464
    /* 28804 801623FC 11000224 */   addiu     $v0, $zero, 0x11
    /* 28808 80162400 1280043C */  lui        $a0, %hi(numtrigs)
    /* 2880C 80162404 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28810 80162408 00000000 */  nop
    /* 28814 8016240C 00190400 */  sll        $v1, $a0, 4
    /* 28818 80162410 0E80013C */  lui        $at, %hi(trigs)
    /* 2881C 80162414 21082300 */  addu       $at, $at, $v1
    /* 28820 80162418 CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 28824 8016241C 45000224 */  addiu      $v0, $zero, 0x45
    /* 28828 80162420 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 2882C 80162424 21082300 */  addu       $at, $at, $v1
    /* 28830 80162428 D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 28834 8016242C 47000224 */  addiu      $v0, $zero, 0x47
    /* 28838 80162430 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 2883C 80162434 21082300 */  addu       $at, $at, $v1
    /* 28840 80162438 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28844 8016243C 09000224 */  addiu      $v0, $zero, 0x9
    /* 28848 80162440 01008424 */  addiu      $a0, $a0, 0x1
    /* 2884C 80162444 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 28850 80162448 21082300 */  addu       $at, $at, $v1
    /* 28854 8016244C D83322AC */  sw         $v0, %lo(trigs + 0xC)($at)
    /* 28858 80162450 01000224 */  addiu      $v0, $zero, 0x1
    /* 2885C 80162454 1280013C */  lui        $at, %hi(numtrigs)
    /* 28860 80162458 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28864 8016245C 1280013C */  lui        $at, %hi(townwarps + 0x1)
    /* 28868 80162460 7DBB22A0 */  sb         $v0, %lo(townwarps + 0x1)($at)
  .L80162464:
    /* 2886C 80162464 1280023C */  lui        $v0, %hi(myplr)
    /* 28870 80162468 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 28874 8016246C 00000000 */  nop
    /* 28878 80162470 40180200 */  sll        $v1, $v0, 1
    /* 2887C 80162474 21186200 */  addu       $v1, $v1, $v0
    /* 28880 80162478 80180300 */  sll        $v1, $v1, 2
    /* 28884 8016247C 21186200 */  addu       $v1, $v1, $v0
    /* 28888 80162480 00190300 */  sll        $v1, $v1, 4
    /* 2888C 80162484 23186200 */  subu       $v1, $v1, $v0
    /* 28890 80162488 80180300 */  sll        $v1, $v1, 2
    /* 28894 8016248C 21186200 */  addu       $v1, $v1, $v0
    /* 28898 80162490 C0180300 */  sll        $v1, $v1, 3
    /* 2889C 80162494 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 288A0 80162498 21082300 */  addu       $at, $at, $v1
    /* 288A4 8016249C 18BF2290 */  lbu        $v0, %lo(plr + 0x19E0)($at)
    /* 288A8 801624A0 00000000 */  nop
    /* 288AC 801624A4 04004230 */  andi       $v0, $v0, 0x4
    /* 288B0 801624A8 1A004010 */  beqz       $v0, .L80162514
    /* 288B4 801624AC 29000224 */   addiu     $v0, $zero, 0x29
    /* 288B8 801624B0 1280043C */  lui        $a0, %hi(numtrigs)
    /* 288BC 801624B4 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 288C0 801624B8 00000000 */  nop
    /* 288C4 801624BC 00190400 */  sll        $v1, $a0, 4
    /* 288C8 801624C0 0E80013C */  lui        $at, %hi(trigs)
    /* 288CC 801624C4 21082300 */  addu       $at, $at, $v1
    /* 288D0 801624C8 CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 288D4 801624CC 50000224 */  addiu      $v0, $zero, 0x50
    /* 288D8 801624D0 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 288DC 801624D4 21082300 */  addu       $at, $at, $v1
    /* 288E0 801624D8 D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 288E4 801624DC 47000224 */  addiu      $v0, $zero, 0x47
    /* 288E8 801624E0 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 288EC 801624E4 21082300 */  addu       $at, $at, $v1
    /* 288F0 801624E8 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 288F4 801624EC 0D000224 */  addiu      $v0, $zero, 0xD
    /* 288F8 801624F0 01008424 */  addiu      $a0, $a0, 0x1
    /* 288FC 801624F4 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 28900 801624F8 21082300 */  addu       $at, $at, $v1
    /* 28904 801624FC D83322AC */  sw         $v0, %lo(trigs + 0xC)($at)
    /* 28908 80162500 01000224 */  addiu      $v0, $zero, 0x1
    /* 2890C 80162504 1280013C */  lui        $at, %hi(numtrigs)
    /* 28910 80162508 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28914 8016250C 1280013C */  lui        $at, %hi(townwarps + 0x2)
    /* 28918 80162510 7EBB22A0 */  sb         $v0, %lo(townwarps + 0x2)($at)
  .L80162514:
    /* 2891C 80162514 1280023C */  lui        $v0, %hi(sel_data)
    /* 28920 80162518 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 28924 8016251C 1280013C */  lui        $at, %hi(_trigflag)
    /* 28928 80162520 21082200 */  addu       $at, $at, $v0
    /* 2892C 80162524 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 28930 80162528 0800E003 */  jr         $ra
    /* 28934 8016252C 00000000 */   nop
endlabel InitTownTriggers__Fv
