.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadDat__C13CTextFileInfoli, 0x134

glabel LoadDat__C13CTextFileInfoli
    /* 84458 80094458 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8445C 8009445C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 84460 80094460 21808000 */  addu       $s0, $a0, $zero
    /* 84464 80094464 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 84468 80094468 2198A000 */  addu       $s3, $a1, $zero
    /* 8446C 8009446C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 84470 80094470 2190C000 */  addu       $s2, $a2, $zero
    /* 84474 80094474 3000BFAF */  sw         $ra, 0x30($sp)
    /* 84478 80094478 E554020C */  jal        HasDat__C13CTextFileInfo
    /* 8447C 8009447C 2400B1AF */   sw        $s1, 0x24($sp)
    /* 84480 80094480 05004014 */  bnez       $v0, .L80094498
    /* 84484 80094484 21200000 */   addu      $a0, $zero, $zero
    /* 84488 80094488 1180053C */  lui        $a1, %hi(D_80110598)
    /* 8448C 8009448C 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84490 80094490 A583000C */  jal        DBG_Error
    /* 84494 80094494 69060624 */   addiu     $a2, $zero, 0x669
  .L80094498:
    /* 84498 80094498 0000048E */  lw         $a0, 0x0($s0)
    /* 8449C 8009449C 8767000C */  jal        strlen
    /* 844A0 800944A0 00000000 */   nop
    /* 844A4 800944A4 0900422C */  sltiu      $v0, $v0, 0x9
    /* 844A8 800944A8 07004014 */  bnez       $v0, .L800944C8
    /* 844AC 800944AC 21200002 */   addu      $a0, $s0, $zero
    /* 844B0 800944B0 21200000 */  addu       $a0, $zero, $zero
    /* 844B4 800944B4 1180053C */  lui        $a1, %hi(D_80110598)
    /* 844B8 800944B8 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 844BC 800944BC A583000C */  jal        DBG_Error
    /* 844C0 800944C0 6A060624 */   addiu     $a2, $zero, 0x66A
    /* 844C4 800944C4 21200002 */  addu       $a0, $s0, $zero
  .L800944C8:
    /* 844C8 800944C8 1280063C */  lui        $a2, %hi(D_8011ACF0)
    /* 844CC 800944CC F0ACC624 */  addiu      $a2, $a2, %lo(D_8011ACF0)
    /* 844D0 800944D0 8351020C */  jal        MakeFname__C13CTextFileInfoPcPCc
    /* 844D4 800944D4 1000A527 */   addiu     $a1, $sp, 0x10
    /* 844D8 800944D8 1D11020C */  jal        SYSI_GetFs__Fv
    /* 844DC 800944DC 00000000 */   nop
    /* 844E0 800944E0 21884000 */  addu       $s1, $v0, $zero
    /* 844E4 800944E4 21202002 */  addu       $a0, $s1, $zero
    /* 844E8 800944E8 A416020C */  jal        FileLen__6FileIOPCc
    /* 844EC 800944EC 1000A527 */   addiu     $a1, $sp, 0x10
    /* 844F0 800944F0 2A104202 */  slt        $v0, $s2, $v0
    /* 844F4 800944F4 05004010 */  beqz       $v0, .L8009450C
    /* 844F8 800944F8 21200000 */   addu      $a0, $zero, $zero
    /* 844FC 800944FC 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84500 80094500 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84504 80094504 A583000C */  jal        DBG_Error
    /* 84508 80094508 72060624 */   addiu     $a2, $zero, 0x672
  .L8009450C:
    /* 8450C 8009450C DD85000C */  jal        GAL_Lock
    /* 84510 80094510 21206002 */   addu      $a0, $s3, $zero
    /* 84514 80094514 21804000 */  addu       $s0, $v0, $zero
    /* 84518 80094518 06000016 */  bnez       $s0, .L80094534
    /* 8451C 8009451C 00000000 */   nop
    /* 84520 80094520 21200000 */  addu       $a0, $zero, $zero
    /* 84524 80094524 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84528 80094528 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 8452C 8009452C A583000C */  jal        DBG_Error
    /* 84530 80094530 75060624 */   addiu     $a2, $zero, 0x675
  .L80094534:
    /* 84534 80094534 21202002 */  addu       $a0, $s1, $zero
    /* 84538 80094538 1000A527 */  addiu      $a1, $sp, 0x10
    /* 8453C 8009453C 21300002 */  addu       $a2, $s0, $zero
    /* 84540 80094540 FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 84544 80094544 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 84548 80094548 F785000C */  jal        GAL_Unlock
    /* 8454C 8009454C 21206002 */   addu      $a0, $s3, $zero
    /* 84550 80094550 FF004230 */  andi       $v0, $v0, 0xFF
    /* 84554 80094554 05004014 */  bnez       $v0, .L8009456C
    /* 84558 80094558 21200000 */   addu      $a0, $zero, $zero
    /* 8455C 8009455C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84560 80094560 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84564 80094564 A583000C */  jal        DBG_Error
    /* 84568 80094568 78060624 */   addiu     $a2, $zero, 0x678
  .L8009456C:
    /* 8456C 8009456C 3000BF8F */  lw         $ra, 0x30($sp)
    /* 84570 80094570 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 84574 80094574 2800B28F */  lw         $s2, 0x28($sp)
    /* 84578 80094578 2400B18F */  lw         $s1, 0x24($sp)
    /* 8457C 8009457C 2000B08F */  lw         $s0, 0x20($sp)
    /* 84580 80094580 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 84584 80094584 0800E003 */  jr         $ra
    /* 84588 80094588 00000000 */   nop
endlabel LoadDat__C13CTextFileInfoli
