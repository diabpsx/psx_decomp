.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetVileMissPos__Fiii, 0x13C

glabel GetVileMissPos__Fiii
    /* 3C20 8013D818 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 3C24 8013D81C 3000B6AF */  sw         $s6, 0x30($sp)
    /* 3C28 8013D820 21B08000 */  addu       $s6, $a0, $zero
    /* 3C2C 8013D824 3400B7AF */  sw         $s7, 0x34($sp)
    /* 3C30 8013D828 21B8A000 */  addu       $s7, $a1, $zero
    /* 3C34 8013D82C 2118C000 */  addu       $v1, $a2, $zero
    /* 3C38 8013D830 2000B2AF */  sw         $s2, 0x20($sp)
    /* 3C3C 8013D834 01001224 */  addiu      $s2, $zero, 0x1
    /* 3C40 8013D838 80101600 */  sll        $v0, $s6, 2
    /* 3C44 8013D83C 21105600 */  addu       $v0, $v0, $s6
    /* 3C48 8013D840 80100200 */  sll        $v0, $v0, 2
    /* 3C4C 8013D844 3800BEAF */  sw         $fp, 0x38($sp)
    /* 3C50 8013D848 23F05600 */  subu       $fp, $v0, $s6
    /* 3C54 8013D84C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 3C58 8013D850 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 3C5C 8013D854 2800B4AF */  sw         $s4, 0x28($sp)
    /* 3C60 8013D858 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3C64 8013D85C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 3C68 8013D860 1800B0AF */  sw         $s0, 0x18($sp)
  .L8013D864:
    /* 3C6C 8013D864 3200422A */  slti       $v0, $s2, 0x32
    /* 3C70 8013D868 22004010 */  beqz       $v0, .L8013D8F4
    /* 3C74 8013D86C 23A01200 */   negu      $s4, $s2
  .L8013D870:
    /* 3C78 8013D870 2A105402 */  slt        $v0, $s2, $s4
    /* 3C7C 8013D874 1D004014 */  bnez       $v0, .L8013D8EC
    /* 3C80 8013D878 23801200 */   negu      $s0, $s2
    /* 3C84 8013D87C 2A105002 */  slt        $v0, $s2, $s0
    /* 3C88 8013D880 18004014 */  bnez       $v0, .L8013D8E4
    /* 3C8C 8013D884 21A87400 */   addu      $s5, $v1, $s4
    /* 3C90 8013D888 80981E00 */  sll        $s3, $fp, 2
    /* 3C94 8013D88C 2188F002 */  addu       $s1, $s7, $s0
  .L8013D890:
    /* 3C98 8013D890 21282002 */  addu       $a1, $s1, $zero
    /* 3C9C 8013D894 1280043C */  lui        $a0, %hi(myplr)
    /* 3CA0 8013D898 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 3CA4 8013D89C 2130A002 */  addu       $a2, $s5, $zero
    /* 3CA8 8013D8A0 DB9A010C */  jal        PosOkPlayer__Fiii
    /* 3CAC 8013D8A4 1000A3AF */   sw        $v1, 0x10($sp)
    /* 3CB0 8013D8A8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 3CB4 8013D8AC 1000A38F */  lw         $v1, 0x10($sp)
    /* 3CB8 8013D8B0 09004010 */  beqz       $v0, .L8013D8D8
    /* 3CBC 8013D8B4 01001026 */   addiu     $s0, $s0, 0x1
    /* 3CC0 8013D8B8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 3CC4 8013D8BC 21083300 */  addu       $at, $at, $s3
    /* 3CC8 8013D8C0 892C31A0 */  sb         $s1, %lo(missile + 0x31)($at)
    /* 3CCC 8013D8C4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 3CD0 8013D8C8 21083300 */  addu       $at, $at, $s3
    /* 3CD4 8013D8CC 8A2C35A0 */  sb         $s5, %lo(missile + 0x32)($at)
    /* 3CD8 8013D8D0 48F60408 */  j          .L8013D920
    /* 3CDC 8013D8D4 00000000 */   nop
  .L8013D8D8:
    /* 3CE0 8013D8D8 2A105002 */  slt        $v0, $s2, $s0
    /* 3CE4 8013D8DC ECFF4010 */  beqz       $v0, .L8013D890
    /* 3CE8 8013D8E0 2188F002 */   addu      $s1, $s7, $s0
  .L8013D8E4:
    /* 3CEC 8013D8E4 1CF60408 */  j          .L8013D870
    /* 3CF0 8013D8E8 01009426 */   addiu     $s4, $s4, 0x1
  .L8013D8EC:
    /* 3CF4 8013D8EC 19F60408 */  j          .L8013D864
    /* 3CF8 8013D8F0 01005226 */   addiu     $s2, $s2, 0x1
  .L8013D8F4:
    /* 3CFC 8013D8F4 80101600 */  sll        $v0, $s6, 2
    /* 3D00 8013D8F8 21105600 */  addu       $v0, $v0, $s6
    /* 3D04 8013D8FC 80100200 */  sll        $v0, $v0, 2
    /* 3D08 8013D900 23105600 */  subu       $v0, $v0, $s6
    /* 3D0C 8013D904 80100200 */  sll        $v0, $v0, 2
    /* 3D10 8013D908 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 3D14 8013D90C 21082200 */  addu       $at, $at, $v0
    /* 3D18 8013D910 892C37A0 */  sb         $s7, %lo(missile + 0x31)($at)
    /* 3D1C 8013D914 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 3D20 8013D918 21082200 */  addu       $at, $at, $v0
    /* 3D24 8013D91C 8A2C23A0 */  sb         $v1, %lo(missile + 0x32)($at)
  .L8013D920:
    /* 3D28 8013D920 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 3D2C 8013D924 3800BE8F */  lw         $fp, 0x38($sp)
    /* 3D30 8013D928 3400B78F */  lw         $s7, 0x34($sp)
    /* 3D34 8013D92C 3000B68F */  lw         $s6, 0x30($sp)
    /* 3D38 8013D930 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 3D3C 8013D934 2800B48F */  lw         $s4, 0x28($sp)
    /* 3D40 8013D938 2400B38F */  lw         $s3, 0x24($sp)
    /* 3D44 8013D93C 2000B28F */  lw         $s2, 0x20($sp)
    /* 3D48 8013D940 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3D4C 8013D944 1800B08F */  lw         $s0, 0x18($sp)
    /* 3D50 8013D948 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 3D54 8013D94C 0800E003 */  jr         $ra
    /* 3D58 8013D950 00000000 */   nop
endlabel GetVileMissPos__Fiii
