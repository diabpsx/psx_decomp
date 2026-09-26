.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBarrel__Fii, 0xA8

glabel AddBarrel__Fii
    /* 1CC80 80156878 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CC84 8015687C 40100400 */  sll        $v0, $a0, 1
    /* 1CC88 80156880 21104400 */  addu       $v0, $v0, $a0
    /* 1CC8C 80156884 80100200 */  sll        $v0, $v0, 2
    /* 1CC90 80156888 23104400 */  subu       $v0, $v0, $a0
    /* 1CC94 8015688C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CC98 80156890 80800200 */  sll        $s0, $v0, 2
    /* 1CC9C 80156894 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CCA0 80156898 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1CCA4 8015689C 21083000 */  addu       $at, $at, $s0
    /* 1CCA8 801568A0 5A8C20A4 */  sh         $zero, %lo(object + 0xE)($at)
    /* 1CCAC 801568A4 B7F6000C */  jal        GetRndSeed__Fv
    /* 1CCB0 801568A8 00000000 */   nop
    /* 1CCB4 801568AC 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1CCB8 801568B0 21083000 */  addu       $at, $at, $s0
    /* 1CCBC 801568B4 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1CCC0 801568B8 C9F6000C */  jal        ENG_random__Fl
    /* 1CCC4 801568BC 0A000424 */   addiu     $a0, $zero, 0xA
    /* 1CCC8 801568C0 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1CCCC 801568C4 21083000 */  addu       $at, $at, $s0
    /* 1CCD0 801568C8 5C8C22A4 */  sh         $v0, %lo(object + 0x10)($at)
    /* 1CCD4 801568CC C9F6000C */  jal        ENG_random__Fl
    /* 1CCD8 801568D0 03000424 */   addiu     $a0, $zero, 0x3
    /* 1CCDC 801568D4 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1CCE0 801568D8 21083000 */  addu       $at, $at, $s0
    /* 1CCE4 801568DC 5C8C2384 */  lh         $v1, %lo(object + 0x10)($at)
    /* 1CCE8 801568E0 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1CCEC 801568E4 21083000 */  addu       $at, $at, $s0
    /* 1CCF0 801568E8 5E8C22A4 */  sh         $v0, %lo(object + 0x12)($at)
    /* 1CCF4 801568EC 08006328 */  slti       $v1, $v1, 0x8
    /* 1CCF8 801568F0 06006014 */  bnez       $v1, .L8015690C
    /* 1CCFC 801568F4 00000000 */   nop
    /* 1CD00 801568F8 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 1CD04 801568FC 00000000 */   nop
    /* 1CD08 80156900 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1CD0C 80156904 21083000 */  addu       $at, $at, $s0
    /* 1CD10 80156908 608C22A4 */  sh         $v0, %lo(object + 0x14)($at)
  .L8015690C:
    /* 1CD14 8015690C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CD18 80156910 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CD1C 80156914 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CD20 80156918 0800E003 */  jr         $ra
    /* 1CD24 8015691C 00000000 */   nop
endlabel AddBarrel__Fii
