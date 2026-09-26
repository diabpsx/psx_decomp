.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadPreL3Dungeon__FPcii, 0x1AC

glabel LoadPreL3Dungeon__FPcii
    /* 13A54 8014D64C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 13A58 8014D650 2000B0AF */  sw         $s0, 0x20($sp)
    /* 13A5C 8014D654 2400BFAF */  sw         $ra, 0x24($sp)
    /* 13A60 8014D658 E623050C */  jal        InitL3Dungeon__Fv
    /* 13A64 8014D65C 21808000 */   addu      $s0, $a0, $zero
    /* 13A68 8014D660 1C68050C */  jal        DRLG_InitTrans__Fv
    /* 13A6C 8014D664 00000000 */   nop
    /* 13A70 8014D668 21200002 */  addu       $a0, $s0, $zero
    /* 13A74 8014D66C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 13A78 8014D670 21280000 */   addu      $a1, $zero, $zero
    /* 13A7C 8014D674 21604000 */  addu       $t4, $v0, $zero
    /* 13A80 8014D678 04008825 */  addiu      $t0, $t4, 0x4
    /* 13A84 8014D67C 02008A91 */  lbu        $t2, 0x2($t4)
    /* 13A88 8014D680 00008991 */  lbu        $t1, 0x0($t4)
    /* 13A8C 8014D684 18004011 */  beqz       $t2, .L8014D6E8
    /* 13A90 8014D688 21300000 */   addu      $a2, $zero, $zero
    /* 13A94 8014D68C 0E800D3C */  lui        $t5, %hi(dungeon)
    /* 13A98 8014D690 C440AD25 */  addiu      $t5, $t5, %lo(dungeon)
    /* 13A9C 8014D694 07000B24 */  addiu      $t3, $zero, 0x7
  .L8014D698:
    /* 13AA0 8014D698 0F002011 */  beqz       $t1, .L8014D6D8
    /* 13AA4 8014D69C 21280000 */   addu      $a1, $zero, $zero
    /* 13AA8 8014D6A0 40380600 */  sll        $a3, $a2, 1
    /* 13AAC 8014D6A4 2120A001 */  addu       $a0, $t5, $zero
  .L8014D6A8:
    /* 13AB0 8014D6A8 00000391 */  lbu        $v1, 0x0($t0)
    /* 13AB4 8014D6AC 00000000 */  nop
    /* 13AB8 8014D6B0 03006010 */  beqz       $v1, .L8014D6C0
    /* 13ABC 8014D6B4 2110E400 */   addu      $v0, $a3, $a0
    /* 13AC0 8014D6B8 B1350508 */  j          .L8014D6C4
    /* 13AC4 8014D6BC 000043A4 */   sh        $v1, 0x0($v0)
  .L8014D6C0:
    /* 13AC8 8014D6C0 00004BA4 */  sh         $t3, 0x0($v0)
  .L8014D6C4:
    /* 13ACC 8014D6C4 02000825 */  addiu      $t0, $t0, 0x2
    /* 13AD0 8014D6C8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 13AD4 8014D6CC 2A10A900 */  slt        $v0, $a1, $t1
    /* 13AD8 8014D6D0 F5FF4014 */  bnez       $v0, .L8014D6A8
    /* 13ADC 8014D6D4 60008424 */   addiu     $a0, $a0, 0x60
  .L8014D6D8:
    /* 13AE0 8014D6D8 0100C624 */  addiu      $a2, $a2, 0x1
    /* 13AE4 8014D6DC 2A10CA00 */  slt        $v0, $a2, $t2
    /* 13AE8 8014D6E0 EDFF4014 */  bnez       $v0, .L8014D698
    /* 13AEC 8014D6E4 00000000 */   nop
  .L8014D6E8:
    /* 13AF0 8014D6E8 21300000 */  addu       $a2, $zero, $zero
    /* 13AF4 8014D6EC 0E80093C */  lui        $t1, %hi(dungeon)
    /* 13AF8 8014D6F0 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* 13AFC 8014D6F4 08000824 */  addiu      $t0, $zero, 0x8
  .L8014D6F8:
    /* 13B00 8014D6F8 21280000 */  addu       $a1, $zero, $zero
    /* 13B04 8014D6FC 40380600 */  sll        $a3, $a2, 1
    /* 13B08 8014D700 21202001 */  addu       $a0, $t1, $zero
  .L8014D704:
    /* 13B0C 8014D704 2118E400 */  addu       $v1, $a3, $a0
    /* 13B10 8014D708 00006294 */  lhu        $v0, 0x0($v1)
    /* 13B14 8014D70C 00000000 */  nop
    /* 13B18 8014D710 02004014 */  bnez       $v0, .L8014D71C
    /* 13B1C 8014D714 00000000 */   nop
    /* 13B20 8014D718 000068A4 */  sh         $t0, 0x0($v1)
  .L8014D71C:
    /* 13B24 8014D71C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 13B28 8014D720 2F00A228 */  slti       $v0, $a1, 0x2F
    /* 13B2C 8014D724 F7FF4014 */  bnez       $v0, .L8014D704
    /* 13B30 8014D728 60008424 */   addiu     $a0, $a0, 0x60
    /* 13B34 8014D72C 0100C624 */  addiu      $a2, $a2, 0x1
    /* 13B38 8014D730 2F00C228 */  slti       $v0, $a2, 0x2F
    /* 13B3C 8014D734 F0FF4014 */  bnez       $v0, .L8014D6F8
    /* 13B40 8014D738 00000000 */   nop
    /* 13B44 8014D73C 0E80073C */  lui        $a3, %hi(pdungeon)
    /* 13B48 8014D740 C452E724 */  addiu      $a3, $a3, %lo(pdungeon)
    /* 13B4C 8014D744 0E80063C */  lui        $a2, %hi(dungeon)
    /* 13B50 8014D748 C440C624 */  addiu      $a2, $a2, %lo(dungeon)
    /* 13B54 8014D74C 2510C700 */  or         $v0, $a2, $a3
    /* 13B58 8014D750 03004230 */  andi       $v0, $v0, 0x3
    /* 13B5C 8014D754 16004010 */  beqz       $v0, .L8014D7B0
    /* 13B60 8014D758 4006C824 */   addiu     $t0, $a2, 0x640
  .L8014D75C:
    /* 13B64 8014D75C 0300C288 */  lwl        $v0, 0x3($a2)
    /* 13B68 8014D760 0000C298 */  lwr        $v0, 0x0($a2)
    /* 13B6C 8014D764 0700C388 */  lwl        $v1, 0x7($a2)
    /* 13B70 8014D768 0400C398 */  lwr        $v1, 0x4($a2)
    /* 13B74 8014D76C 0B00C488 */  lwl        $a0, 0xB($a2)
    /* 13B78 8014D770 0800C498 */  lwr        $a0, 0x8($a2)
    /* 13B7C 8014D774 0F00C588 */  lwl        $a1, 0xF($a2)
    /* 13B80 8014D778 0C00C598 */  lwr        $a1, 0xC($a2)
    /* 13B84 8014D77C 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 13B88 8014D780 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 13B8C 8014D784 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 13B90 8014D788 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 13B94 8014D78C 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* 13B98 8014D790 0800E4B8 */  swr        $a0, 0x8($a3)
    /* 13B9C 8014D794 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* 13BA0 8014D798 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* 13BA4 8014D79C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 13BA8 8014D7A0 EEFFC814 */  bne        $a2, $t0, .L8014D75C
    /* 13BAC 8014D7A4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 13BB0 8014D7A8 F7350508 */  j          .L8014D7DC
    /* 13BB4 8014D7AC 00000000 */   nop
  .L8014D7B0:
    /* 13BB8 8014D7B0 0000C28C */  lw         $v0, 0x0($a2)
    /* 13BBC 8014D7B4 0400C38C */  lw         $v1, 0x4($a2)
    /* 13BC0 8014D7B8 0800C48C */  lw         $a0, 0x8($a2)
    /* 13BC4 8014D7BC 0C00C58C */  lw         $a1, 0xC($a2)
    /* 13BC8 8014D7C0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 13BCC 8014D7C4 0400E3AC */  sw         $v1, 0x4($a3)
    /* 13BD0 8014D7C8 0800E4AC */  sw         $a0, 0x8($a3)
    /* 13BD4 8014D7CC 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 13BD8 8014D7D0 1000C624 */  addiu      $a2, $a2, 0x10
    /* 13BDC 8014D7D4 F6FFC814 */  bne        $a2, $t0, .L8014D7B0
    /* 13BE0 8014D7D8 1000E724 */   addiu     $a3, $a3, 0x10
  .L8014D7DC:
    /* 13BE4 8014D7DC F7F6000C */  jal        mem_free_dbg__FPv
    /* 13BE8 8014D7E0 21208001 */   addu      $a0, $t4, $zero
    /* 13BEC 8014D7E4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 13BF0 8014D7E8 2000B08F */  lw         $s0, 0x20($sp)
    /* 13BF4 8014D7EC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 13BF8 8014D7F0 0800E003 */  jr         $ra
    /* 13BFC 8014D7F4 00000000 */   nop
endlabel LoadPreL3Dungeon__FPcii
