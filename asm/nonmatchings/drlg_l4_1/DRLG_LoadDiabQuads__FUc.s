.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_LoadDiabQuads__FUc, 0x1FC

glabel DRLG_LoadDiabQuads__FUc
    /* 19820 80153418 6821828F */  lw         $v0, %gp_rel(D_8011C8E8)($gp)
    /* 19824 8015341C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19828 80153420 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1982C 80153424 21808000 */  addu       $s0, $a0, $zero
    /* 19830 80153428 06004014 */  bnez       $v0, .L80153444
    /* 19834 8015342C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 19838 80153430 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x28)
    /* 1983C 80153434 20D88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x28)
    /* 19840 80153438 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 19844 8015343C 21280000 */   addu      $a1, $zero, $zero
    /* 19848 80153440 682182AF */  sw         $v0, %gp_rel(D_8011C8E8)($gp)
  .L80153444:
    /* 1984C 80153444 2C18858F */  lw         $a1, %gp_rel(l4holdx)($gp)
    /* 19850 80153448 6821848F */  lw         $a0, %gp_rel(D_8011C8E8)($gp)
    /* 19854 8015344C 3018868F */  lw         $a2, %gp_rel(l4holdy)($gp)
    /* 19858 80153450 0400A524 */  addiu      $a1, $a1, 0x4
    /* 1985C 80153454 0400C624 */  addiu      $a2, $a2, 0x4
    /* 19860 80153458 FC1785AF */  sw         $a1, %gp_rel(diabquad1x)($gp)
    /* 19864 8015345C 0C1886AF */  sw         $a2, %gp_rel(diabquad1y)($gp)
    /* 19868 80153460 D14C050C */  jal        DRLG_L4SetRoom__FPUcii
    /* 1986C 80153464 00000000 */   nop
    /* 19870 80153468 FF000232 */  andi       $v0, $s0, 0xFF
    /* 19874 8015346C 0D004010 */  beqz       $v0, .L801534A4
    /* 19878 80153470 00000000 */   nop
    /* 1987C 80153474 7821828F */  lw         $v0, %gp_rel(D_8011C8F8)($gp)
    /* 19880 80153478 00000000 */  nop
    /* 19884 8015347C 06004014 */  bnez       $v0, .L80153498
    /* 19888 80153480 00000000 */   nop
    /* 1988C 80153484 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x34)
    /* 19890 80153488 2CD88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x34)
    /* 19894 8015348C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 19898 80153490 21280000 */   addu      $a1, $zero, $zero
    /* 1989C 80153494 782182AF */  sw         $v0, %gp_rel(D_8011C8F8)($gp)
  .L80153498:
    /* 198A0 80153498 7821848F */  lw         $a0, %gp_rel(D_8011C8F8)($gp)
    /* 198A4 8015349C 344D0508 */  j          .L801534D0
    /* 198A8 801534A0 1B000524 */   addiu     $a1, $zero, 0x1B
  .L801534A4:
    /* 198AC 801534A4 6C21828F */  lw         $v0, %gp_rel(D_8011C8EC)($gp)
    /* 198B0 801534A8 00000000 */  nop
    /* 198B4 801534AC 06004014 */  bnez       $v0, .L801534C8
    /* 198B8 801534B0 00000000 */   nop
    /* 198BC 801534B4 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x40)
    /* 198C0 801534B8 38D88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x40)
    /* 198C4 801534BC A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 198C8 801534C0 21280000 */   addu      $a1, $zero, $zero
    /* 198CC 801534C4 6C2182AF */  sw         $v0, %gp_rel(D_8011C8EC)($gp)
  .L801534C8:
    /* 198D0 801534C8 6C21848F */  lw         $a0, %gp_rel(D_8011C8EC)($gp)
    /* 198D4 801534CC 1B000524 */  addiu      $a1, $zero, 0x1B
  .L801534D0:
    /* 198D8 801534D0 2C18828F */  lw         $v0, %gp_rel(l4holdx)($gp)
    /* 198DC 801534D4 3018868F */  lw         $a2, %gp_rel(l4holdy)($gp)
    /* 198E0 801534D8 2328A200 */  subu       $a1, $a1, $v0
    /* 198E4 801534DC 0100C624 */  addiu      $a2, $a2, 0x1
    /* 198E8 801534E0 001885AF */  sw         $a1, %gp_rel(diabquad2x)($gp)
    /* 198EC 801534E4 101886AF */  sw         $a2, %gp_rel(diabquad2y)($gp)
    /* 198F0 801534E8 D14C050C */  jal        DRLG_L4SetRoom__FPUcii
    /* 198F4 801534EC 00000000 */   nop
    /* 198F8 801534F0 FF000232 */  andi       $v0, $s0, 0xFF
    /* 198FC 801534F4 0D004010 */  beqz       $v0, .L8015352C
    /* 19900 801534F8 00000000 */   nop
    /* 19904 801534FC 7C21828F */  lw         $v0, %gp_rel(D_8011C8FC)($gp)
    /* 19908 80153500 00000000 */  nop
    /* 1990C 80153504 06004014 */  bnez       $v0, .L80153520
    /* 19910 80153508 00000000 */   nop
    /* 19914 8015350C 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x4C)
    /* 19918 80153510 44D88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x4C)
    /* 1991C 80153514 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 19920 80153518 21280000 */   addu      $a1, $zero, $zero
    /* 19924 8015351C 7C2182AF */  sw         $v0, %gp_rel(D_8011C8FC)($gp)
  .L80153520:
    /* 19928 80153520 7C21848F */  lw         $a0, %gp_rel(D_8011C8FC)($gp)
    /* 1992C 80153524 564D0508 */  j          .L80153558
    /* 19930 80153528 1B000624 */   addiu     $a2, $zero, 0x1B
  .L8015352C:
    /* 19934 8015352C 7021828F */  lw         $v0, %gp_rel(D_8011C8F0)($gp)
    /* 19938 80153530 00000000 */  nop
    /* 1993C 80153534 06004014 */  bnez       $v0, .L80153550
    /* 19940 80153538 00000000 */   nop
    /* 19944 8015353C 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x58)
    /* 19948 80153540 50D88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x58)
    /* 1994C 80153544 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 19950 80153548 21280000 */   addu      $a1, $zero, $zero
    /* 19954 8015354C 702182AF */  sw         $v0, %gp_rel(D_8011C8F0)($gp)
  .L80153550:
    /* 19958 80153550 7021848F */  lw         $a0, %gp_rel(D_8011C8F0)($gp)
    /* 1995C 80153554 1B000624 */  addiu      $a2, $zero, 0x1B
  .L80153558:
    /* 19960 80153558 2C18858F */  lw         $a1, %gp_rel(l4holdx)($gp)
    /* 19964 8015355C 3018828F */  lw         $v0, %gp_rel(l4holdy)($gp)
    /* 19968 80153560 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1996C 80153564 2330C200 */  subu       $a2, $a2, $v0
    /* 19970 80153568 041885AF */  sw         $a1, %gp_rel(diabquad3x)($gp)
    /* 19974 8015356C 141886AF */  sw         $a2, %gp_rel(diabquad3y)($gp)
    /* 19978 80153570 D14C050C */  jal        DRLG_L4SetRoom__FPUcii
    /* 1997C 80153574 00000000 */   nop
    /* 19980 80153578 FF000232 */  andi       $v0, $s0, 0xFF
    /* 19984 8015357C 0D004010 */  beqz       $v0, .L801535B4
    /* 19988 80153580 00000000 */   nop
    /* 1998C 80153584 8021828F */  lw         $v0, %gp_rel(D_8011C900)($gp)
    /* 19990 80153588 00000000 */  nop
    /* 19994 8015358C 06004014 */  bnez       $v0, .L801535A8
    /* 19998 80153590 00000000 */   nop
    /* 1999C 80153594 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x64)
    /* 199A0 80153598 5CD88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x64)
    /* 199A4 8015359C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 199A8 801535A0 21280000 */   addu      $a1, $zero, $zero
    /* 199AC 801535A4 802182AF */  sw         $v0, %gp_rel(D_8011C900)($gp)
  .L801535A8:
    /* 199B0 801535A8 8021848F */  lw         $a0, %gp_rel(D_8011C900)($gp)
    /* 199B4 801535AC 784D0508 */  j          .L801535E0
    /* 199B8 801535B0 1C000624 */   addiu     $a2, $zero, 0x1C
  .L801535B4:
    /* 199BC 801535B4 7421828F */  lw         $v0, %gp_rel(D_8011C8F4)($gp)
    /* 199C0 801535B8 00000000 */  nop
    /* 199C4 801535BC 06004014 */  bnez       $v0, .L801535D8
    /* 199C8 801535C0 00000000 */   nop
    /* 199CC 801535C4 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x70)
    /* 199D0 801535C8 68D88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x70)
    /* 199D4 801535CC A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 199D8 801535D0 21280000 */   addu      $a1, $zero, $zero
    /* 199DC 801535D4 742182AF */  sw         $v0, %gp_rel(D_8011C8F4)($gp)
  .L801535D8:
    /* 199E0 801535D8 7421848F */  lw         $a0, %gp_rel(D_8011C8F4)($gp)
    /* 199E4 801535DC 1C000624 */  addiu      $a2, $zero, 0x1C
  .L801535E0:
    /* 199E8 801535E0 2C18858F */  lw         $a1, %gp_rel(l4holdx)($gp)
    /* 199EC 801535E4 3018828F */  lw         $v0, %gp_rel(l4holdy)($gp)
    /* 199F0 801535E8 2328C500 */  subu       $a1, $a2, $a1
    /* 199F4 801535EC 2330C200 */  subu       $a2, $a2, $v0
    /* 199F8 801535F0 081885AF */  sw         $a1, %gp_rel(diabquad4x)($gp)
    /* 199FC 801535F4 181886AF */  sw         $a2, %gp_rel(diabquad4y)($gp)
    /* 19A00 801535F8 D14C050C */  jal        DRLG_L4SetRoom__FPUcii
    /* 19A04 801535FC 00000000 */   nop
    /* 19A08 80153600 1400BF8F */  lw         $ra, 0x14($sp)
    /* 19A0C 80153604 1000B08F */  lw         $s0, 0x10($sp)
    /* 19A10 80153608 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19A14 8015360C 0800E003 */  jr         $ra
    /* 19A18 80153610 00000000 */   nop
endlabel DRLG_LoadDiabQuads__FUc
