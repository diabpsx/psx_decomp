.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateLevel__Fi, 0xF8

glabel CreateLevel__Fi
    /* 28A98 80038A98 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 28A9C 80038A9C 1000A4AF */  sw         $a0, 0x10($sp)
    /* 28AA0 80038AA0 0100043C */  lui        $a0, (0x14000 >> 16)
    /* 28AA4 80038AA4 00408434 */  ori        $a0, $a0, (0x14000 & 0xFFFF)
    /* 28AA8 80038AA8 1280063C */  lui        $a2, %hi(D_8011B7D0)
    /* 28AAC 80038AAC D0B7C624 */  addiu      $a2, $a2, %lo(D_8011B7D0)
    /* 28AB0 80038AB0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 28AB4 80038AB4 7785000C */  jal        GAL_Alloc
    /* 28AB8 80038AB8 01000524 */   addiu     $a1, $zero, 0x1
    /* 28ABC 80038ABC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 28AC0 80038AC0 1800A78F */  lw         $a3, 0x18($sp)
    /* 28AC4 80038AC4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 28AC8 80038AC8 0500E214 */  bne        $a3, $v0, .L80038AE0
    /* 28ACC 80038ACC 21200000 */   addu      $a0, $zero, $zero
    /* 28AD0 80038AD0 1180053C */  lui        $a1, %hi(D_80111164)
    /* 28AD4 80038AD4 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 28AD8 80038AD8 A583000C */  jal        DBG_Error
    /* 28ADC 80038ADC CF090624 */   addiu     $a2, $zero, 0x9CF
  .L80038AE0:
    /* 28AE0 80038AE0 1800A48F */  lw         $a0, 0x18($sp)
    /* 28AE4 80038AE4 DD85000C */  jal        GAL_Lock
    /* 28AE8 80038AE8 00000000 */   nop
    /* 28AEC 80038AEC 342082AF */  sw         $v0, %gp_rel(D_8011C7B4)($gp)
    /* 28AF0 80038AF0 07004014 */  bnez       $v0, .L80038B10
    /* 28AF4 80038AF4 0100033C */   lui       $v1, (0x13FFC >> 16)
    /* 28AF8 80038AF8 21200000 */  addu       $a0, $zero, $zero
    /* 28AFC 80038AFC 1180053C */  lui        $a1, %hi(D_80111164)
    /* 28B00 80038B00 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 28B04 80038B04 A583000C */  jal        DBG_Error
    /* 28B08 80038B08 D2090624 */   addiu     $a2, $zero, 0x9D2
    /* 28B0C 80038B0C 0100033C */  lui        $v1, (0x13FFC >> 16)
  .L80038B10:
    /* 28B10 80038B10 FC3F6334 */  ori        $v1, $v1, (0x13FFC & 0xFFFF)
    /* 28B14 80038B14 3420828F */  lw         $v0, %gp_rel(D_8011C7B4)($gp)
    /* 28B18 80038B18 1380043C */  lui        $a0, %hi(D_8012EC28)
    /* 28B1C 80038B1C 28EC8424 */  addiu      $a0, $a0, %lo(D_8012EC28)
    /* 28B20 80038B20 21104300 */  addu       $v0, $v0, $v1
    /* 28B24 80038B24 342082AF */  sw         $v0, %gp_rel(D_8011C7B4)($gp)
    /* 28B28 80038B28 DB40000C */  jal        setjmp
    /* 28B2C 80038B2C 00000000 */   nop
    /* 28B30 80038B30 09004014 */  bnez       $v0, .L80038B58
    /* 28B34 80038B34 00000000 */   nop
    /* 28B38 80038B38 0480053C */  lui        $a1, %hi(LoCreateLevel__FPv)
    /* 28B3C 80038B3C 908BA524 */  addiu      $a1, $a1, %lo(LoCreateLevel__FPv)
    /* 28B40 80038B40 3420848F */  lw         $a0, %gp_rel(D_8011C7B4)($gp)
    /* 28B44 80038B44 1000A78F */  lw         $a3, 0x10($sp)
    /* 28B48 80038B48 00000000 */  nop
    /* 28B4C 80038B4C 302087AF */  sw         $a3, %gp_rel(D_8011C7B0)($gp)
    /* 28B50 80038B50 5F84000C */  jal        GSYS_SetStackAndJump
    /* 28B54 80038B54 21300000 */   addu      $a2, $zero, $zero
  .L80038B58:
    /* 28B58 80038B58 1800A48F */  lw         $a0, 0x18($sp)
    /* 28B5C 80038B5C 1886000C */  jal        GAL_Free
    /* 28B60 80038B60 00000000 */   nop
    /* 28B64 80038B64 FF004230 */  andi       $v0, $v0, 0xFF
    /* 28B68 80038B68 05004014 */  bnez       $v0, .L80038B80
    /* 28B6C 80038B6C 21200000 */   addu      $a0, $zero, $zero
    /* 28B70 80038B70 1180053C */  lui        $a1, %hi(D_80111164)
    /* 28B74 80038B74 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 28B78 80038B78 A583000C */  jal        DBG_Error
    /* 28B7C 80038B7C DD090624 */   addiu     $a2, $zero, 0x9DD
  .L80038B80:
    /* 28B80 80038B80 2000BF8F */  lw         $ra, 0x20($sp)
    /* 28B84 80038B84 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 28B88 80038B88 0800E003 */  jr         $ra
    /* 28B8C 80038B8C 00000000 */   nop
endlabel CreateLevel__Fi
