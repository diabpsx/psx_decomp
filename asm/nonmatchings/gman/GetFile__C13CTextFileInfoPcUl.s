.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFile__C13CTextFileInfoPcUl, 0xA0

glabel GetFile__C13CTextFileInfoPcUl
    /* 84654 80094654 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 84658 80094658 2000B0AF */  sw         $s0, 0x20($sp)
    /* 8465C 8009465C 21808000 */  addu       $s0, $a0, $zero
    /* 84660 80094660 0000048E */  lw         $a0, 0x0($s0)
    /* 84664 80094664 2400B1AF */  sw         $s1, 0x24($sp)
    /* 84668 80094668 2188A000 */  addu       $s1, $a1, $zero
    /* 8466C 8009466C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 84670 80094670 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 84674 80094674 8767000C */  jal        strlen
    /* 84678 80094678 2190C000 */   addu      $s2, $a2, $zero
    /* 8467C 8009467C 0900422C */  sltiu      $v0, $v0, 0x9
    /* 84680 80094680 07004014 */  bnez       $v0, .L800946A0
    /* 84684 80094684 21200002 */   addu      $a0, $s0, $zero
    /* 84688 80094688 21200000 */  addu       $a0, $zero, $zero
    /* 8468C 8009468C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84690 80094690 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 84694 80094694 A583000C */  jal        DBG_Error
    /* 84698 80094698 91060624 */   addiu     $a2, $zero, 0x691
    /* 8469C 8009469C 21200002 */  addu       $a0, $s0, $zero
  .L800946A0:
    /* 846A0 800946A0 1000A527 */  addiu      $a1, $sp, 0x10
    /* 846A4 800946A4 8351020C */  jal        MakeFname__C13CTextFileInfoPcPCc
    /* 846A8 800946A8 21302002 */   addu      $a2, $s1, $zero
    /* 846AC 800946AC 1D11020C */  jal        SYSI_GetFs__Fv
    /* 846B0 800946B0 00000000 */   nop
    /* 846B4 800946B4 21204000 */  addu       $a0, $v0, $zero
    /* 846B8 800946B8 1000A527 */  addiu      $a1, $sp, 0x10
    /* 846BC 800946BC 4816020C */  jal        Read__6FileIOPCcUl
    /* 846C0 800946C0 21304002 */   addu      $a2, $s2, $zero
    /* 846C4 800946C4 21804000 */  addu       $s0, $v0, $zero
    /* 846C8 800946C8 21200002 */  addu       $a0, $s0, $zero
    /* 846CC 800946CC 9C88000C */  jal        GAL_SetMemName
    /* 846D0 800946D0 1000A527 */   addiu     $a1, $sp, 0x10
    /* 846D4 800946D4 21100002 */  addu       $v0, $s0, $zero
    /* 846D8 800946D8 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 846DC 800946DC 2800B28F */  lw         $s2, 0x28($sp)
    /* 846E0 800946E0 2400B18F */  lw         $s1, 0x24($sp)
    /* 846E4 800946E4 2000B08F */  lw         $s0, 0x20($sp)
    /* 846E8 800946E8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 846EC 800946EC 0800E003 */  jr         $ra
    /* 846F0 800946F0 00000000 */   nop
endlabel GetFile__C13CTextFileInfoPcUl
