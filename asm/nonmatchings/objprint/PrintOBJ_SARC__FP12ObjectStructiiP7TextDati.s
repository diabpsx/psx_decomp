.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_SARC__FP12ObjectStructiiP7TextDati, 0xC8

glabel PrintOBJ_SARC__FP12ObjectStructiiP7TextDati
    /* 6DC40 8007DC40 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 6DC44 8007DC44 21408000 */  addu       $t0, $a0, $zero
    /* 6DC48 8007DC48 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6DC4C 8007DC4C 2190A000 */  addu       $s2, $a1, $zero
    /* 6DC50 8007DC50 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6DC54 8007DC54 2198C000 */  addu       $s3, $a2, $zero
    /* 6DC58 8007DC58 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6DC5C 8007DC5C 2188E000 */  addu       $s1, $a3, $zero
    /* 6DC60 8007DC60 21202002 */  addu       $a0, $s1, $zero
    /* 6DC64 8007DC64 21300000 */  addu       $a2, $zero, $zero
    /* 6DC68 8007DC68 21380000 */  addu       $a3, $zero, $zero
    /* 6DC6C 8007DC6C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 6DC70 8007DC70 2000B0AF */  sw         $s0, 0x20($sp)
    /* 6DC74 8007DC74 1E000381 */  lb         $v1, 0x1E($t0)
    /* 6DC78 8007DC78 4800B08F */  lw         $s0, 0x48($sp)
    /* 6DC7C 8007DC7C C0100300 */  sll        $v0, $v1, 3
    /* 6DC80 8007DC80 21104300 */  addu       $v0, $v0, $v1
    /* 6DC84 8007DC84 40100200 */  sll        $v0, $v0, 1
    /* 6DC88 8007DC88 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 6DC8C 8007DC8C 21082200 */  addu       $at, $at, $v0
    /* 6DC90 8007DC90 B1842380 */  lb         $v1, %lo(AllObjects + 0x1)($at)
    /* 6DC94 8007DC94 21000281 */  lb         $v0, 0x21($t0)
    /* 6DC98 8007DC98 80180300 */  sll        $v1, $v1, 2
    /* 6DC9C 8007DC9C 1180013C */  lui        $at, %hi(ObjMasterLoadList)
    /* 6DCA0 8007DCA0 21082300 */  addu       $at, $at, $v1
    /* 6DCA4 8007DCA4 F0692584 */  lh         $a1, %lo(ObjMasterLoadList)($at)
    /* 6DCA8 8007DCA8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 6DCAC 8007DCAC A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6DCB0 8007DCB0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6DCB4 8007DCB4 21202002 */  addu       $a0, $s1, $zero
    /* 6DCB8 8007DCB8 21284000 */  addu       $a1, $v0, $zero
    /* 6DCBC 8007DCBC 21304002 */  addu       $a2, $s2, $zero
    /* 6DCC0 8007DCC0 21386002 */  addu       $a3, $s3, $zero
    /* 6DCC4 8007DCC4 FDFF1026 */  addiu      $s0, $s0, -0x3
    /* 6DCC8 8007DCC8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6DCCC 8007DCCC 1400B0AF */  sw         $s0, 0x14($sp)
    /* 6DCD0 8007DCD0 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6DCD4 8007DCD4 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6DCD8 8007DCD8 07004390 */  lbu        $v1, 0x7($v0)
    /* 6DCDC 8007DCDC 00000000 */  nop
    /* 6DCE0 8007DCE0 FE006330 */  andi       $v1, $v1, 0xFE
    /* 6DCE4 8007DCE4 070043A0 */  sb         $v1, 0x7($v0)
    /* 6DCE8 8007DCE8 3000BF8F */  lw         $ra, 0x30($sp)
    /* 6DCEC 8007DCEC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 6DCF0 8007DCF0 2800B28F */  lw         $s2, 0x28($sp)
    /* 6DCF4 8007DCF4 2400B18F */  lw         $s1, 0x24($sp)
    /* 6DCF8 8007DCF8 2000B08F */  lw         $s0, 0x20($sp)
    /* 6DCFC 8007DCFC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 6DD00 8007DD00 0800E003 */  jr         $ra
    /* 6DD04 8007DD04 00000000 */   nop
endlabel PrintOBJ_SARC__FP12ObjectStructiiP7TextDati
