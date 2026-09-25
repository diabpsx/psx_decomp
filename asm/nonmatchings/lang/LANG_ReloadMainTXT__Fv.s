.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LANG_ReloadMainTXT__Fv, 0x44

glabel LANG_ReloadMainTXT__Fv
    /* 6B5A4 8007B5A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B5A8 8007B5A8 01000224 */  addiu      $v0, $zero, 0x1
    /* 6B5AC 8007B5AC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6B5B0 8007B5B0 1280013C */  lui        $at, %hi(CDWAIT)
    /* 6B5B4 8007B5B4 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 6B5B8 8007B5B8 4AED010C */  jal        GetStr__Fi
    /* 6B5BC 8007B5BC 02030424 */   addiu     $a0, $zero, 0x302
    /* 6B5C0 8007B5C0 C6B5020C */  jal        IsKanjiLoaded__Fv
    /* 6B5C4 8007B5C4 00000000 */   nop
    /* 6B5C8 8007B5C8 03004010 */  beqz       $v0, .L8007B5D8
    /* 6B5CC 8007B5CC 00000000 */   nop
    /* 6B5D0 8007B5D0 1280013C */  lui        $at, %hi(CDWAIT)
    /* 6B5D4 8007B5D4 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
  .L8007B5D8:
    /* 6B5D8 8007B5D8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B5DC 8007B5DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B5E0 8007B5E0 0800E003 */  jr         $ra
    /* 6B5E4 8007B5E4 00000000 */   nop
endlabel LANG_ReloadMainTXT__Fv
