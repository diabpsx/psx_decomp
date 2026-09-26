.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLevels__Fv, 0x44

glabel InitLevels__Fv
    /* 21FD0 8015BBC8 1280023C */  lui        $v0, %hi(leveldebug)
    /* 21FD4 8015BBCC 98B74290 */  lbu        $v0, %lo(leveldebug)($v0)
    /* 21FD8 8015BBD0 00000000 */  nop
    /* 21FDC 8015BBD4 04004014 */  bnez       $v0, .L8015BBE8
    /* 21FE0 8015BBD8 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 21FE4 8015BBDC 8C1980A3 */  sb         $zero, %gp_rel(currlevel)($gp)
    /* 21FE8 8015BBE0 8D1980A3 */  sb         $zero, %gp_rel(leveltype)($gp)
    /* 21FEC 8015BBE4 8E1980A3 */  sb         $zero, %gp_rel(setlevel)($gp)
  .L8015BBE8:
    /* 21FF0 8015BBE8 0F000324 */  addiu      $v1, $zero, 0xF
    /* 21FF4 8015BBEC 1080023C */  lui        $v0, %hi(nSxy + 0x3C)
    /* 21FF8 8015BBF0 24274224 */  addiu      $v0, $v0, %lo(nSxy + 0x3C)
  .L8015BBF4:
    /* 21FFC 8015BBF4 000044AC */  sw         $a0, 0x0($v0)
    /* 22000 8015BBF8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 22004 8015BBFC FDFF6104 */  bgez       $v1, .L8015BBF4
    /* 22008 8015BC00 FCFF4224 */   addiu     $v0, $v0, -0x4
    /* 2200C 8015BC04 0800E003 */  jr         $ra
    /* 22010 8015BC08 00000000 */   nop
endlabel InitLevels__Fv
