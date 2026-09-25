.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_LoadBank__Fi, 0x124

glabel SND_LoadBank__Fi
    /* 8A4B8 8009A4B8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8A4BC 8009A4BC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 8A4C0 8009A4C0 21888000 */  addu       $s1, $a0, $zero
    /* 8A4C4 8009A4C4 3400BFAF */  sw         $ra, 0x34($sp)
    /* 8A4C8 8009A4C8 3000B2AF */  sw         $s2, 0x30($sp)
    /* 8A4CC 8009A4CC F468020C */  jal        SND_ClearBank__Fv
    /* 8A4D0 8009A4D0 2800B0AF */   sw        $s0, 0x28($sp)
    /* 8A4D4 8009A4D4 9768020C */  jal        SPU_Init__Fv
    /* 8A4D8 8009A4D8 00000000 */   nop
    /* 8A4DC 8009A4DC 1200222A */  slti       $v0, $s1, 0x12
    /* 8A4E0 8009A4E0 06004014 */  bnez       $v0, .L8009A4FC
    /* 8A4E4 8009A4E4 00000000 */   nop
    /* 8A4E8 8009A4E8 21200000 */  addu       $a0, $zero, $zero
    /* 8A4EC 8009A4EC 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A4F0 8009A4F0 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A4F4 8009A4F4 A583000C */  jal        DBG_Error
    /* 8A4F8 8009A4F8 34010624 */   addiu     $a2, $zero, 0x134
  .L8009A4FC:
    /* 8A4FC 8009A4FC 1800A427 */  addiu      $a0, $sp, 0x18
    /* 8A500 8009A500 1180053C */  lui        $a1, %hi(D_801109B0)
    /* 8A504 8009A504 B009A524 */  addiu      $a1, $a1, %lo(D_801109B0)
    /* 8A508 8009A508 9767000C */  jal        sprintf
    /* 8A50C 8009A50C 21302002 */   addu      $a2, $s1, $zero
    /* 8A510 8009A510 1D11020C */  jal        SYSI_GetFs__Fv
    /* 8A514 8009A514 FFFF1224 */   addiu     $s2, $zero, -0x1
    /* 8A518 8009A518 21804000 */  addu       $s0, $v0, $zero
    /* 8A51C 8009A51C 21200002 */  addu       $a0, $s0, $zero
    /* 8A520 8009A520 A416020C */  jal        FileLen__6FileIOPCc
    /* 8A524 8009A524 1800A527 */   addiu     $a1, $sp, 0x18
    /* 8A528 8009A528 EF5C000C */  jal        SpuMalloc
    /* 8A52C 8009A52C 21204000 */   addu      $a0, $v0, $zero
    /* 8A530 8009A530 800682AF */  sw         $v0, %gp_rel(D_8011AE00)($gp)
    /* 8A534 8009A534 07005214 */  bne        $v0, $s2, .L8009A554
    /* 8A538 8009A538 21200002 */   addu      $a0, $s0, $zero
    /* 8A53C 8009A53C 21200000 */  addu       $a0, $zero, $zero
    /* 8A540 8009A540 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A544 8009A544 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A548 8009A548 A583000C */  jal        DBG_Error
    /* 8A54C 8009A54C 41010624 */   addiu     $a2, $zero, 0x141
    /* 8A550 8009A550 21200002 */  addu       $a0, $s0, $zero
  .L8009A554:
    /* 8A554 8009A554 1800A527 */  addiu      $a1, $sp, 0x18
    /* 8A558 8009A558 00800634 */  ori        $a2, $zero, 0x8000
    /* 8A55C 8009A55C 0A80073C */  lui        $a3, %hi(SndLoadCallBack__FPUciib)
    /* 8A560 8009A560 40A4E724 */  addiu      $a3, $a3, %lo(SndLoadCallBack__FPUciib)
    /* 8A564 8009A564 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8A568 8009A568 C516020C */  jal        StreamFile__6FileIOPCciPFPUciib_bii
    /* 8A56C 8009A56C 1400B2AF */   sw        $s2, 0x14($sp)
    /* 8A570 8009A570 1800A427 */  addiu      $a0, $sp, 0x18
    /* 8A574 8009A574 1180053C */  lui        $a1, %hi(D_801109BC)
    /* 8A578 8009A578 BC09A524 */  addiu      $a1, $a1, %lo(D_801109BC)
    /* 8A57C 8009A57C 9767000C */  jal        sprintf
    /* 8A580 8009A580 21302002 */   addu      $a2, $s1, $zero
    /* 8A584 8009A584 21200002 */  addu       $a0, $s0, $zero
    /* 8A588 8009A588 1800A527 */  addiu      $a1, $sp, 0x18
    /* 8A58C 8009A58C 4816020C */  jal        Read__6FileIOPCcUl
    /* 8A590 8009A590 01000624 */   addiu     $a2, $zero, 0x1
    /* 8A594 8009A594 21200002 */  addu       $a0, $s0, $zero
    /* 8A598 8009A598 7C0682AF */  sw         $v0, %gp_rel(D_8011ADFC)($gp)
    /* 8A59C 8009A59C A416020C */  jal        FileLen__6FileIOPCc
    /* 8A5A0 8009A5A0 1800A527 */   addiu     $a1, $sp, 0x18
    /* 8A5A4 8009A5A4 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 8A5A8 8009A5A8 AAAA033C */  lui        $v1, (0xAAAAAAAB >> 16)
    /* 8A5AC 8009A5AC ABAA6334 */  ori        $v1, $v1, (0xAAAAAAAB & 0xFFFF)
    /* 8A5B0 8009A5B0 19004300 */  multu      $v0, $v1
    /* 8A5B4 8009A5B4 10400000 */  mfhi       $t0
    /* 8A5B8 8009A5B8 C2100800 */  srl        $v0, $t0, 3
    /* 8A5BC 8009A5BC 2C1F82A7 */  sh         $v0, %gp_rel(D_8011C6AC)($gp)
    /* 8A5C0 8009A5C0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 8A5C4 8009A5C4 3000B28F */  lw         $s2, 0x30($sp)
    /* 8A5C8 8009A5C8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 8A5CC 8009A5CC 2800B08F */  lw         $s0, 0x28($sp)
    /* 8A5D0 8009A5D0 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8A5D4 8009A5D4 0800E003 */  jr         $ra
    /* 8A5D8 8009A5D8 00000000 */   nop
endlabel SND_LoadBank__Fi
