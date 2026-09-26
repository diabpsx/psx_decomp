.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_GetKnockback__Fii, 0x21C

glabel M_GetKnockback__Fii
    /* 114C4 8014B0BC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 114C8 8014B0C0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 114CC 8014B0C4 21A08000 */  addu       $s4, $a0, $zero
    /* 114D0 8014B0C8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 114D4 8014B0CC 2188A000 */  addu       $s1, $a1, $zero
    /* 114D8 8014B0D0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 114DC 8014B0D4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 114E0 8014B0D8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 114E4 8014B0DC EB53050C */  jal        DirOK__Fii
    /* 114E8 8014B0E0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 114EC 8014B0E4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 114F0 8014B0E8 72004010 */  beqz       $v0, .L8014B2B4
    /* 114F4 8014B0EC 00000000 */   nop
    /* 114F8 8014B0F0 D7FC010C */  jal        M_ClearSquares__Fi
    /* 114FC 8014B0F4 21208002 */   addu      $a0, $s4, $zero
    /* 11500 8014B0F8 40801400 */  sll        $s0, $s4, 1
    /* 11504 8014B0FC 21801402 */  addu       $s0, $s0, $s4
    /* 11508 8014B100 80801000 */  sll        $s0, $s0, 2
    /* 1150C 8014B104 21801402 */  addu       $s0, $s0, $s4
    /* 11510 8014B108 C0801000 */  sll        $s0, $s0, 3
    /* 11514 8014B10C 21208002 */  addu       $a0, $s4, $zero
    /* 11518 8014B110 03000724 */  addiu      $a3, $zero, 0x3
    /* 1151C 8014B114 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 11520 8014B118 21083000 */  addu       $at, $at, $s0
    /* 11524 8014B11C C8532290 */  lbu        $v0, %lo(monster + 0x34)($at)
    /* 11528 8014B120 1280013C */  lui        $at, %hi(offset_x)
    /* 1152C 8014B124 21083100 */  addu       $at, $at, $s1
    /* 11530 8014B128 A8C22390 */  lbu        $v1, %lo(offset_x)($at)
    /* 11534 8014B12C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 11538 8014B130 21083000 */  addu       $at, $at, $s0
    /* 1153C 8014B134 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 11540 8014B138 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11544 8014B13C 21083000 */  addu       $at, $at, $s0
    /* 11548 8014B140 D0532680 */  lb         $a2, %lo(monster + 0x3C)($at)
    /* 1154C 8014B144 21104300 */  addu       $v0, $v0, $v1
    /* 11550 8014B148 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 11554 8014B14C 21083000 */  addu       $at, $at, $s0
    /* 11558 8014B150 C85322A0 */  sb         $v0, %lo(monster + 0x34)($at)
    /* 1155C 8014B154 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 11560 8014B158 21083000 */  addu       $at, $at, $s0
    /* 11564 8014B15C C9532290 */  lbu        $v0, %lo(monster + 0x35)($at)
    /* 11568 8014B160 1280013C */  lui        $at, %hi(offset_y)
    /* 1156C 8014B164 21083100 */  addu       $at, $at, $s1
    /* 11570 8014B168 B0C22390 */  lbu        $v1, %lo(offset_y)($at)
    /* 11574 8014B16C 00000000 */  nop
    /* 11578 8014B170 21104300 */  addu       $v0, $v0, $v1
    /* 1157C 8014B174 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 11580 8014B178 21083000 */  addu       $at, $at, $s0
    /* 11584 8014B17C C95322A0 */  sb         $v0, %lo(monster + 0x35)($at)
    /* 11588 8014B180 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 1158C 8014B184 0A00A524 */   addiu     $a1, $a1, 0xA
    /* 11590 8014B188 1080133C */  lui        $s3, %hi(monster)
    /* 11594 8014B18C 94537326 */  addiu      $s3, $s3, %lo(monster)
    /* 11598 8014B190 21981302 */  addu       $s3, $s0, $s3
    /* 1159C 8014B194 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 115A0 8014B198 21083000 */  addu       $at, $at, $s0
    /* 115A4 8014B19C C8532390 */  lbu        $v1, %lo(monster + 0x34)($at)
    /* 115A8 8014B1A0 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 115AC 8014B1A4 21083000 */  addu       $at, $at, $s0
    /* 115B0 8014B1A8 C9532590 */  lbu        $a1, %lo(monster + 0x35)($at)
    /* 115B4 8014B1AC 34007282 */  lb         $s2, 0x34($s3)
    /* 115B8 8014B1B0 35007182 */  lb         $s1, 0x35($s3)
    /* 115BC 8014B1B4 05000224 */  addiu      $v0, $zero, 0x5
    /* 115C0 8014B1B8 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 115C4 8014B1BC 21083000 */  addu       $at, $at, $s0
    /* 115C8 8014B1C0 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 115CC 8014B1C4 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 115D0 8014B1C8 21083000 */  addu       $at, $at, $s0
    /* 115D4 8014B1CC CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 115D8 8014B1D0 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 115DC 8014B1D4 21083000 */  addu       $at, $at, $s0
    /* 115E0 8014B1D8 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 115E4 8014B1DC 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 115E8 8014B1E0 21083000 */  addu       $at, $at, $s0
    /* 115EC 8014B1E4 CC5323A0 */  sb         $v1, %lo(monster + 0x38)($at)
    /* 115F0 8014B1E8 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 115F4 8014B1EC 21083000 */  addu       $at, $at, $s0
    /* 115F8 8014B1F0 CD5325A0 */  sb         $a1, %lo(monster + 0x39)($at)
    /* 115FC 8014B1F4 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 11600 8014B1F8 21083000 */  addu       $at, $at, $s0
    /* 11604 8014B1FC CA5332A0 */  sb         $s2, %lo(monster + 0x36)($at)
    /* 11608 8014B200 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1160C 8014B204 21083000 */  addu       $at, $at, $s0
    /* 11610 8014B208 CB5331A0 */  sb         $s1, %lo(monster + 0x37)($at)
    /* 11614 8014B20C 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 11618 8014B210 21083000 */  addu       $at, $at, $s0
    /* 1161C 8014B214 CC5332A0 */  sb         $s2, %lo(monster + 0x38)($at)
    /* 11620 8014B218 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 11624 8014B21C 21083000 */  addu       $at, $at, $s0
    /* 11628 8014B220 CD5331A0 */  sb         $s1, %lo(monster + 0x39)($at)
    /* 1162C 8014B224 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 11630 8014B228 21208002 */   addu      $a0, $s4, $zero
    /* 11634 8014B22C D7FC010C */  jal        M_ClearSquares__Fi
    /* 11638 8014B230 21208002 */   addu      $a0, $s4, $zero
    /* 1163C 8014B234 C0881100 */  sll        $s1, $s1, 3
    /* 11640 8014B238 C0101200 */  sll        $v0, $s2, 3
    /* 11644 8014B23C 23105200 */  subu       $v0, $v0, $s2
    /* 11648 8014B240 C0110200 */  sll        $v0, $v0, 7
    /* 1164C 8014B244 21882202 */  addu       $s1, $s1, $v0
    /* 11650 8014B248 01008226 */  addiu      $v0, $s4, 0x1
    /* 11654 8014B24C 0E80013C */  lui        $at, %hi(dung_map)
    /* 11658 8014B250 21083100 */  addu       $at, $at, $s1
    /* 1165C 8014B254 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 11660 8014B258 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 11664 8014B25C 21083000 */  addu       $at, $at, $s0
    /* 11668 8014B260 BA532294 */  lhu        $v0, %lo(monster + 0x26)($at)
    /* 1166C 8014B264 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 11670 8014B268 21083000 */  addu       $at, $at, $s0
    /* 11674 8014B26C AC5320A4 */  sh         $zero, %lo(monster + 0x18)($at)
    /* 11678 8014B270 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 1167C 8014B274 21083000 */  addu       $at, $at, $s0
    /* 11680 8014B278 AE5320A4 */  sh         $zero, %lo(monster + 0x1A)($at)
    /* 11684 8014B27C 1080013C */  lui        $at, %hi(monster + 0x28)
    /* 11688 8014B280 21083000 */  addu       $at, $at, $s0
    /* 1168C 8014B284 BC5320A4 */  sh         $zero, %lo(monster + 0x28)($at)
    /* 11690 8014B288 1080013C */  lui        $at, %hi(monster + 0x2A)
    /* 11694 8014B28C 21083000 */  addu       $at, $at, $s0
    /* 11698 8014B290 BE5320A4 */  sh         $zero, %lo(monster + 0x2A)($at)
    /* 1169C 8014B294 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 116A0 8014B298 21083000 */  addu       $at, $at, $s0
    /* 116A4 8014B29C B65320A4 */  sh         $zero, %lo(monster + 0x22)($at)
    /* 116A8 8014B2A0 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 116AC 8014B2A4 21083000 */  addu       $at, $at, $s0
    /* 116B0 8014B2A8 B85320A4 */  sh         $zero, %lo(monster + 0x24)($at)
    /* 116B4 8014B2AC 01004224 */  addiu      $v0, $v0, 0x1
    /* 116B8 8014B2B0 260062A6 */  sh         $v0, 0x26($s3)
  .L8014B2B4:
    /* 116BC 8014B2B4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 116C0 8014B2B8 2000B48F */  lw         $s4, 0x20($sp)
    /* 116C4 8014B2BC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 116C8 8014B2C0 1800B28F */  lw         $s2, 0x18($sp)
    /* 116CC 8014B2C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 116D0 8014B2C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 116D4 8014B2CC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 116D8 8014B2D0 0800E003 */  jr         $ra
    /* 116DC 8014B2D4 00000000 */   nop
endlabel M_GetKnockback__Fii
