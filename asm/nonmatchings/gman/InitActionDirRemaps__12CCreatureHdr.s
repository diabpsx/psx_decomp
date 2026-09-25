.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitActionDirRemaps__12CCreatureHdr, 0x70

glabel InitActionDirRemaps__12CCreatureHdr
    /* 8437C 8009437C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 84380 80094380 2000B2AF */  sw         $s2, 0x20($sp)
    /* 84384 80094384 21908000 */  addu       $s2, $a0, $zero
    /* 84388 80094388 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8438C 8009438C 04005126 */  addiu      $s1, $s2, 0x4
    /* 84390 80094390 2400BFAF */  sw         $ra, 0x24($sp)
    /* 84394 80094394 1800B0AF */  sw         $s0, 0x18($sp)
    /* 84398 80094398 0000428E */  lw         $v0, 0x0($s2)
    /* 8439C 8009439C 00000000 */  nop
    /* 843A0 800943A0 0B004018 */  blez       $v0, .L800943D0
    /* 843A4 800943A4 21800000 */   addu      $s0, $zero, $zero
  .L800943A8:
    /* 843A8 800943A8 7A50020C */  jal        InitDirRemap__15CCreatureAction
    /* 843AC 800943AC 21202002 */   addu      $a0, $s1, $zero
    /* 843B0 800943B0 6450020C */  jal        GetSize__C15CCreatureAction
    /* 843B4 800943B4 21202002 */   addu      $a0, $s1, $zero
    /* 843B8 800943B8 21882202 */  addu       $s1, $s1, $v0
    /* 843BC 800943BC 0000428E */  lw         $v0, 0x0($s2)
    /* 843C0 800943C0 01001026 */  addiu      $s0, $s0, 0x1
    /* 843C4 800943C4 2A100202 */  slt        $v0, $s0, $v0
    /* 843C8 800943C8 F7FF4014 */  bnez       $v0, .L800943A8
    /* 843CC 800943CC 00000000 */   nop
  .L800943D0:
    /* 843D0 800943D0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 843D4 800943D4 2000B28F */  lw         $s2, 0x20($sp)
    /* 843D8 800943D8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 843DC 800943DC 1800B08F */  lw         $s0, 0x18($sp)
    /* 843E0 800943E0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 843E4 800943E4 0800E003 */  jr         $ra
    /* 843E8 800943E8 00000000 */   nop
endlabel InitActionDirRemaps__12CCreatureHdr
