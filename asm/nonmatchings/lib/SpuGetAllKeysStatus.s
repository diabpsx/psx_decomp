.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuGetAllKeysStatus, 0x88

glabel SpuGetAllKeysStatus
    /* 9450 80019450 18000A24 */  addiu      $t2, $zero, 0x18
    /* 9454 80019454 21300000 */  addu       $a2, $zero, $zero
    /* 9458 80019458 01000724 */  addiu      $a3, $zero, 0x1
    /* 945C 8001945C 03000924 */  addiu      $t1, $zero, 0x3
    /* 9460 80019460 02000824 */  addiu      $t0, $zero, 0x2
    /* 9464 80019464 21288000 */  addu       $a1, $a0, $zero
  .L80019468:
    /* 9468 80019468 00210600 */  sll        $a0, $a2, 4
    /* 946C 8001946C 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 9470 80019470 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 9474 80019474 0B80033C */  lui        $v1, %hi(_spu_keystat)
    /* 9478 80019478 D855638C */  lw         $v1, %lo(_spu_keystat)($v1)
    /* 947C 8001947C 21208200 */  addu       $a0, $a0, $v0
    /* 9480 80019480 0410C700 */  sllv       $v0, $a3, $a2
    /* 9484 80019484 24186200 */  and        $v1, $v1, $v0
    /* 9488 80019488 0C008294 */  lhu        $v0, 0xC($a0)
    /* 948C 8001948C 07006010 */  beqz       $v1, .L800194AC
    /* 9490 80019490 00000000 */   nop
    /* 9494 80019494 03004010 */  beqz       $v0, .L800194A4
    /* 9498 80019498 00000000 */   nop
    /* 949C 8001949C 30650008 */  j          .L800194C0
    /* 94A0 800194A0 0000A7A0 */   sb        $a3, 0x0($a1)
  .L800194A4:
    /* 94A4 800194A4 30650008 */  j          .L800194C0
    /* 94A8 800194A8 0000A9A0 */   sb        $t1, 0x0($a1)
  .L800194AC:
    /* 94AC 800194AC 03004010 */  beqz       $v0, .L800194BC
    /* 94B0 800194B0 00000000 */   nop
    /* 94B4 800194B4 30650008 */  j          .L800194C0
    /* 94B8 800194B8 0000A8A0 */   sb        $t0, 0x0($a1)
  .L800194BC:
    /* 94BC 800194BC 0000A0A0 */  sb         $zero, 0x0($a1)
  .L800194C0:
    /* 94C0 800194C0 0100C624 */  addiu      $a2, $a2, 0x1
    /* 94C4 800194C4 2A10CA00 */  slt        $v0, $a2, $t2
    /* 94C8 800194C8 E7FF4014 */  bnez       $v0, .L80019468
    /* 94CC 800194CC 0100A524 */   addiu     $a1, $a1, 0x1
    /* 94D0 800194D0 0800E003 */  jr         $ra
    /* 94D4 800194D4 00000000 */   nop
endlabel SpuGetAllKeysStatus
    /* 94D8 800194D8 00000000 */  nop
