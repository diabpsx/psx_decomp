.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateArmorStand__FiiUc, 0x16C

glabel OperateArmorStand__FiiUc
    /* 4CCC8 8005CCC8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 4CCCC 8005CCCC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 4CCD0 8005CCD0 21988000 */  addu       $s3, $a0, $zero
    /* 4CCD4 8005CCD4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 4CCD8 8005CCD8 2190A000 */  addu       $s2, $a1, $zero
    /* 4CCDC 8005CCDC 40101200 */  sll        $v0, $s2, 1
    /* 4CCE0 8005CCE0 21105200 */  addu       $v0, $v0, $s2
    /* 4CCE4 8005CCE4 80100200 */  sll        $v0, $v0, 2
    /* 4CCE8 8005CCE8 23105200 */  subu       $v0, $v0, $s2
    /* 4CCEC 8005CCEC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 4CCF0 8005CCF0 80800200 */  sll        $s0, $v0, 2
    /* 4CCF4 8005CCF4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 4CCF8 8005CCF8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 4CCFC 8005CCFC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4CD00 8005CD00 21083000 */  addu       $at, $at, $s0
    /* 4CD04 8005CD04 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4CD08 8005CD08 00000000 */  nop
    /* 4CD0C 8005CD0C 41004010 */  beqz       $v0, .L8005CE14
    /* 4CD10 8005CD10 2188C000 */   addu      $s1, $a2, $zero
    /* 4CD14 8005CD14 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4CD18 8005CD18 21083000 */  addu       $at, $at, $s0
    /* 4CD1C 8005CD1C 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 4CD20 8005CD20 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4CD24 8005CD24 21083000 */  addu       $at, $at, $s0
    /* 4CD28 8005CD28 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4CD2C 8005CD2C 01004224 */  addiu      $v0, $v0, 0x1
    /* 4CD30 8005CD30 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4CD34 8005CD34 21083000 */  addu       $at, $at, $s0
    /* 4CD38 8005CD38 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4CD3C 8005CD3C 1280023C */  lui        $v0, %hi(deltaload)
    /* 4CD40 8005CD40 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4CD44 8005CD44 00000000 */  nop
    /* 4CD48 8005CD48 32004014 */  bnez       $v0, .L8005CE14
    /* 4CD4C 8005CD4C 00000000 */   nop
    /* 4CD50 8005CD50 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4CD54 8005CD54 21083000 */  addu       $at, $at, $s0
    /* 4CD58 8005CD58 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4CD5C 8005CD5C B3F6000C */  jal        SetRndSeed__Fl
    /* 4CD60 8005CD60 00000000 */   nop
    /* 4CD64 8005CD64 C9F6000C */  jal        ENG_random__Fl
    /* 4CD68 8005CD68 02000424 */   addiu     $a0, $zero, 0x2
    /* 4CD6C 8005CD6C 1280033C */  lui        $v1, %hi(currlevel)
    /* 4CD70 8005CD70 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 4CD74 8005CD74 21304000 */  addu       $a2, $v0, $zero
    /* 4CD78 8005CD78 0600622C */  sltiu      $v0, $v1, 0x6
    /* 4CD7C 8005CD7C 03004010 */  beqz       $v0, .L8005CD8C
    /* 4CD80 8005CD80 06000724 */   addiu     $a3, $zero, 0x6
    /* 4CD84 8005CD84 72730108 */  j          .L8005CDC8
    /* 4CD88 8005CD88 01000624 */   addiu     $a2, $zero, 0x1
  .L8005CD8C:
    /* 4CD8C 8005CD8C FAFF6224 */  addiu      $v0, $v1, -0x6
    /* 4CD90 8005CD90 0400422C */  sltiu      $v0, $v0, 0x4
    /* 4CD94 8005CD94 03004010 */  beqz       $v0, .L8005CDA4
    /* 4CD98 8005CD98 FF00C630 */   andi      $a2, $a2, 0xFF
    /* 4CD9C 8005CD9C 72730108 */  j          .L8005CDC8
    /* 4CDA0 8005CDA0 08000724 */   addiu     $a3, $zero, 0x8
  .L8005CDA4:
    /* 4CDA4 8005CDA4 F6FF6224 */  addiu      $v0, $v1, -0xA
    /* 4CDA8 8005CDA8 0300422C */  sltiu      $v0, $v0, 0x3
    /* 4CDAC 8005CDAC 05004014 */  bnez       $v0, .L8005CDC4
    /* 4CDB0 8005CDB0 21300000 */   addu      $a2, $zero, $zero
    /* 4CDB4 8005CDB4 F3FF6224 */  addiu      $v0, $v1, -0xD
    /* 4CDB8 8005CDB8 0400422C */  sltiu      $v0, $v0, 0x4
    /* 4CDBC 8005CDBC 0D004010 */  beqz       $v0, .L8005CDF4
    /* 4CDC0 8005CDC0 01000624 */   addiu     $a2, $zero, 0x1
  .L8005CDC4:
    /* 4CDC4 8005CDC4 09000724 */  addiu      $a3, $zero, 0x9
  .L8005CDC8:
    /* 4CDC8 8005CDC8 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4CDCC 8005CDCC 21083000 */  addu       $at, $at, $s0
    /* 4CDD0 8005CDD0 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4CDD4 8005CDD4 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4CDD8 8005CDD8 21083000 */  addu       $at, $at, $s0
    /* 4CDDC 8005CDDC 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4CDE0 8005CDE0 FF002232 */  andi       $v0, $s1, 0xFF
    /* 4CDE4 8005CDE4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 4CDE8 8005CDE8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4CDEC 8005CDEC B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 4CDF0 8005CDF0 1800A0AF */   sw        $zero, 0x18($sp)
  .L8005CDF4:
    /* 4CDF4 8005CDF4 1280023C */  lui        $v0, %hi(myplr)
    /* 4CDF8 8005CDF8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4CDFC 8005CDFC 00000000 */  nop
    /* 4CE00 8005CE00 04006216 */  bne        $s3, $v0, .L8005CE14
    /* 4CE04 8005CE04 21200000 */   addu      $a0, $zero, $zero
    /* 4CE08 8005CE08 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4CE0C 8005CE0C 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4CE10 8005CE10 FFFF4632 */   andi      $a2, $s2, 0xFFFF
  .L8005CE14:
    /* 4CE14 8005CE14 3000BF8F */  lw         $ra, 0x30($sp)
    /* 4CE18 8005CE18 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 4CE1C 8005CE1C 2800B28F */  lw         $s2, 0x28($sp)
    /* 4CE20 8005CE20 2400B18F */  lw         $s1, 0x24($sp)
    /* 4CE24 8005CE24 2000B08F */  lw         $s0, 0x20($sp)
    /* 4CE28 8005CE28 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 4CE2C 8005CE2C 0800E003 */  jr         $ra
    /* 4CE30 8005CE30 00000000 */   nop
endlabel OperateArmorStand__FiiUc
