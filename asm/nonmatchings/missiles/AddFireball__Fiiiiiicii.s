.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFireball__Fiiiiiicii, 0x26C

glabel AddFireball__Fiiiiiicii
    /* 4990 8013E588 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 4994 8013E58C 3000B6AF */  sw         $s6, 0x30($sp)
    /* 4998 8013E590 5000B68F */  lw         $s6, 0x50($sp)
    /* 499C 8013E594 5400A28F */  lw         $v0, 0x54($sp)
    /* 49A0 8013E598 2000B2AF */  sw         $s2, 0x20($sp)
    /* 49A4 8013E59C 21908000 */  addu       $s2, $a0, $zero
    /* 49A8 8013E5A0 3400B7AF */  sw         $s7, 0x34($sp)
    /* 49AC 8013E5A4 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 49B0 8013E5A8 5800A493 */  lbu        $a0, 0x58($sp)
    /* 49B4 8013E5AC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 49B8 8013E5B0 2198A000 */  addu       $s3, $a1, $zero
    /* 49BC 8013E5B4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 49C0 8013E5B8 21A0C000 */  addu       $s4, $a2, $zero
    /* 49C4 8013E5BC 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 49C8 8013E5C0 21A8E000 */  addu       $s5, $a3, $zero
    /* 49CC 8013E5C4 3800BFAF */  sw         $ra, 0x38($sp)
    /* 49D0 8013E5C8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 49D4 8013E5CC 0B007516 */  bne        $s3, $s5, .L8013E5FC
    /* 49D8 8013E5D0 1800B0AF */   sw        $s0, 0x18($sp)
    /* 49DC 8013E5D4 09009616 */  bne        $s4, $s6, .L8013E5FC
    /* 49E0 8013E5D8 80100200 */   sll       $v0, $v0, 2
    /* 49E4 8013E5DC 1080013C */  lui        $at, %hi(XDirAdd)
    /* 49E8 8013E5E0 21082200 */  addu       $at, $at, $v0
    /* 49EC 8013E5E4 D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 49F0 8013E5E8 1080013C */  lui        $at, %hi(YDirAdd)
    /* 49F4 8013E5EC 21082200 */  addu       $at, $at, $v0
    /* 49F8 8013E5F0 F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 49FC 8013E5F4 21A86302 */  addu       $s5, $s3, $v1
    /* 4A00 8013E5F8 21B08202 */  addu       $s6, $s4, $v0
  .L8013E5FC:
    /* 4A04 8013E5FC 40008014 */  bnez       $a0, .L8013E700
    /* 4A08 8013E600 10001124 */   addiu     $s1, $zero, 0x10
    /* 4A0C 8013E604 C9F6000C */  jal        ENG_random__Fl
    /* 4A10 8013E608 0A000424 */   addiu     $a0, $zero, 0xA
    /* 4A14 8013E60C 0A000424 */  addiu      $a0, $zero, 0xA
    /* 4A18 8013E610 C9F6000C */  jal        ENG_random__Fl
    /* 4A1C 8013E614 21804000 */   addu      $s0, $v0, $zero
    /* 4A20 8013E618 80181200 */  sll        $v1, $s2, 2
    /* 4A24 8013E61C 21187200 */  addu       $v1, $v1, $s2
    /* 4A28 8013E620 80180300 */  sll        $v1, $v1, 2
    /* 4A2C 8013E624 23187200 */  subu       $v1, $v1, $s2
    /* 4A30 8013E628 80200300 */  sll        $a0, $v1, 2
    /* 4A34 8013E62C 40181700 */  sll        $v1, $s7, 1
    /* 4A38 8013E630 21187700 */  addu       $v1, $v1, $s7
    /* 4A3C 8013E634 80180300 */  sll        $v1, $v1, 2
    /* 4A40 8013E638 21187700 */  addu       $v1, $v1, $s7
    /* 4A44 8013E63C 00190300 */  sll        $v1, $v1, 4
    /* 4A48 8013E640 23187700 */  subu       $v1, $v1, $s7
    /* 4A4C 8013E644 80180300 */  sll        $v1, $v1, 2
    /* 4A50 8013E648 21187700 */  addu       $v1, $v1, $s7
    /* 4A54 8013E64C C0180300 */  sll        $v1, $v1, 3
    /* 4A58 8013E650 21800202 */  addu       $s0, $s0, $v0
    /* 4A5C 8013E654 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 4A60 8013E658 21082300 */  addu       $at, $at, $v1
    /* 4A64 8013E65C 74A62380 */  lb         $v1, %lo(plr + 0x13C)($at)
    /* 4A68 8013E660 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 4A6C 8013E664 21082400 */  addu       $at, $at, $a0
    /* 4A70 8013E668 982C3180 */  lb         $s1, %lo(missile + 0x40)($at)
    /* 4A74 8013E66C 02006324 */  addiu      $v1, $v1, 0x2
    /* 4A78 8013E670 21800302 */  addu       $s0, $s0, $v1
    /* 4A7C 8013E674 40801000 */  sll        $s0, $s0, 1
    /* 4A80 8013E678 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 4A84 8013E67C 21082400 */  addu       $at, $at, $a0
    /* 4A88 8013E680 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 4A8C 8013E684 0C00201A */  blez       $s1, .L8013E6B8
    /* 4A90 8013E688 80101200 */   sll       $v0, $s2, 2
  .L8013E68C:
    /* 4A94 8013E68C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 4A98 8013E690 21082400 */  addu       $at, $at, $a0
    /* 4A9C 8013E694 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 4AA0 8013E698 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 4AA4 8013E69C C3100300 */  sra        $v0, $v1, 3
    /* 4AA8 8013E6A0 21186200 */  addu       $v1, $v1, $v0
    /* 4AAC 8013E6A4 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 4AB0 8013E6A8 21082400 */  addu       $at, $at, $a0
    /* 4AB4 8013E6AC 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 4AB8 8013E6B0 F6FF201E */  bgtz       $s1, .L8013E68C
    /* 4ABC 8013E6B4 80101200 */   sll       $v0, $s2, 2
  .L8013E6B8:
    /* 4AC0 8013E6B8 21105200 */  addu       $v0, $v0, $s2
    /* 4AC4 8013E6BC 80100200 */  sll        $v0, $v0, 2
    /* 4AC8 8013E6C0 23105200 */  subu       $v0, $v0, $s2
    /* 4ACC 8013E6C4 80100200 */  sll        $v0, $v0, 2
    /* 4AD0 8013E6C8 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 4AD4 8013E6CC 21082200 */  addu       $at, $at, $v0
    /* 4AD8 8013E6D0 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* 4ADC 8013E6D4 00000000 */  nop
    /* 4AE0 8013E6D8 40100200 */  sll        $v0, $v0, 1
    /* 4AE4 8013E6DC 10005124 */  addiu      $s1, $v0, 0x10
    /* 4AE8 8013E6E0 3300222A */  slti       $v0, $s1, 0x33
    /* 4AEC 8013E6E4 02004014 */  bnez       $v0, .L8013E6F0
    /* 4AF0 8013E6E8 2120E002 */   addu      $a0, $s7, $zero
    /* 4AF4 8013E6EC 32001124 */  addiu      $s1, $zero, 0x32
  .L8013E6F0:
    /* 4AF8 8013E6F0 C2DC010C */  jal        UseMana__Fii
    /* 4AFC 8013E6F4 0C000524 */   addiu     $a1, $zero, 0xC
    /* 4B00 8013E6F8 C1F90408 */  j          .L8013E704
    /* 4B04 8013E6FC 21204002 */   addu      $a0, $s2, $zero
  .L8013E700:
    /* 4B08 8013E700 21204002 */  addu       $a0, $s2, $zero
  .L8013E704:
    /* 4B0C 8013E704 21286002 */  addu       $a1, $s3, $zero
    /* 4B10 8013E708 21308002 */  addu       $a2, $s4, $zero
    /* 4B14 8013E70C 2138A002 */  addu       $a3, $s5, $zero
    /* 4B18 8013E710 1000B6AF */  sw         $s6, 0x10($sp)
    /* 4B1C 8013E714 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 4B20 8013E718 1400B1AF */   sw        $s1, 0x14($sp)
    /* 4B24 8013E71C 21206002 */  addu       $a0, $s3, $zero
    /* 4B28 8013E720 21288002 */  addu       $a1, $s4, $zero
    /* 4B2C 8013E724 2130A002 */  addu       $a2, $s5, $zero
    /* 4B30 8013E728 2CE9040C */  jal        GetDirection8__Fiiii
    /* 4B34 8013E72C 2138C002 */   addu      $a3, $s6, $zero
    /* 4B38 8013E730 21204002 */  addu       $a0, $s2, $zero
    /* 4B3C 8013E734 09F5040C */  jal        SetMissDir__Fii
    /* 4B40 8013E738 21284000 */   addu      $a1, $v0, $zero
    /* 4B44 8013E73C 21206002 */  addu       $a0, $s3, $zero
    /* 4B48 8013E740 21288002 */  addu       $a1, $s4, $zero
    /* 4B4C 8013E744 80801200 */  sll        $s0, $s2, 2
    /* 4B50 8013E748 21801202 */  addu       $s0, $s0, $s2
    /* 4B54 8013E74C 80801000 */  sll        $s0, $s0, 2
    /* 4B58 8013E750 23801202 */  subu       $s0, $s0, $s2
    /* 4B5C 8013E754 80801000 */  sll        $s0, $s0, 2
    /* 4B60 8013E758 00010224 */  addiu      $v0, $zero, 0x100
    /* 4B64 8013E75C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4B68 8013E760 21083000 */  addu       $at, $at, $s0
    /* 4B6C 8013E764 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 4B70 8013E768 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 4B74 8013E76C 21083000 */  addu       $at, $at, $s0
    /* 4B78 8013E770 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 4B7C 8013E774 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 4B80 8013E778 21083000 */  addu       $at, $at, $s0
    /* 4B84 8013E77C 782C25A4 */  sh         $a1, %lo(missile + 0x20)($at)
    /* 4B88 8013E780 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 4B8C 8013E784 21083000 */  addu       $at, $at, $s0
    /* 4B90 8013E788 7A2C20A4 */  sh         $zero, %lo(missile + 0x22)($at)
    /* 4B94 8013E78C 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 4B98 8013E790 21083000 */  addu       $at, $at, $s0
    /* 4B9C 8013E794 7C2C24A4 */  sh         $a0, %lo(missile + 0x24)($at)
    /* 4BA0 8013E798 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 4BA4 8013E79C 21083000 */  addu       $at, $at, $s0
    /* 4BA8 8013E7A0 7E2C25A4 */  sh         $a1, %lo(missile + 0x26)($at)
    /* 4BAC 8013E7A4 BA34010C */  jal        AddLight__Fiii
    /* 4BB0 8013E7A8 95000624 */   addiu     $a2, $zero, 0x95
    /* 4BB4 8013E7AC 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 4BB8 8013E7B0 21083000 */  addu       $at, $at, $s0
    /* 4BBC 8013E7B4 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 4BC0 8013E7B8 01000224 */  addiu      $v0, $zero, 0x1
    /* 4BC4 8013E7BC 1280013C */  lui        $at, %hi(SetParticle)
    /* 4BC8 8013E7C0 E4B022AC */  sw         $v0, %lo(SetParticle)($at)
    /* 4BCC 8013E7C4 3800BF8F */  lw         $ra, 0x38($sp)
    /* 4BD0 8013E7C8 3400B78F */  lw         $s7, 0x34($sp)
    /* 4BD4 8013E7CC 3000B68F */  lw         $s6, 0x30($sp)
    /* 4BD8 8013E7D0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 4BDC 8013E7D4 2800B48F */  lw         $s4, 0x28($sp)
    /* 4BE0 8013E7D8 2400B38F */  lw         $s3, 0x24($sp)
    /* 4BE4 8013E7DC 2000B28F */  lw         $s2, 0x20($sp)
    /* 4BE8 8013E7E0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4BEC 8013E7E4 1800B08F */  lw         $s0, 0x18($sp)
    /* 4BF0 8013E7E8 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 4BF4 8013E7EC 0800E003 */  jr         $ra
    /* 4BF8 8013E7F0 00000000 */   nop
endlabel AddFireball__Fiiiiiicii
