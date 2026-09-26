.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitNewP1NameMenu__Fv, 0x5C

glabel FeInitNewP1NameMenu__Fv
    /* 1844 8013B43C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1848 8013B440 0D80043C */  lui        $a0, %hi(FeNameEngMenuTable)
    /* 184C 8013B444 40D98424 */  addiu      $a0, $a0, %lo(FeNameEngMenuTable)
    /* 1850 8013B448 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1854 8013B44C 54E7040C */  jal        FeAddNameTable__FPUci
    /* 1858 8013B450 28000524 */   addiu     $a1, $zero, 0x28
    /* 185C 8013B454 0C000224 */  addiu      $v0, $zero, 0xC
    /* 1860 8013B458 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 1864 8013B45C 20000224 */  addiu      $v0, $zero, 0x20
    /* 1868 8013B460 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 186C 8013B464 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 1870 8013B468 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 1874 8013B46C 80000224 */  addiu      $v0, $zero, 0x80
    /* 1878 8013B470 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 187C 8013B474 01000224 */  addiu      $v0, $zero, 0x1
    /* 1880 8013B478 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 1884 8013B47C 74A622A0 */  sb         $v0, %lo(plr + 0x13C)($at)
    /* 1888 8013B480 0E80013C */  lui        $at, %hi(plr + 0x1B24)
    /* 188C 8013B484 5CC022A0 */  sb         $v0, %lo(plr + 0x1B24)($at)
    /* 1890 8013B488 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1894 8013B48C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1898 8013B490 0800E003 */  jr         $ra
    /* 189C 8013B494 00000000 */   nop
endlabel FeInitNewP1NameMenu__Fv
