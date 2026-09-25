.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadImage, 0x60

glabel LoadImage
    /* 3D24 80013D24 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3D28 80013D28 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3D2C 80013D2C 21808000 */  addu       $s0, $a0, $zero
    /* 3D30 80013D30 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3D34 80013D34 2188A000 */  addu       $s1, $a1, $zero
    /* 3D38 80013D38 1180043C */  lui        $a0, %hi(D_8010DFA0)
    /* 3D3C 80013D3C A0DF8424 */  addiu      $a0, $a0, %lo(D_8010DFA0)
    /* 3D40 80013D40 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3D44 80013D44 B84E000C */  jal        func_80013AE0
    /* 3D48 80013D48 21280002 */   addu      $a1, $s0, $zero
    /* 3D4C 80013D4C 21280002 */  addu       $a1, $s0, $zero
    /* 3D50 80013D50 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 3D54 80013D54 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 3D58 80013D58 08000624 */  addiu      $a2, $zero, 0x8
    /* 3D5C 80013D5C 2000448C */  lw         $a0, 0x20($v0)
    /* 3D60 80013D60 0800428C */  lw         $v0, 0x8($v0)
    /* 3D64 80013D64 00000000 */  nop
    /* 3D68 80013D68 09F84000 */  jalr       $v0
    /* 3D6C 80013D6C 21382002 */   addu      $a3, $s1, $zero
    /* 3D70 80013D70 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3D74 80013D74 1400B18F */  lw         $s1, 0x14($sp)
    /* 3D78 80013D78 1000B08F */  lw         $s0, 0x10($sp)
    /* 3D7C 80013D7C 0800E003 */  jr         $ra
    /* 3D80 80013D80 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel LoadImage
