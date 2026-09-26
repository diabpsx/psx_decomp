.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveInvItem__Fii, 0x2B0

glabel RemoveInvItem__Fii
    /* 23B04 8015D6FC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 23B08 8015D700 1800B0AF */  sw         $s0, 0x18($sp)
    /* 23B0C 8015D704 21808000 */  addu       $s0, $a0, $zero
    /* 23B10 8015D708 0100A824 */  addiu      $t0, $a1, 0x1
    /* 23B14 8015D70C 23280800 */  negu       $a1, $t0
    /* 23B18 8015D710 40101000 */  sll        $v0, $s0, 1
    /* 23B1C 8015D714 21105000 */  addu       $v0, $v0, $s0
    /* 23B20 8015D718 80100200 */  sll        $v0, $v0, 2
    /* 23B24 8015D71C 21105000 */  addu       $v0, $v0, $s0
    /* 23B28 8015D720 00110200 */  sll        $v0, $v0, 4
    /* 23B2C 8015D724 23105000 */  subu       $v0, $v0, $s0
    /* 23B30 8015D728 80100200 */  sll        $v0, $v0, 2
    /* 23B34 8015D72C 21105000 */  addu       $v0, $v0, $s0
    /* 23B38 8015D730 C0100200 */  sll        $v0, $v0, 3
    /* 23B3C 8015D734 0E80033C */  lui        $v1, %hi(plr + 0x1588)
    /* 23B40 8015D738 C0BA6324 */  addiu      $v1, $v1, %lo(plr + 0x1588)
    /* 23B44 8015D73C 21184300 */  addu       $v1, $v0, $v1
    /* 23B48 8015D740 28006424 */  addiu      $a0, $v1, 0x28
    /* 23B4C 8015D744 1C00BFAF */  sw         $ra, 0x1C($sp)
  .L8015D748:
    /* 23B50 8015D748 00006280 */  lb         $v0, 0x0($v1)
    /* 23B54 8015D74C 00000000 */  nop
    /* 23B58 8015D750 03004810 */  beq        $v0, $t0, .L8015D760
    /* 23B5C 8015D754 00000000 */   nop
    /* 23B60 8015D758 02004514 */  bne        $v0, $a1, .L8015D764
    /* 23B64 8015D75C 00000000 */   nop
  .L8015D760:
    /* 23B68 8015D760 000060A0 */  sb         $zero, 0x0($v1)
  .L8015D764:
    /* 23B6C 8015D764 01006324 */  addiu      $v1, $v1, 0x1
    /* 23B70 8015D768 2A106400 */  slt        $v0, $v1, $a0
    /* 23B74 8015D76C F6FF4014 */  bnez       $v0, .L8015D748
    /* 23B78 8015D770 40101000 */   sll       $v0, $s0, 1
    /* 23B7C 8015D774 21105000 */  addu       $v0, $v0, $s0
    /* 23B80 8015D778 80100200 */  sll        $v0, $v0, 2
    /* 23B84 8015D77C 21105000 */  addu       $v0, $v0, $s0
    /* 23B88 8015D780 00110200 */  sll        $v0, $v0, 4
    /* 23B8C 8015D784 23105000 */  subu       $v0, $v0, $s0
    /* 23B90 8015D788 80100200 */  sll        $v0, $v0, 2
    /* 23B94 8015D78C 21105000 */  addu       $v0, $v0, $s0
    /* 23B98 8015D790 C0280200 */  sll        $a1, $v0, 3
    /* 23B9C 8015D794 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 23BA0 8015D798 21082500 */  addu       $at, $at, $a1
    /* 23BA4 8015D79C BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 23BA8 8015D7A0 00000000 */  nop
    /* 23BAC 8015D7A4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 23BB0 8015D7A8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 23BB4 8015D7AC 21082500 */  addu       $at, $at, $a1
    /* 23BB8 8015D7B0 BCBA22AC */  sw         $v0, %lo(plr + 0x1584)($at)
    /* 23BBC 8015D7B4 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 23BC0 8015D7B8 21082500 */  addu       $at, $at, $a1
    /* 23BC4 8015D7BC BCBA248C */  lw         $a0, %lo(plr + 0x1584)($at)
    /* 23BC8 8015D7C0 0E80033C */  lui        $v1, %hi(plr)
    /* 23BCC 8015D7C4 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 23BD0 8015D7C8 45008018 */  blez       $a0, .L8015D8E0
    /* 23BD4 8015D7CC FFFF0825 */   addiu     $t0, $t0, -0x1
    /* 23BD8 8015D7D0 43008810 */  beq        $a0, $t0, .L8015D8E0
    /* 23BDC 8015D7D4 A4046324 */   addiu     $v1, $v1, 0x4A4
    /* 23BE0 8015D7D8 C0100800 */  sll        $v0, $t0, 3
    /* 23BE4 8015D7DC 23104800 */  subu       $v0, $v0, $t0
    /* 23BE8 8015D7E0 80100200 */  sll        $v0, $v0, 2
    /* 23BEC 8015D7E4 23104800 */  subu       $v0, $v0, $t0
    /* 23BF0 8015D7E8 80100200 */  sll        $v0, $v0, 2
    /* 23BF4 8015D7EC 2118A300 */  addu       $v1, $a1, $v1
    /* 23BF8 8015D7F0 21384300 */  addu       $a3, $v0, $v1
    /* 23BFC 8015D7F4 C0100400 */  sll        $v0, $a0, 3
    /* 23C00 8015D7F8 23104400 */  subu       $v0, $v0, $a0
    /* 23C04 8015D7FC 80100200 */  sll        $v0, $v0, 2
    /* 23C08 8015D800 23104400 */  subu       $v0, $v0, $a0
    /* 23C0C 8015D804 80100200 */  sll        $v0, $v0, 2
    /* 23C10 8015D808 21304300 */  addu       $a2, $v0, $v1
    /* 23C14 8015D80C 6000C924 */  addiu      $t1, $a2, 0x60
  .L8015D810:
    /* 23C18 8015D810 0000C28C */  lw         $v0, 0x0($a2)
    /* 23C1C 8015D814 0400C38C */  lw         $v1, 0x4($a2)
    /* 23C20 8015D818 0800C48C */  lw         $a0, 0x8($a2)
    /* 23C24 8015D81C 0C00C58C */  lw         $a1, 0xC($a2)
    /* 23C28 8015D820 0000E2AC */  sw         $v0, 0x0($a3)
    /* 23C2C 8015D824 0400E3AC */  sw         $v1, 0x4($a3)
    /* 23C30 8015D828 0800E4AC */  sw         $a0, 0x8($a3)
    /* 23C34 8015D82C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 23C38 8015D830 1000C624 */  addiu      $a2, $a2, 0x10
    /* 23C3C 8015D834 F6FFC914 */  bne        $a2, $t1, .L8015D810
    /* 23C40 8015D838 1000E724 */   addiu     $a3, $a3, 0x10
    /* 23C44 8015D83C 0000C28C */  lw         $v0, 0x0($a2)
    /* 23C48 8015D840 0400C38C */  lw         $v1, 0x4($a2)
    /* 23C4C 8015D844 0800C48C */  lw         $a0, 0x8($a2)
    /* 23C50 8015D848 0000E2AC */  sw         $v0, 0x0($a3)
    /* 23C54 8015D84C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 23C58 8015D850 0800E4AC */  sw         $a0, 0x8($a3)
    /* 23C5C 8015D854 01000525 */  addiu      $a1, $t0, 0x1
    /* 23C60 8015D858 23400500 */  negu       $t0, $a1
    /* 23C64 8015D85C 40101000 */  sll        $v0, $s0, 1
    /* 23C68 8015D860 21105000 */  addu       $v0, $v0, $s0
    /* 23C6C 8015D864 80100200 */  sll        $v0, $v0, 2
    /* 23C70 8015D868 21105000 */  addu       $v0, $v0, $s0
    /* 23C74 8015D86C 00110200 */  sll        $v0, $v0, 4
    /* 23C78 8015D870 23105000 */  subu       $v0, $v0, $s0
    /* 23C7C 8015D874 80100200 */  sll        $v0, $v0, 2
    /* 23C80 8015D878 21105000 */  addu       $v0, $v0, $s0
    /* 23C84 8015D87C C0300200 */  sll        $a2, $v0, 3
    /* 23C88 8015D880 0E80023C */  lui        $v0, %hi(plr + 0x1588)
    /* 23C8C 8015D884 C0BA4224 */  addiu      $v0, $v0, %lo(plr + 0x1588)
    /* 23C90 8015D888 2120C200 */  addu       $a0, $a2, $v0
    /* 23C94 8015D88C 28008724 */  addiu      $a3, $a0, 0x28
  .L8015D890:
    /* 23C98 8015D890 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 23C9C 8015D894 21082600 */  addu       $at, $at, $a2
    /* 23CA0 8015D898 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 23CA4 8015D89C 00008380 */  lb         $v1, 0x0($a0)
    /* 23CA8 8015D8A0 01004224 */  addiu      $v0, $v0, 0x1
    /* 23CAC 8015D8A4 02006214 */  bne        $v1, $v0, .L8015D8B0
    /* 23CB0 8015D8A8 00000000 */   nop
    /* 23CB4 8015D8AC 000085A0 */  sb         $a1, 0x0($a0)
  .L8015D8B0:
    /* 23CB8 8015D8B0 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 23CBC 8015D8B4 21082600 */  addu       $at, $at, $a2
    /* 23CC0 8015D8B8 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 23CC4 8015D8BC 00008380 */  lb         $v1, 0x0($a0)
    /* 23CC8 8015D8C0 27100200 */  nor        $v0, $zero, $v0
    /* 23CCC 8015D8C4 02006214 */  bne        $v1, $v0, .L8015D8D0
    /* 23CD0 8015D8C8 00000000 */   nop
    /* 23CD4 8015D8CC 000088A0 */  sb         $t0, 0x0($a0)
  .L8015D8D0:
    /* 23CD8 8015D8D0 01008424 */  addiu      $a0, $a0, 0x1
    /* 23CDC 8015D8D4 2A108700 */  slt        $v0, $a0, $a3
    /* 23CE0 8015D8D8 EDFF4014 */  bnez       $v0, .L8015D890
    /* 23CE4 8015D8DC 00000000 */   nop
  .L8015D8E0:
    /* 23CE8 8015D8E0 4CFC000C */  jal        CalcPlrScrolls__Fi
    /* 23CEC 8015D8E4 21200002 */   addu      $a0, $s0, $zero
    /* 23CF0 8015D8E8 40101000 */  sll        $v0, $s0, 1
    /* 23CF4 8015D8EC 21105000 */  addu       $v0, $v0, $s0
    /* 23CF8 8015D8F0 80100200 */  sll        $v0, $v0, 2
    /* 23CFC 8015D8F4 21105000 */  addu       $v0, $v0, $s0
    /* 23D00 8015D8F8 00110200 */  sll        $v0, $v0, 4
    /* 23D04 8015D8FC 23105000 */  subu       $v0, $v0, $s0
    /* 23D08 8015D900 80100200 */  sll        $v0, $v0, 2
    /* 23D0C 8015D904 21105000 */  addu       $v0, $v0, $s0
    /* 23D10 8015D908 C0300200 */  sll        $a2, $v0, 3
    /* 23D14 8015D90C 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 23D18 8015D910 21082600 */  addu       $at, $at, $a2
    /* 23D1C 8015D914 A0A52380 */  lb         $v1, %lo(plr + 0x68)($at)
    /* 23D20 8015D918 02000224 */  addiu      $v0, $zero, 0x2
    /* 23D24 8015D91C 1E006214 */  bne        $v1, $v0, .L8015D998
    /* 23D28 8015D920 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 23D2C 8015D924 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 23D30 8015D928 21082600 */  addu       $at, $at, $a2
    /* 23D34 8015D92C 9CA5258C */  lw         $a1, %lo(plr + 0x64)($at)
    /* 23D38 8015D930 00000000 */  nop
    /* 23D3C 8015D934 1800A710 */  beq        $a1, $a3, .L8015D998
    /* 23D40 8015D938 FFFFA524 */   addiu     $a1, $a1, -0x1
    /* 23D44 8015D93C 01000424 */  addiu      $a0, $zero, 0x1
    /* 23D48 8015D940 0420A400 */  sllv       $a0, $a0, $a1
    /* 23D4C 8015D944 21108000 */  addu       $v0, $a0, $zero
    /* 23D50 8015D948 C31F0400 */  sra        $v1, $a0, 31
    /* 23D54 8015D94C 0E80013C */  lui        $at, %hi(plr + 0xC8)
    /* 23D58 8015D950 21082600 */  addu       $at, $at, $a2
    /* 23D5C 8015D954 00A6248C */  lw         $a0, %lo(plr + 0xC8)($at)
    /* 23D60 8015D958 0E80013C */  lui        $at, %hi(plr + 0xCC)
    /* 23D64 8015D95C 21082600 */  addu       $at, $at, $a2
    /* 23D68 8015D960 04A6258C */  lw         $a1, %lo(plr + 0xCC)($at)
    /* 23D6C 8015D964 00000000 */  nop
    /* 23D70 8015D968 2428A300 */  and        $a1, $a1, $v1
    /* 23D74 8015D96C 24208200 */  and        $a0, $a0, $v0
    /* 23D78 8015D970 06008014 */  bnez       $a0, .L8015D98C
    /* 23D7C 8015D974 00000000 */   nop
    /* 23D80 8015D978 0500A014 */  bnez       $a1, .L8015D990
    /* 23D84 8015D97C FF000224 */   addiu     $v0, $zero, 0xFF
    /* 23D88 8015D980 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 23D8C 8015D984 21082600 */  addu       $at, $at, $a2
    /* 23D90 8015D988 9CA527AC */  sw         $a3, %lo(plr + 0x64)($at)
  .L8015D98C:
    /* 23D94 8015D98C FF000224 */  addiu      $v0, $zero, 0xFF
  .L8015D990:
    /* 23D98 8015D990 1280013C */  lui        $at, %hi(force_redraw)
    /* 23D9C 8015D994 90B722AC */  sw         $v0, %lo(force_redraw)($at)
  .L8015D998:
    /* 23DA0 8015D998 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 23DA4 8015D99C 1800B08F */  lw         $s0, 0x18($sp)
    /* 23DA8 8015D9A0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 23DAC 8015D9A4 0800E003 */  jr         $ra
    /* 23DB0 8015D9A8 00000000 */   nop
endlabel RemoveInvItem__Fii
