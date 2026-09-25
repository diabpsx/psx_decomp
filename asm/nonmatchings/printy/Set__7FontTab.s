.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Set__7FontTab, 0x9C

glabel Set__7FontTab
    /* 79C60 80089C60 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 79C64 80089C64 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 79C68 80089C68 21888000 */  addu       $s1, $a0, $zero
    /* 79C6C 80089C6C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 79C70 80089C70 21800000 */  addu       $s0, $zero, $zero
    /* 79C74 80089C74 2000BFAF */  sw         $ra, 0x20($sp)
  .L80089C78:
    /* 79C78 80089C78 0000248E */  lw         $a0, 0x0($s1)
    /* 79C7C 80089C7C 21280002 */  addu       $a1, $s0, $zero
    /* 79C80 80089C80 39300624 */  addiu      $a2, $zero, 0x3039
    /* 79C84 80089C84 C82A020C */  jal        SetChar__5CFontiUs
    /* 79C88 80089C88 01001026 */   addiu     $s0, $s0, 0x1
    /* 79C8C 80089C8C 0001022A */  slti       $v0, $s0, 0x100
    /* 79C90 80089C90 F9FF4014 */  bnez       $v0, .L80089C78
    /* 79C94 80089C94 00000000 */   nop
    /* 79C98 80089C98 0800228E */  lw         $v0, 0x8($s1)
    /* 79C9C 80089C9C 00000000 */  nop
    /* 79CA0 80089CA0 10004018 */  blez       $v0, .L80089CE4
    /* 79CA4 80089CA4 21800000 */   addu      $s0, $zero, $zero
    /* 79CA8 80089CA8 80101000 */  sll        $v0, $s0, 2
  .L80089CAC:
    /* 79CAC 80089CAC 0400238E */  lw         $v1, 0x4($s1)
    /* 79CB0 80089CB0 0000248E */  lw         $a0, 0x0($s1)
    /* 79CB4 80089CB4 21104300 */  addu       $v0, $v0, $v1
    /* 79CB8 80089CB8 0C00238E */  lw         $v1, 0xC($s1)
    /* 79CBC 80089CBC 02004694 */  lhu        $a2, 0x2($v0)
    /* 79CC0 80089CC0 00004590 */  lbu        $a1, 0x0($v0)
    /* 79CC4 80089CC4 2130C300 */  addu       $a2, $a2, $v1
    /* 79CC8 80089CC8 C82A020C */  jal        SetChar__5CFontiUs
    /* 79CCC 80089CCC FFFFC630 */   andi      $a2, $a2, 0xFFFF
    /* 79CD0 80089CD0 0800228E */  lw         $v0, 0x8($s1)
    /* 79CD4 80089CD4 01001026 */  addiu      $s0, $s0, 0x1
    /* 79CD8 80089CD8 2A100202 */  slt        $v0, $s0, $v0
    /* 79CDC 80089CDC F3FF4014 */  bnez       $v0, .L80089CAC
    /* 79CE0 80089CE0 80101000 */   sll       $v0, $s0, 2
  .L80089CE4:
    /* 79CE4 80089CE4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 79CE8 80089CE8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 79CEC 80089CEC 1800B08F */  lw         $s0, 0x18($sp)
    /* 79CF0 80089CF0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 79CF4 80089CF4 0800E003 */  jr         $ra
    /* 79CF8 80089CF8 00000000 */   nop
endlabel Set__7FontTab
