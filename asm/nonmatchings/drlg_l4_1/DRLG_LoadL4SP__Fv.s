.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_LoadL4SP__Fv, 0xA4

glabel DRLG_LoadL4SP__Fv
    /* 15A28 8014F620 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 15A2C 8014F624 1000BFAF */  sw         $ra, 0x10($sp)
    /* 15A30 8014F628 1280013C */  lui        $at, %hi(setloadflag)
    /* 15A34 8014F62C F4C020A0 */  sb         $zero, %lo(setloadflag)($at)
    /* 15A38 8014F630 DC9E010C */  jal        QuestStatus__Fi
    /* 15A3C 8014F634 0B000424 */   addiu     $a0, $zero, 0xB
    /* 15A40 8014F638 FF004230 */  andi       $v0, $v0, 0xFF
    /* 15A44 8014F63C 0A004010 */  beqz       $v0, .L8014F668
    /* 15A48 8014F640 00000000 */   nop
    /* 15A4C 8014F644 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x10)
    /* 15A50 8014F648 08D88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x10)
    /* 15A54 8014F64C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 15A58 8014F650 21280000 */   addu      $a1, $zero, $zero
    /* 15A5C 8014F654 1280013C */  lui        $at, %hi(pSetPiece)
    /* 15A60 8014F658 DCC022AC */  sw         $v0, %lo(pSetPiece)($at)
    /* 15A64 8014F65C 01000224 */  addiu      $v0, $zero, 0x1
    /* 15A68 8014F660 1280013C */  lui        $at, %hi(setloadflag)
    /* 15A6C 8014F664 F4C022A0 */  sb         $v0, %lo(setloadflag)($at)
  .L8014F668:
    /* 15A70 8014F668 1280033C */  lui        $v1, %hi(currlevel)
    /* 15A74 8014F66C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 15A78 8014F670 0F000224 */  addiu      $v0, $zero, 0xF
    /* 15A7C 8014F674 0F006214 */  bne        $v1, $v0, .L8014F6B4
    /* 15A80 8014F678 01000224 */   addiu     $v0, $zero, 0x1
    /* 15A84 8014F67C 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 15A88 8014F680 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 15A8C 8014F684 00000000 */  nop
    /* 15A90 8014F688 0A006210 */  beq        $v1, $v0, .L8014F6B4
    /* 15A94 8014F68C 00000000 */   nop
    /* 15A98 8014F690 1580043C */  lui        $a0, %hi(func_8014D7F8 + 0x1C)
    /* 15A9C 8014F694 14D88424 */  addiu      $a0, $a0, %lo(func_8014D7F8 + 0x1C)
    /* 15AA0 8014F698 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 15AA4 8014F69C 21280000 */   addu      $a1, $zero, $zero
    /* 15AA8 8014F6A0 1280013C */  lui        $at, %hi(pSetPiece)
    /* 15AAC 8014F6A4 DCC022AC */  sw         $v0, %lo(pSetPiece)($at)
    /* 15AB0 8014F6A8 01000224 */  addiu      $v0, $zero, 0x1
    /* 15AB4 8014F6AC 1280013C */  lui        $at, %hi(setloadflag)
    /* 15AB8 8014F6B0 F4C022A0 */  sb         $v0, %lo(setloadflag)($at)
  .L8014F6B4:
    /* 15ABC 8014F6B4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 15AC0 8014F6B8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 15AC4 8014F6BC 0800E003 */  jr         $ra
    /* 15AC8 8014F6C0 00000000 */   nop
endlabel DRLG_LoadL4SP__Fv
