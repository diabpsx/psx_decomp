.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FixL3Warp__Fv, 0xE8

glabel FixL3Warp__Fv
    /* 12AD8 8014C6D0 21500000 */  addu       $t2, $zero, $zero
    /* 12ADC 8014C6D4 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 12AE0 8014C6D8 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 12AE4 8014C6DC 6000CD25 */  addiu      $t5, $t6, 0x60
    /* 12AE8 8014C6E0 07000C24 */  addiu      $t4, $zero, 0x7
  .L8014C6E4:
    /* 12AEC 8014C6E4 40380A00 */  sll        $a3, $t2, 1
    /* 12AF0 8014C6E8 2130C001 */  addu       $a2, $t6, $zero
    /* 12AF4 8014C6EC 21480000 */  addu       $t1, $zero, $zero
    /* 12AF8 8014C6F0 2140A001 */  addu       $t0, $t5, $zero
    /* 12AFC 8014C6F4 000FCB24 */  addiu      $t3, $a2, 0xF00
  .L8014C6F8:
    /* 12B00 8014C6F8 2128E600 */  addu       $a1, $a3, $a2
    /* 12B04 8014C6FC 0000A394 */  lhu        $v1, 0x0($a1)
    /* 12B08 8014C700 7D000224 */  addiu      $v0, $zero, 0x7D
    /* 12B0C 8014C704 17006214 */  bne        $v1, $v0, .L8014C764
    /* 12B10 8014C708 2120E600 */   addu      $a0, $a3, $a2
    /* 12B14 8014C70C 2120E800 */  addu       $a0, $a3, $t0
    /* 12B18 8014C710 00008294 */  lhu        $v0, 0x0($a0)
    /* 12B1C 8014C714 00000000 */  nop
    /* 12B20 8014C718 11004314 */  bne        $v0, $v1, .L8014C760
    /* 12B24 8014C71C 00000000 */   nop
    /* 12B28 8014C720 0200A394 */  lhu        $v1, 0x2($a1)
    /* 12B2C 8014C724 00000000 */  nop
    /* 12B30 8014C728 0D006214 */  bne        $v1, $v0, .L8014C760
    /* 12B34 8014C72C 00000000 */   nop
    /* 12B38 8014C730 02008294 */  lhu        $v0, 0x2($a0)
    /* 12B3C 8014C734 00000000 */  nop
    /* 12B40 8014C738 09004314 */  bne        $v0, $v1, .L8014C760
    /* 12B44 8014C73C 9C000224 */   addiu     $v0, $zero, 0x9C
    /* 12B48 8014C740 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 12B4C 8014C744 9B000224 */  addiu      $v0, $zero, 0x9B
    /* 12B50 8014C748 000082A4 */  sh         $v0, 0x0($a0)
    /* 12B54 8014C74C 99000224 */  addiu      $v0, $zero, 0x99
    /* 12B58 8014C750 0200A2A4 */  sh         $v0, 0x2($a1)
    /* 12B5C 8014C754 9A000224 */  addiu      $v0, $zero, 0x9A
    /* 12B60 8014C758 EC310508 */  j          .L8014C7B0
    /* 12B64 8014C75C 020082A4 */   sh        $v0, 0x2($a0)
  .L8014C760:
    /* 12B68 8014C760 2120E600 */  addu       $a0, $a3, $a2
  .L8014C764:
    /* 12B6C 8014C764 00008394 */  lhu        $v1, 0x0($a0)
    /* 12B70 8014C768 05000224 */  addiu      $v0, $zero, 0x5
    /* 12B74 8014C76C 07006214 */  bne        $v1, $v0, .L8014C78C
    /* 12B78 8014C770 21102D01 */   addu      $v0, $t1, $t5
    /* 12B7C 8014C774 2110E200 */  addu       $v0, $a3, $v0
    /* 12B80 8014C778 02004294 */  lhu        $v0, 0x2($v0)
    /* 12B84 8014C77C 00000000 */  nop
    /* 12B88 8014C780 02004C14 */  bne        $v0, $t4, .L8014C78C
    /* 12B8C 8014C784 00000000 */   nop
    /* 12B90 8014C788 00008CA4 */  sh         $t4, 0x0($a0)
  .L8014C78C:
    /* 12B94 8014C78C 6000C624 */  addiu      $a2, $a2, 0x60
    /* 12B98 8014C790 60002925 */  addiu      $t1, $t1, 0x60
    /* 12B9C 8014C794 2A10CB00 */  slt        $v0, $a2, $t3
    /* 12BA0 8014C798 D7FF4014 */  bnez       $v0, .L8014C6F8
    /* 12BA4 8014C79C 60000825 */   addiu     $t0, $t0, 0x60
    /* 12BA8 8014C7A0 01004A25 */  addiu      $t2, $t2, 0x1
    /* 12BAC 8014C7A4 28004229 */  slti       $v0, $t2, 0x28
    /* 12BB0 8014C7A8 CEFF4014 */  bnez       $v0, .L8014C6E4
    /* 12BB4 8014C7AC 00000000 */   nop
  .L8014C7B0:
    /* 12BB8 8014C7B0 0800E003 */  jr         $ra
    /* 12BBC 8014C7B4 00000000 */   nop
endlabel FixL3Warp__Fv
