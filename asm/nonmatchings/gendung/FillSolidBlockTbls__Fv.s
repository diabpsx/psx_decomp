.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FillSolidBlockTbls__Fv, 0x18C

glabel FillSolidBlockTbls__Fv
    /* 202E4 80159EDC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 202E8 80159EE0 0E80043C */  lui        $a0, %hi(nBlockTable)
    /* 202EC 80159EE4 04598424 */  addiu      $a0, $a0, %lo(nBlockTable)
    /* 202F0 80159EE8 21280000 */  addu       $a1, $zero, $zero
    /* 202F4 80159EEC 01080624 */  addiu      $a2, $zero, 0x801
    /* 202F8 80159EF0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 202FC 80159EF4 E940000C */  jal        memset
    /* 20300 80159EF8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 20304 80159EFC 0E80043C */  lui        $a0, %hi(nSolidTable)
    /* 20308 80159F00 08618424 */  addiu      $a0, $a0, %lo(nSolidTable)
    /* 2030C 80159F04 21280000 */  addu       $a1, $zero, $zero
    /* 20310 80159F08 E940000C */  jal        memset
    /* 20314 80159F0C 01080624 */   addiu     $a2, $zero, 0x801
    /* 20318 80159F10 0E80043C */  lui        $a0, %hi(nMissileTable)
    /* 2031C 80159F14 0C698424 */  addiu      $a0, $a0, %lo(nMissileTable)
    /* 20320 80159F18 21280000 */  addu       $a1, $zero, $zero
    /* 20324 80159F1C E940000C */  jal        memset
    /* 20328 80159F20 01080624 */   addiu     $a2, $zero, 0x801
    /* 2032C 80159F24 0E80043C */  lui        $a0, %hi(nTrapTable)
    /* 20330 80159F28 10718424 */  addiu      $a0, $a0, %lo(nTrapTable)
    /* 20334 80159F2C 21280000 */  addu       $a1, $zero, $zero
    /* 20338 80159F30 E940000C */  jal        memset
    /* 2033C 80159F34 01080624 */   addiu     $a2, $zero, 0x801
    /* 20340 80159F38 8D198393 */  lbu        $v1, %gp_rel(leveltype)($gp)
    /* 20344 80159F3C 00000000 */  nop
    /* 20348 80159F40 0500622C */  sltiu      $v0, $v1, 0x5
    /* 2034C 80159F44 1D004010 */  beqz       $v0, .L80159FBC
    /* 20350 80159F48 21800000 */   addu      $s0, $zero, $zero
    /* 20354 80159F4C 80100300 */  sll        $v0, $v1, 2
    /* 20358 80159F50 1280013C */  lui        $at, %hi(jtbl_80119A20)
    /* 2035C 80159F54 21082200 */  addu       $at, $at, $v0
    /* 20360 80159F58 209A228C */  lw         $v0, %lo(jtbl_80119A20)($at)
    /* 20364 80159F5C 00000000 */  nop
    /* 20368 80159F60 08004000 */  jr         $v0
    /* 2036C 80159F64 00000000 */   nop
    /* 20370 80159F68 1280043C */  lui        $a0, %hi(D_801199A0)
    /* 20374 80159F6C A0998424 */  addiu      $a0, $a0, %lo(D_801199A0)
    /* 20378 80159F70 EC670508 */  j          .L80159FB0
    /* 2037C 80159F74 00000000 */   nop
    /* 20380 80159F78 1280043C */  lui        $a0, %hi(D_801199BC)
    /* 20384 80159F7C BC998424 */  addiu      $a0, $a0, %lo(D_801199BC)
    /* 20388 80159F80 EC670508 */  j          .L80159FB0
    /* 2038C 80159F84 00000000 */   nop
    /* 20390 80159F88 1280043C */  lui        $a0, %hi(D_801199D4)
    /* 20394 80159F8C D4998424 */  addiu      $a0, $a0, %lo(D_801199D4)
    /* 20398 80159F90 EC670508 */  j          .L80159FB0
    /* 2039C 80159F94 00000000 */   nop
    /* 203A0 80159F98 1280043C */  lui        $a0, %hi(D_801199EC)
    /* 203A4 80159F9C EC998424 */  addiu      $a0, $a0, %lo(D_801199EC)
    /* 203A8 80159FA0 EC670508 */  j          .L80159FB0
    /* 203AC 80159FA4 00000000 */   nop
    /* 203B0 80159FA8 1280043C */  lui        $a0, %hi(D_80119A04)
    /* 203B4 80159FAC 049A8424 */  addiu      $a0, $a0, %lo(D_80119A04)
  .L80159FB0:
    /* 203B8 80159FB0 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 203BC 80159FB4 1000A527 */   addiu     $a1, $sp, 0x10
    /* 203C0 80159FB8 21804000 */  addu       $s0, $v0, $zero
  .L80159FBC:
    /* 203C4 80159FBC 21300002 */  addu       $a2, $s0, $zero
    /* 203C8 80159FC0 01000424 */  addiu      $a0, $zero, 0x1
    /* 203CC 80159FC4 01000524 */  addiu      $a1, $zero, 0x1
  .L80159FC8:
    /* 203D0 80159FC8 1000A28F */  lw         $v0, 0x10($sp)
    /* 203D4 80159FCC 00000000 */  nop
    /* 203D8 80159FD0 2B104400 */  sltu       $v0, $v0, $a0
    /* 203DC 80159FD4 1B004014 */  bnez       $v0, .L8015A044
    /* 203E0 80159FD8 00000000 */   nop
    /* 203E4 80159FDC 0000C390 */  lbu        $v1, 0x0($a2)
    /* 203E8 80159FE0 00000000 */  nop
    /* 203EC 80159FE4 01006230 */  andi       $v0, $v1, 0x1
    /* 203F0 80159FE8 04004010 */  beqz       $v0, .L80159FFC
    /* 203F4 80159FEC 0100C624 */   addiu     $a2, $a2, 0x1
    /* 203F8 80159FF0 0E80013C */  lui        $at, %hi(nSolidTable)
    /* 203FC 80159FF4 21082400 */  addu       $at, $at, $a0
    /* 20400 80159FF8 086125A0 */  sb         $a1, %lo(nSolidTable)($at)
  .L80159FFC:
    /* 20404 80159FFC 02006230 */  andi       $v0, $v1, 0x2
    /* 20408 8015A000 04004010 */  beqz       $v0, .L8015A014
    /* 2040C 8015A004 04006230 */   andi      $v0, $v1, 0x4
    /* 20410 8015A008 0E80013C */  lui        $at, %hi(nBlockTable)
    /* 20414 8015A00C 21082400 */  addu       $at, $at, $a0
    /* 20418 8015A010 045925A0 */  sb         $a1, %lo(nBlockTable)($at)
  .L8015A014:
    /* 2041C 8015A014 04004010 */  beqz       $v0, .L8015A028
    /* 20420 8015A018 80006230 */   andi      $v0, $v1, 0x80
    /* 20424 8015A01C 0E80013C */  lui        $at, %hi(nMissileTable)
    /* 20428 8015A020 21082400 */  addu       $at, $at, $a0
    /* 2042C 8015A024 0C6925A0 */  sb         $a1, %lo(nMissileTable)($at)
  .L8015A028:
    /* 20430 8015A028 04004010 */  beqz       $v0, .L8015A03C
    /* 20434 8015A02C 00000000 */   nop
    /* 20438 8015A030 0E80013C */  lui        $at, %hi(nTrapTable)
    /* 2043C 8015A034 21082400 */  addu       $at, $at, $a0
    /* 20440 8015A038 107125A0 */  sb         $a1, %lo(nTrapTable)($at)
  .L8015A03C:
    /* 20444 8015A03C F2670508 */  j          .L80159FC8
    /* 20448 8015A040 01008424 */   addiu     $a0, $a0, 0x1
  .L8015A044:
    /* 2044C 8015A044 1F0A020C */  jal        ConvertdPiece__Fv
    /* 20450 8015A048 00000000 */   nop
    /* 20454 8015A04C F7F6000C */  jal        mem_free_dbg__FPv
    /* 20458 8015A050 21200002 */   addu      $a0, $s0, $zero
    /* 2045C 8015A054 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 20460 8015A058 1800B08F */  lw         $s0, 0x18($sp)
    /* 20464 8015A05C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 20468 8015A060 0800E003 */  jr         $ra
    /* 2046C 8015A064 00000000 */   nop
endlabel FillSolidBlockTbls__Fv
