.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_LoadL2SP__Fv, 0xA0

glabel DRLG_LoadL2SP__Fv
    /* A294 80143E8C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A298 80143E90 1000BFAF */  sw         $ra, 0x10($sp)
    /* A29C 80143E94 1280013C */  lui        $at, %hi(setloadflag)
    /* A2A0 80143E98 F4C020A0 */  sb         $zero, %lo(setloadflag)($at)
    /* A2A4 80143E9C DC9E010C */  jal        QuestStatus__Fi
    /* A2A8 80143EA0 08000424 */   addiu     $a0, $zero, 0x8
    /* A2AC 80143EA4 FF004230 */  andi       $v0, $v0, 0xFF
    /* A2B0 80143EA8 05004010 */  beqz       $v0, .L80143EC0
    /* A2B4 80143EAC 00000000 */   nop
    /* A2B8 80143EB0 1480043C */  lui        $a0, %hi(func_8014274C)
    /* A2BC 80143EB4 4C278424 */  addiu      $a0, $a0, %lo(func_8014274C)
    /* A2C0 80143EB8 C00F0508 */  j          .L80143F00
    /* A2C4 80143EBC 00000000 */   nop
  .L80143EC0:
    /* A2C8 80143EC0 DC9E010C */  jal        QuestStatus__Fi
    /* A2CC 80143EC4 09000424 */   addiu     $a0, $zero, 0x9
    /* A2D0 80143EC8 FF004230 */  andi       $v0, $v0, 0xFF
    /* A2D4 80143ECC 05004010 */  beqz       $v0, .L80143EE4
    /* A2D8 80143ED0 00000000 */   nop
    /* A2DC 80143ED4 1480043C */  lui        $a0, %hi(func_8014274C + 0xC)
    /* A2E0 80143ED8 58278424 */  addiu      $a0, $a0, %lo(func_8014274C + 0xC)
    /* A2E4 80143EDC C00F0508 */  j          .L80143F00
    /* A2E8 80143EE0 00000000 */   nop
  .L80143EE4:
    /* A2EC 80143EE4 DC9E010C */  jal        QuestStatus__Fi
    /* A2F0 80143EE8 0E000424 */   addiu     $a0, $zero, 0xE
    /* A2F4 80143EEC FF004230 */  andi       $v0, $v0, 0xFF
    /* A2F8 80143EF0 0A004010 */  beqz       $v0, .L80143F1C
    /* A2FC 80143EF4 00000000 */   nop
    /* A300 80143EF8 1480043C */  lui        $a0, %hi(func_8014274C + 0x18)
    /* A304 80143EFC 64278424 */  addiu      $a0, $a0, %lo(func_8014274C + 0x18)
  .L80143F00:
    /* A308 80143F00 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* A30C 80143F04 21280000 */   addu      $a1, $zero, $zero
    /* A310 80143F08 1280013C */  lui        $at, %hi(pSetPiece)
    /* A314 80143F0C DCC022AC */  sw         $v0, %lo(pSetPiece)($at)
    /* A318 80143F10 01000224 */  addiu      $v0, $zero, 0x1
    /* A31C 80143F14 1280013C */  lui        $at, %hi(setloadflag)
    /* A320 80143F18 F4C022A0 */  sb         $v0, %lo(setloadflag)($at)
  .L80143F1C:
    /* A324 80143F1C 1000BF8F */  lw         $ra, 0x10($sp)
    /* A328 80143F20 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A32C 80143F24 0800E003 */  jr         $ra
    /* A330 80143F28 00000000 */   nop
endlabel DRLG_LoadL2SP__Fv
