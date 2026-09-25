.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GazDefragMem, 0x168

glabel GazDefragMem
    /* 12988 80022988 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1298C 8002298C FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 12990 80022990 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 12994 80022994 3000B4AF */  sw         $s4, 0x30($sp)
    /* 12998 80022998 24A08200 */  and        $s4, $a0, $v0
    /* 1299C 8002299C 21208002 */  addu       $a0, $s4, $zero
    /* 129A0 800229A0 3400BFAF */  sw         $ra, 0x34($sp)
    /* 129A4 800229A4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 129A8 800229A8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 129AC 800229AC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 129B0 800229B0 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 129B4 800229B4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 129B8 800229B8 21884000 */  addu       $s1, $v0, $zero
    /* 129BC 800229BC 08002012 */  beqz       $s1, .L800229E0
    /* 129C0 800229C0 04000434 */   ori       $a0, $zero, 0x4
    /* 129C4 800229C4 1400228E */  lw         $v0, 0x14($s1)
    /* 129C8 800229C8 00000000 */  nop
    /* 129CC 800229CC 08004014 */  bnez       $v0, .L800229F0
    /* 129D0 800229D0 1800B027 */   addiu     $s0, $sp, 0x18
    /* 129D4 800229D4 788A0008 */  j          .L800229E0
    /* 129D8 800229D8 09000434 */   ori       $a0, $zero, 0x9
  .L800229DC:
    /* 129DC 800229DC 01000434 */  ori        $a0, $zero, 0x1
  .L800229E0:
    /* 129E0 800229E0 0389000C */  jal        GSetError
    /* 129E4 800229E4 00000000 */   nop
    /* 129E8 800229E8 B38A0008 */  j          .L80022ACC
    /* 129EC 800229EC 21100000 */   addu      $v0, $zero, $zero
  .L800229F0:
    /* 129F0 800229F0 21200002 */  addu       $a0, $s0, $zero
    /* 129F4 800229F4 24002526 */  addiu      $a1, $s1, 0x24
    /* 129F8 800229F8 7E8B000C */  jal        PutAllLockedBlocksOntoList
    /* 129FC 800229FC 1800A0AF */   sw        $zero, 0x18($sp)
    /* 12A00 80022A00 9D8B000C */  jal        SortMemHdrListByAddr
    /* 12A04 80022A04 21200002 */   addu      $a0, $s0, $zero
    /* 12A08 80022A08 F28A000C */  jal        DeleteEmptyBlocks
    /* 12A0C 80022A0C 21202002 */   addu      $a0, $s1, $zero
    /* 12A10 80022A10 1C00B327 */  addiu      $s3, $sp, 0x1C
    /* 12A14 80022A14 1000A0AF */  sw         $zero, 0x10($sp)
  .L80022A18:
    /* 12A18 80022A18 1000A427 */  addiu      $a0, $sp, 0x10
  .L80022A1C:
    /* 12A1C 80022A1C 1800A58F */  lw         $a1, 0x18($sp)
    /* 12A20 80022A20 0D8B000C */  jal        GetRegion
    /* 12A24 80022A24 21302002 */   addu      $a2, $s1, $zero
    /* 12A28 80022A28 FF004230 */  andi       $v0, $v0, 0xFF
    /* 12A2C 80022A2C 24004010 */  beqz       $v0, .L80022AC0
    /* 12A30 80022A30 24002426 */   addiu     $a0, $s1, 0x24
    /* 12A34 80022A34 1400A28F */  lw         $v0, 0x14($sp)
    /* 12A38 80022A38 00000000 */  nop
    /* 12A3C 80022A3C F6FF4010 */  beqz       $v0, .L80022A18
    /* 12A40 80022A40 1000A427 */   addiu     $a0, $sp, 0x10
    /* 12A44 80022A44 21286002 */  addu       $a1, $s3, $zero
    /* 12A48 80022A48 24002626 */  addiu      $a2, $s1, 0x24
    /* 12A4C 80022A4C BC8A000C */  jal        PutBlocksInRegionIntoList
    /* 12A50 80022A50 1C00A0AF */   sw        $zero, 0x1C($sp)
    /* 12A54 80022A54 9D8B000C */  jal        SortMemHdrListByAddr
    /* 12A58 80022A58 21206002 */   addu      $a0, $s3, $zero
    /* 12A5C 80022A5C 1000A527 */  addiu      $a1, $sp, 0x10
    /* 12A60 80022A60 1C00A48F */  lw         $a0, 0x1C($sp)
    /* 12A64 80022A64 5A8B000C */  jal        ShuffleBlocks
    /* 12A68 80022A68 21302002 */   addu      $a2, $s1, $zero
    /* 12A6C 80022A6C 1400A38F */  lw         $v1, 0x14($sp)
    /* 12A70 80022A70 21904000 */  addu       $s2, $v0, $zero
    /* 12A74 80022A74 23807200 */  subu       $s0, $v1, $s2
    /* 12A78 80022A78 0D000012 */  beqz       $s0, .L80022AB0
    /* 12A7C 80022A7C 24002426 */   addiu     $a0, $s1, 0x24
    /* 12A80 80022A80 2288000C */  jal        GetFreeMemHdrBlock
    /* 12A84 80022A84 00000000 */   nop
    /* 12A88 80022A88 21284000 */  addu       $a1, $v0, $zero
    /* 12A8C 80022A8C D3FFA010 */  beqz       $a1, .L800229DC
    /* 12A90 80022A90 21202002 */   addu      $a0, $s1, $zero
    /* 12A94 80022A94 1000A28F */  lw         $v0, 0x10($sp)
    /* 12A98 80022A98 0C00B0AC */  sw         $s0, 0xC($a1)
    /* 12A9C 80022A9C 1200B4A4 */  sh         $s4, 0x12($a1)
    /* 12AA0 80022AA0 21104202 */  addu       $v0, $s2, $v0
    /* 12AA4 80022AA4 3587000C */  jal        MergeToEmptyList
    /* 12AA8 80022AA8 0800A2AC */   sw        $v0, 0x8($a1)
    /* 12AAC 80022AAC 24002426 */  addiu      $a0, $s1, 0x24
  .L80022AB0:
    /* 12AB0 80022AB0 CA8B000C */  jal        GraftMemHdrList
    /* 12AB4 80022AB4 21286002 */   addu      $a1, $s3, $zero
    /* 12AB8 80022AB8 878A0008 */  j          .L80022A1C
    /* 12ABC 80022ABC 1000A427 */   addiu     $a0, $sp, 0x10
  .L80022AC0:
    /* 12AC0 80022AC0 7E8B000C */  jal        PutAllLockedBlocksOntoList
    /* 12AC4 80022AC4 1800A527 */   addiu     $a1, $sp, 0x18
    /* 12AC8 80022AC8 01000234 */  ori        $v0, $zero, 0x1
  .L80022ACC:
    /* 12ACC 80022ACC 3400BF8F */  lw         $ra, 0x34($sp)
    /* 12AD0 80022AD0 3000B48F */  lw         $s4, 0x30($sp)
    /* 12AD4 80022AD4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 12AD8 80022AD8 2800B28F */  lw         $s2, 0x28($sp)
    /* 12ADC 80022ADC 2400B18F */  lw         $s1, 0x24($sp)
    /* 12AE0 80022AE0 2000B08F */  lw         $s0, 0x20($sp)
    /* 12AE4 80022AE4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 12AE8 80022AE8 0800E003 */  jr         $ra
    /* 12AEC 80022AEC 00000000 */   nop
endlabel GazDefragMem
