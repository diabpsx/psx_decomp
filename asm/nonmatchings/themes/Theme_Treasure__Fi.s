.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_Treasure__Fi, 0x244

glabel Theme_Treasure__Fi
    /* 23A00 8015D5F8 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 23A04 8015D5FC 4800B6AF */  sw         $s6, 0x48($sp)
    /* 23A08 8015D600 21B08000 */  addu       $s6, $a0, $zero
    /* 23A0C 8015D604 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 23A10 8015D608 4400B5AF */  sw         $s5, 0x44($sp)
    /* 23A14 8015D60C 4000B4AF */  sw         $s4, 0x40($sp)
    /* 23A18 8015D610 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 23A1C 8015D614 3800B2AF */  sw         $s2, 0x38($sp)
    /* 23A20 8015D618 3400B1AF */  sw         $s1, 0x34($sp)
    /* 23A24 8015D61C 3000B0AF */  sw         $s0, 0x30($sp)
    /* 23A28 8015D620 1280053C */  lui        $a1, %hi(D_8011C170)
    /* 23A2C 8015D624 70C1A524 */  addiu      $a1, $a1, %lo(D_8011C170)
    /* 23A30 8015D628 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23A34 8015D62C 0000A298 */  lwr        $v0, 0x0($a1)
    /* 23A38 8015D630 00000000 */  nop
    /* 23A3C 8015D634 2300A2AB */  swl        $v0, 0x23($sp)
    /* 23A40 8015D638 2000A2BB */  swr        $v0, 0x20($sp)
    /* 23A44 8015D63C 1280053C */  lui        $a1, %hi(D_8011C174)
    /* 23A48 8015D640 74C1A524 */  addiu      $a1, $a1, %lo(D_8011C174)
    /* 23A4C 8015D644 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23A50 8015D648 0000A298 */  lwr        $v0, 0x0($a1)
    /* 23A54 8015D64C 00000000 */  nop
    /* 23A58 8015D650 2B00A2AB */  swl        $v0, 0x2B($sp)
    /* 23A5C 8015D654 2800A2BB */  swr        $v0, 0x28($sp)
    /* 23A60 8015D658 B7F6000C */  jal        GetRndSeed__Fv
    /* 23A64 8015D65C 21900000 */   addu      $s2, $zero, $zero
    /* 23A68 8015D660 1F00B327 */  addiu      $s3, $sp, 0x1F
    /* 23A6C 8015D664 01001524 */  addiu      $s5, $zero, 0x1
  .L8015D668:
    /* 23A70 8015D668 6000422A */  slti       $v0, $s2, 0x60
    /* 23A74 8015D66C 61004010 */  beqz       $v0, .L8015D7F4
    /* 23A78 8015D670 21800000 */   addu      $s0, $zero, $zero
    /* 23A7C 8015D674 C0A01200 */  sll        $s4, $s2, 3
  .L8015D678:
    /* 23A80 8015D678 6000022A */  slti       $v0, $s0, 0x60
    /* 23A84 8015D67C 5B004010 */  beqz       $v0, .L8015D7EC
    /* 23A88 8015D680 C0101600 */   sll       $v0, $s6, 3
    /* 23A8C 8015D684 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 23A90 8015D688 21083400 */  addu       $at, $at, $s4
    /* 23A94 8015D68C 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 23A98 8015D690 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 23A9C 8015D694 21082200 */  addu       $at, $at, $v0
    /* 23AA0 8015D698 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 23AA4 8015D69C 00000000 */  nop
    /* 23AA8 8015D6A0 4F006214 */  bne        $v1, $v0, .L8015D7E0
    /* 23AAC 8015D6A4 21200002 */   addu      $a0, $s0, $zero
    /* 23AB0 8015D6A8 380B020C */  jal        GetSOLID__Fii
    /* 23AB4 8015D6AC 21284002 */   addu      $a1, $s2, $zero
    /* 23AB8 8015D6B0 01004238 */  xori       $v0, $v0, 0x1
    /* 23ABC 8015D6B4 4A004010 */  beqz       $v0, .L8015D7E0
    /* 23AC0 8015D6B8 00000000 */   nop
    /* 23AC4 8015D6BC 1280023C */  lui        $v0, %hi(leveltype)
    /* 23AC8 8015D6C0 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23ACC 8015D6C4 00000000 */  nop
    /* 23AD0 8015D6C8 21106202 */  addu       $v0, $s3, $v0
    /* 23AD4 8015D6CC 00004480 */  lb         $a0, 0x0($v0)
    /* 23AD8 8015D6D0 C9F6000C */  jal        ENG_random__Fl
    /* 23ADC 8015D6D4 00000000 */   nop
    /* 23AE0 8015D6D8 1280033C */  lui        $v1, %hi(leveltype)
    /* 23AE4 8015D6DC 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 23AE8 8015D6E0 00000000 */  nop
    /* 23AEC 8015D6E4 21186302 */  addu       $v1, $s3, $v1
    /* 23AF0 8015D6E8 00006480 */  lb         $a0, 0x0($v1)
    /* 23AF4 8015D6EC C9F6000C */  jal        ENG_random__Fl
    /* 23AF8 8015D6F0 21884000 */   addu      $s1, $v0, $zero
    /* 23AFC 8015D6F4 40100200 */  sll        $v0, $v0, 1
    /* 23B00 8015D6F8 0A004014 */  bnez       $v0, .L8015D724
    /* 23B04 8015D6FC 21200002 */   addu      $a0, $s0, $zero
    /* 23B08 8015D700 21284002 */  addu       $a1, $s2, $zero
    /* 23B0C 8015D704 21300000 */  addu       $a2, $zero, $zero
    /* 23B10 8015D708 0B000724 */  addiu      $a3, $zero, 0xB
    /* 23B14 8015D70C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23B18 8015D710 1400A0AF */  sw         $zero, 0x14($sp)
    /* 23B1C 8015D714 B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 23B20 8015D718 1800B5AF */   sw        $s5, 0x18($sp)
    /* 23B24 8015D71C CF22010C */  jal        ItemNoFlippy__Fv
    /* 23B28 8015D720 00000000 */   nop
  .L8015D724:
    /* 23B2C 8015D724 0A002016 */  bnez       $s1, .L8015D750
    /* 23B30 8015D728 21200002 */   addu      $a0, $s0, $zero
    /* 23B34 8015D72C 1000B5AF */  sw         $s5, 0x10($sp)
    /* 23B38 8015D730 21284002 */  addu       $a1, $s2, $zero
    /* 23B3C 8015D734 21300000 */  addu       $a2, $zero, $zero
    /* 23B40 8015D738 F612010C */  jal        CreateRndItem__FiiUcUcUc
    /* 23B44 8015D73C 21380000 */   addu      $a3, $zero, $zero
    /* 23B48 8015D740 CF22010C */  jal        ItemNoFlippy__Fv
    /* 23B4C 8015D744 00000000 */   nop
    /* 23B50 8015D748 DE750508 */  j          .L8015D778
    /* 23B54 8015D74C 00000000 */   nop
  .L8015D750:
    /* 23B58 8015D750 1280023C */  lui        $v0, %hi(leveltype)
    /* 23B5C 8015D754 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23B60 8015D758 00000000 */  nop
    /* 23B64 8015D75C 21106202 */  addu       $v0, $s3, $v0
    /* 23B68 8015D760 00004280 */  lb         $v0, 0x0($v0)
    /* 23B6C 8015D764 00000000 */  nop
    /* 23B70 8015D768 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 23B74 8015D76C 2A102202 */  slt        $v0, $s1, $v0
    /* 23B78 8015D770 1B004014 */  bnez       $v0, .L8015D7E0
    /* 23B7C 8015D774 00000000 */   nop
  .L8015D778:
    /* 23B80 8015D778 CF22010C */  jal        ItemNoFlippy__Fv
    /* 23B84 8015D77C 00000000 */   nop
    /* 23B88 8015D780 1280053C */  lui        $a1, %hi(leveltype)
    /* 23B8C 8015D784 0DC1A590 */  lbu        $a1, %lo(leveltype)($a1)
    /* 23B90 8015D788 00000000 */  nop
    /* 23B94 8015D78C 21186502 */  addu       $v1, $s3, $a1
    /* 23B98 8015D790 00006380 */  lb         $v1, 0x0($v1)
    /* 23B9C 8015D794 00000000 */  nop
    /* 23BA0 8015D798 FEFF6324 */  addiu      $v1, $v1, -0x2
    /* 23BA4 8015D79C 2A182302 */  slt        $v1, $s1, $v1
    /* 23BA8 8015D7A0 0F006014 */  bnez       $v1, .L8015D7E0
    /* 23BAC 8015D7A4 21204000 */   addu      $a0, $v0, $zero
    /* 23BB0 8015D7A8 0D00B510 */  beq        $a1, $s5, .L8015D7E0
    /* 23BB4 8015D7AC C0100400 */   sll       $v0, $a0, 3
    /* 23BB8 8015D7B0 23104400 */  subu       $v0, $v0, $a0
    /* 23BBC 8015D7B4 80100200 */  sll        $v0, $v0, 2
    /* 23BC0 8015D7B8 23104400 */  subu       $v0, $v0, $a0
    /* 23BC4 8015D7BC 80100200 */  sll        $v0, $v0, 2
    /* 23BC8 8015D7C0 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 23BCC 8015D7C4 21082200 */  addu       $at, $at, $v0
    /* 23BD0 8015D7C8 681D238C */  lw         $v1, %lo(item + 0x14)($at)
    /* 23BD4 8015D7CC 00000000 */  nop
    /* 23BD8 8015D7D0 43180300 */  sra        $v1, $v1, 1
    /* 23BDC 8015D7D4 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 23BE0 8015D7D8 21082200 */  addu       $at, $at, $v0
    /* 23BE4 8015D7DC 681D23AC */  sw         $v1, %lo(item + 0x14)($at)
  .L8015D7E0:
    /* 23BE8 8015D7E0 80039426 */  addiu      $s4, $s4, 0x380
    /* 23BEC 8015D7E4 9E750508 */  j          .L8015D678
    /* 23BF0 8015D7E8 01001026 */   addiu     $s0, $s0, 0x1
  .L8015D7EC:
    /* 23BF4 8015D7EC 9A750508 */  j          .L8015D668
    /* 23BF8 8015D7F0 01005226 */   addiu     $s2, $s2, 0x1
  .L8015D7F4:
    /* 23BFC 8015D7F4 1280023C */  lui        $v0, %hi(leveltype)
    /* 23C00 8015D7F8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23C04 8015D7FC 00000000 */  nop
    /* 23C08 8015D800 2110A203 */  addu       $v0, $sp, $v0
    /* 23C0C 8015D804 27004580 */  lb         $a1, 0x27($v0)
    /* 23C10 8015D808 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 23C14 8015D80C 2120C002 */   addu      $a0, $s6, $zero
    /* 23C18 8015D810 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 23C1C 8015D814 4800B68F */  lw         $s6, 0x48($sp)
    /* 23C20 8015D818 4400B58F */  lw         $s5, 0x44($sp)
    /* 23C24 8015D81C 4000B48F */  lw         $s4, 0x40($sp)
    /* 23C28 8015D820 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 23C2C 8015D824 3800B28F */  lw         $s2, 0x38($sp)
    /* 23C30 8015D828 3400B18F */  lw         $s1, 0x34($sp)
    /* 23C34 8015D82C 3000B08F */  lw         $s0, 0x30($sp)
    /* 23C38 8015D830 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 23C3C 8015D834 0800E003 */  jr         $ra
    /* 23C40 8015D838 00000000 */   nop
endlabel Theme_Treasure__Fi
