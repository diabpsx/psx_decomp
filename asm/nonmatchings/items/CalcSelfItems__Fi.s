.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcSelfItems__Fi, 0x160

glabel CalcSelfItems__Fi
    /* 2F57C 8003F57C 21500000 */  addu       $t2, $zero, $zero
    /* 2F580 8003F580 21480000 */  addu       $t1, $zero, $zero
    /* 2F584 8003F584 21400000 */  addu       $t0, $zero, $zero
    /* 2F588 8003F588 06000624 */  addiu      $a2, $zero, 0x6
    /* 2F58C 8003F58C FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 2F590 8003F590 01000B24 */  addiu      $t3, $zero, 0x1
    /* 2F594 8003F594 40100400 */  sll        $v0, $a0, 1
    /* 2F598 8003F598 21104400 */  addu       $v0, $v0, $a0
    /* 2F59C 8003F59C 80100200 */  sll        $v0, $v0, 2
    /* 2F5A0 8003F5A0 21104400 */  addu       $v0, $v0, $a0
    /* 2F5A4 8003F5A4 00110200 */  sll        $v0, $v0, 4
    /* 2F5A8 8003F5A8 23104400 */  subu       $v0, $v0, $a0
    /* 2F5AC 8003F5AC 80100200 */  sll        $v0, $v0, 2
    /* 2F5B0 8003F5B0 21104400 */  addu       $v0, $v0, $a0
    /* 2F5B4 8003F5B4 C0100200 */  sll        $v0, $v0, 3
    /* 2F5B8 8003F5B8 0E80033C */  lui        $v1, %hi(plr)
    /* 2F5BC 8003F5BC 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 2F5C0 8003F5C0 21384300 */  addu       $a3, $v0, $v1
    /* 2F5C4 8003F5C4 0802E424 */  addiu      $a0, $a3, 0x208
  .L8003F5C8:
    /* 2F5C8 8003F5C8 D4FF8284 */  lh         $v0, -0x2C($a0)
    /* 2F5CC 8003F5CC 00000000 */  nop
    /* 2F5D0 8003F5D0 0B004510 */  beq        $v0, $a1, .L8003F600
    /* 2F5D4 8003F5D4 00000000 */   nop
    /* 2F5D8 8003F5D8 11008280 */  lb         $v0, 0x11($a0)
    /* 2F5DC 8003F5DC 00000000 */  nop
    /* 2F5E0 8003F5E0 07004010 */  beqz       $v0, .L8003F600
    /* 2F5E4 8003F5E4 0E008BA0 */   sb        $t3, 0xE($a0)
    /* 2F5E8 8003F5E8 FEFF8280 */  lb         $v0, -0x2($a0)
    /* 2F5EC 8003F5EC 00008380 */  lb         $v1, 0x0($a0)
    /* 2F5F0 8003F5F0 21504201 */  addu       $t2, $t2, $v0
    /* 2F5F4 8003F5F4 FFFF8280 */  lb         $v0, -0x1($a0)
    /* 2F5F8 8003F5F8 21400301 */  addu       $t0, $t0, $v1
    /* 2F5FC 8003F5FC 21482201 */  addu       $t1, $t1, $v0
  .L8003F600:
    /* 2F600 8003F600 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 2F604 8003F604 F0FFC514 */  bne        $a2, $a1, .L8003F5C8
    /* 2F608 8003F608 6C008424 */   addiu     $a0, $a0, 0x6C
    /* 2F60C 8003F60C FFFF0C24 */  addiu      $t4, $zero, -0x1
  .L8003F610:
    /* 2F610 8003F610 21580000 */  addu       $t3, $zero, $zero
    /* 2F614 8003F614 06000624 */  addiu      $a2, $zero, 0x6
    /* 2F618 8003F618 0802E424 */  addiu      $a0, $a3, 0x208
  .L8003F61C:
    /* 2F61C 8003F61C D4FF8284 */  lh         $v0, -0x2C($a0)
    /* 2F620 8003F620 00000000 */  nop
    /* 2F624 8003F624 25004C10 */  beq        $v0, $t4, .L8003F6BC
    /* 2F628 8003F628 00000000 */   nop
    /* 2F62C 8003F62C 0E008280 */  lb         $v0, 0xE($a0)
    /* 2F630 8003F630 00000000 */  nop
    /* 2F634 8003F634 21004010 */  beqz       $v0, .L8003F6BC
    /* 2F638 8003F638 00000000 */   nop
    /* 2F63C 8003F63C FA00E284 */  lh         $v0, 0xFA($a3)
    /* 2F640 8003F640 09008390 */  lbu        $v1, 0x9($a0)
    /* 2F644 8003F644 21104A00 */  addu       $v0, $v0, $t2
    /* 2F648 8003F648 2A104300 */  slt        $v0, $v0, $v1
    /* 2F64C 8003F64C 01004538 */  xori       $a1, $v0, 0x1
    /* 2F650 8003F650 FE00E284 */  lh         $v0, 0xFE($a3)
    /* 2F654 8003F654 0C008390 */  lbu        $v1, 0xC($a0)
    /* 2F658 8003F658 21104900 */  addu       $v0, $v0, $t1
    /* 2F65C 8003F65C 2A104300 */  slt        $v0, $v0, $v1
    /* 2F660 8003F660 02004010 */  beqz       $v0, .L8003F66C
    /* 2F664 8003F664 00000000 */   nop
    /* 2F668 8003F668 21280000 */  addu       $a1, $zero, $zero
  .L8003F66C:
    /* 2F66C 8003F66C 0201E284 */  lh         $v0, 0x102($a3)
    /* 2F670 8003F670 0A008390 */  lbu        $v1, 0xA($a0)
    /* 2F674 8003F674 21104800 */  addu       $v0, $v0, $t0
    /* 2F678 8003F678 2A104300 */  slt        $v0, $v0, $v1
    /* 2F67C 8003F67C 03004010 */  beqz       $v0, .L8003F68C
    /* 2F680 8003F680 FF00A230 */   andi      $v0, $a1, 0xFF
    /* 2F684 8003F684 21280000 */  addu       $a1, $zero, $zero
    /* 2F688 8003F688 FF00A230 */  andi       $v0, $a1, 0xFF
  .L8003F68C:
    /* 2F68C 8003F68C 0B004014 */  bnez       $v0, .L8003F6BC
    /* 2F690 8003F690 00000000 */   nop
    /* 2F694 8003F694 11008280 */  lb         $v0, 0x11($a0)
    /* 2F698 8003F698 01000B24 */  addiu      $t3, $zero, 0x1
    /* 2F69C 8003F69C 07004010 */  beqz       $v0, .L8003F6BC
    /* 2F6A0 8003F6A0 0E0080A0 */   sb        $zero, 0xE($a0)
    /* 2F6A4 8003F6A4 FEFF8280 */  lb         $v0, -0x2($a0)
    /* 2F6A8 8003F6A8 00008380 */  lb         $v1, 0x0($a0)
    /* 2F6AC 8003F6AC 23504201 */  subu       $t2, $t2, $v0
    /* 2F6B0 8003F6B0 FFFF8280 */  lb         $v0, -0x1($a0)
    /* 2F6B4 8003F6B4 23400301 */  subu       $t0, $t0, $v1
    /* 2F6B8 8003F6B8 23482201 */  subu       $t1, $t1, $v0
  .L8003F6BC:
    /* 2F6BC 8003F6BC FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 2F6C0 8003F6C0 D6FFCC14 */  bne        $a2, $t4, .L8003F61C
    /* 2F6C4 8003F6C4 6C008424 */   addiu     $a0, $a0, 0x6C
    /* 2F6C8 8003F6C8 FF006231 */  andi       $v0, $t3, 0xFF
    /* 2F6CC 8003F6CC D0FF4014 */  bnez       $v0, .L8003F610
    /* 2F6D0 8003F6D0 00000000 */   nop
    /* 2F6D4 8003F6D4 0800E003 */  jr         $ra
    /* 2F6D8 8003F6D8 00000000 */   nop
endlabel CalcSelfItems__Fi
