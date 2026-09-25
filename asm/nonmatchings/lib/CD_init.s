.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_init, 0x1E0

glabel CD_init
    /* C584 8001C584 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* C588 8001C588 1180043C */  lui        $a0, %hi(D_8010E4A4)
    /* C58C 8001C58C A4E48424 */  addiu      $a0, $a0, %lo(D_8010E4A4)
    /* C590 8001C590 1000BFAF */  sw         $ra, 0x10($sp)
    /* C594 8001C594 7567000C */  jal        puts
    /* C598 8001C598 00000000 */   nop
    /* C59C 8001C59C 1180043C */  lui        $a0, %hi(D_8010E4B0)
    /* C5A0 8001C5A0 B0E48424 */  addiu      $a0, $a0, %lo(D_8010E4B0)
    /* C5A4 8001C5A4 0B80053C */  lui        $a1, %hi(D_800B61D8)
    /* C5A8 8001C5A8 9367000C */  jal        printf
    /* C5AC 8001C5AC D861A524 */   addiu     $a1, $a1, %lo(D_800B61D8)
    /* C5B0 8001C5B0 0B80013C */  lui        $at, %hi(CD_com)
    /* C5B4 8001C5B4 155F20A0 */  sb         $zero, %lo(CD_com)($at)
    /* C5B8 8001C5B8 0B80013C */  lui        $at, %hi(CD_mode)
    /* C5BC 8001C5BC 145F20A0 */  sb         $zero, %lo(CD_mode)($at)
    /* C5C0 8001C5C0 0B80013C */  lui        $at, %hi(CD_cbready)
    /* C5C4 8001C5C4 F85E20AC */  sw         $zero, %lo(CD_cbready)($at)
    /* C5C8 8001C5C8 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* C5CC 8001C5CC F45E20AC */  sw         $zero, %lo(CD_cbsync)($at)
    /* C5D0 8001C5D0 0B80013C */  lui        $at, %hi(CD_status1)
    /* C5D4 8001C5D4 085F20AC */  sw         $zero, %lo(CD_status1)($at)
    /* C5D8 8001C5D8 0B80013C */  lui        $at, %hi(CD_status)
    /* C5DC 8001C5DC 9F48000C */  jal        ResetCallback
    /* C5E0 8001C5E0 045F20AC */   sw        $zero, %lo(CD_status)($at)
    /* C5E4 8001C5E4 0280053C */  lui        $a1, %hi(D_8001CAC4)
    /* C5E8 8001C5E8 C4CAA524 */  addiu      $a1, $a1, %lo(D_8001CAC4)
    /* C5EC 8001C5EC AB48000C */  jal        InterruptCallback
    /* C5F0 8001C5F0 02000424 */   addiu     $a0, $zero, 0x2
    /* C5F4 8001C5F4 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* C5F8 8001C5F8 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* C5FC 8001C5FC 01000224 */  addiu      $v0, $zero, 0x1
    /* C600 8001C600 000062A0 */  sb         $v0, 0x0($v1)
    /* C604 8001C604 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C608 8001C608 C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C60C 8001C60C 00000000 */  nop
    /* C610 8001C610 00004290 */  lbu        $v0, 0x0($v0)
    /* C614 8001C614 00000000 */  nop
    /* C618 8001C618 07004230 */  andi       $v0, $v0, 0x7
    /* C61C 8001C61C 16004010 */  beqz       $v0, .L8001C678
    /* C620 8001C620 01000424 */   addiu     $a0, $zero, 0x1
    /* C624 8001C624 07000324 */  addiu      $v1, $zero, 0x7
  .L8001C628:
    /* C628 8001C628 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* C62C 8001C62C BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* C630 8001C630 00000000 */  nop
    /* C634 8001C634 000044A0 */  sb         $a0, 0x0($v0)
    /* C638 8001C638 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C63C 8001C63C C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C640 8001C640 00000000 */  nop
    /* C644 8001C644 000043A0 */  sb         $v1, 0x0($v0)
    /* C648 8001C648 0B80023C */  lui        $v0, %hi(D_800B61C4)
    /* C64C 8001C64C C461428C */  lw         $v0, %lo(D_800B61C4)($v0)
    /* C650 8001C650 00000000 */  nop
    /* C654 8001C654 000043A0 */  sb         $v1, 0x0($v0)
    /* C658 8001C658 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C65C 8001C65C C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C660 8001C660 00000000 */  nop
    /* C664 8001C664 00004290 */  lbu        $v0, 0x0($v0)
    /* C668 8001C668 00000000 */  nop
    /* C66C 8001C66C 07004230 */  andi       $v0, $v0, 0x7
    /* C670 8001C670 EDFF4014 */  bnez       $v0, .L8001C628
    /* C674 8001C674 00000000 */   nop
  .L8001C678:
    /* C678 8001C678 01000424 */  addiu      $a0, $zero, 0x1
    /* C67C 8001C67C 21280000 */  addu       $a1, $zero, $zero
    /* C680 8001C680 0B80033C */  lui        $v1, %hi(D_800B61D4)
    /* C684 8001C684 D4616324 */  addiu      $v1, $v1, %lo(D_800B61D4)
    /* C688 8001C688 020060A0 */  sb         $zero, 0x2($v1)
    /* C68C 8001C68C 02006290 */  lbu        $v0, 0x2($v1)
    /* C690 8001C690 21300000 */  addu       $a2, $zero, $zero
    /* C694 8001C694 010062A0 */  sb         $v0, 0x1($v1)
    /* C698 8001C698 0B80073C */  lui        $a3, %hi(D_800B61BC)
    /* C69C 8001C69C BC61E78C */  lw         $a3, %lo(D_800B61BC)($a3)
    /* C6A0 8001C6A0 02000224 */  addiu      $v0, $zero, 0x2
    /* C6A4 8001C6A4 000062A0 */  sb         $v0, 0x0($v1)
    /* C6A8 8001C6A8 0000E0A0 */  sb         $zero, 0x0($a3)
    /* C6AC 8001C6AC 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C6B0 8001C6B0 C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C6B4 8001C6B4 21380000 */  addu       $a3, $zero, $zero
    /* C6B8 8001C6B8 000040A0 */  sb         $zero, 0x0($v0)
    /* C6BC 8001C6BC 0B80033C */  lui        $v1, %hi(D_800B61CC)
    /* C6C0 8001C6C0 CC61638C */  lw         $v1, %lo(D_800B61CC)($v1)
    /* C6C4 8001C6C4 25130224 */  addiu      $v0, $zero, 0x1325
    /* C6C8 8001C6C8 B86F000C */  jal        CD_cw
    /* C6CC 8001C6CC 000062AC */   sw        $v0, 0x0($v1)
    /* C6D0 8001C6D0 0B80023C */  lui        $v0, %hi(CD_status)
    /* C6D4 8001C6D4 045F428C */  lw         $v0, %lo(CD_status)($v0)
    /* C6D8 8001C6D8 00000000 */  nop
    /* C6DC 8001C6DC 10004230 */  andi       $v0, $v0, 0x10
    /* C6E0 8001C6E0 05004010 */  beqz       $v0, .L8001C6F8
    /* C6E4 8001C6E4 01000424 */   addiu     $a0, $zero, 0x1
    /* C6E8 8001C6E8 21280000 */  addu       $a1, $zero, $zero
    /* C6EC 8001C6EC 21300000 */  addu       $a2, $zero, $zero
    /* C6F0 8001C6F0 B86F000C */  jal        CD_cw
    /* C6F4 8001C6F4 21380000 */   addu      $a3, $zero, $zero
  .L8001C6F8:
    /* C6F8 8001C6F8 0A000424 */  addiu      $a0, $zero, 0xA
    /* C6FC 8001C6FC 21280000 */  addu       $a1, $zero, $zero
    /* C700 8001C700 21300000 */  addu       $a2, $zero, $zero
    /* C704 8001C704 B86F000C */  jal        CD_cw
    /* C708 8001C708 21380000 */   addu      $a3, $zero, $zero
    /* C70C 8001C70C 11004014 */  bnez       $v0, .L8001C754
    /* C710 8001C710 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C714 8001C714 0C000424 */  addiu      $a0, $zero, 0xC
    /* C718 8001C718 21280000 */  addu       $a1, $zero, $zero
    /* C71C 8001C71C 21300000 */  addu       $a2, $zero, $zero
    /* C720 8001C720 B86F000C */  jal        CD_cw
    /* C724 8001C724 21380000 */   addu      $a3, $zero, $zero
    /* C728 8001C728 09004014 */  bnez       $v0, .L8001C750
    /* C72C 8001C72C 21200000 */   addu      $a0, $zero, $zero
    /* C730 8001C730 666E000C */  jal        CD_sync
    /* C734 8001C734 21280000 */   addu      $a1, $zero, $zero
    /* C738 8001C738 21204000 */  addu       $a0, $v0, $zero
    /* C73C 8001C73C 02000324 */  addiu      $v1, $zero, 0x2
    /* C740 8001C740 04008314 */  bne        $a0, $v1, .L8001C754
    /* C744 8001C744 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C748 8001C748 D5710008 */  j          .L8001C754
    /* C74C 8001C74C 21100000 */   addu      $v0, $zero, $zero
  .L8001C750:
    /* C750 8001C750 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8001C754:
    /* C754 8001C754 1000BF8F */  lw         $ra, 0x10($sp)
    /* C758 8001C758 1800BD27 */  addiu      $sp, $sp, 0x18
    /* C75C 8001C75C 0800E003 */  jr         $ra
    /* C760 8001C760 00000000 */   nop
endlabel CD_init
