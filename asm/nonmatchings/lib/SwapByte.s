.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SwapByte, 0x50

glabel SwapByte
    /* 1326C 8002326C F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 13270 80023270 061F033C */  lui        $v1, (0x1F060010 >> 16)
    /* 13274 80023274 10006334 */  ori        $v1, $v1, (0x1F060010 & 0xFFFF)
  .L80023278:
    /* 13278 80023278 00006290 */  lbu        $v0, 0x0($v1)
    /* 1327C 8002327C 00000000 */  nop
    /* 13280 80023280 01004230 */  andi       $v0, $v0, 0x1
    /* 13284 80023284 FCFF4010 */  beqz       $v0, .L80023278
    /* 13288 80023288 00000000 */   nop
    /* 1328C 8002328C 061F023C */  lui        $v0, (0x1F060000 >> 16)
    /* 13290 80023290 00004290 */  lbu        $v0, (0x1F060000 & 0xFFFF)($v0)
    /* 13294 80023294 00000000 */  nop
    /* 13298 80023298 0000A2A3 */  sb         $v0, 0x0($sp)
    /* 1329C 8002329C 061F013C */  lui        $at, (0x1F060008 >> 16)
    /* 132A0 800232A0 080024A0 */  sb         $a0, (0x1F060008 & 0xFFFF)($at)
    /* 132A4 800232A4 0000A293 */  lbu        $v0, 0x0($sp)
    /* 132A8 800232A8 00000000 */  nop
    /* 132AC 800232AC FF004230 */  andi       $v0, $v0, 0xFF
    /* 132B0 800232B0 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 132B4 800232B4 0800E003 */  jr         $ra
    /* 132B8 800232B8 00000000 */   nop
endlabel SwapByte
