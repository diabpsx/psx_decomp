.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_Flush__Fv, 0x230

glabel PRIM_Flush__Fv
    /* 73B5C 80083B5C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 73B60 80083B60 1800BFAF */  sw         $ra, 0x18($sp)
    /* 73B64 80083B64 1400B1AF */  sw         $s1, 0x14($sp)
    /* 73B68 80083B68 285A020C */  jal        PROF_CpuEnd__Fv
    /* 73B6C 80083B6C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 73B70 80083B70 9D1E8393 */  lbu        $v1, %gp_rel(D_8011C61D)($gp)
    /* 73B74 80083B74 00000000 */  nop
    /* 73B78 80083B78 C0100300 */  sll        $v0, $v1, 3
    /* 73B7C 80083B7C 23104300 */  subu       $v0, $v0, $v1
    /* 73B80 80083B80 8C1E838F */  lw         $v1, %gp_rel(D_8011C60C)($gp)
    /* 73B84 80083B84 80100200 */  sll        $v0, $v0, 2
    /* 73B88 80083B88 21184300 */  addu       $v1, $v0, $v1
  .L80083B8C:
    /* 73B8C 80083B8C 0C006290 */  lbu        $v0, 0xC($v1)
    /* 73B90 80083B90 00000000 */  nop
    /* 73B94 80083B94 FDFF4014 */  bnez       $v0, .L80083B8C
    /* 73B98 80083B98 00000000 */   nop
    /* 73B9C 80083B9C 465A020C */  jal        PROF_DrawEnd__Fv
    /* 73BA0 80083BA0 00000000 */   nop
    /* 73BA4 80083BA4 A41E848F */  lw         $a0, %gp_rel(D_8011C624)($gp)
    /* 73BA8 80083BA8 3403828F */  lw         $v0, %gp_rel(ThisOt)($gp)
    /* 73BAC 80083BAC 80200400 */  sll        $a0, $a0, 2
    /* 73BB0 80083BB0 FCFF8424 */  addiu      $a0, $a0, -0x4
    /* 73BB4 80083BB4 525A020C */  jal        PROF_Draw__FPUl
    /* 73BB8 80083BB8 21204400 */   addu      $a0, $v0, $a0
    /* 73BBC 80083BBC 921E8393 */  lbu        $v1, %gp_rel(D_8011C612)($gp)
    /* 73BC0 80083BC0 0880043C */  lui        $a0, %hi(SendDispEnv__Fv)
    /* 73BC4 80083BC4 003E8424 */  addiu      $a0, $a0, %lo(SendDispEnv__Fv)
    /* 73BC8 80083BC8 C0100300 */  sll        $v0, $v1, 3
    /* 73BCC 80083BCC 23104300 */  subu       $v0, $v0, $v1
    /* 73BD0 80083BD0 941E838F */  lw         $v1, %gp_rel(D_8011C614)($gp)
    /* 73BD4 80083BD4 00110200 */  sll        $v0, $v0, 4
    /* 73BD8 80083BD8 21186200 */  addu       $v1, $v1, $v0
    /* 73BDC 80083BDC 5C006324 */  addiu      $v1, $v1, 0x5C
    /* 73BE0 80083BE0 A01E83AF */  sw         $v1, %gp_rel(D_8011C620)($gp)
    /* 73BE4 80083BE4 2510020C */  jal        VID_DoThisNextSync__FPFv_v
    /* 73BE8 80083BE8 00000000 */   nop
    /* 73BEC 80083BEC FC0C020C */  jal        GPUQ_FlushQ__Fv
    /* 73BF0 80083BF0 00000000 */   nop
  .L80083BF4:
    /* 73BF4 80083BF4 3B10020C */  jal        VID_NextSyncRoutHasExecuted__Fv
    /* 73BF8 80083BF8 00000000 */   nop
    /* 73BFC 80083BFC FF004230 */  andi       $v0, $v0, 0xFF
    /* 73C00 80083C00 FCFF4010 */  beqz       $v0, .L80083BF4
    /* 73C04 80083C04 00000000 */   nop
    /* 73C08 80083C08 9C1E8393 */  lbu        $v1, %gp_rel(D_8011C61C)($gp)
    /* 73C0C 80083C0C 00000000 */  nop
    /* 73C10 80083C10 C0100300 */  sll        $v0, $v1, 3
    /* 73C14 80083C14 23104300 */  subu       $v0, $v0, $v1
    /* 73C18 80083C18 8C1E838F */  lw         $v1, %gp_rel(D_8011C60C)($gp)
    /* 73C1C 80083C1C 80100200 */  sll        $v0, $v0, 2
    /* 73C20 80083C20 21886200 */  addu       $s1, $v1, $v0
    /* 73C24 80083C24 21202002 */  addu       $a0, $s1, $zero
    /* 73C28 80083C28 01000224 */  addiu      $v0, $zero, 0x1
    /* 73C2C 80083C2C 0C0022A2 */  sb         $v0, 0xC($s1)
    /* 73C30 80083C30 660F020C */  jal        ClearPbOnDrawSync
    /* 73C34 80083C34 00000000 */   nop
    /* 73C38 80083C38 9C1E8293 */  lbu        $v0, %gp_rel(D_8011C61C)($gp)
    /* 73C3C 80083C3C 1280033C */  lui        $v1, %hi(CDWAIT)
    /* 73C40 80083C40 ECAD638C */  lw         $v1, %lo(CDWAIT)($v1)
    /* 73C44 80083C44 9D1E82A3 */  sb         $v0, %gp_rel(D_8011C61D)($gp)
    /* 73C48 80083C48 1C006014 */  bnez       $v1, .L80083CBC
    /* 73C4C 80083C4C 00000000 */   nop
    /* 73C50 80083C50 6110020C */  jal        VID_IsDbuffer__Fv
    /* 73C54 80083C54 00000000 */   nop
    /* 73C58 80083C58 01005038 */  xori       $s0, $v0, 0x1
    /* 73C5C 80083C5C 0100102E */  sltiu      $s0, $s0, 0x1
    /* 73C60 80083C60 23801000 */  negu       $s0, $s0
    /* 73C64 80083C64 5B10020C */  jal        VID_GetXOff__Fv
    /* 73C68 80083C68 40011032 */   andi      $s0, $s0, 0x140
    /* 73C6C 80083C6C 941E838F */  lw         $v1, %gp_rel(D_8011C614)($gp)
    /* 73C70 80083C70 5E10020C */  jal        VID_GetYOff__Fv
    /* 73C74 80083C74 080062A4 */   sh        $v0, 0x8($v1)
    /* 73C78 80083C78 941E838F */  lw         $v1, %gp_rel(D_8011C614)($gp)
    /* 73C7C 80083C7C 5B10020C */  jal        VID_GetXOff__Fv
    /* 73C80 80083C80 0A0062A4 */   sh        $v0, 0xA($v1)
    /* 73C84 80083C84 941E838F */  lw         $v1, %gp_rel(D_8011C614)($gp)
    /* 73C88 80083C88 21105000 */  addu       $v0, $v0, $s0
    /* 73C8C 80083C8C 5E10020C */  jal        VID_GetYOff__Fv
    /* 73C90 80083C90 780062A4 */   sh        $v0, 0x78($v1)
    /* 73C94 80083C94 941E858F */  lw         $a1, %gp_rel(D_8011C614)($gp)
    /* 73C98 80083C98 00000000 */  nop
    /* 73C9C 80083C9C 1C00A424 */  addiu      $a0, $a1, 0x1C
    /* 73CA0 80083CA0 3752000C */  jal        SetDrawEnv
    /* 73CA4 80083CA4 7A00A2A4 */   sh        $v0, 0x7A($a1)
    /* 73CA8 80083CA8 941E858F */  lw         $a1, %gp_rel(D_8011C614)($gp)
    /* 73CAC 80083CAC 00000000 */  nop
    /* 73CB0 80083CB0 8C00A424 */  addiu      $a0, $a1, 0x8C
    /* 73CB4 80083CB4 3752000C */  jal        SetDrawEnv
    /* 73CB8 80083CB8 7000A524 */   addiu     $a1, $a1, 0x70
  .L80083CBC:
    /* 73CBC 80083CBC 921E8393 */  lbu        $v1, %gp_rel(D_8011C612)($gp)
    /* 73CC0 80083CC0 3403848F */  lw         $a0, %gp_rel(ThisOt)($gp)
    /* 73CC4 80083CC4 941E858F */  lw         $a1, %gp_rel(D_8011C614)($gp)
    /* 73CC8 80083CC8 C0100300 */  sll        $v0, $v1, 3
    /* 73CCC 80083CCC 23104300 */  subu       $v0, $v0, $v1
    /* 73CD0 80083CD0 00110200 */  sll        $v0, $v0, 4
    /* 73CD4 80083CD4 2128A200 */  addu       $a1, $a1, $v0
    /* 73CD8 80083CD8 524C000C */  jal        AddPrim
    /* 73CDC 80083CDC 1C00A524 */   addiu     $a1, $a1, 0x1C
    /* 73CE0 80083CE0 0800248E */  lw         $a0, 0x8($s1)
    /* 73CE4 80083CE4 1B50000C */  jal        DrawOTag
    /* 73CE8 80083CE8 00000000 */   nop
    /* 73CEC 80083CEC CF5A020C */  jal        PROF_Restart__Fv
    /* 73CF0 80083CF0 00000000 */   nop
    /* 73CF4 80083CF4 3D5A020C */  jal        PROF_DrawStart__Fv
    /* 73CF8 80083CF8 00000000 */   nop
    /* 73CFC 80083CFC 9C1E8293 */  lbu        $v0, %gp_rel(D_8011C61C)($gp)
    /* 73D00 80083D00 901E8393 */  lbu        $v1, %gp_rel(D_8011C610)($gp)
    /* 73D04 80083D04 01004224 */  addiu      $v0, $v0, 0x1
    /* 73D08 80083D08 1A004300 */  div        $zero, $v0, $v1
    /* 73D0C 80083D0C 10200000 */  mfhi       $a0
    /* 73D10 80083D10 8C1E838F */  lw         $v1, %gp_rel(D_8011C60C)($gp)
    /* 73D14 80083D14 C0100400 */  sll        $v0, $a0, 3
    /* 73D18 80083D18 23104400 */  subu       $v0, $v0, $a0
    /* 73D1C 80083D1C 80100200 */  sll        $v0, $v0, 2
    /* 73D20 80083D20 21886200 */  addu       $s1, $v1, $v0
    /* 73D24 80083D24 9C1E84A3 */  sb         $a0, %gp_rel(D_8011C61C)($gp)
  .L80083D28:
    /* 73D28 80083D28 0C002292 */  lbu        $v0, 0xC($s1)
    /* 73D2C 80083D2C 00000000 */  nop
    /* 73D30 80083D30 FDFF4014 */  bnez       $v0, .L80083D28
    /* 73D34 80083D34 00000000 */   nop
    /* 73D38 80083D38 0800248E */  lw         $a0, 0x8($s1)
    /* 73D3C 80083D3C 1000258E */  lw         $a1, 0x10($s1)
    /* 73D40 80083D40 A74F000C */  jal        ClearOTag
    /* 73D44 80083D44 00000000 */   nop
    /* 73D48 80083D48 0800238E */  lw         $v1, 0x8($s1)
    /* 73D4C 80083D4C 0000248E */  lw         $a0, 0x0($s1)
    /* 73D50 80083D50 921E8293 */  lbu        $v0, %gp_rel(D_8011C612)($gp)
    /* 73D54 80083D54 0400258E */  lw         $a1, 0x4($s1)
    /* 73D58 80083D58 01004238 */  xori       $v0, $v0, 0x1
    /* 73D5C 80083D5C 340383AF */  sw         $v1, %gp_rel(ThisOt)($gp)
    /* 73D60 80083D60 380384AF */  sw         $a0, %gp_rel(ThisPrimAddr)($gp)
    /* 73D64 80083D64 3C0385AF */  sw         $a1, %gp_rel(AddrToAvoid)($gp)
    /* 73D68 80083D68 921E82A3 */  sb         $v0, %gp_rel(D_8011C612)($gp)
    /* 73D6C 80083D6C 345A020C */  jal        PROF_CpuStart__Fv
    /* 73D70 80083D70 00000000 */   nop
    /* 73D74 80083D74 1800BF8F */  lw         $ra, 0x18($sp)
    /* 73D78 80083D78 1400B18F */  lw         $s1, 0x14($sp)
    /* 73D7C 80083D7C 1000B08F */  lw         $s0, 0x10($sp)
    /* 73D80 80083D80 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 73D84 80083D84 0800E003 */  jr         $ra
    /* 73D88 80083D88 00000000 */   nop
endlabel PRIM_Flush__Fv
