.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSearchPath__6FileIOPCc, 0xDC

glabel SetSearchPath__6FileIOPCc
    /* 75D1C 80085D1C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 75D20 80085D20 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75D24 80085D24 21808000 */  addu       $s0, $a0, $zero
    /* 75D28 80085D28 1400B1AF */  sw         $s1, 0x14($sp)
    /* 75D2C 80085D2C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 75D30 80085D30 2E17020C */  jal        DumpOldPath__6FileIO
    /* 75D34 80085D34 2188A000 */   addu      $s1, $a1, $zero
    /* 75D38 80085D38 8767000C */  jal        strlen
    /* 75D3C 80085D3C 21202002 */   addu      $a0, $s1, $zero
    /* 75D40 80085D40 01004424 */  addiu      $a0, $v0, 0x1
    /* 75D44 80085D44 0400058E */  lw         $a1, 0x4($s0)
    /* 75D48 80085D48 7785000C */  jal        GAL_Alloc
    /* 75D4C 80085D4C 21300000 */   addu      $a2, $zero, $zero
    /* 75D50 80085D50 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 75D54 80085D54 06004314 */  bne        $v0, $v1, .L80085D70
    /* 75D58 80085D58 080002AE */   sw        $v0, 0x8($s0)
    /* 75D5C 80085D5C 21200000 */  addu       $a0, $zero, $zero
    /* 75D60 80085D60 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75D64 80085D64 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75D68 80085D68 A583000C */  jal        DBG_Error
    /* 75D6C 80085D6C C6000624 */   addiu     $a2, $zero, 0xC6
  .L80085D70:
    /* 75D70 80085D70 0800048E */  lw         $a0, 0x8($s0)
    /* 75D74 80085D74 DD85000C */  jal        GAL_Lock
    /* 75D78 80085D78 00000000 */   nop
    /* 75D7C 80085D7C 0800038E */  lw         $v1, 0x8($s0)
    /* 75D80 80085D80 00000000 */  nop
    /* 75D84 80085D84 06006014 */  bnez       $v1, .L80085DA0
    /* 75D88 80085D88 0C0002AE */   sw        $v0, 0xC($s0)
    /* 75D8C 80085D8C 21200000 */  addu       $a0, $zero, $zero
    /* 75D90 80085D90 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75D94 80085D94 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75D98 80085D98 A583000C */  jal        DBG_Error
    /* 75D9C 80085D9C C9000624 */   addiu     $a2, $zero, 0xC9
  .L80085DA0:
    /* 75DA0 80085DA0 0C00048E */  lw         $a0, 0xC($s0)
    /* 75DA4 80085DA4 F240000C */  jal        strcpy
    /* 75DA8 80085DA8 21282002 */   addu      $a1, $s1, $zero
    /* 75DAC 80085DAC 0C00048E */  lw         $a0, 0xC($s0)
    /* 75DB0 80085DB0 1D21020C */  jal        strupr__FPc
    /* 75DB4 80085DB4 00000000 */   nop
    /* 75DB8 80085DB8 0800048E */  lw         $a0, 0x8($s0)
    /* 75DBC 80085DBC F785000C */  jal        GAL_Unlock
    /* 75DC0 80085DC0 00000000 */   nop
    /* 75DC4 80085DC4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 75DC8 80085DC8 05004014 */  bnez       $v0, .L80085DE0
    /* 75DCC 80085DCC 21200000 */   addu      $a0, $zero, $zero
    /* 75DD0 80085DD0 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75DD4 80085DD4 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75DD8 80085DD8 A583000C */  jal        DBG_Error
    /* 75DDC 80085DDC CF000624 */   addiu     $a2, $zero, 0xCF
  .L80085DE0:
    /* 75DE0 80085DE0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 75DE4 80085DE4 1400B18F */  lw         $s1, 0x14($sp)
    /* 75DE8 80085DE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 75DEC 80085DEC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 75DF0 80085DF0 0800E003 */  jr         $ra
    /* 75DF4 80085DF4 00000000 */   nop
endlabel SetSearchPath__6FileIOPCc
