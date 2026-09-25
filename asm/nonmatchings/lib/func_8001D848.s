.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001D848, 0x1F0

glabel func_8001D848
    /* D848 8001D848 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* D84C 8001D84C 2000B2AF */  sw         $s2, 0x20($sp)
    /* D850 8001D850 21908000 */  addu       $s2, $a0, $zero
    /* D854 8001D854 21200000 */  addu       $a0, $zero, $zero
    /* D858 8001D858 2400BFAF */  sw         $ra, 0x24($sp)
    /* D85C 8001D85C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* D860 8001D860 8C6B000C */  jal        CdSyncCallback
    /* D864 8001D864 1800B0AF */   sw        $s0, 0x18($sp)
    /* D868 8001D868 916B000C */  jal        CdReadyCallback
    /* D86C 8001D86C 21200000 */   addu      $a0, $zero, $zero
    /* D870 8001D870 0B80103C */  lui        $s0, %hi(D_800B6250)
    /* D874 8001D874 50621026 */  addiu      $s0, $s0, %lo(D_800B6250)
    /* D878 8001D878 0000028E */  lw         $v0, 0x0($s0)
    /* D87C 8001D87C 00000000 */  nop
    /* D880 8001D880 01004230 */  andi       $v0, $v0, 0x1
    /* D884 8001D884 03004010 */  beqz       $v0, .L8001D894
    /* D888 8001D888 00000000 */   nop
    /* D88C 8001D88C 9D6C000C */  jal        CdDataCallback
    /* D890 8001D890 21200000 */   addu      $a0, $zero, $zero
  .L8001D894:
    /* D894 8001D894 2B6B000C */  jal        CdStatus
    /* D898 8001D898 00000000 */   nop
    /* D89C 8001D89C 10004230 */  andi       $v0, $v0, 0x10
    /* D8A0 8001D8A0 15004010 */  beqz       $v0, .L8001D8F8
    /* D8A4 8001D8A4 00000000 */   nop
    /* D8A8 8001D8A8 1748000C */  jal        VSync
    /* D8AC 8001D8AC FFFF0424 */   addiu     $a0, $zero, -0x1
    /* D8B0 8001D8B0 3F004230 */  andi       $v0, $v0, 0x3F
    /* D8B4 8001D8B4 05004014 */  bnez       $v0, .L8001D8CC
    /* D8B8 8001D8B8 01000424 */   addiu     $a0, $zero, 0x1
    /* D8BC 8001D8BC 1180043C */  lui        $a0, %hi(D_8010E6D0)
    /* D8C0 8001D8C0 7567000C */  jal        puts
    /* D8C4 8001D8C4 D0E68424 */   addiu     $a0, $a0, %lo(D_8010E6D0)
    /* D8C8 8001D8C8 01000424 */  addiu      $a0, $zero, 0x1
  .L8001D8CC:
    /* D8CC 8001D8CC E56B000C */  jal        CdControlF
    /* D8D0 8001D8D0 21280000 */   addu      $a1, $zero, $zero
    /* D8D4 8001D8D4 1748000C */  jal        VSync
    /* D8D8 8001D8D8 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* D8DC 8001D8DC D0FF0326 */  addiu      $v1, $s0, -0x30
    /* D8E0 8001D8E0 1C0062AC */  sw         $v0, 0x1C($v1)
    /* D8E4 8001D8E4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* D8E8 8001D8E8 140062AC */  sw         $v0, 0x14($v1)
    /* D8EC 8001D8EC 1400628C */  lw         $v0, 0x14($v1)
    /* D8F0 8001D8F0 88760008 */  j          .L8001DA20
    /* D8F4 8001D8F4 00000000 */   nop
  .L8001D8F8:
    /* D8F8 8001D8F8 15004012 */  beqz       $s2, .L8001D950
    /* D8FC 8001D8FC 00000000 */   nop
    /* D900 8001D900 1180043C */  lui        $a0, %hi(D_8010E6E8)
    /* D904 8001D904 7567000C */  jal        puts
    /* D908 8001D908 E8E68424 */   addiu     $a0, $a0, %lo(D_8010E6E8)
    /* D90C 8001D90C 09000424 */  addiu      $a0, $zero, 0x9
    /* D910 8001D910 21280000 */  addu       $a1, $zero, $zero
    /* D914 8001D914 966B000C */  jal        CdControl
    /* D918 8001D918 21300000 */   addu      $a2, $zero, $zero
    /* D91C 8001D91C 376B000C */  jal        CdLastPos
    /* D920 8001D920 00000000 */   nop
    /* D924 8001D924 02000424 */  addiu      $a0, $zero, 0x2
    /* D928 8001D928 21284000 */  addu       $a1, $v0, $zero
    /* D92C 8001D92C 966B000C */  jal        CdControl
    /* D930 8001D930 21300000 */   addu      $a2, $zero, $zero
    /* D934 8001D934 06004014 */  bnez       $v0, .L8001D950
    /* D938 8001D938 D0FF0226 */   addiu     $v0, $s0, -0x30
    /* D93C 8001D93C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* D940 8001D940 140043AC */  sw         $v1, 0x14($v0)
    /* D944 8001D944 E4FF028E */  lw         $v0, -0x1C($s0)
    /* D948 8001D948 88760008 */  j          .L8001DA20
    /* D94C 8001D94C 00000000 */   nop
  .L8001D950:
    /* D950 8001D950 556B000C */  jal        CdFlush
    /* D954 8001D954 00000000 */   nop
    /* D958 8001D958 0B80113C */  lui        $s1, %hi(D_800B622C)
    /* D95C 8001D95C 2C623126 */  addiu      $s1, $s1, %lo(D_800B622C)
    /* D960 8001D960 0000308E */  lw         $s0, 0x0($s1)
    /* D964 8001D964 00000000 */  nop
    /* D968 8001D968 1000B0A3 */  sb         $s0, 0x10($sp)
    /* D96C 8001D96C 2F6B000C */  jal        CdMode
    /* D970 8001D970 FF001032 */   andi      $s0, $s0, 0xFF
    /* D974 8001D974 03000216 */  bne        $s0, $v0, .L8001D984
    /* D978 8001D978 0E000424 */   addiu     $a0, $zero, 0xE
    /* D97C 8001D97C 0B004012 */  beqz       $s2, .L8001D9AC
    /* D980 8001D980 00000000 */   nop
  .L8001D984:
    /* D984 8001D984 1000A527 */  addiu      $a1, $sp, 0x10
    /* D988 8001D988 966B000C */  jal        CdControl
    /* D98C 8001D98C 21300000 */   addu      $a2, $zero, $zero
    /* D990 8001D990 06004014 */  bnez       $v0, .L8001D9AC
    /* D994 8001D994 F4FF2226 */   addiu     $v0, $s1, -0xC
    /* D998 8001D998 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* D99C 8001D99C 140043AC */  sw         $v1, 0x14($v0)
    /* D9A0 8001D9A0 1400428C */  lw         $v0, 0x14($v0)
    /* D9A4 8001D9A4 88760008 */  j          .L8001DA20
    /* D9A8 8001D9A8 00000000 */   nop
  .L8001D9AC:
    /* D9AC 8001D9AC 376B000C */  jal        CdLastPos
    /* D9B0 8001D9B0 00000000 */   nop
    /* D9B4 8001D9B4 EF6C000C */  jal        CdPosToInt
    /* D9B8 8001D9B8 21204000 */   addu      $a0, $v0, $zero
    /* D9BC 8001D9BC 0280043C */  lui        $a0, %hi(strncmp + 0x10)
    /* D9C0 8001D9C0 1CD58424 */  addiu      $a0, $a0, %lo(strncmp + 0x10)
    /* D9C4 8001D9C4 0B80103C */  lui        $s0, %hi(D_800B6220)
    /* D9C8 8001D9C8 20621026 */  addiu      $s0, $s0, %lo(D_800B6220)
    /* D9CC 8001D9CC 916B000C */  jal        CdReadyCallback
    /* D9D0 8001D9D0 200002AE */   sw        $v0, 0x20($s0)
    /* D9D4 8001D9D4 3000028E */  lw         $v0, 0x30($s0)
    /* D9D8 8001D9D8 00000000 */  nop
    /* D9DC 8001D9DC 01004230 */  andi       $v0, $v0, 0x1
    /* D9E0 8001D9E0 05004010 */  beqz       $v0, .L8001D9F8
    /* D9E4 8001D9E4 06000424 */   addiu     $a0, $zero, 0x6
    /* D9E8 8001D9E8 0280043C */  lui        $a0, %hi(D_8001D77C)
    /* D9EC 8001D9EC 9D6C000C */  jal        CdDataCallback
    /* D9F0 8001D9F0 7CD78424 */   addiu     $a0, $a0, %lo(D_8001D77C)
    /* D9F4 8001D9F4 06000424 */  addiu      $a0, $zero, 0x6
  .L8001D9F8:
    /* D9F8 8001D9F8 0400028E */  lw         $v0, 0x4($s0)
    /* D9FC 8001D9FC 21280000 */  addu       $a1, $zero, $zero
    /* DA00 8001DA00 E56B000C */  jal        CdControlF
    /* DA04 8001DA04 080002AE */   sw        $v0, 0x8($s0)
    /* DA08 8001DA08 0000028E */  lw         $v0, 0x0($s0)
    /* DA0C 8001DA0C FFFF0424 */  addiu      $a0, $zero, -0x1
    /* DA10 8001DA10 1748000C */  jal        VSync
    /* DA14 8001DA14 140002AE */   sw        $v0, 0x14($s0)
    /* DA18 8001DA18 180002AE */  sw         $v0, 0x18($s0)
    /* DA1C 8001DA1C 1400028E */  lw         $v0, 0x14($s0)
  .L8001DA20:
    /* DA20 8001DA20 2400BF8F */  lw         $ra, 0x24($sp)
    /* DA24 8001DA24 2000B28F */  lw         $s2, 0x20($sp)
    /* DA28 8001DA28 1C00B18F */  lw         $s1, 0x1C($sp)
    /* DA2C 8001DA2C 1800B08F */  lw         $s0, 0x18($sp)
    /* DA30 8001DA30 0800E003 */  jr         $ra
    /* DA34 8001DA34 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel func_8001D848
