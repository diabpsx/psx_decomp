.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncdirentry, 0x88

glabel asyncdirentry
    /* 1851C 8002851C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18520 80028520 21108000 */  addu       $v0, $a0, $zero
    /* 18524 80028524 1380043C */  lui        $a0, %hi(D_80134F30)
    /* 18528 80028528 304F8424 */  addiu      $a0, $a0, %lo(D_80134F30)
    /* 1852C 8002852C 7C2285AF */  sw         $a1, %gp_rel(D_8011C9FC)($gp)
    /* 18530 80028530 21284000 */  addu       $a1, $v0, $zero
    /* 18534 80028534 802286AF */  sw         $a2, %gp_rel(D_8011CA00)($gp)
    /* 18538 80028538 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1853C 8002853C 8367000C */  jal        strncpy
    /* 18540 80028540 0D000624 */   addiu     $a2, $zero, 0xD
    /* 18544 80028544 B822828F */  lw         $v0, %gp_rel(rootsector)($gp)
    /* 18548 80028548 B022838F */  lw         $v1, %gp_rel(rootlength)($gp)
    /* 1854C 8002854C D422858F */  lw         $a1, %gp_rel(asyncreadcallbackfunc)($gp)
    /* 18550 80028550 0380043C */  lui        $a0, %hi(setdirentrycallback + 0xC)
    /* 18554 80028554 E4828424 */  addiu      $a0, $a0, %lo(setdirentrycallback + 0xC)
    /* 18558 80028558 842282AF */  sw         $v0, %gp_rel(D_8011CA04)($gp)
    /* 1855C 8002855C 882283AF */  sw         $v1, %gp_rel(D_8011CA08)($gp)
    /* 18560 80028560 782285AF */  sw         $a1, %gp_rel(D_8011C9F8)($gp)
    /* 18564 80028564 539D000C */  jal        setasyncreadcallback
    /* 18568 80028568 00000000 */   nop
    /* 1856C 8002856C 8422848F */  lw         $a0, %gp_rel(D_8011CA04)($gp)
    /* 18570 80028570 00000000 */  nop
    /* 18574 80028574 01008224 */  addiu      $v0, $a0, 0x1
    /* 18578 80028578 842282AF */  sw         $v0, %gp_rel(D_8011CA04)($gp)
    /* 1857C 8002857C 229D000C */  jal        psxcdromasyncseek
    /* 18580 80028580 00000000 */   nop
    /* 18584 80028584 1380043C */  lui        $a0, %hi(cdrombuf)
    /* 18588 80028588 30728424 */  addiu      $a0, $a0, %lo(cdrombuf)
    /* 1858C 8002858C B29E000C */  jal        psxcdromasyncread
    /* 18590 80028590 01000524 */   addiu     $a1, $zero, 0x1
    /* 18594 80028594 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18598 80028598 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1859C 8002859C 0800E003 */  jr         $ra
    /* 185A0 800285A0 00000000 */   nop
endlabel asyncdirentry
