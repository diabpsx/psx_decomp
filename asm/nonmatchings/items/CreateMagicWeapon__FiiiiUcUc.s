.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateMagicWeapon__FiiiiUcUc, 0x17C

glabel CreateMagicWeapon__FiiiiUcUc
    /* 38EAC 80048EAC 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 38EB0 80048EB0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 38EB4 80048EB4 4000BEAF */  sw         $fp, 0x40($sp)
    /* 38EB8 80048EB8 5800BE93 */  lbu        $fp, 0x58($sp)
    /* 38EBC 80048EBC 3000B4AF */  sw         $s4, 0x30($sp)
    /* 38EC0 80048EC0 5C00B493 */  lbu        $s4, 0x5C($sp)
    /* 38EC4 80048EC4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 38EC8 80048EC8 2198C000 */  addu       $s3, $a2, $zero
    /* 38ECC 80048ECC 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 38ED0 80048ED0 21B8E000 */  addu       $s7, $a3, $zero
    /* 38ED4 80048ED4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 38ED8 80048ED8 21900000 */  addu       $s2, $zero, $zero
    /* 38EDC 80048EDC 4400BFAF */  sw         $ra, 0x44($sp)
    /* 38EE0 80048EE0 3800B6AF */  sw         $s6, 0x38($sp)
    /* 38EE4 80048EE4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 38EE8 80048EE8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 38EEC 80048EEC 7F004228 */  slti       $v0, $v0, 0x7F
    /* 38EF0 80048EF0 40004010 */  beqz       $v0, .L80048FF4
    /* 38EF4 80048EF4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 38EF8 80048EF8 0D80103C */  lui        $s0, %hi(itemavail)
    /* 38EFC 80048EFC D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 38F00 80048F00 00001182 */  lb         $s1, 0x0($s0)
    /* 38F04 80048F04 01001624 */  addiu      $s6, $zero, 0x1
    /* 38F08 80048F08 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 38F0C 80048F0C 21302002 */   addu      $a2, $s1, $zero
    /* 38F10 80048F10 21206002 */  addu       $a0, $s3, $zero
    /* 38F14 80048F14 0811838F */  lw         $v1, %gp_rel(numitems)($gp)
    /* 38F18 80048F18 7E000226 */  addiu      $v0, $s0, 0x7E
    /* 38F1C 80048F1C 23104300 */  subu       $v0, $v0, $v1
    /* 38F20 80048F20 00004290 */  lbu        $v0, 0x0($v0)
    /* 38F24 80048F24 00000000 */  nop
    /* 38F28 80048F28 000002A2 */  sb         $v0, 0x0($s0)
    /* 38F2C 80048F2C 0D80013C */  lui        $at, %hi(itemactive)
    /* 38F30 80048F30 21082300 */  addu       $at, $at, $v1
    /* 38F34 80048F34 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 38F38 80048F38 100F010C */  jal        RndTypeItems__Fii
    /* 38F3C 80048F3C 21280000 */   addu      $a1, $zero, $zero
    /* 38F40 80048F40 21804000 */  addu       $s0, $v0, $zero
    /* 38F44 80048F44 C0101100 */  sll        $v0, $s1, 3
    /* 38F48 80048F48 23105100 */  subu       $v0, $v0, $s1
    /* 38F4C 80048F4C 80100200 */  sll        $v0, $v0, 2
    /* 38F50 80048F50 23105100 */  subu       $v0, $v0, $s1
    /* 38F54 80048F54 80A80200 */  sll        $s5, $v0, 2
  .L80048F58:
    /* 38F58 80048F58 B7F6000C */  jal        GetRndSeed__Fv
    /* 38F5C 80048F5C 00000000 */   nop
    /* 38F60 80048F60 21202002 */  addu       $a0, $s1, $zero
    /* 38F64 80048F64 21280002 */  addu       $a1, $s0, $zero
    /* 38F68 80048F68 1280073C */  lui        $a3, %hi(currlevel)
    /* 38F6C 80048F6C 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 38F70 80048F70 21304000 */  addu       $a2, $v0, $zero
    /* 38F74 80048F74 1000B6AF */  sw         $s6, 0x10($sp)
    /* 38F78 80048F78 1400B6AF */  sw         $s6, 0x14($sp)
    /* 38F7C 80048F7C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 38F80 80048F80 1C00B4AF */  sw         $s4, 0x1C($sp)
    /* 38F84 80048F84 2411010C */  jal        SetupAllItems__FiiiiiUcUcUc
    /* 38F88 80048F88 40380700 */   sll       $a3, $a3, 1
    /* 38F8C 80048F8C 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 38F90 80048F90 21083500 */  addu       $at, $at, $s5
    /* 38F94 80048F94 A01D2290 */  lbu        $v0, %lo(item + 0x4C)($at)
    /* 38F98 80048F98 00000000 */  nop
    /* 38F9C 80048F9C 03005714 */  bne        $v0, $s7, .L80048FAC
    /* 38FA0 80048FA0 21206002 */   addu      $a0, $s3, $zero
    /* 38FA4 80048FA4 EE230108 */  j          .L80048FB8
    /* 38FA8 80048FA8 01001224 */   addiu     $s2, $zero, 0x1
  .L80048FAC:
    /* 38FAC 80048FAC 100F010C */  jal        RndTypeItems__Fii
    /* 38FB0 80048FB0 21280000 */   addu      $a1, $zero, $zero
    /* 38FB4 80048FB4 21804000 */  addu       $s0, $v0, $zero
  .L80048FB8:
    /* 38FB8 80048FB8 FF004232 */  andi       $v0, $s2, 0xFF
    /* 38FBC 80048FBC E6FF4010 */  beqz       $v0, .L80048F58
    /* 38FC0 80048FC0 00000000 */   nop
    /* 38FC4 80048FC4 0300C013 */  beqz       $fp, .L80048FD4
    /* 38FC8 80048FC8 21200000 */   addu      $a0, $zero, $zero
    /* 38FCC 80048FCC 723F010C */  jal        NetSendCmdDItem__FUci
    /* 38FD0 80048FD0 21282002 */   addu      $a1, $s1, $zero
  .L80048FD4:
    /* 38FD4 80048FD4 03008012 */  beqz       $s4, .L80048FE4
    /* 38FD8 80048FD8 00000000 */   nop
    /* 38FDC 80048FDC CE3C010C */  jal        DeltaAddItem__Fi
    /* 38FE0 80048FE0 21202002 */   addu      $a0, $s1, $zero
  .L80048FE4:
    /* 38FE4 80048FE4 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 38FE8 80048FE8 00000000 */  nop
    /* 38FEC 80048FEC 01004224 */  addiu      $v0, $v0, 0x1
    /* 38FF0 80048FF0 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L80048FF4:
    /* 38FF4 80048FF4 4400BF8F */  lw         $ra, 0x44($sp)
    /* 38FF8 80048FF8 4000BE8F */  lw         $fp, 0x40($sp)
    /* 38FFC 80048FFC 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 39000 80049000 3800B68F */  lw         $s6, 0x38($sp)
    /* 39004 80049004 3400B58F */  lw         $s5, 0x34($sp)
    /* 39008 80049008 3000B48F */  lw         $s4, 0x30($sp)
    /* 3900C 8004900C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 39010 80049010 2800B28F */  lw         $s2, 0x28($sp)
    /* 39014 80049014 2400B18F */  lw         $s1, 0x24($sp)
    /* 39018 80049018 2000B08F */  lw         $s0, 0x20($sp)
    /* 3901C 8004901C 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 39020 80049020 0800E003 */  jr         $ra
    /* 39024 80049024 00000000 */   nop
endlabel CreateMagicWeapon__FiiiiUcUc
