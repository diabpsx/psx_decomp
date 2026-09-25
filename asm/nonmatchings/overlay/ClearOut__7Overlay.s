.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearOut__7Overlay, 0xC4

glabel ClearOut__7Overlay
    /* 85548 80095548 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8554C 8009554C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 85550 80095550 21808000 */  addu       $s0, $a0, $zero
    /* 85554 80095554 1400BFAF */  sw         $ra, 0x14($sp)
    /* 85558 80095558 0400028E */  lw         $v0, 0x4($s0)
    /* 8555C 8009555C 00000000 */  nop
    /* 85560 80095560 0C004228 */  slti       $v0, $v0, 0xC
    /* 85564 80095564 06004010 */  beqz       $v0, .L80095580
    /* 85568 80095568 00000000 */   nop
    /* 8556C 8009556C 21200000 */  addu       $a0, $zero, $zero
    /* 85570 80095570 1180053C */  lui        $a1, %hi(D_801105BC)
    /* 85574 80095574 BC05A524 */  addiu      $a1, $a1, %lo(D_801105BC)
    /* 85578 80095578 A583000C */  jal        DBG_Error
    /* 8557C 8009557C BC000624 */   addiu     $a2, $zero, 0xBC
  .L80095580:
    /* 85580 80095580 0000048E */  lw         $a0, 0x0($s0)
    /* 85584 80095584 0400068E */  lw         $a2, 0x4($s0)
    /* 85588 80095588 E940000C */  jal        memset
    /* 8558C 8009558C 21280000 */   addu      $a1, $zero, $zero
    /* 85590 80095590 0000028E */  lw         $v0, 0x0($s0)
    /* 85594 80095594 0400038E */  lw         $v1, 0x4($s0)
    /* 85598 80095598 00000000 */  nop
    /* 8559C 8009559C 21104300 */  addu       $v0, $v0, $v1
    /* 855A0 800955A0 1180073C */  lui        $a3, %hi(D_801105F8)
    /* 855A4 800955A4 F805E724 */  addiu      $a3, $a3, %lo(D_801105F8)
    /* 855A8 800955A8 0300E388 */  lwl        $v1, 0x3($a3)
    /* 855AC 800955AC 0000E398 */  lwr        $v1, 0x0($a3)
    /* 855B0 800955B0 0700E588 */  lwl        $a1, 0x7($a3)
    /* 855B4 800955B4 0400E598 */  lwr        $a1, 0x4($a3)
    /* 855B8 800955B8 0B00E688 */  lwl        $a2, 0xB($a3)
    /* 855BC 800955BC 0800E698 */  lwr        $a2, 0x8($a3)
    /* 855C0 800955C0 F7FF43A8 */  swl        $v1, -0x9($v0)
    /* 855C4 800955C4 F4FF43B8 */  swr        $v1, -0xC($v0)
    /* 855C8 800955C8 FBFF45A8 */  swl        $a1, -0x5($v0)
    /* 855CC 800955CC F8FF45B8 */  swr        $a1, -0x8($v0)
    /* 855D0 800955D0 FFFF46A8 */  swl        $a2, -0x1($v0)
    /* 855D4 800955D4 FCFF46B8 */  swr        $a2, -0x4($v0)
    /* 855D8 800955D8 9E4E000C */  jal        DrawSync
    /* 855DC 800955DC 21200000 */   addu      $a0, $zero, $zero
    /* 855E0 800955E0 6346000C */  jal        EnterCriticalSection
    /* 855E4 800955E4 00000000 */   nop
    /* 855E8 800955E8 4F46000C */  jal        FlushCache
    /* 855EC 800955EC 00000000 */   nop
    /* 855F0 800955F0 6746000C */  jal        ExitCriticalSection
    /* 855F4 800955F4 00000000 */   nop
    /* 855F8 800955F8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 855FC 800955FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 85600 80095600 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 85604 80095604 0800E003 */  jr         $ra
    /* 85608 80095608 00000000 */   nop
endlabel ClearOut__7Overlay
