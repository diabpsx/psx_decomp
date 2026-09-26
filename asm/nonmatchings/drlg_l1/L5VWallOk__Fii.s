.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5VWallOk__Fii, 0x148

glabel L5VWallOk__Fii
    /* 42B4 8013DEAC 21488000 */  addu       $t1, $a0, $zero
    /* 42B8 8013DEB0 0100A724 */  addiu      $a3, $a1, 0x1
    /* 42BC 8013DEB4 40300700 */  sll        $a2, $a3, 1
    /* 42C0 8013DEB8 0E80043C */  lui        $a0, %hi(dungeon)
    /* 42C4 8013DEBC C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 42C8 8013DEC0 40100900 */  sll        $v0, $t1, 1
    /* 42CC 8013DEC4 21104900 */  addu       $v0, $v0, $t1
    /* 42D0 8013DEC8 40110200 */  sll        $v0, $v0, 5
    /* 42D4 8013DECC 21584400 */  addu       $t3, $v0, $a0
    /* 42D8 8013DED0 0D000C24 */  addiu      $t4, $zero, 0xD
    /* 42DC 8013DED4 A0FF8324 */  addiu      $v1, $a0, -0x60
    /* 42E0 8013DED8 21504300 */  addu       $t2, $v0, $v1
    /* 42E4 8013DEDC 60008424 */  addiu      $a0, $a0, 0x60
    /* 42E8 8013DEE0 21704400 */  addu       $t6, $v0, $a0
    /* 42EC 8013DEE4 2110CB00 */  addu       $v0, $a2, $t3
    /* 42F0 8013DEE8 00004294 */  lhu        $v0, 0x0($v0)
    /* 42F4 8013DEEC 12800D3C */  lui        $t5, %hi(mydflags)
    /* 42F8 8013DEF0 D8C0AD8D */  lw         $t5, %lo(mydflags)($t5)
    /* 42FC 8013DEF4 1E004C14 */  bne        $v0, $t4, .L8013DF70
    /* 4300 8013DEF8 01000824 */   addiu     $t0, $zero, 0x1
    /* 4304 8013DEFC 2110CA00 */  addu       $v0, $a2, $t2
    /* 4308 8013DF00 00004394 */  lhu        $v1, 0x0($v0)
    /* 430C 8013DF04 00000000 */  nop
    /* 4310 8013DF08 19006C14 */  bne        $v1, $t4, .L8013DF70
    /* 4314 8013DF0C 2110CE00 */   addu      $v0, $a2, $t6
  .L8013DF10:
    /* 4318 8013DF10 00004294 */  lhu        $v0, 0x0($v0)
    /* 431C 8013DF14 00000000 */  nop
    /* 4320 8013DF18 15004314 */  bne        $v0, $v1, .L8013DF70
    /* 4324 8013DF1C 80100700 */   sll       $v0, $a3, 2
    /* 4328 8013DF20 21104700 */  addu       $v0, $v0, $a3
    /* 432C 8013DF24 C0100200 */  sll        $v0, $v0, 3
    /* 4330 8013DF28 21104900 */  addu       $v0, $v0, $t1
    /* 4334 8013DF2C 2110A201 */  addu       $v0, $t5, $v0
    /* 4338 8013DF30 00004290 */  lbu        $v0, 0x0($v0)
    /* 433C 8013DF34 00000000 */  nop
    /* 4340 8013DF38 0D004014 */  bnez       $v0, .L8013DF70
    /* 4344 8013DF3C 00000000 */   nop
    /* 4348 8013DF40 01000825 */  addiu      $t0, $t0, 0x1
    /* 434C 8013DF44 2138A800 */  addu       $a3, $a1, $t0
    /* 4350 8013DF48 40300700 */  sll        $a2, $a3, 1
    /* 4354 8013DF4C 2110CB00 */  addu       $v0, $a2, $t3
    /* 4358 8013DF50 00004494 */  lhu        $a0, 0x0($v0)
    /* 435C 8013DF54 00000000 */  nop
    /* 4360 8013DF58 05008C14 */  bne        $a0, $t4, .L8013DF70
    /* 4364 8013DF5C 2110CA00 */   addu      $v0, $a2, $t2
    /* 4368 8013DF60 00004394 */  lhu        $v1, 0x0($v0)
    /* 436C 8013DF64 00000000 */  nop
    /* 4370 8013DF68 E9FF6410 */  beq        $v1, $a0, .L8013DF10
    /* 4374 8013DF6C 2110CE00 */   addu      $v0, $a2, $t6
  .L8013DF70:
    /* 4378 8013DF70 0E80033C */  lui        $v1, %hi(dungeon)
    /* 437C 8013DF74 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 4380 8013DF78 40100900 */  sll        $v0, $t1, 1
    /* 4384 8013DF7C 21104900 */  addu       $v0, $v0, $t1
    /* 4388 8013DF80 40110200 */  sll        $v0, $v0, 5
    /* 438C 8013DF84 21104300 */  addu       $v0, $v0, $v1
    /* 4390 8013DF88 2118A800 */  addu       $v1, $a1, $t0
    /* 4394 8013DF8C 40180300 */  sll        $v1, $v1, 1
    /* 4398 8013DF90 21186200 */  addu       $v1, $v1, $v0
    /* 439C 8013DF94 00006394 */  lhu        $v1, 0x0($v1)
    /* 43A0 8013DF98 00000000 */  nop
    /* 43A4 8013DF9C FDFF6224 */  addiu      $v0, $v1, -0x3
    /* 43A8 8013DFA0 0500422C */  sltiu      $v0, $v0, 0x5
    /* 43AC 8013DFA4 21204000 */  addu       $a0, $v0, $zero
    /* 43B0 8013DFA8 F0FF6224 */  addiu      $v0, $v1, -0x10
    /* 43B4 8013DFAC 0900422C */  sltiu      $v0, $v0, 0x9
    /* 43B8 8013DFB0 02004010 */  beqz       $v0, .L8013DFBC
    /* 43BC 8013DFB4 00000000 */   nop
    /* 43C0 8013DFB8 01000424 */  addiu      $a0, $zero, 0x1
  .L8013DFBC:
    /* 43C4 8013DFBC FFFF6330 */  andi       $v1, $v1, 0xFFFF
    /* 43C8 8013DFC0 16000224 */  addiu      $v0, $zero, 0x16
    /* 43CC 8013DFC4 02006214 */  bne        $v1, $v0, .L8013DFD0
    /* 43D0 8013DFC8 01000224 */   addiu     $v0, $zero, 0x1
    /* 43D4 8013DFCC 21200000 */  addu       $a0, $zero, $zero
  .L8013DFD0:
    /* 43D8 8013DFD0 03000215 */  bne        $t0, $v0, .L8013DFE0
    /* 43DC 8013DFD4 FF008330 */   andi      $v1, $a0, 0xFF
    /* 43E0 8013DFD8 21200000 */  addu       $a0, $zero, $zero
    /* 43E4 8013DFDC FF008330 */  andi       $v1, $a0, 0xFF
  .L8013DFE0:
    /* 43E8 8013DFE0 02006014 */  bnez       $v1, .L8013DFEC
    /* 43EC 8013DFE4 21100001 */   addu      $v0, $t0, $zero
    /* 43F0 8013DFE8 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8013DFEC:
    /* 43F4 8013DFEC 0800E003 */  jr         $ra
    /* 43F8 8013DFF0 00000000 */   nop
endlabel L5VWallOk__Fii
