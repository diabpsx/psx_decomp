.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checksum_data__FPci, 0x3C

glabel checksum_data__FPci
    /* 90EC 80142CE4 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 90F0 80142CE8 ADDE063C */  lui        $a2, (0xDEADBEEF >> 16)
    /* 90F4 80142CEC EFBEC634 */  ori        $a2, $a2, (0xDEADBEEF & 0xFFFF)
    /* 90F8 80142CF0 0700A010 */  beqz       $a1, .L80142D10
    /* 90FC 80142CF4 FFFFA324 */   addiu     $v1, $a1, -0x1
    /* 9100 80142CF8 FFFF0524 */  addiu      $a1, $zero, -0x1
  .L80142CFC:
    /* 9104 80142CFC 00008280 */  lb         $v0, 0x0($a0)
    /* 9108 80142D00 01008424 */  addiu      $a0, $a0, 0x1
    /* 910C 80142D04 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 9110 80142D08 FCFF6514 */  bne        $v1, $a1, .L80142CFC
    /* 9114 80142D0C 2330C200 */   subu      $a2, $a2, $v0
  .L80142D10:
    /* 9118 80142D10 2110C000 */  addu       $v0, $a2, $zero
    /* 911C 80142D14 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 9120 80142D18 0800E003 */  jr         $ra
    /* 9124 80142D1C 00000000 */   nop
endlabel checksum_data__FPci
