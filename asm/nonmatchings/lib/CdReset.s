.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdReset, 0x6C

glabel CdReset
    /* ACE8 8001ACE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* ACEC 8001ACEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* ACF0 8001ACF0 21808000 */  addu       $s0, $a0, $zero
    /* ACF4 8001ACF4 02000224 */  addiu      $v0, $zero, 0x2
    /* ACF8 8001ACF8 05000216 */  bne        $s0, $v0, .L8001AD10
    /* ACFC 8001ACFC 1400BFAF */   sw        $ra, 0x14($sp)
    /* AD00 8001AD00 4E71000C */  jal        CD_initintr
    /* AD04 8001AD04 00000000 */   nop
    /* AD08 8001AD08 516B0008 */  j          .L8001AD44
    /* AD0C 8001AD0C 01000224 */   addiu     $v0, $zero, 0x1
  .L8001AD10:
    /* AD10 8001AD10 6171000C */  jal        CD_init
    /* AD14 8001AD14 00000000 */   nop
    /* AD18 8001AD18 0A004014 */  bnez       $v0, .L8001AD44
    /* AD1C 8001AD1C 21100000 */   addu      $v0, $zero, $zero
    /* AD20 8001AD20 01000224 */  addiu      $v0, $zero, 0x1
    /* AD24 8001AD24 07000216 */  bne        $s0, $v0, .L8001AD44
    /* AD28 8001AD28 00000000 */   nop
    /* AD2C 8001AD2C 1271000C */  jal        CD_initvol
    /* AD30 8001AD30 00000000 */   nop
    /* AD34 8001AD34 21184000 */  addu       $v1, $v0, $zero
    /* AD38 8001AD38 02006014 */  bnez       $v1, .L8001AD44
    /* AD3C 8001AD3C 21100000 */   addu      $v0, $zero, $zero
    /* AD40 8001AD40 01000224 */  addiu      $v0, $zero, 0x1
  .L8001AD44:
    /* AD44 8001AD44 1400BF8F */  lw         $ra, 0x14($sp)
    /* AD48 8001AD48 1000B08F */  lw         $s0, 0x10($sp)
    /* AD4C 8001AD4C 0800E003 */  jr         $ra
    /* AD50 8001AD50 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel CdReset
