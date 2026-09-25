.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MyRoutine__FR7CBlocksii, 0x68

glabel MyRoutine__FR7CBlocksii
    /* 7E07C 8008E07C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7E080 8008E080 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7E084 8008E084 21808000 */  addu       $s0, $a0, $zero
    /* 7E088 8008E088 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7E08C 8008E08C 2188A000 */  addu       $s1, $a1, $zero
    /* 7E090 8008E090 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7E094 8008E094 2190C000 */  addu       $s2, $a2, $zero
    /* 7E098 8008E098 801F043C */  lui        $a0, (0x1F8003F0 >> 16)
    /* 7E09C 8008E09C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 7E0A0 8008E0A0 6B46000C */  jal        SetSp
    /* 7E0A4 8008E0A4 F0038434 */   ori       $a0, $a0, (0x1F8003F0 & 0xFFFF)
    /* 7E0A8 8008E0A8 21200002 */  addu       $a0, $s0, $zero
    /* 7E0AC 8008E0AC 21282002 */  addu       $a1, $s1, $zero
    /* 7E0B0 8008E0B0 600582AF */  sw         $v0, %gp_rel(OldSp)($gp)
    /* 7E0B4 8008E0B4 4A39020C */  jal        PrintMap__7CBlocksii
    /* 7E0B8 8008E0B8 21304002 */   addu      $a2, $s2, $zero
    /* 7E0BC 8008E0BC 6005848F */  lw         $a0, %gp_rel(OldSp)($gp)
    /* 7E0C0 8008E0C0 6B46000C */  jal        SetSp
    /* 7E0C4 8008E0C4 00000000 */   nop
    /* 7E0C8 8008E0C8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 7E0CC 8008E0CC 1800B28F */  lw         $s2, 0x18($sp)
    /* 7E0D0 8008E0D0 1400B18F */  lw         $s1, 0x14($sp)
    /* 7E0D4 8008E0D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 7E0D8 8008E0D8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7E0DC 8008E0DC 0800E003 */  jr         $ra
    /* 7E0E0 8008E0E0 00000000 */   nop
endlabel MyRoutine__FR7CBlocksii
