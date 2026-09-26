.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckItemStats__Fi, 0x84

glabel CheckItemStats__Fi
    /* 23F20 8015DB18 40100400 */  sll        $v0, $a0, 1
    /* 23F24 8015DB1C 21104400 */  addu       $v0, $v0, $a0
    /* 23F28 8015DB20 80100200 */  sll        $v0, $v0, 2
    /* 23F2C 8015DB24 21104400 */  addu       $v0, $v0, $a0
    /* 23F30 8015DB28 00110200 */  sll        $v0, $v0, 4
    /* 23F34 8015DB2C 23104400 */  subu       $v0, $v0, $a0
    /* 23F38 8015DB30 80100200 */  sll        $v0, $v0, 2
    /* 23F3C 8015DB34 21104400 */  addu       $v0, $v0, $a0
    /* 23F40 8015DB38 C0100200 */  sll        $v0, $v0, 3
    /* 23F44 8015DB3C 0E80033C */  lui        $v1, %hi(plr)
    /* 23F48 8015DB40 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 23F4C 8015DB44 21204300 */  addu       $a0, $v0, $v1
    /* 23F50 8015DB48 F8008284 */  lh         $v0, 0xF8($a0)
    /* 23F54 8015DB4C 71198390 */  lbu        $v1, 0x1971($a0)
    /* 23F58 8015DB50 00000000 */  nop
    /* 23F5C 8015DB54 2A104300 */  slt        $v0, $v0, $v1
    /* 23F60 8015DB58 0E004014 */  bnez       $v0, .L8015DB94
    /* 23F64 8015DB5C 761980A0 */   sb        $zero, 0x1976($a0)
    /* 23F68 8015DB60 FC008284 */  lh         $v0, 0xFC($a0)
    /* 23F6C 8015DB64 74198390 */  lbu        $v1, 0x1974($a0)
    /* 23F70 8015DB68 00000000 */  nop
    /* 23F74 8015DB6C 2A104300 */  slt        $v0, $v0, $v1
    /* 23F78 8015DB70 08004014 */  bnez       $v0, .L8015DB94
    /* 23F7C 8015DB74 00000000 */   nop
    /* 23F80 8015DB78 00018284 */  lh         $v0, 0x100($a0)
    /* 23F84 8015DB7C 72198390 */  lbu        $v1, 0x1972($a0)
    /* 23F88 8015DB80 00000000 */  nop
    /* 23F8C 8015DB84 2A104300 */  slt        $v0, $v0, $v1
    /* 23F90 8015DB88 02004014 */  bnez       $v0, .L8015DB94
    /* 23F94 8015DB8C 01000224 */   addiu     $v0, $zero, 0x1
    /* 23F98 8015DB90 761982A0 */  sb         $v0, 0x1976($a0)
  .L8015DB94:
    /* 23F9C 8015DB94 0800E003 */  jr         $ra
    /* 23FA0 8015DB98 00000000 */   nop
endlabel CheckItemStats__Fi
