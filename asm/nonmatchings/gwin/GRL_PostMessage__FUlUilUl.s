.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GRL_PostMessage__FUlUilUl, 0xAC

glabel GRL_PostMessage__FUlUilUl
    /* 6B254 8007B254 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6B258 8007B258 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 6B25C 8007B25C 21988000 */  addu       $s3, $a0, $zero
    /* 6B260 8007B260 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6B264 8007B264 2180A000 */  addu       $s0, $a1, $zero
    /* 6B268 8007B268 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6B26C 8007B26C 2188C000 */  addu       $s1, $a2, $zero
    /* 6B270 8007B270 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6B274 8007B274 2190E000 */  addu       $s2, $a3, $zero
    /* 6B278 8007B278 2000BFAF */  sw         $ra, 0x20($sp)
    /* 6B27C 8007B27C C0EC010C */  jal        Msg2Txt__Fi
    /* 6B280 8007B280 21200002 */   addu      $a0, $s0, $zero
    /* 6B284 8007B284 07004014 */  bnez       $v0, .L8007B2A4
    /* 6B288 8007B288 21200002 */   addu      $a0, $s0, $zero
    /* 6B28C 8007B28C 21200000 */  addu       $a0, $zero, $zero
    /* 6B290 8007B290 1280053C */  lui        $a1, %hi(D_80118B18)
    /* 6B294 8007B294 188BA524 */  addiu      $a1, $a1, %lo(D_80118B18)
    /* 6B298 8007B298 A583000C */  jal        DBG_Error
    /* 6B29C 8007B29C 89000624 */   addiu     $a2, $zero, 0x89
    /* 6B2A0 8007B2A0 21200002 */  addu       $a0, $s0, $zero
  .L8007B2A4:
    /* 6B2A4 8007B2A4 21282002 */  addu       $a1, $s1, $zero
    /* 6B2A8 8007B2A8 D75A020C */  jal        PSX_WndProc__FUilUl
    /* 6B2AC 8007B2AC 21304002 */   addu      $a2, $s2, $zero
    /* 6B2B0 8007B2B0 21206002 */  addu       $a0, $s3, $zero
    /* 6B2B4 8007B2B4 21280002 */  addu       $a1, $s0, $zero
    /* 6B2B8 8007B2B8 21302002 */  addu       $a2, $s1, $zero
    /* 6B2BC 8007B2BC 8BEC010C */  jal        GRL_CallWindowProc__FUlUilUl
    /* 6B2C0 8007B2C0 21384002 */   addu      $a3, $s2, $zero
    /* 6B2C4 8007B2C4 21200002 */  addu       $a0, $s0, $zero
    /* 6B2C8 8007B2C8 21282002 */  addu       $a1, $s1, $zero
    /* 6B2CC 8007B2CC B85B020C */  jal        PSX_PostWndProc__FUilUl
    /* 6B2D0 8007B2D0 21304002 */   addu      $a2, $s2, $zero
    /* 6B2D4 8007B2D4 FF6C020C */  jal        SetAmbientLight__Fv
    /* 6B2D8 8007B2D8 00000000 */   nop
    /* 6B2DC 8007B2DC 01000224 */  addiu      $v0, $zero, 0x1
    /* 6B2E0 8007B2E0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6B2E4 8007B2E4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 6B2E8 8007B2E8 1800B28F */  lw         $s2, 0x18($sp)
    /* 6B2EC 8007B2EC 1400B18F */  lw         $s1, 0x14($sp)
    /* 6B2F0 8007B2F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6B2F4 8007B2F4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6B2F8 8007B2F8 0800E003 */  jr         $ra
    /* 6B2FC 8007B2FC 00000000 */   nop
endlabel GRL_PostMessage__FUlUilUl
