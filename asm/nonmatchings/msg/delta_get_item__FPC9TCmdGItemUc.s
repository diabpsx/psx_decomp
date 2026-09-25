.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_get_item__FPC9TCmdGItemUc, 0x1CC

glabel delta_get_item__FPC9TCmdGItemUc
    /* 3EF98 8004EF98 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3EF9C 8004EF9C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3EFA0 8004EFA0 21808000 */  addu       $s0, $a0, $zero
    /* 3EFA4 8004EFA4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3EFA8 8004EFA8 2188A000 */  addu       $s1, $a1, $zero
    /* 3EFAC 8004EFAC 1280053C */  lui        $a1, %hi(setlevel)
    /* 3EFB0 8004EFB0 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3EFB4 8004EFB4 FF002432 */  andi       $a0, $s1, 0xFF
    /* 3EFB8 8004EFB8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3EFBC 8004EFBC 224A010C */  jal        GetDLevel__Fib
    /* 3EFC0 8004EFC0 2B280500 */   sltu      $a1, $zero, $a1
    /* 3EFC4 8004EFC4 21204000 */  addu       $a0, $v0, $zero
    /* 3EFC8 8004EFC8 21C08000 */  addu       $t8, $a0, $zero
    /* 3EFCC 8004EFCC 21380000 */  addu       $a3, $zero, $zero
    /* 3EFD0 8004EFD0 FF000924 */  addiu      $t1, $zero, 0xFF
    /* 3EFD4 8004EFD4 01000824 */  addiu      $t0, $zero, 0x1
    /* 3EFD8 8004EFD8 10008624 */  addiu      $a2, $a0, 0x10
  .L8004EFDC:
    /* 3EFDC 8004EFDC 00000593 */  lbu        $a1, 0x0($t8)
    /* 3EFE0 8004EFE0 00000000 */  nop
    /* 3EFE4 8004EFE4 1900A910 */  beq        $a1, $t1, .L8004F04C
    /* 3EFE8 8004EFE8 00000000 */   nop
    /* 3EFEC 8004EFEC FAFFC394 */  lhu        $v1, -0x6($a2)
    /* 3EFF0 8004EFF0 0E000296 */  lhu        $v0, 0xE($s0)
    /* 3EFF4 8004EFF4 00000000 */  nop
    /* 3EFF8 8004EFF8 14006214 */  bne        $v1, $v0, .L8004F04C
    /* 3EFFC 8004EFFC 00000000 */   nop
    /* 3F000 8004F000 FCFFC394 */  lhu        $v1, -0x4($a2)
    /* 3F004 8004F004 10000296 */  lhu        $v0, 0x10($s0)
    /* 3F008 8004F008 00000000 */  nop
    /* 3F00C 8004F00C 0F006214 */  bne        $v1, $v0, .L8004F04C
    /* 3F010 8004F010 00000000 */   nop
    /* 3F014 8004F014 0000C38C */  lw         $v1, 0x0($a2)
    /* 3F018 8004F018 1400028E */  lw         $v0, 0x14($s0)
    /* 3F01C 8004F01C 00000000 */  nop
    /* 3F020 8004F020 0A006214 */  bne        $v1, $v0, .L8004F04C
    /* 3F024 8004F024 00000000 */   nop
    /* 3F028 8004F028 4500A810 */  beq        $a1, $t0, .L8004F140
    /* 3F02C 8004F02C 00000000 */   nop
    /* 3F030 8004F030 1400A010 */  beqz       $a1, .L8004F084
    /* 3F034 8004F034 02000224 */   addiu     $v0, $zero, 0x2
    /* 3F038 8004F038 0900A214 */  bne        $a1, $v0, .L8004F060
    /* 3F03C 8004F03C 00000000 */   nop
    /* 3F040 8004F040 B52088A3 */  sb         $t0, %gp_rel(D_8011C835)($gp)
    /* 3F044 8004F044 503C0108 */  j          .L8004F140
    /* 3F048 8004F048 000009A3 */   sb        $t1, 0x0($t8)
  .L8004F04C:
    /* 3F04C 8004F04C 0100E724 */  addiu      $a3, $a3, 0x1
    /* 3F050 8004F050 1800C624 */  addiu      $a2, $a2, 0x18
    /* 3F054 8004F054 7F00E228 */  slti       $v0, $a3, 0x7F
    /* 3F058 8004F058 E0FF4014 */  bnez       $v0, .L8004EFDC
    /* 3F05C 8004F05C 18001827 */   addiu     $t8, $t8, 0x18
  .L8004F060:
    /* 3F060 8004F060 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3F064 8004F064 00000000 */   nop
    /* 3F068 8004F068 10000296 */  lhu        $v0, 0x10($s0)
    /* 3F06C 8004F06C 00000000 */  nop
    /* 3F070 8004F070 00804230 */  andi       $v0, $v0, 0x8000
    /* 3F074 8004F074 23004014 */  bnez       $v0, .L8004F104
    /* 3F078 8004F078 FF002432 */   andi      $a0, $s1, 0xFF
    /* 3F07C 8004F07C 533C0108 */  j          .L8004F14C
    /* 3F080 8004F080 21100000 */   addu      $v0, $zero, $zero
  .L8004F084:
    /* 3F084 8004F084 01000224 */  addiu      $v0, $zero, 0x1
    /* 3F088 8004F088 B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3F08C 8004F08C 503C0108 */  j          .L8004F140
    /* 3F090 8004F090 000002A3 */   sb        $v0, 0x0($t8)
  .L8004F094:
    /* 3F094 8004F094 05000392 */  lbu        $v1, 0x5($s0)
    /* 3F098 8004F098 06000592 */  lbu        $a1, 0x6($s0)
    /* 3F09C 8004F09C 0E000696 */  lhu        $a2, 0xE($s0)
    /* 3F0A0 8004F0A0 10000796 */  lhu        $a3, 0x10($s0)
    /* 3F0A4 8004F0A4 1400088E */  lw         $t0, 0x14($s0)
    /* 3F0A8 8004F0A8 07000992 */  lbu        $t1, 0x7($s0)
    /* 3F0AC 8004F0AC 08000A92 */  lbu        $t2, 0x8($s0)
    /* 3F0B0 8004F0B0 09000B92 */  lbu        $t3, 0x9($s0)
    /* 3F0B4 8004F0B4 0A000C92 */  lbu        $t4, 0xA($s0)
    /* 3F0B8 8004F0B8 0B000D92 */  lbu        $t5, 0xB($s0)
    /* 3F0BC 8004F0BC 0C000E96 */  lhu        $t6, 0xC($s0)
    /* 3F0C0 8004F0C0 18000F8E */  lw         $t7, 0x18($s0)
    /* 3F0C4 8004F0C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 3F0C8 8004F0C8 B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3F0CC 8004F0CC 000002A3 */  sb         $v0, 0x0($t8)
    /* 3F0D0 8004F0D0 010003A3 */  sb         $v1, 0x1($t8)
    /* 3F0D4 8004F0D4 020005A3 */  sb         $a1, 0x2($t8)
    /* 3F0D8 8004F0D8 0A0006A7 */  sh         $a2, 0xA($t8)
    /* 3F0DC 8004F0DC 0C0007A7 */  sh         $a3, 0xC($t8)
    /* 3F0E0 8004F0E0 100008AF */  sw         $t0, 0x10($t8)
    /* 3F0E4 8004F0E4 030009A3 */  sb         $t1, 0x3($t8)
    /* 3F0E8 8004F0E8 04000AA3 */  sb         $t2, 0x4($t8)
    /* 3F0EC 8004F0EC 05000BA3 */  sb         $t3, 0x5($t8)
    /* 3F0F0 8004F0F0 06000CA3 */  sb         $t4, 0x6($t8)
    /* 3F0F4 8004F0F4 07000DA3 */  sb         $t5, 0x7($t8)
    /* 3F0F8 8004F0F8 08000EA7 */  sh         $t6, 0x8($t8)
    /* 3F0FC 8004F0FC 503C0108 */  j          .L8004F140
    /* 3F100 8004F100 14000FAF */   sw        $t7, 0x14($t8)
  .L8004F104:
    /* 3F104 8004F104 1280053C */  lui        $a1, %hi(setlevel)
    /* 3F108 8004F108 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3F10C 8004F10C 224A010C */  jal        GetDLevel__Fib
    /* 3F110 8004F110 2B280500 */   sltu      $a1, $zero, $a1
    /* 3F114 8004F114 21204000 */  addu       $a0, $v0, $zero
    /* 3F118 8004F118 21C08000 */  addu       $t8, $a0, $zero
    /* 3F11C 8004F11C 21380000 */  addu       $a3, $zero, $zero
    /* 3F120 8004F120 FF000324 */  addiu      $v1, $zero, 0xFF
  .L8004F124:
    /* 3F124 8004F124 00000293 */  lbu        $v0, 0x0($t8)
    /* 3F128 8004F128 00000000 */  nop
    /* 3F12C 8004F12C D9FF4310 */  beq        $v0, $v1, .L8004F094
    /* 3F130 8004F130 0100E724 */   addiu     $a3, $a3, 0x1
    /* 3F134 8004F134 7F00E228 */  slti       $v0, $a3, 0x7F
    /* 3F138 8004F138 FAFF4014 */  bnez       $v0, .L8004F124
    /* 3F13C 8004F13C 18001827 */   addiu     $t8, $t8, 0x18
  .L8004F140:
    /* 3F140 8004F140 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3F144 8004F144 00000000 */   nop
    /* 3F148 8004F148 01000224 */  addiu      $v0, $zero, 0x1
  .L8004F14C:
    /* 3F14C 8004F14C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F150 8004F150 1400B18F */  lw         $s1, 0x14($sp)
    /* 3F154 8004F154 1000B08F */  lw         $s0, 0x10($sp)
    /* 3F158 8004F158 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F15C 8004F15C 0800E003 */  jr         $ra
    /* 3F160 8004F160 00000000 */   nop
endlabel delta_get_item__FPC9TCmdGItemUc
