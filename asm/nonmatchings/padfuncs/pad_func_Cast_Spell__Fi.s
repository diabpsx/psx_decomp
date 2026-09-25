.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Cast_Spell__Fi, 0x428

glabel pad_func_Cast_Spell__Fi
    /* 9181C 800A181C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 91820 800A1820 1400B1AF */  sw         $s1, 0x14($sp)
    /* 91824 800A1824 21888000 */  addu       $s1, $a0, $zero
    /* 91828 800A1828 40101100 */  sll        $v0, $s1, 1
    /* 9182C 800A182C 21105100 */  addu       $v0, $v0, $s1
    /* 91830 800A1830 80100200 */  sll        $v0, $v0, 2
    /* 91834 800A1834 21105100 */  addu       $v0, $v0, $s1
    /* 91838 800A1838 00110200 */  sll        $v0, $v0, 4
    /* 9183C 800A183C 23105100 */  subu       $v0, $v0, $s1
    /* 91840 800A1840 80100200 */  sll        $v0, $v0, 2
    /* 91844 800A1844 21105100 */  addu       $v0, $v0, $s1
    /* 91848 800A1848 C0100200 */  sll        $v0, $v0, 3
    /* 9184C 800A184C 0E80033C */  lui        $v1, %hi(plr)
    /* 91850 800A1850 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 91854 800A1854 1800B2AF */  sw         $s2, 0x18($sp)
    /* 91858 800A1858 21904300 */  addu       $s2, $v0, $v1
    /* 9185C 800A185C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 91860 800A1860 2400B5AF */  sw         $s5, 0x24($sp)
    /* 91864 800A1864 2000B4AF */  sw         $s4, 0x20($sp)
    /* 91868 800A1868 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9186C 800A186C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 91870 800A1870 6400538E */  lw         $s3, 0x64($s2)
    /* 91874 800A1874 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 91878 800A1878 21A00000 */   addu      $s4, $zero, $zero
    /* 9187C 800A187C 21202002 */  addu       $a0, $s1, $zero
    /* 91880 800A1880 21280000 */  addu       $a1, $zero, $zero
    /* 91884 800A1884 1280153C */  lui        $s5, %hi(myplr)
    /* 91888 800A1888 08BAB58E */  lw         $s5, %lo(myplr)($s5)
    /* 9188C 800A188C FD25020C */  jal        PAD_GetPad__FiUc
    /* 91890 800A1890 21804000 */   addu      $s0, $v0, $zero
    /* 91894 800A1894 E1000012 */  beqz       $s0, .L800A1C1C
    /* 91898 800A1898 09000224 */   addiu     $v0, $zero, 0x9
    /* 9189C 800A189C 0000438E */  lw         $v1, 0x0($s2)
    /* 918A0 800A18A0 00000000 */  nop
    /* 918A4 800A18A4 07006214 */  bne        $v1, $v0, .L800A18C4
    /* 918A8 800A18A8 00000000 */   nop
    /* 918AC 800A18AC 64014386 */  lh         $v1, 0x164($s2)
    /* 918B0 800A18B0 A001428E */  lw         $v0, 0x1A0($s2)
    /* 918B4 800A18B4 00000000 */  nop
    /* 918B8 800A18B8 2A104300 */  slt        $v0, $v0, $v1
    /* 918BC 800A18BC D7004010 */  beqz       $v0, .L800A1C1C
    /* 918C0 800A18C0 00000000 */   nop
  .L800A18C4:
    /* 918C4 800A18C4 1280023C */  lui        $v0, %hi(questlog)
    /* 918C8 800A18C8 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 918CC 800A18CC 1280033C */  lui        $v1, %hi(stextflag)
    /* 918D0 800A18D0 E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 918D4 800A18D4 1280043C */  lui        $a0, %hi(chrflag)
    /* 918D8 800A18D8 C0B68490 */  lbu        $a0, %lo(chrflag)($a0)
    /* 918DC 800A18DC 25104300 */  or         $v0, $v0, $v1
    /* 918E0 800A18E0 1280033C */  lui        $v1, %hi(qtextflag)
    /* 918E4 800A18E4 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 918E8 800A18E8 1280013C */  lui        $at, %hi(myplr)
    /* 918EC 800A18EC 08BA31AC */  sw         $s1, %lo(myplr)($at)
    /* 918F0 800A18F0 25104300 */  or         $v0, $v0, $v1
    /* 918F4 800A18F4 25104400 */  or         $v0, $v0, $a0
    /* 918F8 800A18F8 1280033C */  lui        $v1, %hi(invflag)
    /* 918FC 800A18FC 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 91900 800A1900 1280043C */  lui        $a0, %hi(optionsflag)
    /* 91904 800A1904 48B2848C */  lw         $a0, %lo(optionsflag)($a0)
    /* 91908 800A1908 25104300 */  or         $v0, $v0, $v1
    /* 9190C 800A190C 25104400 */  or         $v0, $v0, $a0
    /* 91910 800A1910 80181100 */  sll        $v1, $s1, 2
    /* 91914 800A1914 1280013C */  lui        $at, %hi(_spselflag)
    /* 91918 800A1918 21082300 */  addu       $at, $at, $v1
    /* 9191C 800A191C 50B6238C */  lw         $v1, %lo(_spselflag)($at)
    /* 91920 800A1920 1280043C */  lui        $a0, %hi(sbookflag)
    /* 91924 800A1924 C6B68490 */  lbu        $a0, %lo(sbookflag)($a0)
    /* 91928 800A1928 25104300 */  or         $v0, $v0, $v1
    /* 9192C 800A192C 25104400 */  or         $v0, $v0, $a0
    /* 91930 800A1930 B8004014 */  bnez       $v0, .L800A1C14
    /* 91934 800A1934 00000000 */   nop
    /* 91938 800A1938 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 9193C 800A193C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 91940 800A1940 00000000 */  nop
    /* 91944 800A1944 08004014 */  bnez       $v0, .L800A1968
    /* 91948 800A1948 17000224 */   addiu     $v0, $zero, 0x17
    /* 9194C 800A194C 22000224 */  addiu      $v0, $zero, 0x22
    /* 91950 800A1950 09006212 */  beq        $s3, $v0, .L800A1978
    /* 91954 800A1954 20000224 */   addiu     $v0, $zero, 0x20
    /* 91958 800A1958 07006212 */  beq        $s3, $v0, .L800A1978
    /* 9195C 800A195C 00000000 */   nop
    /* 91960 800A1960 85860208 */  j          .L800A1A14
    /* 91964 800A1964 00000000 */   nop
  .L800A1968:
    /* 91968 800A1968 03006212 */  beq        $s3, $v0, .L800A1978
    /* 9196C 800A196C 0A000224 */   addiu     $v0, $zero, 0xA
    /* 91970 800A1970 05006216 */  bne        $s3, $v0, .L800A1988
    /* 91974 800A1974 20000224 */   addiu     $v0, $zero, 0x20
  .L800A1978:
    /* 91978 800A1978 C6F5000C */  jal        PlaySFX__Fi
    /* 9197C 800A197C D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 91980 800A1980 07870208 */  j          .L800A1C1C
    /* 91984 800A1984 00000000 */   nop
  .L800A1988:
    /* 91988 800A1988 11006216 */  bne        $s3, $v0, .L800A19D0
    /* 9198C 800A198C 22000224 */   addiu     $v0, $zero, 0x22
    /* 91990 800A1990 0100223A */  xori       $v0, $s1, 0x1
    /* 91994 800A1994 40180200 */  sll        $v1, $v0, 1
    /* 91998 800A1998 21186200 */  addu       $v1, $v1, $v0
    /* 9199C 800A199C 80180300 */  sll        $v1, $v1, 2
    /* 919A0 800A19A0 21186200 */  addu       $v1, $v1, $v0
    /* 919A4 800A19A4 00190300 */  sll        $v1, $v1, 4
    /* 919A8 800A19A8 23186200 */  subu       $v1, $v1, $v0
    /* 919AC 800A19AC 80180300 */  sll        $v1, $v1, 2
    /* 919B0 800A19B0 21186200 */  addu       $v1, $v1, $v0
    /* 919B4 800A19B4 C0180300 */  sll        $v1, $v1, 3
    /* 919B8 800A19B8 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 919BC 800A19BC 21082300 */  addu       $at, $at, $v1
    /* 919C0 800A19C0 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 919C4 800A19C4 00000000 */  nop
    /* 919C8 800A19C8 94004014 */  bnez       $v0, .L800A1C1C
    /* 919CC 800A19CC 22000224 */   addiu     $v0, $zero, 0x22
  .L800A19D0:
    /* 919D0 800A19D0 10006216 */  bne        $s3, $v0, .L800A1A14
    /* 919D4 800A19D4 0100223A */   xori      $v0, $s1, 0x1
    /* 919D8 800A19D8 40180200 */  sll        $v1, $v0, 1
    /* 919DC 800A19DC 21186200 */  addu       $v1, $v1, $v0
    /* 919E0 800A19E0 80180300 */  sll        $v1, $v1, 2
    /* 919E4 800A19E4 21186200 */  addu       $v1, $v1, $v0
    /* 919E8 800A19E8 00190300 */  sll        $v1, $v1, 4
    /* 919EC 800A19EC 23186200 */  subu       $v1, $v1, $v0
    /* 919F0 800A19F0 80180300 */  sll        $v1, $v1, 2
    /* 919F4 800A19F4 21186200 */  addu       $v1, $v1, $v0
    /* 919F8 800A19F8 C0180300 */  sll        $v1, $v1, 3
    /* 919FC 800A19FC 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 91A00 800A1A00 21082300 */  addu       $at, $at, $v1
    /* 91A04 800A1A04 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 91A08 800A1A08 00000000 */  nop
    /* 91A0C 800A1A0C 83004010 */  beqz       $v0, .L800A1C1C
    /* 91A10 800A1A10 00000000 */   nop
  .L800A1A14:
    /* 91A14 800A1A14 9ABF020C */  jal        TargetActive__Fi
    /* 91A18 800A1A18 21202002 */   addu      $a0, $s1, $zero
    /* 91A1C 800A1A1C 05004010 */  beqz       $v0, .L800A1A34
    /* 91A20 800A1A20 00000000 */   nop
    /* 91A24 800A1A24 7F82020C */  jal        release_spell__Fi
    /* 91A28 800A1A28 21202002 */   addu      $a0, $s1, $zero
    /* 91A2C 800A1A2C 07870208 */  j          .L800A1C1C
    /* 91A30 800A1A30 00000000 */   nop
  .L800A1A34:
    /* 91A34 800A1A34 F585020C */  jal        TargetingSpell__Fi
    /* 91A38 800A1A38 21206002 */   addu      $a0, $s3, $zero
    /* 91A3C 800A1A3C 03004010 */  beqz       $v0, .L800A1A4C
    /* 91A40 800A1A40 FF008232 */   andi      $v0, $s4, 0xFF
    /* 91A44 800A1A44 01001424 */  addiu      $s4, $zero, 0x1
    /* 91A48 800A1A48 FF008232 */  andi       $v0, $s4, 0xFF
  .L800A1A4C:
    /* 91A4C 800A1A4C 20004010 */  beqz       $v0, .L800A1AD0
    /* 91A50 800A1A50 00000000 */   nop
    /* 91A54 800A1A54 1280023C */  lui        $v0, %hi(leveltype)
    /* 91A58 800A1A58 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 91A5C 800A1A5C 00000000 */  nop
    /* 91A60 800A1A60 05004014 */  bnez       $v0, .L800A1A78
    /* 91A64 800A1A64 00000000 */   nop
    /* 91A68 800A1A68 9595010C */  jal        CheckPlrSpell__Fv
    /* 91A6C 800A1A6C 00000000 */   nop
    /* 91A70 800A1A70 07870208 */  j          .L800A1C1C
    /* 91A74 800A1A74 00000000 */   nop
  .L800A1A78:
    /* 91A78 800A1A78 9ABF020C */  jal        TargetActive__Fi
    /* 91A7C 800A1A7C 21202002 */   addu      $a0, $s1, $zero
    /* 91A80 800A1A80 01004238 */  xori       $v0, $v0, 0x1
    /* 91A84 800A1A84 0C004010 */  beqz       $v0, .L800A1AB8
    /* 91A88 800A1A88 21202002 */   addu      $a0, $s1, $zero
    /* 91A8C 800A1A8C 6400428E */  lw         $v0, 0x64($s2)
    /* 91A90 800A1A90 68004392 */  lbu        $v1, 0x68($s2)
    /* 91A94 800A1A94 6400458E */  lw         $a1, 0x64($s2)
    /* 91A98 800A1A98 68004692 */  lbu        $a2, 0x68($s2)
    /* 91A9C 800A1A9C 600042A2 */  sb         $v0, 0x60($s2)
    /* 91AA0 800A1AA0 610043A2 */  sb         $v1, 0x61($s2)
    /* 91AA4 800A1AA4 5D0045A2 */  sb         $a1, 0x5D($s2)
    /* 91AA8 800A1AA8 D685020C */  jal        InitTargetCursor__Fi
    /* 91AAC 800A1AAC 5E0046A2 */   sb        $a2, 0x5E($s2)
    /* 91AB0 800A1AB0 05870208 */  j          .L800A1C14
    /* 91AB4 800A1AB4 00000000 */   nop
  .L800A1AB8:
    /* 91AB8 800A1AB8 7F82020C */  jal        release_spell__Fi
    /* 91ABC 800A1ABC 21202002 */   addu      $a0, $s1, $zero
    /* 91AC0 800A1AC0 01DE000C */  jal        NewCursor__Fi
    /* 91AC4 800A1AC4 01000424 */   addiu     $a0, $zero, 0x1
    /* 91AC8 800A1AC8 05870208 */  j          .L800A1C14
    /* 91ACC 800A1ACC 00000000 */   nop
  .L800A1AD0:
    /* 91AD0 800A1AD0 1280023C */  lui        $v0, %hi(sel_data)
    /* 91AD4 800A1AD4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 91AD8 800A1AD8 00000000 */  nop
    /* 91ADC 800A1ADC 80100200 */  sll        $v0, $v0, 2
    /* 91AE0 800A1AE0 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 91AE4 800A1AE4 21082200 */  addu       $at, $at, $v0
    /* 91AE8 800A1AE8 58B7238C */  lw         $v1, %lo(_pcursmonst)($at)
    /* 91AEC 800A1AEC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91AF0 800A1AF0 12006210 */  beq        $v1, $v0, .L800A1B3C
    /* 91AF4 800A1AF4 40100300 */   sll       $v0, $v1, 1
    /* 91AF8 800A1AF8 21104300 */  addu       $v0, $v0, $v1
    /* 91AFC 800A1AFC 80100200 */  sll        $v0, $v0, 2
    /* 91B00 800A1B00 21104300 */  addu       $v0, $v0, $v1
    /* 91B04 800A1B04 C0100200 */  sll        $v0, $v0, 3
    /* 91B08 800A1B08 30004486 */  lh         $a0, 0x30($s2)
    /* 91B0C 800A1B0C 32004586 */  lh         $a1, 0x32($s2)
    /* 91B10 800A1B10 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 91B14 800A1B14 21082200 */  addu       $at, $at, $v0
    /* 91B18 800A1B18 C8532680 */  lb         $a2, %lo(monster + 0x34)($at)
    /* 91B1C 800A1B1C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 91B20 800A1B20 21082200 */  addu       $at, $at, $v0
    /* 91B24 800A1B24 C9532780 */  lb         $a3, %lo(monster + 0x35)($at)
    /* 91B28 800A1B28 8AF6000C */  jal        GetDirection__Fiiii
    /* 91B2C 800A1B2C 00000000 */   nop
    /* 91B30 800A1B30 21202002 */  addu       $a0, $s1, $zero
    /* 91B34 800A1B34 299B010C */  jal        StartStand__Fii
    /* 91B38 800A1B38 21284000 */   addu      $a1, $v0, $zero
  .L800A1B3C:
    /* 91B3C 800A1B3C A4BF020C */  jal        GetSpellTarget__Fi
    /* 91B40 800A1B40 21202002 */   addu      $a0, $s1, $zero
    /* 91B44 800A1B44 21284000 */  addu       $a1, $v0, $zero
    /* 91B48 800A1B48 22000224 */  addiu      $v0, $zero, 0x22
    /* 91B4C 800A1B4C 03006212 */  beq        $s3, $v0, .L800A1B5C
    /* 91B50 800A1B50 20000224 */   addiu     $v0, $zero, 0x20
    /* 91B54 800A1B54 1D006216 */  bne        $s3, $v0, .L800A1BCC
    /* 91B58 800A1B58 00000000 */   nop
  .L800A1B5C:
    /* 91B5C 800A1B5C 01000224 */  addiu      $v0, $zero, 0x1
    /* 91B60 800A1B60 0100243A */  xori       $a0, $s1, 0x1
    /* 91B64 800A1B64 0400A2AC */  sw         $v0, 0x4($a1)
    /* 91B68 800A1B68 40100400 */  sll        $v0, $a0, 1
    /* 91B6C 800A1B6C 21104400 */  addu       $v0, $v0, $a0
    /* 91B70 800A1B70 80100200 */  sll        $v0, $v0, 2
    /* 91B74 800A1B74 21104400 */  addu       $v0, $v0, $a0
    /* 91B78 800A1B78 00110200 */  sll        $v0, $v0, 4
    /* 91B7C 800A1B7C 23104400 */  subu       $v0, $v0, $a0
    /* 91B80 800A1B80 80100200 */  sll        $v0, $v0, 2
    /* 91B84 800A1B84 21104400 */  addu       $v0, $v0, $a0
    /* 91B88 800A1B88 C0100200 */  sll        $v0, $v0, 3
    /* 91B8C 800A1B8C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 91B90 800A1B90 21082200 */  addu       $at, $at, $v0
    /* 91B94 800A1B94 68A52394 */  lhu        $v1, %lo(plr + 0x30)($at)
    /* 91B98 800A1B98 00000000 */  nop
    /* 91B9C 800A1B9C 0800A3A4 */  sh         $v1, 0x8($a1)
    /* 91BA0 800A1BA0 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 91BA4 800A1BA4 21082200 */  addu       $at, $at, $v0
    /* 91BA8 800A1BA8 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 91BAC 800A1BAC 1280033C */  lui        $v1, %hi(sel_data)
    /* 91BB0 800A1BB0 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 91BB4 800A1BB4 0A00A2A4 */  sh         $v0, 0xA($a1)
    /* 91BB8 800A1BB8 1280013C */  lui        $at, %hi(_pcursplr)
    /* 91BBC 800A1BBC 21082300 */  addu       $at, $at, $v1
    /* 91BC0 800A1BC0 6CB724A0 */  sb         $a0, %lo(_pcursplr)($at)
    /* 91BC4 800A1BC4 F8860208 */  j          .L800A1BE0
    /* 91BC8 800A1BC8 00000000 */   nop
  .L800A1BCC:
    /* 91BCC 800A1BCC 0000A290 */  lbu        $v0, 0x0($a1)
    /* 91BD0 800A1BD0 00000000 */  nop
    /* 91BD4 800A1BD4 02004010 */  beqz       $v0, .L800A1BE0
    /* 91BD8 800A1BD8 01000224 */   addiu     $v0, $zero, 0x1
    /* 91BDC 800A1BDC 0400A2AC */  sw         $v0, 0x4($a1)
  .L800A1BE0:
    /* 91BE0 800A1BE0 9595010C */  jal        CheckPlrSpell__Fv
    /* 91BE4 800A1BE4 00000000 */   nop
    /* 91BE8 800A1BE8 1E004382 */  lb         $v1, 0x1E($s2)
    /* 91BEC 800A1BEC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91BF0 800A1BF0 06006214 */  bne        $v1, $v0, .L800A1C0C
    /* 91BF4 800A1BF4 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 91BF8 800A1BF8 1280033C */  lui        $v1, %hi(sel_data)
    /* 91BFC 800A1BFC 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 91C00 800A1C00 1280013C */  lui        $at, %hi(_pcursplr)
    /* 91C04 800A1C04 21082300 */  addu       $at, $at, $v1
    /* 91C08 800A1C08 6CB722A0 */  sb         $v0, %lo(_pcursplr)($at)
  .L800A1C0C:
    /* 91C0C 800A1C0C E385020C */  jal        RemoveTargetCursor__Fi
    /* 91C10 800A1C10 21202002 */   addu      $a0, $s1, $zero
  .L800A1C14:
    /* 91C14 800A1C14 1280013C */  lui        $at, %hi(myplr)
    /* 91C18 800A1C18 08BA35AC */  sw         $s5, %lo(myplr)($at)
  .L800A1C1C:
    /* 91C1C 800A1C1C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 91C20 800A1C20 2400B58F */  lw         $s5, 0x24($sp)
    /* 91C24 800A1C24 2000B48F */  lw         $s4, 0x20($sp)
    /* 91C28 800A1C28 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 91C2C 800A1C2C 1800B28F */  lw         $s2, 0x18($sp)
    /* 91C30 800A1C30 1400B18F */  lw         $s1, 0x14($sp)
    /* 91C34 800A1C34 1000B08F */  lw         $s0, 0x10($sp)
    /* 91C38 800A1C38 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 91C3C 800A1C3C 0800E003 */  jr         $ra
    /* 91C40 800A1C40 00000000 */   nop
endlabel pad_func_Cast_Spell__Fi
