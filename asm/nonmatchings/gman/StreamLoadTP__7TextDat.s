.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StreamLoadTP__7TextDat, 0xB8

glabel StreamLoadTP__7TextDat
    /* 82218 80092218 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8221C 8009221C 3000B0AF */  sw         $s0, 0x30($sp)
    /* 82220 80092220 21808000 */  addu       $s0, $a0, $zero
    /* 82224 80092224 3400BFAF */  sw         $ra, 0x34($sp)
    /* 82228 80092228 4800048E */  lw         $a0, 0x48($s0)
    /* 8222C 8009222C E254020C */  jal        GetName__C13CTextFileInfo
    /* 82230 80092230 00000000 */   nop
    /* 82234 80092234 1800A427 */  addiu      $a0, $sp, 0x18
    /* 82238 80092238 F240000C */  jal        strcpy
    /* 8223C 8009223C 21284000 */   addu      $a1, $v0, $zero
    /* 82240 80092240 1280053C */  lui        $a1, %hi(D_8011ACEC)
    /* 82244 80092244 ECACA524 */  addiu      $a1, $a1, %lo(D_8011ACEC)
    /* 82248 80092248 FC40000C */  jal        strcat
    /* 8224C 8009224C 1800A427 */   addiu     $a0, $sp, 0x18
    /* 82250 80092250 1D11020C */  jal        SYSI_GetFs__Fv
    /* 82254 80092254 00000000 */   nop
    /* 82258 80092258 21204000 */  addu       $a0, $v0, $zero
    /* 8225C 8009225C 1800A527 */  addiu      $a1, $sp, 0x18
    /* 82260 80092260 2800028E */  lw         $v0, 0x28($s0)
    /* 82264 80092264 2800038E */  lw         $v1, 0x28($s0)
    /* 82268 80092268 2800068E */  lw         $a2, 0x28($s0)
    /* 8226C 8009226C 1400638C */  lw         $v1, 0x14($v1)
    /* 82270 80092270 24004290 */  lbu        $v0, 0x24($v0)
    /* 82274 80092274 0F006330 */  andi       $v1, $v1, 0xF
    /* 82278 80092278 9C0582AF */  sw         $v0, %gp_rel(TpW)($gp)
    /* 8227C 8009227C 2800028E */  lw         $v0, 0x28($s0)
    /* 82280 80092280 80190300 */  sll        $v1, $v1, 6
    /* 82284 80092284 25004790 */  lbu        $a3, 0x25($v0)
    /* 82288 80092288 1400C28C */  lw         $v0, 0x14($a2)
    /* 8228C 8009228C 00800634 */  ori        $a2, $zero, 0x8000
    /* 82290 80092290 A40583AF */  sw         $v1, %gp_rel(TpXDest)($gp)
    /* 82294 80092294 1000A0AF */  sw         $zero, 0x10($sp)
    /* 82298 80092298 02110200 */  srl        $v0, $v0, 4
    /* 8229C 8009229C 00120200 */  sll        $v0, $v0, 8
    /* 822A0 800922A0 A80582AF */  sw         $v0, %gp_rel(TpYDest)($gp)
    /* 822A4 800922A4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 822A8 800922A8 A00587AF */  sw         $a3, %gp_rel(TpH)($gp)
    /* 822AC 800922AC 0980073C */  lui        $a3, %hi(TpLoadCallBack__FPUciib)
    /* 822B0 800922B0 7021E724 */  addiu      $a3, $a3, %lo(TpLoadCallBack__FPUciib)
    /* 822B4 800922B4 C516020C */  jal        StreamFile__6FileIOPCciPFPUciib_bii
    /* 822B8 800922B8 1400A2AF */   sw        $v0, 0x14($sp)
    /* 822BC 800922BC 3400BF8F */  lw         $ra, 0x34($sp)
    /* 822C0 800922C0 3000B08F */  lw         $s0, 0x30($sp)
    /* 822C4 800922C4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 822C8 800922C8 0800E003 */  jr         $ra
    /* 822CC 800922CC 00000000 */   nop
endlabel StreamLoadTP__7TextDat
