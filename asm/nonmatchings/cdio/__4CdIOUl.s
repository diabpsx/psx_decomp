.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __4CdIOUl, 0x44

glabel __4CdIOUl
    /* 76C40 80086C40 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 76C44 80086C44 1000B0AF */  sw         $s0, 0x10($sp)
    /* 76C48 80086C48 1400BFAF */  sw         $ra, 0x14($sp)
    /* 76C4C 80086C4C 1F16020C */  jal        __6FileIOUl
    /* 76C50 80086C50 21808000 */   addu      $s0, $a0, $zero
    /* 76C54 80086C54 1180023C */  lui        $v0, %hi(_vt_4CdIO)
    /* 76C58 80086C58 34024224 */  addiu      $v0, $v0, %lo(_vt_4CdIO)
    /* 76C5C 80086C5C EB6A000C */  jal        CdInit
    /* 76C60 80086C60 100002AE */   sw        $v0, 0x10($s0)
    /* 76C64 80086C64 5D6B000C */  jal        CdSetDebug
    /* 76C68 80086C68 21200000 */   addu      $a0, $zero, $zero
    /* 76C6C 80086C6C 21100002 */  addu       $v0, $s0, $zero
    /* 76C70 80086C70 1400BF8F */  lw         $ra, 0x14($sp)
    /* 76C74 80086C74 1000B08F */  lw         $s0, 0x10($sp)
    /* 76C78 80086C78 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 76C7C 80086C7C 0800E003 */  jr         $ra
    /* 76C80 80086C80 00000000 */   nop
endlabel __4CdIOUl
