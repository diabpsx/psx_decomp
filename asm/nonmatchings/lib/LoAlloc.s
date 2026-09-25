.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoAlloc, 0x198

glabel LoAlloc
    /* 11E84 80021E84 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 11E88 80021E88 1800B2AF */  sw         $s2, 0x18($sp)
    /* 11E8C 80021E8C 21908000 */  addu       $s2, $a0, $zero
    /* 11E90 80021E90 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11E94 80021E94 2188A000 */  addu       $s1, $a1, $zero
    /* 11E98 80021E98 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 11E9C 80021E9C 2198C000 */  addu       $s3, $a2, $zero
    /* 11EA0 80021EA0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 11EA4 80021EA4 21A8E000 */  addu       $s5, $a3, $zero
    /* 11EA8 80021EA8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 11EAC 80021EAC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 11EB0 80021EB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 11EB4 80021EB4 10004596 */  lhu        $a1, 0x10($s2)
    /* 11EB8 80021EB8 D086000C */  jal        AlignSize
    /* 11EBC 80021EBC 2120A002 */   addu      $a0, $s5, $zero
    /* 11EC0 80021EC0 0800238E */  lw         $v1, 0x8($s1)
    /* 11EC4 80021EC4 00000000 */  nop
    /* 11EC8 80021EC8 17007310 */  beq        $v1, $s3, .L80021F28
    /* 11ECC 80021ECC 21A04000 */   addu      $s4, $v0, $zero
    /* 11ED0 80021ED0 2288000C */  jal        GetFreeMemHdrBlock
    /* 11ED4 80021ED4 00000000 */   nop
    /* 11ED8 80021ED8 21804000 */  addu       $s0, $v0, $zero
    /* 11EDC 80021EDC 1C000012 */  beqz       $s0, .L80021F50
    /* 11EE0 80021EE0 21204002 */   addu      $a0, $s2, $zero
    /* 11EE4 80021EE4 0800228E */  lw         $v0, 0x8($s1)
    /* 11EE8 80021EE8 00000000 */  nop
    /* 11EEC 80021EEC 080002AE */  sw         $v0, 0x8($s0)
    /* 11EF0 80021EF0 0800228E */  lw         $v0, 0x8($s1)
    /* 11EF4 80021EF4 00000000 */  nop
    /* 11EF8 80021EF8 23106202 */  subu       $v0, $s3, $v0
    /* 11EFC 80021EFC 0C0002AE */  sw         $v0, 0xC($s0)
    /* 11F00 80021F00 08004296 */  lhu        $v0, 0x8($s2)
    /* 11F04 80021F04 21280002 */  addu       $a1, $s0, $zero
    /* 11F08 80021F08 3587000C */  jal        MergeToEmptyList
    /* 11F0C 80021F0C 120002A6 */   sh        $v0, 0x12($s0)
    /* 11F10 80021F10 0C00228E */  lw         $v0, 0xC($s1)
    /* 11F14 80021F14 080033AE */  sw         $s3, 0x8($s1)
    /* 11F18 80021F18 0C00038E */  lw         $v1, 0xC($s0)
    /* 11F1C 80021F1C 00000000 */  nop
    /* 11F20 80021F20 23104300 */  subu       $v0, $v0, $v1
    /* 11F24 80021F24 0C0022AE */  sw         $v0, 0xC($s1)
  .L80021F28:
    /* 11F28 80021F28 0C00228E */  lw         $v0, 0xC($s1)
    /* 11F2C 80021F2C 00000000 */  nop
    /* 11F30 80021F30 2B108202 */  sltu       $v0, $s4, $v0
    /* 11F34 80021F34 18004010 */  beqz       $v0, .L80021F98
    /* 11F38 80021F38 24004426 */   addiu     $a0, $s2, 0x24
    /* 11F3C 80021F3C 2288000C */  jal        GetFreeMemHdrBlock
    /* 11F40 80021F40 00000000 */   nop
    /* 11F44 80021F44 21804000 */  addu       $s0, $v0, $zero
    /* 11F48 80021F48 05000016 */  bnez       $s0, .L80021F60
    /* 11F4C 80021F4C 21204002 */   addu      $a0, $s2, $zero
  .L80021F50:
    /* 11F50 80021F50 0389000C */  jal        GSetError
    /* 11F54 80021F54 01000434 */   ori       $a0, $zero, 0x1
    /* 11F58 80021F58 FD870008 */  j          .L80021FF4
    /* 11F5C 80021F5C FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80021F60:
    /* 11F60 80021F60 0800228E */  lw         $v0, 0x8($s1)
    /* 11F64 80021F64 00000000 */  nop
    /* 11F68 80021F68 21108202 */  addu       $v0, $s4, $v0
    /* 11F6C 80021F6C 080002AE */  sw         $v0, 0x8($s0)
    /* 11F70 80021F70 0C00228E */  lw         $v0, 0xC($s1)
    /* 11F74 80021F74 00000000 */  nop
    /* 11F78 80021F78 23105400 */  subu       $v0, $v0, $s4
    /* 11F7C 80021F7C 0C0002AE */  sw         $v0, 0xC($s0)
    /* 11F80 80021F80 08004296 */  lhu        $v0, 0x8($s2)
    /* 11F84 80021F84 21280002 */  addu       $a1, $s0, $zero
    /* 11F88 80021F88 3587000C */  jal        MergeToEmptyList
    /* 11F8C 80021F8C 1200A2A4 */   sh        $v0, 0x12($a1)
    /* 11F90 80021F90 0C0034AE */  sw         $s4, 0xC($s1)
    /* 11F94 80021F94 24004426 */  addiu      $a0, $s2, 0x24
  .L80021F98:
    /* 11F98 80021F98 9B86000C */  jal        AttachHdrToList
    /* 11F9C 80021F9C 21282002 */   addu      $a1, $s1, $zero
    /* 11FA0 80021FA0 140020A6 */  sh         $zero, 0x14($s1)
    /* 11FA4 80021FA4 08004296 */  lhu        $v0, 0x8($s2)
    /* 11FA8 80021FA8 1280033C */  lui        $v1, %hi(D_8011C9E8)
    /* 11FAC 80021FAC E8C9638C */  lw         $v1, %lo(D_8011C9E8)($v1)
    /* 11FB0 80021FB0 1280043C */  lui        $a0, %hi(D_8011C9D8)
    /* 11FB4 80021FB4 D8C98494 */  lhu        $a0, %lo(D_8011C9D8)($a0)
    /* 11FB8 80021FB8 0200632C */  sltiu      $v1, $v1, 0x2
    /* 11FBC 80021FBC 120022A6 */  sh         $v0, 0x12($s1)
    /* 11FC0 80021FC0 08006014 */  bnez       $v1, .L80021FE4
    /* 11FC4 80021FC4 100024A6 */   sh        $a0, 0x10($s1)
    /* 11FC8 80021FC8 1180043C */  lui        $a0, %hi(D_8010E888)
    /* 11FCC 80021FCC 88E88424 */  addiu      $a0, $a0, %lo(D_8010E888)
    /* 11FD0 80021FD0 9B83000C */  jal        DBG_SendMessage
    /* 11FD4 80021FD4 2128A002 */   addu      $a1, $s5, $zero
    /* 11FD8 80021FD8 0800448E */  lw         $a0, 0x8($s2)
    /* 11FDC 80021FDC E18B000C */  jal        GAL_MemDump
    /* 11FE0 80021FE0 00000000 */   nop
  .L80021FE4:
    /* 11FE4 80021FE4 4000A58F */  lw         $a1, 0x40($sp)
    /* 11FE8 80021FE8 0D8C000C */  jal        SetBlockName
    /* 11FEC 80021FEC 21202002 */   addu      $a0, $s1, $zero
    /* 11FF0 80021FF0 16002296 */  lhu        $v0, 0x16($s1)
  .L80021FF4:
    /* 11FF4 80021FF4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 11FF8 80021FF8 2400B58F */  lw         $s5, 0x24($sp)
    /* 11FFC 80021FFC 2000B48F */  lw         $s4, 0x20($sp)
    /* 12000 80022000 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 12004 80022004 1800B28F */  lw         $s2, 0x18($sp)
    /* 12008 80022008 1400B18F */  lw         $s1, 0x14($sp)
    /* 1200C 8002200C 1000B08F */  lw         $s0, 0x10($sp)
    /* 12010 80022010 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 12014 80022014 0800E003 */  jr         $ra
    /* 12018 80022018 00000000 */   nop
endlabel LoAlloc
