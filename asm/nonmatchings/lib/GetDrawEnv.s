.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDrawEnv, 0x34

glabel GetDrawEnv
    /* 4274 80014274 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4278 80014278 1000B0AF */  sw         $s0, 0x10($sp)
    /* 427C 8001427C 21808000 */  addu       $s0, $a0, $zero
    /* 4280 80014280 0B80053C */  lui        $a1, %hi(D_800B54BC)
    /* 4284 80014284 BC54A524 */  addiu      $a1, $a1, %lo(D_800B54BC)
    /* 4288 80014288 1400BFAF */  sw         $ra, 0x14($sp)
    /* 428C 8001428C 8B67000C */  jal        memcpy
    /* 4290 80014290 5C000624 */   addiu     $a2, $zero, 0x5C
    /* 4294 80014294 21100002 */  addu       $v0, $s0, $zero
    /* 4298 80014298 1400BF8F */  lw         $ra, 0x14($sp)
    /* 429C 8001429C 1000B08F */  lw         $s0, 0x10($sp)
    /* 42A0 800142A0 0800E003 */  jr         $ra
    /* 42A4 800142A4 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel GetDrawEnv
