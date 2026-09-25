.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ATT_DoAttract__Fv, 0xC8

glabel ATT_DoAttract__Fv
    /* 7D274 8008D274 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 7D278 8008D278 3800BFAF */  sw         $ra, 0x38($sp)
    /* 7D27C 8008D27C FD22020C */  jal        PA_SetPauseOk__Fb
    /* 7D280 8008D280 21200000 */   addu      $a0, $zero, $zero
    /* 7D284 8008D284 9CEA040C */  jal        func_8013AA70
    /* 7D288 8008D288 1000A427 */   addiu     $a0, $sp, 0x10
    /* 7D28C 8008D28C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 7D290 8008D290 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 7D294 8008D294 00000000 */  nop
    /* 7D298 8008D298 08004010 */  beqz       $v0, .L8008D2BC
    /* 7D29C 8008D29C 00000000 */   nop
  .L8008D2A0:
    /* 7D2A0 8008D2A0 EE80000C */  jal        TSK_Sleep
    /* 7D2A4 8008D2A4 01000424 */   addiu     $a0, $zero, 0x1
    /* 7D2A8 8008D2A8 1280023C */  lui        $v0, %hi(FeFlag)
    /* 7D2AC 8008D2AC 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 7D2B0 8008D2B0 00000000 */  nop
    /* 7D2B4 8008D2B4 FAFF4014 */  bnez       $v0, .L8008D2A0
    /* 7D2B8 8008D2B8 00000000 */   nop
  .L8008D2BC:
    /* 7D2BC 8008D2BC 1280023C */  lui        $v0, %hi(DoLoadedGame)
    /* 7D2C0 8008D2C0 84B1428C */  lw         $v0, %lo(DoLoadedGame)($v0)
    /* 7D2C4 8008D2C4 00000000 */  nop
    /* 7D2C8 8008D2C8 18004014 */  bnez       $v0, .L8008D32C
    /* 7D2CC 8008D2CC 00000000 */   nop
    /* 7D2D0 8008D2D0 1D55020C */  jal        OVR_LoadGame__Fv
    /* 7D2D4 8008D2D4 00000000 */   nop
    /* 7D2D8 8008D2D8 1280023C */  lui        $v0, %hi(DoLoadedChar)
    /* 7D2DC 8008D2DC ECB9428C */  lw         $v0, %lo(DoLoadedChar)($v0)
    /* 7D2E0 8008D2E0 00000000 */  nop
    /* 7D2E4 8008D2E4 0F004010 */  beqz       $v0, .L8008D324
    /* 7D2E8 8008D2E8 00000000 */   nop
    /* 7D2EC 8008D2EC 1180043C */  lui        $a0, %hi(D_80110520)
    /* 7D2F0 8008D2F0 20058424 */  addiu      $a0, $a0, %lo(D_80110520)
    /* 7D2F4 8008D2F4 9367000C */  jal        printf
    /* 7D2F8 8008D2F8 00000000 */   nop
    /* 7D2FC 8008D2FC CB99020C */  jal        ClearLoadCharItems__Fv
    /* 7D300 8008D300 00000000 */   nop
    /* 7D304 8008D304 21200000 */  addu       $a0, $zero, $zero
    /* 7D308 8008D308 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 7D30C 8008D30C 21280000 */   addu      $a1, $zero, $zero
    /* 7D310 8008D310 01000424 */  addiu      $a0, $zero, 0x1
    /* 7D314 8008D314 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 7D318 8008D318 21280000 */   addu      $a1, $zero, $zero
    /* 7D31C 8008D31C 1280013C */  lui        $at, %hi(DoLoadedChar)
    /* 7D320 8008D320 ECB920AC */  sw         $zero, %lo(DoLoadedChar)($at)
  .L8008D324:
    /* 7D324 8008D324 D134020C */  jal        CreatePlayersFromFeData__FR9FE_CREATE
    /* 7D328 8008D328 1000A427 */   addiu     $a0, $sp, 0x10
  .L8008D32C:
    /* 7D32C 8008D32C 3800BF8F */  lw         $ra, 0x38($sp)
    /* 7D330 8008D330 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 7D334 8008D334 0800E003 */  jr         $ra
    /* 7D338 8008D338 00000000 */   nop
endlabel ATT_DoAttract__Fv
