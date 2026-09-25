.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_FindSFX__FUs, 0xDC

glabel SND_FindSFX__FUs
    /* 8A5DC 8009A5DC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8A5E0 8009A5E0 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8A5E4 8009A5E4 21908000 */  addu       $s2, $a0, $zero
    /* 8A5E8 8009A5E8 7C06848F */  lw         $a0, %gp_rel(D_8011ADFC)($gp)
    /* 8A5EC 8009A5EC 2400BFAF */  sw         $ra, 0x24($sp)
    /* 8A5F0 8009A5F0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8A5F4 8009A5F4 DD85000C */  jal        GAL_Lock
    /* 8A5F8 8009A5F8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 8A5FC 8009A5FC 21884000 */  addu       $s1, $v0, $zero
    /* 8A600 8009A600 07002016 */  bnez       $s1, .L8009A620
    /* 8A604 8009A604 FFFF1024 */   addiu     $s0, $zero, -0x1
    /* 8A608 8009A608 21200000 */  addu       $a0, $zero, $zero
    /* 8A60C 8009A60C 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A610 8009A610 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A614 8009A614 A583000C */  jal        DBG_Error
    /* 8A618 8009A618 A0010624 */   addiu     $a2, $zero, 0x1A0
    /* 8A61C 8009A61C FFFF1024 */  addiu      $s0, $zero, -0x1
  .L8009A620:
    /* 8A620 8009A620 2C1F8297 */  lhu        $v0, %gp_rel(D_8011C6AC)($gp)
    /* 8A624 8009A624 00000000 */  nop
    /* 8A628 8009A628 10004018 */  blez       $v0, .L8009A66C
    /* 8A62C 8009A62C 21180000 */   addu      $v1, $zero, $zero
    /* 8A630 8009A630 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 8A634 8009A634 FFFF4432 */  andi       $a0, $s2, 0xFFFF
    /* 8A638 8009A638 21304000 */  addu       $a2, $v0, $zero
    /* 8A63C 8009A63C 21282002 */  addu       $a1, $s1, $zero
  .L8009A640:
    /* 8A640 8009A640 0A000716 */  bne        $s0, $a3, .L8009A66C
    /* 8A644 8009A644 00000000 */   nop
    /* 8A648 8009A648 0000A294 */  lhu        $v0, 0x0($a1)
    /* 8A64C 8009A64C 00000000 */  nop
    /* 8A650 8009A650 02004414 */  bne        $v0, $a0, .L8009A65C
    /* 8A654 8009A654 00000000 */   nop
    /* 8A658 8009A658 21806000 */  addu       $s0, $v1, $zero
  .L8009A65C:
    /* 8A65C 8009A65C 01006324 */  addiu      $v1, $v1, 0x1
    /* 8A660 8009A660 2A106600 */  slt        $v0, $v1, $a2
    /* 8A664 8009A664 F6FF4014 */  bnez       $v0, .L8009A640
    /* 8A668 8009A668 0C00A524 */   addiu     $a1, $a1, 0xC
  .L8009A66C:
    /* 8A66C 8009A66C 7C06848F */  lw         $a0, %gp_rel(D_8011ADFC)($gp)
    /* 8A670 8009A670 F785000C */  jal        GAL_Unlock
    /* 8A674 8009A674 00000000 */   nop
    /* 8A678 8009A678 FF004230 */  andi       $v0, $v0, 0xFF
    /* 8A67C 8009A67C 07004014 */  bnez       $v0, .L8009A69C
    /* 8A680 8009A680 21100002 */   addu      $v0, $s0, $zero
    /* 8A684 8009A684 21200000 */  addu       $a0, $zero, $zero
    /* 8A688 8009A688 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A68C 8009A68C 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A690 8009A690 A583000C */  jal        DBG_Error
    /* 8A694 8009A694 AB010624 */   addiu     $a2, $zero, 0x1AB
    /* 8A698 8009A698 21100002 */  addu       $v0, $s0, $zero
  .L8009A69C:
    /* 8A69C 8009A69C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 8A6A0 8009A6A0 2000B28F */  lw         $s2, 0x20($sp)
    /* 8A6A4 8009A6A4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8A6A8 8009A6A8 1800B08F */  lw         $s0, 0x18($sp)
    /* 8A6AC 8009A6AC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8A6B0 8009A6B0 0800E003 */  jr         $ra
    /* 8A6B4 8009A6B4 00000000 */   nop
endlabel SND_FindSFX__FUs
