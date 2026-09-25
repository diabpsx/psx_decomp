.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching psxcdromasyncseek, 0xC4

glabel psxcdromasyncseek
    /* 17488 80027488 741C828F */  lw         $v0, %gp_rel(asynctimerflag)($gp)
    /* 1748C 8002748C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 17490 80027490 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 17494 80027494 21888000 */  addu       $s1, $a0, $zero
    /* 17498 80027498 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1749C 8002749C 07004014 */  bnez       $v0, .L800274BC
    /* 174A0 800274A0 2800B0AF */   sw        $s0, 0x28($sp)
    /* 174A4 800274A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 174A8 800274A8 741C82AF */  sw         $v0, %gp_rel(asynctimerflag)($gp)
    /* 174AC 800274AC 0280043C */  lui        $a0, %hi(asynctimer)
    /* 174B0 800274B0 70768424 */  addiu      $a0, $a0, %lo(asynctimer)
    /* 174B4 800274B4 FDBE000C */  jal        addtimer
    /* 174B8 800274B8 00000000 */   nop
  .L800274BC:
    /* 174BC 800274BC 0280103C */  lui        $s0, %hi(Iasyncreadcallback)
    /* 174C0 800274C0 44771026 */  addiu      $s0, $s0, %lo(Iasyncreadcallback)
    /* 174C4 800274C4 21200002 */  addu       $a0, $s0, $zero
    /* 174C8 800274C8 981C80AF */  sw         $zero, %gp_rel(asyncpausereq)($gp)
    /* 174CC 800274CC 916B000C */  jal        CdReadyCallback
    /* 174D0 800274D0 00000000 */   nop
    /* 174D4 800274D4 0C2380AF */  sw         $zero, %gp_rel(asyncsectors)($gp)
    /* 174D8 800274D8 A822838F */  lw         $v1, %gp_rel(datatracksector)($gp)
    /* 174DC 800274DC 00000000 */  nop
    /* 174E0 800274E0 21182302 */  addu       $v1, $s1, $v1
    /* 174E4 800274E4 E42283AF */  sw         $v1, %gp_rel(asyncsector)($gp)
    /* 174E8 800274E8 12005010 */  beq        $v0, $s0, .L80027534
    /* 174EC 800274EC A0000224 */   addiu     $v0, $zero, 0xA0
    /* 174F0 800274F0 2000A2A3 */  sb         $v0, 0x20($sp)
    /* 174F4 800274F4 21200000 */  addu       $a0, $zero, $zero
  .L800274F8:
    /* 174F8 800274F8 7C6B000C */  jal        CdSync
    /* 174FC 800274FC 21280000 */   addu      $a1, $zero, $zero
    /* 17500 80027500 0E000424 */  addiu      $a0, $zero, 0xE
    /* 17504 80027504 2000A527 */  addiu      $a1, $sp, 0x20
    /* 17508 80027508 326C000C */  jal        CdControlB
    /* 1750C 8002750C 1000A627 */   addiu     $a2, $sp, 0x10
    /* 17510 80027510 1000A293 */  lbu        $v0, 0x10($sp)
    /* 17514 80027514 00000000 */  nop
    /* 17518 80027518 01004230 */  andi       $v0, $v0, 0x1
    /* 1751C 8002751C F6FF4014 */  bnez       $v0, .L800274F8
    /* 17520 80027520 21200000 */   addu      $a0, $zero, $zero
    /* 17524 80027524 809D000C */  jal        asyncinitread
    /* 17528 80027528 00000000 */   nop
    /* 1752C 8002752C 01000224 */  addiu      $v0, $zero, 0x1
    /* 17530 80027530 941C82AF */  sw         $v0, %gp_rel(asyncreadreq)($gp)
  .L80027534:
    /* 17534 80027534 3000BF8F */  lw         $ra, 0x30($sp)
    /* 17538 80027538 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 1753C 8002753C 2800B08F */  lw         $s0, 0x28($sp)
    /* 17540 80027540 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 17544 80027544 0800E003 */  jr         $ra
    /* 17548 80027548 00000000 */   nop
endlabel psxcdromasyncseek
