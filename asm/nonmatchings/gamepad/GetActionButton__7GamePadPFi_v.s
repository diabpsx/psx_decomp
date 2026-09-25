.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetActionButton__7GamePadPFi_v, 0x5C

glabel GetActionButton__7GamePadPFi_v
    /* 68AE0 80078AE0 D0008690 */  lbu        $a2, 0xD0($a0)
    /* 68AE4 80078AE4 0D80033C */  lui        $v1, %hi(pad_txt + 0x4)
    /* 68AE8 80078AE8 68C36324 */  addiu      $v1, $v1, %lo(pad_txt + 0x4)
    /* 68AEC 80078AEC A8006724 */  addiu      $a3, $v1, 0xA8
  .L80078AF0:
    /* 68AF0 80078AF0 0400C010 */  beqz       $a2, .L80078B04
    /* 68AF4 80078AF4 00000000 */   nop
    /* 68AF8 80078AF8 9800828C */  lw         $v0, 0x98($a0)
    /* 68AFC 80078AFC C2E20108 */  j          .L80078B08
    /* 68B00 80078B00 00000000 */   nop
  .L80078B04:
    /* 68B04 80078B04 6000828C */  lw         $v0, 0x60($a0)
  .L80078B08:
    /* 68B08 80078B08 00000000 */  nop
    /* 68B0C 80078B0C 04004514 */  bne        $v0, $a1, .L80078B20
    /* 68B10 80078B10 00000000 */   nop
    /* 68B14 80078B14 0000628C */  lw         $v0, 0x0($v1)
    /* 68B18 80078B18 CDE20108 */  j          .L80078B34
    /* 68B1C 80078B1C 00000000 */   nop
  .L80078B20:
    /* 68B20 80078B20 0C006324 */  addiu      $v1, $v1, 0xC
    /* 68B24 80078B24 2A106700 */  slt        $v0, $v1, $a3
    /* 68B28 80078B28 F1FF4014 */  bnez       $v0, .L80078AF0
    /* 68B2C 80078B2C 04008424 */   addiu     $a0, $a0, 0x4
    /* 68B30 80078B30 21100000 */  addu       $v0, $zero, $zero
  .L80078B34:
    /* 68B34 80078B34 0800E003 */  jr         $ra
    /* 68B38 80078B38 00000000 */   nop
endlabel GetActionButton__7GamePadPFi_v
