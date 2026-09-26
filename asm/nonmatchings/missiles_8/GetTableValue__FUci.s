.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTableValue__FUci, 0x94

glabel GetTableValue__FUci
    /* 36C0 8013D2B8 F0008230 */  andi       $v0, $a0, 0xF0
    /* 36C4 8013D2BC 02310200 */  srl        $a2, $v0, 4
    /* 36C8 8013D2C0 0F008730 */  andi       $a3, $a0, 0xF
    /* 36CC 8013D2C4 FF008430 */  andi       $a0, $a0, 0xFF
    /* 36D0 8013D2C8 14008010 */  beqz       $a0, .L8013D31C
    /* 36D4 8013D2CC 2118C000 */   addu      $v1, $a2, $zero
    /* 36D8 8013D2D0 FF006430 */  andi       $a0, $v1, 0xFF
    /* 36DC 8013D2D4 0A00822C */  sltiu      $v0, $a0, 0xA
    /* 36E0 8013D2D8 0D004010 */  beqz       $v0, .L8013D310
    /* 36E4 8013D2DC 00000000 */   nop
    /* 36E8 8013D2E0 03008014 */  bnez       $a0, .L8013D2F0
    /* 36EC 8013D2E4 FF006230 */   andi      $v0, $v1, 0xFF
    /* 36F0 8013D2E8 10000324 */  addiu      $v1, $zero, 0x10
    /* 36F4 8013D2EC FF006230 */  andi       $v0, $v1, 0xFF
  .L8013D2F0:
    /* 36F8 8013D2F0 2A10A200 */  slt        $v0, $a1, $v0
    /* 36FC 8013D2F4 09004010 */  beqz       $v0, .L8013D31C
    /* 3700 8013D2F8 FF00E230 */   andi      $v0, $a3, 0xFF
    /* 3704 8013D2FC 1080013C */  lui        $at, %hi(ValueTable)
    /* 3708 8013D300 21082200 */  addu       $at, $at, $v0
    /* 370C 8013D304 182A2290 */  lbu        $v0, %lo(ValueTable)($at)
    /* 3710 8013D308 D1F40408 */  j          .L8013D344
    /* 3714 8013D30C 00000000 */   nop
  .L8013D310:
    /* 3718 8013D310 2A10A700 */  slt        $v0, $a1, $a3
    /* 371C 8013D314 03004014 */  bnez       $v0, .L8013D324
    /* 3720 8013D318 F6FFC324 */   addiu     $v1, $a2, -0xA
  .L8013D31C:
    /* 3724 8013D31C D1F40408 */  j          .L8013D344
    /* 3728 8013D320 21100000 */   addu      $v0, $zero, $zero
  .L8013D324:
    /* 372C 8013D324 FF006230 */  andi       $v0, $v1, 0xFF
    /* 3730 8013D328 1080043C */  lui        $a0, %hi(StringTable)
    /* 3734 8013D32C 282A8424 */  addiu      $a0, $a0, %lo(StringTable)
    /* 3738 8013D330 C0180200 */  sll        $v1, $v0, 3
    /* 373C 8013D334 21186200 */  addu       $v1, $v1, $v0
    /* 3740 8013D338 21186400 */  addu       $v1, $v1, $a0
    /* 3744 8013D33C 21186500 */  addu       $v1, $v1, $a1
    /* 3748 8013D340 00006290 */  lbu        $v0, 0x0($v1)
  .L8013D344:
    /* 374C 8013D344 0800E003 */  jr         $ra
    /* 3750 8013D348 00000000 */   nop
endlabel GetTableValue__FUci
