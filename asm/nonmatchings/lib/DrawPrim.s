.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawPrim, 0x5C

glabel DrawPrim
    /* 4010 80014010 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4014 80014014 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4018 80014018 21808000 */  addu       $s0, $a0, $zero
    /* 401C 8001401C 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 4020 80014020 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 4024 80014024 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4028 80014028 1400B1AF */  sw         $s1, 0x14($sp)
    /* 402C 8001402C 3C00428C */  lw         $v0, 0x3C($v0)
    /* 4030 80014030 03001192 */  lbu        $s1, 0x3($s0)
    /* 4034 80014034 09F84000 */  jalr       $v0
    /* 4038 80014038 21200000 */   addu      $a0, $zero, $zero
    /* 403C 8001403C 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 4040 80014040 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 4044 80014044 04000426 */  addiu      $a0, $s0, 0x4
    /* 4048 80014048 1400428C */  lw         $v0, 0x14($v0)
    /* 404C 8001404C 00000000 */  nop
    /* 4050 80014050 09F84000 */  jalr       $v0
    /* 4054 80014054 21282002 */   addu      $a1, $s1, $zero
    /* 4058 80014058 1800BF8F */  lw         $ra, 0x18($sp)
    /* 405C 8001405C 1400B18F */  lw         $s1, 0x14($sp)
    /* 4060 80014060 1000B08F */  lw         $s0, 0x10($sp)
    /* 4064 80014064 0800E003 */  jr         $ra
    /* 4068 80014068 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel DrawPrim
