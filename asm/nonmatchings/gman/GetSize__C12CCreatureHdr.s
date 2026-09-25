.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSize__C12CCreatureHdr, 0x6C

glabel GetSize__C12CCreatureHdr
    /* 843EC 800943EC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 843F0 800943F0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 843F4 800943F4 0000938C */  lw         $s3, 0x0($a0)
    /* 843F8 800943F8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 843FC 800943FC 04001224 */  addiu      $s2, $zero, 0x4
    /* 84400 80094400 1400B1AF */  sw         $s1, 0x14($sp)
    /* 84404 80094404 04009124 */  addiu      $s1, $a0, 0x4
    /* 84408 80094408 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8440C 8009440C 21800000 */  addu       $s0, $zero, $zero
    /* 84410 80094410 2000BFAF */  sw         $ra, 0x20($sp)
  .L80094414:
    /* 84414 80094414 2A101302 */  slt        $v0, $s0, $s3
    /* 84418 80094418 07004010 */  beqz       $v0, .L80094438
    /* 8441C 8009441C 21104002 */   addu      $v0, $s2, $zero
    /* 84420 80094420 6450020C */  jal        GetSize__C15CCreatureAction
    /* 84424 80094424 21202002 */   addu      $a0, $s1, $zero
    /* 84428 80094428 21882202 */  addu       $s1, $s1, $v0
    /* 8442C 8009442C 21904202 */  addu       $s2, $s2, $v0
    /* 84430 80094430 05510208 */  j          .L80094414
    /* 84434 80094434 01001026 */   addiu     $s0, $s0, 0x1
  .L80094438:
    /* 84438 80094438 2000BF8F */  lw         $ra, 0x20($sp)
    /* 8443C 8009443C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 84440 80094440 1800B28F */  lw         $s2, 0x18($sp)
    /* 84444 80094444 1400B18F */  lw         $s1, 0x14($sp)
    /* 84448 80094448 1000B08F */  lw         $s0, 0x10($sp)
    /* 8444C 8009444C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 84450 80094450 0800E003 */  jr         $ra
    /* 84454 80094454 00000000 */   nop
endlabel GetSize__C12CCreatureHdr
