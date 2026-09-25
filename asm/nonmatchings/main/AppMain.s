.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AppMain, 0xC4

glabel AppMain
    /* 73160 80083160 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 73164 80083164 1000BFAF */  sw         $ra, 0x10($sp)
    /* 73168 80083168 4A0C020C */  jal        Remove96__Fv
    /* 7316C 8008316C 00000000 */   nop
    /* 73170 80083170 67C1020C */  jal        SYSI_Init__Fv
    /* 73174 80083174 00000000 */   nop
    /* 73178 80083178 A809020C */  jal        VER_InitVersion__Fv
    /* 7317C 8008317C 00000000 */   nop
    /* 73180 80083180 3F27020C */  jal        InitPrinty__Fv
    /* 73184 80083184 00000000 */   nop
    /* 73188 80083188 C92E020C */  jal        InitDialog__Fv
    /* 7318C 8008318C 00000000 */   nop
    /* 73190 80083190 7AED010C */  jal        LANG_SetLang__F9LANG_TYPE
    /* 73194 80083194 04000424 */   addiu     $a0, $zero, 0x4
    /* 73198 80083198 1280033C */  lui        $v1, %hi(FileSYS)
    /* 7319C 8008319C ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 731A0 800831A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 731A4 800831A4 03006210 */  beq        $v1, $v0, .L800831B4
    /* 731A8 800831A8 00000000 */   nop
    /* 731AC 800831AC BD1D020C */  jal        BL_LoadStreamDir__Fv
    /* 731B0 800831B0 00000000 */   nop
  .L800831B4:
    /* 731B4 800831B4 76B5020C */  jal        LoadKanji__F10LANG_DB_NO
    /* 731B8 800831B8 21200000 */   addu      $a0, $zero, $zero
    /* 731BC 800831BC C2B5020C */  jal        SetKanjiLoaded__Fb
    /* 731C0 800831C0 01000424 */   addiu     $a0, $zero, 0x1
    /* 731C4 800831C4 94EB010C */  jal        Init_GamePad__Fv
    /* 731C8 800831C8 00000000 */   nop
    /* 731CC 800831CC 1355020C */  jal        OVR_LoadFrontend__Fv
    /* 731D0 800831D0 00000000 */   nop
    /* 731D4 800831D4 01000224 */  addiu      $v0, $zero, 0x1
    /* 731D8 800831D8 1280013C */  lui        $at, %hi(ADirtyFlagThatGaryWillLove)
    /* 731DC 800831DC 5ABE22A0 */  sb         $v0, %lo(ADirtyFlagThatGaryWillLove)($at)
    /* 731E0 800831E0 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 731E4 800831E4 04000424 */   addiu     $a0, $zero, 0x4
    /* 731E8 800831E8 00400424 */  addiu      $a0, $zero, 0x4000
    /* 731EC 800831EC 0880053C */  lui        $a1, %hi(GameTask__FP4TASK)
    /* 731F0 800831F0 5032A524 */  addiu      $a1, $a1, %lo(GameTask__FP4TASK)
    /* 731F4 800831F4 00500624 */  addiu      $a2, $zero, 0x5000
    /* 731F8 800831F8 0480000C */  jal        TSK_AddTask
    /* 731FC 800831FC 21380000 */   addu      $a3, $zero, $zero
    /* 73200 80083200 841E82AF */  sw         $v0, %gp_rel(D_8011C604)($gp)
  .L80083204:
    /* 73204 80083204 D70C020C */  jal        MAIN_MainLoop__Fv
    /* 73208 80083208 00000000 */   nop
    /* 7320C 8008320C 810C0208 */  j          .L80083204
    /* 73210 80083210 00000000 */   nop
    /* 73214 80083214 1000BF8F */  lw         $ra, 0x10($sp)
    /* 73218 80083218 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7321C 8008321C 0800E003 */  jr         $ra
    /* 73220 80083220 00000000 */   nop
endlabel AppMain
