.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SortMemHdrListByAddr, 0xB4

glabel SortMemHdrListByAddr
    /* 12E74 80022E74 0000828C */  lw         $v0, 0x0($a0)
    /* 12E78 80022E78 00000000 */  nop
    /* 12E7C 80022E7C 28004010 */  beqz       $v0, .L80022F20
    /* 12E80 80022E80 00000000 */   nop
    /* 12E84 80022E84 0400428C */  lw         $v0, 0x4($v0)
    /* 12E88 80022E88 00000000 */  nop
    /* 12E8C 80022E8C 24004010 */  beqz       $v0, .L80022F20
    /* 12E90 80022E90 00000000 */   nop
  .L80022E94:
    /* 12E94 80022E94 21380000 */  addu       $a3, $zero, $zero
    /* 12E98 80022E98 0000858C */  lw         $a1, 0x0($a0)
  .L80022E9C:
    /* 12E9C 80022E9C 00000000 */  nop
    /* 12EA0 80022EA0 0400A68C */  lw         $a2, 0x4($a1)
    /* 12EA4 80022EA4 0800A38C */  lw         $v1, 0x8($a1)
    /* 12EA8 80022EA8 0800C28C */  lw         $v0, 0x8($a2)
    /* 12EAC 80022EAC 00000000 */  nop
    /* 12EB0 80022EB0 2B104300 */  sltu       $v0, $v0, $v1
    /* 12EB4 80022EB4 13004010 */  beqz       $v0, .L80022F04
    /* 12EB8 80022EB8 00000000 */   nop
    /* 12EBC 80022EBC 0000A38C */  lw         $v1, 0x0($a1)
    /* 12EC0 80022EC0 0400C28C */  lw         $v0, 0x4($a2)
    /* 12EC4 80022EC4 0000A6AC */  sw         $a2, 0x0($a1)
    /* 12EC8 80022EC8 0400A2AC */  sw         $v0, 0x4($a1)
    /* 12ECC 80022ECC 0400C5AC */  sw         $a1, 0x4($a2)
    /* 12ED0 80022ED0 0400A28C */  lw         $v0, 0x4($a1)
    /* 12ED4 80022ED4 00000000 */  nop
    /* 12ED8 80022ED8 03004010 */  beqz       $v0, .L80022EE8
    /* 12EDC 80022EDC 00000000 */   nop
    /* 12EE0 80022EE0 000045AC */  sw         $a1, 0x0($v0)
    /* 12EE4 80022EE4 0400C5AC */  sw         $a1, 0x4($a2)
  .L80022EE8:
    /* 12EE8 80022EE8 03006010 */  beqz       $v1, .L80022EF8
    /* 12EEC 80022EEC 0000C3AC */   sw        $v1, 0x0($a2)
    /* 12EF0 80022EF0 BF8B0008 */  j          .L80022EFC
    /* 12EF4 80022EF4 040066AC */   sw        $a2, 0x4($v1)
  .L80022EF8:
    /* 12EF8 80022EF8 000086AC */  sw         $a2, 0x0($a0)
  .L80022EFC:
    /* 12EFC 80022EFC C28B0008 */  j          .L80022F08
    /* 12F00 80022F00 01000734 */   ori       $a3, $zero, 0x1
  .L80022F04:
    /* 12F04 80022F04 2128C000 */  addu       $a1, $a2, $zero
  .L80022F08:
    /* 12F08 80022F08 0400A28C */  lw         $v0, 0x4($a1)
    /* 12F0C 80022F0C 00000000 */  nop
    /* 12F10 80022F10 E2FF4014 */  bnez       $v0, .L80022E9C
    /* 12F14 80022F14 FF00E230 */   andi      $v0, $a3, 0xFF
    /* 12F18 80022F18 DEFF4014 */  bnez       $v0, .L80022E94
    /* 12F1C 80022F1C 00000000 */   nop
  .L80022F20:
    /* 12F20 80022F20 0800E003 */  jr         $ra
    /* 12F24 80022F24 00000000 */   nop
endlabel SortMemHdrListByAddr
