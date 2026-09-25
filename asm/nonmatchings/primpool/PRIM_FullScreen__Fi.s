.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_FullScreen__Fi, 0x3C

glabel PRIM_FullScreen__Fi
    /* 73B20 80083B20 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 73B24 80083B24 21288000 */  addu       $a1, $a0, $zero
    /* 73B28 80083B28 40010224 */  addiu      $v0, $zero, 0x140
    /* 73B2C 80083B2C 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 73B30 80083B30 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 73B34 80083B34 1000A427 */  addiu      $a0, $sp, 0x10
    /* 73B38 80083B38 1800BFAF */  sw         $ra, 0x18($sp)
    /* 73B3C 80083B3C 1000A0A7 */  sh         $zero, 0x10($sp)
    /* 73B40 80083B40 1200A0A7 */  sh         $zero, 0x12($sp)
    /* 73B44 80083B44 7B0E020C */  jal        PRIM_Clip__FP4RECTi
    /* 73B48 80083B48 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 73B4C 80083B4C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 73B50 80083B50 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 73B54 80083B54 0800E003 */  jr         $ra
    /* 73B58 80083B58 00000000 */   nop
endlabel PRIM_FullScreen__Fi
