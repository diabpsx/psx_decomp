.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ENG_random__Fl, 0x6C

glabel ENG_random__Fl
    /* 2DB24 8003DB24 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2DB28 8003DB28 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2DB2C 8003DB2C 21808000 */  addu       $s0, $a0, $zero
    /* 2DB30 8003DB30 0300001E */  bgtz       $s0, .L8003DB40
    /* 2DB34 8003DB34 1400BFAF */   sw        $ra, 0x14($sp)
    /* 2DB38 8003DB38 DFF60008 */  j          .L8003DB7C
    /* 2DB3C 8003DB3C 21100000 */   addu      $v0, $zero, $zero
  .L8003DB40:
    /* 2DB40 8003DB40 FEFF0234 */  ori        $v0, $zero, 0xFFFE
    /* 2DB44 8003DB44 2A105000 */  slt        $v0, $v0, $s0
    /* 2DB48 8003DB48 07004010 */  beqz       $v0, .L8003DB68
    /* 2DB4C 8003DB4C 00000000 */   nop
    /* 2DB50 8003DB50 B7F6000C */  jal        GetRndSeed__Fv
    /* 2DB54 8003DB54 00000000 */   nop
    /* 2DB58 8003DB58 1A005000 */  div        $zero, $v0, $s0
    /* 2DB5C 8003DB5C 10100000 */  mfhi       $v0
    /* 2DB60 8003DB60 DFF60008 */  j          .L8003DB7C
    /* 2DB64 8003DB64 00000000 */   nop
  .L8003DB68:
    /* 2DB68 8003DB68 B7F6000C */  jal        GetRndSeed__Fv
    /* 2DB6C 8003DB6C 00000000 */   nop
    /* 2DB70 8003DB70 031C0200 */  sra        $v1, $v0, 16
    /* 2DB74 8003DB74 1A007000 */  div        $zero, $v1, $s0
    /* 2DB78 8003DB78 10100000 */  mfhi       $v0
  .L8003DB7C:
    /* 2DB7C 8003DB7C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2DB80 8003DB80 1000B08F */  lw         $s0, 0x10($sp)
    /* 2DB84 8003DB84 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2DB88 8003DB88 0800E003 */  jr         $ra
    /* 2DB8C 8003DB8C 00000000 */   nop
endlabel ENG_random__Fl
