.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GU_SetRndSeed, 0x30

glabel GU_SetRndSeed
    /* 10CC4 80020CC4 21280000 */  addu       $a1, $zero, $zero
    /* 10CC8 80020CC8 1380033C */  lui        $v1, %hi(RndTabs)
    /* 10CCC 80020CCC E8516324 */  addiu      $v1, $v1, %lo(RndTabs)
  .L80020CD0:
    /* 10CD0 80020CD0 0000828C */  lw         $v0, 0x0($a0)
    /* 10CD4 80020CD4 04008424 */  addiu      $a0, $a0, 0x4
    /* 10CD8 80020CD8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 10CDC 80020CDC 000062AC */  sw         $v0, 0x0($v1)
    /* 10CE0 80020CE0 0600A228 */  slti       $v0, $a1, 0x6
    /* 10CE4 80020CE4 FAFF4014 */  bnez       $v0, .L80020CD0
    /* 10CE8 80020CE8 04006324 */   addiu     $v1, $v1, 0x4
    /* 10CEC 80020CEC 0800E003 */  jr         $ra
    /* 10CF0 80020CF0 00000000 */   nop
endlabel GU_SetRndSeed
