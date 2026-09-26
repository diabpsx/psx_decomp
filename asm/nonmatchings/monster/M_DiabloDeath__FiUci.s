.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DiabloDeath__FiUci, 0x328

glabel M_DiabloDeath__FiUci
    /* 119C8 8014B5C0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 119CC 8014B5C4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 119D0 8014B5C8 21A88000 */  addu       $s5, $a0, $zero
    /* 119D4 8014B5CC 5C030424 */  addiu      $a0, $zero, 0x35C
    /* 119D8 8014B5D0 2000B0AF */  sw         $s0, 0x20($sp)
    /* 119DC 8014B5D4 2180A000 */  addu       $s0, $a1, $zero
    /* 119E0 8014B5D8 40101500 */  sll        $v0, $s5, 1
    /* 119E4 8014B5DC 21105500 */  addu       $v0, $v0, $s5
    /* 119E8 8014B5E0 80100200 */  sll        $v0, $v0, 2
    /* 119EC 8014B5E4 21105500 */  addu       $v0, $v0, $s5
    /* 119F0 8014B5E8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 119F4 8014B5EC C0880200 */  sll        $s1, $v0, 3
    /* 119F8 8014B5F0 1080023C */  lui        $v0, %hi(monster)
    /* 119FC 8014B5F4 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 11A00 8014B5F8 3800B6AF */  sw         $s6, 0x38($sp)
    /* 11A04 8014B5FC 21B02202 */  addu       $s6, $s1, $v0
    /* 11A08 8014B600 4000BEAF */  sw         $fp, 0x40($sp)
    /* 11A0C 8014B604 21F04000 */  addu       $fp, $v0, $zero
    /* 11A10 8014B608 4400BFAF */  sw         $ra, 0x44($sp)
    /* 11A14 8014B60C 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 11A18 8014B610 3000B4AF */  sw         $s4, 0x30($sp)
    /* 11A1C 8014B614 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 11A20 8014B618 2800B2AF */  sw         $s2, 0x28($sp)
    /* 11A24 8014B61C C6F5000C */  jal        PlaySFX__Fi
    /* 11A28 8014B620 1800A6AF */   sw        $a2, 0x18($sp)
    /* 11A2C 8014B624 03000224 */  addiu      $v0, $zero, 0x3
    /* 11A30 8014B628 FF001032 */  andi       $s0, $s0, 0xFF
    /* 11A34 8014B62C 0E80013C */  lui        $at, %hi(quests + 0x66)
    /* 11A38 8014B630 A6DA22A0 */  sb         $v0, %lo(quests + 0x66)($at)
    /* 11A3C 8014B634 03000012 */  beqz       $s0, .L8014B644
    /* 11A40 8014B638 01000424 */   addiu     $a0, $zero, 0x1
    /* 11A44 8014B63C 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 11A48 8014B640 05000524 */   addiu     $a1, $zero, 0x5
  .L8014B644:
    /* 11A4C 8014B644 1280013C */  lui        $at, %hi(gbProcessPlayers)
    /* 11A50 8014B648 00B820A0 */  sb         $zero, %lo(gbProcessPlayers)($at)
    /* 11A54 8014B64C 21A00000 */  addu       $s4, $zero, $zero
    /* 11A58 8014B650 21B82002 */  addu       $s7, $s1, $zero
  .L8014B654:
    /* 11A5C 8014B654 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 11A60 8014B658 00000000 */  nop
    /* 11A64 8014B65C 2A108202 */  slt        $v0, $s4, $v0
    /* 11A68 8014B660 4C004010 */  beqz       $v0, .L8014B794
    /* 11A6C 8014B664 40101400 */   sll       $v0, $s4, 1
    /* 11A70 8014B668 1180013C */  lui        $at, %hi(monstactive)
    /* 11A74 8014B66C 21082200 */  addu       $at, $at, $v0
    /* 11A78 8014B670 C4A03384 */  lh         $s3, %lo(monstactive)($at)
    /* 11A7C 8014B674 00000000 */  nop
    /* 11A80 8014B678 44007512 */  beq        $s3, $s5, .L8014B78C
    /* 11A84 8014B67C 00000000 */   nop
    /* 11A88 8014B680 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 11A8C 8014B684 21083700 */  addu       $at, $at, $s7
    /* 11A90 8014B688 E2532290 */  lbu        $v0, %lo(monster + 0x4E)($at)
    /* 11A94 8014B68C 00000000 */  nop
    /* 11A98 8014B690 3E004010 */  beqz       $v0, .L8014B78C
    /* 11A9C 8014B694 21206002 */   addu      $a0, $s3, $zero
    /* 11AA0 8014B698 04000724 */  addiu      $a3, $zero, 0x4
    /* 11AA4 8014B69C 40801300 */  sll        $s0, $s3, 1
    /* 11AA8 8014B6A0 21801302 */  addu       $s0, $s0, $s3
    /* 11AAC 8014B6A4 80801000 */  sll        $s0, $s0, 2
    /* 11AB0 8014B6A8 21801302 */  addu       $s0, $s0, $s3
    /* 11AB4 8014B6AC C0801000 */  sll        $s0, $s0, 3
    /* 11AB8 8014B6B0 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 11ABC 8014B6B4 21083000 */  addu       $at, $at, $s0
    /* 11AC0 8014B6B8 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 11AC4 8014B6BC 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11AC8 8014B6C0 21083000 */  addu       $at, $at, $s0
    /* 11ACC 8014B6C4 D0532680 */  lb         $a2, %lo(monster + 0x3C)($at)
    /* 11AD0 8014B6C8 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 11AD4 8014B6CC 0C00A524 */   addiu     $a1, $a1, 0xC
    /* 11AD8 8014B6D0 21101E02 */  addu       $v0, $s0, $fp
    /* 11ADC 8014B6D4 38005280 */  lb         $s2, 0x38($v0)
    /* 11AE0 8014B6D8 39005180 */  lb         $s1, 0x39($v0)
    /* 11AE4 8014B6DC 06000224 */  addiu      $v0, $zero, 0x6
    /* 11AE8 8014B6E0 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 11AEC 8014B6E4 21083000 */  addu       $at, $at, $s0
    /* 11AF0 8014B6E8 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 11AF4 8014B6EC 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 11AF8 8014B6F0 21083000 */  addu       $at, $at, $s0
    /* 11AFC 8014B6F4 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 11B00 8014B6F8 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 11B04 8014B6FC 21083000 */  addu       $at, $at, $s0
    /* 11B08 8014B700 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 11B0C 8014B704 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 11B10 8014B708 21083000 */  addu       $at, $at, $s0
    /* 11B14 8014B70C AC5320A4 */  sh         $zero, %lo(monster + 0x18)($at)
    /* 11B18 8014B710 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 11B1C 8014B714 21083000 */  addu       $at, $at, $s0
    /* 11B20 8014B718 C85332A0 */  sb         $s2, %lo(monster + 0x34)($at)
    /* 11B24 8014B71C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 11B28 8014B720 21083000 */  addu       $at, $at, $s0
    /* 11B2C 8014B724 C95331A0 */  sb         $s1, %lo(monster + 0x35)($at)
    /* 11B30 8014B728 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 11B34 8014B72C 21083000 */  addu       $at, $at, $s0
    /* 11B38 8014B730 CA5332A0 */  sb         $s2, %lo(monster + 0x36)($at)
    /* 11B3C 8014B734 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 11B40 8014B738 21083000 */  addu       $at, $at, $s0
    /* 11B44 8014B73C CB5331A0 */  sb         $s1, %lo(monster + 0x37)($at)
    /* 11B48 8014B740 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 11B4C 8014B744 21083000 */  addu       $at, $at, $s0
    /* 11B50 8014B748 CC5332A0 */  sb         $s2, %lo(monster + 0x38)($at)
    /* 11B54 8014B74C 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 11B58 8014B750 21083000 */  addu       $at, $at, $s0
    /* 11B5C 8014B754 CD5331A0 */  sb         $s1, %lo(monster + 0x39)($at)
    /* 11B60 8014B758 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 11B64 8014B75C 21206002 */   addu      $a0, $s3, $zero
    /* 11B68 8014B760 D7FC010C */  jal        M_ClearSquares__Fi
    /* 11B6C 8014B764 21206002 */   addu      $a0, $s3, $zero
    /* 11B70 8014B768 C0881100 */  sll        $s1, $s1, 3
    /* 11B74 8014B76C C0101200 */  sll        $v0, $s2, 3
    /* 11B78 8014B770 23105200 */  subu       $v0, $v0, $s2
    /* 11B7C 8014B774 C0110200 */  sll        $v0, $v0, 7
    /* 11B80 8014B778 21882202 */  addu       $s1, $s1, $v0
    /* 11B84 8014B77C 01006226 */  addiu      $v0, $s3, 0x1
    /* 11B88 8014B780 0E80013C */  lui        $at, %hi(dung_map)
    /* 11B8C 8014B784 21083100 */  addu       $at, $at, $s1
    /* 11B90 8014B788 287A22A4 */  sh         $v0, %lo(dung_map)($at)
  .L8014B78C:
    /* 11B94 8014B78C 952D0508 */  j          .L8014B654
    /* 11B98 8014B790 01009426 */   addiu     $s4, $s4, 0x1
  .L8014B794:
    /* 11B9C 8014B794 40101500 */  sll        $v0, $s5, 1
    /* 11BA0 8014B798 21105500 */  addu       $v0, $v0, $s5
    /* 11BA4 8014B79C 80100200 */  sll        $v0, $v0, 2
    /* 11BA8 8014B7A0 21105500 */  addu       $v0, $v0, $s5
    /* 11BAC 8014B7A4 C0100200 */  sll        $v0, $v0, 3
    /* 11BB0 8014B7A8 21105E00 */  addu       $v0, $v0, $fp
    /* 11BB4 8014B7AC 3400C482 */  lb         $a0, 0x34($s6)
    /* 11BB8 8014B7B0 3500C582 */  lb         $a1, 0x35($s6)
    /* 11BBC 8014B7B4 34005280 */  lb         $s2, 0x34($v0)
    /* 11BC0 8014B7B8 35005380 */  lb         $s3, 0x35($v0)
    /* 11BC4 8014B7BC BA34010C */  jal        AddLight__Fiii
    /* 11BC8 8014B7C0 03000624 */   addiu     $a2, $zero, 0x3
    /* 11BCC 8014B7C4 21204002 */  addu       $a0, $s2, $zero
    /* 11BD0 8014B7C8 21286002 */  addu       $a1, $s3, $zero
    /* 11BD4 8014B7CC 08000624 */  addiu      $a2, $zero, 0x8
    /* 11BD8 8014B7D0 21380000 */  addu       $a3, $zero, $zero
    /* 11BDC 8014B7D4 5900C2A2 */  sb         $v0, 0x59($s6)
    /* 11BE0 8014B7D8 01000224 */  addiu      $v0, $zero, 0x1
    /* 11BE4 8014B7DC 9033010C */  jal        DoVision__FiiiUcUc
    /* 11BE8 8014B7E0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 11BEC 8014B7E4 1280043C */  lui        $a0, %hi(ViewX)
    /* 11BF0 8014B7E8 14C1848C */  lw         $a0, %lo(ViewX)($a0)
    /* 11BF4 8014B7EC 6D41000C */  jal        abs
    /* 11BF8 8014B7F0 23209200 */   subu      $a0, $a0, $s2
    /* 11BFC 8014B7F4 1280043C */  lui        $a0, %hi(ViewY)
    /* 11C00 8014B7F8 18C1848C */  lw         $a0, %lo(ViewY)($a0)
    /* 11C04 8014B7FC 21804000 */  addu       $s0, $v0, $zero
    /* 11C08 8014B800 6D41000C */  jal        abs
    /* 11C0C 8014B804 23209300 */   subu      $a0, $a0, $s3
    /* 11C10 8014B808 2A105000 */  slt        $v0, $v0, $s0
    /* 11C14 8014B80C 05004010 */  beqz       $v0, .L8014B824
    /* 11C18 8014B810 00000000 */   nop
    /* 11C1C 8014B814 1280043C */  lui        $a0, %hi(ViewX)
    /* 11C20 8014B818 14C1848C */  lw         $a0, %lo(ViewX)($a0)
    /* 11C24 8014B81C 0D2E0508 */  j          .L8014B834
    /* 11C28 8014B820 23209200 */   subu      $a0, $a0, $s2
  .L8014B824:
    /* 11C2C 8014B824 1280043C */  lui        $a0, %hi(ViewY)
    /* 11C30 8014B828 18C1848C */  lw         $a0, %lo(ViewY)($a0)
    /* 11C34 8014B82C 00000000 */  nop
    /* 11C38 8014B830 23209300 */  subu       $a0, $a0, $s3
  .L8014B834:
    /* 11C3C 8014B834 6D41000C */  jal        abs
    /* 11C40 8014B838 00000000 */   nop
    /* 11C44 8014B83C 21184000 */  addu       $v1, $v0, $zero
    /* 11C48 8014B840 15006228 */  slti       $v0, $v1, 0x15
    /* 11C4C 8014B844 02004010 */  beqz       $v0, .L8014B850
    /* 11C50 8014B848 14000424 */   addiu     $a0, $zero, 0x14
    /* 11C54 8014B84C 21206000 */  addu       $a0, $v1, $zero
  .L8014B850:
    /* 11C58 8014B850 21188000 */  addu       $v1, $a0, $zero
    /* 11C5C 8014B854 21806000 */  addu       $s0, $v1, $zero
    /* 11C60 8014B858 C38F0300 */  sra        $s1, $v1, 31
    /* 11C64 8014B85C 21300002 */  addu       $a2, $s0, $zero
    /* 11C68 8014B860 21382002 */  addu       $a3, $s1, $zero
    /* 11C6C 8014B864 1C00C0A6 */  sh         $zero, 0x1C($s6)
    /* 11C70 8014B868 1E00C0A6 */  sh         $zero, 0x1E($s6)
    /* 11C74 8014B86C 001C1200 */  sll        $v1, $s2, 16
    /* 11C78 8014B870 1C00C286 */  lh         $v0, 0x1C($s6)
    /* 11C7C 8014B874 1800A897 */  lhu        $t0, 0x18($sp)
    /* 11C80 8014B878 23104300 */  subu       $v0, $v0, $v1
    /* 11C84 8014B87C 21204000 */  addu       $a0, $v0, $zero
    /* 11C88 8014B880 C32F0200 */  sra        $a1, $v0, 31
    /* 11C8C 8014B884 9844000C */  jal        __divdi3
    /* 11C90 8014B888 2600C8A6 */   sh        $t0, 0x26($s6)
    /* 11C94 8014B88C 21300002 */  addu       $a2, $s0, $zero
    /* 11C98 8014B890 21382002 */  addu       $a3, $s1, $zero
    /* 11C9C 8014B894 2000C2A6 */  sh         $v0, 0x20($s6)
    /* 11CA0 8014B898 1E00C286 */  lh         $v0, 0x1E($s6)
    /* 11CA4 8014B89C 001C1300 */  sll        $v1, $s3, 16
    /* 11CA8 8014B8A0 23104300 */  subu       $v0, $v0, $v1
    /* 11CAC 8014B8A4 21204000 */  addu       $a0, $v0, $zero
    /* 11CB0 8014B8A8 9844000C */  jal        __divdi3
    /* 11CB4 8014B8AC C32F0200 */   sra       $a1, $v0, 31
    /* 11CB8 8014B8B0 2200C2A6 */  sh         $v0, 0x22($s6)
    /* 11CBC 8014B8B4 4400BF8F */  lw         $ra, 0x44($sp)
    /* 11CC0 8014B8B8 4000BE8F */  lw         $fp, 0x40($sp)
    /* 11CC4 8014B8BC 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 11CC8 8014B8C0 3800B68F */  lw         $s6, 0x38($sp)
    /* 11CCC 8014B8C4 3400B58F */  lw         $s5, 0x34($sp)
    /* 11CD0 8014B8C8 3000B48F */  lw         $s4, 0x30($sp)
    /* 11CD4 8014B8CC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 11CD8 8014B8D0 2800B28F */  lw         $s2, 0x28($sp)
    /* 11CDC 8014B8D4 2400B18F */  lw         $s1, 0x24($sp)
    /* 11CE0 8014B8D8 2000B08F */  lw         $s0, 0x20($sp)
    /* 11CE4 8014B8DC 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 11CE8 8014B8E0 0800E003 */  jr         $ra
    /* 11CEC 8014B8E4 00000000 */   nop
endlabel M_DiabloDeath__FiUci
