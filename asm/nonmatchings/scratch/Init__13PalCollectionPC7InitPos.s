.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__13PalCollectionPC7InitPos, 0x90

glabel Init__13PalCollectionPC7InitPos
    /* 8AD64 8009AD64 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8AD68 8009AD68 2000B4AF */  sw         $s4, 0x20($sp)
    /* 8AD6C 8009AD6C 21A08000 */  addu       $s4, $a0, $zero
    /* 8AD70 8009AD70 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8AD74 8009AD74 2180A000 */  addu       $s0, $a1, $zero
    /* 8AD78 8009AD78 2400BFAF */  sw         $ra, 0x24($sp)
    /* 8AD7C 8009AD7C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8AD80 8009AD80 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8AD84 8009AD84 466C020C */  jal        Init__t10Collection2Z8PalEntryi20
    /* 8AD88 8009AD88 1400B1AF */   sw        $s1, 0x14($sp)
    /* 8AD8C 8009AD8C 21980000 */  addu       $s3, $zero, $zero
    /* 8AD90 8009AD90 21900002 */  addu       $s2, $s0, $zero
    /* 8AD94 8009AD94 04001124 */  addiu      $s1, $zero, 0x4
  .L8009AD98:
    /* 8AD98 8009AD98 356C020C */  jal        GetNumOfObjs__t10Collection2Z8PalEntryi20
    /* 8AD9C 8009AD9C 21208002 */   addu      $a0, $s4, $zero
    /* 8ADA0 8009ADA0 2A106202 */  slt        $v0, $s3, $v0
    /* 8ADA4 8009ADA4 0A004010 */  beqz       $v0, .L8009ADD0
    /* 8ADA8 8009ADA8 21809102 */   addu      $s0, $s4, $s1
    /* 8ADAC 8009ADAC 21200002 */  addu       $a0, $s0, $zero
    /* 8ADB0 8009ADB0 906C020C */  jal        Set__8PalEntryRC7InitPos
    /* 8ADB4 8009ADB4 21284002 */   addu      $a1, $s2, $zero
    /* 8ADB8 8009ADB8 9D6C020C */  jal        Init__8PalEntry
    /* 8ADBC 8009ADBC 21200002 */   addu      $a0, $s0, $zero
    /* 8ADC0 8009ADC0 04005226 */  addiu      $s2, $s2, 0x4
    /* 8ADC4 8009ADC4 18003126 */  addiu      $s1, $s1, 0x18
    /* 8ADC8 8009ADC8 666B0208 */  j          .L8009AD98
    /* 8ADCC 8009ADCC 01007326 */   addiu     $s3, $s3, 0x1
  .L8009ADD0:
    /* 8ADD0 8009ADD0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 8ADD4 8009ADD4 2000B48F */  lw         $s4, 0x20($sp)
    /* 8ADD8 8009ADD8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 8ADDC 8009ADDC 1800B28F */  lw         $s2, 0x18($sp)
    /* 8ADE0 8009ADE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 8ADE4 8009ADE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 8ADE8 8009ADE8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8ADEC 8009ADEC 0800E003 */  jr         $ra
    /* 8ADF0 8009ADF0 00000000 */   nop
endlabel Init__13PalCollectionPC7InitPos
