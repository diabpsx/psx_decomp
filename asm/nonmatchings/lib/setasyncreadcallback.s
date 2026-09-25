.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setasyncreadcallback, 0x78

glabel setasyncreadcallback
    /* 1754C 8002754C D422868F */  lw         $a2, %gp_rel(asyncreadcallbackfunc)($gp)
    /* 17550 80027550 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 17554 80027554 1000B0AF */  sw         $s0, 0x10($sp)
    /* 17558 80027558 21808000 */  addu       $s0, $a0, $zero
    /* 1755C 8002755C 1300C010 */  beqz       $a2, .L800275AC
    /* 17560 80027560 1400BFAF */   sw        $ra, 0x14($sp)
    /* 17564 80027564 1100D010 */  beq        $a2, $s0, .L800275AC
    /* 17568 80027568 00000000 */   nop
    /* 1756C 8002756C 0C23828F */  lw         $v0, %gp_rel(asyncsectors)($gp)
    /* 17570 80027570 00000000 */  nop
    /* 17574 80027574 0D004010 */  beqz       $v0, .L800275AC
    /* 17578 80027578 00000000 */   nop
    /* 1757C 8002757C E422858F */  lw         $a1, %gp_rel(asyncsector)($gp)
    /* 17580 80027580 1180023C */  lui        $v0, %hi(D_8010EF20)
    /* 17584 80027584 20EF4224 */  addiu      $v0, $v0, %lo(D_8010EF20)
    /* 17588 80027588 1280013C */  lui        $at, %hi(abortfile)
    /* 1758C 8002758C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 17590 80027590 5C020224 */  addiu      $v0, $zero, 0x25C
    /* 17594 80027594 1180043C */  lui        $a0, %hi(D_8010EF2C)
    /* 17598 80027598 2CEF8424 */  addiu      $a0, $a0, %lo(D_8010EF2C)
    /* 1759C 8002759C 1280013C */  lui        $at, %hi(abortline)
    /* 175A0 800275A0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 175A4 800275A4 0F95000C */  jal        abortmessage
    /* 175A8 800275A8 21380002 */   addu      $a3, $s0, $zero
  .L800275AC:
    /* 175AC 800275AC D42290AF */  sw         $s0, %gp_rel(asyncreadcallbackfunc)($gp)
    /* 175B0 800275B0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 175B4 800275B4 1000B08F */  lw         $s0, 0x10($sp)
    /* 175B8 800275B8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 175BC 800275BC 0800E003 */  jr         $ra
    /* 175C0 800275C0 00000000 */   nop
endlabel setasyncreadcallback
