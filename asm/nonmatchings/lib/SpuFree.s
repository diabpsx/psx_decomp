.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuFree, 0x7C

glabel SpuFree
    /* 798C 8001798C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7990 80017990 0B80033C */  lui        $v1, %hi(_spu_AllocBlockNum)
    /* 7994 80017994 AC5A638C */  lw         $v1, %lo(_spu_AllocBlockNum)($v1)
    /* 7998 80017998 21300000 */  addu       $a2, $zero, $zero
    /* 799C 8001799C 14006018 */  blez       $v1, .L800179F0
    /* 79A0 800179A0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 79A4 800179A4 0040093C */  lui        $t1, (0x40000000 >> 16)
    /* 79A8 800179A8 0080023C */  lui        $v0, (0x80000000 >> 16)
    /* 79AC 800179AC 25408200 */  or         $t0, $a0, $v0
    /* 79B0 800179B0 21386000 */  addu       $a3, $v1, $zero
    /* 79B4 800179B4 0B80053C */  lui        $a1, %hi(_spu_memList)
    /* 79B8 800179B8 B45AA58C */  lw         $a1, %lo(_spu_memList)($a1)
    /* 79BC 800179BC 00000000 */  nop
  .L800179C0:
    /* 79C0 800179C0 0000A38C */  lw         $v1, 0x0($a1)
    /* 79C4 800179C4 00000000 */  nop
    /* 79C8 800179C8 24106900 */  and        $v0, $v1, $t1
    /* 79CC 800179CC 08004014 */  bnez       $v0, .L800179F0
    /* 79D0 800179D0 00000000 */   nop
    /* 79D4 800179D4 03006414 */  bne        $v1, $a0, .L800179E4
    /* 79D8 800179D8 0100C624 */   addiu     $a2, $a2, 0x1
    /* 79DC 800179DC 7C5E0008 */  j          .L800179F0
    /* 79E0 800179E0 0000A8AC */   sw        $t0, 0x0($a1)
  .L800179E4:
    /* 79E4 800179E4 2A10C700 */  slt        $v0, $a2, $a3
    /* 79E8 800179E8 F5FF4014 */  bnez       $v0, .L800179C0
    /* 79EC 800179EC 0800A524 */   addiu     $a1, $a1, 0x8
  .L800179F0:
    /* 79F0 800179F0 A35D000C */  jal        _spu_gcSPU
    /* 79F4 800179F4 00000000 */   nop
    /* 79F8 800179F8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 79FC 800179FC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7A00 80017A00 0800E003 */  jr         $ra
    /* 7A04 80017A04 00000000 */   nop
endlabel SpuFree
    /* 7A08 80017A08 00000000 */  nop
