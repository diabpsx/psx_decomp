.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintDead__7CBlocksii, 0x2C4

glabel PrintDead__7CBlocksii
    /* 809F4 800909F4 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 809F8 800909F8 6800B6AF */  sw         $s6, 0x68($sp)
    /* 809FC 800909FC 21B08000 */  addu       $s6, $a0, $zero
    /* 80A00 80090A00 5000B0AF */  sw         $s0, 0x50($sp)
    /* 80A04 80090A04 2180A000 */  addu       $s0, $a1, $zero
    /* 80A08 80090A08 5400B1AF */  sw         $s1, 0x54($sp)
    /* 80A0C 80090A0C 2188C000 */  addu       $s1, $a2, $zero
    /* 80A10 80090A10 0980073C */  lui        $a3, %hi(AddDead__FP9CacheInfoP8map_infoii)
    /* 80A14 80090A14 6809E724 */  addiu      $a3, $a3, %lo(AddDead__FP9CacheInfoP8map_infoii)
    /* 80A18 80090A18 7400BFAF */  sw         $ra, 0x74($sp)
    /* 80A1C 80090A1C 7000BEAF */  sw         $fp, 0x70($sp)
    /* 80A20 80090A20 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 80A24 80090A24 6400B5AF */  sw         $s5, 0x64($sp)
    /* 80A28 80090A28 6000B4AF */  sw         $s4, 0x60($sp)
    /* 80A2C 80090A2C 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 80A30 80090A30 5800B2AF */  sw         $s2, 0x58($sp)
    /* 80A34 80090A34 263C020C */  jal        IterateVisibleMap__7CBlocksiiPFP9CacheInfoP8map_infoii_ib
    /* 80A38 80090A38 1000A0AF */   sw        $zero, 0x10($sp)
    /* 80A3C 80090A3C 2120C002 */  addu       $a0, $s6, $zero
    /* 80A40 80090A40 F9FF1026 */  addiu      $s0, $s0, -0x7
    /* 80A44 80090A44 21280002 */  addu       $a1, $s0, $zero
    /* 80A48 80090A48 F5FF3126 */  addiu      $s1, $s1, -0xB
    /* 80A4C 80090A4C 801F083C */  lui        $t0, (0x1F800000 >> 16)
    /* 80A50 80090A50 0000088D */  lw         $t0, (0x1F800000 & 0xFFFF)($t0)
    /* 80A54 80090A54 21302002 */  addu       $a2, $s1, $zero
    /* 80A58 80090A58 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 80A5C 80090A5C 2000A8AF */   sw        $t0, 0x20($sp)
    /* 80A60 80090A60 2120C002 */  addu       $a0, $s6, $zero
    /* 80A64 80090A64 21280002 */  addu       $a1, $s0, $zero
    /* 80A68 80090A68 21302002 */  addu       $a2, $s1, $zero
    /* 80A6C 80090A6C 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 80A70 80090A70 2800A2AF */   sw        $v0, 0x28($sp)
    /* 80A74 80090A74 3000A2AF */  sw         $v0, 0x30($sp)
    /* 80A78 80090A78 4800A0AF */  sw         $zero, 0x48($sp)
    /* 80A7C 80090A7C C000C986 */  lh         $t1, 0xC0($s6)
    /* 80A80 80090A80 801F173C */  lui        $s7, (0x1F800004 >> 16)
    /* 80A84 80090A84 3800A9AF */  sw         $t1, 0x38($sp)
    /* 80A88 80090A88 C200C886 */  lh         $t0, 0xC2($s6)
    /* 80A8C 80090A8C 00000000 */  nop
    /* 80A90 80090A90 4000A8AF */  sw         $t0, 0x40($sp)
  .L80090A94:
    /* 80A94 80090A94 4800A98F */  lw         $t1, 0x48($sp)
    /* 80A98 80090A98 2000A88F */  lw         $t0, 0x20($sp)
    /* 80A9C 80090A9C 00000000 */  nop
    /* 80AA0 80090AA0 2A102801 */  slt        $v0, $t1, $t0
    /* 80AA4 80090AA4 77004010 */  beqz       $v0, .L80090C84
    /* 80AA8 80090AA8 00000000 */   nop
    /* 80AAC 80090AAC 0400E392 */  lbu        $v1, (0x1F800004 & 0xFFFF)($s7)
    /* 80AB0 80090AB0 00000000 */  nop
    /* 80AB4 80090AB4 1F006330 */  andi       $v1, $v1, 0x1F
    /* 80AB8 80090AB8 40100300 */  sll        $v0, $v1, 1
    /* 80ABC 80090ABC 21104300 */  addu       $v0, $v0, $v1
    /* 80AC0 80090AC0 80100200 */  sll        $v0, $v0, 2
    /* 80AC4 80090AC4 0D80013C */  lui        $at, %hi(tempstr + 0xF4)
    /* 80AC8 80090AC8 21082200 */  addu       $at, $at, $v0
    /* 80ACC 80090ACC 04EB238C */  lw         $v1, %lo(tempstr + 0xF4)($at)
    /* 80AD0 80090AD0 00000000 */  nop
    /* 80AD4 80090AD4 C0100300 */  sll        $v0, $v1, 3
    /* 80AD8 80090AD8 23104300 */  subu       $v0, $v0, $v1
    /* 80ADC 80090ADC 80100200 */  sll        $v0, $v0, 2
    /* 80AE0 80090AE0 1180033C */  lui        $v1, %hi(Monsters)
    /* 80AE4 80090AE4 BCA36324 */  addiu      $v1, $v1, %lo(Monsters)
    /* 80AE8 80090AE8 21F04300 */  addu       $fp, $v0, $v1
    /* 80AEC 80090AEC 0000C28F */  lw         $v0, 0x0($fp)
    /* 80AF0 80090AF0 00000000 */  nop
    /* 80AF4 80090AF4 00004594 */  lhu        $a1, 0x0($v0)
    /* 80AF8 80090AF8 0D000224 */  addiu      $v0, $zero, 0xD
    /* 80AFC 80090AFC 5D00A210 */  beq        $a1, $v0, .L80090C74
    /* 80B00 80090B00 00000000 */   nop
    /* 80B04 80090B04 A235020C */  jal        FindCreature__7CBlocksi
    /* 80B08 80090B08 2120C002 */   addu      $a0, $s6, $zero
    /* 80B0C 80090B0C 21A84000 */  addu       $s5, $v0, $zero
    /* 80B10 80090B10 2128A002 */  addu       $a1, $s5, $zero
    /* 80B14 80090B14 7000C48E */  lw         $a0, 0x70($s6)
    /* 80B18 80090B18 0500F292 */  lbu        $s2, 0x5($s7)
    /* 80B1C 80090B1C 0600F392 */  lbu        $s3, 0x6($s7)
    /* 80B20 80090B20 6147020C */  jal        GetNumOfFrames__7TextDatii_80091d84
    /* 80B24 80090B24 04000624 */   addiu     $a2, $zero, 0x4
    /* 80B28 80090B28 2120C002 */  addu       $a0, $s6, $zero
    /* 80B2C 80090B2C 80881200 */  sll        $s1, $s2, 2
    /* 80B30 80090B30 21883202 */  addu       $s1, $s1, $s2
    /* 80B34 80090B34 80881100 */  sll        $s1, $s1, 2
    /* 80B38 80090B38 21282002 */  addu       $a1, $s1, $zero
    /* 80B3C 80090B3C 80801300 */  sll        $s0, $s3, 2
    /* 80B40 80090B40 21801302 */  addu       $s0, $s0, $s3
    /* 80B44 80090B44 80801000 */  sll        $s0, $s0, 2
    /* 80B48 80090B48 21300002 */  addu       $a2, $s0, $zero
    /* 80B4C 80090B4C 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 80B50 80090B50 FFFF5424 */   addiu     $s4, $v0, -0x1
    /* 80B54 80090B54 2120C002 */  addu       $a0, $s6, $zero
    /* 80B58 80090B58 21282002 */  addu       $a1, $s1, $zero
    /* 80B5C 80090B5C 21300002 */  addu       $a2, $s0, $zero
    /* 80B60 80090B60 3800A98F */  lw         $t1, 0x38($sp)
    /* 80B64 80090B64 2800A88F */  lw         $t0, 0x28($sp)
    /* 80B68 80090B68 21882201 */  addu       $s1, $t1, $v0
    /* 80B6C 80090B6C 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 80B70 80090B70 23882802 */   subu      $s1, $s1, $t0
    /* 80B74 80090B74 2120C002 */  addu       $a0, $s6, $zero
    /* 80B78 80090B78 4000A98F */  lw         $t1, 0x40($sp)
    /* 80B7C 80090B7C 3000A88F */  lw         $t0, 0x30($sp)
    /* 80B80 80090B80 21802201 */  addu       $s0, $t1, $v0
    /* 80B84 80090B84 23800802 */  subu       $s0, $s0, $t0
    /* 80B88 80090B88 3047020C */  jal        GetOtPos__7CBlocksi_80091cc0
    /* 80B8C 80090B8C 21280002 */   addu      $a1, $s0, $zero
    /* 80B90 80090B90 2128A002 */  addu       $a1, $s5, $zero
    /* 80B94 80090B94 04000624 */  addiu      $a2, $zero, 0x4
    /* 80B98 80090B98 04000224 */  addiu      $v0, $zero, 0x4
    /* 80B9C 80090B9C 1000B4AF */  sw         $s4, 0x10($sp)
    /* 80BA0 80090BA0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 80BA4 80090BA4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 80BA8 80090BA8 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 80BAC 80090BAC 7000C48E */  lw         $a0, 0x70($s6)
    /* 80BB0 80090BB0 8B49020C */  jal        PrintMonster__7TextDatiiiiiii
    /* 80BB4 80090BB4 21380000 */   addu      $a3, $zero, $zero
    /* 80BB8 80090BB8 10005226 */  addiu      $s2, $s2, 0x10
    /* 80BBC 80090BBC 0000C38F */  lw         $v1, 0x0($fp)
    /* 80BC0 80090BC0 10007326 */  addiu      $s3, $s3, 0x10
    /* 80BC4 80090BC4 07006380 */  lb         $v1, 0x7($v1)
    /* 80BC8 80090BC8 00000000 */  nop
    /* 80BCC 80090BCC 0C006010 */  beqz       $v1, .L80090C00
    /* 80BD0 80090BD0 21804000 */   addu      $s0, $v0, $zero
    /* 80BD4 80090BD4 C0100300 */  sll        $v0, $v1, 3
    /* 80BD8 80090BD8 7400C48E */  lw         $a0, 0x74($s6)
    /* 80BDC 80090BDC 1180013C */  lui        $at, %hi(TransPals + 0x4)
    /* 80BE0 80090BE0 21082200 */  addu       $at, $at, $v0
    /* 80BE4 80090BE4 80A5258C */  lw         $a1, %lo(TransPals + 0x4)($at)
    /* 80BE8 80090BE8 8E47020C */  jal        GetFr__7TextDati_80091e38
    /* 80BEC 80090BEC 00000000 */   nop
    /* 80BF0 80090BF0 21284000 */  addu       $a1, $v0, $zero
    /* 80BF4 80090BF4 7400C48E */  lw         $a0, 0x74($s6)
    /* 80BF8 80090BF8 754F020C */  jal        SetPal__7TextDatP9FRAME_HDRP8POLY_FT4
    /* 80BFC 80090BFC 21300002 */   addu      $a2, $s0, $zero
  .L80090C00:
    /* 80C00 80090C00 42101200 */  srl        $v0, $s2, 1
    /* 80C04 80090C04 F0FF4224 */  addiu      $v0, $v0, -0x10
    /* 80C08 80090C08 42301300 */  srl        $a2, $s3, 1
    /* 80C0C 80090C0C F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 80C10 80090C10 1080053C */  lui        $a1, %hi(dung_map_r)
    /* 80C14 80090C14 2802A524 */  addiu      $a1, $a1, %lo(dung_map_r)
    /* 80C18 80090C18 C0180200 */  sll        $v1, $v0, 3
    /* 80C1C 80090C1C 23186200 */  subu       $v1, $v1, $v0
    /* 80C20 80090C20 C0180300 */  sll        $v1, $v1, 3
    /* 80C24 80090C24 21286500 */  addu       $a1, $v1, $a1
    /* 80C28 80090C28 2128A600 */  addu       $a1, $a1, $a2
    /* 80C2C 80090C2C 1080043C */  lui        $a0, %hi(dung_map_g)
    /* 80C30 80090C30 680E8424 */  addiu      $a0, $a0, %lo(dung_map_g)
    /* 80C34 80090C34 21206400 */  addu       $a0, $v1, $a0
    /* 80C38 80090C38 21208600 */  addu       $a0, $a0, $a2
    /* 80C3C 80090C3C 1080023C */  lui        $v0, %hi(dung_map_b)
    /* 80C40 80090C40 A81A4224 */  addiu      $v0, $v0, %lo(dung_map_b)
    /* 80C44 80090C44 21186200 */  addu       $v1, $v1, $v0
    /* 80C48 80090C48 21186600 */  addu       $v1, $v1, $a2
    /* 80C4C 80090C4C 0000A590 */  lbu        $a1, 0x0($a1)
    /* 80C50 80090C50 00008490 */  lbu        $a0, 0x0($a0)
    /* 80C54 80090C54 07000292 */  lbu        $v0, 0x7($s0)
    /* 80C58 80090C58 00006390 */  lbu        $v1, 0x0($v1)
    /* 80C5C 80090C5C FE004230 */  andi       $v0, $v0, 0xFE
    /* 80C60 80090C60 040005A2 */  sb         $a1, 0x4($s0)
    /* 80C64 80090C64 050004A2 */  sb         $a0, 0x5($s0)
    /* 80C68 80090C68 060003A2 */  sb         $v1, 0x6($s0)
    /* 80C6C 80090C6C 070002A2 */  sb         $v0, 0x7($s0)
    /* 80C70 80090C70 4800A98F */  lw         $t1, 0x48($sp)
  .L80090C74:
    /* 80C74 80090C74 0400F726 */  addiu      $s7, $s7, %lo(D_1F800004)
    /* 80C78 80090C78 01002925 */  addiu      $t1, $t1, 0x1
    /* 80C7C 80090C7C A5420208 */  j          .L80090A94
    /* 80C80 80090C80 4800A9AF */   sw        $t1, 0x48($sp)
  .L80090C84:
    /* 80C84 80090C84 7400BF8F */  lw         $ra, 0x74($sp)
    /* 80C88 80090C88 7000BE8F */  lw         $fp, 0x70($sp)
    /* 80C8C 80090C8C 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 80C90 80090C90 6800B68F */  lw         $s6, 0x68($sp)
    /* 80C94 80090C94 6400B58F */  lw         $s5, 0x64($sp)
    /* 80C98 80090C98 6000B48F */  lw         $s4, 0x60($sp)
    /* 80C9C 80090C9C 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 80CA0 80090CA0 5800B28F */  lw         $s2, 0x58($sp)
    /* 80CA4 80090CA4 5400B18F */  lw         $s1, 0x54($sp)
    /* 80CA8 80090CA8 5000B08F */  lw         $s0, 0x50($sp)
    /* 80CAC 80090CAC 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 80CB0 80090CB0 0800E003 */  jr         $ra
    /* 80CB4 80090CB4 00000000 */   nop
endlabel PrintDead__7CBlocksii
