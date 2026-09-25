.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncMANASHIELD__FP13MissileStructiii, 0x60

glabel FuncMANASHIELD__FP13MissileStructiii
    /* 6D3AC 8007D3AC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6D3B0 8007D3B0 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6D3B4 8007D3B4 28008484 */  lh         $a0, 0x28($a0)
    /* 6D3B8 8007D3B8 40000224 */  addiu      $v0, $zero, 0x40
    /* 6D3BC 8007D3BC 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6D3C0 8007D3C0 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6D3C4 8007D3C4 80000224 */  addiu      $v0, $zero, 0x80
    /* 6D3C8 8007D3C8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6D3CC 8007D3CC 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6D3D0 8007D3D0 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6D3D4 8007D3D4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6D3D8 8007D3D8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6D3DC 8007D3DC 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6D3E0 8007D3E0 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6D3E4 8007D3E4 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6D3E8 8007D3E8 2120A400 */  addu       $a0, $a1, $a0
    /* 6D3EC 8007D3EC 1000C524 */  addiu      $a1, $a2, 0x10
    /* 6D3F0 8007D3F0 2130E000 */  addu       $a2, $a3, $zero
    /* 6D3F4 8007D3F4 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6D3F8 8007D3F8 0D000724 */   addiu     $a3, $zero, 0xD
    /* 6D3FC 8007D3FC 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6D400 8007D400 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6D404 8007D404 0800E003 */  jr         $ra
    /* 6D408 8007D408 00000000 */   nop
endlabel FuncMANASHIELD__FP13MissileStructiii
