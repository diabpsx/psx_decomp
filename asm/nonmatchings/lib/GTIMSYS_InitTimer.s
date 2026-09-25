.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GTIMSYS_InitTimer, 0xC4

glabel GTIMSYS_InitTimer
    /* 10F38 80020F38 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 10F3C 80020F3C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 10F40 80020F40 1400B1AF */  sw         $s1, 0x14($sp)
    /* 10F44 80020F44 6346000C */  jal        EnterCriticalSection
    /* 10F48 80020F48 1000B0AF */   sw        $s0, 0x10($sp)
    /* 10F4C 80020F4C 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 10F50 80020F50 01008434 */  ori        $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 10F54 80020F54 FFFF0534 */  ori        $a1, $zero, 0xFFFF
    /* 10F58 80020F58 FF83000C */  jal        SetRCnt
    /* 10F5C 80020F5C 00200634 */   ori       $a2, $zero, 0x2000
    /* 10F60 80020F60 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 10F64 80020F64 3484000C */  jal        StartRCnt
    /* 10F68 80020F68 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 10F6C 80020F6C 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 10F70 80020F70 4D84000C */  jal        ResetRCnt
    /* 10F74 80020F74 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 10F78 80020F78 6746000C */  jal        ExitCriticalSection
    /* 10F7C 80020F7C 21800000 */   addu      $s0, $zero, $zero
    /* 10F80 80020F80 21880000 */  addu       $s1, $zero, $zero
  .L80020F84:
    /* 10F84 80020F84 1748000C */  jal        VSync
    /* 10F88 80020F88 21200000 */   addu      $a0, $zero, $zero
    /* 10F8C 80020F8C 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 10F90 80020F90 4D84000C */  jal        ResetRCnt
    /* 10F94 80020F94 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 10F98 80020F98 1748000C */  jal        VSync
    /* 10F9C 80020F9C 21200000 */   addu      $a0, $zero, $zero
    /* 10FA0 80020FA0 00F2043C */  lui        $a0, (0xF2000001 >> 16)
    /* 10FA4 80020FA4 2684000C */  jal        GetRCnt
    /* 10FA8 80020FA8 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
    /* 10FAC 80020FAC 21800202 */  addu       $s0, $s0, $v0
    /* 10FB0 80020FB0 01003126 */  addiu      $s1, $s1, 0x1
    /* 10FB4 80020FB4 0A00222A */  slti       $v0, $s1, 0xA
    /* 10FB8 80020FB8 F2FF4014 */  bnez       $v0, .L80020F84
    /* 10FBC 80020FBC CCCC023C */   lui       $v0, (0xCCCCCCCD >> 16)
    /* 10FC0 80020FC0 CDCC4234 */  ori        $v0, $v0, (0xCCCCCCCD & 0xFFFF)
    /* 10FC4 80020FC4 19000202 */  multu      $s0, $v0
    /* 10FC8 80020FC8 1180043C */  lui        $a0, %hi(D_8010E770)
    /* 10FCC 80020FCC 70E78424 */  addiu      $a0, $a0, %lo(D_8010E770)
    /* 10FD0 80020FD0 10100000 */  mfhi       $v0
    /* 10FD4 80020FD4 C2800200 */  srl        $s0, $v0, 3
    /* 10FD8 80020FD8 9B83000C */  jal        DBG_SendMessage
    /* 10FDC 80020FDC 21280002 */   addu      $a1, $s0, $zero
    /* 10FE0 80020FE0 21100002 */  addu       $v0, $s0, $zero
    /* 10FE4 80020FE4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 10FE8 80020FE8 1400B18F */  lw         $s1, 0x14($sp)
    /* 10FEC 80020FEC 1000B08F */  lw         $s0, 0x10($sp)
    /* 10FF0 80020FF0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 10FF4 80020FF4 0800E003 */  jr         $ra
    /* 10FF8 80020FF8 00000000 */   nop
endlabel GTIMSYS_InitTimer
