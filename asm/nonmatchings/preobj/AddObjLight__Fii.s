.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddObjLight__Fii, 0xC8

glabel AddObjLight__Fii
    /* 1CBB8 801567B0 1280023C */  lui        $v0, %hi(leveltype)
    /* 1CBBC 801567B4 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 1CBC0 801567B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CBC4 801567BC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CBC8 801567C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CBCC 801567C4 1280013C */  lui        $at, %hi(level_lamp)
    /* 1CBD0 801567C8 21082200 */  addu       $at, $at, $v0
    /* 1CBD4 801567CC 0CB92280 */  lb         $v0, %lo(level_lamp)($at)
    /* 1CBD8 801567D0 00000000 */  nop
    /* 1CBDC 801567D4 23004010 */  beqz       $v0, .L80156864
    /* 1CBE0 801567D8 2130A000 */   addu      $a2, $a1, $zero
    /* 1CBE4 801567DC 1280023C */  lui        $v0, %hi(InitObjFlag)
    /* 1CBE8 801567E0 D0B94290 */  lbu        $v0, %lo(InitObjFlag)($v0)
    /* 1CBEC 801567E4 00000000 */  nop
    /* 1CBF0 801567E8 16004010 */  beqz       $v0, .L80156844
    /* 1CBF4 801567EC 40800400 */   sll       $s0, $a0, 1
    /* 1CBF8 801567F0 21800402 */  addu       $s0, $s0, $a0
    /* 1CBFC 801567F4 80801000 */  sll        $s0, $s0, 2
    /* 1CC00 801567F8 23800402 */  subu       $s0, $s0, $a0
    /* 1CC04 801567FC 80801000 */  sll        $s0, $s0, 2
    /* 1CC08 80156800 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 1CC0C 80156804 21083000 */  addu       $at, $at, $s0
    /* 1CC10 80156808 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 1CC14 8015680C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 1CC18 80156810 21083000 */  addu       $at, $at, $s0
    /* 1CC1C 80156814 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 1CC20 80156818 BA34010C */  jal        AddLight__Fiii
    /* 1CC24 8015681C 00000000 */   nop
    /* 1CC28 80156820 0E80013C */  lui        $at, %hi(object)
    /* 1CC2C 80156824 21083000 */  addu       $at, $at, $s0
    /* 1CC30 80156828 4C8C22A4 */  sh         $v0, %lo(object)($at)
    /* 1CC34 8015682C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1CC38 80156830 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1CC3C 80156834 21083000 */  addu       $at, $at, $s0
    /* 1CC40 80156838 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 1CC44 8015683C 195A0508 */  j          .L80156864
    /* 1CC48 80156840 00000000 */   nop
  .L80156844:
    /* 1CC4C 80156844 40100400 */  sll        $v0, $a0, 1
    /* 1CC50 80156848 21104400 */  addu       $v0, $v0, $a0
    /* 1CC54 8015684C 80100200 */  sll        $v0, $v0, 2
    /* 1CC58 80156850 23104400 */  subu       $v0, $v0, $a0
    /* 1CC5C 80156854 80100200 */  sll        $v0, $v0, 2
    /* 1CC60 80156858 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1CC64 8015685C 21082200 */  addu       $at, $at, $v0
    /* 1CC68 80156860 5A8C20A4 */  sh         $zero, %lo(object + 0xE)($at)
  .L80156864:
    /* 1CC6C 80156864 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CC70 80156868 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CC74 8015686C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CC78 80156870 0800E003 */  jr         $ra
    /* 1CC7C 80156874 00000000 */   nop
endlabel AddObjLight__Fii
