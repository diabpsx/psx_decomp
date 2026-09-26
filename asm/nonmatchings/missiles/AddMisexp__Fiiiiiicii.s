.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMisexp__Fiiiiiicii, 0x22C

glabel AddMisexp__Fiiiiiicii
    /* 4ED4 8013EACC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4ED8 8013EAD0 3800A283 */  lb         $v0, 0x38($sp)
    /* 4EDC 8013EAD4 3C00A38F */  lw         $v1, 0x3C($sp)
    /* 4EE0 8013EAD8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4EE4 8013EADC 21808000 */  addu       $s0, $a0, $zero
    /* 4EE8 8013EAE0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4EEC 8013EAE4 2190E000 */  addu       $s2, $a3, $zero
    /* 4EF0 8013EAE8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 4EF4 8013EAEC 30004010 */  beqz       $v0, .L8013EBB0
    /* 4EF8 8013EAF0 1400B1AF */   sw        $s1, 0x14($sp)
    /* 4EFC 8013EAF4 2E006018 */  blez       $v1, .L8013EBB0
    /* 4F00 8013EAF8 40100300 */   sll       $v0, $v1, 1
    /* 4F04 8013EAFC 21104300 */  addu       $v0, $v0, $v1
    /* 4F08 8013EB00 80100200 */  sll        $v0, $v0, 2
    /* 4F0C 8013EB04 21104300 */  addu       $v0, $v0, $v1
    /* 4F10 8013EB08 C0880200 */  sll        $s1, $v0, 3
    /* 4F14 8013EB0C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 4F18 8013EB10 21083100 */  addu       $at, $at, $s1
    /* 4F1C 8013EB14 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 4F20 8013EB18 00000000 */  nop
    /* 4F24 8013EB1C 12004390 */  lbu        $v1, 0x12($v0)
    /* 4F28 8013EB20 65000224 */  addiu      $v0, $zero, 0x65
    /* 4F2C 8013EB24 03006214 */  bne        $v1, $v0, .L8013EB34
    /* 4F30 8013EB28 00000000 */   nop
    /* 4F34 8013EB2C D3F4040C */  jal        SetMissAnim__Fii
    /* 4F38 8013EB30 17000524 */   addiu     $a1, $zero, 0x17
  .L8013EB34:
    /* 4F3C 8013EB34 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 4F40 8013EB38 21083100 */  addu       $at, $at, $s1
    /* 4F44 8013EB3C F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 4F48 8013EB40 00000000 */  nop
    /* 4F4C 8013EB44 12004390 */  lbu        $v1, 0x12($v0)
    /* 4F50 8013EB48 66000224 */  addiu      $v0, $zero, 0x66
    /* 4F54 8013EB4C 03006214 */  bne        $v1, $v0, .L8013EB5C
    /* 4F58 8013EB50 21200002 */   addu      $a0, $s0, $zero
    /* 4F5C 8013EB54 D3F4040C */  jal        SetMissAnim__Fii
    /* 4F60 8013EB58 29000524 */   addiu     $a1, $zero, 0x29
  .L8013EB5C:
    /* 4F64 8013EB5C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 4F68 8013EB60 21083100 */  addu       $at, $at, $s1
    /* 4F6C 8013EB64 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 4F70 8013EB68 00000000 */  nop
    /* 4F74 8013EB6C 12004390 */  lbu        $v1, 0x12($v0)
    /* 4F78 8013EB70 67000224 */  addiu      $v0, $zero, 0x67
    /* 4F7C 8013EB74 03006214 */  bne        $v1, $v0, .L8013EB84
    /* 4F80 8013EB78 21200002 */   addu      $a0, $s0, $zero
    /* 4F84 8013EB7C D3F4040C */  jal        SetMissAnim__Fii
    /* 4F88 8013EB80 2D000524 */   addiu     $a1, $zero, 0x2D
  .L8013EB84:
    /* 4F8C 8013EB84 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 4F90 8013EB88 21083100 */  addu       $at, $at, $s1
    /* 4F94 8013EB8C F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 4F98 8013EB90 00000000 */  nop
    /* 4F9C 8013EB94 12004390 */  lbu        $v1, 0x12($v0)
    /* 4FA0 8013EB98 68000224 */  addiu      $v0, $zero, 0x68
    /* 4FA4 8013EB9C 05006214 */  bne        $v1, $v0, .L8013EBB4
    /* 4FA8 8013EBA0 80181000 */   sll       $v1, $s0, 2
    /* 4FAC 8013EBA4 21200002 */  addu       $a0, $s0, $zero
    /* 4FB0 8013EBA8 D3F4040C */  jal        SetMissAnim__Fii
    /* 4FB4 8013EBAC 2B000524 */   addiu     $a1, $zero, 0x2B
  .L8013EBB0:
    /* 4FB8 8013EBB0 80181000 */  sll        $v1, $s0, 2
  .L8013EBB4:
    /* 4FBC 8013EBB4 21187000 */  addu       $v1, $v1, $s0
    /* 4FC0 8013EBB8 80180300 */  sll        $v1, $v1, 2
    /* 4FC4 8013EBBC 23187000 */  subu       $v1, $v1, $s0
    /* 4FC8 8013EBC0 80101200 */  sll        $v0, $s2, 2
    /* 4FCC 8013EBC4 21105200 */  addu       $v0, $v0, $s2
    /* 4FD0 8013EBC8 80100200 */  sll        $v0, $v0, 2
    /* 4FD4 8013EBCC 23105200 */  subu       $v0, $v0, $s2
    /* 4FD8 8013EBD0 80100200 */  sll        $v0, $v0, 2
    /* 4FDC 8013EBD4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 4FE0 8013EBD8 21082200 */  addu       $at, $at, $v0
    /* 4FE4 8013EBDC 892C2490 */  lbu        $a0, %lo(missile + 0x31)($at)
    /* 4FE8 8013EBE0 80180300 */  sll        $v1, $v1, 2
    /* 4FEC 8013EBE4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 4FF0 8013EBE8 21082300 */  addu       $at, $at, $v1
    /* 4FF4 8013EBEC 892C24A0 */  sb         $a0, %lo(missile + 0x31)($at)
    /* 4FF8 8013EBF0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 4FFC 8013EBF4 21082200 */  addu       $at, $at, $v0
    /* 5000 8013EBF8 8A2C2490 */  lbu        $a0, %lo(missile + 0x32)($at)
    /* 5004 8013EBFC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 5008 8013EC00 21082300 */  addu       $at, $at, $v1
    /* 500C 8013EC04 8A2C24A0 */  sb         $a0, %lo(missile + 0x32)($at)
    /* 5010 8013EC08 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 5014 8013EC0C 21082200 */  addu       $at, $at, $v0
    /* 5018 8013EC10 8D2C2490 */  lbu        $a0, %lo(missile + 0x35)($at)
    /* 501C 8013EC14 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 5020 8013EC18 21082300 */  addu       $at, $at, $v1
    /* 5024 8013EC1C 8D2C24A0 */  sb         $a0, %lo(missile + 0x35)($at)
    /* 5028 8013EC20 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 502C 8013EC24 21082200 */  addu       $at, $at, $v0
    /* 5030 8013EC28 8E2C2490 */  lbu        $a0, %lo(missile + 0x36)($at)
    /* 5034 8013EC2C 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 5038 8013EC30 21082300 */  addu       $at, $at, $v1
    /* 503C 8013EC34 8E2C24A0 */  sb         $a0, %lo(missile + 0x36)($at)
    /* 5040 8013EC38 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 5044 8013EC3C 21082200 */  addu       $at, $at, $v0
    /* 5048 8013EC40 8B2C2490 */  lbu        $a0, %lo(missile + 0x33)($at)
    /* 504C 8013EC44 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 5050 8013EC48 21082300 */  addu       $at, $at, $v1
    /* 5054 8013EC4C 8B2C24A0 */  sb         $a0, %lo(missile + 0x33)($at)
    /* 5058 8013EC50 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 505C 8013EC54 21082200 */  addu       $at, $at, $v0
    /* 5060 8013EC58 8C2C2490 */  lbu        $a0, %lo(missile + 0x34)($at)
    /* 5064 8013EC5C 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 5068 8013EC60 21082300 */  addu       $at, $at, $v1
    /* 506C 8013EC64 8C2C24A0 */  sb         $a0, %lo(missile + 0x34)($at)
    /* 5070 8013EC68 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 5074 8013EC6C 21082300 */  addu       $at, $at, $v1
    /* 5078 8013EC70 9A2C2490 */  lbu        $a0, %lo(missile + 0x42)($at)
    /* 507C 8013EC74 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 5080 8013EC78 21082200 */  addu       $at, $at, $v0
    /* 5084 8013EC7C 602C258C */  lw         $a1, %lo(missile + 0x8)($at)
    /* 5088 8013EC80 00260400 */  sll        $a0, $a0, 24
    /* 508C 8013EC84 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 5090 8013EC88 21082300 */  addu       $at, $at, $v1
    /* 5094 8013EC8C 602C25AC */  sw         $a1, %lo(missile + 0x8)($at)
    /* 5098 8013EC90 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 509C 8013EC94 21082200 */  addu       $at, $at, $v0
    /* 50A0 8013EC98 642C228C */  lw         $v0, %lo(missile + 0xC)($at)
    /* 50A4 8013EC9C 03260400 */  sra        $a0, $a0, 24
    /* 50A8 8013ECA0 1080013C */  lui        $at, %hi(missile)
    /* 50AC 8013ECA4 21082300 */  addu       $at, $at, $v1
    /* 50B0 8013ECA8 582C20AC */  sw         $zero, %lo(missile)($at)
    /* 50B4 8013ECAC 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 50B8 8013ECB0 21082300 */  addu       $at, $at, $v1
    /* 50BC 8013ECB4 5C2C20AC */  sw         $zero, %lo(missile + 0x4)($at)
    /* 50C0 8013ECB8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 50C4 8013ECBC 21082300 */  addu       $at, $at, $v1
    /* 50C8 8013ECC0 702C24A4 */  sh         $a0, %lo(missile + 0x18)($at)
    /* 50CC 8013ECC4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 50D0 8013ECC8 21082300 */  addu       $at, $at, $v1
    /* 50D4 8013ECCC 762C20A4 */  sh         $zero, %lo(missile + 0x1E)($at)
    /* 50D8 8013ECD0 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 50DC 8013ECD4 21082300 */  addu       $at, $at, $v1
    /* 50E0 8013ECD8 642C22AC */  sw         $v0, %lo(missile + 0xC)($at)
    /* 50E4 8013ECDC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 50E8 8013ECE0 1800B28F */  lw         $s2, 0x18($sp)
    /* 50EC 8013ECE4 1400B18F */  lw         $s1, 0x14($sp)
    /* 50F0 8013ECE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 50F4 8013ECEC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 50F8 8013ECF0 0800E003 */  jr         $ra
    /* 50FC 8013ECF4 00000000 */   nop
endlabel AddMisexp__Fiiiiiicii
