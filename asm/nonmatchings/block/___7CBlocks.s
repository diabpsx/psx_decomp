.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___7CBlocks, 0x88

glabel ___7CBlocks
    /* 7D960 8008D960 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7D964 8008D964 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7D968 8008D968 21808000 */  addu       $s0, $a0, $zero
    /* 7D96C 8008D96C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7D970 8008D970 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7D974 8008D974 2647020C */  jal        DumpMonsters__7CBlocks
    /* 7D978 8008D978 2188A000 */   addu      $s1, $a1, $zero
    /* 7D97C 8008D97C 1D47020C */  jal        DumpObjs__7CBlocks
    /* 7D980 8008D980 21200002 */   addu      $a0, $s0, $zero
    /* 7D984 8008D984 1447020C */  jal        DumpItems__7CBlocks
    /* 7D988 8008D988 21200002 */   addu      $a0, $s0, $zero
    /* 7D98C 8008D98C 7A36020C */  jal        DumpGt4s__7CBlocks
    /* 7D990 8008D990 21200002 */   addu      $a0, $s0, $zero
    /* 7D994 8008D994 9436020C */  jal        DumpRects__7CBlocks
    /* 7D998 8008D998 21200002 */   addu      $a0, $s0, $zero
    /* 7D99C 8008D99C 1280043C */  lui        $a0, %hi(MissDat)
    /* 7D9A0 8008D9A0 28BC848C */  lw         $a0, %lo(MissDat)($a0)
    /* 7D9A4 8008D9A4 00000000 */  nop
    /* 7D9A8 8008D9A8 03008010 */  beqz       $a0, .L8008D9B8
    /* 7D9AC 8008D9AC 00000000 */   nop
    /* 7D9B0 8008D9B0 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 7D9B4 8008D9B4 00000000 */   nop
  .L8008D9B8:
    /* 7D9B8 8008D9B8 21200002 */  addu       $a0, $s0, $zero
    /* 7D9BC 8008D9BC 1280013C */  lui        $at, %hi(MissDat)
    /* 7D9C0 8008D9C0 28BC20AC */  sw         $zero, %lo(MissDat)($at)
    /* 7D9C4 8008D9C4 280580AF */  sw         $zero, %gp_rel(CurrentBlocks)($gp)
    /* 7D9C8 8008D9C8 AA47020C */  jal        ___7TextDat
    /* 7D9CC 8008D9CC 21282002 */   addu      $a1, $s1, $zero
    /* 7D9D0 8008D9D0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7D9D4 8008D9D4 1400B18F */  lw         $s1, 0x14($sp)
    /* 7D9D8 8008D9D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 7D9DC 8008D9DC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7D9E0 8008D9E0 0800E003 */  jr         $ra
    /* 7D9E4 8008D9E4 00000000 */   nop
endlabel ___7CBlocks
