.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL4Goodies__Fv, 0xB0

glabel AddL4Goodies__Fv
    /* 1F674 8015926C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F678 80159270 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1F67C 80159274 1E64050C */  jal        AddHookedBodies__Fi
    /* 1F680 80159278 06000424 */   addiu     $a0, $zero, 0x6
    /* 1F684 8015927C 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F688 80159280 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F68C 80159284 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F690 80159288 1D000624 */   addiu     $a2, $zero, 0x1D
    /* 1F694 8015928C 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F698 80159290 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F69C 80159294 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F6A0 80159298 1E000624 */   addiu     $a2, $zero, 0x1E
    /* 1F6A4 8015929C 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F6A8 801592A0 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F6AC 801592A4 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F6B0 801592A8 1F000624 */   addiu     $a2, $zero, 0x1F
    /* 1F6B4 801592AC 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F6B8 801592B0 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F6BC 801592B4 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F6C0 801592B8 20000624 */   addiu     $a2, $zero, 0x20
    /* 1F6C4 801592BC 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F6C8 801592C0 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F6CC 801592C4 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F6D0 801592C8 21000624 */   addiu     $a2, $zero, 0x21
    /* 1F6D4 801592CC 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F6D8 801592D0 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F6DC 801592D4 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F6E0 801592D8 22000624 */   addiu     $a2, $zero, 0x22
    /* 1F6E4 801592DC 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F6E8 801592E0 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F6EC 801592E4 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F6F0 801592E8 23000624 */   addiu     $a2, $zero, 0x23
    /* 1F6F4 801592EC 02000424 */  addiu      $a0, $zero, 0x2
    /* 1F6F8 801592F0 06000524 */  addiu      $a1, $zero, 0x6
    /* 1F6FC 801592F4 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F700 801592F8 43000624 */   addiu     $a2, $zero, 0x43
    /* 1F704 801592FC 01000424 */  addiu      $a0, $zero, 0x1
    /* 1F708 80159300 03000524 */  addiu      $a1, $zero, 0x3
    /* 1F70C 80159304 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1F710 80159308 50000624 */   addiu     $a2, $zero, 0x50
    /* 1F714 8015930C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1F718 80159310 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F71C 80159314 0800E003 */  jr         $ra
    /* 1F720 80159318 00000000 */   nop
endlabel AddL4Goodies__Fv
