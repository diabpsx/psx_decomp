.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __main, 0x70

glabel __main
    /* FC8 80010FC8 0B80083C */  lui        $t0, %hi(D_800B4290)
    /* FCC 80010FCC 9042088D */  lw         $t0, %lo(D_800B4290)($t0)
    /* FD0 80010FD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* FD4 80010FD4 0400B0AF */  sw         $s0, 0x4($sp)
    /* FD8 80010FD8 0800B1AF */  sw         $s1, 0x8($sp)
    /* FDC 80010FDC 0C00BFAF */  sw         $ra, 0xC($sp)
    /* FE0 80010FE0 0F000015 */  bnez       $t0, .L80011020
    /* FE4 80010FE4 01000834 */   ori       $t0, $zero, 0x1
    /* FE8 80010FE8 0B80013C */  lui        $at, %hi(D_800B4290)
    /* FEC 80010FEC 904228AC */  sw         $t0, %lo(D_800B4290)($at)
    /* FF0 80010FF0 0B80103C */  lui        $s0, %hi(D_800B0C98)
    /* FF4 80010FF4 980C1026 */  addiu      $s0, $s0, %lo(D_800B0C98)
    /* FF8 80010FF8 0000113C */  lui        $s1, %hi(D_F)
    /* FFC 80010FFC 0F003126 */  addiu      $s1, $s1, %lo(D_F)
    /* 1000 80011000 07002012 */  beqz       $s1, .L80011020
    /* 1004 80011004 00000000 */   nop
  .L80011008:
    /* 1008 80011008 0000088E */  lw         $t0, 0x0($s0)
    /* 100C 8001100C 04001026 */  addiu      $s0, $s0, 0x4
    /* 1010 80011010 09F80001 */  jalr       $t0
    /* 1014 80011014 FFFF3126 */   addiu     $s1, $s1, -0x1
    /* 1018 80011018 FBFF2016 */  bnez       $s1, .L80011008
    /* 101C 8001101C 00000000 */   nop
  .L80011020:
    /* 1020 80011020 0C00BF8F */  lw         $ra, 0xC($sp)
    /* 1024 80011024 0800B18F */  lw         $s1, 0x8($sp)
    /* 1028 80011028 0400B08F */  lw         $s0, 0x4($sp)
    /* 102C 8001102C 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 1030 80011030 0800E003 */  jr         $ra
    /* 1034 80011034 00000000 */   nop
endlabel __main
