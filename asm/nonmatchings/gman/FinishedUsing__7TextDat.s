.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FinishedUsing__7TextDat, 0x98

glabel FinishedUsing__7TextDat
    /* 822D0 800922D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 822D4 800922D4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 822D8 800922D8 21808000 */  addu       $s0, $a0, $zero
    /* 822DC 800922DC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 822E0 800922E0 4400028E */  lw         $v0, 0x44($s0)
    /* 822E4 800922E4 00000000 */  nop
    /* 822E8 800922E8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 822EC 800922EC 14004014 */  bnez       $v0, .L80092340
    /* 822F0 800922F0 440002AE */   sw        $v0, 0x44($s0)
    /* 822F4 800922F4 4800048E */  lw         $a0, 0x48($s0)
    /* 822F8 800922F8 E554020C */  jal        HasDat__C13CTextFileInfo
    /* 822FC 800922FC 00000000 */   nop
    /* 82300 80092300 0D004010 */  beqz       $v0, .L80092338
    /* 82304 80092304 00000000 */   nop
    /* 82308 80092308 2800028E */  lw         $v0, 0x28($s0)
    /* 8230C 8009230C 00000000 */  nop
    /* 82310 80092310 0000428C */  lw         $v0, 0x0($v0)
    /* 82314 80092314 00000000 */  nop
    /* 82318 80092318 07004010 */  beqz       $v0, .L80092338
    /* 8231C 8009231C 00000000 */   nop
    /* 82320 80092320 0091020C */  jal        DEC_RemoveAsDecRequestor__FP7TextDat
    /* 82324 80092324 21200002 */   addu      $a0, $s0, $zero
    /* 82328 80092328 D14F020C */  jal        DoDecompRequests__7TextDat
    /* 8232C 8009232C 21200002 */   addu      $a0, $s0, $zero
    /* 82330 80092330 D14F020C */  jal        DoDecompRequests__7TextDat
    /* 82334 80092334 21200002 */   addu      $a0, $s0, $zero
  .L80092338:
    /* 82338 80092338 A14E020C */  jal        DumpData__7TextDat
    /* 8233C 8009233C 21200002 */   addu      $a0, $s0, $zero
  .L80092340:
    /* 82340 80092340 4400028E */  lw         $v0, 0x44($s0)
    /* 82344 80092344 00000000 */  nop
    /* 82348 80092348 02004104 */  bgez       $v0, .L80092354
    /* 8234C 8009234C 00000000 */   nop
    /* 82350 80092350 440000AE */  sw         $zero, 0x44($s0)
  .L80092354:
    /* 82354 80092354 1400BF8F */  lw         $ra, 0x14($sp)
    /* 82358 80092358 1000B08F */  lw         $s0, 0x10($sp)
    /* 8235C 8009235C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 82360 80092360 0800E003 */  jr         $ra
    /* 82364 80092364 00000000 */   nop
endlabel FinishedUsing__7TextDat
