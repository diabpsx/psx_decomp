.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoSAttack__Fi, 0xDC

glabel M_DoSAttack__Fi
    /* 14380 8014DF78 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 14384 8014DF7C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 14388 8014DF80 21888000 */  addu       $s1, $a0, $zero
    /* 1438C 8014DF84 40101100 */  sll        $v0, $s1, 1
    /* 14390 8014DF88 21105100 */  addu       $v0, $v0, $s1
    /* 14394 8014DF8C 80100200 */  sll        $v0, $v0, 2
    /* 14398 8014DF90 21105100 */  addu       $v0, $v0, $s1
    /* 1439C 8014DF94 1800B0AF */  sw         $s0, 0x18($sp)
    /* 143A0 8014DF98 C0800200 */  sll        $s0, $v0, 3
    /* 143A4 8014DF9C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 143A8 8014DFA0 1080013C */  lui        $at, %hi(monster + 0x64)
    /* 143AC 8014DFA4 21083000 */  addu       $at, $at, $s0
    /* 143B0 8014DFA8 F853228C */  lw         $v0, %lo(monster + 0x64)($at)
    /* 143B4 8014DFAC 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 143B8 8014DFB0 21083000 */  addu       $at, $at, $s0
    /* 143BC 8014DFB4 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 143C0 8014DFB8 2A004290 */  lbu        $v0, 0x2A($v0)
    /* 143C4 8014DFBC 00000000 */  nop
    /* 143C8 8014DFC0 12006214 */  bne        $v1, $v0, .L8014E00C
    /* 143CC 8014DFC4 00000000 */   nop
    /* 143D0 8014DFC8 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 143D4 8014DFCC 21083000 */  addu       $at, $at, $s0
    /* 143D8 8014DFD0 D1532590 */  lbu        $a1, %lo(monster + 0x3D)($at)
    /* 143DC 8014DFD4 1080013C */  lui        $at, %hi(monster + 0x53)
    /* 143E0 8014DFD8 21083000 */  addu       $at, $at, $s0
    /* 143E4 8014DFDC E7532690 */  lbu        $a2, %lo(monster + 0x53)($at)
    /* 143E8 8014DFE0 1080013C */  lui        $at, %hi(monster + 0x54)
    /* 143EC 8014DFE4 21083000 */  addu       $at, $at, $s0
    /* 143F0 8014DFE8 E8532790 */  lbu        $a3, %lo(monster + 0x54)($at)
    /* 143F4 8014DFEC 1080013C */  lui        $at, %hi(monster + 0x55)
    /* 143F8 8014DFF0 21083000 */  addu       $at, $at, $s0
    /* 143FC 8014DFF4 E9532290 */  lbu        $v0, %lo(monster + 0x55)($at)
    /* 14400 8014DFF8 0A35050C */  jal        M_TryH2HHit__Fiiiii
    /* 14404 8014DFFC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 14408 8014E000 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 1440C 8014E004 21083000 */  addu       $at, $at, $s0
    /* 14410 8014E008 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
  .L8014E00C:
    /* 14414 8014E00C 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 14418 8014E010 21083000 */  addu       $at, $at, $s0
    /* 1441C 8014E014 D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 14420 8014E018 00000000 */  nop
    /* 14424 8014E01C 07006214 */  bne        $v1, $v0, .L8014E03C
    /* 14428 8014E020 21100000 */   addu      $v0, $zero, $zero
    /* 1442C 8014E024 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 14430 8014E028 21083000 */  addu       $at, $at, $s0
    /* 14434 8014E02C D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 14438 8014E030 9CFF010C */  jal        M_StartStand__Fii
    /* 1443C 8014E034 21202002 */   addu      $a0, $s1, $zero
    /* 14440 8014E038 01000224 */  addiu      $v0, $zero, 0x1
  .L8014E03C:
    /* 14444 8014E03C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 14448 8014E040 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1444C 8014E044 1800B08F */  lw         $s0, 0x18($sp)
    /* 14450 8014E048 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 14454 8014E04C 0800E003 */  jr         $ra
    /* 14458 8014E050 00000000 */   nop
endlabel M_DoSAttack__Fi
