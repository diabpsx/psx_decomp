.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuReserveReverbWorkArea, 0x4C

glabel SpuReserveReverbWorkArea
    /* 859C 8001859C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 85A0 800185A0 0A008010 */  beqz       $a0, .L800185CC
    /* 85A4 800185A4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 85A8 800185A8 0B80043C */  lui        $a0, %hi(_spu_rev_offsetaddr)
    /* 85AC 800185AC E855848C */  lw         $a0, %lo(_spu_rev_offsetaddr)($a0)
    /* 85B0 800185B0 D75E000C */  jal        _SpuIsInAllocateArea_
    /* 85B4 800185B4 00000000 */   nop
    /* 85B8 800185B8 04004014 */  bnez       $v0, .L800185CC
    /* 85BC 800185BC 01000224 */   addiu     $v0, $zero, 0x1
    /* 85C0 800185C0 0B80013C */  lui        $at, %hi(_spu_rev_reserve_wa)
    /* 85C4 800185C4 76610008 */  j          .L800185D8
    /* 85C8 800185C8 E45522AC */   sw        $v0, %lo(_spu_rev_reserve_wa)($at)
  .L800185CC:
    /* 85CC 800185CC 0B80013C */  lui        $at, %hi(_spu_rev_reserve_wa)
    /* 85D0 800185D0 E45520AC */  sw         $zero, %lo(_spu_rev_reserve_wa)($at)
    /* 85D4 800185D4 21100000 */  addu       $v0, $zero, $zero
  .L800185D8:
    /* 85D8 800185D8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 85DC 800185DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 85E0 800185E0 0800E003 */  jr         $ra
    /* 85E4 800185E4 00000000 */   nop
endlabel SpuReserveReverbWorkArea
    /* 85E8 800185E8 00000000 */  nop
