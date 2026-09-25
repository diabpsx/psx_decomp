.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeClickBits__FiiiPUs, 0x8C

glabel MakeClickBits__FiiiPUs
    /* 79B44 80089B44 21480000 */  addu       $t1, $zero, $zero
    /* 79B48 80089B48 01000324 */  addiu      $v1, $zero, 0x1
    /* 79B4C 80089B4C 01000C24 */  addiu      $t4, $zero, 0x1
    /* 79B50 80089B50 40580600 */  sll        $t3, $a2, 1
    /* 79B54 80089B54 2000EA24 */  addiu      $t2, $a3, 0x20
  .L80089B58:
    /* 79B58 80089B58 2A10EA00 */  slt        $v0, $a3, $t2
    /* 79B5C 80089B5C 1A004010 */  beqz       $v0, .L80089BC8
    /* 79B60 80089B60 00000000 */   nop
    /* 79B64 80089B64 FFFF6230 */  andi       $v0, $v1, 0xFFFF
    /* 79B68 80089B68 2410A200 */  and        $v0, $a1, $v0
    /* 79B6C 80089B6C 03004010 */  beqz       $v0, .L80089B7C
    /* 79B70 80089B70 21406601 */   addu      $t0, $t3, $a2
    /* 79B74 80089B74 E0260208 */  j          .L80089B80
    /* 79B78 80089B78 0000ECA4 */   sh        $t4, 0x0($a3)
  .L80089B7C:
    /* 79B7C 80089B7C 2140C000 */  addu       $t0, $a2, $zero
  .L80089B80:
    /* 79B80 80089B80 FFFF6230 */  andi       $v0, $v1, 0xFFFF
    /* 79B84 80089B84 24108200 */  and        $v0, $a0, $v0
    /* 79B88 80089B88 02004014 */  bnez       $v0, .L80089B94
    /* 79B8C 80089B8C 00000000 */   nop
    /* 79B90 80089B90 0000E0A4 */  sh         $zero, 0x0($a3)
  .L80089B94:
    /* 79B94 80089B94 0000E294 */  lhu        $v0, 0x0($a3)
    /* 79B98 80089B98 00000000 */  nop
    /* 79B9C 80089B9C 07004010 */  beqz       $v0, .L80089BBC
    /* 79BA0 80089BA0 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 79BA4 80089BA4 0000E2A4 */  sh         $v0, 0x0($a3)
    /* 79BA8 80089BA8 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 79BAC 80089BAC 03004014 */  bnez       $v0, .L80089BBC
    /* 79BB0 80089BB0 00000000 */   nop
    /* 79BB4 80089BB4 0000E8A4 */  sh         $t0, 0x0($a3)
    /* 79BB8 80089BB8 25482301 */  or         $t1, $t1, $v1
  .L80089BBC:
    /* 79BBC 80089BBC 40180300 */  sll        $v1, $v1, 1
    /* 79BC0 80089BC0 D6260208 */  j          .L80089B58
    /* 79BC4 80089BC4 0200E724 */   addiu     $a3, $a3, 0x2
  .L80089BC8:
    /* 79BC8 80089BC8 0800E003 */  jr         $ra
    /* 79BCC 80089BCC FFFF2231 */   andi      $v0, $t1, 0xFFFF
endlabel MakeClickBits__FiiiPUs
