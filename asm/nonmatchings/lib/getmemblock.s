.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getmemblock, 0x60

glabel getmemblock
    /* 1B720 8002B720 A022828F */  lw         $v0, %gp_rel(emptyblock)($gp)
    /* 1B724 8002B724 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B728 8002B728 0C004014 */  bnez       $v0, .L8002B75C
    /* 1B72C 8002B72C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1B730 8002B730 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1B734 8002B734 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1B738 8002B738 1280013C */  lui        $at, %hi(abortfile)
    /* 1B73C 8002B73C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1B740 8002B740 AA050224 */  addiu      $v0, $zero, 0x5AA
    /* 1B744 8002B744 1180043C */  lui        $a0, %hi(D_8010F870)
    /* 1B748 8002B748 70F88424 */  addiu      $a0, $a0, %lo(D_8010F870)
    /* 1B74C 8002B74C 1280013C */  lui        $at, %hi(abortline)
    /* 1B750 8002B750 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1B754 8002B754 0F95000C */  jal        abortmessage
    /* 1B758 8002B758 00000000 */   nop
  .L8002B75C:
    /* 1B75C 8002B75C A022828F */  lw         $v0, %gp_rel(emptyblock)($gp)
    /* 1B760 8002B760 00000000 */  nop
    /* 1B764 8002B764 2000438C */  lw         $v1, 0x20($v0)
    /* 1B768 8002B768 00000000 */  nop
    /* 1B76C 8002B76C A02283AF */  sw         $v1, %gp_rel(emptyblock)($gp)
    /* 1B770 8002B770 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B774 8002B774 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B778 8002B778 0800E003 */  jr         $ra
    /* 1B77C 8002B77C 00000000 */   nop
endlabel getmemblock
