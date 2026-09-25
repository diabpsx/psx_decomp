.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeControlPan__Fv, 0x110

glabel FreeControlPan__Fv
    /* 22948 80032948 5C0F848F */  lw         $a0, %gp_rel(pManaBuff)($gp)
    /* 2294C 8003294C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22950 80032950 1000BFAF */  sw         $ra, 0x10($sp)
    /* 22954 80032954 5C0F80AF */  sw         $zero, %gp_rel(pManaBuff)($gp)
    /* 22958 80032958 F7F6000C */  jal        mem_free_dbg__FPv
    /* 2295C 8003295C 00000000 */   nop
    /* 22960 80032960 600F848F */  lw         $a0, %gp_rel(pLifeBuff)($gp)
    /* 22964 80032964 600F80AF */  sw         $zero, %gp_rel(pLifeBuff)($gp)
    /* 22968 80032968 F7F6000C */  jal        mem_free_dbg__FPv
    /* 2296C 8003296C 00000000 */   nop
    /* 22970 80032970 580F848F */  lw         $a0, %gp_rel(pPanelText)($gp)
    /* 22974 80032974 580F80AF */  sw         $zero, %gp_rel(pPanelText)($gp)
    /* 22978 80032978 F7F6000C */  jal        mem_free_dbg__FPv
    /* 2297C 8003297C 00000000 */   nop
    /* 22980 80032980 640F848F */  lw         $a0, %gp_rel(pChrPanel)($gp)
    /* 22984 80032984 640F80AF */  sw         $zero, %gp_rel(pChrPanel)($gp)
    /* 22988 80032988 F7F6000C */  jal        mem_free_dbg__FPv
    /* 2298C 8003298C 00000000 */   nop
    /* 22990 80032990 6C0F848F */  lw         $a0, %gp_rel(pSpellCels)($gp)
    /* 22994 80032994 6C0F80AF */  sw         $zero, %gp_rel(pSpellCels)($gp)
    /* 22998 80032998 F7F6000C */  jal        mem_free_dbg__FPv
    /* 2299C 8003299C 00000000 */   nop
    /* 229A0 800329A0 540F848F */  lw         $a0, %gp_rel(pPanelButtons)($gp)
    /* 229A4 800329A4 540F80AF */  sw         $zero, %gp_rel(pPanelButtons)($gp)
    /* 229A8 800329A8 F7F6000C */  jal        mem_free_dbg__FPv
    /* 229AC 800329AC 00000000 */   nop
    /* 229B0 800329B0 2020848F */  lw         $a0, %gp_rel(D_8011C7A0)($gp)
    /* 229B4 800329B4 202080AF */  sw         $zero, %gp_rel(D_8011C7A0)($gp)
    /* 229B8 800329B8 F7F6000C */  jal        mem_free_dbg__FPv
    /* 229BC 800329BC 00000000 */   nop
    /* 229C0 800329C0 2420848F */  lw         $a0, %gp_rel(D_8011C7A4)($gp)
    /* 229C4 800329C4 242080AF */  sw         $zero, %gp_rel(D_8011C7A4)($gp)
    /* 229C8 800329C8 F7F6000C */  jal        mem_free_dbg__FPv
    /* 229CC 800329CC 00000000 */   nop
    /* 229D0 800329D0 680F848F */  lw         $a0, %gp_rel(pChrButtons)($gp)
    /* 229D4 800329D4 680F80AF */  sw         $zero, %gp_rel(pChrButtons)($gp)
    /* 229D8 800329D8 F7F6000C */  jal        mem_free_dbg__FPv
    /* 229DC 800329DC 00000000 */   nop
    /* 229E0 800329E0 800F848F */  lw         $a0, %gp_rel(pDurIcons)($gp)
    /* 229E4 800329E4 800F80AF */  sw         $zero, %gp_rel(pDurIcons)($gp)
    /* 229E8 800329E8 F7F6000C */  jal        mem_free_dbg__FPv
    /* 229EC 800329EC 00000000 */   nop
    /* 229F0 800329F0 1280043C */  lui        $a0, %hi(pQLogCel)
    /* 229F4 800329F4 50BA848C */  lw         $a0, %lo(pQLogCel)($a0)
    /* 229F8 800329F8 1280013C */  lui        $at, %hi(pQLogCel)
    /* 229FC 800329FC 50BA20AC */  sw         $zero, %lo(pQLogCel)($at)
    /* 22A00 80032A00 F7F6000C */  jal        mem_free_dbg__FPv
    /* 22A04 80032A04 00000000 */   nop
    /* 22A08 80032A08 880F848F */  lw         $a0, %gp_rel(pSpellBkCel)($gp)
    /* 22A0C 80032A0C 880F80AF */  sw         $zero, %gp_rel(pSpellBkCel)($gp)
    /* 22A10 80032A10 F7F6000C */  jal        mem_free_dbg__FPv
    /* 22A14 80032A14 00000000 */   nop
    /* 22A18 80032A18 8C0F848F */  lw         $a0, %gp_rel(pSBkBtnCel)($gp)
    /* 22A1C 80032A1C 8C0F80AF */  sw         $zero, %gp_rel(pSBkBtnCel)($gp)
    /* 22A20 80032A20 F7F6000C */  jal        mem_free_dbg__FPv
    /* 22A24 80032A24 00000000 */   nop
    /* 22A28 80032A28 900F848F */  lw         $a0, %gp_rel(pSBkIconCels)($gp)
    /* 22A2C 80032A2C 900F80AF */  sw         $zero, %gp_rel(pSBkIconCels)($gp)
    /* 22A30 80032A30 F7F6000C */  jal        mem_free_dbg__FPv
    /* 22A34 80032A34 00000000 */   nop
    /* 22A38 80032A38 300F848F */  lw         $a0, %gp_rel(pGBoxBuff)($gp)
    /* 22A3C 80032A3C 300F80AF */  sw         $zero, %gp_rel(pGBoxBuff)($gp)
    /* 22A40 80032A40 F7F6000C */  jal        mem_free_dbg__FPv
    /* 22A44 80032A44 00000000 */   nop
    /* 22A48 80032A48 1000BF8F */  lw         $ra, 0x10($sp)
    /* 22A4C 80032A4C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22A50 80032A50 0800E003 */  jr         $ra
    /* 22A54 80032A54 00000000 */   nop
endlabel FreeControlPan__Fv
