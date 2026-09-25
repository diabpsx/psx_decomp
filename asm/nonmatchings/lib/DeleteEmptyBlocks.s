.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeleteEmptyBlocks, 0x6C

glabel DeleteEmptyBlocks
    /* 12BC8 80022BC8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 12BCC 80022BCC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12BD0 80022BD0 21888000 */  addu       $s1, $a0, $zero
    /* 12BD4 80022BD4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 12BD8 80022BD8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12BDC 80022BDC 2000228E */  lw         $v0, 0x20($s1)
    /* 12BE0 80022BE0 00000000 */  nop
    /* 12BE4 80022BE4 0D004010 */  beqz       $v0, .L80022C1C
    /* 12BE8 80022BE8 00000000 */   nop
  .L80022BEC:
    /* 12BEC 80022BEC 2000308E */  lw         $s0, 0x20($s1)
    /* 12BF0 80022BF0 20002426 */  addiu      $a0, $s1, 0x20
    /* 12BF4 80022BF4 A386000C */  jal        DetachHdrFromList
    /* 12BF8 80022BF8 21280002 */   addu      $a1, $s0, $zero
    /* 12BFC 80022BFC 1280043C */  lui        $a0, %hi(D_8011C9D0)
    /* 12C00 80022C00 D0C98424 */  addiu      $a0, $a0, %lo(D_8011C9D0)
    /* 12C04 80022C04 9B86000C */  jal        AttachHdrToList
    /* 12C08 80022C08 21280002 */   addu      $a1, $s0, $zero
    /* 12C0C 80022C0C 2000228E */  lw         $v0, 0x20($s1)
    /* 12C10 80022C10 00000000 */  nop
    /* 12C14 80022C14 F5FF4014 */  bnez       $v0, .L80022BEC
    /* 12C18 80022C18 00000000 */   nop
  .L80022C1C:
    /* 12C1C 80022C1C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 12C20 80022C20 1400B18F */  lw         $s1, 0x14($sp)
    /* 12C24 80022C24 1000B08F */  lw         $s0, 0x10($sp)
    /* 12C28 80022C28 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 12C2C 80022C2C 0800E003 */  jr         $ra
    /* 12C30 80022C30 00000000 */   nop
endlabel DeleteEmptyBlocks
