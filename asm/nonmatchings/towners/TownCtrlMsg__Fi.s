.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownCtrlMsg__Fi, 0xE8

glabel TownCtrlMsg__Fi
    /* 2B108 8003B108 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2B10C 8003B10C 40100400 */  sll        $v0, $a0, 1
    /* 2B110 8003B110 21104400 */  addu       $v0, $v0, $a0
    /* 2B114 8003B114 00110200 */  sll        $v0, $v0, 4
    /* 2B118 8003B118 21104400 */  addu       $v0, $v0, $a0
    /* 2B11C 8003B11C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2B120 8003B120 80880200 */  sll        $s1, $v0, 2
    /* 2B124 8003B124 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2B128 8003B128 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2B12C 8003B12C 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2B130 8003B130 21083100 */  addu       $at, $at, $s1
    /* 2B134 8003B134 CCFE228C */  lw         $v0, %lo(towner + 0x4C)($at)
    /* 2B138 8003B138 00000000 */  nop
    /* 2B13C 8003B13C 26004010 */  beqz       $v0, .L8003B1D8
    /* 2B140 8003B140 00000000 */   nop
    /* 2B144 8003B144 0D80013C */  lui        $at, %hi(towner + 0x88)
    /* 2B148 8003B148 21083100 */  addu       $at, $at, $s1
    /* 2B14C 8003B14C 08FF228C */  lw         $v0, %lo(towner + 0x88)($at)
    /* 2B150 8003B150 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2B154 8003B154 21083100 */  addu       $at, $at, $s1
    /* 2B158 8003B158 88FE248C */  lw         $a0, %lo(towner + 0x8)($at)
    /* 2B15C 8003B15C 40800200 */  sll        $s0, $v0, 1
    /* 2B160 8003B160 21800202 */  addu       $s0, $s0, $v0
    /* 2B164 8003B164 80801000 */  sll        $s0, $s0, 2
    /* 2B168 8003B168 21800202 */  addu       $s0, $s0, $v0
    /* 2B16C 8003B16C 00811000 */  sll        $s0, $s0, 4
    /* 2B170 8003B170 23800202 */  subu       $s0, $s0, $v0
    /* 2B174 8003B174 80801000 */  sll        $s0, $s0, 2
    /* 2B178 8003B178 21800202 */  addu       $s0, $s0, $v0
    /* 2B17C 8003B17C C0801000 */  sll        $s0, $s0, 3
    /* 2B180 8003B180 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 2B184 8003B184 21083000 */  addu       $at, $at, $s0
    /* 2B188 8003B188 68A52284 */  lh         $v0, %lo(plr + 0x30)($at)
    /* 2B18C 8003B18C 6D41000C */  jal        abs
    /* 2B190 8003B190 23208200 */   subu      $a0, $a0, $v0
    /* 2B194 8003B194 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 2B198 8003B198 21083000 */  addu       $at, $at, $s0
    /* 2B19C 8003B19C 6AA52384 */  lh         $v1, %lo(plr + 0x32)($at)
    /* 2B1A0 8003B1A0 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2B1A4 8003B1A4 21083100 */  addu       $at, $at, $s1
    /* 2B1A8 8003B1A8 8CFE248C */  lw         $a0, %lo(towner + 0xC)($at)
    /* 2B1AC 8003B1AC 21804000 */  addu       $s0, $v0, $zero
    /* 2B1B0 8003B1B0 6D41000C */  jal        abs
    /* 2B1B4 8003B1B4 23208300 */   subu      $a0, $a0, $v1
    /* 2B1B8 8003B1B8 0200102A */  slti       $s0, $s0, 0x2
    /* 2B1BC 8003B1BC 03000012 */  beqz       $s0, .L8003B1CC
    /* 2B1C0 8003B1C0 02004228 */   slti      $v0, $v0, 0x2
    /* 2B1C4 8003B1C4 04004014 */  bnez       $v0, .L8003B1D8
    /* 2B1C8 8003B1C8 00000000 */   nop
  .L8003B1CC:
    /* 2B1CC 8003B1CC 0D80013C */  lui        $at, %hi(towner + 0x4C)
    /* 2B1D0 8003B1D0 21083100 */  addu       $at, $at, $s1
    /* 2B1D4 8003B1D4 CCFE20AC */  sw         $zero, %lo(towner + 0x4C)($at)
  .L8003B1D8:
    /* 2B1D8 8003B1D8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2B1DC 8003B1DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 2B1E0 8003B1E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 2B1E4 8003B1E4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2B1E8 8003B1E8 0800E003 */  jr         $ra
    /* 2B1EC 8003B1EC 00000000 */   nop
endlabel TownCtrlMsg__Fi
