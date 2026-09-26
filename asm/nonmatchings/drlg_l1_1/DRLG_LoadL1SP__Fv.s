.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_LoadL1SP__Fv, 0xDC

glabel DRLG_LoadL1SP__Fv
    /* 31A8 8013CDA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 31AC 8013CDA4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 31B0 8013CDA8 1280013C */  lui        $at, %hi(setloadflag)
    /* 31B4 8013CDAC F4C020A0 */  sb         $zero, %lo(setloadflag)($at)
    /* 31B8 8013CDB0 DC9E010C */  jal        QuestStatus__Fi
    /* 31BC 8013CDB4 06000424 */   addiu     $a0, $zero, 0x6
    /* 31C0 8013CDB8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 31C4 8013CDBC 0A004010 */  beqz       $v0, .L8013CDE8
    /* 31C8 8013CDC0 00000000 */   nop
    /* 31CC 8013CDC4 1480043C */  lui        $a0, %hi(func_80139C24 + 0x10)
    /* 31D0 8013CDC8 349C8424 */  addiu      $a0, $a0, %lo(func_80139C24 + 0x10)
    /* 31D4 8013CDCC A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 31D8 8013CDD0 21280000 */   addu      $a1, $zero, $zero
    /* 31DC 8013CDD4 1280013C */  lui        $at, %hi(pSetPiece)
    /* 31E0 8013CDD8 DCC022AC */  sw         $v0, %lo(pSetPiece)($at)
    /* 31E4 8013CDDC 01000224 */  addiu      $v0, $zero, 0x1
    /* 31E8 8013CDE0 1280013C */  lui        $at, %hi(setloadflag)
    /* 31EC 8013CDE4 F4C022A0 */  sb         $v0, %lo(setloadflag)($at)
  .L8013CDE8:
    /* 31F0 8013CDE8 DC9E010C */  jal        QuestStatus__Fi
    /* 31F4 8013CDEC 0C000424 */   addiu     $a0, $zero, 0xC
    /* 31F8 8013CDF0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 31FC 8013CDF4 0F004010 */  beqz       $v0, .L8013CE34
    /* 3200 8013CDF8 01000224 */   addiu     $v0, $zero, 0x1
    /* 3204 8013CDFC 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 3208 8013CE00 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 320C 8013CE04 00000000 */  nop
    /* 3210 8013CE08 0A006214 */  bne        $v1, $v0, .L8013CE34
    /* 3214 8013CE0C 00000000 */   nop
    /* 3218 8013CE10 1480043C */  lui        $a0, %hi(func_80139C24 + 0x1C)
    /* 321C 8013CE14 409C8424 */  addiu      $a0, $a0, %lo(func_80139C24 + 0x1C)
    /* 3220 8013CE18 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 3224 8013CE1C 21280000 */   addu      $a1, $zero, $zero
    /* 3228 8013CE20 1280013C */  lui        $at, %hi(pSetPiece)
    /* 322C 8013CE24 DCC022AC */  sw         $v0, %lo(pSetPiece)($at)
    /* 3230 8013CE28 01000224 */  addiu      $v0, $zero, 0x1
    /* 3234 8013CE2C 1280013C */  lui        $at, %hi(setloadflag)
    /* 3238 8013CE30 F4C022A0 */  sb         $v0, %lo(setloadflag)($at)
  .L8013CE34:
    /* 323C 8013CE34 DC9E010C */  jal        QuestStatus__Fi
    /* 3240 8013CE38 07000424 */   addiu     $a0, $zero, 0x7
    /* 3244 8013CE3C FF004230 */  andi       $v0, $v0, 0xFF
    /* 3248 8013CE40 0A004010 */  beqz       $v0, .L8013CE6C
    /* 324C 8013CE44 00000000 */   nop
    /* 3250 8013CE48 1480043C */  lui        $a0, %hi(func_80139C24 + 0x28)
    /* 3254 8013CE4C 4C9C8424 */  addiu      $a0, $a0, %lo(func_80139C24 + 0x28)
    /* 3258 8013CE50 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 325C 8013CE54 21280000 */   addu      $a1, $zero, $zero
    /* 3260 8013CE58 1280013C */  lui        $at, %hi(pSetPiece)
    /* 3264 8013CE5C DCC022AC */  sw         $v0, %lo(pSetPiece)($at)
    /* 3268 8013CE60 01000224 */  addiu      $v0, $zero, 0x1
    /* 326C 8013CE64 1280013C */  lui        $at, %hi(setloadflag)
    /* 3270 8013CE68 F4C022A0 */  sb         $v0, %lo(setloadflag)($at)
  .L8013CE6C:
    /* 3274 8013CE6C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3278 8013CE70 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 327C 8013CE74 0800E003 */  jr         $ra
    /* 3280 8013CE78 00000000 */   nop
endlabel DRLG_LoadL1SP__Fv
