.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateDecap__FiiUc, 0xE8

glabel OperateDecap__FiiUc
    /* 4CBE0 8005CBE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 4CBE4 8005CBE4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 4CBE8 8005CBE8 21988000 */  addu       $s3, $a0, $zero
    /* 4CBEC 8005CBEC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 4CBF0 8005CBF0 2188A000 */  addu       $s1, $a1, $zero
    /* 4CBF4 8005CBF4 40101100 */  sll        $v0, $s1, 1
    /* 4CBF8 8005CBF8 21105100 */  addu       $v0, $v0, $s1
    /* 4CBFC 8005CBFC 80100200 */  sll        $v0, $v0, 2
    /* 4CC00 8005CC00 23105100 */  subu       $v0, $v0, $s1
    /* 4CC04 8005CC04 1800B0AF */  sw         $s0, 0x18($sp)
    /* 4CC08 8005CC08 80800200 */  sll        $s0, $v0, 2
    /* 4CC0C 8005CC0C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 4CC10 8005CC10 2000B2AF */  sw         $s2, 0x20($sp)
    /* 4CC14 8005CC14 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4CC18 8005CC18 21083000 */  addu       $at, $at, $s0
    /* 4CC1C 8005CC1C 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4CC20 8005CC20 00000000 */  nop
    /* 4CC24 8005CC24 20004010 */  beqz       $v0, .L8005CCA8
    /* 4CC28 8005CC28 2190C000 */   addu      $s2, $a2, $zero
    /* 4CC2C 8005CC2C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4CC30 8005CC30 21083000 */  addu       $at, $at, $s0
    /* 4CC34 8005CC34 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4CC38 8005CC38 1280023C */  lui        $v0, %hi(deltaload)
    /* 4CC3C 8005CC3C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4CC40 8005CC40 00000000 */  nop
    /* 4CC44 8005CC44 18004014 */  bnez       $v0, .L8005CCA8
    /* 4CC48 8005CC48 00000000 */   nop
    /* 4CC4C 8005CC4C 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4CC50 8005CC50 21083000 */  addu       $at, $at, $s0
    /* 4CC54 8005CC54 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4CC58 8005CC58 B3F6000C */  jal        SetRndSeed__Fl
    /* 4CC5C 8005CC5C 00000000 */   nop
    /* 4CC60 8005CC60 21300000 */  addu       $a2, $zero, $zero
    /* 4CC64 8005CC64 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4CC68 8005CC68 21083000 */  addu       $at, $at, $s0
    /* 4CC6C 8005CC6C 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4CC70 8005CC70 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4CC74 8005CC74 21083000 */  addu       $at, $at, $s0
    /* 4CC78 8005CC78 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4CC7C 8005CC7C FF004732 */  andi       $a3, $s2, 0xFF
    /* 4CC80 8005CC80 F612010C */  jal        CreateRndItem__FiiUcUcUc
    /* 4CC84 8005CC84 1000A0AF */   sw        $zero, 0x10($sp)
    /* 4CC88 8005CC88 1280023C */  lui        $v0, %hi(myplr)
    /* 4CC8C 8005CC8C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4CC90 8005CC90 00000000 */  nop
    /* 4CC94 8005CC94 04006216 */  bne        $s3, $v0, .L8005CCA8
    /* 4CC98 8005CC98 21200000 */   addu      $a0, $zero, $zero
    /* 4CC9C 8005CC9C 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4CCA0 8005CCA0 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4CCA4 8005CCA4 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L8005CCA8:
    /* 4CCA8 8005CCA8 2800BF8F */  lw         $ra, 0x28($sp)
    /* 4CCAC 8005CCAC 2400B38F */  lw         $s3, 0x24($sp)
    /* 4CCB0 8005CCB0 2000B28F */  lw         $s2, 0x20($sp)
    /* 4CCB4 8005CCB4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4CCB8 8005CCB8 1800B08F */  lw         $s0, 0x18($sp)
    /* 4CCBC 8005CCBC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4CCC0 8005CCC0 0800E003 */  jr         $ra
    /* 4CCC4 8005CCC4 00000000 */   nop
endlabel OperateDecap__FiiUc
