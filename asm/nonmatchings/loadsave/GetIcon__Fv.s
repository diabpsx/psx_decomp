.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetIcon__Fv, 0x3C

glabel GetIcon__Fv
    /* 22AA0 8015C698 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22AA4 8015C69C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 22AA8 8015C6A0 1D11020C */  jal        SYSI_GetFs__Fv
    /* 22AAC 8015C6A4 00000000 */   nop
    /* 22AB0 8015C6A8 21204000 */  addu       $a0, $v0, $zero
    /* 22AB4 8015C6AC 1280053C */  lui        $a1, %hi(D_80119520)
    /* 22AB8 8015C6B0 2095A524 */  addiu      $a1, $a1, %lo(D_80119520)
    /* 22ABC 8015C6B4 0E80063C */  lui        $a2, %hi(IconBuffer)
    /* 22AC0 8015C6B8 C03CC624 */  addiu      $a2, $a2, %lo(IconBuffer)
    /* 22AC4 8015C6BC FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 22AC8 8015C6C0 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 22ACC 8015C6C4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 22AD0 8015C6C8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22AD4 8015C6CC 0800E003 */  jr         $ra
    /* 22AD8 8015C6D0 00000000 */   nop
endlabel GetIcon__Fv
