.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeCopyPlayerInfoForReturn__Fv, 0x114

glabel FeCopyPlayerInfoForReturn__Fv
    /* 1EBC 8013BAB4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1EC0 8013BAB8 0E80023C */  lui        $v0, %hi(plr + 0x166)
    /* 1EC4 8013BABC 9EA64224 */  addiu      $v0, $v0, %lo(plr + 0x166)
    /* 1EC8 8013BAC0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1ECC 8013BAC4 11005324 */  addiu      $s3, $v0, 0x11
    /* 1ED0 8013BAC8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1ED4 8013BACC 21904000 */  addu       $s2, $v0, $zero
    /* 1ED8 8013BAD0 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1EDC 8013BAD4 C81F838F */  lw         $v1, %gp_rel(D_8011C748)($gp)
    /* 1EE0 8013BAD8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1EE4 8013BADC 21800000 */  addu       $s0, $zero, $zero
    /* 1EE8 8013BAE0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1EEC 8013BAE4 21880000 */  addu       $s1, $zero, $zero
    /* 1EF0 8013BAE8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1EF4 8013BAEC 01004224 */  addiu      $v0, $v0, 0x1
    /* 1EF8 8013BAF0 000062AC */  sw         $v0, 0x0($v1)
  .L8013BAF4:
    /* 1EFC 8013BAF4 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1F00 8013BAF8 00000000 */  nop
    /* 1F04 8013BAFC 2A105000 */  slt        $v0, $v0, $s0
    /* 1F08 8013BB00 29004014 */  bnez       $v0, .L8013BBA8
    /* 1F0C 8013BB04 80181000 */   sll       $v1, $s0, 2
    /* 1F10 8013BB08 1280013C */  lui        $at, %hi(LoadedChar)
    /* 1F14 8013BB0C 21082300 */  addu       $at, $at, $v1
    /* 1F18 8013BB10 28B3228C */  lw         $v0, %lo(LoadedChar)($at)
    /* 1F1C 8013BB14 00000000 */  nop
    /* 1F20 8013BB18 13004014 */  bnez       $v0, .L8013BB68
    /* 1F24 8013BB1C 10000224 */   addiu     $v0, $zero, 0x10
    /* 1F28 8013BB20 0D80053C */  lui        $a1, %hi(FePlayerName)
    /* 1F2C 8013BB24 F8E2A524 */  addiu      $a1, $a1, %lo(FePlayerName)
    /* 1F30 8013BB28 21282502 */  addu       $a1, $s1, $a1
    /* 1F34 8013BB2C 00311000 */  sll        $a2, $s0, 4
    /* 1F38 8013BB30 0400C424 */  addiu      $a0, $a2, 0x4
    /* 1F3C 8013BB34 C81F828F */  lw         $v0, %gp_rel(D_8011C748)($gp)
    /* 1F40 8013BB38 1280013C */  lui        $at, %hi(FeChrClass)
    /* 1F44 8013BB3C 21082300 */  addu       $at, $at, $v1
    /* 1F48 8013BB40 8CB3238C */  lw         $v1, %lo(FeChrClass)($at)
    /* 1F4C 8013BB44 21204400 */  addu       $a0, $v0, $a0
    /* 1F50 8013BB48 21104600 */  addu       $v0, $v0, $a2
    /* 1F54 8013BB4C F240000C */  jal        strcpy
    /* 1F58 8013BB50 100043AC */   sw        $v1, 0x10($v0)
    /* 1F5C 8013BB54 21200002 */  addu       $a0, $s0, $zero
    /* 1F60 8013BB58 FD25020C */  jal        PAD_GetPad__FiUc
    /* 1F64 8013BB5C 21280000 */   addu      $a1, $zero, $zero
    /* 1F68 8013BB60 E6EE0408 */  j          .L8013BB98
    /* 1F6C 8013BB64 E8197326 */   addiu     $s3, $s3, 0x19E8
  .L8013BB68:
    /* 1F70 8013BB68 10004326 */  addiu      $v1, $s2, 0x10
  .L8013BB6C:
    /* 1F74 8013BB6C 000060A0 */  sb         $zero, 0x0($v1)
    /* 1F78 8013BB70 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1F7C 8013BB74 FDFF4104 */  bgez       $v0, .L8013BB6C
    /* 1F80 8013BB78 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 1F84 8013BB7C 09000224 */  addiu      $v0, $zero, 0x9
    /* 1F88 8013BB80 09006326 */  addiu      $v1, $s3, 0x9
  .L8013BB84:
    /* 1F8C 8013BB84 000060A0 */  sb         $zero, 0x0($v1)
    /* 1F90 8013BB88 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1F94 8013BB8C FDFF4104 */  bgez       $v0, .L8013BB84
    /* 1F98 8013BB90 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 1F9C 8013BB94 E8197326 */  addiu      $s3, $s3, 0x19E8
  .L8013BB98:
    /* 1FA0 8013BB98 E8195226 */  addiu      $s2, $s2, 0x19E8
    /* 1FA4 8013BB9C 0B003126 */  addiu      $s1, $s1, 0xB
    /* 1FA8 8013BBA0 BDEE0408 */  j          .L8013BAF4
    /* 1FAC 8013BBA4 01001026 */   addiu     $s0, $s0, 0x1
  .L8013BBA8:
    /* 1FB0 8013BBA8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1FB4 8013BBAC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1FB8 8013BBB0 1800B28F */  lw         $s2, 0x18($sp)
    /* 1FBC 8013BBB4 1400B18F */  lw         $s1, 0x14($sp)
    /* 1FC0 8013BBB8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1FC4 8013BBBC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1FC8 8013BBC0 0800E003 */  jr         $ra
    /* 1FCC 8013BBC4 00000000 */   nop
endlabel FeCopyPlayerInfoForReturn__Fv
