.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delasync, 0x74

glabel delasync
    /* 13A84 80023A84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 13A88 80023A88 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13A8C 80023A8C 1380103C */  lui        $s0, %hi(D_8013504C)
    /* 13A90 80023A90 4C50108E */  lw         $s0, %lo(D_8013504C)($s0)
    /* 13A94 80023A94 00000000 */  nop
    /* 13A98 80023A98 0E000016 */  bnez       $s0, .L80023AD4
    /* 13A9C 80023A9C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 13AA0 80023AA0 1180043C */  lui        $a0, %hi(D_8010E980)
    /* 13AA4 80023AA4 80E98424 */  addiu      $a0, $a0, %lo(D_8010E980)
    /* 13AA8 80023AA8 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 13AAC 80023AAC 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 13AB0 80023AB0 1280013C */  lui        $at, %hi(abortfile)
    /* 13AB4 80023AB4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 13AB8 80023AB8 69020224 */  addiu      $v0, $zero, 0x269
    /* 13ABC 80023ABC 1280013C */  lui        $at, %hi(abortline)
    /* 13AC0 80023AC0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 13AC4 80023AC4 0F95000C */  jal        abortmessage
    /* 13AC8 80023AC8 00000000 */   nop
    /* 13ACC 80023ACC B98E0008 */  j          .L80023AE4
    /* 13AD0 80023AD0 00000000 */   nop
  .L80023AD4:
    /* 13AD4 80023AD4 6A8E000C */  jal        delasyncstruct
    /* 13AD8 80023AD8 00000000 */   nop
    /* 13ADC 80023ADC B9AB000C */  jal        purgememadr
    /* 13AE0 80023AE0 21200002 */   addu      $a0, $s0, $zero
  .L80023AE4:
    /* 13AE4 80023AE4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 13AE8 80023AE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 13AEC 80023AEC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13AF0 80023AF0 0800E003 */  jr         $ra
    /* 13AF4 80023AF4 00000000 */   nop
endlabel delasync
