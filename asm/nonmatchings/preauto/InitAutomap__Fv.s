.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitAutomap__Fv, 0x1F8

glabel InitAutomap__Fv
    /* 258CC 8015F4C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 258D0 8015F4C8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 258D4 8015F4CC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 258D8 8015F4D0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 258DC 8015F4D4 1D11020C */  jal        SYSI_GetFs__Fv
    /* 258E0 8015F4D8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 258E4 8015F4DC 21904000 */  addu       $s2, $v0, $zero
    /* 258E8 8015F4E0 FF010324 */  addiu      $v1, $zero, 0x1FF
    /* 258EC 8015F4E4 1180023C */  lui        $v0, %hi(automaptype + 0x3FE)
    /* 258F0 8015F4E8 AADB4224 */  addiu      $v0, $v0, %lo(automaptype + 0x3FE)
  .L8015F4EC:
    /* 258F4 8015F4EC 000040A4 */  sh         $zero, 0x0($v0)
    /* 258F8 8015F4F0 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 258FC 8015F4F4 FDFF6104 */  bgez       $v1, .L8015F4EC
    /* 25900 8015F4F8 FEFF4224 */   addiu     $v0, $v0, -0x2
    /* 25904 8015F4FC 1280033C */  lui        $v1, %hi(leveltype)
    /* 25908 8015F500 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 2590C 8015F504 02000224 */  addiu      $v0, $zero, 0x2
    /* 25910 8015F508 12006210 */  beq        $v1, $v0, .L8015F554
    /* 25914 8015F50C 03006228 */   slti      $v0, $v1, 0x3
    /* 25918 8015F510 05004010 */  beqz       $v0, .L8015F528
    /* 2591C 8015F514 01000224 */   addiu     $v0, $zero, 0x1
    /* 25920 8015F518 0A006210 */  beq        $v1, $v0, .L8015F544
    /* 25924 8015F51C 00000000 */   nop
    /* 25928 8015F520 A87D0508 */  j          .L8015F6A0
    /* 2592C 8015F524 00000000 */   nop
  .L8015F528:
    /* 25930 8015F528 03000224 */  addiu      $v0, $zero, 0x3
    /* 25934 8015F52C 0D006210 */  beq        $v1, $v0, .L8015F564
    /* 25938 8015F530 04000224 */   addiu     $v0, $zero, 0x4
    /* 2593C 8015F534 0F006210 */  beq        $v1, $v0, .L8015F574
    /* 25940 8015F538 00000000 */   nop
    /* 25944 8015F53C A87D0508 */  j          .L8015F6A0
    /* 25948 8015F540 00000000 */   nop
  .L8015F544:
    /* 2594C 8015F544 1280103C */  lui        $s0, %hi(D_8011C1E0)
    /* 25950 8015F548 E0C11026 */  addiu      $s0, $s0, %lo(D_8011C1E0)
    /* 25954 8015F54C 5F7D0508 */  j          .L8015F57C
    /* 25958 8015F550 00000000 */   nop
  .L8015F554:
    /* 2595C 8015F554 1280103C */  lui        $s0, %hi(D_8011C1E8)
    /* 25960 8015F558 E8C11026 */  addiu      $s0, $s0, %lo(D_8011C1E8)
    /* 25964 8015F55C 5F7D0508 */  j          .L8015F57C
    /* 25968 8015F560 00000000 */   nop
  .L8015F564:
    /* 2596C 8015F564 1280103C */  lui        $s0, %hi(D_8011C1F0)
    /* 25970 8015F568 F0C11026 */  addiu      $s0, $s0, %lo(D_8011C1F0)
    /* 25974 8015F56C 5F7D0508 */  j          .L8015F57C
    /* 25978 8015F570 00000000 */   nop
  .L8015F574:
    /* 2597C 8015F574 1280103C */  lui        $s0, %hi(D_8011C1F8)
    /* 25980 8015F578 F8C11026 */  addiu      $s0, $s0, %lo(D_8011C1F8)
  .L8015F57C:
    /* 25984 8015F57C 48000012 */  beqz       $s0, .L8015F6A0
    /* 25988 8015F580 21204002 */   addu      $a0, $s2, $zero
    /* 2598C 8015F584 A416020C */  jal        FileLen__6FileIOPCc
    /* 25990 8015F588 21280002 */   addu      $a1, $s0, $zero
    /* 25994 8015F58C 21884000 */  addu       $s1, $v0, $zero
    /* 25998 8015F590 0102222A */  slti       $v0, $s1, 0x201
    /* 2599C 8015F594 07004014 */  bnez       $v0, .L8015F5B4
    /* 259A0 8015F598 21204002 */   addu      $a0, $s2, $zero
    /* 259A4 8015F59C 21200000 */  addu       $a0, $zero, $zero
    /* 259A8 8015F5A0 1280053C */  lui        $a1, %hi(D_80119BEC)
    /* 259AC 8015F5A4 EC9BA524 */  addiu      $a1, $a1, %lo(D_80119BEC)
    /* 259B0 8015F5A8 A583000C */  jal        DBG_Error
    /* 259B4 8015F5AC B5000624 */   addiu     $a2, $zero, 0xB5
    /* 259B8 8015F5B0 21204002 */  addu       $a0, $s2, $zero
  .L8015F5B4:
    /* 259BC 8015F5B4 21280002 */  addu       $a1, $s0, $zero
    /* 259C0 8015F5B8 1380103C */  lui        $s0, %hi(D_8012FD80)
    /* 259C4 8015F5BC 80FD1026 */  addiu      $s0, $s0, %lo(D_8012FD80)
    /* 259C8 8015F5C0 21300002 */  addu       $a2, $s0, $zero
    /* 259CC 8015F5C4 FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 259D0 8015F5C8 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 259D4 8015F5CC 42301100 */  srl        $a2, $s1, 1
    /* 259D8 8015F5D0 0E00C010 */  beqz       $a2, .L8015F60C
    /* 259DC 8015F5D4 01000524 */   addiu     $a1, $zero, 0x1
    /* 259E0 8015F5D8 1180043C */  lui        $a0, %hi(automaptype + 0x2)
    /* 259E4 8015F5DC AED78424 */  addiu      $a0, $a0, %lo(automaptype + 0x2)
  .L8015F5E0:
    /* 259E8 8015F5E0 00000392 */  lbu        $v1, 0x0($s0)
    /* 259EC 8015F5E4 01001026 */  addiu      $s0, $s0, 0x1
    /* 259F0 8015F5E8 00000292 */  lbu        $v0, 0x0($s0)
    /* 259F4 8015F5EC 01001026 */  addiu      $s0, $s0, 0x1
    /* 259F8 8015F5F0 0100A524 */  addiu      $a1, $a1, 0x1
    /* 259FC 8015F5F4 00120200 */  sll        $v0, $v0, 8
    /* 25A00 8015F5F8 21186200 */  addu       $v1, $v1, $v0
    /* 25A04 8015F5FC 000083A4 */  sh         $v1, 0x0($a0)
    /* 25A08 8015F600 2B10C500 */  sltu       $v0, $a2, $a1
    /* 25A0C 8015F604 F6FF4010 */  beqz       $v0, .L8015F5E0
    /* 25A10 8015F608 02008424 */   addiu     $a0, $a0, 0x2
  .L8015F60C:
    /* 25A14 8015F60C 21280000 */  addu       $a1, $zero, $zero
    /* 25A18 8015F610 1180063C */  lui        $a2, %hi(automapview)
    /* 25A1C 8015F614 E4D6C624 */  addiu      $a2, $a2, %lo(automapview)
  .L8015F618:
    /* 25A20 8015F618 21180000 */  addu       $v1, $zero, $zero
    /* 25A24 8015F61C 2120C000 */  addu       $a0, $a2, $zero
  .L8015F620:
    /* 25A28 8015F620 21108500 */  addu       $v0, $a0, $a1
    /* 25A2C 8015F624 000040A0 */  sb         $zero, 0x0($v0)
    /* 25A30 8015F628 01006324 */  addiu      $v1, $v1, 0x1
    /* 25A34 8015F62C 05006228 */  slti       $v0, $v1, 0x5
    /* 25A38 8015F630 FBFF4014 */  bnez       $v0, .L8015F620
    /* 25A3C 8015F634 28008424 */   addiu     $a0, $a0, 0x28
    /* 25A40 8015F638 0100A524 */  addiu      $a1, $a1, 0x1
    /* 25A44 8015F63C 2800A228 */  slti       $v0, $a1, 0x28
    /* 25A48 8015F640 F5FF4014 */  bnez       $v0, .L8015F618
    /* 25A4C 8015F644 00000000 */   nop
    /* 25A50 8015F648 21280000 */  addu       $a1, $zero, $zero
  .L8015F64C:
    /* 25A54 8015F64C 21200000 */  addu       $a0, $zero, $zero
    /* 25A58 8015F650 C0180500 */  sll        $v1, $a1, 3
  .L8015F654:
    /* 25A5C 8015F654 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 25A60 8015F658 21082300 */  addu       $at, $at, $v1
    /* 25A64 8015F65C 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 25A68 8015F660 01008424 */  addiu      $a0, $a0, 0x1
    /* 25A6C 8015F664 7F004230 */  andi       $v0, $v0, 0x7F
    /* 25A70 8015F668 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 25A74 8015F66C 21082300 */  addu       $at, $at, $v1
    /* 25A78 8015F670 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 25A7C 8015F674 60008228 */  slti       $v0, $a0, 0x60
    /* 25A80 8015F678 F6FF4014 */  bnez       $v0, .L8015F654
    /* 25A84 8015F67C 80036324 */   addiu     $v1, $v1, 0x380
    /* 25A88 8015F680 0100A524 */  addiu      $a1, $a1, 0x1
    /* 25A8C 8015F684 6000A228 */  slti       $v0, $a1, 0x60
    /* 25A90 8015F688 F0FF4014 */  bnez       $v0, .L8015F64C
    /* 25A94 8015F68C 00000000 */   nop
    /* 25A98 8015F690 1280013C */  lui        $at, %hi(AutoMapXOfs)
    /* 25A9C 8015F694 84C320AC */  sw         $zero, %lo(AutoMapXOfs)($at)
    /* 25AA0 8015F698 1280013C */  lui        $at, %hi(AutoMapYOfs)
    /* 25AA4 8015F69C 88C320AC */  sw         $zero, %lo(AutoMapYOfs)($at)
  .L8015F6A0:
    /* 25AA8 8015F6A0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 25AAC 8015F6A4 1800B28F */  lw         $s2, 0x18($sp)
    /* 25AB0 8015F6A8 1400B18F */  lw         $s1, 0x14($sp)
    /* 25AB4 8015F6AC 1000B08F */  lw         $s0, 0x10($sp)
    /* 25AB8 8015F6B0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 25ABC 8015F6B4 0800E003 */  jr         $ra
    /* 25AC0 8015F6B8 00000000 */   nop
endlabel InitAutomap__Fv
