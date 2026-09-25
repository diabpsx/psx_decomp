.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks, 0x3E4

glabel SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks
    /* 85AA8 80095AA8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 85AAC 80095AAC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 85AB0 80095AB0 21A0A000 */  addu       $s4, $a1, $zero
    /* 85AB4 80095AB4 6210073C */  lui        $a3, (0x10624DD3 >> 16)
    /* 85AB8 80095AB8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 85ABC 80095ABC 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 85AC0 80095AC0 2800B6AF */  sw         $s6, 0x28($sp)
    /* 85AC4 80095AC4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 85AC8 80095AC8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 85ACC 80095ACC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 85AD0 80095AD0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 85AD4 80095AD4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 85AD8 80095AD8 3C008582 */  lb         $a1, 0x3C($s4)
    /* 85ADC 80095ADC D34DE734 */  ori        $a3, $a3, (0x10624DD3 & 0xFFFF)
    /* 85AE0 80095AE0 80100500 */  sll        $v0, $a1, 2
    /* 85AE4 80095AE4 21104500 */  addu       $v0, $v0, $a1
    /* 85AE8 80095AE8 C0100200 */  sll        $v0, $v0, 3
    /* 85AEC 80095AEC 21104500 */  addu       $v0, $v0, $a1
    /* 85AF0 80095AF0 80100200 */  sll        $v0, $v0, 2
    /* 85AF4 80095AF4 23104500 */  subu       $v0, $v0, $a1
    /* 85AF8 80095AF8 80100200 */  sll        $v0, $v0, 2
    /* 85AFC 80095AFC 18004700 */  mult       $v0, $a3
    /* 85B00 80095B00 21B0C000 */  addu       $s6, $a2, $zero
    /* 85B04 80095B04 3D008682 */  lb         $a2, 0x3D($s4)
    /* 85B08 80095B08 00000000 */  nop
    /* 85B0C 80095B0C 80180600 */  sll        $v1, $a2, 2
    /* 85B10 80095B10 21186600 */  addu       $v1, $v1, $a2
    /* 85B14 80095B14 C0180300 */  sll        $v1, $v1, 3
    /* 85B18 80095B18 23186600 */  subu       $v1, $v1, $a2
    /* 85B1C 80095B1C 10200000 */  mfhi       $a0
    /* 85B20 80095B20 00190300 */  sll        $v1, $v1, 4
    /* 85B24 80095B24 21186600 */  addu       $v1, $v1, $a2
    /* 85B28 80095B28 18006700 */  mult       $v1, $a3
    /* 85B2C 80095B2C 21980000 */  addu       $s3, $zero, $zero
    /* 85B30 80095B30 21880000 */  addu       $s1, $zero, $zero
    /* 85B34 80095B34 21A80000 */  addu       $s5, $zero, $zero
    /* 85B38 80095B38 C3170200 */  sra        $v0, $v0, 31
    /* 85B3C 80095B3C 83210400 */  sra        $a0, $a0, 6
    /* 85B40 80095B40 23908200 */  subu       $s2, $a0, $v0
    /* 85B44 80095B44 C31F0300 */  sra        $v1, $v1, 31
    /* 85B48 80095B48 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 85B4C 80095B4C 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 85B50 80095B50 10400000 */  mfhi       $t0
    /* 85B54 80095B54 83210800 */  sra        $a0, $t0, 6
    /* 85B58 80095B58 51004010 */  beqz       $v0, .L80095CA0
    /* 85B5C 80095B5C 23808300 */   subu      $s0, $a0, $v1
    /* 85B60 80095B60 0E80023C */  lui        $v0, %hi(plr)
    /* 85B64 80095B64 38A5428C */  lw         $v0, %lo(plr)($v0)
    /* 85B68 80095B68 08000324 */  addiu      $v1, $zero, 0x8
    /* 85B6C 80095B6C 4C004310 */  beq        $v0, $v1, .L80095CA0
    /* 85B70 80095B70 00000000 */   nop
    /* 85B74 80095B74 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 85B78 80095B78 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 85B7C 80095B7C 00000000 */  nop
    /* 85B80 80095B80 81004010 */  beqz       $v0, .L80095D88
    /* 85B84 80095B84 00000000 */   nop
    /* 85B88 80095B88 0E80023C */  lui        $v0, %hi(plr + 0x19E8)
    /* 85B8C 80095B8C 20BF428C */  lw         $v0, %lo(plr + 0x19E8)($v0)
    /* 85B90 80095B90 00000000 */  nop
    /* 85B94 80095B94 42004310 */  beq        $v0, $v1, .L80095CA0
    /* 85B98 80095B98 2120C002 */   addu      $a0, $s6, $zero
    /* 85B9C 80095B9C 0E80023C */  lui        $v0, %hi(plr + 0x1A24)
    /* 85BA0 80095BA0 5CBF4280 */  lb         $v0, %lo(plr + 0x1A24)($v0)
    /* 85BA4 80095BA4 00000000 */  nop
    /* 85BA8 80095BA8 2110A200 */  addu       $v0, $a1, $v0
    /* 85BAC 80095BAC C21F0200 */  srl        $v1, $v0, 31
    /* 85BB0 80095BB0 21104300 */  addu       $v0, $v0, $v1
    /* 85BB4 80095BB4 43100200 */  sra        $v0, $v0, 1
    /* 85BB8 80095BB8 80280200 */  sll        $a1, $v0, 2
    /* 85BBC 80095BBC 2128A200 */  addu       $a1, $a1, $v0
    /* 85BC0 80095BC0 C0280500 */  sll        $a1, $a1, 3
    /* 85BC4 80095BC4 2328A200 */  subu       $a1, $a1, $v0
    /* 85BC8 80095BC8 00290500 */  sll        $a1, $a1, 4
    /* 85BCC 80095BCC 2128A200 */  addu       $a1, $a1, $v0
    /* 85BD0 80095BD0 1800A700 */  mult       $a1, $a3
    /* 85BD4 80095BD4 0E80023C */  lui        $v0, %hi(plr + 0x1A25)
    /* 85BD8 80095BD8 5DBF4280 */  lb         $v0, %lo(plr + 0x1A25)($v0)
    /* 85BDC 80095BDC 00000000 */  nop
    /* 85BE0 80095BE0 2110C200 */  addu       $v0, $a2, $v0
    /* 85BE4 80095BE4 C21F0200 */  srl        $v1, $v0, 31
    /* 85BE8 80095BE8 21104300 */  addu       $v0, $v0, $v1
    /* 85BEC 80095BEC 43100200 */  sra        $v0, $v0, 1
    /* 85BF0 80095BF0 80180200 */  sll        $v1, $v0, 2
    /* 85BF4 80095BF4 21186200 */  addu       $v1, $v1, $v0
    /* 85BF8 80095BF8 C0180300 */  sll        $v1, $v1, 3
    /* 85BFC 80095BFC 23186200 */  subu       $v1, $v1, $v0
    /* 85C00 80095C00 10400000 */  mfhi       $t0
    /* 85C04 80095C04 00190300 */  sll        $v1, $v1, 4
    /* 85C08 80095C08 21186200 */  addu       $v1, $v1, $v0
    /* 85C0C 80095C0C 18006700 */  mult       $v1, $a3
    /* 85C10 80095C10 C32F0500 */  sra        $a1, $a1, 31
    /* 85C14 80095C14 83110800 */  sra        $v0, $t0, 6
    /* 85C18 80095C18 23904500 */  subu       $s2, $v0, $a1
    /* 85C1C 80095C1C C31F0300 */  sra        $v1, $v1, 31
    /* 85C20 80095C20 21284002 */  addu       $a1, $s2, $zero
    /* 85C24 80095C24 10380000 */  mfhi       $a3
    /* 85C28 80095C28 83110700 */  sra        $v0, $a3, 6
    /* 85C2C 80095C2C 23804300 */  subu       $s0, $v0, $v1
    /* 85C30 80095C30 7945020C */  jal        ScrToWorldX__7CBlocksii
    /* 85C34 80095C34 21300002 */   addu      $a2, $s0, $zero
    /* 85C38 80095C38 2120C002 */  addu       $a0, $s6, $zero
    /* 85C3C 80095C3C 21284002 */  addu       $a1, $s2, $zero
    /* 85C40 80095C40 0E80073C */  lui        $a3, %hi(plr + 0x30)
    /* 85C44 80095C44 68A5E784 */  lh         $a3, %lo(plr + 0x30)($a3)
    /* 85C48 80095C48 0E80033C */  lui        $v1, %hi(plr + 0x1A18)
    /* 85C4C 80095C4C 50BF6384 */  lh         $v1, %lo(plr + 0x1A18)($v1)
    /* 85C50 80095C50 21300002 */  addu       $a2, $s0, $zero
    /* 85C54 80095C54 2138E300 */  addu       $a3, $a3, $v1
    /* 85C58 80095C58 80180700 */  sll        $v1, $a3, 2
    /* 85C5C 80095C5C 21186700 */  addu       $v1, $v1, $a3
    /* 85C60 80095C60 40180300 */  sll        $v1, $v1, 1
    /* 85C64 80095C64 21186200 */  addu       $v1, $v1, $v0
    /* 85C68 80095C68 7E45020C */  jal        ScrToWorldY__7CBlocksii
    /* 85C6C 80095C6C 0A007324 */   addiu     $s3, $v1, 0xA
    /* 85C70 80095C70 0E80043C */  lui        $a0, %hi(plr + 0x32)
    /* 85C74 80095C74 6AA58484 */  lh         $a0, %lo(plr + 0x32)($a0)
    /* 85C78 80095C78 0E80033C */  lui        $v1, %hi(plr + 0x1A1A)
    /* 85C7C 80095C7C 52BF6384 */  lh         $v1, %lo(plr + 0x1A1A)($v1)
    /* 85C80 80095C80 01001524 */  addiu      $s5, $zero, 0x1
    /* 85C84 80095C84 21208300 */  addu       $a0, $a0, $v1
    /* 85C88 80095C88 80180400 */  sll        $v1, $a0, 2
    /* 85C8C 80095C8C 21186400 */  addu       $v1, $v1, $a0
    /* 85C90 80095C90 40180300 */  sll        $v1, $v1, 1
    /* 85C94 80095C94 21186200 */  addu       $v1, $v1, $v0
    /* 85C98 80095C98 8A570208 */  j          .L80095E28
    /* 85C9C 80095C9C 0A007124 */   addiu     $s1, $v1, 0xA
  .L80095CA0:
    /* 85CA0 80095CA0 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 85CA4 80095CA4 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 85CA8 80095CA8 00000000 */  nop
    /* 85CAC 80095CAC 36004010 */  beqz       $v0, .L80095D88
    /* 85CB0 80095CB0 08000224 */   addiu     $v0, $zero, 0x8
    /* 85CB4 80095CB4 0E80033C */  lui        $v1, %hi(plr + 0x19E8)
    /* 85CB8 80095CB8 20BF638C */  lw         $v1, %lo(plr + 0x19E8)($v1)
    /* 85CBC 80095CBC 00000000 */  nop
    /* 85CC0 80095CC0 31006210 */  beq        $v1, $v0, .L80095D88
    /* 85CC4 80095CC4 6210053C */   lui       $a1, (0x10624DD3 >> 16)
    /* 85CC8 80095CC8 0E80033C */  lui        $v1, %hi(plr + 0x1A24)
    /* 85CCC 80095CCC 5CBF6380 */  lb         $v1, %lo(plr + 0x1A24)($v1)
    /* 85CD0 80095CD0 D34DA534 */  ori        $a1, $a1, (0x10624DD3 & 0xFFFF)
    /* 85CD4 80095CD4 80100300 */  sll        $v0, $v1, 2
    /* 85CD8 80095CD8 21104300 */  addu       $v0, $v0, $v1
    /* 85CDC 80095CDC C0100200 */  sll        $v0, $v0, 3
    /* 85CE0 80095CE0 21104300 */  addu       $v0, $v0, $v1
    /* 85CE4 80095CE4 80100200 */  sll        $v0, $v0, 2
    /* 85CE8 80095CE8 23104300 */  subu       $v0, $v0, $v1
    /* 85CEC 80095CEC 80100200 */  sll        $v0, $v0, 2
    /* 85CF0 80095CF0 18004500 */  mult       $v0, $a1
    /* 85CF4 80095CF4 0E80043C */  lui        $a0, %hi(plr + 0x1A25)
    /* 85CF8 80095CF8 5DBF8480 */  lb         $a0, %lo(plr + 0x1A25)($a0)
    /* 85CFC 80095CFC 00000000 */  nop
    /* 85D00 80095D00 80180400 */  sll        $v1, $a0, 2
    /* 85D04 80095D04 21186400 */  addu       $v1, $v1, $a0
    /* 85D08 80095D08 C0180300 */  sll        $v1, $v1, 3
    /* 85D0C 80095D0C 23186400 */  subu       $v1, $v1, $a0
    /* 85D10 80095D10 10300000 */  mfhi       $a2
    /* 85D14 80095D14 00190300 */  sll        $v1, $v1, 4
    /* 85D18 80095D18 21186400 */  addu       $v1, $v1, $a0
    /* 85D1C 80095D1C 18006500 */  mult       $v1, $a1
    /* 85D20 80095D20 2120C002 */  addu       $a0, $s6, $zero
    /* 85D24 80095D24 C3170200 */  sra        $v0, $v0, 31
    /* 85D28 80095D28 83290600 */  sra        $a1, $a2, 6
    /* 85D2C 80095D2C 2390A200 */  subu       $s2, $a1, $v0
    /* 85D30 80095D30 C31F0300 */  sra        $v1, $v1, 31
    /* 85D34 80095D34 21284002 */  addu       $a1, $s2, $zero
    /* 85D38 80095D38 10380000 */  mfhi       $a3
    /* 85D3C 80095D3C 83110700 */  sra        $v0, $a3, 6
    /* 85D40 80095D40 23804300 */  subu       $s0, $v0, $v1
    /* 85D44 80095D44 7945020C */  jal        ScrToWorldX__7CBlocksii
    /* 85D48 80095D48 21300002 */   addu      $a2, $s0, $zero
    /* 85D4C 80095D4C 2120C002 */  addu       $a0, $s6, $zero
    /* 85D50 80095D50 21284002 */  addu       $a1, $s2, $zero
    /* 85D54 80095D54 0E80073C */  lui        $a3, %hi(plr + 0x1A18)
    /* 85D58 80095D58 50BFE784 */  lh         $a3, %lo(plr + 0x1A18)($a3)
    /* 85D5C 80095D5C 21300002 */  addu       $a2, $s0, $zero
    /* 85D60 80095D60 80180700 */  sll        $v1, $a3, 2
    /* 85D64 80095D64 21186700 */  addu       $v1, $v1, $a3
    /* 85D68 80095D68 80180300 */  sll        $v1, $v1, 2
    /* 85D6C 80095D6C 21186200 */  addu       $v1, $v1, $v0
    /* 85D70 80095D70 7E45020C */  jal        ScrToWorldY__7CBlocksii
    /* 85D74 80095D74 0A007024 */   addiu     $s0, $v1, 0xA
    /* 85D78 80095D78 0E80043C */  lui        $a0, %hi(plr + 0x1A1A)
    /* 85D7C 80095D7C 52BF8484 */  lh         $a0, %lo(plr + 0x1A1A)($a0)
    /* 85D80 80095D80 77570208 */  j          .L80095DDC
    /* 85D84 80095D84 01001524 */   addiu     $s5, $zero, 0x1
  .L80095D88:
    /* 85D88 80095D88 0E80173C */  lui        $s7, %hi(plr)
    /* 85D8C 80095D8C 38A5F726 */  addiu      $s7, $s7, %lo(plr)
    /* 85D90 80095D90 0000E38E */  lw         $v1, 0x0($s7)
    /* 85D94 80095D94 08000224 */  addiu      $v0, $zero, 0x8
    /* 85D98 80095D98 23006210 */  beq        $v1, $v0, .L80095E28
    /* 85D9C 80095D9C 2120C002 */   addu      $a0, $s6, $zero
    /* 85DA0 80095DA0 21284002 */  addu       $a1, $s2, $zero
    /* 85DA4 80095DA4 7945020C */  jal        ScrToWorldX__7CBlocksii
    /* 85DA8 80095DA8 21300002 */   addu      $a2, $s0, $zero
    /* 85DAC 80095DAC 2120C002 */  addu       $a0, $s6, $zero
    /* 85DB0 80095DB0 21284002 */  addu       $a1, $s2, $zero
    /* 85DB4 80095DB4 30008786 */  lh         $a3, 0x30($s4)
    /* 85DB8 80095DB8 21300002 */  addu       $a2, $s0, $zero
    /* 85DBC 80095DBC 80180700 */  sll        $v1, $a3, 2
    /* 85DC0 80095DC0 21186700 */  addu       $v1, $v1, $a3
    /* 85DC4 80095DC4 80180300 */  sll        $v1, $v1, 2
    /* 85DC8 80095DC8 21186200 */  addu       $v1, $v1, $v0
    /* 85DCC 80095DCC 7E45020C */  jal        ScrToWorldY__7CBlocksii
    /* 85DD0 80095DD0 0A007024 */   addiu     $s0, $v1, 0xA
    /* 85DD4 80095DD4 32008486 */  lh         $a0, 0x32($s4)
    /* 85DD8 80095DD8 01001524 */  addiu      $s5, $zero, 0x1
  .L80095DDC:
    /* 85DDC 80095DDC 80180400 */  sll        $v1, $a0, 2
    /* 85DE0 80095DE0 21186400 */  addu       $v1, $v1, $a0
    /* 85DE4 80095DE4 80180300 */  sll        $v1, $v1, 2
    /* 85DE8 80095DE8 21186200 */  addu       $v1, $v1, $v0
    /* 85DEC 80095DEC 0A006624 */  addiu      $a2, $v1, 0xA
    /* 85DF0 80095DF0 FC1E838F */  lw         $v1, %gp_rel(D_8011C67C)($gp)
    /* 85DF4 80095DF4 F41E828F */  lw         $v0, %gp_rel(D_8011C674)($gp)
    /* 85DF8 80095DF8 F81E848F */  lw         $a0, %gp_rel(D_8011C678)($gp)
    /* 85DFC 80095DFC 23186200 */  subu       $v1, $v1, $v0
    /* 85E00 80095E00 C2170300 */  srl        $v0, $v1, 31
    /* 85E04 80095E04 21186200 */  addu       $v1, $v1, $v0
    /* 85E08 80095E08 43180300 */  sra        $v1, $v1, 1
    /* 85E0C 80095E0C 001F828F */  lw         $v0, %gp_rel(D_8011C680)($gp)
    /* 85E10 80095E10 21980302 */  addu       $s3, $s0, $v1
    /* 85E14 80095E14 23104400 */  subu       $v0, $v0, $a0
    /* 85E18 80095E18 C21F0200 */  srl        $v1, $v0, 31
    /* 85E1C 80095E1C 21104300 */  addu       $v0, $v0, $v1
    /* 85E20 80095E20 43100200 */  sra        $v0, $v0, 1
    /* 85E24 80095E24 2188C200 */  addu       $s1, $a2, $v0
  .L80095E28:
    /* 85E28 80095E28 2120C002 */  addu       $a0, $s6, $zero
    /* 85E2C 80095E2C 21280000 */  addu       $a1, $zero, $zero
    /* 85E30 80095E30 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 85E34 80095E34 21300000 */   addu      $a2, $zero, $zero
    /* 85E38 80095E38 2120C002 */  addu       $a0, $s6, $zero
    /* 85E3C 80095E3C 21280000 */  addu       $a1, $zero, $zero
    /* 85E40 80095E40 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 85E44 80095E44 21300000 */   addu      $a2, $zero, $zero
    /* 85E48 80095E48 0400A012 */  beqz       $s5, .L80095E5C
    /* 85E4C 80095E4C 2120C002 */   addu      $a0, $s6, $zero
    /* 85E50 80095E50 21286002 */  addu       $a1, $s3, $zero
    /* 85E54 80095E54 8345020C */  jal        SetScrollTarget__7CBlocksii
    /* 85E58 80095E58 21302002 */   addu      $a2, $s1, $zero
  .L80095E5C:
    /* 85E5C 80095E5C 3000BF8F */  lw         $ra, 0x30($sp)
    /* 85E60 80095E60 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 85E64 80095E64 2800B68F */  lw         $s6, 0x28($sp)
    /* 85E68 80095E68 2400B58F */  lw         $s5, 0x24($sp)
    /* 85E6C 80095E6C 2000B48F */  lw         $s4, 0x20($sp)
    /* 85E70 80095E70 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 85E74 80095E74 1800B28F */  lw         $s2, 0x18($sp)
    /* 85E78 80095E78 1400B18F */  lw         $s1, 0x14($sp)
    /* 85E7C 80095E7C 1000B08F */  lw         $s0, 0x10($sp)
    /* 85E80 80095E80 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 85E84 80095E84 0800E003 */  jr         $ra
    /* 85E88 80095E88 00000000 */   nop
endlabel SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks
