.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SYSI_Init__Fv, 0x148

glabel SYSI_Init__Fv
    /* A059C 800B059C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* A05A0 800B05A0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* A05A4 800B05A4 7043000C */  jal        SaveGP
    /* A05A8 800B05A8 1800B0AF */   sw        $s0, 0x18($sp)
    /* A05AC 800B05AC 34C1020C */  jal        MEM_SetupMem__Fv
    /* A05B0 800B05B0 40011024 */   addiu     $s0, $zero, 0x140
    /* A05B4 800B05B4 1321020C */  jal        InitTmalloc__Fv
    /* A05B8 800B05B8 00000000 */   nop
    /* A05BC 800B05BC C8C0020C */  jal        VID_OpenModule__Fv
    /* A05C0 800B05C0 00000000 */   nop
    /* A05C4 800B05C4 1000A427 */  addiu      $a0, $sp, 0x10
    /* A05C8 800B05C8 21280000 */  addu       $a1, $zero, $zero
    /* A05CC 800B05CC 21300000 */  addu       $a2, $zero, $zero
    /* A05D0 800B05D0 21380000 */  addu       $a3, $zero, $zero
    /* A05D4 800B05D4 00010224 */  addiu      $v0, $zero, 0x100
    /* A05D8 800B05D8 1000A0A7 */  sh         $zero, 0x10($sp)
    /* A05DC 800B05DC 1200A0A7 */  sh         $zero, 0x12($sp)
    /* A05E0 800B05E0 1400B0A7 */  sh         $s0, 0x14($sp)
    /* A05E4 800B05E4 FF4E000C */  jal        ClearImage
    /* A05E8 800B05E8 1600A2A7 */   sh        $v0, 0x16($sp)
    /* A05EC 800B05EC 1000A427 */  addiu      $a0, $sp, 0x10
    /* A05F0 800B05F0 21280000 */  addu       $a1, $zero, $zero
    /* A05F4 800B05F4 21300000 */  addu       $a2, $zero, $zero
    /* A05F8 800B05F8 21380000 */  addu       $a3, $zero, $zero
    /* A05FC 800B05FC FF4E000C */  jal        ClearImage
    /* A0600 800B0600 1000B0A7 */   sh        $s0, 0x10($sp)
    /* A0604 800B0604 1610020C */  jal        VID_ScrOn__Fv
    /* A0608 800B0608 00000000 */   nop
    /* A060C 800B060C 2311020C */  jal        SortOutFileSystem__Fv
    /* A0610 800B0610 00000000 */   nop
    /* A0614 800B0614 9F48000C */  jal        ResetCallback
    /* A0618 800B0618 00000000 */   nop
    /* A061C 800B061C E77F000C */  jal        TSK_OpenModule
    /* A0620 800B0620 01800434 */   ori       $a0, $zero, 0x8001
    /* A0624 800B0624 FF004230 */  andi       $v0, $v0, 0xFF
    /* A0628 800B0628 09004014 */  bnez       $v0, .L800B0650
    /* A062C 800B062C 00000000 */   nop
    /* A0630 800B0630 1180023C */  lui        $v0, %hi(D_80110018)
    /* A0634 800B0634 18004224 */  addiu      $v0, $v0, %lo(D_80110018)
    /* A0638 800B0638 05004010 */  beqz       $v0, .L800B0650
    /* A063C 800B063C 21200000 */   addu      $a0, $zero, $zero
    /* A0640 800B0640 1180053C */  lui        $a1, %hi(D_80110030)
    /* A0644 800B0644 3000A524 */  addiu      $a1, $a1, %lo(D_80110030)
    /* A0648 800B0648 A583000C */  jal        DBG_Error
    /* A064C 800B064C 83000624 */   addiu     $a2, $zero, 0x83
  .L800B0650:
    /* A0650 800B0650 CD82000C */  jal        TSK_SetExtraStackProtection
    /* A0654 800B0654 21200000 */   addu      $a0, $zero, $zero
    /* A0658 800B0658 2683000C */  jal        GU_InitModule
    /* A065C 800B065C 00000000 */   nop
    /* A0660 800B0660 D8C1020C */  jal        GM_Open__Fv
    /* A0664 800B0664 00000000 */   nop
    /* A0668 800B0668 B9C1020C */  jal        PA_Open__Fv
    /* A066C 800B066C 00000000 */   nop
    /* A0670 800B0670 C7C1020C */  jal        PAD_Open__Fv
    /* A0674 800B0674 00000000 */   nop
    /* A0678 800B0678 D692020C */  jal        PutUpCutScreen__Fi
    /* A067C 800B067C 0B000424 */   addiu     $a0, $zero, 0xB
    /* A0680 800B0680 6C03838F */  lw         $v1, %gp_rel(FileSYS)($gp)
    /* A0684 800B0684 02000224 */  addiu      $v0, $zero, 0x2
    /* A0688 800B0688 03006214 */  bne        $v1, $v0, .L800B0698
    /* A068C 800B068C 00000000 */   nop
    /* A0690 800B0690 731D020C */  jal        BL_LoadDirectory__Fv
    /* A0694 800B0694 00000000 */   nop
  .L800B0698:
    /* A0698 800B0698 216B020C */  jal        SCR_Open__Fv
    /* A069C 800B069C 00000000 */   nop
    /* A06A0 800B06A0 E9C1020C */  jal        DEC_Open__Fv
    /* A06A4 800B06A4 00000000 */   nop
    /* A06A8 800B06A8 E1C1020C */  jal        OVR_Open__Fv
    /* A06AC 800B06AC 00000000 */   nop
    /* A06B0 800B06B0 DD62020C */  jal        STR_Init__Fv
    /* A06B4 800B06B4 00000000 */   nop
    /* A06B8 800B06B8 9759000C */  jal        SpuInit
    /* A06BC 800B06BC 00000000 */   nop
    /* A06C0 800B06C0 8968020C */  jal        SPU_OnceOnlyInit__Fv
    /* A06C4 800B06C4 00000000 */   nop
    /* A06C8 800B06C8 4671020C */  jal        GLUE_Init__Fv
    /* A06CC 800B06CC 00000000 */   nop
    /* A06D0 800B06D0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* A06D4 800B06D4 1800B08F */  lw         $s0, 0x18($sp)
    /* A06D8 800B06D8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* A06DC 800B06DC 0800E003 */  jr         $ra
    /* A06E0 800B06E0 00000000 */   nop
endlabel SYSI_Init__Fv
