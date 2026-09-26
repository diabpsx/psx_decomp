.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_mdec_stream, 0x50

glabel init_mdec_stream
    /* 1DB4C 80157744 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1DB50 80157748 21108000 */  addu       $v0, $a0, $zero
    /* 1DB54 8015774C 2120A000 */  addu       $a0, $a1, $zero
    /* 1DB58 80157750 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1DB5C 80157754 2180C000 */  addu       $s0, $a2, $zero
    /* 1DB60 80157758 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1DB64 8015775C 480E84AF */  sw         $a0, %gp_rel(mdec_sectors_per_frame)($gp)
    /* 1DB68 80157760 9557050C */  jal        init_cdstream
    /* 1DB6C 80157764 21284000 */   addu      $a1, $v0, $zero
    /* 1DB70 80157768 480E828F */  lw         $v0, %gp_rel(mdec_sectors_per_frame)($gp)
    /* 1DB74 8015776C 00000000 */  nop
    /* 1DB78 80157770 18000202 */  mult       $s0, $v0
    /* 1DB7C 80157774 380D80AF */  sw         $zero, %gp_rel(mdec_streaming)($gp)
    /* 1DB80 80157778 12180000 */  mflo       $v1
    /* 1DB84 8015777C C0120300 */  sll        $v0, $v1, 11
    /* 1DB88 80157780 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1DB8C 80157784 1000B08F */  lw         $s0, 0x10($sp)
    /* 1DB90 80157788 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1DB94 8015778C 0800E003 */  jr         $ra
    /* 1DB98 80157790 00000000 */   nop
endlabel init_mdec_stream
