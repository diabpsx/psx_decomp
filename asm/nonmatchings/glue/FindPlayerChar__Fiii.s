.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindPlayerChar__Fiii, 0x5C

glabel FindPlayerChar__Fiii
    /* 8C1F8 8009C1F8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8C1FC 8009C1FC 1280013C */  lui        $at, %hi(D_8011B00C)
    /* 8C200 8009C200 21082400 */  addu       $at, $at, $a0
    /* 8C204 8009C204 0CB02280 */  lb         $v0, %lo(D_8011B00C)($at)
    /* 8C208 8009C208 1800A427 */  addiu      $a0, $sp, 0x18
    /* 8C20C 8009C20C 1180013C */  lui        $at, %hi(D_80110B68)
    /* 8C210 8009C210 21082500 */  addu       $at, $at, $a1
    /* 8C214 8009C214 680B2380 */  lb         $v1, %lo(D_80110B68)($at)
    /* 8C218 8009C218 1280013C */  lui        $at, %hi(D_8011B008)
    /* 8C21C 8009C21C 21082600 */  addu       $at, $at, $a2
    /* 8C220 8009C220 08B02780 */  lb         $a3, %lo(D_8011B008)($at)
    /* 8C224 8009C224 1280053C */  lui        $a1, %hi(D_8011AFF8)
    /* 8C228 8009C228 F8AFA524 */  addiu      $a1, $a1, %lo(D_8011AFF8)
    /* 8C22C 8009C22C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 8C230 8009C230 21304000 */  addu       $a2, $v0, $zero
    /* 8C234 8009C234 9767000C */  jal        sprintf
    /* 8C238 8009C238 1000A3AF */   sw        $v1, 0x10($sp)
    /* 8C23C 8009C23C 5870020C */  jal        FindPlayerChar__FPc
    /* 8C240 8009C240 1800A427 */   addiu     $a0, $sp, 0x18
    /* 8C244 8009C244 3000BF8F */  lw         $ra, 0x30($sp)
    /* 8C248 8009C248 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8C24C 8009C24C 0800E003 */  jr         $ra
    /* 8C250 8009C250 00000000 */   nop
endlabel FindPlayerChar__Fiii
