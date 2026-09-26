.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateThemeRooms__Fv, 0x1E4

glabel CreateThemeRooms__Fv
    /* 249A0 8015E598 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 249A4 8015E59C 1280033C */  lui        $v1, %hi(currlevel)
    /* 249A8 8015E5A0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 249AC 8015E5A4 10000224 */  addiu      $v0, $zero, 0x10
    /* 249B0 8015E5A8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 249B4 8015E5AC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 249B8 8015E5B0 6C006210 */  beq        $v1, $v0, .L8015E764
    /* 249BC 8015E5B4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 249C0 8015E5B8 0C1A838F */  lw         $v1, %gp_rel(numthemes)($gp)
    /* 249C4 8015E5BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 249C8 8015E5C0 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 249CC 8015E5C4 D0B922A0 */  sb         $v0, %lo(InitObjFlag)($at)
    /* 249D0 8015E5C8 58006018 */  blez       $v1, .L8015E72C
    /* 249D4 8015E5CC 21800000 */   addu      $s0, $zero, $zero
    /* 249D8 8015E5D0 21880000 */  addu       $s1, $zero, $zero
  .L8015E5D4:
    /* 249DC 8015E5D4 181A80AF */  sw         $zero, %gp_rel(themex)($gp)
    /* 249E0 8015E5D8 1C1A80AF */  sw         $zero, %gp_rel(themey)($gp)
    /* 249E4 8015E5DC 1080013C */  lui        $at, %hi(theme)
    /* 249E8 8015E5E0 21083100 */  addu       $at, $at, $s1
    /* 249EC 8015E5E4 48282380 */  lb         $v1, %lo(theme)($at)
    /* 249F0 8015E5E8 00000000 */  nop
    /* 249F4 8015E5EC 1100622C */  sltiu      $v0, $v1, 0x11
    /* 249F8 8015E5F0 49004010 */  beqz       $v0, .L8015E718
    /* 249FC 8015E5F4 80100300 */   sll       $v0, $v1, 2
    /* 24A00 8015E5F8 1280013C */  lui        $at, %hi(jtbl_80119AC4)
    /* 24A04 8015E5FC 21082200 */  addu       $at, $at, $v0
    /* 24A08 8015E600 C49A228C */  lw         $v0, %lo(jtbl_80119AC4)($at)
    /* 24A0C 8015E604 00000000 */  nop
    /* 24A10 8015E608 08004000 */  jr         $v0
    /* 24A14 8015E60C 00000000 */   nop
    /* 24A18 8015E610 CD73050C */  jal        Theme_Barrel__Fi
    /* 24A1C 8015E614 21200002 */   addu      $a0, $s0, $zero
    /* 24A20 8015E618 C6790508 */  j          .L8015E718
    /* 24A24 8015E61C 00000000 */   nop
    /* 24A28 8015E620 2474050C */  jal        Theme_Shrine__Fi
    /* 24A2C 8015E624 21200002 */   addu      $a0, $s0, $zero
    /* 24A30 8015E628 C6790508 */  j          .L8015E718
    /* 24A34 8015E62C 00000000 */   nop
    /* 24A38 8015E630 5E74050C */  jal        Theme_MonstPit__Fi
    /* 24A3C 8015E634 21200002 */   addu      $a0, $s0, $zero
    /* 24A40 8015E638 C6790508 */  j          .L8015E718
    /* 24A44 8015E63C 00000000 */   nop
    /* 24A48 8015E640 AF74050C */  jal        Theme_SkelRoom__Fi
    /* 24A4C 8015E644 21200002 */   addu      $a0, $s0, $zero
    /* 24A50 8015E648 C6790508 */  j          .L8015E718
    /* 24A54 8015E64C 00000000 */   nop
    /* 24A58 8015E650 7E75050C */  jal        Theme_Treasure__Fi
    /* 24A5C 8015E654 21200002 */   addu      $a0, $s0, $zero
    /* 24A60 8015E658 C6790508 */  j          .L8015E718
    /* 24A64 8015E65C 00000000 */   nop
    /* 24A68 8015E660 0F76050C */  jal        Theme_Library__Fi
    /* 24A6C 8015E664 21200002 */   addu      $a0, $s0, $zero
    /* 24A70 8015E668 C6790508 */  j          .L8015E718
    /* 24A74 8015E66C 00000000 */   nop
    /* 24A78 8015E670 B076050C */  jal        Theme_Torture__Fi
    /* 24A7C 8015E674 21200002 */   addu      $a0, $s0, $zero
    /* 24A80 8015E678 C6790508 */  j          .L8015E718
    /* 24A84 8015E67C 00000000 */   nop
    /* 24A88 8015E680 0677050C */  jal        Theme_BloodFountain__Fi
    /* 24A8C 8015E684 21200002 */   addu      $a0, $s0, $zero
    /* 24A90 8015E688 C6790508 */  j          .L8015E718
    /* 24A94 8015E68C 00000000 */   nop
    /* 24A98 8015E690 2377050C */  jal        Theme_Decap__Fi
    /* 24A9C 8015E694 21200002 */   addu      $a0, $s0, $zero
    /* 24AA0 8015E698 C6790508 */  j          .L8015E718
    /* 24AA4 8015E69C 00000000 */   nop
    /* 24AA8 8015E6A0 7977050C */  jal        Theme_PurifyingFountain__Fi
    /* 24AAC 8015E6A4 21200002 */   addu      $a0, $s0, $zero
    /* 24AB0 8015E6A8 C6790508 */  j          .L8015E718
    /* 24AB4 8015E6AC 00000000 */   nop
    /* 24AB8 8015E6B0 9677050C */  jal        Theme_ArmorStand__Fi
    /* 24ABC 8015E6B4 21200002 */   addu      $a0, $s0, $zero
    /* 24AC0 8015E6B8 C6790508 */  j          .L8015E718
    /* 24AC4 8015E6BC 00000000 */   nop
    /* 24AC8 8015E6C0 F577050C */  jal        Theme_GoatShrine__Fi
    /* 24ACC 8015E6C4 21200002 */   addu      $a0, $s0, $zero
    /* 24AD0 8015E6C8 C6790508 */  j          .L8015E718
    /* 24AD4 8015E6CC 00000000 */   nop
    /* 24AD8 8015E6D0 4278050C */  jal        Theme_Cauldron__Fi
    /* 24ADC 8015E6D4 21200002 */   addu      $a0, $s0, $zero
    /* 24AE0 8015E6D8 C6790508 */  j          .L8015E718
    /* 24AE4 8015E6DC 00000000 */   nop
    /* 24AE8 8015E6E0 7C78050C */  jal        Theme_TearFountain__Fi
    /* 24AEC 8015E6E4 21200002 */   addu      $a0, $s0, $zero
    /* 24AF0 8015E6E8 C6790508 */  j          .L8015E718
    /* 24AF4 8015E6EC 00000000 */   nop
    /* 24AF8 8015E6F0 5F78050C */  jal        Theme_MurkyFountain__Fi
    /* 24AFC 8015E6F4 21200002 */   addu      $a0, $s0, $zero
    /* 24B00 8015E6F8 C6790508 */  j          .L8015E718
    /* 24B04 8015E6FC 00000000 */   nop
    /* 24B08 8015E700 9978050C */  jal        Theme_BrnCross__Fi
    /* 24B0C 8015E704 21200002 */   addu      $a0, $s0, $zero
    /* 24B10 8015E708 C6790508 */  j          .L8015E718
    /* 24B14 8015E70C 00000000 */   nop
    /* 24B18 8015E710 F078050C */  jal        Theme_WeaponRack__Fi
    /* 24B1C 8015E714 21200002 */   addu      $a0, $s0, $zero
  .L8015E718:
    /* 24B20 8015E718 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 24B24 8015E71C 01001026 */  addiu      $s0, $s0, 0x1
    /* 24B28 8015E720 2A100202 */  slt        $v0, $s0, $v0
    /* 24B2C 8015E724 ABFF4014 */  bnez       $v0, .L8015E5D4
    /* 24B30 8015E728 08003126 */   addiu     $s1, $s1, 0x8
  .L8015E72C:
    /* 24B34 8015E72C 1280033C */  lui        $v1, %hi(leveltype)
    /* 24B38 8015E730 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 24B3C 8015E734 04000224 */  addiu      $v0, $zero, 0x4
    /* 24B40 8015E738 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 24B44 8015E73C D0B920A0 */  sb         $zero, %lo(InitObjFlag)($at)
    /* 24B48 8015E740 08006214 */  bne        $v1, $v0, .L8015E764
    /* 24B4C 8015E744 00000000 */   nop
    /* 24B50 8015E748 1280023C */  lui        $v0, %hi(themeCount)
    /* 24B54 8015E74C 4CC1428C */  lw         $v0, %lo(themeCount)($v0)
    /* 24B58 8015E750 00000000 */  nop
    /* 24B5C 8015E754 03004018 */  blez       $v0, .L8015E764
    /* 24B60 8015E758 00000000 */   nop
    /* 24B64 8015E75C 4F79050C */  jal        UpdateL4Trans__Fv
    /* 24B68 8015E760 00000000 */   nop
  .L8015E764:
    /* 24B6C 8015E764 2000BF8F */  lw         $ra, 0x20($sp)
    /* 24B70 8015E768 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 24B74 8015E76C 1800B08F */  lw         $s0, 0x18($sp)
    /* 24B78 8015E770 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 24B7C 8015E774 0800E003 */  jr         $ra
    /* 24B80 8015E778 00000000 */   nop
endlabel CreateThemeRooms__Fv
