.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadMegaTiles__FPCc, 0x90

glabel LoadMegaTiles__FPCc
    /* 289E8 800389E8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 289EC 800389EC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 289F0 800389F0 21888000 */  addu       $s1, $a0, $zero
    /* 289F4 800389F4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 289F8 800389F8 1D11020C */  jal        SYSI_GetFs__Fv
    /* 289FC 800389FC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 28A00 80038A00 21804000 */  addu       $s0, $v0, $zero
    /* 28A04 80038A04 21200002 */  addu       $a0, $s0, $zero
    /* 28A08 80038A08 A416020C */  jal        FileLen__6FileIOPCc
    /* 28A0C 80038A0C 21282002 */   addu      $a1, $s1, $zero
    /* 28A10 80038A10 B10A4228 */  slti       $v0, $v0, 0xAB1
    /* 28A14 80038A14 07004014 */  bnez       $v0, .L80038A34
    /* 28A18 80038A18 21200002 */   addu      $a0, $s0, $zero
    /* 28A1C 80038A1C 21200000 */  addu       $a0, $zero, $zero
    /* 28A20 80038A20 1180053C */  lui        $a1, %hi(D_80111164)
    /* 28A24 80038A24 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 28A28 80038A28 A583000C */  jal        DBG_Error
    /* 28A2C 80038A2C 9D090624 */   addiu     $a2, $zero, 0x99D
    /* 28A30 80038A30 21200002 */  addu       $a0, $s0, $zero
  .L80038A34:
    /* 28A34 80038A34 21282002 */  addu       $a1, $s1, $zero
    /* 28A38 80038A38 0D80063C */  lui        $a2, %hi(pMegaTiles)
    /* 28A3C 80038A3C ACECC624 */  addiu      $a2, $a2, %lo(pMegaTiles)
    /* 28A40 80038A40 FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 28A44 80038A44 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 28A48 80038A48 05004014 */  bnez       $v0, .L80038A60
    /* 28A4C 80038A4C 21200000 */   addu      $a0, $zero, $zero
    /* 28A50 80038A50 1180053C */  lui        $a1, %hi(D_80111164)
    /* 28A54 80038A54 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 28A58 80038A58 A583000C */  jal        DBG_Error
    /* 28A5C 80038A5C A0090624 */   addiu     $a2, $zero, 0x9A0
  .L80038A60:
    /* 28A60 80038A60 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28A64 80038A64 1400B18F */  lw         $s1, 0x14($sp)
    /* 28A68 80038A68 1000B08F */  lw         $s0, 0x10($sp)
    /* 28A6C 80038A6C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28A70 80038A70 0800E003 */  jr         $ra
    /* 28A74 80038A74 00000000 */   nop
endlabel LoadMegaTiles__FPCc
