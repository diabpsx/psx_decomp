.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveScroll__Fi, 0x1E4

glabel RemoveScroll__Fi
    /* 26204 8015FDFC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 26208 8015FE00 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2620C 8015FE04 21808000 */  addu       $s0, $a0, $zero
    /* 26210 8015FE08 40181000 */  sll        $v1, $s0, 1
    /* 26214 8015FE0C 21107000 */  addu       $v0, $v1, $s0
    /* 26218 8015FE10 80100200 */  sll        $v0, $v0, 2
    /* 2621C 8015FE14 21105000 */  addu       $v0, $v0, $s0
    /* 26220 8015FE18 00110200 */  sll        $v0, $v0, 4
    /* 26224 8015FE1C 23105000 */  subu       $v0, $v0, $s0
    /* 26228 8015FE20 80100200 */  sll        $v0, $v0, 2
    /* 2622C 8015FE24 21105000 */  addu       $v0, $v0, $s0
    /* 26230 8015FE28 C0100200 */  sll        $v0, $v0, 3
    /* 26234 8015FE2C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 26238 8015FE30 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2623C 8015FE34 21082200 */  addu       $at, $at, $v0
    /* 26240 8015FE38 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 26244 8015FE3C 00000000 */  nop
    /* 26248 8015FE40 36004018 */  blez       $v0, .L8015FF1C
    /* 2624C 8015FE44 21280000 */   addu      $a1, $zero, $zero
    /* 26250 8015FE48 21380000 */  addu       $a3, $zero, $zero
  .L8015FE4C:
    /* 26254 8015FE4C 21107000 */  addu       $v0, $v1, $s0
    /* 26258 8015FE50 80100200 */  sll        $v0, $v0, 2
    /* 2625C 8015FE54 21105000 */  addu       $v0, $v0, $s0
    /* 26260 8015FE58 00110200 */  sll        $v0, $v0, 4
    /* 26264 8015FE5C 23105000 */  subu       $v0, $v0, $s0
    /* 26268 8015FE60 80100200 */  sll        $v0, $v0, 2
    /* 2626C 8015FE64 21105000 */  addu       $v0, $v0, $s0
    /* 26270 8015FE68 C0300200 */  sll        $a2, $v0, 3
    /* 26274 8015FE6C 2120E600 */  addu       $a0, $a3, $a2
    /* 26278 8015FE70 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 2627C 8015FE74 21082400 */  addu       $at, $at, $a0
    /* 26280 8015FE78 08AA2384 */  lh         $v1, %lo(plr + 0x4D0)($at)
    /* 26284 8015FE7C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26288 8015FE80 16006210 */  beq        $v1, $v0, .L8015FEDC
    /* 2628C 8015FE84 00000000 */   nop
    /* 26290 8015FE88 0E80013C */  lui        $at, %hi(plr + 0x4F1)
    /* 26294 8015FE8C 21082400 */  addu       $at, $at, $a0
    /* 26298 8015FE90 29AA2290 */  lbu        $v0, %lo(plr + 0x4F1)($at)
    /* 2629C 8015FE94 00000000 */  nop
    /* 262A0 8015FE98 EBFF4224 */  addiu      $v0, $v0, -0x15
    /* 262A4 8015FE9C 0200422C */  sltiu      $v0, $v0, 0x2
    /* 262A8 8015FEA0 0F004010 */  beqz       $v0, .L8015FEE0
    /* 262AC 8015FEA4 40181000 */   sll       $v1, $s0, 1
    /* 262B0 8015FEA8 0E80013C */  lui        $at, %hi(plr + 0x4E1)
    /* 262B4 8015FEAC 21082400 */  addu       $at, $at, $a0
    /* 262B8 8015FEB0 19AA2380 */  lb         $v1, %lo(plr + 0x4E1)($at)
    /* 262BC 8015FEB4 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 262C0 8015FEB8 21082600 */  addu       $at, $at, $a2
    /* 262C4 8015FEBC 95A52280 */  lb         $v0, %lo(plr + 0x5D)($at)
    /* 262C8 8015FEC0 00000000 */  nop
    /* 262CC 8015FEC4 06006214 */  bne        $v1, $v0, .L8015FEE0
    /* 262D0 8015FEC8 40181000 */   sll       $v1, $s0, 1
    /* 262D4 8015FECC BF75050C */  jal        RemoveInvItem__Fii
    /* 262D8 8015FED0 21200002 */   addu      $a0, $s0, $zero
    /* 262DC 8015FED4 EB7F0508 */  j          .L8015FFAC
    /* 262E0 8015FED8 00000000 */   nop
  .L8015FEDC:
    /* 262E4 8015FEDC 40181000 */  sll        $v1, $s0, 1
  .L8015FEE0:
    /* 262E8 8015FEE0 21107000 */  addu       $v0, $v1, $s0
    /* 262EC 8015FEE4 80100200 */  sll        $v0, $v0, 2
    /* 262F0 8015FEE8 21105000 */  addu       $v0, $v0, $s0
    /* 262F4 8015FEEC 00110200 */  sll        $v0, $v0, 4
    /* 262F8 8015FEF0 23105000 */  subu       $v0, $v0, $s0
    /* 262FC 8015FEF4 80100200 */  sll        $v0, $v0, 2
    /* 26300 8015FEF8 21105000 */  addu       $v0, $v0, $s0
    /* 26304 8015FEFC C0100200 */  sll        $v0, $v0, 3
    /* 26308 8015FF00 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2630C 8015FF04 21082200 */  addu       $at, $at, $v0
    /* 26310 8015FF08 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 26314 8015FF0C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 26318 8015FF10 2A10A200 */  slt        $v0, $a1, $v0
    /* 2631C 8015FF14 CDFF4014 */  bnez       $v0, .L8015FE4C
    /* 26320 8015FF18 6C00E724 */   addiu     $a3, $a3, 0x6C
  .L8015FF1C:
    /* 26324 8015FF1C 21280000 */  addu       $a1, $zero, $zero
    /* 26328 8015FF20 40101000 */  sll        $v0, $s0, 1
    /* 2632C 8015FF24 21105000 */  addu       $v0, $v0, $s0
    /* 26330 8015FF28 80100200 */  sll        $v0, $v0, 2
    /* 26334 8015FF2C 21105000 */  addu       $v0, $v0, $s0
    /* 26338 8015FF30 00110200 */  sll        $v0, $v0, 4
    /* 2633C 8015FF34 23105000 */  subu       $v0, $v0, $s0
    /* 26340 8015FF38 80100200 */  sll        $v0, $v0, 2
    /* 26344 8015FF3C 21105000 */  addu       $v0, $v0, $s0
    /* 26348 8015FF40 C0200200 */  sll        $a0, $v0, 3
    /* 2634C 8015FF44 21308000 */  addu       $a2, $a0, $zero
  .L8015FF48:
    /* 26350 8015FF48 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 26354 8015FF4C 21082400 */  addu       $at, $at, $a0
    /* 26358 8015FF50 14BB2384 */  lh         $v1, %lo(plr + 0x15DC)($at)
    /* 2635C 8015FF54 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26360 8015FF58 18006210 */  beq        $v1, $v0, .L8015FFBC
    /* 26364 8015FF5C 00000000 */   nop
    /* 26368 8015FF60 0E80013C */  lui        $at, %hi(plr + 0x15FD)
    /* 2636C 8015FF64 21082400 */  addu       $at, $at, $a0
    /* 26370 8015FF68 35BB2290 */  lbu        $v0, %lo(plr + 0x15FD)($at)
    /* 26374 8015FF6C 00000000 */  nop
    /* 26378 8015FF70 EBFF4224 */  addiu      $v0, $v0, -0x15
    /* 2637C 8015FF74 0200422C */  sltiu      $v0, $v0, 0x2
    /* 26380 8015FF78 10004010 */  beqz       $v0, .L8015FFBC
    /* 26384 8015FF7C 00000000 */   nop
    /* 26388 8015FF80 0E80013C */  lui        $at, %hi(plr + 0x15ED)
    /* 2638C 8015FF84 21082400 */  addu       $at, $at, $a0
    /* 26390 8015FF88 25BB2380 */  lb         $v1, %lo(plr + 0x15ED)($at)
    /* 26394 8015FF8C 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 26398 8015FF90 21082600 */  addu       $at, $at, $a2
    /* 2639C 8015FF94 95A52280 */  lb         $v0, %lo(plr + 0x5D)($at)
    /* 263A0 8015FF98 00000000 */  nop
    /* 263A4 8015FF9C 07006214 */  bne        $v1, $v0, .L8015FFBC
    /* 263A8 8015FFA0 00000000 */   nop
    /* 263AC 8015FFA4 6B76050C */  jal        RemoveSpdBarItem__Fii
    /* 263B0 8015FFA8 21200002 */   addu      $a0, $s0, $zero
  .L8015FFAC:
    /* 263B4 8015FFAC 4CFC000C */  jal        CalcPlrScrolls__Fi
    /* 263B8 8015FFB0 21200002 */   addu      $a0, $s0, $zero
    /* 263BC 8015FFB4 F37F0508 */  j          .L8015FFCC
    /* 263C0 8015FFB8 00000000 */   nop
  .L8015FFBC:
    /* 263C4 8015FFBC 0100A524 */  addiu      $a1, $a1, 0x1
    /* 263C8 8015FFC0 0800A228 */  slti       $v0, $a1, 0x8
    /* 263CC 8015FFC4 E0FF4014 */  bnez       $v0, .L8015FF48
    /* 263D0 8015FFC8 6C008424 */   addiu     $a0, $a0, 0x6C
  .L8015FFCC:
    /* 263D4 8015FFCC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 263D8 8015FFD0 1800B08F */  lw         $s0, 0x18($sp)
    /* 263DC 8015FFD4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 263E0 8015FFD8 0800E003 */  jr         $ra
    /* 263E4 8015FFDC 00000000 */   nop
endlabel RemoveScroll__Fi
