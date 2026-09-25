.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDiabloMsg__Fc, 0x94

glabel InitDiabloMsg__Fc
    /* 2DC44 8003DC44 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 2DC48 8003DC48 21180000 */  addu       $v1, $zero, $zero
    /* 2DC4C 8003DC4C EA108583 */  lb         $a1, %gp_rel(msgcnt)($gp)
    /* 2DC50 8003DC50 00000000 */  nop
    /* 2DC54 8003DC54 0D00A018 */  blez       $a1, .L8003DC8C
    /* 2DC58 8003DC58 21388000 */   addu      $a3, $a0, $zero
    /* 2DC5C 8003DC5C 00160400 */  sll        $v0, $a0, 24
    /* 2DC60 8003DC60 03360200 */  sra        $a2, $v0, 24
    /* 2DC64 8003DC64 2120A000 */  addu       $a0, $a1, $zero
  .L8003DC68:
    /* 2DC68 8003DC68 0D80013C */  lui        $at, %hi(msgtable)
    /* 2DC6C 8003DC6C 21082300 */  addu       $at, $at, $v1
    /* 2DC70 8003DC70 F01A2280 */  lb         $v0, %lo(msgtable)($at)
    /* 2DC74 8003DC74 00000000 */  nop
    /* 2DC78 8003DC78 14004610 */  beq        $v0, $a2, .L8003DCCC
    /* 2DC7C 8003DC7C 01006324 */   addiu     $v1, $v1, 0x1
    /* 2DC80 8003DC80 2A106400 */  slt        $v0, $v1, $a0
    /* 2DC84 8003DC84 F8FF4014 */  bnez       $v0, .L8003DC68
    /* 2DC88 8003DC88 00000000 */   nop
  .L8003DC8C:
    /* 2DC8C 8003DC8C EA108283 */  lb         $v0, %gp_rel(msgcnt)($gp)
    /* 2DC90 8003DC90 0D80013C */  lui        $at, %hi(msgtable)
    /* 2DC94 8003DC94 21082200 */  addu       $at, $at, $v0
    /* 2DC98 8003DC98 F01A27A0 */  sb         $a3, %lo(msgtable)($at)
    /* 2DC9C 8003DC9C EA108283 */  lb         $v0, %gp_rel(msgcnt)($gp)
    /* 2DCA0 8003DCA0 00000000 */  nop
    /* 2DCA4 8003DCA4 21184000 */  addu       $v1, $v0, $zero
    /* 2DCA8 8003DCA8 50004228 */  slti       $v0, $v0, 0x50
    /* 2DCAC 8003DCAC 02004010 */  beqz       $v0, .L8003DCB8
    /* 2DCB0 8003DCB0 01006224 */   addiu     $v0, $v1, 0x1
    /* 2DCB4 8003DCB4 EA1082A3 */  sb         $v0, %gp_rel(msgcnt)($gp)
  .L8003DCB8:
    /* 2DCB8 8003DCB8 0D80033C */  lui        $v1, %hi(msgtable)
    /* 2DCBC 8003DCBC F01A6390 */  lbu        $v1, %lo(msgtable)($v1)
    /* 2DCC0 8003DCC0 46000224 */  addiu      $v0, $zero, 0x46
    /* 2DCC4 8003DCC4 EC1082A3 */  sb         $v0, %gp_rel(msgdelay)($gp)
    /* 2DCC8 8003DCC8 EB1083A3 */  sb         $v1, %gp_rel(msgflag)($gp)
  .L8003DCCC:
    /* 2DCCC 8003DCCC 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 2DCD0 8003DCD0 0800E003 */  jr         $ra
    /* 2DCD4 8003DCD4 00000000 */   nop
endlabel InitDiabloMsg__Fc
