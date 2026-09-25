.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching T_Pass3__Fv, 0x38C

glabel T_Pass3__Fv
    /* 649BC 800749BC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 649C0 800749C0 2800B2AF */  sw         $s2, 0x28($sp)
    /* 649C4 800749C4 21900000 */  addu       $s2, $zero, $zero
    /* 649C8 800749C8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 649CC 800749CC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 649D0 800749D0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 649D4 800749D4 2000B0AF */  sw         $s0, 0x20($sp)
  .L800749D8:
    /* 649D8 800749D8 21880000 */  addu       $s1, $zero, $zero
    /* 649DC 800749DC 01005326 */  addiu      $s3, $s2, 0x1
    /* 649E0 800749E0 21202002 */  addu       $a0, $s1, $zero
  .L800749E4:
    /* 649E4 800749E4 21284002 */  addu       $a1, $s2, $zero
    /* 649E8 800749E8 B30A020C */  jal        SetDPiece__Fiis
    /* 649EC 800749EC 21300000 */   addu      $a2, $zero, $zero
    /* 649F0 800749F0 01003026 */  addiu      $s0, $s1, 0x1
    /* 649F4 800749F4 21200002 */  addu       $a0, $s0, $zero
    /* 649F8 800749F8 21284002 */  addu       $a1, $s2, $zero
    /* 649FC 800749FC B30A020C */  jal        SetDPiece__Fiis
    /* 64A00 80074A00 21300000 */   addu      $a2, $zero, $zero
    /* 64A04 80074A04 21202002 */  addu       $a0, $s1, $zero
    /* 64A08 80074A08 21286002 */  addu       $a1, $s3, $zero
    /* 64A0C 80074A0C B30A020C */  jal        SetDPiece__Fiis
    /* 64A10 80074A10 21300000 */   addu      $a2, $zero, $zero
    /* 64A14 80074A14 21200002 */  addu       $a0, $s0, $zero
    /* 64A18 80074A18 21286002 */  addu       $a1, $s3, $zero
    /* 64A1C 80074A1C B30A020C */  jal        SetDPiece__Fiis
    /* 64A20 80074A20 21300000 */   addu      $a2, $zero, $zero
    /* 64A24 80074A24 02003126 */  addiu      $s1, $s1, 0x2
    /* 64A28 80074A28 7000222A */  slti       $v0, $s1, 0x70
    /* 64A2C 80074A2C EDFF4014 */  bnez       $v0, .L800749E4
    /* 64A30 80074A30 21202002 */   addu      $a0, $s1, $zero
    /* 64A34 80074A34 02005226 */  addiu      $s2, $s2, 0x2
    /* 64A38 80074A38 7000422A */  slti       $v0, $s2, 0x70
    /* 64A3C 80074A3C E6FF4014 */  bnez       $v0, .L800749D8
    /* 64A40 80074A40 21280000 */   addu      $a1, $zero, $zero
    /* 64A44 80074A44 0E80073C */  lui        $a3, %hi(dungeon)
    /* 64A48 80074A48 C440E724 */  addiu      $a3, $a3, %lo(dungeon)
  .L80074A4C:
    /* 64A4C 80074A4C 2800A228 */  slti       $v0, $a1, 0x28
    /* 64A50 80074A50 0B004010 */  beqz       $v0, .L80074A80
    /* 64A54 80074A54 40300500 */   sll       $a2, $a1, 1
    /* 64A58 80074A58 21200000 */  addu       $a0, $zero, $zero
    /* 64A5C 80074A5C 2118E000 */  addu       $v1, $a3, $zero
  .L80074A60:
    /* 64A60 80074A60 2110C300 */  addu       $v0, $a2, $v1
    /* 64A64 80074A64 000040A4 */  sh         $zero, 0x0($v0)
    /* 64A68 80074A68 01008424 */  addiu      $a0, $a0, 0x1
    /* 64A6C 80074A6C 28008228 */  slti       $v0, $a0, 0x28
    /* 64A70 80074A70 FBFF4014 */  bnez       $v0, .L80074A60
    /* 64A74 80074A74 60006324 */   addiu     $v1, $v1, 0x60
    /* 64A78 80074A78 93D20108 */  j          .L80074A4C
    /* 64A7C 80074A7C 0100A524 */   addiu     $a1, $a1, 0x1
  .L80074A80:
    /* 64A80 80074A80 1280043C */  lui        $a0, %hi(D_801188E0)
    /* 64A84 80074A84 E0888424 */  addiu      $a0, $a0, %lo(D_801188E0)
    /* 64A88 80074A88 7AE2000C */  jal        LoadMegaTiles__FPCc
    /* 64A8C 80074A8C 19001124 */   addiu     $s1, $zero, 0x19
    /* 64A90 80074A90 1280043C */  lui        $a0, %hi(D_801188EC)
    /* 64A94 80074A94 EC888424 */  addiu      $a0, $a0, %lo(D_801188EC)
    /* 64A98 80074A98 0D80023C */  lui        $v0, %hi(pMegaTiles)
    /* 64A9C 80074A9C ACEC4224 */  addiu      $v0, $v0, %lo(pMegaTiles)
    /* 64AA0 80074AA0 482182AF */  sw         $v0, %gp_rel(D_8011C8C8)($gp)
    /* 64AA4 80074AA4 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 64AA8 80074AA8 21280000 */   addu      $a1, $zero, $zero
    /* 64AAC 80074AAC 21984000 */  addu       $s3, $v0, $zero
    /* 64AB0 80074AB0 21286002 */  addu       $a1, $s3, $zero
    /* 64AB4 80074AB4 2E000624 */  addiu      $a2, $zero, 0x2E
    /* 64AB8 80074AB8 2E000724 */  addiu      $a3, $zero, 0x2E
    /* 64ABC 80074ABC 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64AC0 80074AC0 01001224 */  addiu      $s2, $zero, 0x1
    /* 64AC4 80074AC4 1000B1AF */  sw         $s1, 0x10($sp)
    /* 64AC8 80074AC8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 64ACC 80074ACC 8AD1010C */  jal        T_FillSector__FPUcT0iiiib
    /* 64AD0 80074AD0 1800B2AF */   sw        $s2, 0x18($sp)
    /* 64AD4 80074AD4 F7F6000C */  jal        mem_free_dbg__FPv
    /* 64AD8 80074AD8 21206002 */   addu      $a0, $s3, $zero
    /* 64ADC 80074ADC 1280043C */  lui        $a0, %hi(D_801188FC)
    /* 64AE0 80074AE0 FC888424 */  addiu      $a0, $a0, %lo(D_801188FC)
    /* 64AE4 80074AE4 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 64AE8 80074AE8 21280000 */   addu      $a1, $zero, $zero
    /* 64AEC 80074AEC 21984000 */  addu       $s3, $v0, $zero
    /* 64AF0 80074AF0 21286002 */  addu       $a1, $s3, $zero
    /* 64AF4 80074AF4 2E000624 */  addiu      $a2, $zero, 0x2E
    /* 64AF8 80074AF8 21380000 */  addu       $a3, $zero, $zero
    /* 64AFC 80074AFC 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64B00 80074B00 17001024 */  addiu      $s0, $zero, 0x17
    /* 64B04 80074B04 1000B1AF */  sw         $s1, 0x10($sp)
    /* 64B08 80074B08 1400B0AF */  sw         $s0, 0x14($sp)
    /* 64B0C 80074B0C 8AD1010C */  jal        T_FillSector__FPUcT0iiiib
    /* 64B10 80074B10 1800B2AF */   sw        $s2, 0x18($sp)
    /* 64B14 80074B14 F7F6000C */  jal        mem_free_dbg__FPv
    /* 64B18 80074B18 21206002 */   addu      $a0, $s3, $zero
    /* 64B1C 80074B1C 1280043C */  lui        $a0, %hi(D_8011890C)
    /* 64B20 80074B20 0C898424 */  addiu      $a0, $a0, %lo(D_8011890C)
    /* 64B24 80074B24 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 64B28 80074B28 21280000 */   addu      $a1, $zero, $zero
    /* 64B2C 80074B2C 21984000 */  addu       $s3, $v0, $zero
    /* 64B30 80074B30 21286002 */  addu       $a1, $s3, $zero
    /* 64B34 80074B34 21300000 */  addu       $a2, $zero, $zero
    /* 64B38 80074B38 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64B3C 80074B3C 2E000724 */  addiu      $a3, $zero, 0x2E
    /* 64B40 80074B40 1000B0AF */  sw         $s0, 0x10($sp)
    /* 64B44 80074B44 1400B1AF */  sw         $s1, 0x14($sp)
    /* 64B48 80074B48 8AD1010C */  jal        T_FillSector__FPUcT0iiiib
    /* 64B4C 80074B4C 1800B2AF */   sw        $s2, 0x18($sp)
    /* 64B50 80074B50 F7F6000C */  jal        mem_free_dbg__FPv
    /* 64B54 80074B54 21206002 */   addu      $a0, $s3, $zero
    /* 64B58 80074B58 1280043C */  lui        $a0, %hi(D_8011891C)
    /* 64B5C 80074B5C 1C898424 */  addiu      $a0, $a0, %lo(D_8011891C)
    /* 64B60 80074B60 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 64B64 80074B64 21280000 */   addu      $a1, $zero, $zero
    /* 64B68 80074B68 21984000 */  addu       $s3, $v0, $zero
    /* 64B6C 80074B6C 21286002 */  addu       $a1, $s3, $zero
    /* 64B70 80074B70 21300000 */  addu       $a2, $zero, $zero
    /* 64B74 80074B74 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64B78 80074B78 21380000 */  addu       $a3, $zero, $zero
    /* 64B7C 80074B7C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 64B80 80074B80 1400B0AF */  sw         $s0, 0x14($sp)
    /* 64B84 80074B84 8AD1010C */  jal        T_FillSector__FPUcT0iiiib
    /* 64B88 80074B88 1800B2AF */   sw        $s2, 0x18($sp)
    /* 64B8C 80074B8C F7F6000C */  jal        mem_free_dbg__FPv
    /* 64B90 80074B90 21206002 */   addu      $a0, $s3, $zero
    /* 64B94 80074B94 5FD2010C */  jal        TownFixupBodges__Fv
    /* 64B98 80074B98 00000000 */   nop
    /* 64B9C 80074B9C 1280033C */  lui        $v1, %hi(myplr)
    /* 64BA0 80074BA0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 64BA4 80074BA4 00000000 */  nop
    /* 64BA8 80074BA8 40100300 */  sll        $v0, $v1, 1
    /* 64BAC 80074BAC 21104300 */  addu       $v0, $v0, $v1
    /* 64BB0 80074BB0 80100200 */  sll        $v0, $v0, 2
    /* 64BB4 80074BB4 21104300 */  addu       $v0, $v0, $v1
    /* 64BB8 80074BB8 00110200 */  sll        $v0, $v0, 4
    /* 64BBC 80074BBC 23104300 */  subu       $v0, $v0, $v1
    /* 64BC0 80074BC0 80100200 */  sll        $v0, $v0, 2
    /* 64BC4 80074BC4 21104300 */  addu       $v0, $v0, $v1
    /* 64BC8 80074BC8 C0100200 */  sll        $v0, $v0, 3
    /* 64BCC 80074BCC 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 64BD0 80074BD0 21082200 */  addu       $at, $at, $v0
    /* 64BD4 80074BD4 18BF2290 */  lbu        $v0, %lo(plr + 0x19E0)($at)
    /* 64BD8 80074BD8 00000000 */  nop
    /* 64BDC 80074BDC 01004230 */  andi       $v0, $v0, 0x1
    /* 64BE0 80074BE0 05004014 */  bnez       $v0, .L80074BF8
    /* 64BE4 80074BE4 30000524 */   addiu     $a1, $zero, 0x30
    /* 64BE8 80074BE8 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64BEC 80074BEC 14000624 */  addiu      $a2, $zero, 0x14
    /* 64BF0 80074BF0 1BD2010C */  jal        T_FillTile__FPUciii
    /* 64BF4 80074BF4 40010724 */   addiu     $a3, $zero, 0x140
  .L80074BF8:
    /* 64BF8 80074BF8 1280023C */  lui        $v0, %hi(myplr)
    /* 64BFC 80074BFC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 64C00 80074C00 00000000 */  nop
    /* 64C04 80074C04 40180200 */  sll        $v1, $v0, 1
    /* 64C08 80074C08 21186200 */  addu       $v1, $v1, $v0
    /* 64C0C 80074C0C 80180300 */  sll        $v1, $v1, 2
    /* 64C10 80074C10 21186200 */  addu       $v1, $v1, $v0
    /* 64C14 80074C14 00190300 */  sll        $v1, $v1, 4
    /* 64C18 80074C18 23186200 */  subu       $v1, $v1, $v0
    /* 64C1C 80074C1C 80180300 */  sll        $v1, $v1, 2
    /* 64C20 80074C20 21186200 */  addu       $v1, $v1, $v0
    /* 64C24 80074C24 C0180300 */  sll        $v1, $v1, 3
    /* 64C28 80074C28 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 64C2C 80074C2C 21082300 */  addu       $at, $at, $v1
    /* 64C30 80074C30 18BF2290 */  lbu        $v0, %lo(plr + 0x19E0)($at)
    /* 64C34 80074C34 00000000 */  nop
    /* 64C38 80074C38 02004230 */  andi       $v0, $v0, 0x2
    /* 64C3C 80074C3C 0A004014 */  bnez       $v0, .L80074C68
    /* 64C40 80074C40 10000524 */   addiu     $a1, $zero, 0x10
    /* 64C44 80074C44 44000624 */  addiu      $a2, $zero, 0x44
    /* 64C48 80074C48 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64C4C 80074C4C 1BD2010C */  jal        T_FillTile__FPUciii
    /* 64C50 80074C50 4C010724 */   addiu     $a3, $zero, 0x14C
    /* 64C54 80074C54 10000524 */  addiu      $a1, $zero, 0x10
    /* 64C58 80074C58 46000624 */  addiu      $a2, $zero, 0x46
    /* 64C5C 80074C5C 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64C60 80074C60 1BD2010C */  jal        T_FillTile__FPUciii
    /* 64C64 80074C64 4B010724 */   addiu     $a3, $zero, 0x14B
  .L80074C68:
    /* 64C68 80074C68 1280023C */  lui        $v0, %hi(myplr)
    /* 64C6C 80074C6C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 64C70 80074C70 00000000 */  nop
    /* 64C74 80074C74 40180200 */  sll        $v1, $v0, 1
    /* 64C78 80074C78 21186200 */  addu       $v1, $v1, $v0
    /* 64C7C 80074C7C 80180300 */  sll        $v1, $v1, 2
    /* 64C80 80074C80 21186200 */  addu       $v1, $v1, $v0
    /* 64C84 80074C84 00190300 */  sll        $v1, $v1, 4
    /* 64C88 80074C88 23186200 */  subu       $v1, $v1, $v0
    /* 64C8C 80074C8C 80180300 */  sll        $v1, $v1, 2
    /* 64C90 80074C90 21186200 */  addu       $v1, $v1, $v0
    /* 64C94 80074C94 C0180300 */  sll        $v1, $v1, 3
    /* 64C98 80074C98 0E80013C */  lui        $at, %hi(plr + 0x19E0)
    /* 64C9C 80074C9C 21082300 */  addu       $at, $at, $v1
    /* 64CA0 80074CA0 18BF2290 */  lbu        $v0, %lo(plr + 0x19E0)($at)
    /* 64CA4 80074CA4 00000000 */  nop
    /* 64CA8 80074CA8 04004230 */  andi       $v0, $v0, 0x4
    /* 64CAC 80074CAC 0D004014 */  bnez       $v0, .L80074CE4
    /* 64CB0 80074CB0 00000000 */   nop
    /* 64CB4 80074CB4 24001124 */  addiu      $s1, $zero, 0x24
  .L80074CB8:
    /* 64CB8 80074CB8 C9F6000C */  jal        ENG_random__Fl
    /* 64CBC 80074CBC 04000424 */   addiu     $a0, $zero, 0x4
    /* 64CC0 80074CC0 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64CC4 80074CC4 21282002 */  addu       $a1, $s1, $zero
    /* 64CC8 80074CC8 4E000624 */  addiu      $a2, $zero, 0x4E
    /* 64CCC 80074CCC 01004724 */  addiu      $a3, $v0, 0x1
    /* 64CD0 80074CD0 1BD2010C */  jal        T_FillTile__FPUciii
    /* 64CD4 80074CD4 01003126 */   addiu     $s1, $s1, 0x1
    /* 64CD8 80074CD8 2E00222A */  slti       $v0, $s1, 0x2E
    /* 64CDC 80074CDC F6FF4014 */  bnez       $v0, .L80074CB8
    /* 64CE0 80074CE0 00000000 */   nop
  .L80074CE4:
    /* 64CE4 80074CE4 0E80033C */  lui        $v1, %hi(quests + 0x106)
    /* 64CE8 80074CE8 46DB6390 */  lbu        $v1, %lo(quests + 0x106)($v1)
    /* 64CEC 80074CEC 03000224 */  addiu      $v0, $zero, 0x3
    /* 64CF0 80074CF0 03006210 */  beq        $v1, $v0, .L80074D00
    /* 64CF4 80074CF4 00000000 */   nop
    /* 64CF8 80074CF8 06006014 */  bnez       $v1, .L80074D14
    /* 64CFC 80074CFC 3C000524 */   addiu     $a1, $zero, 0x3C
  .L80074D00:
    /* 64D00 80074D00 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64D04 80074D04 3C000524 */  addiu      $a1, $zero, 0x3C
    /* 64D08 80074D08 46000624 */  addiu      $a2, $zero, 0x46
    /* 64D0C 80074D0C 48D30108 */  j          .L80074D20
    /* 64D10 80074D10 47000724 */   addiu     $a3, $zero, 0x47
  .L80074D14:
    /* 64D14 80074D14 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 64D18 80074D18 46000624 */  addiu      $a2, $zero, 0x46
    /* 64D1C 80074D1C 56010724 */  addiu      $a3, $zero, 0x156
  .L80074D20:
    /* 64D20 80074D20 1BD2010C */  jal        T_FillTile__FPUciii
    /* 64D24 80074D24 00000000 */   nop
    /* 64D28 80074D28 3000BF8F */  lw         $ra, 0x30($sp)
    /* 64D2C 80074D2C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 64D30 80074D30 2800B28F */  lw         $s2, 0x28($sp)
    /* 64D34 80074D34 2400B18F */  lw         $s1, 0x24($sp)
    /* 64D38 80074D38 2000B08F */  lw         $s0, 0x20($sp)
    /* 64D3C 80074D3C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 64D40 80074D40 0800E003 */  jr         $ra
    /* 64D44 80074D44 00000000 */   nop
endlabel T_Pass3__Fv
