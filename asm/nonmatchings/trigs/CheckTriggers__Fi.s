.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckTriggers__Fi, 0x58C

glabel CheckTriggers__Fi
    /* 66AC8 80076AC8 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 66ACC 80076ACC 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 66AD0 80076AD0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 66AD4 80076AD4 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 66AD8 80076AD8 21B88000 */  addu       $s7, $a0, $zero
    /* 66ADC 80076ADC 3400BFAF */  sw         $ra, 0x34($sp)
    /* 66AE0 80076AE0 3000BEAF */  sw         $fp, 0x30($sp)
    /* 66AE4 80076AE4 2800B6AF */  sw         $s6, 0x28($sp)
    /* 66AE8 80076AE8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 66AEC 80076AEC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 66AF0 80076AF0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 66AF4 80076AF4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 66AF8 80076AF8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 66AFC 80076AFC 04004014 */  bnez       $v0, .L80076B10
    /* 66B00 80076B00 1000B0AF */   sw        $s0, 0x10($sp)
    /* 66B04 80076B04 01000224 */  addiu      $v0, $zero, 0x1
    /* 66B08 80076B08 1280013C */  lui        $at, %hi(myplr)
    /* 66B0C 80076B0C 08BA22AC */  sw         $v0, %lo(myplr)($at)
  .L80076B10:
    /* 66B10 80076B10 21F00000 */  addu       $fp, $zero, $zero
    /* 66B14 80076B14 40101700 */  sll        $v0, $s7, 1
    /* 66B18 80076B18 21105700 */  addu       $v0, $v0, $s7
    /* 66B1C 80076B1C 80100200 */  sll        $v0, $v0, 2
    /* 66B20 80076B20 21105700 */  addu       $v0, $v0, $s7
    /* 66B24 80076B24 00110200 */  sll        $v0, $v0, 4
    /* 66B28 80076B28 23105700 */  subu       $v0, $v0, $s7
    /* 66B2C 80076B2C 80100200 */  sll        $v0, $v0, 2
    /* 66B30 80076B30 21105700 */  addu       $v0, $v0, $s7
    /* 66B34 80076B34 C0A00200 */  sll        $s4, $v0, 3
    /* 66B38 80076B38 0E80163C */  lui        $s6, %hi(trigs + 0x8)
    /* 66B3C 80076B3C D433D626 */  addiu      $s6, $s6, %lo(trigs + 0x8)
    /* 66B40 80076B40 21A80000 */  addu       $s5, $zero, $zero
  .L80076B44:
    /* 66B44 80076B44 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 66B48 80076B48 00000000 */  nop
    /* 66B4C 80076B4C 2A10C203 */  slt        $v0, $fp, $v0
    /* 66B50 80076B50 33014010 */  beqz       $v0, .L80077020
    /* 66B54 80076B54 00000000 */   nop
    /* 66B58 80076B58 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 66B5C 80076B5C 21083400 */  addu       $at, $at, $s4
    /* 66B60 80076B60 68A52384 */  lh         $v1, %lo(plr + 0x30)($at)
    /* 66B64 80076B64 0E80013C */  lui        $at, %hi(trigs)
    /* 66B68 80076B68 21083500 */  addu       $at, $at, $s5
    /* 66B6C 80076B6C CC33228C */  lw         $v0, %lo(trigs)($at)
    /* 66B70 80076B70 00000000 */  nop
    /* 66B74 80076B74 26016214 */  bne        $v1, $v0, .L80077010
    /* 66B78 80076B78 00000000 */   nop
    /* 66B7C 80076B7C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 66B80 80076B80 21083400 */  addu       $at, $at, $s4
    /* 66B84 80076B84 6AA52384 */  lh         $v1, %lo(plr + 0x32)($at)
    /* 66B88 80076B88 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 66B8C 80076B8C 21083500 */  addu       $at, $at, $s5
    /* 66B90 80076B90 D033228C */  lw         $v0, %lo(trigs + 0x4)($at)
    /* 66B94 80076B94 00000000 */  nop
    /* 66B98 80076B98 1D016214 */  bne        $v1, $v0, .L80077010
    /* 66B9C 80076B9C 00000000 */   nop
    /* 66BA0 80076BA0 1280023C */  lui        $v0, %hi(qtextflag)
    /* 66BA4 80076BA4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 66BA8 80076BA8 00000000 */  nop
    /* 66BAC 80076BAC 18014014 */  bnez       $v0, .L80077010
    /* 66BB0 80076BB0 00000000 */   nop
    /* 66BB4 80076BB4 1280023C */  lui        $v0, %hi(PauseMode)
    /* 66BB8 80076BB8 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 66BBC 80076BBC 00000000 */  nop
    /* 66BC0 80076BC0 13014014 */  bnez       $v0, .L80077010
    /* 66BC4 80076BC4 02000224 */   addiu     $v0, $zero, 0x2
    /* 66BC8 80076BC8 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 66BCC 80076BCC A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 66BD0 80076BD0 00000000 */  nop
    /* 66BD4 80076BD4 16006214 */  bne        $v1, $v0, .L80076C30
    /* 66BD8 80076BD8 0100E23A */   xori      $v0, $s7, 0x1
    /* 66BDC 80076BDC 40180200 */  sll        $v1, $v0, 1
    /* 66BE0 80076BE0 21186200 */  addu       $v1, $v1, $v0
    /* 66BE4 80076BE4 80180300 */  sll        $v1, $v1, 2
    /* 66BE8 80076BE8 21186200 */  addu       $v1, $v1, $v0
    /* 66BEC 80076BEC 00190300 */  sll        $v1, $v1, 4
    /* 66BF0 80076BF0 23186200 */  subu       $v1, $v1, $v0
    /* 66BF4 80076BF4 80180300 */  sll        $v1, $v1, 2
    /* 66BF8 80076BF8 21186200 */  addu       $v1, $v1, $v0
    /* 66BFC 80076BFC C0180300 */  sll        $v1, $v1, 3
    /* 66C00 80076C00 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 66C04 80076C04 21082300 */  addu       $at, $at, $v1
    /* 66C08 80076C08 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 66C0C 80076C0C 00000000 */  nop
    /* 66C10 80076C10 07004010 */  beqz       $v0, .L80076C30
    /* 66C14 80076C14 0D000224 */   addiu     $v0, $zero, 0xD
    /* 66C18 80076C18 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 66C1C 80076C1C 21082300 */  addu       $at, $at, $v1
    /* 66C20 80076C20 56A52380 */  lb         $v1, %lo(plr + 0x1E)($at)
    /* 66C24 80076C24 00000000 */  nop
    /* 66C28 80076C28 F9006210 */  beq        $v1, $v0, .L80077010
    /* 66C2C 80076C2C 00000000 */   nop
  .L80076C30:
    /* 66C30 80076C30 0000C28E */  lw         $v0, 0x0($s6)
    /* 66C34 80076C34 00000000 */  nop
    /* 66C38 80076C38 BEFF4324 */  addiu      $v1, $v0, -0x42
    /* 66C3C 80076C3C 0700622C */  sltiu      $v0, $v1, 0x7
    /* 66C40 80076C40 B6004010 */  beqz       $v0, .L80076F1C
    /* 66C44 80076C44 80100300 */   sll       $v0, $v1, 2
    /* 66C48 80076C48 1280013C */  lui        $at, %hi(jtbl_801189A4)
    /* 66C4C 80076C4C 21082200 */  addu       $at, $at, $v0
    /* 66C50 80076C50 A489228C */  lw         $v0, %lo(jtbl_801189A4)($at)
    /* 66C54 80076C54 00000000 */  nop
    /* 66C58 80076C58 08004000 */  jr         $v0
    /* 66C5C 80076C5C 00000000 */   nop
  jlabel .L80076C60
    /* 66C60 80076C60 1280023C */  lui        $v0, %hi(myplr)
    /* 66C64 80076C64 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 66C68 80076C68 00000000 */  nop
    /* 66C6C 80076C6C 80100200 */  sll        $v0, $v0, 2
    /* 66C70 80076C70 1280013C */  lui        $at, %hi(_pcurs)
    /* 66C74 80076C74 21082200 */  addu       $at, $at, $v0
    /* 66C78 80076C78 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 66C7C 80076C7C 00000000 */  nop
    /* 66C80 80076C80 0C004228 */  slti       $v0, $v0, 0xC
    /* 66C84 80076C84 06004014 */  bnez       $v0, .L80076CA0
    /* 66C88 80076C88 00000000 */   nop
    /* 66C8C 80076C8C 2783050C */  jal        func_80160C9C
    /* 66C90 80076C90 00000000 */   nop
    /* 66C94 80076C94 FF004230 */  andi       $v0, $v0, 0xFF
    /* 66C98 80076C98 E1004014 */  bnez       $v0, .L80077020
    /* 66C9C 80076C9C 00000000 */   nop
  .L80076CA0:
    /* 66CA0 80076CA0 3CDA010C */  jal        FadeGameOut__Fv
    /* 66CA4 80076CA4 00000000 */   nop
    /* 66CA8 80076CA8 1280043C */  lui        $a0, %hi(myplr)
    /* 66CAC 80076CAC 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 66CB0 80076CB0 1280063C */  lui        $a2, %hi(currlevel)
    /* 66CB4 80076CB4 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 66CB8 80076CB8 0000C58E */  lw         $a1, 0x0($s6)
    /* 66CBC 80076CBC C5DB0108 */  j          .L80076F14
    /* 66CC0 80076CC0 0100C624 */   addiu     $a2, $a2, 0x1
  jlabel .L80076CC4
    /* 66CC4 80076CC4 1280023C */  lui        $v0, %hi(myplr)
    /* 66CC8 80076CC8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 66CCC 80076CCC 00000000 */  nop
    /* 66CD0 80076CD0 80100200 */  sll        $v0, $v0, 2
    /* 66CD4 80076CD4 1280013C */  lui        $at, %hi(_pcurs)
    /* 66CD8 80076CD8 21082200 */  addu       $at, $at, $v0
    /* 66CDC 80076CDC 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 66CE0 80076CE0 00000000 */  nop
    /* 66CE4 80076CE4 0C004228 */  slti       $v0, $v0, 0xC
    /* 66CE8 80076CE8 06004014 */  bnez       $v0, .L80076D04
    /* 66CEC 80076CEC 00000000 */   nop
    /* 66CF0 80076CF0 2783050C */  jal        func_80160C9C
    /* 66CF4 80076CF4 00000000 */   nop
    /* 66CF8 80076CF8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 66CFC 80076CFC C8004014 */  bnez       $v0, .L80077020
    /* 66D00 80076D00 00000000 */   nop
  .L80076D04:
    /* 66D04 80076D04 3CDA010C */  jal        FadeGameOut__Fv
    /* 66D08 80076D08 00000000 */   nop
    /* 66D0C 80076D0C 1280043C */  lui        $a0, %hi(myplr)
    /* 66D10 80076D10 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 66D14 80076D14 1280063C */  lui        $a2, %hi(currlevel)
    /* 66D18 80076D18 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 66D1C 80076D1C 0000C58E */  lw         $a1, 0x0($s6)
    /* 66D20 80076D20 C5DB0108 */  j          .L80076F14
    /* 66D24 80076D24 FFFFC624 */   addiu     $a2, $a2, -0x1
  jlabel .L80076D28
    /* 66D28 80076D28 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 66D2C 80076D2C A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 66D30 80076D30 01000224 */  addiu      $v0, $zero, 0x1
    /* 66D34 80076D34 5B006210 */  beq        $v1, $v0, .L80076EA4
    /* 66D38 80076D38 21800000 */   addu      $s0, $zero, $zero
    /* 66D3C 80076D3C 21900000 */  addu       $s2, $zero, $zero
    /* 66D40 80076D40 21880000 */  addu       $s1, $zero, $zero
    /* 66D44 80076D44 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 66D48 80076D48 21083500 */  addu       $at, $at, $s5
    /* 66D4C 80076D4C D833238C */  lw         $v1, %lo(trigs + 0xC)($at)
    /* 66D50 80076D50 05000224 */  addiu      $v0, $zero, 0x5
    /* 66D54 80076D54 12006214 */  bne        $v1, $v0, .L80076DA0
    /* 66D58 80076D58 21980000 */   addu      $s3, $zero, $zero
    /* 66D5C 80076D5C A3DA010C */  jal        CheckTrigLevel__Fi
    /* 66D60 80076D60 08000424 */   addiu     $a0, $zero, 0x8
    /* 66D64 80076D64 01004238 */  xori       $v0, $v0, 0x1
    /* 66D68 80076D68 0A004010 */  beqz       $v0, .L80076D94
    /* 66D6C 80076D6C 00000000 */   nop
    /* 66D70 80076D70 01001024 */  addiu      $s0, $zero, 0x1
    /* 66D74 80076D74 28001324 */  addiu      $s3, $zero, 0x28
    /* 66D78 80076D78 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 66D7C 80076D7C 21083400 */  addu       $at, $at, $s4
    /* 66D80 80076D80 6AA52284 */  lh         $v0, %lo(plr + 0x32)($at)
    /* 66D84 80076D84 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 66D88 80076D88 21083400 */  addu       $at, $at, $s4
    /* 66D8C 80076D8C 68A53284 */  lh         $s2, %lo(plr + 0x30)($at)
    /* 66D90 80076D90 01005124 */  addiu      $s1, $v0, 0x1
  .L80076D94:
    /* 66D94 80076D94 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 66D98 80076D98 21083500 */  addu       $at, $at, $s5
    /* 66D9C 80076D9C D833238C */  lw         $v1, %lo(trigs + 0xC)($at)
  .L80076DA0:
    /* 66DA0 80076DA0 09000224 */  addiu      $v0, $zero, 0x9
    /* 66DA4 80076DA4 13006214 */  bne        $v1, $v0, .L80076DF4
    /* 66DA8 80076DA8 0D000224 */   addiu     $v0, $zero, 0xD
    /* 66DAC 80076DAC A3DA010C */  jal        CheckTrigLevel__Fi
    /* 66DB0 80076DB0 0D000424 */   addiu     $a0, $zero, 0xD
    /* 66DB4 80076DB4 01004238 */  xori       $v0, $v0, 0x1
    /* 66DB8 80076DB8 0A004010 */  beqz       $v0, .L80076DE4
    /* 66DBC 80076DBC 00000000 */   nop
    /* 66DC0 80076DC0 01001024 */  addiu      $s0, $zero, 0x1
    /* 66DC4 80076DC4 29001324 */  addiu      $s3, $zero, 0x29
    /* 66DC8 80076DC8 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 66DCC 80076DCC 21083400 */  addu       $at, $at, $s4
    /* 66DD0 80076DD0 68A52284 */  lh         $v0, %lo(plr + 0x30)($at)
    /* 66DD4 80076DD4 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 66DD8 80076DD8 21083400 */  addu       $at, $at, $s4
    /* 66DDC 80076DDC 6AA53184 */  lh         $s1, %lo(plr + 0x32)($at)
    /* 66DE0 80076DE0 01005224 */  addiu      $s2, $v0, 0x1
  .L80076DE4:
    /* 66DE4 80076DE4 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 66DE8 80076DE8 21083500 */  addu       $at, $at, $s5
    /* 66DEC 80076DEC D833238C */  lw         $v1, %lo(trigs + 0xC)($at)
    /* 66DF0 80076DF0 0D000224 */  addiu      $v0, $zero, 0xD
  .L80076DF4:
    /* 66DF4 80076DF4 10006214 */  bne        $v1, $v0, .L80076E38
    /* 66DF8 80076DF8 FF000232 */   andi      $v0, $s0, 0xFF
    /* 66DFC 80076DFC A3DA010C */  jal        CheckTrigLevel__Fi
    /* 66E00 80076E00 11000424 */   addiu     $a0, $zero, 0x11
    /* 66E04 80076E04 01004238 */  xori       $v0, $v0, 0x1
    /* 66E08 80076E08 0B004010 */  beqz       $v0, .L80076E38
    /* 66E0C 80076E0C FF000232 */   andi      $v0, $s0, 0xFF
    /* 66E10 80076E10 01001024 */  addiu      $s0, $zero, 0x1
    /* 66E14 80076E14 2A001324 */  addiu      $s3, $zero, 0x2A
    /* 66E18 80076E18 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 66E1C 80076E1C 21083400 */  addu       $at, $at, $s4
    /* 66E20 80076E20 6AA52284 */  lh         $v0, %lo(plr + 0x32)($at)
    /* 66E24 80076E24 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 66E28 80076E28 21083400 */  addu       $at, $at, $s4
    /* 66E2C 80076E2C 68A53284 */  lh         $s2, %lo(plr + 0x30)($at)
    /* 66E30 80076E30 01005124 */  addiu      $s1, $v0, 0x1
    /* 66E34 80076E34 FF000232 */  andi       $v0, $s0, 0xFF
  .L80076E38:
    /* 66E38 80076E38 1A004010 */  beqz       $v0, .L80076EA4
    /* 66E3C 80076E3C 00000000 */   nop
    /* 66E40 80076E40 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 66E44 80076E44 21083400 */  addu       $at, $at, $s4
    /* 66E48 80076E48 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 66E4C 80076E4C 00000000 */  nop
    /* 66E50 80076E50 03006014 */  bnez       $v1, .L80076E60
    /* 66E54 80076E54 01000224 */   addiu     $v0, $zero, 0x1
    /* 66E58 80076E58 9EDB0108 */  j          .L80076E78
    /* 66E5C 80076E5C FC020424 */   addiu     $a0, $zero, 0x2FC
  .L80076E60:
    /* 66E60 80076E60 03006214 */  bne        $v1, $v0, .L80076E70
    /* 66E64 80076E64 02000224 */   addiu     $v0, $zero, 0x2
    /* 66E68 80076E68 9EDB0108 */  j          .L80076E78
    /* 66E6C 80076E6C 8E020424 */   addiu     $a0, $zero, 0x28E
  .L80076E70:
    /* 66E70 80076E70 03006214 */  bne        $v1, $v0, .L80076E80
    /* 66E74 80076E74 26020424 */   addiu     $a0, $zero, 0x226
  .L80076E78:
    /* 66E78 80076E78 C6F5000C */  jal        PlaySFX__Fi
    /* 66E7C 80076E7C 00000000 */   nop
  .L80076E80:
    /* 66E80 80076E80 11F7000C */  jal        InitDiabloMsg__Fc
    /* 66E84 80076E84 21206002 */   addu      $a0, $s3, $zero
    /* 66E88 80076E88 01000424 */  addiu      $a0, $zero, 0x1
    /* 66E8C 80076E8C 01000524 */  addiu      $a1, $zero, 0x1
    /* 66E90 80076E90 FF004632 */  andi       $a2, $s2, 0xFF
    /* 66E94 80076E94 D13D010C */  jal        NetSendCmdLoc__FUcUcUcUc
    /* 66E98 80076E98 FF002732 */   andi      $a3, $s1, 0xFF
    /* 66E9C 80076E9C 08DC0108 */  j          .L80077020
    /* 66EA0 80076EA0 00000000 */   nop
  .L80076EA4:
    /* 66EA4 80076EA4 3CDA010C */  jal        FadeGameOut__Fv
    /* 66EA8 80076EA8 00000000 */   nop
    /* 66EAC 80076EAC 1280043C */  lui        $a0, %hi(myplr)
    /* 66EB0 80076EB0 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 66EB4 80076EB4 0000C58E */  lw         $a1, 0x0($s6)
    /* 66EB8 80076EB8 0E80013C */  lui        $at, %hi(trigs + 0xC)
    /* 66EBC 80076EBC 21083500 */  addu       $at, $at, $s5
    /* 66EC0 80076EC0 D833268C */  lw         $a2, %lo(trigs + 0xC)($at)
    /* 66EC4 80076EC4 C5DB0108 */  j          .L80076F14
    /* 66EC8 80076EC8 00000000 */   nop
  jlabel .L80076ECC
    /* 66ECC 80076ECC 1280023C */  lui        $v0, %hi(currlevel)
    /* 66ED0 80076ED0 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 66ED4 80076ED4 00000000 */  nop
    /* 66ED8 80076ED8 001482AF */  sw         $v0, %gp_rel(TWarpFrom)($gp)
    /* 66EDC 80076EDC 3CDA010C */  jal        FadeGameOut__Fv
    /* 66EE0 80076EE0 00000000 */   nop
    /* 66EE4 80076EE4 1280043C */  lui        $a0, %hi(myplr)
    /* 66EE8 80076EE8 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 66EEC 80076EEC 0000C58E */  lw         $a1, 0x0($s6)
    /* 66EF0 80076EF0 C5DB0108 */  j          .L80076F14
    /* 66EF4 80076EF4 21300000 */   addu      $a2, $zero, $zero
  jlabel .L80076EF8
    /* 66EF8 80076EF8 3CDA010C */  jal        FadeGameOut__Fv
    /* 66EFC 80076EFC 00000000 */   nop
    /* 66F00 80076F00 1280043C */  lui        $a0, %hi(myplr)
    /* 66F04 80076F04 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 66F08 80076F08 0000C58E */  lw         $a1, 0x0($s6)
    /* 66F0C 80076F0C 1280063C */  lui        $a2, %hi(ReturnLvl)
    /* 66F10 80076F10 5CBAC68C */  lw         $a2, %lo(ReturnLvl)($a2)
  .L80076F14:
    /* 66F14 80076F14 019B010C */  jal        StartNewLvl__Fiii
    /* 66F18 80076F18 00000000 */   nop
  jlabel .L80076F1C
    /* 66F1C 80076F1C 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 66F20 80076F20 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 66F24 80076F24 00000000 */  nop
    /* 66F28 80076F28 0D004010 */  beqz       $v0, .L80076F60
    /* 66F2C 80076F2C 21200000 */   addu      $a0, $zero, $zero
    /* 66F30 80076F30 1280053C */  lui        $a1, %hi(ViewX)
    /* 66F34 80076F34 14C1A58C */  lw         $a1, %lo(ViewX)($a1)
    /* 66F38 80076F38 1280063C */  lui        $a2, %hi(ViewY)
    /* 66F3C 80076F3C 18C1C68C */  lw         $a2, %lo(ViewY)($a2)
    /* 66F40 80076F40 2090020C */  jal        PlacePlayer__FiiiUc
    /* 66F44 80076F44 01000724 */   addiu     $a3, $zero, 0x1
    /* 66F48 80076F48 0E80053C */  lui        $a1, %hi(plr + 0x30)
    /* 66F4C 80076F4C 68A5A584 */  lh         $a1, %lo(plr + 0x30)($a1)
    /* 66F50 80076F50 0E80063C */  lui        $a2, %hi(plr + 0x32)
    /* 66F54 80076F54 6AA5C684 */  lh         $a2, %lo(plr + 0x32)($a2)
    /* 66F58 80076F58 DCDB0108 */  j          .L80076F70
    /* 66F5C 80076F5C 00000000 */   nop
  .L80076F60:
    /* 66F60 80076F60 1280053C */  lui        $a1, %hi(ViewX)
    /* 66F64 80076F64 14C1A58C */  lw         $a1, %lo(ViewX)($a1)
    /* 66F68 80076F68 1280063C */  lui        $a2, %hi(ViewY)
    /* 66F6C 80076F6C 18C1C68C */  lw         $a2, %lo(ViewY)($a2)
  .L80076F70:
    /* 66F70 80076F70 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 66F74 80076F74 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 66F78 80076F78 00000000 */  nop
    /* 66F7C 80076F7C 1D004010 */  beqz       $v0, .L80076FF4
    /* 66F80 80076F80 00000000 */   nop
    /* 66F84 80076F84 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 66F88 80076F88 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 66F8C 80076F8C 00000000 */  nop
    /* 66F90 80076F90 18004010 */  beqz       $v0, .L80076FF4
    /* 66F94 80076F94 00000000 */   nop
    /* 66F98 80076F98 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 66F9C 80076F9C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 66FA0 80076FA0 00000000 */  nop
    /* 66FA4 80076FA4 1A004010 */  beqz       $v0, .L80077010
    /* 66FA8 80076FA8 01000424 */   addiu     $a0, $zero, 0x1
    /* 66FAC 80076FAC 0E80053C */  lui        $a1, %hi(plr + 0x30)
    /* 66FB0 80076FB0 68A5A584 */  lh         $a1, %lo(plr + 0x30)($a1)
    /* 66FB4 80076FB4 0E80063C */  lui        $a2, %hi(plr + 0x32)
    /* 66FB8 80076FB8 6AA5C684 */  lh         $a2, %lo(plr + 0x32)($a2)
    /* 66FBC 80076FBC 2090020C */  jal        PlacePlayer__FiiiUc
    /* 66FC0 80076FC0 21380000 */   addu      $a3, $zero, $zero
    /* 66FC4 80076FC4 0E80043C */  lui        $a0, %hi(plr + 0x1A43)
    /* 66FC8 80076FC8 7BBF8480 */  lb         $a0, %lo(plr + 0x1A43)($a0)
    /* 66FCC 80076FCC 0E80053C */  lui        $a1, %hi(plr + 0x1A18)
    /* 66FD0 80076FD0 50BFA584 */  lh         $a1, %lo(plr + 0x1A18)($a1)
    /* 66FD4 80076FD4 0E80073C */  lui        $a3, %hi(plr + 0x1ABC)
    /* 66FD8 80076FD8 F4BFE780 */  lb         $a3, %lo(plr + 0x1ABC)($a3)
    /* 66FDC 80076FDC 0E80063C */  lui        $a2, %hi(plr + 0x1A1A)
    /* 66FE0 80076FE0 52BFC684 */  lh         $a2, %lo(plr + 0x1A1A)($a2)
    /* 66FE4 80076FE4 F834010C */  jal        ChangeLight__Fiiii
    /* 66FE8 80076FE8 F023E724 */   addiu     $a3, $a3, 0x23F0
    /* 66FEC 80076FEC 05DC0108 */  j          .L80077014
    /* 66FF0 80076FF0 1000D626 */   addiu     $s6, $s6, 0x10
  .L80076FF4:
    /* 66FF4 80076FF4 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 66FF8 80076FF8 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 66FFC 80076FFC 00000000 */  nop
    /* 67000 80077000 03004010 */  beqz       $v0, .L80077010
    /* 67004 80077004 01000424 */   addiu     $a0, $zero, 0x1
    /* 67008 80077008 2090020C */  jal        PlacePlayer__FiiiUc
    /* 6700C 8007700C 21380000 */   addu      $a3, $zero, $zero
  .L80077010:
    /* 67010 80077010 1000D626 */  addiu      $s6, $s6, 0x10
  .L80077014:
    /* 67014 80077014 1000B526 */  addiu      $s5, $s5, 0x10
    /* 67018 80077018 D1DA0108 */  j          .L80076B44
    /* 6701C 8007701C 0100DE27 */   addiu     $fp, $fp, 0x1
  .L80077020:
    /* 67020 80077020 3400BF8F */  lw         $ra, 0x34($sp)
    /* 67024 80077024 3000BE8F */  lw         $fp, 0x30($sp)
    /* 67028 80077028 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 6702C 8007702C 2800B68F */  lw         $s6, 0x28($sp)
    /* 67030 80077030 2400B58F */  lw         $s5, 0x24($sp)
    /* 67034 80077034 2000B48F */  lw         $s4, 0x20($sp)
    /* 67038 80077038 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 6703C 8007703C 1800B28F */  lw         $s2, 0x18($sp)
    /* 67040 80077040 1400B18F */  lw         $s1, 0x14($sp)
    /* 67044 80077044 1000B08F */  lw         $s0, 0x10($sp)
    /* 67048 80077048 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 6704C 8007704C 0800E003 */  jr         $ra
    /* 67050 80077050 00000000 */   nop
endlabel CheckTriggers__Fi
