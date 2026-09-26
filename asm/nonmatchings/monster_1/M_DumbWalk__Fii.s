.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DumbWalk__Fii, 0x54

glabel M_DumbWalk__Fii
    /* 15DF0 8014F9E8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 15DF4 8014F9EC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 15DF8 8014F9F0 21808000 */  addu       $s0, $a0, $zero
    /* 15DFC 8014F9F4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 15E00 8014F9F8 2190A000 */  addu       $s2, $a1, $zero
    /* 15E04 8014F9FC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 15E08 8014FA00 EB53050C */  jal        DirOK__Fii
    /* 15E0C 8014FA04 1400B1AF */   sw        $s1, 0x14($sp)
    /* 15E10 8014FA08 FF005130 */  andi       $s1, $v0, 0xFF
    /* 15E14 8014FA0C 03002012 */  beqz       $s1, .L8014FA1C
    /* 15E18 8014FA10 21200002 */   addu      $a0, $s0, $zero
    /* 15E1C 8014FA14 433C050C */  jal        M_WalkDir__Fii
    /* 15E20 8014FA18 21284002 */   addu      $a1, $s2, $zero
  .L8014FA1C:
    /* 15E24 8014FA1C 21102002 */  addu       $v0, $s1, $zero
    /* 15E28 8014FA20 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 15E2C 8014FA24 1800B28F */  lw         $s2, 0x18($sp)
    /* 15E30 8014FA28 1400B18F */  lw         $s1, 0x14($sp)
    /* 15E34 8014FA2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 15E38 8014FA30 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 15E3C 8014FA34 0800E003 */  jr         $ra
    /* 15E40 8014FA38 00000000 */   nop
endlabel M_DumbWalk__Fii
