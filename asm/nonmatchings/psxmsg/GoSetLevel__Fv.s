.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoSetLevel__Fv, 0x98

glabel GoSetLevel__Fv
    /* 86F98 80096F98 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 86F9C 80096F9C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 86FA0 80096FA0 5F5D020C */  jal        LevelToLevelInit__Fv
    /* 86FA4 80096FA4 00000000 */   nop
    /* 86FA8 80096FA8 1280023C */  lui        $v0, %hi(currlevel)
    /* 86FAC 80096FAC 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 86FB0 80096FB0 00000000 */  nop
    /* 86FB4 80096FB4 03004010 */  beqz       $v0, .L80096FC4
    /* 86FB8 80096FB8 1100422C */   sltiu     $v0, $v0, 0x11
    /* 86FBC 80096FBC 06004014 */  bnez       $v0, .L80096FD8
    /* 86FC0 80096FC0 00000000 */   nop
  .L80096FC4:
    /* 86FC4 80096FC4 21200000 */  addu       $a0, $zero, $zero
    /* 86FC8 80096FC8 1180053C */  lui        $a1, %hi(D_8011071C)
    /* 86FCC 80096FCC 1C07A524 */  addiu      $a1, $a1, %lo(D_8011071C)
    /* 86FD0 80096FD0 A583000C */  jal        DBG_Error
    /* 86FD4 80096FD4 BC010624 */   addiu     $a2, $zero, 0x1BC
  .L80096FD8:
    /* 86FD8 80096FD8 0E80023C */  lui        $v0, %hi(quests + 0x13B)
    /* 86FDC 80096FDC 7BDB4290 */  lbu        $v0, %lo(quests + 0x13B)($v0)
    /* 86FE0 80096FE0 00000000 */  nop
    /* 86FE4 80096FE4 0700422C */  sltiu      $v0, $v0, 0x7
    /* 86FE8 80096FE8 0A004010 */  beqz       $v0, .L80097014
    /* 86FEC 80096FEC 05000224 */   addiu     $v0, $zero, 0x5
    /* 86FF0 80096FF0 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 86FF4 80096FF4 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 86FF8 80096FF8 00000000 */  nop
    /* 86FFC 80096FFC 05006214 */  bne        $v1, $v0, .L80097014
    /* 87000 80097000 00000000 */   nop
    /* 87004 80097004 1180043C */  lui        $a0, %hi(D_80110730)
    /* 87008 80097008 30078424 */  addiu      $a0, $a0, %lo(D_80110730)
    /* 8700C 8009700C 4AB4020C */  jal        play_movie
    /* 87010 80097010 00000000 */   nop
  .L80097014:
    /* 87014 80097014 FC05848F */  lw         $a0, %gp_rel(D_8011AD7C)($gp)
    /* 87018 80097018 D692020C */  jal        PutUpCutScreen__Fi
    /* 8701C 8009701C 00000000 */   nop
    /* 87020 80097020 1000BF8F */  lw         $ra, 0x10($sp)
    /* 87024 80097024 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87028 80097028 0800E003 */  jr         $ra
    /* 8702C 8009702C 00000000 */   nop
endlabel GoSetLevel__Fv
