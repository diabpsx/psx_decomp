.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _get_font__FPUcUsT0, 0xC0

glabel _get_font__FPUcUsT0
    /* 9DAA8 800ADAA8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9DAAC 800ADAAC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9DAB0 800ADAB0 21888000 */  addu       $s1, $a0, $zero
    /* 9DAB4 800ADAB4 FFFFA430 */  andi       $a0, $a1, 0xFFFF
    /* 9DAB8 800ADAB8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9DABC 800ADABC 2180C000 */  addu       $s0, $a2, $zero
    /* 9DAC0 800ADAC0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9DAC4 800ADAC4 1FB6020C */  jal        getb__FUs
    /* 9DAC8 800ADAC8 1800B2AF */   sw        $s2, 0x18($sp)
    /* 9DACC 800ADACC FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 9DAD0 800ADAD0 21800202 */  addu       $s0, $s0, $v0
    /* 9DAD4 800ADAD4 05000016 */  bnez       $s0, .L800ADAEC
    /* 9DAD8 800ADAD8 21200000 */   addu      $a0, $zero, $zero
    /* 9DADC 800ADADC 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9DAE0 800ADAE0 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9DAE4 800ADAE4 A583000C */  jal        DBG_Error
    /* 9DAE8 800ADAE8 E2010624 */   addiu     $a2, $zero, 0x1E2
  .L800ADAEC:
    /* 9DAEC 800ADAEC 00001292 */  lbu        $s2, 0x0($s0)
    /* 9DAF0 800ADAF0 01001026 */  addiu      $s0, $s0, 0x1
    /* 9DAF4 800ADAF4 21202002 */  addu       $a0, $s1, $zero
    /* 9DAF8 800ADAF8 21280000 */  addu       $a1, $zero, $zero
    /* 9DAFC 800ADAFC E940000C */  jal        memset
    /* 9DB00 800ADB00 90000624 */   addiu     $a2, $zero, 0x90
    /* 9DB04 800ADB04 01000324 */  addiu      $v1, $zero, 0x1
    /* 9DB08 800ADB08 21200000 */  addu       $a0, $zero, $zero
    /* 9DB0C 800ADB0C 07000524 */  addiu      $a1, $zero, 0x7
    /* 9DB10 800ADB10 24104302 */  and        $v0, $s2, $v1
  .L800ADB14:
    /* 9DB14 800ADB14 02004010 */  beqz       $v0, .L800ADB20
    /* 9DB18 800ADB18 40100300 */   sll       $v0, $v1, 1
    /* 9DB1C 800ADB1C 000025A2 */  sb         $a1, 0x0($s1)
  .L800ADB20:
    /* 9DB20 800ADB20 21184000 */  addu       $v1, $v0, $zero
    /* 9DB24 800ADB24 00160200 */  sll        $v0, $v0, 24
    /* 9DB28 800ADB28 04004014 */  bnez       $v0, .L800ADB3C
    /* 9DB2C 800ADB2C 01003126 */   addiu     $s1, $s1, 0x1
    /* 9DB30 800ADB30 01000324 */  addiu      $v1, $zero, 0x1
    /* 9DB34 800ADB34 00001292 */  lbu        $s2, 0x0($s0)
    /* 9DB38 800ADB38 01001026 */  addiu      $s0, $s0, 0x1
  .L800ADB3C:
    /* 9DB3C 800ADB3C 01008424 */  addiu      $a0, $a0, 0x1
    /* 9DB40 800ADB40 84008228 */  slti       $v0, $a0, 0x84
    /* 9DB44 800ADB44 F3FF4014 */  bnez       $v0, .L800ADB14
    /* 9DB48 800ADB48 24104302 */   and       $v0, $s2, $v1
    /* 9DB4C 800ADB4C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9DB50 800ADB50 1800B28F */  lw         $s2, 0x18($sp)
    /* 9DB54 800ADB54 1400B18F */  lw         $s1, 0x14($sp)
    /* 9DB58 800ADB58 1000B08F */  lw         $s0, 0x10($sp)
    /* 9DB5C 800ADB5C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9DB60 800ADB60 0800E003 */  jr         $ra
    /* 9DB64 800ADB64 00000000 */   nop
endlabel _get_font__FPUcUsT0
