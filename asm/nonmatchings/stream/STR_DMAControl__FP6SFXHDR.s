.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_DMAControl__FP6SFXHDR, 0xC8

glabel STR_DMAControl__FP6SFXHDR
    /* 89664 80099664 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 89668 80099668 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8966C 8009966C 21988000 */  addu       $s3, $a0, $zero
    /* 89670 80099670 2400BFAF */  sw         $ra, 0x24($sp)
    /* 89674 80099674 2000B4AF */  sw         $s4, 0x20($sp)
    /* 89678 80099678 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8967C 8009967C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 89680 80099680 1000B0AF */  sw         $s0, 0x10($sp)
    /* 89684 80099684 2000628E */  lw         $v0, 0x20($s3)
    /* 89688 80099688 5C00638E */  lw         $v1, 0x5C($s3)
    /* 8968C 8009968C FFFF5224 */  addiu      $s2, $v0, -0x1
    /* 89690 80099690 802F0224 */  addiu      $v0, $zero, 0x2F80
    /* 89694 80099694 02004106 */  bgez       $s2, .L800996A0
    /* 89698 80099698 23A04300 */   subu      $s4, $v0, $v1
    /* 8969C 8009969C 02001224 */  addiu      $s2, $zero, 0x2
  .L800996A0:
    /* 896A0 800996A0 19006018 */  blez       $v1, .L80099708
    /* 896A4 800996A4 21200000 */   addu      $a0, $zero, $zero
    /* 896A8 800996A8 40801200 */  sll        $s0, $s2, 1
    /* 896AC 800996AC 21801202 */  addu       $s0, $s0, $s2
    /* 896B0 800996B0 00131000 */  sll        $v0, $s0, 12
    /* 896B4 800996B4 6800718E */  lw         $s1, 0x68($s3)
    /* 896B8 800996B8 21105400 */  addu       $v0, $v0, $s4
    /* 896BC 800996BC 80003126 */  addiu      $s1, $s1, 0x80
    /* 896C0 800996C0 C763000C */  jal        SpuSetTransferMode
    /* 896C4 800996C4 21882202 */   addu      $s1, $s1, $v0
    /* 896C8 800996C8 40811000 */  sll        $s0, $s0, 5
    /* 896CC 800996CC 23801202 */  subu       $s0, $s0, $s2
    /* 896D0 800996D0 4000648E */  lw         $a0, 0x40($s3)
    /* 896D4 800996D4 C0811000 */  sll        $s0, $s0, 7
    /* 896D8 800996D8 21209000 */  addu       $a0, $a0, $s0
    /* 896DC 800996DC AF63000C */  jal        SpuSetTransferStartAddr
    /* 896E0 800996E0 21209400 */   addu      $a0, $a0, $s4
    /* 896E4 800996E4 21202002 */  addu       $a0, $s1, $zero
    /* 896E8 800996E8 3F63000C */  jal        SpuWrite
    /* 896EC 800996EC C0170524 */   addiu     $a1, $zero, 0x17C0
    /* 896F0 800996F0 D363000C */  jal        SpuIsTransferCompleted
    /* 896F4 800996F4 01000424 */   addiu     $a0, $zero, 0x1
    /* 896F8 800996F8 5C00628E */  lw         $v0, 0x5C($s3)
    /* 896FC 800996FC 00000000 */  nop
    /* 89700 80099700 40E84224 */  addiu      $v0, $v0, -0x17C0
    /* 89704 80099704 5C0062AE */  sw         $v0, 0x5C($s3)
  .L80099708:
    /* 89708 80099708 2400BF8F */  lw         $ra, 0x24($sp)
    /* 8970C 8009970C 2000B48F */  lw         $s4, 0x20($sp)
    /* 89710 80099710 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 89714 80099714 1800B28F */  lw         $s2, 0x18($sp)
    /* 89718 80099718 1400B18F */  lw         $s1, 0x14($sp)
    /* 8971C 8009971C 1000B08F */  lw         $s0, 0x10($sp)
    /* 89720 80099720 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 89724 80099724 0800E003 */  jr         $ra
    /* 89728 80099728 00000000 */   nop
endlabel STR_DMAControl__FP6SFXHDR
