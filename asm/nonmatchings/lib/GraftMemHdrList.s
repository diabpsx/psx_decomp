.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GraftMemHdrList, 0x5C

glabel GraftMemHdrList
    /* 12F28 80022F28 0000A28C */  lw         $v0, 0x0($a1)
    /* 12F2C 80022F2C 0000868C */  lw         $a2, 0x0($a0)
    /* 12F30 80022F30 12004010 */  beqz       $v0, .L80022F7C
    /* 12F34 80022F34 00000000 */   nop
    /* 12F38 80022F38 000082AC */  sw         $v0, 0x0($a0)
    /* 12F3C 80022F3C 0000A38C */  lw         $v1, 0x0($a1)
    /* 12F40 80022F40 00000000 */  nop
    /* 12F44 80022F44 0400628C */  lw         $v0, 0x4($v1)
    /* 12F48 80022F48 00000000 */  nop
    /* 12F4C 80022F4C 07004010 */  beqz       $v0, .L80022F6C
    /* 12F50 80022F50 00000000 */   nop
  .L80022F54:
    /* 12F54 80022F54 0400638C */  lw         $v1, 0x4($v1)
    /* 12F58 80022F58 00000000 */  nop
    /* 12F5C 80022F5C 0400628C */  lw         $v0, 0x4($v1)
    /* 12F60 80022F60 00000000 */  nop
    /* 12F64 80022F64 FBFF4014 */  bnez       $v0, .L80022F54
    /* 12F68 80022F68 00000000 */   nop
  .L80022F6C:
    /* 12F6C 80022F6C 0200C010 */  beqz       $a2, .L80022F78
    /* 12F70 80022F70 040066AC */   sw        $a2, 0x4($v1)
    /* 12F74 80022F74 0000C3AC */  sw         $v1, 0x0($a2)
  .L80022F78:
    /* 12F78 80022F78 0000A0AC */  sw         $zero, 0x0($a1)
  .L80022F7C:
    /* 12F7C 80022F7C 0800E003 */  jr         $ra
    /* 12F80 80022F80 00000000 */   nop
endlabel GraftMemHdrList
