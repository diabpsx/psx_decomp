.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StoreImage, 0x60

glabel StoreImage
    /* 3D84 80013D84 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3D88 80013D88 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3D8C 80013D8C 21808000 */  addu       $s0, $a0, $zero
    /* 3D90 80013D90 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3D94 80013D94 2188A000 */  addu       $s1, $a1, $zero
    /* 3D98 80013D98 1180043C */  lui        $a0, %hi(D_8010DFAC)
    /* 3D9C 80013D9C ACDF8424 */  addiu      $a0, $a0, %lo(D_8010DFAC)
    /* 3DA0 80013DA0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3DA4 80013DA4 B84E000C */  jal        func_80013AE0
    /* 3DA8 80013DA8 21280002 */   addu      $a1, $s0, $zero
    /* 3DAC 80013DAC 21280002 */  addu       $a1, $s0, $zero
    /* 3DB0 80013DB0 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 3DB4 80013DB4 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 3DB8 80013DB8 08000624 */  addiu      $a2, $zero, 0x8
    /* 3DBC 80013DBC 1C00448C */  lw         $a0, 0x1C($v0)
    /* 3DC0 80013DC0 0800428C */  lw         $v0, 0x8($v0)
    /* 3DC4 80013DC4 00000000 */  nop
    /* 3DC8 80013DC8 09F84000 */  jalr       $v0
    /* 3DCC 80013DCC 21382002 */   addu      $a3, $s1, $zero
    /* 3DD0 80013DD0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3DD4 80013DD4 1400B18F */  lw         $s1, 0x14($sp)
    /* 3DD8 80013DD8 1000B08F */  lw         $s0, 0x10($sp)
    /* 3DDC 80013DDC 0800E003 */  jr         $ra
    /* 3DE0 80013DE0 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel StoreImage
