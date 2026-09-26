.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_OpenModule__Fv, 0xC0

glabel VID_OpenModule__Fv
    /* A0320 800B0320 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* A0324 800B0324 1800BFAF */  sw         $ra, 0x18($sp)
    /* A0328 800B0328 784E000C */  jal        SetDispMask
    /* A032C 800B032C 21200000 */   addu      $a0, $zero, $zero
    /* A0330 800B0330 1748000C */  jal        VSync
    /* A0334 800B0334 21200000 */   addu      $a0, $zero, $zero
    /* A0338 800B0338 1748000C */  jal        VSync
    /* A033C 800B033C 21200000 */   addu      $a0, $zero, $zero
    /* A0340 800B0340 21200000 */  addu       $a0, $zero, $zero
    /* A0344 800B0344 5710020C */  jal        VID_SetXYOff__Fii
    /* A0348 800B0348 21280000 */   addu      $a1, $zero, $zero
    /* A034C 800B034C 534B000C */  jal        SetVideoMode
    /* A0350 800B0350 21200000 */   addu      $a0, $zero, $zero
    /* A0354 800B0354 F8C0020C */  jal        InitScreens__Fv
    /* A0358 800B0358 00000000 */   nop
    /* A035C 800B035C F90C020C */  jal        GPUQ_InitModule__Fv
    /* A0360 800B0360 00000000 */   nop
    /* A0364 800B0364 FF004230 */  andi       $v0, $v0, 0xFF
    /* A0368 800B0368 05004014 */  bnez       $v0, .L800B0380
    /* A036C 800B036C 21200000 */   addu      $a0, $zero, $zero
    /* A0370 800B0370 1180053C */  lui        $a1, %hi(D_8010FFE0)
    /* A0374 800B0374 E0FFA524 */  addiu      $a1, $a1, %lo(D_8010FFE0)
    /* A0378 800B0378 A583000C */  jal        DBG_Error
    /* A037C 800B037C 7F000624 */   addiu     $a2, $zero, 0x7F
  .L800B0380:
    /* A0380 800B0380 0880043C */  lui        $a0, %hi(VID_DispEnvSend)
    /* A0384 800B0384 04418424 */  addiu      $a0, $a0, %lo(VID_DispEnvSend)
    /* A0388 800B0388 AC1E80AF */  sw         $zero, %gp_rel(D_8011C62C)($gp)
    /* A038C 800B038C C348000C */  jal        VSyncCallback
    /* A0390 800B0390 00000000 */   nop
    /* A0394 800B0394 00040424 */  addiu      $a0, $zero, 0x400
    /* A0398 800B0398 00020524 */  addiu      $a1, $zero, 0x200
    /* A039C 800B039C 02000624 */  addiu      $a2, $zero, 0x2
    /* A03A0 800B03A0 01000224 */  addiu      $v0, $zero, 0x1
    /* A03A4 800B03A4 1280073C */  lui        $a3, %hi(D_8011CAE0)
    /* A03A8 800B03A8 E0CAE724 */  addiu      $a3, $a3, %lo(D_8011CAE0)
    /* A03AC 800B03AC FD0D020C */  jal        PRIM_Open__FiiiP10SCREEN_ENVUl
    /* A03B0 800B03B0 1000A2AF */   sw        $v0, 0x10($sp)
    /* A03B4 800B03B4 FF004230 */  andi       $v0, $v0, 0xFF
    /* A03B8 800B03B8 05004014 */  bnez       $v0, .L800B03D0
    /* A03BC 800B03BC 21200000 */   addu      $a0, $zero, $zero
    /* A03C0 800B03C0 1180053C */  lui        $a1, %hi(D_8010FFE0)
    /* A03C4 800B03C4 E0FFA524 */  addiu      $a1, $a1, %lo(D_8010FFE0)
    /* A03C8 800B03C8 A583000C */  jal        DBG_Error
    /* A03CC 800B03CC 86000624 */   addiu     $a2, $zero, 0x86
  .L800B03D0:
    /* A03D0 800B03D0 1800BF8F */  lw         $ra, 0x18($sp)
    /* A03D4 800B03D4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* A03D8 800B03D8 0800E003 */  jr         $ra
    /* A03DC 800B03DC 00000000 */   nop
endlabel VID_OpenModule__Fv
