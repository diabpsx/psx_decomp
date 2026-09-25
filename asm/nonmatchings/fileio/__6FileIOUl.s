.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6FileIOUl, 0x50

glabel __6FileIOUl
    /* 7587C 8008587C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 75880 80085880 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75884 80085884 21808000 */  addu       $s0, $a0, $zero
    /* 75888 80085888 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7588C 8008588C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 75890 80085890 8619020C */  jal        __6SysObj
    /* 75894 80085894 2188A000 */   addu      $s1, $a1, $zero
    /* 75898 80085898 21100002 */  addu       $v0, $s0, $zero
    /* 7589C 8008589C 1180033C */  lui        $v1, %hi(_vt_6FileIO)
    /* 758A0 800858A0 F8006324 */  addiu      $v1, $v1, %lo(_vt_6FileIO)
    /* 758A4 800858A4 100043AC */  sw         $v1, 0x10($v0)
    /* 758A8 800858A8 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 758AC 800858AC 080043AC */  sw         $v1, 0x8($v0)
    /* 758B0 800858B0 040051AC */  sw         $s1, 0x4($v0)
    /* 758B4 800858B4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 758B8 800858B8 1400B18F */  lw         $s1, 0x14($sp)
    /* 758BC 800858BC 1000B08F */  lw         $s0, 0x10($sp)
    /* 758C0 800858C0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 758C4 800858C4 0800E003 */  jr         $ra
    /* 758C8 800858C8 00000000 */   nop
endlabel __6FileIOUl
