.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFileLength__4PCIOPCc, 0xB8

glabel GetFileLength__4PCIOPCc
    /* 7627C 8008627C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 76280 80086280 2120A000 */  addu       $a0, $a1, $zero
    /* 76284 80086284 21280000 */  addu       $a1, $zero, $zero
    /* 76288 80086288 21300000 */  addu       $a2, $zero, $zero
    /* 7628C 8008628C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 76290 80086290 1800B2AF */  sw         $s2, 0x18($sp)
    /* 76294 80086294 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76298 80086298 AB43000C */  jal        PCopen
    /* 7629C 8008629C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 762A0 800862A0 21804000 */  addu       $s0, $v0, $zero
    /* 762A4 800862A4 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 762A8 800862A8 07001216 */  bne        $s0, $s2, .L800862C8
    /* 762AC 800862AC 21200002 */   addu      $a0, $s0, $zero
    /* 762B0 800862B0 21200000 */  addu       $a0, $zero, $zero
    /* 762B4 800862B4 1180053C */  lui        $a1, %hi(D_80110144)
    /* 762B8 800862B8 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 762BC 800862BC A583000C */  jal        DBG_Error
    /* 762C0 800862C0 83000624 */   addiu     $a2, $zero, 0x83
    /* 762C4 800862C4 21200002 */  addu       $a0, $s0, $zero
  .L800862C8:
    /* 762C8 800862C8 21280000 */  addu       $a1, $zero, $zero
    /* 762CC 800862CC B743000C */  jal        PClseek
    /* 762D0 800862D0 02000624 */   addiu     $a2, $zero, 0x2
    /* 762D4 800862D4 21884000 */  addu       $s1, $v0, $zero
    /* 762D8 800862D8 05003216 */  bne        $s1, $s2, .L800862F0
    /* 762DC 800862DC 21200000 */   addu      $a0, $zero, $zero
    /* 762E0 800862E0 1180053C */  lui        $a1, %hi(D_80110144)
    /* 762E4 800862E4 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 762E8 800862E8 A583000C */  jal        DBG_Error
    /* 762EC 800862EC 86000624 */   addiu     $a2, $zero, 0x86
  .L800862F0:
    /* 762F0 800862F0 B343000C */  jal        PCclose
    /* 762F4 800862F4 21200002 */   addu      $a0, $s0, $zero
    /* 762F8 800862F8 07005214 */  bne        $v0, $s2, .L80086318
    /* 762FC 800862FC 21102002 */   addu      $v0, $s1, $zero
    /* 76300 80086300 21200000 */  addu       $a0, $zero, $zero
    /* 76304 80086304 1180053C */  lui        $a1, %hi(D_80110144)
    /* 76308 80086308 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 7630C 8008630C A583000C */  jal        DBG_Error
    /* 76310 80086310 89000624 */   addiu     $a2, $zero, 0x89
    /* 76314 80086314 21102002 */  addu       $v0, $s1, $zero
  .L80086318:
    /* 76318 80086318 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 7631C 8008631C 1800B28F */  lw         $s2, 0x18($sp)
    /* 76320 80086320 1400B18F */  lw         $s1, 0x14($sp)
    /* 76324 80086324 1000B08F */  lw         $s0, 0x10($sp)
    /* 76328 80086328 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7632C 8008632C 0800E003 */  jr         $ra
    /* 76330 80086330 00000000 */   nop
endlabel GetFileLength__4PCIOPCc
