.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitL3Triggers__Fv, 0x18C

glabel InitL3Triggers__Fv
    /* 28C2C 80162824 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28C30 80162828 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28C34 8016282C 21880000 */  addu       $s1, $zero, $zero
    /* 28C38 80162830 1800BFAF */  sw         $ra, 0x18($sp)
    /* 28C3C 80162834 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28C40 80162838 1280013C */  lui        $at, %hi(numtrigs)
    /* 28C44 8016283C 78BB20AC */  sw         $zero, %lo(numtrigs)($at)
  .L80162840:
    /* 28C48 80162840 21800000 */  addu       $s0, $zero, $zero
    /* 28C4C 80162844 21200002 */  addu       $a0, $s0, $zero
  .L80162848:
    /* 28C50 80162848 910A020C */  jal        GetDPiece__Fii
    /* 28C54 8016284C 21282002 */   addu      $a1, $s1, $zero
    /* 28C58 80162850 00140200 */  sll        $v0, $v0, 16
    /* 28C5C 80162854 03140200 */  sra        $v0, $v0, 16
    /* 28C60 80162858 AB000324 */  addiu      $v1, $zero, 0xAB
    /* 28C64 8016285C 12004314 */  bne        $v0, $v1, .L801628A8
    /* 28C68 80162860 21200002 */   addu      $a0, $s0, $zero
    /* 28C6C 80162864 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28C70 80162868 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28C74 8016286C 43000224 */  addiu      $v0, $zero, 0x43
    /* 28C78 80162870 00190400 */  sll        $v1, $a0, 4
    /* 28C7C 80162874 01008424 */  addiu      $a0, $a0, 0x1
    /* 28C80 80162878 0E80013C */  lui        $at, %hi(trigs)
    /* 28C84 8016287C 21082300 */  addu       $at, $at, $v1
    /* 28C88 80162880 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28C8C 80162884 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28C90 80162888 21082300 */  addu       $at, $at, $v1
    /* 28C94 8016288C D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28C98 80162890 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28C9C 80162894 21082300 */  addu       $at, $at, $v1
    /* 28CA0 80162898 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28CA4 8016289C 1280013C */  lui        $at, %hi(numtrigs)
    /* 28CA8 801628A0 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28CAC 801628A4 21200002 */  addu       $a0, $s0, $zero
  .L801628A8:
    /* 28CB0 801628A8 910A020C */  jal        GetDPiece__Fii
    /* 28CB4 801628AC 21282002 */   addu      $a1, $s1, $zero
    /* 28CB8 801628B0 00140200 */  sll        $v0, $v0, 16
    /* 28CBC 801628B4 03140200 */  sra        $v0, $v0, 16
    /* 28CC0 801628B8 A8000324 */  addiu      $v1, $zero, 0xA8
    /* 28CC4 801628BC 12004314 */  bne        $v0, $v1, .L80162908
    /* 28CC8 801628C0 21200002 */   addu      $a0, $s0, $zero
    /* 28CCC 801628C4 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28CD0 801628C8 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28CD4 801628CC 42000224 */  addiu      $v0, $zero, 0x42
    /* 28CD8 801628D0 00190400 */  sll        $v1, $a0, 4
    /* 28CDC 801628D4 01008424 */  addiu      $a0, $a0, 0x1
    /* 28CE0 801628D8 0E80013C */  lui        $at, %hi(trigs)
    /* 28CE4 801628DC 21082300 */  addu       $at, $at, $v1
    /* 28CE8 801628E0 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28CEC 801628E4 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28CF0 801628E8 21082300 */  addu       $at, $at, $v1
    /* 28CF4 801628EC D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28CF8 801628F0 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28CFC 801628F4 21082300 */  addu       $at, $at, $v1
    /* 28D00 801628F8 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28D04 801628FC 1280013C */  lui        $at, %hi(numtrigs)
    /* 28D08 80162900 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
    /* 28D0C 80162904 21200002 */  addu       $a0, $s0, $zero
  .L80162908:
    /* 28D10 80162908 910A020C */  jal        GetDPiece__Fii
    /* 28D14 8016290C 21282002 */   addu      $a1, $s1, $zero
    /* 28D18 80162910 00140200 */  sll        $v0, $v0, 16
    /* 28D1C 80162914 03140200 */  sra        $v0, $v0, 16
    /* 28D20 80162918 25020324 */  addiu      $v1, $zero, 0x225
    /* 28D24 8016291C 11004314 */  bne        $v0, $v1, .L80162964
    /* 28D28 80162920 48000224 */   addiu     $v0, $zero, 0x48
    /* 28D2C 80162924 1280043C */  lui        $a0, %hi(numtrigs)
    /* 28D30 80162928 78BB848C */  lw         $a0, %lo(numtrigs)($a0)
    /* 28D34 8016292C 00000000 */  nop
    /* 28D38 80162930 00190400 */  sll        $v1, $a0, 4
    /* 28D3C 80162934 01008424 */  addiu      $a0, $a0, 0x1
    /* 28D40 80162938 0E80013C */  lui        $at, %hi(trigs)
    /* 28D44 8016293C 21082300 */  addu       $at, $at, $v1
    /* 28D48 80162940 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 28D4C 80162944 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 28D50 80162948 21082300 */  addu       $at, $at, $v1
    /* 28D54 8016294C D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 28D58 80162950 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 28D5C 80162954 21082300 */  addu       $at, $at, $v1
    /* 28D60 80162958 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 28D64 8016295C 1280013C */  lui        $at, %hi(numtrigs)
    /* 28D68 80162960 78BB24AC */  sw         $a0, %lo(numtrigs)($at)
  .L80162964:
    /* 28D6C 80162964 01001026 */  addiu      $s0, $s0, 0x1
    /* 28D70 80162968 6000022A */  slti       $v0, $s0, 0x60
    /* 28D74 8016296C B6FF4014 */  bnez       $v0, .L80162848
    /* 28D78 80162970 21200002 */   addu      $a0, $s0, $zero
    /* 28D7C 80162974 01003126 */  addiu      $s1, $s1, 0x1
    /* 28D80 80162978 6000222A */  slti       $v0, $s1, 0x60
    /* 28D84 8016297C B0FF4014 */  bnez       $v0, .L80162840
    /* 28D88 80162980 00000000 */   nop
    /* 28D8C 80162984 1280023C */  lui        $v0, %hi(sel_data)
    /* 28D90 80162988 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 28D94 8016298C 1280013C */  lui        $at, %hi(_trigflag)
    /* 28D98 80162990 21082200 */  addu       $at, $at, $v0
    /* 28D9C 80162994 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 28DA0 80162998 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28DA4 8016299C 1400B18F */  lw         $s1, 0x14($sp)
    /* 28DA8 801629A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 28DAC 801629A4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28DB0 801629A8 0800E003 */  jr         $ra
    /* 28DB4 801629AC 00000000 */   nop
endlabel InitL3Triggers__Fv
