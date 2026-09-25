.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching mteleportfx__Fv, 0x314

glabel mteleportfx__Fv
    /* 8E764 8009E764 A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 8E768 8009E768 4800B4AF */  sw         $s4, 0x48($sp)
    /* 8E76C 8009E76C 21A00000 */  addu       $s4, $zero, $zero
    /* 8E770 8009E770 5000B6AF */  sw         $s6, 0x50($sp)
    /* 8E774 8009E774 08001624 */  addiu      $s6, $zero, 0x8
    /* 8E778 8009E778 5800BEAF */  sw         $fp, 0x58($sp)
    /* 8E77C 8009E77C 40001E24 */  addiu      $fp, $zero, 0x40
    /* 8E780 8009E780 5400B7AF */  sw         $s7, 0x54($sp)
    /* 8E784 8009E784 01001724 */  addiu      $s7, $zero, 0x1
    /* 8E788 8009E788 4400B3AF */  sw         $s3, 0x44($sp)
    /* 8E78C 8009E78C 0D80133C */  lui        $s3, %hi(SpellFXDat + 0x40)
    /* 8E790 8009E790 1CC77326 */  addiu      $s3, $s3, %lo(SpellFXDat + 0x40)
    /* 8E794 8009E794 4000B2AF */  sw         $s2, 0x40($sp)
    /* 8E798 8009E798 21900000 */  addu       $s2, $zero, $zero
    /* 8E79C 8009E79C 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 8E7A0 8009E7A0 21A80000 */  addu       $s5, $zero, $zero
    /* 8E7A4 8009E7A4 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 8E7A8 8009E7A8 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 8E7AC 8009E7AC 3800B0AF */  sw         $s0, 0x38($sp)
  .L8009E7B0:
    /* 8E7B0 8009E7B0 0200822A */  slti       $v0, $s4, 0x2
    /* 8E7B4 8009E7B4 A3004010 */  beqz       $v0, .L8009EA44
    /* 8E7B8 8009E7B8 00000000 */   nop
    /* 8E7BC 8009E7BC 0D80013C */  lui        $at, %hi(SpellFXDat + 0x8)
    /* 8E7C0 8009E7C0 21083200 */  addu       $at, $at, $s2
    /* 8E7C4 8009E7C4 E4C6228C */  lw         $v0, %lo(SpellFXDat + 0x8)($at)
    /* 8E7C8 8009E7C8 00000000 */  nop
    /* 8E7CC 8009E7CC 98004010 */  beqz       $v0, .L8009EA30
    /* 8E7D0 8009E7D0 00000000 */   nop
    /* 8E7D4 8009E7D4 0D80023C */  lui        $v0, %hi(SpellFXDat)
    /* 8E7D8 8009E7D8 DCC64224 */  addiu      $v0, $v0, %lo(SpellFXDat)
    /* 8E7DC 8009E7DC 21804202 */  addu       $s0, $s2, $v0
    /* 8E7E0 8009E7E0 21200002 */  addu       $a0, $s0, $zero
    /* 8E7E4 8009E7E4 0E80053C */  lui        $a1, %hi(plr)
    /* 8E7E8 8009E7E8 38A5A524 */  addiu      $a1, $a1, %lo(plr)
    /* 8E7EC 8009E7EC 2080020C */  jal        GetPlrPos__11SPELLFX_DATP12PlayerStruct
    /* 8E7F0 8009E7F0 2128A502 */   addu      $a1, $s5, $a1
    /* 8E7F4 8009E7F4 4A82020C */  jal        GetPlayer__7CPlayeri_800a0928
    /* 8E7F8 8009E7F8 21208002 */   addu      $a0, $s4, $zero
    /* 8E7FC 8009E7FC 5E82020C */  jal        GetLastOtPos__C7CPlayer_800a0978
    /* 8E800 8009E800 21204000 */   addu      $a0, $v0, $zero
    /* 8E804 8009E804 7C09838F */  lw         $v1, %gp_rel(D_8011B0FC)($gp)
    /* 8E808 8009E808 00000000 */  nop
    /* 8E80C 8009E80C 49006014 */  bnez       $v1, .L8009E934
    /* 8E810 8009E810 21884000 */   addu      $s1, $v0, $zero
    /* 8E814 8009E814 0D80013C */  lui        $at, %hi(SpellFXDat + 0x38)
    /* 8E818 8009E818 21083200 */  addu       $at, $at, $s2
    /* 8E81C 8009E81C 14C7228C */  lw         $v0, %lo(SpellFXDat + 0x38)($at)
    /* 8E820 8009E820 0D80013C */  lui        $at, %hi(SpellFXDat + 0x3C)
    /* 8E824 8009E824 21083200 */  addu       $at, $at, $s2
    /* 8E828 8009E828 18C7238C */  lw         $v1, %lo(SpellFXDat + 0x3C)($at)
    /* 8E82C 8009E82C 00000000 */  nop
    /* 8E830 8009E830 2A104300 */  slt        $v0, $v0, $v1
    /* 8E834 8009E834 09004010 */  beqz       $v0, .L8009E85C
    /* 8E838 8009E838 00000000 */   nop
    /* 8E83C 8009E83C 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E840 8009E840 21083200 */  addu       $at, $at, $s2
    /* 8E844 8009E844 1CC7228C */  lw         $v0, %lo(SpellFXDat + 0x40)($at)
    /* 8E848 8009E848 00000000 */  nop
    /* 8E84C 8009E84C 00084224 */  addiu      $v0, $v0, 0x800
    /* 8E850 8009E850 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E854 8009E854 21083200 */  addu       $at, $at, $s2
    /* 8E858 8009E858 1CC722AC */  sw         $v0, %lo(SpellFXDat + 0x40)($at)
  .L8009E85C:
    /* 8E85C 8009E85C 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E860 8009E860 21083200 */  addu       $at, $at, $s2
    /* 8E864 8009E864 1CC7228C */  lw         $v0, %lo(SpellFXDat + 0x40)($at)
    /* 8E868 8009E868 0100033C */  lui        $v1, (0x10000 >> 16)
    /* 8E86C 8009E86C 2A106200 */  slt        $v0, $v1, $v0
    /* 8E870 8009E870 04004010 */  beqz       $v0, .L8009E884
    /* 8E874 8009E874 00000000 */   nop
    /* 8E878 8009E878 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E87C 8009E87C 21083200 */  addu       $at, $at, $s2
    /* 8E880 8009E880 1CC723AC */  sw         $v1, %lo(SpellFXDat + 0x40)($at)
  .L8009E884:
    /* 8E884 8009E884 0D80013C */  lui        $at, %hi(SpellFXDat + 0x38)
    /* 8E888 8009E888 21083200 */  addu       $at, $at, $s2
    /* 8E88C 8009E88C 14C7238C */  lw         $v1, %lo(SpellFXDat + 0x38)($at)
    /* 8E890 8009E890 0D80013C */  lui        $at, %hi(SpellFXDat + 0x3C)
    /* 8E894 8009E894 21083200 */  addu       $at, $at, $s2
    /* 8E898 8009E898 18C7228C */  lw         $v0, %lo(SpellFXDat + 0x3C)($at)
    /* 8E89C 8009E89C 00000000 */  nop
    /* 8E8A0 8009E8A0 2A104300 */  slt        $v0, $v0, $v1
    /* 8E8A4 8009E8A4 0B004010 */  beqz       $v0, .L8009E8D4
    /* 8E8A8 8009E8A8 02000224 */   addiu     $v0, $zero, 0x2
    /* 8E8AC 8009E8AC 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E8B0 8009E8B0 21083200 */  addu       $at, $at, $s2
    /* 8E8B4 8009E8B4 1CC7238C */  lw         $v1, %lo(SpellFXDat + 0x40)($at)
    /* 8E8B8 8009E8B8 0D80013C */  lui        $at, %hi(SpellFXDat + 0x8)
    /* 8E8BC 8009E8BC 21083200 */  addu       $at, $at, $s2
    /* 8E8C0 8009E8C0 E4C622AC */  sw         $v0, %lo(SpellFXDat + 0x8)($at)
    /* 8E8C4 8009E8C4 00F86324 */  addiu      $v1, $v1, -0x800
    /* 8E8C8 8009E8C8 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E8CC 8009E8CC 21083200 */  addu       $at, $at, $s2
    /* 8E8D0 8009E8D0 1CC723AC */  sw         $v1, %lo(SpellFXDat + 0x40)($at)
  .L8009E8D4:
    /* 8E8D4 8009E8D4 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E8D8 8009E8D8 21083200 */  addu       $at, $at, $s2
    /* 8E8DC 8009E8DC 1CC7228C */  lw         $v0, %lo(SpellFXDat + 0x40)($at)
    /* 8E8E0 8009E8E0 00000000 */  nop
    /* 8E8E4 8009E8E4 07004104 */  bgez       $v0, .L8009E904
    /* 8E8E8 8009E8E8 00000000 */   nop
    /* 8E8EC 8009E8EC 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 8E8F0 8009E8F0 21083200 */  addu       $at, $at, $s2
    /* 8E8F4 8009E8F4 1CC720AC */  sw         $zero, %lo(SpellFXDat + 0x40)($at)
    /* 8E8F8 8009E8F8 0D80013C */  lui        $at, %hi(SpellFXDat + 0x8)
    /* 8E8FC 8009E8FC 21083200 */  addu       $at, $at, $s2
    /* 8E900 8009E900 E4C620AC */  sw         $zero, %lo(SpellFXDat + 0x8)($at)
  .L8009E904:
    /* 8E904 8009E904 0D80013C */  lui        $at, %hi(SpellFXDat + 0x38)
    /* 8E908 8009E908 21083200 */  addu       $at, $at, $s2
    /* 8E90C 8009E90C 14C7228C */  lw         $v0, %lo(SpellFXDat + 0x38)($at)
    /* 8E910 8009E910 00000000 */  nop
    /* 8E914 8009E914 01004224 */  addiu      $v0, $v0, 0x1
    /* 8E918 8009E918 380002AE */  sw         $v0, 0x38($s0)
    /* 8E91C 8009E91C 0D80013C */  lui        $at, %hi(SpellFXDat + 0x3C)
    /* 8E920 8009E920 21083200 */  addu       $at, $at, $s2
    /* 8E924 8009E924 18C7228C */  lw         $v0, %lo(SpellFXDat + 0x3C)($at)
    /* 8E928 8009E928 00000000 */  nop
    /* 8E92C 8009E92C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 8E930 8009E930 3C0002AE */  sw         $v0, 0x3C($s0)
  .L8009E934:
    /* 8E934 8009E934 08000624 */  addiu      $a2, $zero, 0x8
    /* 8E938 8009E938 0D80013C */  lui        $at, %hi(SpellFXDat + 0x24)
    /* 8E93C 8009E93C 21083200 */  addu       $at, $at, $s2
    /* 8E940 8009E940 00C7248C */  lw         $a0, %lo(SpellFXDat + 0x24)($at)
    /* 8E944 8009E944 0D80013C */  lui        $at, %hi(SpellFXDat + 0x28)
    /* 8E948 8009E948 21083200 */  addu       $at, $at, $s2
    /* 8E94C 8009E94C 04C7258C */  lw         $a1, %lo(SpellFXDat + 0x28)($at)
    /* 8E950 8009E950 0000628E */  lw         $v0, 0x0($s3)
    /* 8E954 8009E954 10000724 */  addiu      $a3, $zero, 0x10
    /* 8E958 8009E958 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8E95C 8009E95C 1800B6AF */  sw         $s6, 0x18($sp)
    /* 8E960 8009E960 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8E964 8009E964 B07E020C */  jal        Teleportfx__Fiiiiiiii
    /* 8E968 8009E968 1000A2AF */   sw        $v0, 0x10($sp)
    /* 8E96C 8009E96C 0000638E */  lw         $v1, 0x0($s3)
    /* 8E970 8009E970 00000000 */  nop
    /* 8E974 8009E974 80100300 */  sll        $v0, $v1, 2
    /* 8E978 8009E978 21104300 */  addu       $v0, $v0, $v1
    /* 8E97C 8009E97C 40810200 */  sll        $s0, $v0, 5
    /* 8E980 8009E980 02000106 */  bgez       $s0, .L8009E98C
    /* 8E984 8009E984 FFFF0234 */   ori       $v0, $zero, 0xFFFF
    /* 8E988 8009E988 21800202 */  addu       $s0, $s0, $v0
  .L8009E98C:
    /* 8E98C 8009E98C 03841000 */  sra        $s0, $s0, 16
    /* 8E990 8009E990 FF001032 */  andi       $s0, $s0, 0xFF
    /* 8E994 8009E994 21300002 */  addu       $a2, $s0, $zero
    /* 8E998 8009E998 21380002 */  addu       $a3, $s0, $zero
    /* 8E99C 8009E99C 0D80013C */  lui        $at, %hi(SpellFXDat + 0x24)
    /* 8E9A0 8009E9A0 21083200 */  addu       $at, $at, $s2
    /* 8E9A4 8009E9A4 00C7248C */  lw         $a0, %lo(SpellFXDat + 0x24)($at)
    /* 8E9A8 8009E9A8 0D80013C */  lui        $at, %hi(SpellFXDat + 0x38)
    /* 8E9AC 8009E9AC 21083200 */  addu       $at, $at, $s2
    /* 8E9B0 8009E9B0 14C7258C */  lw         $a1, %lo(SpellFXDat + 0x38)($at)
    /* 8E9B4 8009E9B4 20000824 */  addiu      $t0, $zero, 0x20
    /* 8E9B8 8009E9B8 02003126 */  addiu      $s1, $s1, 0x2
    /* 8E9BC 8009E9BC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8E9C0 8009E9C0 1400A8AF */  sw         $t0, 0x14($sp)
    /* 8E9C4 8009E9C4 1800BEAF */  sw         $fp, 0x18($sp)
    /* 8E9C8 8009E9C8 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 8E9CC 8009E9CC 2000A0AF */  sw         $zero, 0x20($sp)
    /* 8E9D0 8009E9D0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 8E9D4 8009E9D4 2800B7AF */  sw         $s7, 0x28($sp)
    /* 8E9D8 8009E9D8 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 8E9DC 8009E9DC 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 8E9E0 8009E9E0 3000B6AF */   sw        $s6, 0x30($sp)
    /* 8E9E4 8009E9E4 21300002 */  addu       $a2, $s0, $zero
    /* 8E9E8 8009E9E8 2138C000 */  addu       $a3, $a2, $zero
    /* 8E9EC 8009E9EC 0D80013C */  lui        $at, %hi(SpellFXDat + 0x24)
    /* 8E9F0 8009E9F0 21083200 */  addu       $at, $at, $s2
    /* 8E9F4 8009E9F4 00C7248C */  lw         $a0, %lo(SpellFXDat + 0x24)($at)
    /* 8E9F8 8009E9F8 0D80013C */  lui        $at, %hi(SpellFXDat + 0x3C)
    /* 8E9FC 8009E9FC 21083200 */  addu       $at, $at, $s2
    /* 8EA00 8009EA00 18C7258C */  lw         $a1, %lo(SpellFXDat + 0x3C)($at)
    /* 8EA04 8009EA04 20000824 */  addiu      $t0, $zero, 0x20
    /* 8EA08 8009EA08 1000A6AF */  sw         $a2, 0x10($sp)
    /* 8EA0C 8009EA0C 1400A8AF */  sw         $t0, 0x14($sp)
    /* 8EA10 8009EA10 1800BEAF */  sw         $fp, 0x18($sp)
    /* 8EA14 8009EA14 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 8EA18 8009EA18 2000A0AF */  sw         $zero, 0x20($sp)
    /* 8EA1C 8009EA1C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 8EA20 8009EA20 2800B7AF */  sw         $s7, 0x28($sp)
    /* 8EA24 8009EA24 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 8EA28 8009EA28 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 8EA2C 8009EA2C 3000B6AF */   sw        $s6, 0x30($sp)
  .L8009EA30:
    /* 8EA30 8009EA30 48007326 */  addiu      $s3, $s3, 0x48
    /* 8EA34 8009EA34 48005226 */  addiu      $s2, $s2, 0x48
    /* 8EA38 8009EA38 E819B526 */  addiu      $s5, $s5, 0x19E8
    /* 8EA3C 8009EA3C EC790208 */  j          .L8009E7B0
    /* 8EA40 8009EA40 01009426 */   addiu     $s4, $s4, 0x1
  .L8009EA44:
    /* 8EA44 8009EA44 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 8EA48 8009EA48 5800BE8F */  lw         $fp, 0x58($sp)
    /* 8EA4C 8009EA4C 5400B78F */  lw         $s7, 0x54($sp)
    /* 8EA50 8009EA50 5000B68F */  lw         $s6, 0x50($sp)
    /* 8EA54 8009EA54 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 8EA58 8009EA58 4800B48F */  lw         $s4, 0x48($sp)
    /* 8EA5C 8009EA5C 4400B38F */  lw         $s3, 0x44($sp)
    /* 8EA60 8009EA60 4000B28F */  lw         $s2, 0x40($sp)
    /* 8EA64 8009EA64 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 8EA68 8009EA68 3800B08F */  lw         $s0, 0x38($sp)
    /* 8EA6C 8009EA6C 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 8EA70 8009EA70 0800E003 */  jr         $ra
    /* 8EA74 8009EA74 00000000 */   nop
endlabel mteleportfx__Fv
