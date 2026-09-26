.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnGolum__Fiiii, 0x230

glabel SpawnGolum__Fiiii
    /* 1CB24 8015671C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1CB28 80156720 5555083C */  lui        $t0, (0x55555556 >> 16)
    /* 1CB2C 80156724 C0180600 */  sll        $v1, $a2, 3
    /* 1CB30 80156728 C0100500 */  sll        $v0, $a1, 3
    /* 1CB34 8015672C 23104500 */  subu       $v0, $v0, $a1
    /* 1CB38 80156730 C0110200 */  sll        $v0, $v0, 7
    /* 1CB3C 80156734 21186200 */  addu       $v1, $v1, $v0
    /* 1CB40 80156738 01008224 */  addiu      $v0, $a0, 0x1
    /* 1CB44 8015673C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1CB48 80156740 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1CB4C 80156744 0E80013C */  lui        $at, %hi(dung_map)
    /* 1CB50 80156748 21082300 */  addu       $at, $at, $v1
    /* 1CB54 8015674C 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 1CB58 80156750 40180400 */  sll        $v1, $a0, 1
    /* 1CB5C 80156754 21186400 */  addu       $v1, $v1, $a0
    /* 1CB60 80156758 80180300 */  sll        $v1, $v1, 2
    /* 1CB64 8015675C 21186400 */  addu       $v1, $v1, $a0
    /* 1CB68 80156760 C0800300 */  sll        $s0, $v1, 3
    /* 1CB6C 80156764 00190300 */  sll        $v1, $v1, 4
    /* 1CB70 80156768 23186400 */  subu       $v1, $v1, $a0
    /* 1CB74 8015676C 80180300 */  sll        $v1, $v1, 2
    /* 1CB78 80156770 21186400 */  addu       $v1, $v1, $a0
    /* 1CB7C 80156774 C0180300 */  sll        $v1, $v1, 3
    /* 1CB80 80156778 56550835 */  ori        $t0, $t0, (0x55555556 & 0xFFFF)
    /* 1CB84 8015677C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1CB88 80156780 21083000 */  addu       $at, $at, $s0
    /* 1CB8C 80156784 C85325A0 */  sb         $a1, %lo(monster + 0x34)($at)
    /* 1CB90 80156788 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1CB94 8015678C 21083000 */  addu       $at, $at, $s0
    /* 1CB98 80156790 C95326A0 */  sb         $a2, %lo(monster + 0x35)($at)
    /* 1CB9C 80156794 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1CBA0 80156798 21083000 */  addu       $at, $at, $s0
    /* 1CBA4 8015679C CA5325A0 */  sb         $a1, %lo(monster + 0x36)($at)
    /* 1CBA8 801567A0 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1CBAC 801567A4 21083000 */  addu       $at, $at, $s0
    /* 1CBB0 801567A8 CB5326A0 */  sb         $a2, %lo(monster + 0x37)($at)
    /* 1CBB4 801567AC 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 1CBB8 801567B0 21083000 */  addu       $at, $at, $s0
    /* 1CBBC 801567B4 CC5325A0 */  sb         $a1, %lo(monster + 0x38)($at)
    /* 1CBC0 801567B8 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 1CBC4 801567BC 21083000 */  addu       $at, $at, $s0
    /* 1CBC8 801567C0 CD5326A0 */  sb         $a2, %lo(monster + 0x39)($at)
    /* 1CBCC 801567C4 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 1CBD0 801567C8 21082300 */  addu       $at, $at, $v1
    /* 1CBD4 801567CC 6CA6258C */  lw         $a1, %lo(plr + 0x134)($at)
    /* 1CBD8 801567D0 19000224 */  addiu      $v0, $zero, 0x19
    /* 1CBDC 801567D4 1800A800 */  mult       $a1, $t0
    /* 1CBE0 801567D8 80400700 */  sll        $t0, $a3, 2
    /* 1CBE4 801567DC 21400701 */  addu       $t0, $t0, $a3
    /* 1CBE8 801567E0 80400800 */  sll        $t0, $t0, 2
    /* 1CBEC 801567E4 23400701 */  subu       $t0, $t0, $a3
    /* 1CBF0 801567E8 80400800 */  sll        $t0, $t0, 2
    /* 1CBF4 801567EC 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 1CBF8 801567F0 21082800 */  addu       $at, $at, $t0
    /* 1CBFC 801567F4 982C2680 */  lb         $a2, %lo(missile + 0x40)($at)
    /* 1CC00 801567F8 C32F0500 */  sra        $a1, $a1, 31
    /* 1CC04 801567FC 1080013C */  lui        $at, %hi(monster + 0x48)
    /* 1CC08 80156800 21083000 */  addu       $at, $at, $s0
    /* 1CC0C 80156804 DC5322A0 */  sb         $v0, %lo(monster + 0x48)($at)
    /* 1CC10 80156808 40120600 */  sll        $v0, $a2, 9
    /* 1CC14 8015680C C0310600 */  sll        $a2, $a2, 7
    /* 1CC18 80156810 21104600 */  addu       $v0, $v0, $a2
    /* 1CC1C 80156814 10480000 */  mfhi       $t1
    /* 1CC20 80156818 23282501 */  subu       $a1, $t1, $a1
    /* 1CC24 8015681C 40280500 */  sll        $a1, $a1, 1
    /* 1CC28 80156820 2128A200 */  addu       $a1, $a1, $v0
    /* 1CC2C 80156824 1080013C */  lui        $at, %hi(monster + 0x14)
    /* 1CC30 80156828 21083000 */  addu       $at, $at, $s0
    /* 1CC34 8015682C A85325AC */  sw         $a1, %lo(monster + 0x14)($at)
    /* 1CC38 80156830 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1CC3C 80156834 21083000 */  addu       $at, $at, $s0
    /* 1CC40 80156838 A45325AC */  sw         $a1, %lo(monster + 0x10)($at)
    /* 1CC44 8015683C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 1CC48 80156840 21082300 */  addu       $at, $at, $v1
    /* 1CC4C 80156844 74A62290 */  lbu        $v0, %lo(plr + 0x13C)($at)
    /* 1CC50 80156848 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 1CC54 8015684C 21082800 */  addu       $at, $at, $t0
    /* 1CC58 80156850 982C2390 */  lbu        $v1, %lo(missile + 0x40)($at)
    /* 1CC5C 80156854 40100200 */  sll        $v0, $v0, 1
    /* 1CC60 80156858 28004224 */  addiu      $v0, $v0, 0x28
    /* 1CC64 8015685C 80280300 */  sll        $a1, $v1, 2
    /* 1CC68 80156860 21186500 */  addu       $v1, $v1, $a1
    /* 1CC6C 80156864 21104300 */  addu       $v0, $v0, $v1
    /* 1CC70 80156868 1080013C */  lui        $at, %hi(monster + 0x50)
    /* 1CC74 8015686C 21083000 */  addu       $at, $at, $s0
    /* 1CC78 80156870 E45322A0 */  sb         $v0, %lo(monster + 0x50)($at)
    /* 1CC7C 80156874 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 1CC80 80156878 21082800 */  addu       $at, $at, $t0
    /* 1CC84 8015687C 982C2290 */  lbu        $v0, %lo(missile + 0x40)($at)
    /* 1CC88 80156880 00000000 */  nop
    /* 1CC8C 80156884 40100200 */  sll        $v0, $v0, 1
    /* 1CC90 80156888 08004224 */  addiu      $v0, $v0, 0x8
    /* 1CC94 8015688C 1080013C */  lui        $at, %hi(monster + 0x51)
    /* 1CC98 80156890 21083000 */  addu       $at, $at, $s0
    /* 1CC9C 80156894 E55322A0 */  sb         $v0, %lo(monster + 0x51)($at)
    /* 1CCA0 80156898 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1CCA4 8015689C 21083000 */  addu       $at, $at, $s0
    /* 1CCA8 801568A0 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 1CCAC 801568A4 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 1CCB0 801568A8 21082800 */  addu       $at, $at, $t0
    /* 1CCB4 801568AC 982C2390 */  lbu        $v1, %lo(missile + 0x40)($at)
    /* 1CCB8 801568B0 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 1CCBC 801568B4 21083000 */  addu       $at, $at, $s0
    /* 1CCC0 801568B8 D15320A0 */  sb         $zero, %lo(monster + 0x3D)($at)
    /* 1CCC4 801568BC 30004234 */  ori        $v0, $v0, 0x30
    /* 1CCC8 801568C0 40180300 */  sll        $v1, $v1, 1
    /* 1CCCC 801568C4 10006324 */  addiu      $v1, $v1, 0x10
    /* 1CCD0 801568C8 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1CCD4 801568CC 21083000 */  addu       $at, $at, $s0
    /* 1CCD8 801568D0 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 1CCDC 801568D4 1080013C */  lui        $at, %hi(monster + 0x52)
    /* 1CCE0 801568D8 21083000 */  addu       $at, $at, $s0
    /* 1CCE4 801568DC E65323A0 */  sb         $v1, %lo(monster + 0x52)($at)
    /* 1CCE8 801568E0 DD00020C */  jal        M_StartSpStand__Fii
    /* 1CCEC 801568E4 21280000 */   addu      $a1, $zero, $zero
    /* 1CCF0 801568E8 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1CCF4 801568EC 21083000 */  addu       $at, $at, $s0
    /* 1CCF8 801568F0 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1CCFC 801568F4 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1CD00 801568F8 21083000 */  addu       $at, $at, $s0
    /* 1CD04 801568FC C8532490 */  lbu        $a0, %lo(monster + 0x34)($at)
    /* 1CD08 80156900 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1CD0C 80156904 21083000 */  addu       $at, $at, $s0
    /* 1CD10 80156908 C9532590 */  lbu        $a1, %lo(monster + 0x35)($at)
    /* 1CD14 8015690C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1CD18 80156910 21083000 */  addu       $at, $at, $s0
    /* 1CD1C 80156914 D0532690 */  lbu        $a2, %lo(monster + 0x3C)($at)
    /* 1CD20 80156918 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 1CD24 8015691C 21083000 */  addu       $at, $at, $s0
    /* 1CD28 80156920 D1532790 */  lbu        $a3, %lo(monster + 0x3D)($at)
    /* 1CD2C 80156924 1280033C */  lui        $v1, %hi(currlevel)
    /* 1CD30 80156928 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1CD34 8015692C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1CD38 80156930 BE3D010C */  jal        NetSendCmdGolem__FUcUcUcUclUc
    /* 1CD3C 80156934 1400A3AF */   sw        $v1, 0x14($sp)
    /* 1CD40 80156938 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1CD44 8015693C 1800B08F */  lw         $s0, 0x18($sp)
    /* 1CD48 80156940 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1CD4C 80156944 0800E003 */  jr         $ra
    /* 1CD50 80156948 00000000 */   nop
endlabel SpawnGolum__Fiiii
