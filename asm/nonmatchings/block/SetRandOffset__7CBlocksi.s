.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRandOffset__7CBlocksi, 0x5C

glabel SetRandOffset__7CBlocksi
    /* 7E0E4 8008E0E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7E0E8 8008E0E8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7E0EC 8008E0EC 21908000 */  addu       $s2, $a0, $zero
    /* 7E0F0 8008E0F0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7E0F4 8008E0F4 2180A000 */  addu       $s0, $a1, $zero
    /* 7E0F8 8008E0F8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7E0FC 8008E0FC 40881000 */  sll        $s1, $s0, 1
    /* 7E100 8008E100 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 7E104 8008E104 6983000C */  jal        GU_GetRndRange
    /* 7E108 8008E108 21202002 */   addu      $a0, $s1, $zero
    /* 7E10C 8008E10C 21202002 */  addu       $a0, $s1, $zero
    /* 7E110 8008E110 23105000 */  subu       $v0, $v0, $s0
    /* 7E114 8008E114 6983000C */  jal        GU_GetRndRange
    /* 7E118 8008E118 7C0042AE */   sw        $v0, 0x7C($s2)
    /* 7E11C 8008E11C 23105000 */  subu       $v0, $v0, $s0
    /* 7E120 8008E120 800042AE */  sw         $v0, 0x80($s2)
    /* 7E124 8008E124 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 7E128 8008E128 1800B28F */  lw         $s2, 0x18($sp)
    /* 7E12C 8008E12C 1400B18F */  lw         $s1, 0x14($sp)
    /* 7E130 8008E130 1000B08F */  lw         $s0, 0x10($sp)
    /* 7E134 8008E134 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7E138 8008E138 0800E003 */  jr         $ra
    /* 7E13C 8008E13C 00000000 */   nop
endlabel SetRandOffset__7CBlocksi
