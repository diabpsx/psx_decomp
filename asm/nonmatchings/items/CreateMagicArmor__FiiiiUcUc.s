.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateMagicArmor__FiiiiUcUc, 0x17C

glabel CreateMagicArmor__FiiiiUcUc
    /* 38D30 80048D30 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 38D34 80048D34 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 38D38 80048D38 4000BEAF */  sw         $fp, 0x40($sp)
    /* 38D3C 80048D3C 5800BE93 */  lbu        $fp, 0x58($sp)
    /* 38D40 80048D40 3000B4AF */  sw         $s4, 0x30($sp)
    /* 38D44 80048D44 5C00B493 */  lbu        $s4, 0x5C($sp)
    /* 38D48 80048D48 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 38D4C 80048D4C 2198C000 */  addu       $s3, $a2, $zero
    /* 38D50 80048D50 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 38D54 80048D54 21B8E000 */  addu       $s7, $a3, $zero
    /* 38D58 80048D58 2800B2AF */  sw         $s2, 0x28($sp)
    /* 38D5C 80048D5C 21900000 */  addu       $s2, $zero, $zero
    /* 38D60 80048D60 4400BFAF */  sw         $ra, 0x44($sp)
    /* 38D64 80048D64 3800B6AF */  sw         $s6, 0x38($sp)
    /* 38D68 80048D68 3400B5AF */  sw         $s5, 0x34($sp)
    /* 38D6C 80048D6C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 38D70 80048D70 7F004228 */  slti       $v0, $v0, 0x7F
    /* 38D74 80048D74 40004010 */  beqz       $v0, .L80048E78
    /* 38D78 80048D78 2000B0AF */   sw        $s0, 0x20($sp)
    /* 38D7C 80048D7C 0D80103C */  lui        $s0, %hi(itemavail)
    /* 38D80 80048D80 D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 38D84 80048D84 00001182 */  lb         $s1, 0x0($s0)
    /* 38D88 80048D88 01001624 */  addiu      $s6, $zero, 0x1
    /* 38D8C 80048D8C 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 38D90 80048D90 21302002 */   addu      $a2, $s1, $zero
    /* 38D94 80048D94 21206002 */  addu       $a0, $s3, $zero
    /* 38D98 80048D98 0811838F */  lw         $v1, %gp_rel(numitems)($gp)
    /* 38D9C 80048D9C 7E000226 */  addiu      $v0, $s0, 0x7E
    /* 38DA0 80048DA0 23104300 */  subu       $v0, $v0, $v1
    /* 38DA4 80048DA4 00004290 */  lbu        $v0, 0x0($v0)
    /* 38DA8 80048DA8 00000000 */  nop
    /* 38DAC 80048DAC 000002A2 */  sb         $v0, 0x0($s0)
    /* 38DB0 80048DB0 0D80013C */  lui        $at, %hi(itemactive)
    /* 38DB4 80048DB4 21082300 */  addu       $at, $at, $v1
    /* 38DB8 80048DB8 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 38DBC 80048DBC 100F010C */  jal        RndTypeItems__Fii
    /* 38DC0 80048DC0 21280000 */   addu      $a1, $zero, $zero
    /* 38DC4 80048DC4 21804000 */  addu       $s0, $v0, $zero
    /* 38DC8 80048DC8 C0101100 */  sll        $v0, $s1, 3
    /* 38DCC 80048DCC 23105100 */  subu       $v0, $v0, $s1
    /* 38DD0 80048DD0 80100200 */  sll        $v0, $v0, 2
    /* 38DD4 80048DD4 23105100 */  subu       $v0, $v0, $s1
    /* 38DD8 80048DD8 80A80200 */  sll        $s5, $v0, 2
  .L80048DDC:
    /* 38DDC 80048DDC B7F6000C */  jal        GetRndSeed__Fv
    /* 38DE0 80048DE0 00000000 */   nop
    /* 38DE4 80048DE4 21202002 */  addu       $a0, $s1, $zero
    /* 38DE8 80048DE8 21280002 */  addu       $a1, $s0, $zero
    /* 38DEC 80048DEC 1280073C */  lui        $a3, %hi(currlevel)
    /* 38DF0 80048DF0 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 38DF4 80048DF4 21304000 */  addu       $a2, $v0, $zero
    /* 38DF8 80048DF8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 38DFC 80048DFC 1400B6AF */  sw         $s6, 0x14($sp)
    /* 38E00 80048E00 1800A0AF */  sw         $zero, 0x18($sp)
    /* 38E04 80048E04 1C00B4AF */  sw         $s4, 0x1C($sp)
    /* 38E08 80048E08 2411010C */  jal        SetupAllItems__FiiiiiUcUcUc
    /* 38E0C 80048E0C 40380700 */   sll       $a3, $a3, 1
    /* 38E10 80048E10 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 38E14 80048E14 21083500 */  addu       $at, $at, $s5
    /* 38E18 80048E18 A01D2290 */  lbu        $v0, %lo(item + 0x4C)($at)
    /* 38E1C 80048E1C 00000000 */  nop
    /* 38E20 80048E20 03005714 */  bne        $v0, $s7, .L80048E30
    /* 38E24 80048E24 21206002 */   addu      $a0, $s3, $zero
    /* 38E28 80048E28 8F230108 */  j          .L80048E3C
    /* 38E2C 80048E2C 01001224 */   addiu     $s2, $zero, 0x1
  .L80048E30:
    /* 38E30 80048E30 100F010C */  jal        RndTypeItems__Fii
    /* 38E34 80048E34 21280000 */   addu      $a1, $zero, $zero
    /* 38E38 80048E38 21804000 */  addu       $s0, $v0, $zero
  .L80048E3C:
    /* 38E3C 80048E3C FF004232 */  andi       $v0, $s2, 0xFF
    /* 38E40 80048E40 E6FF4010 */  beqz       $v0, .L80048DDC
    /* 38E44 80048E44 00000000 */   nop
    /* 38E48 80048E48 0300C013 */  beqz       $fp, .L80048E58
    /* 38E4C 80048E4C 21200000 */   addu      $a0, $zero, $zero
    /* 38E50 80048E50 723F010C */  jal        NetSendCmdDItem__FUci
    /* 38E54 80048E54 21282002 */   addu      $a1, $s1, $zero
  .L80048E58:
    /* 38E58 80048E58 03008012 */  beqz       $s4, .L80048E68
    /* 38E5C 80048E5C 00000000 */   nop
    /* 38E60 80048E60 CE3C010C */  jal        DeltaAddItem__Fi
    /* 38E64 80048E64 21202002 */   addu      $a0, $s1, $zero
  .L80048E68:
    /* 38E68 80048E68 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 38E6C 80048E6C 00000000 */  nop
    /* 38E70 80048E70 01004224 */  addiu      $v0, $v0, 0x1
    /* 38E74 80048E74 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L80048E78:
    /* 38E78 80048E78 4400BF8F */  lw         $ra, 0x44($sp)
    /* 38E7C 80048E7C 4000BE8F */  lw         $fp, 0x40($sp)
    /* 38E80 80048E80 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 38E84 80048E84 3800B68F */  lw         $s6, 0x38($sp)
    /* 38E88 80048E88 3400B58F */  lw         $s5, 0x34($sp)
    /* 38E8C 80048E8C 3000B48F */  lw         $s4, 0x30($sp)
    /* 38E90 80048E90 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 38E94 80048E94 2800B28F */  lw         $s2, 0x28($sp)
    /* 38E98 80048E98 2400B18F */  lw         $s1, 0x24($sp)
    /* 38E9C 80048E9C 2000B08F */  lw         $s0, 0x20($sp)
    /* 38EA0 80048EA0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 38EA4 80048EA4 0800E003 */  jr         $ra
    /* 38EA8 80048EA8 00000000 */   nop
endlabel CreateMagicArmor__FiiiiUcUc
