.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching tmrint, 0x150

glabel tmrint
    /* 1FEA4 8002FEA4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1FEA8 8002FEA8 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1FEAC 8002FEAC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1FEB0 8002FEB0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1FEB4 8002FEB4 01C0000C */  jal        savegp_ci
    /* 1FEB8 8002FEB8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1FEBC 8002FEBC 1280023C */  lui        $v0, %hi(finebios)
    /* 1FEC0 8002FEC0 80C5428C */  lw         $v0, %lo(finebios)($v0)
    /* 1FEC4 8002FEC4 00000000 */  nop
    /* 1FEC8 8002FEC8 01004224 */  addiu      $v0, $v0, 0x1
    /* 1FECC 8002FECC 1280013C */  lui        $at, %hi(finebios)
    /* 1FED0 8002FED0 80C522AC */  sw         $v0, %lo(finebios)($at)
    /* 1FED4 8002FED4 1280023C */  lui        $v0, %hi(finebios)
    /* 1FED8 8002FED8 80C5428C */  lw         $v0, %lo(finebios)($v0)
    /* 1FEDC 8002FEDC 1280023C */  lui        $v0, %hi(finebios)
    /* 1FEE0 8002FEE0 80C5428C */  lw         $v0, %lo(finebios)($v0)
    /* 1FEE4 8002FEE4 00000000 */  nop
    /* 1FEE8 8002FEE8 13004228 */  slti       $v0, $v0, 0x13
    /* 1FEEC 8002FEEC 0B004014 */  bnez       $v0, .L8002FF1C
    /* 1FEF0 8002FEF0 00000000 */   nop
    /* 1FEF4 8002FEF4 1280013C */  lui        $at, %hi(finebios)
    /* 1FEF8 8002FEF8 80C520AC */  sw         $zero, %lo(finebios)($at)
    /* 1FEFC 8002FEFC 1280023C */  lui        $v0, %hi(biosticks)
    /* 1FF00 8002FF00 84C5428C */  lw         $v0, %lo(biosticks)($v0)
    /* 1FF04 8002FF04 00000000 */  nop
    /* 1FF08 8002FF08 01004224 */  addiu      $v0, $v0, 0x1
    /* 1FF0C 8002FF0C 1280013C */  lui        $at, %hi(biosticks)
    /* 1FF10 8002FF10 84C522AC */  sw         $v0, %lo(biosticks)($at)
    /* 1FF14 8002FF14 1280023C */  lui        $v0, %hi(biosticks)
    /* 1FF18 8002FF18 84C5428C */  lw         $v0, %lo(biosticks)($v0)
  .L8002FF1C:
    /* 1FF1C 8002FF1C 1280023C */  lui        $v0, %hi(ticks)
    /* 1FF20 8002FF20 78C5428C */  lw         $v0, %lo(ticks)($v0)
    /* 1FF24 8002FF24 00000000 */  nop
    /* 1FF28 8002FF28 01004224 */  addiu      $v0, $v0, 0x1
    /* 1FF2C 8002FF2C 1280013C */  lui        $at, %hi(ticks)
    /* 1FF30 8002FF30 78C522AC */  sw         $v0, %lo(ticks)($at)
    /* 1FF34 8002FF34 1280023C */  lui        $v0, %hi(ticks)
    /* 1FF38 8002FF38 78C5428C */  lw         $v0, %lo(ticks)($v0)
    /* 1FF3C 8002FF3C 1280023C */  lui        $v0, %hi(libticks)
    /* 1FF40 8002FF40 7CC5428C */  lw         $v0, %lo(libticks)($v0)
    /* 1FF44 8002FF44 00000000 */  nop
    /* 1FF48 8002FF48 01004224 */  addiu      $v0, $v0, 0x1
    /* 1FF4C 8002FF4C 1280013C */  lui        $at, %hi(libticks)
    /* 1FF50 8002FF50 7CC522AC */  sw         $v0, %lo(libticks)($at)
    /* 1FF54 8002FF54 1280023C */  lui        $v0, %hi(libticks)
    /* 1FF58 8002FF58 7CC5428C */  lw         $v0, %lo(libticks)($v0)
    /* 1FF5C 8002FF5C D822828F */  lw         $v0, %gp_rel(reentryflag)($gp)
    /* 1FF60 8002FF60 00000000 */  nop
    /* 1FF64 8002FF64 1A004014 */  bnez       $v0, .L8002FFD0
    /* 1FF68 8002FF68 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FF6C 8002FF6C 3023838F */  lw         $v1, %gp_rel(settimerstack)($gp)
    /* 1FF70 8002FF70 D82282AF */  sw         $v0, %gp_rel(reentryflag)($gp)
    /* 1FF74 8002FF74 03006010 */  beqz       $v1, .L8002FF84
    /* 1FF78 8002FF78 21880000 */   addu      $s1, $zero, $zero
    /* 1FF7C 8002FF7C 09F86000 */  jalr       $v1
    /* 1FF80 8002FF80 00000000 */   nop
  .L8002FF84:
    /* 1FF84 8002FF84 0B80103C */  lui        $s0, %hi(tmrsub)
    /* 1FF88 8002FF88 44701026 */  addiu      $s0, $s0, %lo(tmrsub)
  .L8002FF8C:
    /* 1FF8C 8002FF8C 0000028E */  lw         $v0, 0x0($s0)
    /* 1FF90 8002FF90 00000000 */  nop
    /* 1FF94 8002FF94 03004010 */  beqz       $v0, .L8002FFA4
    /* 1FF98 8002FF98 00000000 */   nop
    /* 1FF9C 8002FF9C 09F84000 */  jalr       $v0
    /* 1FFA0 8002FFA0 00000000 */   nop
  .L8002FFA4:
    /* 1FFA4 8002FFA4 01003126 */  addiu      $s1, $s1, 0x1
    /* 1FFA8 8002FFA8 0800222A */  slti       $v0, $s1, 0x8
    /* 1FFAC 8002FFAC F7FF4014 */  bnez       $v0, .L8002FF8C
    /* 1FFB0 8002FFB0 04001026 */   addiu     $s0, $s0, 0x4
    /* 1FFB4 8002FFB4 1823828F */  lw         $v0, %gp_rel(restoretimerstack)($gp)
    /* 1FFB8 8002FFB8 00000000 */  nop
    /* 1FFBC 8002FFBC 03004010 */  beqz       $v0, .L8002FFCC
    /* 1FFC0 8002FFC0 00000000 */   nop
    /* 1FFC4 8002FFC4 09F84000 */  jalr       $v0
    /* 1FFC8 8002FFC8 00000000 */   nop
  .L8002FFCC:
    /* 1FFCC 8002FFCC D82280AF */  sw         $zero, %gp_rel(reentryflag)($gp)
  .L8002FFD0:
    /* 1FFD0 8002FFD0 1000A48F */  lw         $a0, 0x10($sp)
    /* 1FFD4 8002FFD4 06C0000C */  jal        restoregp
    /* 1FFD8 8002FFD8 00000000 */   nop
    /* 1FFDC 8002FFDC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1FFE0 8002FFE0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1FFE4 8002FFE4 1800B08F */  lw         $s0, 0x18($sp)
    /* 1FFE8 8002FFE8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1FFEC 8002FFEC 0800E003 */  jr         $ra
    /* 1FFF0 8002FFF0 00000000 */   nop
endlabel tmrint
