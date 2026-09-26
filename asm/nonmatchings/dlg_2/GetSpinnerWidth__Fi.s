.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSpinnerWidth__Fi, 0xA4

glabel GetSpinnerWidth__Fi
    /* 21784 8015B37C A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 21788 8015B380 E00C828F */  lw         $v0, %gp_rel(current_card)($gp)
    /* 2178C 8015B384 5000BFAF */  sw         $ra, 0x50($sp)
    /* 21790 8015B388 80100200 */  sll        $v0, $v0, 2
    /* 21794 8015B38C 1280013C */  lui        $at, %hi(card_status)
    /* 21798 8015B390 21082200 */  addu       $at, $at, $v0
    /* 2179C 8015B394 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 217A0 8015B398 02000224 */  addiu      $v0, $zero, 0x2
    /* 217A4 8015B39C 03006214 */  bne        $v1, $v0, .L8015B3AC
    /* 217A8 8015B3A0 21288000 */   addu      $a1, $a0, $zero
    /* 217AC 8015B3A4 046D0508 */  j          .L8015B410
    /* 217B0 8015B3A8 00020224 */   addiu     $v0, $zero, 0x200
  .L8015B3AC:
    /* 217B4 8015B3AC 80100500 */  sll        $v0, $a1, 2
    /* 217B8 8015B3B0 21104500 */  addu       $v0, $v0, $a1
    /* 217BC 8015B3B4 40110200 */  sll        $v0, $v0, 5
    /* 217C0 8015B3B8 23104500 */  subu       $v0, $v0, $a1
    /* 217C4 8015B3BC C0100200 */  sll        $v0, $v0, 3
    /* 217C8 8015B3C0 1580013C */  lui        $at, %hi(CharDataStruct + 0x478)
    /* 217CC 8015B3C4 21082200 */  addu       $at, $at, $v0
    /* 217D0 8015B3C8 687B2280 */  lb         $v0, %lo(CharDataStruct + 0x478)($at)
    /* 217D4 8015B3CC 00000000 */  nop
    /* 217D8 8015B3D0 07004010 */  beqz       $v0, .L8015B3F0
    /* 217DC 8015B3D4 00000000 */   nop
    /* 217E0 8015B3D8 A16C050C */  jal        ConstructSlotName__FPci
    /* 217E4 8015B3DC 1000A427 */   addiu     $a0, $sp, 0x10
    /* 217E8 8015B3E0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 217EC 8015B3E4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 217F0 8015B3E8 016D0508 */  j          .L8015B404
    /* 217F4 8015B3EC 1000A527 */   addiu     $a1, $sp, 0x10
  .L8015B3F0:
    /* 217F8 8015B3F0 4AED010C */  jal        GetStr__Fi
    /* 217FC 8015B3F4 2C010424 */   addiu     $a0, $zero, 0x12C
    /* 21800 8015B3F8 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 21804 8015B3FC D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 21808 8015B400 21284000 */  addu       $a1, $v0, $zero
  .L8015B404:
    /* 2180C 8015B404 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 21810 8015B408 00000000 */   nop
    /* 21814 8015B40C 08004224 */  addiu      $v0, $v0, 0x8
  .L8015B410:
    /* 21818 8015B410 5000BF8F */  lw         $ra, 0x50($sp)
    /* 2181C 8015B414 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 21820 8015B418 0800E003 */  jr         $ra
    /* 21824 8015B41C 00000000 */   nop
endlabel GetSpinnerWidth__Fi
