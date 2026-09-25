.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeltaImportData__FPc, 0x48

glabel DeltaImportData__FPc
    /* 3F58C 8004F58C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F590 8004F590 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3F594 8004F594 21888000 */  addu       $s1, $a0, $zero
    /* 3F598 8004F598 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3F59C 8004F59C 954A010C */  jal        GetSize__14CompressedLevs
    /* 3F5A0 8004F5A0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 3F5A4 8004F5A4 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 3F5A8 8004F5A8 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 3F5AC 8004F5AC 21804000 */  addu       $s0, $v0, $zero
    /* 3F5B0 8004F5B0 2906020C */  jal        ImportData__13CompLevelMapsP14CompressedLevs
    /* 3F5B4 8004F5B4 21282002 */   addu      $a1, $s1, $zero
    /* 3F5B8 8004F5B8 21100002 */  addu       $v0, $s0, $zero
    /* 3F5BC 8004F5BC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F5C0 8004F5C0 1400B18F */  lw         $s1, 0x14($sp)
    /* 3F5C4 8004F5C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 3F5C8 8004F5C8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F5CC 8004F5CC 0800E003 */  jr         $ra
    /* 3F5D0 8004F5D0 00000000 */   nop
endlabel DeltaImportData__FPc
