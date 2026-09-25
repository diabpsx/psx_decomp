.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetScrXY__7CBlocksR4RECTiiii, 0xD4

glabel GetScrXY__7CBlocksR4RECTiiii
    /* 8185C 8009185C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 81860 80091860 1400B1AF */  sw         $s1, 0x14($sp)
    /* 81864 80091864 21888000 */  addu       $s1, $a0, $zero
    /* 81868 80091868 2400B5AF */  sw         $s5, 0x24($sp)
    /* 8186C 8009186C 21A8A000 */  addu       $s5, $a1, $zero
    /* 81870 80091870 1000B0AF */  sw         $s0, 0x10($sp)
    /* 81874 80091874 2180C000 */  addu       $s0, $a2, $zero
    /* 81878 80091878 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8187C 8009187C 2198E000 */  addu       $s3, $a3, $zero
    /* 81880 80091880 2000B4AF */  sw         $s4, 0x20($sp)
    /* 81884 80091884 4000B48F */  lw         $s4, 0x40($sp)
    /* 81888 80091888 21280002 */  addu       $a1, $s0, $zero
    /* 8188C 8009188C 2800B6AF */  sw         $s6, 0x28($sp)
    /* 81890 80091890 4400B68F */  lw         $s6, 0x44($sp)
    /* 81894 80091894 21306002 */  addu       $a2, $s3, $zero
    /* 81898 80091898 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 8189C 8009189C 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 818A0 800918A0 1800B2AF */   sw        $s2, 0x18($sp)
    /* 818A4 800918A4 21202002 */  addu       $a0, $s1, $zero
    /* 818A8 800918A8 D2002586 */  lh         $a1, 0xD2($s1)
    /* 818AC 800918AC D6002686 */  lh         $a2, 0xD6($s1)
    /* 818B0 800918B0 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 818B4 800918B4 21904000 */   addu      $s2, $v0, $zero
    /* 818B8 800918B8 21202002 */  addu       $a0, $s1, $zero
    /* 818BC 800918BC 21280002 */  addu       $a1, $s0, $zero
    /* 818C0 800918C0 C0003086 */  lh         $s0, 0xC0($s1)
    /* 818C4 800918C4 21306002 */  addu       $a2, $s3, $zero
    /* 818C8 800918C8 21801202 */  addu       $s0, $s0, $s2
    /* 818CC 800918CC 21801402 */  addu       $s0, $s0, $s4
    /* 818D0 800918D0 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 818D4 800918D4 23800202 */   subu      $s0, $s0, $v0
    /* 818D8 800918D8 21202002 */  addu       $a0, $s1, $zero
    /* 818DC 800918DC D2002586 */  lh         $a1, 0xD2($s1)
    /* 818E0 800918E0 D6002686 */  lh         $a2, 0xD6($s1)
    /* 818E4 800918E4 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 818E8 800918E8 21904000 */   addu      $s2, $v0, $zero
    /* 818EC 800918EC C2002386 */  lh         $v1, 0xC2($s1)
    /* 818F0 800918F0 0000B0A6 */  sh         $s0, 0x0($s5)
    /* 818F4 800918F4 21187200 */  addu       $v1, $v1, $s2
    /* 818F8 800918F8 21187600 */  addu       $v1, $v1, $s6
    /* 818FC 800918FC 23186200 */  subu       $v1, $v1, $v0
    /* 81900 80091900 0200A3A6 */  sh         $v1, 0x2($s5)
    /* 81904 80091904 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 81908 80091908 2800B68F */  lw         $s6, 0x28($sp)
    /* 8190C 8009190C 2400B58F */  lw         $s5, 0x24($sp)
    /* 81910 80091910 2000B48F */  lw         $s4, 0x20($sp)
    /* 81914 80091914 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 81918 80091918 1800B28F */  lw         $s2, 0x18($sp)
    /* 8191C 8009191C 1400B18F */  lw         $s1, 0x14($sp)
    /* 81920 80091920 1000B08F */  lw         $s0, 0x10($sp)
    /* 81924 80091924 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 81928 80091928 0800E003 */  jr         $ra
    /* 8192C 8009192C 00000000 */   nop
endlabel GetScrXY__7CBlocksR4RECTiiii
