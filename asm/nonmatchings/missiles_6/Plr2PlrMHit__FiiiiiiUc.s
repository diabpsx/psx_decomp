.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Plr2PlrMHit__FiiiiiiUc, 0x564

glabel Plr2PlrMHit__FiiiiiiUc
    /* 29F4 8013C5EC B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 29F8 8013C5F0 2800B2AF */  sw         $s2, 0x28($sp)
    /* 29FC 8013C5F4 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2A00 8013C5F8 2188A000 */  addu       $s1, $a1, $zero
    /* 2A04 8013C5FC 40101100 */  sll        $v0, $s1, 1
    /* 2A08 8013C600 21105100 */  addu       $v0, $v0, $s1
    /* 2A0C 8013C604 80100200 */  sll        $v0, $v0, 2
    /* 2A10 8013C608 21105100 */  addu       $v0, $v0, $s1
    /* 2A14 8013C60C 00110200 */  sll        $v0, $v0, 4
    /* 2A18 8013C610 23105100 */  subu       $v0, $v0, $s1
    /* 2A1C 8013C614 80100200 */  sll        $v0, $v0, 2
    /* 2A20 8013C618 2000B0AF */  sw         $s0, 0x20($sp)
    /* 2A24 8013C61C 5800B08F */  lw         $s0, 0x58($sp)
    /* 2A28 8013C620 21105100 */  addu       $v0, $v0, $s1
    /* 2A2C 8013C624 3800B6AF */  sw         $s6, 0x38($sp)
    /* 2A30 8013C628 5C00B68F */  lw         $s6, 0x5C($sp)
    /* 2A34 8013C62C C0180200 */  sll        $v1, $v0, 3
    /* 2A38 8013C630 4400BFAF */  sw         $ra, 0x44($sp)
    /* 2A3C 8013C634 4000BEAF */  sw         $fp, 0x40($sp)
    /* 2A40 8013C638 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 2A44 8013C63C 3400B5AF */  sw         $s5, 0x34($sp)
    /* 2A48 8013C640 3000B4AF */  sw         $s4, 0x30($sp)
    /* 2A4C 8013C644 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 2A50 8013C648 1000A6AF */  sw         $a2, 0x10($sp)
    /* 2A54 8013C64C 1800A7AF */  sw         $a3, 0x18($sp)
    /* 2A58 8013C650 0E80013C */  lui        $at, %hi(plr + 0xD3)
    /* 2A5C 8013C654 21082300 */  addu       $at, $at, $v1
    /* 2A60 8013C658 0BA62290 */  lbu        $v0, %lo(plr + 0xD3)($at)
    /* 2A64 8013C65C 6000B393 */  lbu        $s3, 0x60($sp)
    /* 2A68 8013C660 BB014014 */  bnez       $v0, D_8013CD50
    /* 2A6C 8013C664 21908000 */   addu      $s2, $a0, $zero
    /* 2A70 8013C668 35000224 */  addiu      $v0, $zero, 0x35
    /* 2A74 8013C66C B901C212 */  beq        $s6, $v0, D_8013CD54
    /* 2A78 8013C670 21100000 */   addu      $v0, $zero, $zero
    /* 2A7C 8013C674 0E80013C */  lui        $at, %hi(plr + 0xD0)
    /* 2A80 8013C678 21082300 */  addu       $at, $at, $v1
    /* 2A84 8013C67C 08A62290 */  lbu        $v0, %lo(plr + 0xD0)($at)
    /* 2A88 8013C680 00000000 */  nop
    /* 2A8C 8013C684 01004230 */  andi       $v0, $v0, 0x1
    /* 2A90 8013C688 09004010 */  beqz       $v0, .L8013C6B0
    /* 2A94 8013C68C 40101600 */   sll       $v0, $s6, 1
    /* 2A98 8013C690 21105600 */  addu       $v0, $v0, $s6
    /* 2A9C 8013C694 C0100200 */  sll        $v0, $v0, 3
    /* 2AA0 8013C698 0D80013C */  lui        $at, %hi(missiledata + 0xD)
    /* 2AA4 8013C69C 21082200 */  addu       $at, $at, $v0
    /* 2AA8 8013C6A0 FD672290 */  lbu        $v0, %lo(missiledata + 0xD)($at)
    /* 2AAC 8013C6A4 00000000 */  nop
    /* 2AB0 8013C6A8 AA014010 */  beqz       $v0, D_8013CD54
    /* 2AB4 8013C6AC 21100000 */   addu      $v0, $zero, $zero
  .L8013C6B0:
    /* 2AB8 8013C6B0 40101600 */  sll        $v0, $s6, 1
    /* 2ABC 8013C6B4 21105600 */  addu       $v0, $v0, $s6
    /* 2AC0 8013C6B8 C0100200 */  sll        $v0, $v0, 3
    /* 2AC4 8013C6BC 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 2AC8 8013C6C0 21082200 */  addu       $at, $at, $v0
    /* 2ACC 8013C6C4 FE672390 */  lbu        $v1, %lo(missiledata + 0xE)($at)
    /* 2AD0 8013C6C8 02000224 */  addiu      $v0, $zero, 0x2
    /* 2AD4 8013C6CC 19006210 */  beq        $v1, $v0, .L8013C734
    /* 2AD8 8013C6D0 03006228 */   slti      $v0, $v1, 0x3
    /* 2ADC 8013C6D4 05004010 */  beqz       $v0, .L8013C6EC
    /* 2AE0 8013C6D8 01000224 */   addiu     $v0, $zero, 0x1
    /* 2AE4 8013C6DC 08006210 */  beq        $v1, $v0, .L8013C700
    /* 2AE8 8013C6E0 40101100 */   sll       $v0, $s1, 1
    /* 2AEC 8013C6E4 E6F10408 */  j          .L8013C798
    /* 2AF0 8013C6E8 21B80000 */   addu      $s7, $zero, $zero
  .L8013C6EC:
    /* 2AF4 8013C6EC 05006228 */  slti       $v0, $v1, 0x5
    /* 2AF8 8013C6F0 29004010 */  beqz       $v0, .L8013C798
    /* 2AFC 8013C6F4 21B80000 */   addu      $s7, $zero, $zero
    /* 2B00 8013C6F8 DBF10408 */  j          .L8013C76C
    /* 2B04 8013C6FC 40101100 */   sll       $v0, $s1, 1
  .L8013C700:
    /* 2B08 8013C700 21105100 */  addu       $v0, $v0, $s1
    /* 2B0C 8013C704 80100200 */  sll        $v0, $v0, 2
    /* 2B10 8013C708 21105100 */  addu       $v0, $v0, $s1
    /* 2B14 8013C70C 00110200 */  sll        $v0, $v0, 4
    /* 2B18 8013C710 23105100 */  subu       $v0, $v0, $s1
    /* 2B1C 8013C714 80100200 */  sll        $v0, $v0, 2
    /* 2B20 8013C718 21105100 */  addu       $v0, $v0, $s1
    /* 2B24 8013C71C C0100200 */  sll        $v0, $v0, 3
    /* 2B28 8013C720 0E80013C */  lui        $at, %hi(plr + 0x14E)
    /* 2B2C 8013C724 21082200 */  addu       $at, $at, $v0
    /* 2B30 8013C728 86A63780 */  lb         $s7, %lo(plr + 0x14E)($at)
    /* 2B34 8013C72C E6F10408 */  j          .L8013C798
    /* 2B38 8013C730 00000000 */   nop
  .L8013C734:
    /* 2B3C 8013C734 40101100 */  sll        $v0, $s1, 1
    /* 2B40 8013C738 21105100 */  addu       $v0, $v0, $s1
    /* 2B44 8013C73C 80100200 */  sll        $v0, $v0, 2
    /* 2B48 8013C740 21105100 */  addu       $v0, $v0, $s1
    /* 2B4C 8013C744 00110200 */  sll        $v0, $v0, 4
    /* 2B50 8013C748 23105100 */  subu       $v0, $v0, $s1
    /* 2B54 8013C74C 80100200 */  sll        $v0, $v0, 2
    /* 2B58 8013C750 21105100 */  addu       $v0, $v0, $s1
    /* 2B5C 8013C754 C0100200 */  sll        $v0, $v0, 3
    /* 2B60 8013C758 0E80013C */  lui        $at, %hi(plr + 0x14F)
    /* 2B64 8013C75C 21082200 */  addu       $at, $at, $v0
    /* 2B68 8013C760 87A63780 */  lb         $s7, %lo(plr + 0x14F)($at)
    /* 2B6C 8013C764 E6F10408 */  j          .L8013C798
    /* 2B70 8013C768 00000000 */   nop
  .L8013C76C:
    /* 2B74 8013C76C 21105100 */  addu       $v0, $v0, $s1
    /* 2B78 8013C770 80100200 */  sll        $v0, $v0, 2
    /* 2B7C 8013C774 21105100 */  addu       $v0, $v0, $s1
    /* 2B80 8013C778 00110200 */  sll        $v0, $v0, 4
    /* 2B84 8013C77C 23105100 */  subu       $v0, $v0, $s1
    /* 2B88 8013C780 80100200 */  sll        $v0, $v0, 2
    /* 2B8C 8013C784 21105100 */  addu       $v0, $v0, $s1
    /* 2B90 8013C788 C0100200 */  sll        $v0, $v0, 3
    /* 2B94 8013C78C 0E80013C */  lui        $at, %hi(plr + 0x14D)
    /* 2B98 8013C790 21082200 */  addu       $at, $at, $v0
    /* 2B9C 8013C794 85A63780 */  lb         $s7, %lo(plr + 0x14D)($at)
  .L8013C798:
    /* 2BA0 8013C798 C9F6000C */  jal        ENG_random__Fl
    /* 2BA4 8013C79C 64000424 */   addiu     $a0, $zero, 0x64
    /* 2BA8 8013C7A0 40181600 */  sll        $v1, $s6, 1
    /* 2BAC 8013C7A4 21187600 */  addu       $v1, $v1, $s6
    /* 2BB0 8013C7A8 C0180300 */  sll        $v1, $v1, 3
    /* 2BB4 8013C7AC 0D80013C */  lui        $at, %hi(missiledata + 0xD)
    /* 2BB8 8013C7B0 21082300 */  addu       $at, $at, $v1
    /* 2BBC 8013C7B4 FD672390 */  lbu        $v1, %lo(missiledata + 0xD)($at)
    /* 2BC0 8013C7B8 00000000 */  nop
    /* 2BC4 8013C7BC 45006014 */  bnez       $v1, .L8013C8D4
    /* 2BC8 8013C7C0 21384000 */   addu      $a3, $v0, $zero
    /* 2BCC 8013C7C4 6666053C */  lui        $a1, (0x66666667 >> 16)
    /* 2BD0 8013C7C8 40101100 */  sll        $v0, $s1, 1
    /* 2BD4 8013C7CC 21105100 */  addu       $v0, $v0, $s1
    /* 2BD8 8013C7D0 80100200 */  sll        $v0, $v0, 2
    /* 2BDC 8013C7D4 21105100 */  addu       $v0, $v0, $s1
    /* 2BE0 8013C7D8 00110200 */  sll        $v0, $v0, 4
    /* 2BE4 8013C7DC 23105100 */  subu       $v0, $v0, $s1
    /* 2BE8 8013C7E0 80100200 */  sll        $v0, $v0, 2
    /* 2BEC 8013C7E4 21105100 */  addu       $v0, $v0, $s1
    /* 2BF0 8013C7E8 C0100200 */  sll        $v0, $v0, 3
    /* 2BF4 8013C7EC 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 2BF8 8013C7F0 21082200 */  addu       $at, $at, $v0
    /* 2BFC 8013C7F4 38A62494 */  lhu        $a0, %lo(plr + 0x100)($at)
    /* 2C00 8013C7F8 6766A534 */  ori        $a1, $a1, (0x66666667 & 0xFFFF)
    /* 2C04 8013C7FC 00240400 */  sll        $a0, $a0, 16
    /* 2C08 8013C800 031C0400 */  sra        $v1, $a0, 16
    /* 2C0C 8013C804 18006500 */  mult       $v1, $a1
    /* 2C10 8013C808 0E80013C */  lui        $at, %hi(plr + 0x1998)
    /* 2C14 8013C80C 21082200 */  addu       $at, $at, $v0
    /* 2C18 8013C810 D0BE258C */  lw         $a1, %lo(plr + 0x1998)($at)
    /* 2C1C 8013C814 0E80013C */  lui        $at, %hi(plr + 0x19A4)
    /* 2C20 8013C818 21082200 */  addu       $at, $at, $v0
    /* 2C24 8013C81C DCBE228C */  lw         $v0, %lo(plr + 0x19A4)($at)
    /* 2C28 8013C820 C3270400 */  sra        $a0, $a0, 31
    /* 2C2C 8013C824 2128A200 */  addu       $a1, $a1, $v0
    /* 2C30 8013C828 10400000 */  mfhi       $t0
    /* 2C34 8013C82C 43100800 */  sra        $v0, $t0, 1
    /* 2C38 8013C830 23104400 */  subu       $v0, $v0, $a0
    /* 2C3C 8013C834 00140200 */  sll        $v0, $v0, 16
    /* 2C40 8013C838 03140200 */  sra        $v0, $v0, 16
    /* 2C44 8013C83C 2128A200 */  addu       $a1, $a1, $v0
    /* 2C48 8013C840 40101200 */  sll        $v0, $s2, 1
    /* 2C4C 8013C844 21105200 */  addu       $v0, $v0, $s2
    /* 2C50 8013C848 80100200 */  sll        $v0, $v0, 2
    /* 2C54 8013C84C 21105200 */  addu       $v0, $v0, $s2
    /* 2C58 8013C850 00110200 */  sll        $v0, $v0, 4
    /* 2C5C 8013C854 18001002 */  mult       $s0, $s0
    /* 2C60 8013C858 23105200 */  subu       $v0, $v0, $s2
    /* 2C64 8013C85C 80100200 */  sll        $v0, $v0, 2
    /* 2C68 8013C860 21105200 */  addu       $v0, $v0, $s2
    /* 2C6C 8013C864 C0100200 */  sll        $v0, $v0, 3
    /* 2C70 8013C868 CEFFA524 */  addiu      $a1, $a1, -0x32
    /* 2C74 8013C86C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 2C78 8013C870 21082200 */  addu       $at, $at, $v0
    /* 2C7C 8013C874 74A62680 */  lb         $a2, %lo(plr + 0x13C)($at)
    /* 2C80 8013C878 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 2C84 8013C87C 21082200 */  addu       $at, $at, $v0
    /* 2C88 8013C880 38A62384 */  lh         $v1, %lo(plr + 0x100)($at)
    /* 2C8C 8013C884 0E80013C */  lui        $at, %hi(plr + 0x19A0)
    /* 2C90 8013C888 21082200 */  addu       $at, $at, $v0
    /* 2C94 8013C88C D8BE248C */  lw         $a0, %lo(plr + 0x19A0)($at)
    /* 2C98 8013C890 2330C500 */  subu       $a2, $a2, $a1
    /* 2C9C 8013C894 21186400 */  addu       $v1, $v1, $a0
    /* 2CA0 8013C898 2130C300 */  addu       $a2, $a2, $v1
    /* 2CA4 8013C89C 12480000 */  mflo       $t1
    /* 2CA8 8013C8A0 43180900 */  sra        $v1, $t1, 1
    /* 2CAC 8013C8A4 2330C300 */  subu       $a2, $a2, $v1
    /* 2CB0 8013C8A8 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2CB4 8013C8AC 21082200 */  addu       $at, $at, $v0
    /* 2CB8 8013C8B0 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2CBC 8013C8B4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CC0 8013C8B8 02006214 */  bne        $v1, $v0, .L8013C8C4
    /* 2CC4 8013C8BC 00000000 */   nop
    /* 2CC8 8013C8C0 1400C624 */  addiu      $a2, $a2, 0x14
  .L8013C8C4:
    /* 2CCC 8013C8C4 27006014 */  bnez       $v1, .L8013C964
    /* 2CD0 8013C8C8 0500C228 */   slti      $v0, $a2, 0x5
    /* 2CD4 8013C8CC 58F20408 */  j          .L8013C960
    /* 2CD8 8013C8D0 0A00C624 */   addiu     $a2, $a2, 0xA
  .L8013C8D4:
    /* 2CDC 8013C8D4 40181200 */  sll        $v1, $s2, 1
    /* 2CE0 8013C8D8 21187200 */  addu       $v1, $v1, $s2
    /* 2CE4 8013C8DC 80180300 */  sll        $v1, $v1, 2
    /* 2CE8 8013C8E0 21187200 */  addu       $v1, $v1, $s2
    /* 2CEC 8013C8E4 00190300 */  sll        $v1, $v1, 4
    /* 2CF0 8013C8E8 23187200 */  subu       $v1, $v1, $s2
    /* 2CF4 8013C8EC 80180300 */  sll        $v1, $v1, 2
    /* 2CF8 8013C8F0 21187200 */  addu       $v1, $v1, $s2
    /* 2CFC 8013C8F4 40101100 */  sll        $v0, $s1, 1
    /* 2D00 8013C8F8 21105100 */  addu       $v0, $v0, $s1
    /* 2D04 8013C8FC 80100200 */  sll        $v0, $v0, 2
    /* 2D08 8013C900 21105100 */  addu       $v0, $v0, $s1
    /* 2D0C 8013C904 00110200 */  sll        $v0, $v0, 4
    /* 2D10 8013C908 23105100 */  subu       $v0, $v0, $s1
    /* 2D14 8013C90C 80100200 */  sll        $v0, $v0, 2
    /* 2D18 8013C910 21105100 */  addu       $v0, $v0, $s1
    /* 2D1C 8013C914 C0100200 */  sll        $v0, $v0, 3
    /* 2D20 8013C918 C0180300 */  sll        $v1, $v1, 3
    /* 2D24 8013C91C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 2D28 8013C920 21082200 */  addu       $at, $at, $v0
    /* 2D2C 8013C924 74A62480 */  lb         $a0, %lo(plr + 0x13C)($at)
    /* 2D30 8013C928 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* 2D34 8013C92C 21082300 */  addu       $at, $at, $v1
    /* 2D38 8013C930 34A62284 */  lh         $v0, %lo(plr + 0xFC)($at)
    /* 2D3C 8013C934 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2D40 8013C938 21082300 */  addu       $at, $at, $v1
    /* 2D44 8013C93C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2D48 8013C940 40200400 */  sll        $a0, $a0, 1
    /* 2D4C 8013C944 CEFF8424 */  addiu      $a0, $a0, -0x32
    /* 2D50 8013C948 23104400 */  subu       $v0, $v0, $a0
    /* 2D54 8013C94C 23305000 */  subu       $a2, $v0, $s0
    /* 2D58 8013C950 02000224 */  addiu      $v0, $zero, 0x2
    /* 2D5C 8013C954 03006214 */  bne        $v1, $v0, .L8013C964
    /* 2D60 8013C958 0500C228 */   slti      $v0, $a2, 0x5
    /* 2D64 8013C95C 1400C624 */  addiu      $a2, $a2, 0x14
  .L8013C960:
    /* 2D68 8013C960 0500C228 */  slti       $v0, $a2, 0x5
  .L8013C964:
    /* 2D6C 8013C964 03004010 */  beqz       $v0, .L8013C974
    /* 2D70 8013C968 6000C228 */   slti      $v0, $a2, 0x60
    /* 2D74 8013C96C 05000624 */  addiu      $a2, $zero, 0x5
    /* 2D78 8013C970 6000C228 */  slti       $v0, $a2, 0x60
  .L8013C974:
    /* 2D7C 8013C974 03004014 */  bnez       $v0, .L8013C984
    /* 2D80 8013C978 2A10E600 */   slt       $v0, $a3, $a2
    /* 2D84 8013C97C 5F000624 */  addiu      $a2, $zero, 0x5F
    /* 2D88 8013C980 2A10E600 */  slt        $v0, $a3, $a2
  .L8013C984:
    /* 2D8C 8013C984 F2004010 */  beqz       $v0, D_8013CD50
    /* 2D90 8013C988 40101100 */   sll       $v0, $s1, 1
    /* 2D94 8013C98C 21105100 */  addu       $v0, $v0, $s1
    /* 2D98 8013C990 80100200 */  sll        $v0, $v0, 2
    /* 2D9C 8013C994 21105100 */  addu       $v0, $v0, $s1
    /* 2DA0 8013C998 00110200 */  sll        $v0, $v0, 4
    /* 2DA4 8013C99C 23105100 */  subu       $v0, $v0, $s1
    /* 2DA8 8013C9A0 80100200 */  sll        $v0, $v0, 2
    /* 2DAC 8013C9A4 21105100 */  addu       $v0, $v0, $s1
    /* 2DB0 8013C9A8 C0200200 */  sll        $a0, $v0, 3
    /* 2DB4 8013C9AC 0E80013C */  lui        $at, %hi(plr)
    /* 2DB8 8013C9B0 21082400 */  addu       $at, $at, $a0
    /* 2DBC 8013C9B4 38A5238C */  lw         $v1, %lo(plr)($at)
    /* 2DC0 8013C9B8 00000000 */  nop
    /* 2DC4 8013C9BC 03006010 */  beqz       $v1, .L8013C9CC
    /* 2DC8 8013C9C0 04000224 */   addiu     $v0, $zero, 0x4
    /* 2DCC 8013C9C4 0A006214 */  bne        $v1, $v0, .L8013C9F0
    /* 2DD0 8013C9C8 64001524 */   addiu     $s5, $zero, 0x64
  .L8013C9CC:
    /* 2DD4 8013C9CC 0E80013C */  lui        $at, %hi(plr + 0xD2)
    /* 2DD8 8013C9D0 21082400 */  addu       $at, $at, $a0
    /* 2DDC 8013C9D4 0AA62290 */  lbu        $v0, %lo(plr + 0xD2)($at)
    /* 2DE0 8013C9D8 00000000 */  nop
    /* 2DE4 8013C9DC 04004010 */  beqz       $v0, .L8013C9F0
    /* 2DE8 8013C9E0 64001524 */   addiu     $s5, $zero, 0x64
    /* 2DEC 8013C9E4 C9F6000C */  jal        ENG_random__Fl
    /* 2DF0 8013C9E8 64000424 */   addiu     $a0, $zero, 0x64
    /* 2DF4 8013C9EC 21A84000 */  addu       $s5, $v0, $zero
  .L8013C9F0:
    /* 2DF8 8013C9F0 FF007E32 */  andi       $fp, $s3, 0xFF
    /* 2DFC 8013C9F4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2E00 8013C9F8 0200C217 */  bne        $fp, $v0, .L8013CA04
    /* 2E04 8013C9FC 40101100 */   sll       $v0, $s1, 1
    /* 2E08 8013CA00 64001524 */  addiu      $s5, $zero, 0x64
  .L8013CA04:
    /* 2E0C 8013CA04 21105100 */  addu       $v0, $v0, $s1
    /* 2E10 8013CA08 80100200 */  sll        $v0, $v0, 2
    /* 2E14 8013CA0C 21105100 */  addu       $v0, $v0, $s1
    /* 2E18 8013CA10 00110200 */  sll        $v0, $v0, 4
    /* 2E1C 8013CA14 23105100 */  subu       $v0, $v0, $s1
    /* 2E20 8013CA18 80100200 */  sll        $v0, $v0, 2
    /* 2E24 8013CA1C 21105100 */  addu       $v0, $v0, $s1
    /* 2E28 8013CA20 C0300200 */  sll        $a2, $v0, 3
    /* 2E2C 8013CA24 40101200 */  sll        $v0, $s2, 1
    /* 2E30 8013CA28 21105200 */  addu       $v0, $v0, $s2
    /* 2E34 8013CA2C 80100200 */  sll        $v0, $v0, 2
    /* 2E38 8013CA30 21105200 */  addu       $v0, $v0, $s2
    /* 2E3C 8013CA34 00110200 */  sll        $v0, $v0, 4
    /* 2E40 8013CA38 23105200 */  subu       $v0, $v0, $s2
    /* 2E44 8013CA3C 80100200 */  sll        $v0, $v0, 2
    /* 2E48 8013CA40 21105200 */  addu       $v0, $v0, $s2
    /* 2E4C 8013CA44 C0980200 */  sll        $s3, $v0, 3
    /* 2E50 8013CA48 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 2E54 8013CA4C 21082600 */  addu       $at, $at, $a2
    /* 2E58 8013CA50 38A62584 */  lh         $a1, %lo(plr + 0x100)($at)
    /* 2E5C 8013CA54 0E80013C */  lui        $at, %hi(plr + 0x110)
    /* 2E60 8013CA58 21082600 */  addu       $at, $at, $a2
    /* 2E64 8013CA5C 48A6238C */  lw         $v1, %lo(plr + 0x110)($at)
    /* 2E68 8013CA60 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 2E6C 8013CA64 21083300 */  addu       $at, $at, $s3
    /* 2E70 8013CA68 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 2E74 8013CA6C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 2E78 8013CA70 21082600 */  addu       $at, $at, $a2
    /* 2E7C 8013CA74 74A62480 */  lb         $a0, %lo(plr + 0x13C)($at)
    /* 2E80 8013CA78 21186500 */  addu       $v1, $v1, $a1
    /* 2E84 8013CA7C 23104400 */  subu       $v0, $v0, $a0
    /* 2E88 8013CA80 40100200 */  sll        $v0, $v0, 1
    /* 2E8C 8013CA84 23A06200 */  subu       $s4, $v1, $v0
    /* 2E90 8013CA88 03008106 */  bgez       $s4, .L8013CA98
    /* 2E94 8013CA8C 6500822A */   slti      $v0, $s4, 0x65
    /* 2E98 8013CA90 21A00000 */  addu       $s4, $zero, $zero
    /* 2E9C 8013CA94 6500822A */  slti       $v0, $s4, 0x65
  .L8013CA98:
    /* 2EA0 8013CA98 02004014 */  bnez       $v0, .L8013CAA4
    /* 2EA4 8013CA9C 3F000224 */   addiu     $v0, $zero, 0x3F
    /* 2EA8 8013CAA0 64001424 */  addiu      $s4, $zero, 0x64
  .L8013CAA4:
    /* 2EAC 8013CAA4 0A00C216 */  bne        $s6, $v0, .L8013CAD0
    /* 2EB0 8013CAA8 5555033C */   lui       $v1, (0x55555556 >> 16)
    /* 2EB4 8013CAAC 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 2EB8 8013CAB0 21082600 */  addu       $at, $at, $a2
    /* 2EBC 8013CAB4 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 2EC0 8013CAB8 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
    /* 2EC4 8013CABC 18004300 */  mult       $v0, $v1
    /* 2EC8 8013CAC0 C3170200 */  sra        $v0, $v0, 31
    /* 2ECC 8013CAC4 10400000 */  mfhi       $t0
    /* 2ED0 8013CAC8 DDF20408 */  j          D_8013CB74
    /* 2ED4 8013CACC 23800201 */   subu      $s0, $t0, $v0
  .L8013CAD0:
    /* 2ED8 8013CAD0 1800A98F */  lw         $t1, 0x18($sp)
    /* 2EDC 8013CAD4 1000A88F */  lw         $t0, 0x10($sp)
    /* 2EE0 8013CAD8 00000000 */  nop
    /* 2EE4 8013CADC 23202801 */  subu       $a0, $t1, $t0
    /* 2EE8 8013CAE0 C9F6000C */  jal        ENG_random__Fl
    /* 2EEC 8013CAE4 01008424 */   addiu     $a0, $a0, 0x1
    /* 2EF0 8013CAE8 40181600 */  sll        $v1, $s6, 1
    /* 2EF4 8013CAEC 21187600 */  addu       $v1, $v1, $s6
    /* 2EF8 8013CAF0 C0180300 */  sll        $v1, $v1, 3
    /* 2EFC 8013CAF4 1000A98F */  lw         $t1, 0x10($sp)
    /* 2F00 8013CAF8 0D80013C */  lui        $at, %hi(missiledata + 0xD)
    /* 2F04 8013CAFC 21082300 */  addu       $at, $at, $v1
    /* 2F08 8013CB00 FD672390 */  lbu        $v1, %lo(missiledata + 0xD)($at)
    /* 2F0C 8013CB04 00000000 */  nop
    /* 2F10 8013CB08 17006014 */  bnez       $v1, D_8013CB68
    /* 2F14 8013CB0C 21804900 */   addu      $s0, $v0, $t1
    /* 2F18 8013CB10 0E80013C */  lui        $at, %hi(plr + 0x199C)
    /* 2F1C 8013CB14 21083300 */  addu       $at, $at, $s3
    /* 2F20 8013CB18 D4BE228C */  lw         $v0, %lo(plr + 0x199C)($at)
    /* 2F24 8013CB1C 00000000 */  nop
    /* 2F28 8013CB20 18000202 */  mult       $s0, $v0
    /* 2F2C 8013CB24 12100000 */  mflo       $v0
    /* 2F30 8013CB28 EB51033C */  lui        $v1, (0x51EB851F >> 16)
    /* 2F34 8013CB2C 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 2F38 8013CB30 18004300 */  mult       $v0, $v1
    /* 2F3C 8013CB34 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 2F40 8013CB38 21083300 */  addu       $at, $at, $s3
    /* 2F44 8013CB3C 44A6248C */  lw         $a0, %lo(plr + 0x10C)($at)
    /* 2F48 8013CB40 C3170200 */  sra        $v0, $v0, 31
    /* 2F4C 8013CB44 10400000 */  mfhi       $t0
    /* 2F50 8013CB48 43190800 */  sra        $v1, $t0, 5
    /* 2F54 8013CB4C 23186200 */  subu       $v1, $v1, $v0
endlabel Plr2PlrMHit__FiiiiiiUc
