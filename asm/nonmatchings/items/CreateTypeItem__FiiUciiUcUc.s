.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateTypeItem__FiiUciiUcUc, 0x144

glabel CreateTypeItem__FiiUciiUcUc
    /* 34EC4 80044EC4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 34EC8 80044EC8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 34ECC 80044ECC 21808000 */  addu       $s0, $a0, $zero
    /* 34ED0 80044ED0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 34ED4 80044ED4 2198A000 */  addu       $s3, $a1, $zero
    /* 34ED8 80044ED8 3800B6AF */  sw         $s6, 0x38($sp)
    /* 34EDC 80044EDC 5400B693 */  lbu        $s6, 0x54($sp)
    /* 34EE0 80044EE0 2120E000 */  addu       $a0, $a3, $zero
    /* 34EE4 80044EE4 3000B4AF */  sw         $s4, 0x30($sp)
    /* 34EE8 80044EE8 21A0C000 */  addu       $s4, $a2, $zero
    /* 34EEC 80044EEC 3400B5AF */  sw         $s5, 0x34($sp)
    /* 34EF0 80044EF0 5800B593 */  lbu        $s5, 0x58($sp)
    /* 34EF4 80044EF4 0B000224 */  addiu      $v0, $zero, 0xB
    /* 34EF8 80044EF8 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 34EFC 80044EFC 2800B2AF */  sw         $s2, 0x28($sp)
    /* 34F00 80044F00 06008210 */  beq        $a0, $v0, .L80044F1C
    /* 34F04 80044F04 2400B1AF */   sw        $s1, 0x24($sp)
    /* 34F08 80044F08 5000A58F */  lw         $a1, 0x50($sp)
    /* 34F0C 80044F0C 100F010C */  jal        RndTypeItems__Fii
    /* 34F10 80044F10 00000000 */   nop
    /* 34F14 80044F14 C8130108 */  j          .L80044F20
    /* 34F18 80044F18 21904000 */   addu      $s2, $v0, $zero
  .L80044F1C:
    /* 34F1C 80044F1C 21900000 */  addu       $s2, $zero, $zero
  .L80044F20:
    /* 34F20 80044F20 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34F24 80044F24 00000000 */  nop
    /* 34F28 80044F28 7F004228 */  slti       $v0, $v0, 0x7F
    /* 34F2C 80044F2C 2B004010 */  beqz       $v0, .L80044FDC
    /* 34F30 80044F30 21200002 */   addu      $a0, $s0, $zero
    /* 34F34 80044F34 0D80103C */  lui        $s0, %hi(itemavail)
    /* 34F38 80044F38 D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 34F3C 80044F3C 00001182 */  lb         $s1, 0x0($s0)
    /* 34F40 80044F40 21286002 */  addu       $a1, $s3, $zero
    /* 34F44 80044F44 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 34F48 80044F48 21302002 */   addu      $a2, $s1, $zero
    /* 34F4C 80044F4C 0811838F */  lw         $v1, %gp_rel(numitems)($gp)
    /* 34F50 80044F50 7E000226 */  addiu      $v0, $s0, 0x7E
    /* 34F54 80044F54 23104300 */  subu       $v0, $v0, $v1
    /* 34F58 80044F58 00004290 */  lbu        $v0, 0x0($v0)
    /* 34F5C 80044F5C 00000000 */  nop
    /* 34F60 80044F60 000002A2 */  sb         $v0, 0x0($s0)
    /* 34F64 80044F64 0D80013C */  lui        $at, %hi(itemactive)
    /* 34F68 80044F68 21082300 */  addu       $at, $at, $v1
    /* 34F6C 80044F6C 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 34F70 80044F70 B7F6000C */  jal        GetRndSeed__Fv
    /* 34F74 80044F74 FF00B032 */   andi      $s0, $s5, 0xFF
    /* 34F78 80044F78 21202002 */  addu       $a0, $s1, $zero
    /* 34F7C 80044F7C 21284002 */  addu       $a1, $s2, $zero
    /* 34F80 80044F80 21304000 */  addu       $a2, $v0, $zero
    /* 34F84 80044F84 01000224 */  addiu      $v0, $zero, 0x1
    /* 34F88 80044F88 1000A2AF */  sw         $v0, 0x10($sp)
    /* 34F8C 80044F8C FF008232 */  andi       $v0, $s4, 0xFF
    /* 34F90 80044F90 1280073C */  lui        $a3, %hi(currlevel)
    /* 34F94 80044F94 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 34F98 80044F98 1400A2AF */  sw         $v0, 0x14($sp)
    /* 34F9C 80044F9C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 34FA0 80044FA0 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 34FA4 80044FA4 2411010C */  jal        SetupAllItems__FiiiiiUcUcUc
    /* 34FA8 80044FA8 40380700 */   sll       $a3, $a3, 1
    /* 34FAC 80044FAC 0300C012 */  beqz       $s6, .L80044FBC
    /* 34FB0 80044FB0 21200000 */   addu      $a0, $zero, $zero
    /* 34FB4 80044FB4 723F010C */  jal        NetSendCmdDItem__FUci
    /* 34FB8 80044FB8 21282002 */   addu      $a1, $s1, $zero
  .L80044FBC:
    /* 34FBC 80044FBC 03000012 */  beqz       $s0, .L80044FCC
    /* 34FC0 80044FC0 00000000 */   nop
    /* 34FC4 80044FC4 CE3C010C */  jal        DeltaAddItem__Fi
    /* 34FC8 80044FC8 21202002 */   addu      $a0, $s1, $zero
  .L80044FCC:
    /* 34FCC 80044FCC 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34FD0 80044FD0 00000000 */  nop
    /* 34FD4 80044FD4 01004224 */  addiu      $v0, $v0, 0x1
    /* 34FD8 80044FD8 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L80044FDC:
    /* 34FDC 80044FDC 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 34FE0 80044FE0 3800B68F */  lw         $s6, 0x38($sp)
    /* 34FE4 80044FE4 3400B58F */  lw         $s5, 0x34($sp)
    /* 34FE8 80044FE8 3000B48F */  lw         $s4, 0x30($sp)
    /* 34FEC 80044FEC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 34FF0 80044FF0 2800B28F */  lw         $s2, 0x28($sp)
    /* 34FF4 80044FF4 2400B18F */  lw         $s1, 0x24($sp)
    /* 34FF8 80044FF8 2000B08F */  lw         $s0, 0x20($sp)
    /* 34FFC 80044FFC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 35000 80045000 0800E003 */  jr         $ra
    /* 35004 80045004 00000000 */   nop
endlabel CreateTypeItem__FiiUciiUcUc
