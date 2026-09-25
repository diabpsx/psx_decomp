.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strnicmp, 0x84

glabel strnicmp
    /* 1F5E0 8002F5E0 00008290 */  lbu        $v0, 0x0($a0)
    /* 1F5E4 8002F5E4 00000000 */  nop
    /* 1F5E8 8002F5E8 FF004730 */  andi       $a3, $v0, 0xFF
    /* 1F5EC 8002F5EC BFFF4224 */  addiu      $v0, $v0, -0x41
    /* 1F5F0 8002F5F0 1A00422C */  sltiu      $v0, $v0, 0x1A
    /* 1F5F4 8002F5F4 02004010 */  beqz       $v0, .L8002F600
    /* 1F5F8 8002F5F8 00000000 */   nop
    /* 1F5FC 8002F5FC 2000E724 */  addiu      $a3, $a3, 0x20
  .L8002F600:
    /* 1F600 8002F600 0000A390 */  lbu        $v1, 0x0($a1)
    /* 1F604 8002F604 00000000 */  nop
    /* 1F608 8002F608 BFFF6224 */  addiu      $v0, $v1, -0x41
    /* 1F60C 8002F60C 1A00422C */  sltiu      $v0, $v0, 0x1A
    /* 1F610 8002F610 03004010 */  beqz       $v0, .L8002F620
    /* 1F614 8002F614 E0FFE224 */   addiu     $v0, $a3, -0x20
    /* 1F618 8002F618 89BD0008 */  j          .L8002F624
    /* 1F61C 8002F61C 23184300 */   subu      $v1, $v0, $v1
  .L8002F620:
    /* 1F620 8002F620 2318E300 */  subu       $v1, $a3, $v1
  .L8002F624:
    /* 1F624 8002F624 0A006014 */  bnez       $v1, .L8002F650
    /* 1F628 8002F628 00000000 */   nop
    /* 1F62C 8002F62C 00008290 */  lbu        $v0, 0x0($a0)
    /* 1F630 8002F630 00000000 */  nop
    /* 1F634 8002F634 06004010 */  beqz       $v0, .L8002F650
    /* 1F638 8002F638 00000000 */   nop
    /* 1F63C 8002F63C 0600C010 */  beqz       $a2, .L8002F658
    /* 1F640 8002F640 01008424 */   addiu     $a0, $a0, 0x1
    /* 1F644 8002F644 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1F648 8002F648 78BD0008 */  j          strnicmp
    /* 1F64C 8002F64C FFFFC624 */   addiu     $a2, $a2, -0x1
  .L8002F650:
    /* 1F650 8002F650 0200C014 */  bnez       $a2, .L8002F65C
    /* 1F654 8002F654 00000000 */   nop
  .L8002F658:
    /* 1F658 8002F658 21180000 */  addu       $v1, $zero, $zero
  .L8002F65C:
    /* 1F65C 8002F65C 0800E003 */  jr         $ra
    /* 1F660 8002F660 21106000 */   addu      $v0, $v1, $zero
endlabel strnicmp
