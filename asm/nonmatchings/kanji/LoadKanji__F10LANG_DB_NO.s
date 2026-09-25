.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadKanji__F10LANG_DB_NO, 0x130

glabel LoadKanji__F10LANG_DB_NO
    /* 9D5D8 800AD5D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9D5DC 800AD5DC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9D5E0 800AD5E0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9D5E4 800AD5E4 B1B4020C */  jal        FreeKanji__Fv
    /* 9D5E8 800AD5E8 21808000 */   addu      $s0, $a0, $zero
    /* 9D5EC 800AD5EC 01000224 */  addiu      $v0, $zero, 0x1
    /* 9D5F0 800AD5F0 2B000212 */  beq        $s0, $v0, .L800AD6A0
    /* 9D5F4 800AD5F4 0200022A */   slti      $v0, $s0, 0x2
    /* 9D5F8 800AD5F8 05004010 */  beqz       $v0, .L800AD610
    /* 9D5FC 800AD5FC 00000000 */   nop
    /* 9D600 800AD600 0A000012 */  beqz       $s0, .L800AD62C
    /* 9D604 800AD604 00000000 */   nop
    /* 9D608 800AD608 B3B50208 */  j          .L800AD6CC
    /* 9D60C 800AD60C 00000000 */   nop
  .L800AD610:
    /* 9D610 800AD610 02000224 */  addiu      $v0, $zero, 0x2
    /* 9D614 800AD614 26000212 */  beq        $s0, $v0, .L800AD6B0
    /* 9D618 800AD618 03000224 */   addiu     $v0, $zero, 0x3
    /* 9D61C 800AD61C 1A000212 */  beq        $s0, $v0, .L800AD688
    /* 9D620 800AD620 00000000 */   nop
    /* 9D624 800AD624 B3B50208 */  j          .L800AD6CC
    /* 9D628 800AD628 00000000 */   nop
  .L800AD62C:
    /* 9D62C 800AD62C 1180043C */  lui        $a0, %hi(D_80110EFC)
    /* 9D630 800AD630 FC0E8424 */  addiu      $a0, $a0, %lo(D_80110EFC)
    /* 9D634 800AD634 86B4020C */  jal        LoadKanjiFont__FPc
    /* 9D638 800AD638 00000000 */   nop
    /* 9D63C 800AD63C D3B4020C */  jal        KANJI_SetCache__F10KANJI_FRMS
    /* 9D640 800AD640 01000424 */   addiu     $a0, $zero, 0x1
    /* 9D644 800AD644 1280023C */  lui        $v0, %hi(qtextflag)
    /* 9D648 800AD648 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 9D64C 800AD64C 00000000 */  nop
    /* 9D650 800AD650 1E004010 */  beqz       $v0, .L800AD6CC
    /* 9D654 800AD654 00000000 */   nop
    /* 9D658 800AD658 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9D65C 800AD65C 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9D660 800AD660 1280013C */  lui        $at, %hi(qtextflag)
    /* 9D664 800AD664 60B920A0 */  sb         $zero, %lo(qtextflag)($at)
    /* 9D668 800AD668 1280013C */  lui        $at, %hi(PauseMode)
    /* 9D66C 800AD66C A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 9D670 800AD670 16004014 */  bnez       $v0, .L800AD6CC
    /* 9D674 800AD674 01000224 */   addiu     $v0, $zero, 0x1
    /* 9D678 800AD678 1280013C */  lui        $at, %hi(gbProcessPlayers)
    /* 9D67C 800AD67C 00B822A0 */  sb         $v0, %lo(gbProcessPlayers)($at)
    /* 9D680 800AD680 B3B50208 */  j          .L800AD6CC
    /* 9D684 800AD684 00000000 */   nop
  .L800AD688:
    /* 9D688 800AD688 1180043C */  lui        $a0, %hi(D_80110F08)
    /* 9D68C 800AD68C 080F8424 */  addiu      $a0, $a0, %lo(D_80110F08)
    /* 9D690 800AD690 86B4020C */  jal        LoadKanjiFont__FPc
    /* 9D694 800AD694 00000000 */   nop
    /* 9D698 800AD698 B1B50208 */  j          .L800AD6C4
    /* 9D69C 800AD69C 01000424 */   addiu     $a0, $zero, 0x1
  .L800AD6A0:
    /* 9D6A0 800AD6A0 1180043C */  lui        $a0, %hi(D_80110F14)
    /* 9D6A4 800AD6A4 140F8424 */  addiu      $a0, $a0, %lo(D_80110F14)
    /* 9D6A8 800AD6A8 AEB50208 */  j          .L800AD6B8
    /* 9D6AC 800AD6AC 00000000 */   nop
  .L800AD6B0:
    /* 9D6B0 800AD6B0 1180043C */  lui        $a0, %hi(D_80110F24)
    /* 9D6B4 800AD6B4 240F8424 */  addiu      $a0, $a0, %lo(D_80110F24)
  .L800AD6B8:
    /* 9D6B8 800AD6B8 86B4020C */  jal        LoadKanjiFont__FPc
    /* 9D6BC 800AD6BC 00000000 */   nop
    /* 9D6C0 800AD6C0 21200000 */  addu       $a0, $zero, $zero
  .L800AD6C4:
    /* 9D6C4 800AD6C4 D3B4020C */  jal        KANJI_SetCache__F10KANJI_FRMS
    /* 9D6C8 800AD6C8 00000000 */   nop
  .L800AD6CC:
    /* 9D6CC 800AD6CC 4C0B828F */  lw         $v0, %gp_rel(D_8011B2CC)($gp)
    /* 9D6D0 800AD6D0 00000000 */  nop
    /* 9D6D4 800AD6D4 05004014 */  bnez       $v0, .L800AD6EC
    /* 9D6D8 800AD6D8 21200000 */   addu      $a0, $zero, $zero
    /* 9D6DC 800AD6DC 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D6E0 800AD6E0 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D6E4 800AD6E4 A583000C */  jal        DBG_Error
    /* 9D6E8 800AD6E8 14010624 */   addiu     $a2, $zero, 0x114
  .L800AD6EC:
    /* 9D6EC 800AD6EC C2B4020C */  jal        ClearKanjiBuffer__Fv
    /* 9D6F0 800AD6F0 00000000 */   nop
    /* 9D6F4 800AD6F4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9D6F8 800AD6F8 1000B08F */  lw         $s0, 0x10($sp)
    /* 9D6FC 800AD6FC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9D700 800AD700 0800E003 */  jr         $ra
    /* 9D704 800AD704 00000000 */   nop
endlabel LoadKanji__F10LANG_DB_NO
