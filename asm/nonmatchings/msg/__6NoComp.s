.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6NoComp, 0x38

glabel __6NoComp
    /* 42A1C 80052A1C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42A20 80052A20 1000B0AF */  sw         $s0, 0x10($sp)
    /* 42A24 80052A24 1400BFAF */  sw         $ra, 0x14($sp)
    /* 42A28 80052A28 A44A010C */  jal        __9CompClass
    /* 42A2C 80052A2C 21808000 */   addu      $s0, $a0, $zero
    /* 42A30 80052A30 1180023C */  lui        $v0, %hi(D_80116838)
    /* 42A34 80052A34 38684224 */  addiu      $v0, $v0, %lo(D_80116838)
    /* 42A38 80052A38 000002AE */  sw         $v0, 0x0($s0)
    /* 42A3C 80052A3C 21100002 */  addu       $v0, $s0, $zero
    /* 42A40 80052A40 1400BF8F */  lw         $ra, 0x14($sp)
    /* 42A44 80052A44 1000B08F */  lw         $s0, 0x10($sp)
    /* 42A48 80052A48 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42A4C 80052A4C 0800E003 */  jr         $ra
    /* 42A50 80052A50 00000000 */   nop
endlabel __6NoComp
