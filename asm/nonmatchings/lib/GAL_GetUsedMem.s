.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetUsedMem, 0x74

glabel GAL_GetUsedMem
    /* 1197C 8002197C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 11980 80021980 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 11984 80021984 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 11988 80021988 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1198C 8002198C 21800000 */  addu       $s0, $zero, $zero
    /* 11990 80021990 1400BFAF */  sw         $ra, 0x14($sp)
    /* 11994 80021994 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 11998 80021998 24208200 */   and       $a0, $a0, $v0
    /* 1199C 8002199C 0C004010 */  beqz       $v0, .L800219D0
    /* 119A0 800219A0 00000000 */   nop
    /* 119A4 800219A4 2400438C */  lw         $v1, 0x24($v0)
    /* 119A8 800219A8 00000000 */  nop
    /* 119AC 800219AC 0B006010 */  beqz       $v1, .L800219DC
    /* 119B0 800219B0 21100002 */   addu      $v0, $s0, $zero
  .L800219B4:
    /* 119B4 800219B4 0C00628C */  lw         $v0, 0xC($v1)
    /* 119B8 800219B8 0400638C */  lw         $v1, 0x4($v1)
    /* 119BC 800219BC 00000000 */  nop
    /* 119C0 800219C0 FCFF6014 */  bnez       $v1, .L800219B4
    /* 119C4 800219C4 21800202 */   addu      $s0, $s0, $v0
    /* 119C8 800219C8 77860008 */  j          .L800219DC
    /* 119CC 800219CC 21100002 */   addu      $v0, $s0, $zero
  .L800219D0:
    /* 119D0 800219D0 0389000C */  jal        GSetError
    /* 119D4 800219D4 04000434 */   ori       $a0, $zero, 0x4
    /* 119D8 800219D8 21100002 */  addu       $v0, $s0, $zero
  .L800219DC:
    /* 119DC 800219DC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 119E0 800219E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 119E4 800219E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 119E8 800219E8 0800E003 */  jr         $ra
    /* 119EC 800219EC 00000000 */   nop
endlabel GAL_GetUsedMem
