.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoldAutoPlace__Fi, 0x4D8

glabel GoldAutoPlace__Fi
    /* 209F8 8015A5F0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 209FC 8015A5F4 3000B2AF */  sw         $s2, 0x30($sp)
    /* 20A00 8015A5F8 21908000 */  addu       $s2, $a0, $zero
    /* 20A04 8015A5FC 21300000 */  addu       $a2, $zero, $zero
    /* 20A08 8015A600 40181200 */  sll        $v1, $s2, 1
    /* 20A0C 8015A604 21107200 */  addu       $v0, $v1, $s2
    /* 20A10 8015A608 80100200 */  sll        $v0, $v0, 2
    /* 20A14 8015A60C 21105200 */  addu       $v0, $v0, $s2
    /* 20A18 8015A610 00110200 */  sll        $v0, $v0, 4
    /* 20A1C 8015A614 23105200 */  subu       $v0, $v0, $s2
    /* 20A20 8015A618 80100200 */  sll        $v0, $v0, 2
    /* 20A24 8015A61C 21105200 */  addu       $v0, $v0, $s2
    /* 20A28 8015A620 C0200200 */  sll        $a0, $v0, 3
    /* 20A2C 8015A624 4000BFAF */  sw         $ra, 0x40($sp)
    /* 20A30 8015A628 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 20A34 8015A62C 3800B4AF */  sw         $s4, 0x38($sp)
    /* 20A38 8015A630 3400B3AF */  sw         $s3, 0x34($sp)
    /* 20A3C 8015A634 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 20A40 8015A638 2800B0AF */  sw         $s0, 0x28($sp)
    /* 20A44 8015A63C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20A48 8015A640 21082400 */  addu       $at, $at, $a0
    /* 20A4C 8015A644 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 20A50 8015A648 00000000 */  nop
    /* 20A54 8015A64C 43004018 */  blez       $v0, .L8015A75C
    /* 20A58 8015A650 21800000 */   addu      $s0, $zero, $zero
    /* 20A5C 8015A654 21988000 */  addu       $s3, $a0, $zero
    /* 20A60 8015A658 21880000 */  addu       $s1, $zero, $zero
    /* 20A64 8015A65C 21107200 */  addu       $v0, $v1, $s2
  .L8015A660:
    /* 20A68 8015A660 80100200 */  sll        $v0, $v0, 2
    /* 20A6C 8015A664 21105200 */  addu       $v0, $v0, $s2
    /* 20A70 8015A668 00110200 */  sll        $v0, $v0, 4
    /* 20A74 8015A66C 23105200 */  subu       $v0, $v0, $s2
    /* 20A78 8015A670 80100200 */  sll        $v0, $v0, 2
    /* 20A7C 8015A674 21105200 */  addu       $v0, $v0, $s2
    /* 20A80 8015A678 C0280200 */  sll        $a1, $v0, 3
    /* 20A84 8015A67C 21202502 */  addu       $a0, $s1, $a1
    /* 20A88 8015A680 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 20A8C 8015A684 21082400 */  addu       $at, $at, $a0
    /* 20A90 8015A688 08AA2384 */  lh         $v1, %lo(plr + 0x4D0)($at)
    /* 20A94 8015A68C 0B000224 */  addiu      $v0, $zero, 0xB
    /* 20A98 8015A690 20006214 */  bne        $v1, $v0, .L8015A714
    /* 20A9C 8015A694 40181200 */   sll       $v1, $s2, 1
    /* 20AA0 8015A698 0E80013C */  lui        $at, %hi(plr + 0x1924)
    /* 20AA4 8015A69C 21082500 */  addu       $at, $at, $a1
    /* 20AA8 8015A6A0 5CBE228C */  lw         $v0, %lo(plr + 0x1924)($at)
    /* 20AAC 8015A6A4 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 20AB0 8015A6A8 21082400 */  addu       $at, $at, $a0
    /* 20AB4 8015A6AC F0A9238C */  lw         $v1, %lo(plr + 0x4B8)($at)
    /* 20AB8 8015A6B0 00000000 */  nop
    /* 20ABC 8015A6B4 21184300 */  addu       $v1, $v0, $v1
    /* 20AC0 8015A6B8 89136228 */  slti       $v0, $v1, 0x1389
    /* 20AC4 8015A6BC 14004010 */  beqz       $v0, .L8015A710
    /* 20AC8 8015A6C0 C4096228 */   slti      $v0, $v1, 0x9C4
    /* 20ACC 8015A6C4 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 20AD0 8015A6C8 21082400 */  addu       $at, $at, $a0
    /* 20AD4 8015A6CC F0A923AC */  sw         $v1, %lo(plr + 0x4B8)($at)
    /* 20AD8 8015A6D0 03004014 */  bnez       $v0, .L8015A6E0
    /* 20ADC 8015A6D4 E9036228 */   slti      $v0, $v1, 0x3E9
    /* 20AE0 8015A6D8 BB690508 */  j          .L8015A6EC
    /* 20AE4 8015A6DC 06000224 */   addiu     $v0, $zero, 0x6
  .L8015A6E0:
    /* 20AE8 8015A6E0 02004014 */  bnez       $v0, .L8015A6EC
    /* 20AEC 8015A6E4 04000224 */   addiu     $v0, $zero, 0x4
    /* 20AF0 8015A6E8 05000224 */  addiu      $v0, $zero, 0x5
  .L8015A6EC:
    /* 20AF4 8015A6EC 0E80013C */  lui        $at, %hi(plr + 0x4F0)
    /* 20AF8 8015A6F0 21082400 */  addu       $at, $at, $a0
    /* 20AFC 8015A6F4 28AA22A0 */  sb         $v0, %lo(plr + 0x4F0)($at)
    /* 20B00 8015A6F8 D982050C */  jal        CalculateGold__Fi
    /* 20B04 8015A6FC 21204002 */   addu      $a0, $s2, $zero
    /* 20B08 8015A700 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 20B0C 8015A704 21083300 */  addu       $at, $at, $s3
    /* 20B10 8015A708 88A622AC */  sw         $v0, %lo(plr + 0x150)($at)
    /* 20B14 8015A70C 01000624 */  addiu      $a2, $zero, 0x1
  .L8015A710:
    /* 20B18 8015A710 40181200 */  sll        $v1, $s2, 1
  .L8015A714:
    /* 20B1C 8015A714 21107200 */  addu       $v0, $v1, $s2
    /* 20B20 8015A718 80100200 */  sll        $v0, $v0, 2
    /* 20B24 8015A71C 21105200 */  addu       $v0, $v0, $s2
    /* 20B28 8015A720 00110200 */  sll        $v0, $v0, 4
    /* 20B2C 8015A724 23105200 */  subu       $v0, $v0, $s2
    /* 20B30 8015A728 80100200 */  sll        $v0, $v0, 2
    /* 20B34 8015A72C 21105200 */  addu       $v0, $v0, $s2
    /* 20B38 8015A730 C0100200 */  sll        $v0, $v0, 3
    /* 20B3C 8015A734 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20B40 8015A738 21082200 */  addu       $at, $at, $v0
    /* 20B44 8015A73C BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 20B48 8015A740 01001026 */  addiu      $s0, $s0, 0x1
    /* 20B4C 8015A744 2A100202 */  slt        $v0, $s0, $v0
    /* 20B50 8015A748 04004010 */  beqz       $v0, .L8015A75C
    /* 20B54 8015A74C 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 20B58 8015A750 FF00C230 */  andi       $v0, $a2, 0xFF
    /* 20B5C 8015A754 C2FF4010 */  beqz       $v0, .L8015A660
    /* 20B60 8015A758 21107200 */   addu      $v0, $v1, $s2
  .L8015A75C:
    /* 20B64 8015A75C FF00C230 */  andi       $v0, $a2, 0xFF
    /* 20B68 8015A760 CF004014 */  bnez       $v0, .L8015AAA0
    /* 20B6C 8015A764 2110C000 */   addu      $v0, $a2, $zero
    /* 20B70 8015A768 40181200 */  sll        $v1, $s2, 1
    /* 20B74 8015A76C 21107200 */  addu       $v0, $v1, $s2
    /* 20B78 8015A770 80100200 */  sll        $v0, $v0, 2
    /* 20B7C 8015A774 21105200 */  addu       $v0, $v0, $s2
    /* 20B80 8015A778 00110200 */  sll        $v0, $v0, 4
    /* 20B84 8015A77C 23105200 */  subu       $v0, $v0, $s2
    /* 20B88 8015A780 80100200 */  sll        $v0, $v0, 2
    /* 20B8C 8015A784 21105200 */  addu       $v0, $v0, $s2
    /* 20B90 8015A788 C0200200 */  sll        $a0, $v0, 3
    /* 20B94 8015A78C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20B98 8015A790 21082400 */  addu       $at, $at, $a0
    /* 20B9C 8015A794 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 20BA0 8015A798 00000000 */  nop
    /* 20BA4 8015A79C 47004018 */  blez       $v0, .L8015A8BC
    /* 20BA8 8015A7A0 21800000 */   addu      $s0, $zero, $zero
    /* 20BAC 8015A7A4 21988000 */  addu       $s3, $a0, $zero
    /* 20BB0 8015A7A8 21880000 */  addu       $s1, $zero, $zero
    /* 20BB4 8015A7AC 21107200 */  addu       $v0, $v1, $s2
  .L8015A7B0:
    /* 20BB8 8015A7B0 80100200 */  sll        $v0, $v0, 2
    /* 20BBC 8015A7B4 21105200 */  addu       $v0, $v0, $s2
    /* 20BC0 8015A7B8 00110200 */  sll        $v0, $v0, 4
    /* 20BC4 8015A7BC 23105200 */  subu       $v0, $v0, $s2
    /* 20BC8 8015A7C0 80100200 */  sll        $v0, $v0, 2
    /* 20BCC 8015A7C4 21105200 */  addu       $v0, $v0, $s2
    /* 20BD0 8015A7C8 C0280200 */  sll        $a1, $v0, 3
    /* 20BD4 8015A7CC 21202502 */  addu       $a0, $s1, $a1
    /* 20BD8 8015A7D0 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 20BDC 8015A7D4 21082400 */  addu       $at, $at, $a0
    /* 20BE0 8015A7D8 08AA2384 */  lh         $v1, %lo(plr + 0x4D0)($at)
    /* 20BE4 8015A7DC 0B000224 */  addiu      $v0, $zero, 0xB
    /* 20BE8 8015A7E0 24006214 */  bne        $v1, $v0, .L8015A874
    /* 20BEC 8015A7E4 40181200 */   sll       $v1, $s2, 1
    /* 20BF0 8015A7E8 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 20BF4 8015A7EC 21082400 */  addu       $at, $at, $a0
    /* 20BF8 8015A7F0 F0A9238C */  lw         $v1, %lo(plr + 0x4B8)($at)
    /* 20BFC 8015A7F4 00000000 */  nop
    /* 20C00 8015A7F8 88136228 */  slti       $v0, $v1, 0x1388
    /* 20C04 8015A7FC 1C004010 */  beqz       $v0, .L8015A870
    /* 20C08 8015A800 00000000 */   nop
    /* 20C0C 8015A804 0E80013C */  lui        $at, %hi(plr + 0x1924)
    /* 20C10 8015A808 21082500 */  addu       $at, $at, $a1
    /* 20C14 8015A80C 5CBE228C */  lw         $v0, %lo(plr + 0x1924)($at)
    /* 20C18 8015A810 00000000 */  nop
    /* 20C1C 8015A814 21186200 */  addu       $v1, $v1, $v0
    /* 20C20 8015A818 89136228 */  slti       $v0, $v1, 0x1389
    /* 20C24 8015A81C 14004010 */  beqz       $v0, .L8015A870
    /* 20C28 8015A820 C4096228 */   slti      $v0, $v1, 0x9C4
    /* 20C2C 8015A824 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 20C30 8015A828 21082400 */  addu       $at, $at, $a0
    /* 20C34 8015A82C F0A923AC */  sw         $v1, %lo(plr + 0x4B8)($at)
    /* 20C38 8015A830 03004014 */  bnez       $v0, .L8015A840
    /* 20C3C 8015A834 E9036228 */   slti      $v0, $v1, 0x3E9
    /* 20C40 8015A838 136A0508 */  j          .L8015A84C
    /* 20C44 8015A83C 06000224 */   addiu     $v0, $zero, 0x6
  .L8015A840:
    /* 20C48 8015A840 02004014 */  bnez       $v0, .L8015A84C
    /* 20C4C 8015A844 04000224 */   addiu     $v0, $zero, 0x4
    /* 20C50 8015A848 05000224 */  addiu      $v0, $zero, 0x5
  .L8015A84C:
    /* 20C54 8015A84C 0E80013C */  lui        $at, %hi(plr + 0x4F0)
    /* 20C58 8015A850 21082400 */  addu       $at, $at, $a0
    /* 20C5C 8015A854 28AA22A0 */  sb         $v0, %lo(plr + 0x4F0)($at)
    /* 20C60 8015A858 D982050C */  jal        CalculateGold__Fi
    /* 20C64 8015A85C 21204002 */   addu      $a0, $s2, $zero
    /* 20C68 8015A860 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 20C6C 8015A864 21083300 */  addu       $at, $at, $s3
    /* 20C70 8015A868 88A622AC */  sw         $v0, %lo(plr + 0x150)($at)
    /* 20C74 8015A86C 01000624 */  addiu      $a2, $zero, 0x1
  .L8015A870:
    /* 20C78 8015A870 40181200 */  sll        $v1, $s2, 1
  .L8015A874:
    /* 20C7C 8015A874 21107200 */  addu       $v0, $v1, $s2
    /* 20C80 8015A878 80100200 */  sll        $v0, $v0, 2
    /* 20C84 8015A87C 21105200 */  addu       $v0, $v0, $s2
    /* 20C88 8015A880 00110200 */  sll        $v0, $v0, 4
    /* 20C8C 8015A884 23105200 */  subu       $v0, $v0, $s2
    /* 20C90 8015A888 80100200 */  sll        $v0, $v0, 2
    /* 20C94 8015A88C 21105200 */  addu       $v0, $v0, $s2
    /* 20C98 8015A890 C0100200 */  sll        $v0, $v0, 3
    /* 20C9C 8015A894 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20CA0 8015A898 21082200 */  addu       $at, $at, $v0
    /* 20CA4 8015A89C BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 20CA8 8015A8A0 01001026 */  addiu      $s0, $s0, 0x1
    /* 20CAC 8015A8A4 2A100202 */  slt        $v0, $s0, $v0
    /* 20CB0 8015A8A8 04004010 */  beqz       $v0, .L8015A8BC
    /* 20CB4 8015A8AC 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 20CB8 8015A8B0 FF00C230 */  andi       $v0, $a2, 0xFF
    /* 20CBC 8015A8B4 BEFF4010 */  beqz       $v0, .L8015A7B0
    /* 20CC0 8015A8B8 21107200 */   addu      $v0, $v1, $s2
  .L8015A8BC:
    /* 20CC4 8015A8BC FF00C230 */  andi       $v0, $a2, 0xFF
    /* 20CC8 8015A8C0 77004014 */  bnez       $v0, .L8015AAA0
    /* 20CCC 8015A8C4 2110C000 */   addu      $v0, $a2, $zero
    /* 20CD0 8015A8C8 27001324 */  addiu      $s3, $zero, 0x27
    /* 20CD4 8015A8CC 40101200 */  sll        $v0, $s2, 1
    /* 20CD8 8015A8D0 21105200 */  addu       $v0, $v0, $s2
    /* 20CDC 8015A8D4 80100200 */  sll        $v0, $v0, 2
    /* 20CE0 8015A8D8 21105200 */  addu       $v0, $v0, $s2
    /* 20CE4 8015A8DC 00110200 */  sll        $v0, $v0, 4
    /* 20CE8 8015A8E0 23105200 */  subu       $v0, $v0, $s2
    /* 20CEC 8015A8E4 80100200 */  sll        $v0, $v0, 2
    /* 20CF0 8015A8E8 21105200 */  addu       $v0, $v0, $s2
    /* 20CF4 8015A8EC C0880200 */  sll        $s1, $v0, 3
    /* 20CF8 8015A8F0 0E80143C */  lui        $s4, %hi(plr + 0x1588)
    /* 20CFC 8015A8F4 C0BA9426 */  addiu      $s4, $s4, %lo(plr + 0x1588)
    /* 20D00 8015A8F8 88039526 */  addiu      $s5, $s4, 0x388
    /* 20D04 8015A8FC 6666023C */  lui        $v0, (0x66666667 >> 16)
  .L8015A900:
    /* 20D08 8015A900 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
    /* 20D0C 8015A904 18006202 */  mult       $s3, $v0
    /* 20D10 8015A908 C3171300 */  sra        $v0, $s3, 31
    /* 20D14 8015A90C 10580000 */  mfhi       $t3
    /* 20D18 8015A910 83180B00 */  sra        $v1, $t3, 2
    /* 20D1C 8015A914 23186200 */  subu       $v1, $v1, $v0
    /* 20D20 8015A918 80100300 */  sll        $v0, $v1, 2
    /* 20D24 8015A91C 21104300 */  addu       $v0, $v0, $v1
    /* 20D28 8015A920 40400200 */  sll        $t0, $v0, 1
    /* 20D2C 8015A924 21103402 */  addu       $v0, $s1, $s4
    /* 20D30 8015A928 21106202 */  addu       $v0, $s3, $v0
    /* 20D34 8015A92C 00004280 */  lb         $v0, 0x0($v0)
    /* 20D38 8015A930 00000000 */  nop
    /* 20D3C 8015A934 54004014 */  bnez       $v0, .L8015AA88
    /* 20D40 8015A938 23506802 */   subu      $t2, $s3, $t0
    /* 20D44 8015A93C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20D48 8015A940 21083100 */  addu       $at, $at, $s1
    /* 20D4C 8015A944 BCBA308C */  lw         $s0, %lo(plr + 0x1584)($at)
    /* 20D50 8015A948 21383502 */  addu       $a3, $s1, $s5
    /* 20D54 8015A94C 6000E924 */  addiu      $t1, $a3, 0x60
    /* 20D58 8015A950 1CEF8326 */  addiu      $v1, $s4, -0x10E4
    /* 20D5C 8015A954 21182302 */  addu       $v1, $s1, $v1
    /* 20D60 8015A958 C0101000 */  sll        $v0, $s0, 3
    /* 20D64 8015A95C 23105000 */  subu       $v0, $v0, $s0
    /* 20D68 8015A960 80100200 */  sll        $v0, $v0, 2
    /* 20D6C 8015A964 23105000 */  subu       $v0, $v0, $s0
    /* 20D70 8015A968 80100200 */  sll        $v0, $v0, 2
    /* 20D74 8015A96C 21304300 */  addu       $a2, $v0, $v1
  .L8015A970:
    /* 20D78 8015A970 0000E28C */  lw         $v0, 0x0($a3)
    /* 20D7C 8015A974 0400E38C */  lw         $v1, 0x4($a3)
    /* 20D80 8015A978 0800E48C */  lw         $a0, 0x8($a3)
    /* 20D84 8015A97C 0C00E58C */  lw         $a1, 0xC($a3)
    /* 20D88 8015A980 0000C2AC */  sw         $v0, 0x0($a2)
    /* 20D8C 8015A984 0400C3AC */  sw         $v1, 0x4($a2)
    /* 20D90 8015A988 0800C4AC */  sw         $a0, 0x8($a2)
    /* 20D94 8015A98C 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 20D98 8015A990 1000E724 */  addiu      $a3, $a3, 0x10
    /* 20D9C 8015A994 F6FFE914 */  bne        $a3, $t1, .L8015A970
    /* 20DA0 8015A998 1000C624 */   addiu     $a2, $a2, 0x10
    /* 20DA4 8015A99C 0000E28C */  lw         $v0, 0x0($a3)
    /* 20DA8 8015A9A0 0400E38C */  lw         $v1, 0x4($a3)
    /* 20DAC 8015A9A4 0800E48C */  lw         $a0, 0x8($a3)
    /* 20DB0 8015A9A8 0000C2AC */  sw         $v0, 0x0($a2)
    /* 20DB4 8015A9AC 0400C3AC */  sw         $v1, 0x4($a2)
    /* 20DB8 8015A9B0 0800C4AC */  sw         $a0, 0x8($a2)
    /* 20DBC 8015A9B4 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20DC0 8015A9B8 21083100 */  addu       $at, $at, $s1
    /* 20DC4 8015A9BC BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 20DC8 8015A9C0 21184801 */  addu       $v1, $t2, $t0
    /* 20DCC 8015A9C4 01004224 */  addiu      $v0, $v0, 0x1
    /* 20DD0 8015A9C8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20DD4 8015A9CC 21083100 */  addu       $at, $at, $s1
    /* 20DD8 8015A9D0 BCBA22AC */  sw         $v0, %lo(plr + 0x1584)($at)
    /* 20DDC 8015A9D4 21103402 */  addu       $v0, $s1, $s4
    /* 20DE0 8015A9D8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 20DE4 8015A9DC 21083100 */  addu       $at, $at, $s1
    /* 20DE8 8015A9E0 BCBA248C */  lw         $a0, %lo(plr + 0x1584)($at)
    /* 20DEC 8015A9E4 21104300 */  addu       $v0, $v0, $v1
    /* 20DF0 8015A9E8 000044A0 */  sb         $a0, 0x0($v0)
    /* 20DF4 8015A9EC 0E80013C */  lui        $at, %hi(plr + 0x1924)
    /* 20DF8 8015A9F0 21083100 */  addu       $at, $at, $s1
    /* 20DFC 8015A9F4 5CBE238C */  lw         $v1, %lo(plr + 0x1924)($at)
    /* 20E00 8015A9F8 00000000 */  nop
    /* 20E04 8015A9FC C4096228 */  slti       $v0, $v1, 0x9C4
    /* 20E08 8015AA00 09004014 */  bnez       $v0, .L8015AA28
    /* 20E0C 8015AA04 E9036228 */   slti      $v0, $v1, 0x3E9
    /* 20E10 8015AA08 C0101000 */  sll        $v0, $s0, 3
    /* 20E14 8015AA0C 23105000 */  subu       $v0, $v0, $s0
    /* 20E18 8015AA10 80100200 */  sll        $v0, $v0, 2
    /* 20E1C 8015AA14 23105000 */  subu       $v0, $v0, $s0
    /* 20E20 8015AA18 80100200 */  sll        $v0, $v0, 2
    /* 20E24 8015AA1C 21105100 */  addu       $v0, $v0, $s1
    /* 20E28 8015AA20 996A0508 */  j          .L8015AA64
    /* 20E2C 8015AA24 06000324 */   addiu     $v1, $zero, 0x6
  .L8015AA28:
    /* 20E30 8015AA28 08004010 */  beqz       $v0, .L8015AA4C
    /* 20E34 8015AA2C C0101000 */   sll       $v0, $s0, 3
    /* 20E38 8015AA30 23105000 */  subu       $v0, $v0, $s0
    /* 20E3C 8015AA34 80100200 */  sll        $v0, $v0, 2
    /* 20E40 8015AA38 23105000 */  subu       $v0, $v0, $s0
    /* 20E44 8015AA3C 80100200 */  sll        $v0, $v0, 2
    /* 20E48 8015AA40 21105100 */  addu       $v0, $v0, $s1
    /* 20E4C 8015AA44 996A0508 */  j          .L8015AA64
    /* 20E50 8015AA48 04000324 */   addiu     $v1, $zero, 0x4
  .L8015AA4C:
    /* 20E54 8015AA4C 23105000 */  subu       $v0, $v0, $s0
    /* 20E58 8015AA50 80100200 */  sll        $v0, $v0, 2
    /* 20E5C 8015AA54 23105000 */  subu       $v0, $v0, $s0
    /* 20E60 8015AA58 80100200 */  sll        $v0, $v0, 2
    /* 20E64 8015AA5C 21105100 */  addu       $v0, $v0, $s1
    /* 20E68 8015AA60 05000324 */  addiu      $v1, $zero, 0x5
  .L8015AA64:
    /* 20E6C 8015AA64 0E80013C */  lui        $at, %hi(plr + 0x4F0)
    /* 20E70 8015AA68 21082200 */  addu       $at, $at, $v0
    /* 20E74 8015AA6C 28AA23A0 */  sb         $v1, %lo(plr + 0x4F0)($at)
    /* 20E78 8015AA70 D982050C */  jal        CalculateGold__Fi
    /* 20E7C 8015AA74 21204002 */   addu      $a0, $s2, $zero
    /* 20E80 8015AA78 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 20E84 8015AA7C 21083100 */  addu       $at, $at, $s1
    /* 20E88 8015AA80 88A622AC */  sw         $v0, %lo(plr + 0x150)($at)
    /* 20E8C 8015AA84 01000624 */  addiu      $a2, $zero, 0x1
  .L8015AA88:
    /* 20E90 8015AA88 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* 20E94 8015AA8C 03006006 */  bltz       $s3, .L8015AA9C
    /* 20E98 8015AA90 FF00C230 */   andi      $v0, $a2, 0xFF
    /* 20E9C 8015AA94 9AFF4010 */  beqz       $v0, .L8015A900
    /* 20EA0 8015AA98 6666023C */   lui       $v0, (0x66666667 >> 16)
  .L8015AA9C:
    /* 20EA4 8015AA9C 2110C000 */  addu       $v0, $a2, $zero
  .L8015AAA0:
    /* 20EA8 8015AAA0 4000BF8F */  lw         $ra, 0x40($sp)
    /* 20EAC 8015AAA4 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 20EB0 8015AAA8 3800B48F */  lw         $s4, 0x38($sp)
    /* 20EB4 8015AAAC 3400B38F */  lw         $s3, 0x34($sp)
    /* 20EB8 8015AAB0 3000B28F */  lw         $s2, 0x30($sp)
    /* 20EBC 8015AAB4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 20EC0 8015AAB8 2800B08F */  lw         $s0, 0x28($sp)
    /* 20EC4 8015AABC 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 20EC8 8015AAC0 0800E003 */  jr         $ra
    /* 20ECC 8015AAC4 00000000 */   nop
endlabel GoldAutoPlace__Fi
