.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching abortmessage, 0xF0

glabel abortmessage
    /* 1543C 8002543C 0000A4AF */  sw         $a0, 0x0($sp)
    /* 15440 80025440 0400A5AF */  sw         $a1, 0x4($sp)
    /* 15444 80025444 0800A6AF */  sw         $a2, 0x8($sp)
    /* 15448 80025448 0C00A7AF */  sw         $a3, 0xC($sp)
    /* 1544C 8002544C E8FEBD27 */  addiu      $sp, $sp, -0x118
    /* 15450 80025450 21288000 */  addu       $a1, $a0, $zero
    /* 15454 80025454 1000A427 */  addiu      $a0, $sp, 0x10
    /* 15458 80025458 1C01A627 */  addiu      $a2, $sp, 0x11C
    /* 1545C 8002545C 1001BFAF */  sw         $ra, 0x110($sp)
    /* 15460 80025460 4E95000C */  jal        vsprintf
    /* 15464 80025464 1801A5AF */   sw        $a1, 0x118($sp)
    /* 15468 80025468 341C858F */  lw         $a1, %gp_rel(override)($gp)
    /* 1546C 8002546C 00000000 */  nop
    /* 15470 80025470 0300A010 */  beqz       $a1, .L80025480
    /* 15474 80025474 00000000 */   nop
    /* 15478 80025478 F240000C */  jal        strcpy
    /* 1547C 8002547C 1000A427 */   addiu     $a0, $sp, 0x10
  .L80025480:
    /* 15480 80025480 1280033C */  lui        $v1, %hi(debugprint)
    /* 15484 80025484 D0C3638C */  lw         $v1, %lo(debugprint)($v1)
    /* 15488 80025488 01000224 */  addiu      $v0, $zero, 0x1
    /* 1548C 8002548C 03006214 */  bne        $v1, $v0, .L8002549C
    /* 15490 80025490 02000224 */   addiu     $v0, $zero, 0x2
    /* 15494 80025494 1280013C */  lui        $at, %hi(debugprint)
    /* 15498 80025498 D0C322AC */  sw         $v0, %lo(debugprint)($at)
  .L8002549C:
    /* 1549C 8002549C 481C828F */  lw         $v0, %gp_rel(abortmessagecallback)($gp)
    /* 154A0 800254A0 00000000 */  nop
    /* 154A4 800254A4 05004010 */  beqz       $v0, .L800254BC
    /* 154A8 800254A8 00000000 */   nop
    /* 154AC 800254AC 09F84000 */  jalr       $v0
    /* 154B0 800254B0 1000A427 */   addiu     $a0, $sp, 0x10
    /* 154B4 800254B4 19004010 */  beqz       $v0, .L8002551C
    /* 154B8 800254B8 00000000 */   nop
  .L800254BC:
    /* 154BC 800254BC 1280043C */  lui        $a0, %hi(D_8011C3CC)
    /* 154C0 800254C0 CCC38424 */  addiu      $a0, $a0, %lo(D_8011C3CC)
    /* 154C4 800254C4 5F97000C */  jal        print
    /* 154C8 800254C8 1000A527 */   addiu     $a1, $sp, 0x10
    /* 154CC 800254CC 381C858F */  lw         $a1, %gp_rel(abortfile)($gp)
    /* 154D0 800254D0 00000000 */  nop
    /* 154D4 800254D4 0600A010 */  beqz       $a1, .L800254F0
    /* 154D8 800254D8 00000000 */   nop
    /* 154DC 800254DC 3C1C868F */  lw         $a2, %gp_rel(abortline)($gp)
    /* 154E0 800254E0 1180043C */  lui        $a0, %hi(D_8010EB18)
    /* 154E4 800254E4 18EB8424 */  addiu      $a0, $a0, %lo(D_8010EB18)
    /* 154E8 800254E8 5F97000C */  jal        print
    /* 154EC 800254EC 00000000 */   nop
  .L800254F0:
    /* 154F0 800254F0 401C858F */  lw         $a1, %gp_rel(callfile)($gp)
    /* 154F4 800254F4 00000000 */  nop
    /* 154F8 800254F8 0600A010 */  beqz       $a1, .L80025514
    /* 154FC 800254FC 00000000 */   nop
    /* 15500 80025500 441C868F */  lw         $a2, %gp_rel(callline)($gp)
    /* 15504 80025504 1180043C */  lui        $a0, %hi(D_8010EB2C)
    /* 15508 80025508 2CEB8424 */  addiu      $a0, $a0, %lo(D_8010EB2C)
    /* 1550C 8002550C 5F97000C */  jal        print
    /* 15510 80025510 00000000 */   nop
  .L80025514:
    /* 15514 80025514 99BD000C */  jal        eacexit
    /* 15518 80025518 00000000 */   nop
  .L8002551C:
    /* 1551C 8002551C 1001BF8F */  lw         $ra, 0x110($sp)
    /* 15520 80025520 1801BD27 */  addiu      $sp, $sp, 0x118
    /* 15524 80025524 0800E003 */  jr         $ra
    /* 15528 80025528 00000000 */   nop
endlabel abortmessage
