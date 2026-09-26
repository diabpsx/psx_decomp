.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Counselor__Fi, 0x49C

glabel MAI_Counselor__Fi
    /* 19ADC 801536D4 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 19AE0 801536D8 5000B2AF */  sw         $s2, 0x50($sp)
    /* 19AE4 801536DC 21908000 */  addu       $s2, $a0, $zero
    /* 19AE8 801536E0 40101200 */  sll        $v0, $s2, 1
    /* 19AEC 801536E4 21105200 */  addu       $v0, $v0, $s2
    /* 19AF0 801536E8 80100200 */  sll        $v0, $v0, 2
    /* 19AF4 801536EC 21105200 */  addu       $v0, $v0, $s2
    /* 19AF8 801536F0 C0100200 */  sll        $v0, $v0, 3
    /* 19AFC 801536F4 3800A2AF */  sw         $v0, 0x38($sp)
    /* 19B00 801536F8 3800A88F */  lw         $t0, 0x38($sp)
    /* 19B04 801536FC 1080023C */  lui        $v0, %hi(monster)
    /* 19B08 80153700 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 19B0C 80153704 6C00BFAF */  sw         $ra, 0x6C($sp)
    /* 19B10 80153708 6800BEAF */  sw         $fp, 0x68($sp)
    /* 19B14 8015370C 6400B7AF */  sw         $s7, 0x64($sp)
    /* 19B18 80153710 6000B6AF */  sw         $s6, 0x60($sp)
    /* 19B1C 80153714 5C00B5AF */  sw         $s5, 0x5C($sp)
    /* 19B20 80153718 5800B4AF */  sw         $s4, 0x58($sp)
    /* 19B24 8015371C 5400B3AF */  sw         $s3, 0x54($sp)
    /* 19B28 80153720 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 19B2C 80153724 4800B0AF */  sw         $s0, 0x48($sp)
    /* 19B30 80153728 21880201 */  addu       $s1, $t0, $v0
    /* 19B34 8015372C 34003682 */  lb         $s6, 0x34($s1)
    /* 19B38 80153730 35002982 */  lb         $t1, 0x35($s1)
    /* 19B3C 80153734 33002282 */  lb         $v0, 0x33($s1)
    /* 19B40 80153738 00000000 */  nop
    /* 19B44 8015373C FF004014 */  bnez       $v0, .L80153B3C
    /* 19B48 80153740 4000A9AF */   sw        $t1, 0x40($sp)
    /* 19B4C 80153744 4E002292 */  lbu        $v0, 0x4E($s1)
    /* 19B50 80153748 00000000 */  nop
    /* 19B54 8015374C FB004010 */  beqz       $v0, .L80153B3C
    /* 19B58 80153750 2120C002 */   addu      $a0, $s6, $zero
    /* 19B5C 80153754 4000A58F */  lw         $a1, 0x40($sp)
    /* 19B60 80153758 43002682 */  lb         $a2, 0x43($s1)
    /* 19B64 8015375C 44002782 */  lb         $a3, 0x44($s1)
    /* 19B68 80153760 4A003E92 */  lbu        $fp, 0x4A($s1)
    /* 19B6C 80153764 4B002892 */  lbu        $t0, 0x4B($s1)
    /* 19B70 80153768 8AF6000C */  jal        GetDirection__Fiiii
    /* 19B74 8015376C 2800A8AF */   sw        $t0, 0x28($sp)
    /* 19B78 80153770 2398DE02 */  subu       $s3, $s6, $fp
    /* 19B7C 80153774 21A04000 */  addu       $s4, $v0, $zero
    /* 19B80 80153778 4000A98F */  lw         $t1, 0x40($sp)
    /* 19B84 8015377C 2800A88F */  lw         $t0, 0x28($sp)
    /* 19B88 80153780 4E002392 */  lbu        $v1, 0x4E($s1)
    /* 19B8C 80153784 00000000 */  nop
    /* 19B90 80153788 FF00632C */  sltiu      $v1, $v1, 0xFF
    /* 19B94 8015378C 03006010 */  beqz       $v1, .L8015379C
    /* 19B98 80153790 23A82801 */   subu      $s5, $t1, $t0
    /* 19B9C 80153794 135C010C */  jal        MonstCheckDoors__Fi
    /* 19BA0 80153798 21204002 */   addu      $a0, $s2, $zero
  .L8015379C:
    /* 19BA4 8015379C C9F6000C */  jal        ENG_random__Fl
    /* 19BA8 801537A0 64000424 */   addiu     $a0, $zero, 0x64
    /* 19BAC 801537A4 3000A2AF */  sw         $v0, 0x30($sp)
    /* 19BB0 801537A8 49003792 */  lbu        $s7, 0x49($s1)
    /* 19BB4 801537AC 02000224 */  addiu      $v0, $zero, 0x2
    /* 19BB8 801537B0 0D00E216 */  bne        $s7, $v0, .L801537E8
    /* 19BBC 801537B4 04000924 */   addiu     $t1, $zero, 0x4
    /* 19BC0 801537B8 0400228E */  lw         $v0, 0x4($s1)
    /* 19BC4 801537BC 00000000 */  nop
    /* 19BC8 801537C0 01004324 */  addiu      $v1, $v0, 0x1
    /* 19BCC 801537C4 04004228 */  slti       $v0, $v0, 0x4
    /* 19BD0 801537C8 47004010 */  beqz       $v0, .L801538E8
    /* 19BD4 801537CC 040023AE */   sw        $v1, 0x4($s1)
    /* 19BD8 801537D0 21204002 */  addu       $a0, $s2, $zero
    /* 19BDC 801537D4 04008526 */  addiu      $a1, $s4, 0x4
    /* 19BE0 801537D8 D43D050C */  jal        M_CallWalk__Fii
    /* 19BE4 801537DC 0700A530 */   andi      $a1, $a1, 0x7
    /* 19BE8 801537E0 C64E0508 */  j          .L80153B18
    /* 19BEC 801537E4 00000000 */   nop
  .L801537E8:
    /* 19BF0 801537E8 4C00E916 */  bne        $s7, $t1, .L8015391C
    /* 19BF4 801537EC 01000224 */   addiu     $v0, $zero, 0x1
    /* 19BF8 801537F0 6D41000C */  jal        abs
    /* 19BFC 801537F4 21206002 */   addu      $a0, $s3, $zero
    /* 19C00 801537F8 2120A002 */  addu       $a0, $s5, $zero
    /* 19C04 801537FC 6D41000C */  jal        abs
    /* 19C08 80153800 21804000 */   addu      $s0, $v0, $zero
    /* 19C0C 80153804 2A105000 */  slt        $v0, $v0, $s0
    /* 19C10 80153808 02004010 */  beqz       $v0, .L80153814
    /* 19C14 8015380C 2120A002 */   addu      $a0, $s5, $zero
    /* 19C18 80153810 21206002 */  addu       $a0, $s3, $zero
  .L80153814:
    /* 19C1C 80153814 6D41000C */  jal        abs
    /* 19C20 80153818 21800000 */   addu      $s0, $zero, $zero
    /* 19C24 8015381C 21B84000 */  addu       $s7, $v0, $zero
    /* 19C28 80153820 6D41000C */  jal        abs
    /* 19C2C 80153824 21206002 */   addu      $a0, $s3, $zero
    /* 19C30 80153828 02004228 */  slti       $v0, $v0, 0x2
    /* 19C34 8015382C 04004010 */  beqz       $v0, .L80153840
    /* 19C38 80153830 00000000 */   nop
    /* 19C3C 80153834 6D41000C */  jal        abs
    /* 19C40 80153838 2120A002 */   addu      $a0, $s5, $zero
    /* 19C44 8015383C 02005028 */  slti       $s0, $v0, 0x2
  .L80153840:
    /* 19C48 80153840 2A000016 */  bnez       $s0, .L801538EC
    /* 19C4C 80153844 01000224 */   addiu     $v0, $zero, 0x1
    /* 19C50 80153848 4E002392 */  lbu        $v1, 0x4E($s1)
    /* 19C54 8015384C FF000224 */  addiu      $v0, $zero, 0xFF
    /* 19C58 80153850 26006214 */  bne        $v1, $v0, .L801538EC
    /* 19C5C 80153854 01000224 */   addiu     $v0, $zero, 0x1
    /* 19C60 80153858 C0101600 */  sll        $v0, $s6, 3
    /* 19C64 8015385C 23105600 */  subu       $v0, $v0, $s6
    /* 19C68 80153860 C0110200 */  sll        $v0, $v0, 7
    /* 19C6C 80153864 4000A88F */  lw         $t0, 0x40($sp)
    /* 19C70 80153868 2800A98F */  lw         $t1, 0x28($sp)
    /* 19C74 8015386C C0200800 */  sll        $a0, $t0, 3
    /* 19C78 80153870 21208200 */  addu       $a0, $a0, $v0
    /* 19C7C 80153874 C0180900 */  sll        $v1, $t1, 3
    /* 19C80 80153878 C0101E00 */  sll        $v0, $fp, 3
    /* 19C84 8015387C 23105E00 */  subu       $v0, $v0, $fp
    /* 19C88 80153880 C0110200 */  sll        $v0, $v0, 7
    /* 19C8C 80153884 21186200 */  addu       $v1, $v1, $v0
    /* 19C90 80153888 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 19C94 8015388C 21082400 */  addu       $at, $at, $a0
    /* 19C98 80153890 2F7A2480 */  lb         $a0, %lo(dung_map + 0x7)($at)
    /* 19C9C 80153894 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 19CA0 80153898 21082300 */  addu       $at, $at, $v1
    /* 19CA4 8015389C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 19CA8 801538A0 00000000 */  nop
    /* 19CAC 801538A4 11008214 */  bne        $a0, $v0, .L801538EC
    /* 19CB0 801538A8 01000224 */   addiu     $v0, $zero, 0x1
    /* 19CB4 801538AC 0400228E */  lw         $v0, 0x4($s1)
    /* 19CB8 801538B0 00000000 */  nop
    /* 19CBC 801538B4 01004324 */  addiu      $v1, $v0, 0x1
    /* 19CC0 801538B8 040023AE */  sw         $v1, 0x4($s1)
    /* 19CC4 801538BC 40181700 */  sll        $v1, $s7, 1
    /* 19CC8 801538C0 2A104300 */  slt        $v0, $v0, $v1
    /* 19CCC 801538C4 06004014 */  bnez       $v0, .L801538E0
    /* 19CD0 801538C8 21200000 */   addu      $a0, $zero, $zero
    /* 19CD4 801538CC 21204002 */  addu       $a0, $s2, $zero
    /* 19CD8 801538D0 EB53050C */  jal        DirOK__Fii
    /* 19CDC 801538D4 21288002 */   addu      $a1, $s4, $zero
    /* 19CE0 801538D8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 19CE4 801538DC 2B200200 */  sltu       $a0, $zero, $v0
  .L801538E0:
    /* 19CE8 801538E0 09008010 */  beqz       $a0, .L80153908
    /* 19CEC 801538E4 21204002 */   addu      $a0, $s2, $zero
  .L801538E8:
    /* 19CF0 801538E8 01000224 */  addiu      $v0, $zero, 0x1
  .L801538EC:
    /* 19CF4 801538EC 490022A2 */  sb         $v0, 0x49($s1)
    /* 19CF8 801538F0 21204002 */  addu       $a0, $s2, $zero
    /* 19CFC 801538F4 21288002 */  addu       $a1, $s4, $zero
    /* 19D00 801538F8 7C31050C */  jal        M_StartFadein__FiiUc
    /* 19D04 801538FC 01000624 */   addiu     $a2, $zero, 0x1
    /* 19D08 80153900 C64E0508 */  j          .L80153B18
    /* 19D0C 80153904 00000000 */   nop
  .L80153908:
    /* 19D10 80153908 21288002 */  addu       $a1, $s4, $zero
    /* 19D14 8015390C 8F3E050C */  jal        M_RoundWalk__FiiRi
    /* 19D18 80153910 08002626 */   addiu     $a2, $s1, 0x8
    /* 19D1C 80153914 C64E0508 */  j          .L80153B18
    /* 19D20 80153918 00000000 */   nop
  .L8015391C:
    /* 19D24 8015391C 7E00E216 */  bne        $s7, $v0, .L80153B18
    /* 19D28 80153920 21800000 */   addu      $s0, $zero, $zero
    /* 19D2C 80153924 6D41000C */  jal        abs
    /* 19D30 80153928 21206002 */   addu      $a0, $s3, $zero
    /* 19D34 8015392C 02004228 */  slti       $v0, $v0, 0x2
    /* 19D38 80153930 04004010 */  beqz       $v0, .L80153944
    /* 19D3C 80153934 00000000 */   nop
    /* 19D40 80153938 6D41000C */  jal        abs
    /* 19D44 8015393C 2120A002 */   addu      $a0, $s5, $zero
    /* 19D48 80153940 02005028 */  slti       $s0, $v0, 0x2
  .L80153944:
    /* 19D4C 80153944 40000012 */  beqz       $s0, .L80153A48
    /* 19D50 80153948 00000000 */   nop
    /* 19D54 8015394C 1400228E */  lw         $v0, 0x14($s1)
    /* 19D58 80153950 1000238E */  lw         $v1, 0x10($s1)
    /* 19D5C 80153954 43100200 */  sra        $v0, $v0, 1
    /* 19D60 80153958 2A186200 */  slt        $v1, $v1, $v0
    /* 19D64 8015395C 06006010 */  beqz       $v1, .L80153978
    /* 19D68 80153960 3C0034A2 */   sb        $s4, 0x3C($s1)
    /* 19D6C 80153964 21204002 */  addu       $a0, $s2, $zero
    /* 19D70 80153968 21288002 */  addu       $a1, $s4, $zero
    /* 19D74 8015396C 21300000 */  addu       $a2, $zero, $zero
    /* 19D78 80153970 B94E0508 */  j          .L80153AE4
    /* 19D7C 80153974 02000224 */   addiu     $v0, $zero, 0x2
  .L80153978:
    /* 19D80 80153978 18002386 */  lh         $v1, 0x18($s1)
    /* 19D84 8015397C 0D000224 */  addiu      $v0, $zero, 0xD
    /* 19D88 80153980 0A006210 */  beq        $v1, $v0, .L801539AC
    /* 19D8C 80153984 21204002 */   addu      $a0, $s2, $zero
    /* 19D90 80153988 C9F6000C */  jal        ENG_random__Fl
    /* 19D94 8015398C 64000424 */   addiu     $a0, $zero, 0x64
    /* 19D98 80153990 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 19D9C 80153994 00000000 */  nop
    /* 19DA0 80153998 40180300 */  sll        $v1, $v1, 1
    /* 19DA4 8015399C 14006324 */  addiu      $v1, $v1, 0x14
    /* 19DA8 801539A0 2A104300 */  slt        $v0, $v0, $v1
    /* 19DAC 801539A4 54004010 */  beqz       $v0, .L80153AF8
    /* 19DB0 801539A8 21204002 */   addu      $a0, $s2, $zero
  .L801539AC:
    /* 19DB4 801539AC FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 19DB8 801539B0 182B050C */  jal        M_StartRAttack__Fiii
    /* 19DBC 801539B4 21300000 */   addu      $a2, $zero, $zero
    /* 19DC0 801539B8 2120C002 */  addu       $a0, $s6, $zero
    /* 19DC4 801539BC 21300000 */  addu       $a2, $zero, $zero
    /* 19DC8 801539C0 21380000 */  addu       $a3, $zero, $zero
    /* 19DCC 801539C4 0B000224 */  addiu      $v0, $zero, 0xB
    /* 19DD0 801539C8 3800A88F */  lw         $t0, 0x38($sp)
    /* 19DD4 801539CC 4000A58F */  lw         $a1, 0x40($sp)
    /* 19DD8 801539D0 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 19DDC 801539D4 21082800 */  addu       $at, $at, $t0
    /* 19DE0 801539D8 D0532380 */  lb         $v1, %lo(monster + 0x3C)($at)
    /* 19DE4 801539DC 04000924 */  addiu      $t1, $zero, 0x4
    /* 19DE8 801539E0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 19DEC 801539E4 1800B7AF */  sw         $s7, 0x18($sp)
    /* 19DF0 801539E8 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 19DF4 801539EC 2000A9AF */  sw         $t1, 0x20($sp)
    /* 19DF8 801539F0 2400A0AF */  sw         $zero, 0x24($sp)
    /* 19DFC 801539F4 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 19E00 801539F8 1000A3AF */   sw        $v1, 0x10($sp)
    /* 19E04 801539FC 2120C002 */  addu       $a0, $s6, $zero
    /* 19E08 80153A00 21300000 */  addu       $a2, $zero, $zero
    /* 19E0C 80153A04 21380000 */  addu       $a3, $zero, $zero
    /* 19E10 80153A08 0C000224 */  addiu      $v0, $zero, 0xC
    /* 19E14 80153A0C 3800A88F */  lw         $t0, 0x38($sp)
    /* 19E18 80153A10 4000A58F */  lw         $a1, 0x40($sp)
    /* 19E1C 80153A14 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 19E20 80153A18 21082800 */  addu       $at, $at, $t0
    /* 19E24 80153A1C D0532380 */  lb         $v1, %lo(monster + 0x3C)($at)
    /* 19E28 80153A20 04000924 */  addiu      $t1, $zero, 0x4
    /* 19E2C 80153A24 1400A2AF */  sw         $v0, 0x14($sp)
    /* 19E30 80153A28 1800B7AF */  sw         $s7, 0x18($sp)
    /* 19E34 80153A2C 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 19E38 80153A30 2000A9AF */  sw         $t1, 0x20($sp)
    /* 19E3C 80153A34 2400A0AF */  sw         $zero, 0x24($sp)
    /* 19E40 80153A38 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 19E44 80153A3C 1000A3AF */   sw        $v1, 0x10($sp)
    /* 19E48 80153A40 C64E0508 */  j          .L80153B18
    /* 19E4C 80153A44 00000000 */   nop
  .L80153A48:
    /* 19E50 80153A48 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 19E54 80153A4C 3000A88F */  lw         $t0, 0x30($sp)
    /* 19E58 80153A50 80100300 */  sll        $v0, $v1, 2
    /* 19E5C 80153A54 21104300 */  addu       $v0, $v0, $v1
    /* 19E60 80153A58 32004224 */  addiu      $v0, $v0, 0x32
    /* 19E64 80153A5C 2A100201 */  slt        $v0, $t0, $v0
    /* 19E68 80153A60 18004010 */  beqz       $v0, .L80153AC4
    /* 19E6C 80153A64 2120C002 */   addu      $a0, $s6, $zero
    /* 19E70 80153A68 4000A58F */  lw         $a1, 0x40($sp)
    /* 19E74 80153A6C 2800A78F */  lw         $a3, 0x28($sp)
    /* 19E78 80153A70 1E55050C */  jal        LineClear__Fiiii
    /* 19E7C 80153A74 2130C003 */   addu      $a2, $fp, $zero
    /* 19E80 80153A78 FF004230 */  andi       $v0, $v0, 0xFF
    /* 19E84 80153A7C 11004010 */  beqz       $v0, .L80153AC4
    /* 19E88 80153A80 00000000 */   nop
    /* 19E8C 80153A84 52002492 */  lbu        $a0, 0x52($s1)
    /* 19E90 80153A88 51002292 */  lbu        $v0, 0x51($s1)
    /* 19E94 80153A8C 00000000 */  nop
    /* 19E98 80153A90 23208200 */  subu       $a0, $a0, $v0
    /* 19E9C 80153A94 C9F6000C */  jal        ENG_random__Fl
    /* 19EA0 80153A98 01008424 */   addiu     $a0, $a0, 0x1
    /* 19EA4 80153A9C 21204002 */  addu       $a0, $s2, $zero
    /* 19EA8 80153AA0 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 19EAC 80153AA4 51002692 */  lbu        $a2, 0x51($s1)
    /* 19EB0 80153AA8 1280013C */  lui        $at, %hi(D_8011C2C0)
    /* 19EB4 80153AAC 21082300 */  addu       $at, $at, $v1
    /* 19EB8 80153AB0 C0C22590 */  lbu        $a1, %lo(D_8011C2C0)($at)
    /* 19EBC 80153AB4 182B050C */  jal        M_StartRAttack__Fiii
    /* 19EC0 80153AB8 21304600 */   addu      $a2, $v0, $a2
    /* 19EC4 80153ABC C64E0508 */  j          .L80153B18
    /* 19EC8 80153AC0 00000000 */   nop
  .L80153AC4:
    /* 19ECC 80153AC4 C9F6000C */  jal        ENG_random__Fl
    /* 19ED0 80153AC8 64000424 */   addiu     $a0, $zero, 0x64
    /* 19ED4 80153ACC 1E004228 */  slti       $v0, $v0, 0x1E
    /* 19ED8 80153AD0 09004010 */  beqz       $v0, .L80153AF8
    /* 19EDC 80153AD4 21204002 */   addu      $a0, $s2, $zero
    /* 19EE0 80153AD8 21288002 */  addu       $a1, $s4, $zero
    /* 19EE4 80153ADC 21300000 */  addu       $a2, $zero, $zero
    /* 19EE8 80153AE0 04000224 */  addiu      $v0, $zero, 0x4
  .L80153AE4:
    /* 19EEC 80153AE4 490022A2 */  sb         $v0, 0x49($s1)
    /* 19EF0 80153AE8 D331050C */  jal        M_StartFadeout__FiiUc
    /* 19EF4 80153AEC 040020AE */   sw        $zero, 0x4($s1)
    /* 19EF8 80153AF0 C64E0508 */  j          .L80153B18
    /* 19EFC 80153AF4 00000000 */   nop
  .L80153AF8:
    /* 19F00 80153AF8 C9F6000C */  jal        ENG_random__Fl
    /* 19F04 80153AFC 0A000424 */   addiu     $a0, $zero, 0xA
    /* 19F08 80153B00 4D002592 */  lbu        $a1, 0x4D($s1)
    /* 19F0C 80153B04 21204002 */  addu       $a0, $s2, $zero
    /* 19F10 80153B08 40280500 */  sll        $a1, $a1, 1
    /* 19F14 80153B0C F6FFA524 */  addiu      $a1, $a1, -0xA
    /* 19F18 80153B10 042B050C */  jal        M_StartDelay__Fii
    /* 19F1C 80153B14 23284500 */   subu      $a1, $v0, $a1
  .L80153B18:
    /* 19F20 80153B18 33002282 */  lb         $v0, 0x33($s1)
    /* 19F24 80153B1C 00000000 */  nop
    /* 19F28 80153B20 06004014 */  bnez       $v0, .L80153B3C
    /* 19F2C 80153B24 00000000 */   nop
    /* 19F30 80153B28 C9F6000C */  jal        ENG_random__Fl
    /* 19F34 80153B2C 0A000424 */   addiu     $a0, $zero, 0xA
    /* 19F38 80153B30 21204002 */  addu       $a0, $s2, $zero
    /* 19F3C 80153B34 042B050C */  jal        M_StartDelay__Fii
    /* 19F40 80153B38 05004524 */   addiu     $a1, $v0, 0x5
  .L80153B3C:
    /* 19F44 80153B3C 6C00BF8F */  lw         $ra, 0x6C($sp)
    /* 19F48 80153B40 6800BE8F */  lw         $fp, 0x68($sp)
    /* 19F4C 80153B44 6400B78F */  lw         $s7, 0x64($sp)
    /* 19F50 80153B48 6000B68F */  lw         $s6, 0x60($sp)
    /* 19F54 80153B4C 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 19F58 80153B50 5800B48F */  lw         $s4, 0x58($sp)
    /* 19F5C 80153B54 5400B38F */  lw         $s3, 0x54($sp)
    /* 19F60 80153B58 5000B28F */  lw         $s2, 0x50($sp)
    /* 19F64 80153B5C 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 19F68 80153B60 4800B08F */  lw         $s0, 0x48($sp)
    /* 19F6C 80153B64 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 19F70 80153B68 0800E003 */  jr         $ra
    /* 19F74 80153B6C 00000000 */   nop
endlabel MAI_Counselor__Fi
