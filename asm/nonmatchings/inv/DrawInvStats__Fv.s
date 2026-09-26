.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawInvStats__Fv, 0xB1C

glabel DrawInvStats__Fv
    /* 1DE74 80157A6C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 1DE78 80157A70 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1DE7C 80157A74 4800BFAF */  sw         $ra, 0x48($sp)
    /* 1DE80 80157A78 4400B3AF */  sw         $s3, 0x44($sp)
    /* 1DE84 80157A7C 4000B2AF */  sw         $s2, 0x40($sp)
    /* 1DE88 80157A80 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 1DE8C 80157A84 AA87050C */  jal        __6Dialog_80161ea8
    /* 1DE90 80157A88 3800B0AF */   sw        $s0, 0x38($sp)
    /* 1DE94 80157A8C 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1DE98 80157A90 8A34020C */  jal        SetOTpos__6Dialogi
    /* 1DE9C 80157A94 F9000524 */   addiu     $a1, $zero, 0xF9
    /* 1DEA0 80157A98 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1DEA4 80157A9C 9E87050C */  jal        SetBack__6Dialogi_80161e78
    /* 1DEA8 80157AA0 05000524 */   addiu     $a1, $zero, 0x5
    /* 1DEAC 80157AA4 1280053C */  lui        $a1, %hi(BORDERR)
    /* 1DEB0 80157AA8 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 1DEB4 80157AAC 1280063C */  lui        $a2, %hi(BORDERG)
    /* 1DEB8 80157AB0 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 1DEBC 80157AB4 1280073C */  lui        $a3, %hi(BORDERB)
    /* 1DEC0 80157AB8 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 1DEC4 80157ABC 9687050C */  jal        SetRGB__6DialogUcUcUc_80161e58
    /* 1DEC8 80157AC0 1800A427 */   addiu     $a0, $sp, 0x18
    /* 1DECC 80157AC4 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1DED0 80157AC8 0A000524 */  addiu      $a1, $zero, 0xA
    /* 1DED4 80157ACC 20000624 */  addiu      $a2, $zero, 0x20
    /* 1DED8 80157AD0 74000724 */  addiu      $a3, $zero, 0x74
    /* 1DEDC 80157AD4 B0000224 */  addiu      $v0, $zero, 0xB0
    /* 1DEE0 80157AD8 B82F020C */  jal        Back__6Dialogiiii
    /* 1DEE4 80157ADC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DEE8 80157AE0 1280033C */  lui        $v1, %hi(options_pad)
    /* 1DEEC 80157AE4 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1DEF0 80157AE8 0B000224 */  addiu      $v0, $zero, 0xB
    /* 1DEF4 80157AEC D41B82A7 */  sh         $v0, %gp_rel(BRect)($gp)
    /* 1DEF8 80157AF0 20000224 */  addiu      $v0, $zero, 0x20
    /* 1DEFC 80157AF4 D61B82A7 */  sh         $v0, %gp_rel(BRect + 0x2)($gp)
    /* 1DF00 80157AF8 72000224 */  addiu      $v0, $zero, 0x72
    /* 1DF04 80157AFC D81B82A7 */  sh         $v0, %gp_rel(BRect + 0x4)($gp)
    /* 1DF08 80157B00 B0000224 */  addiu      $v0, $zero, 0xB0
    /* 1DF0C 80157B04 DA1B82A7 */  sh         $v0, %gp_rel(BRect + 0x6)($gp)
    /* 1DF10 80157B08 40100300 */  sll        $v0, $v1, 1
    /* 1DF14 80157B0C 21104300 */  addu       $v0, $v0, $v1
    /* 1DF18 80157B10 80100200 */  sll        $v0, $v0, 2
    /* 1DF1C 80157B14 21104300 */  addu       $v0, $v0, $v1
    /* 1DF20 80157B18 00110200 */  sll        $v0, $v0, 4
    /* 1DF24 80157B1C 23104300 */  subu       $v0, $v0, $v1
    /* 1DF28 80157B20 80100200 */  sll        $v0, $v0, 2
    /* 1DF2C 80157B24 21104300 */  addu       $v0, $v0, $v1
    /* 1DF30 80157B28 C0100200 */  sll        $v0, $v0, 3
    /* 1DF34 80157B2C 0E80013C */  lui        $at, %hi(plr + 0xF8)
    /* 1DF38 80157B30 21082200 */  addu       $at, $at, $v0
    /* 1DF3C 80157B34 30A62384 */  lh         $v1, %lo(plr + 0xF8)($at)
    /* 1DF40 80157B38 0E80013C */  lui        $at, %hi(plr + 0xFA)
    /* 1DF44 80157B3C 21082200 */  addu       $at, $at, $v0
    /* 1DF48 80157B40 32A62484 */  lh         $a0, %lo(plr + 0xFA)($at)
    /* 1DF4C 80157B44 00000000 */  nop
    /* 1DF50 80157B48 2A108300 */  slt        $v0, $a0, $v1
    /* 1DF54 80157B4C 2A186400 */  slt        $v1, $v1, $a0
    /* 1DF58 80157B50 02006010 */  beqz       $v1, .L80157B5C
    /* 1DF5C 80157B54 21904000 */   addu      $s2, $v0, $zero
    /* 1DF60 80157B58 02001224 */  addiu      $s2, $zero, 0x2
  .L80157B5C:
    /* 1DF64 80157B5C 4AED010C */  jal        GetStr__Fi
    /* 1DF68 80157B60 FD040424 */   addiu     $a0, $zero, 0x4FD
    /* 1DF6C 80157B64 2800B127 */  addiu      $s1, $sp, 0x28
    /* 1DF70 80157B68 1280053C */  lui        $a1, %hi(options_pad)
    /* 1DF74 80157B6C 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1DF78 80157B70 21202002 */  addu       $a0, $s1, $zero
    /* 1DF7C 80157B74 40180500 */  sll        $v1, $a1, 1
    /* 1DF80 80157B78 21186500 */  addu       $v1, $v1, $a1
    /* 1DF84 80157B7C 80180300 */  sll        $v1, $v1, 2
    /* 1DF88 80157B80 21186500 */  addu       $v1, $v1, $a1
    /* 1DF8C 80157B84 00190300 */  sll        $v1, $v1, 4
    /* 1DF90 80157B88 23186500 */  subu       $v1, $v1, $a1
    /* 1DF94 80157B8C 80180300 */  sll        $v1, $v1, 2
    /* 1DF98 80157B90 21186500 */  addu       $v1, $v1, $a1
    /* 1DF9C 80157B94 C0180300 */  sll        $v1, $v1, 3
    /* 1DFA0 80157B98 0E80013C */  lui        $at, %hi(plr + 0xF8)
    /* 1DFA4 80157B9C 21082300 */  addu       $at, $at, $v1
    /* 1DFA8 80157BA0 30A62684 */  lh         $a2, %lo(plr + 0xF8)($at)
    /* 1DFAC 80157BA4 9767000C */  jal        sprintf
    /* 1DFB0 80157BA8 21284000 */   addu      $a1, $v0, $zero
    /* 1DFB4 80157BAC 0C000424 */  addiu      $a0, $zero, 0xC
    /* 1DFB8 80157BB0 19040524 */  addiu      $a1, $zero, 0x419
    /* 1DFBC 80157BB4 21302002 */  addu       $a2, $s1, $zero
    /* 1DFC0 80157BB8 685E050C */  jal        PrintStat__FiiPcUc
    /* 1DFC4 80157BBC 21384002 */   addu      $a3, $s2, $zero
    /* 1DFC8 80157BC0 1280033C */  lui        $v1, %hi(options_pad)
    /* 1DFCC 80157BC4 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1DFD0 80157BC8 00000000 */  nop
    /* 1DFD4 80157BCC 40100300 */  sll        $v0, $v1, 1
    /* 1DFD8 80157BD0 21104300 */  addu       $v0, $v0, $v1
    /* 1DFDC 80157BD4 80100200 */  sll        $v0, $v0, 2
    /* 1DFE0 80157BD8 21104300 */  addu       $v0, $v0, $v1
    /* 1DFE4 80157BDC 00110200 */  sll        $v0, $v0, 4
    /* 1DFE8 80157BE0 23104300 */  subu       $v0, $v0, $v1
    /* 1DFEC 80157BE4 80100200 */  sll        $v0, $v0, 2
    /* 1DFF0 80157BE8 21104300 */  addu       $v0, $v0, $v1
    /* 1DFF4 80157BEC C0100200 */  sll        $v0, $v0, 3
    /* 1DFF8 80157BF0 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* 1DFFC 80157BF4 21082200 */  addu       $at, $at, $v0
    /* 1E000 80157BF8 34A62384 */  lh         $v1, %lo(plr + 0xFC)($at)
    /* 1E004 80157BFC 0E80013C */  lui        $at, %hi(plr + 0xFE)
    /* 1E008 80157C00 21082200 */  addu       $at, $at, $v0
    /* 1E00C 80157C04 36A62484 */  lh         $a0, %lo(plr + 0xFE)($at)
    /* 1E010 80157C08 00000000 */  nop
    /* 1E014 80157C0C 2A108300 */  slt        $v0, $a0, $v1
    /* 1E018 80157C10 2A186400 */  slt        $v1, $v1, $a0
    /* 1E01C 80157C14 02006010 */  beqz       $v1, .L80157C20
    /* 1E020 80157C18 21904000 */   addu      $s2, $v0, $zero
    /* 1E024 80157C1C 02001224 */  addiu      $s2, $zero, 0x2
  .L80157C20:
    /* 1E028 80157C20 4AED010C */  jal        GetStr__Fi
    /* 1E02C 80157C24 FD040424 */   addiu     $a0, $zero, 0x4FD
    /* 1E030 80157C28 1280053C */  lui        $a1, %hi(options_pad)
    /* 1E034 80157C2C 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1E038 80157C30 21202002 */  addu       $a0, $s1, $zero
    /* 1E03C 80157C34 40180500 */  sll        $v1, $a1, 1
    /* 1E040 80157C38 21186500 */  addu       $v1, $v1, $a1
    /* 1E044 80157C3C 80180300 */  sll        $v1, $v1, 2
    /* 1E048 80157C40 21186500 */  addu       $v1, $v1, $a1
    /* 1E04C 80157C44 00190300 */  sll        $v1, $v1, 4
    /* 1E050 80157C48 23186500 */  subu       $v1, $v1, $a1
    /* 1E054 80157C4C 80180300 */  sll        $v1, $v1, 2
    /* 1E058 80157C50 21186500 */  addu       $v1, $v1, $a1
    /* 1E05C 80157C54 C0180300 */  sll        $v1, $v1, 3
    /* 1E060 80157C58 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* 1E064 80157C5C 21082300 */  addu       $at, $at, $v1
    /* 1E068 80157C60 34A62684 */  lh         $a2, %lo(plr + 0xFC)($at)
    /* 1E06C 80157C64 9767000C */  jal        sprintf
    /* 1E070 80157C68 21284000 */   addu      $a1, $v0, $zero
    /* 1E074 80157C6C 19000424 */  addiu      $a0, $zero, 0x19
    /* 1E078 80157C70 6F020524 */  addiu      $a1, $zero, 0x26F
    /* 1E07C 80157C74 21302002 */  addu       $a2, $s1, $zero
    /* 1E080 80157C78 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E084 80157C7C 21384002 */   addu      $a3, $s2, $zero
    /* 1E088 80157C80 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E08C 80157C84 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E090 80157C88 00000000 */  nop
    /* 1E094 80157C8C 40100300 */  sll        $v0, $v1, 1
    /* 1E098 80157C90 21104300 */  addu       $v0, $v0, $v1
    /* 1E09C 80157C94 80100200 */  sll        $v0, $v0, 2
    /* 1E0A0 80157C98 21104300 */  addu       $v0, $v0, $v1
    /* 1E0A4 80157C9C 00110200 */  sll        $v0, $v0, 4
    /* 1E0A8 80157CA0 23104300 */  subu       $v0, $v0, $v1
    /* 1E0AC 80157CA4 80100200 */  sll        $v0, $v0, 2
    /* 1E0B0 80157CA8 21104300 */  addu       $v0, $v0, $v1
    /* 1E0B4 80157CAC C0100200 */  sll        $v0, $v0, 3
    /* 1E0B8 80157CB0 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 1E0BC 80157CB4 21082200 */  addu       $at, $at, $v0
    /* 1E0C0 80157CB8 38A62384 */  lh         $v1, %lo(plr + 0x100)($at)
    /* 1E0C4 80157CBC 0E80013C */  lui        $at, %hi(plr + 0x102)
    /* 1E0C8 80157CC0 21082200 */  addu       $at, $at, $v0
    /* 1E0CC 80157CC4 3AA62484 */  lh         $a0, %lo(plr + 0x102)($at)
    /* 1E0D0 80157CC8 00000000 */  nop
    /* 1E0D4 80157CCC 2A108300 */  slt        $v0, $a0, $v1
    /* 1E0D8 80157CD0 2A186400 */  slt        $v1, $v1, $a0
    /* 1E0DC 80157CD4 02006010 */  beqz       $v1, .L80157CE0
    /* 1E0E0 80157CD8 21904000 */   addu      $s2, $v0, $zero
    /* 1E0E4 80157CDC 02001224 */  addiu      $s2, $zero, 0x2
  .L80157CE0:
    /* 1E0E8 80157CE0 4AED010C */  jal        GetStr__Fi
    /* 1E0EC 80157CE4 FD040424 */   addiu     $a0, $zero, 0x4FD
    /* 1E0F0 80157CE8 1280053C */  lui        $a1, %hi(options_pad)
    /* 1E0F4 80157CEC 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1E0F8 80157CF0 21202002 */  addu       $a0, $s1, $zero
    /* 1E0FC 80157CF4 40180500 */  sll        $v1, $a1, 1
    /* 1E100 80157CF8 21186500 */  addu       $v1, $v1, $a1
    /* 1E104 80157CFC 80180300 */  sll        $v1, $v1, 2
    /* 1E108 80157D00 21186500 */  addu       $v1, $v1, $a1
    /* 1E10C 80157D04 00190300 */  sll        $v1, $v1, 4
    /* 1E110 80157D08 23186500 */  subu       $v1, $v1, $a1
    /* 1E114 80157D0C 80180300 */  sll        $v1, $v1, 2
    /* 1E118 80157D10 21186500 */  addu       $v1, $v1, $a1
    /* 1E11C 80157D14 C0180300 */  sll        $v1, $v1, 3
    /* 1E120 80157D18 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 1E124 80157D1C 21082300 */  addu       $at, $at, $v1
    /* 1E128 80157D20 38A62684 */  lh         $a2, %lo(plr + 0x100)($at)
    /* 1E12C 80157D24 9767000C */  jal        sprintf
    /* 1E130 80157D28 21284000 */   addu      $a1, $v0, $zero
    /* 1E134 80157D2C 26000424 */  addiu      $a0, $zero, 0x26
    /* 1E138 80157D30 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 1E13C 80157D34 21302002 */  addu       $a2, $s1, $zero
    /* 1E140 80157D38 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E144 80157D3C 21384002 */   addu      $a3, $s2, $zero
    /* 1E148 80157D40 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E14C 80157D44 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E150 80157D48 00000000 */  nop
    /* 1E154 80157D4C 40100300 */  sll        $v0, $v1, 1
    /* 1E158 80157D50 21104300 */  addu       $v0, $v0, $v1
    /* 1E15C 80157D54 80100200 */  sll        $v0, $v0, 2
    /* 1E160 80157D58 21104300 */  addu       $v0, $v0, $v1
    /* 1E164 80157D5C 00110200 */  sll        $v0, $v0, 4
    /* 1E168 80157D60 23104300 */  subu       $v0, $v0, $v1
    /* 1E16C 80157D64 80100200 */  sll        $v0, $v0, 2
    /* 1E170 80157D68 21104300 */  addu       $v0, $v0, $v1
    /* 1E174 80157D6C C0100200 */  sll        $v0, $v0, 3
    /* 1E178 80157D70 0E80013C */  lui        $at, %hi(plr + 0x104)
    /* 1E17C 80157D74 21082200 */  addu       $at, $at, $v0
    /* 1E180 80157D78 3CA62384 */  lh         $v1, %lo(plr + 0x104)($at)
    /* 1E184 80157D7C 0E80013C */  lui        $at, %hi(plr + 0x106)
    /* 1E188 80157D80 21082200 */  addu       $at, $at, $v0
    /* 1E18C 80157D84 3EA62484 */  lh         $a0, %lo(plr + 0x106)($at)
    /* 1E190 80157D88 00000000 */  nop
    /* 1E194 80157D8C 2A108300 */  slt        $v0, $a0, $v1
    /* 1E198 80157D90 2A186400 */  slt        $v1, $v1, $a0
    /* 1E19C 80157D94 02006010 */  beqz       $v1, .L80157DA0
    /* 1E1A0 80157D98 21904000 */   addu      $s2, $v0, $zero
    /* 1E1A4 80157D9C 02001224 */  addiu      $s2, $zero, 0x2
  .L80157DA0:
    /* 1E1A8 80157DA0 4AED010C */  jal        GetStr__Fi
    /* 1E1AC 80157DA4 FD040424 */   addiu     $a0, $zero, 0x4FD
    /* 1E1B0 80157DA8 1280053C */  lui        $a1, %hi(options_pad)
    /* 1E1B4 80157DAC 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1E1B8 80157DB0 21202002 */  addu       $a0, $s1, $zero
    /* 1E1BC 80157DB4 40180500 */  sll        $v1, $a1, 1
    /* 1E1C0 80157DB8 21186500 */  addu       $v1, $v1, $a1
    /* 1E1C4 80157DBC 80180300 */  sll        $v1, $v1, 2
    /* 1E1C8 80157DC0 21186500 */  addu       $v1, $v1, $a1
    /* 1E1CC 80157DC4 00190300 */  sll        $v1, $v1, 4
    /* 1E1D0 80157DC8 23186500 */  subu       $v1, $v1, $a1
    /* 1E1D4 80157DCC 80180300 */  sll        $v1, $v1, 2
    /* 1E1D8 80157DD0 21186500 */  addu       $v1, $v1, $a1
    /* 1E1DC 80157DD4 C0180300 */  sll        $v1, $v1, 3
    /* 1E1E0 80157DD8 0E80013C */  lui        $at, %hi(plr + 0x104)
    /* 1E1E4 80157DDC 21082300 */  addu       $at, $at, $v1
    /* 1E1E8 80157DE0 3CA62684 */  lh         $a2, %lo(plr + 0x104)($at)
    /* 1E1EC 80157DE4 9767000C */  jal        sprintf
    /* 1E1F0 80157DE8 21284000 */   addu      $a1, $v0, $zero
    /* 1E1F4 80157DEC 32000424 */  addiu      $a0, $zero, 0x32
    /* 1E1F8 80157DF0 B7040524 */  addiu      $a1, $zero, 0x4B7
    /* 1E1FC 80157DF4 21302002 */  addu       $a2, $s1, $zero
    /* 1E200 80157DF8 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E204 80157DFC 21384002 */   addu      $a3, $s2, $zero
    /* 1E208 80157E00 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E20C 80157E04 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E210 80157E08 00000000 */  nop
    /* 1E214 80157E0C 40100300 */  sll        $v0, $v1, 1
    /* 1E218 80157E10 21104300 */  addu       $v0, $v0, $v1
    /* 1E21C 80157E14 80100200 */  sll        $v0, $v0, 2
    /* 1E220 80157E18 21104300 */  addu       $v0, $v0, $v1
    /* 1E224 80157E1C 00110200 */  sll        $v0, $v0, 4
    /* 1E228 80157E20 23104300 */  subu       $v0, $v0, $v1
    /* 1E22C 80157E24 80100200 */  sll        $v0, $v0, 2
    /* 1E230 80157E28 21104300 */  addu       $v0, $v0, $v1
    /* 1E234 80157E2C C0200200 */  sll        $a0, $v0, 3
    /* 1E238 80157E30 0E80013C */  lui        $at, %hi(plr + 0x19A0)
    /* 1E23C 80157E34 21082400 */  addu       $at, $at, $a0
    /* 1E240 80157E38 D8BE238C */  lw         $v1, %lo(plr + 0x19A0)($at)
    /* 1E244 80157E3C 00000000 */  nop
    /* 1E248 80157E40 2A100300 */  slt        $v0, $zero, $v1
    /* 1E24C 80157E44 02006104 */  bgez       $v1, .L80157E50
    /* 1E250 80157E48 21904000 */   addu      $s2, $v0, $zero
    /* 1E254 80157E4C 02001224 */  addiu      $s2, $zero, 0x2
  .L80157E50:
    /* 1E258 80157E50 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 1E25C 80157E54 21082400 */  addu       $at, $at, $a0
    /* 1E260 80157E58 38A63094 */  lhu        $s0, %lo(plr + 0x100)($at)
    /* 1E264 80157E5C 03050424 */  addiu      $a0, $zero, 0x503
    /* 1E268 80157E60 32006224 */  addiu      $v0, $v1, 0x32
    /* 1E26C 80157E64 00841000 */  sll        $s0, $s0, 16
    /* 1E270 80157E68 43841000 */  sra        $s0, $s0, 17
    /* 1E274 80157E6C 4AED010C */  jal        GetStr__Fi
    /* 1E278 80157E70 21800202 */   addu      $s0, $s0, $v0
    /* 1E27C 80157E74 21202002 */  addu       $a0, $s1, $zero
    /* 1E280 80157E78 21284000 */  addu       $a1, $v0, $zero
    /* 1E284 80157E7C 9767000C */  jal        sprintf
    /* 1E288 80157E80 21300002 */   addu      $a2, $s0, $zero
    /* 1E28C 80157E84 40000424 */  addiu      $a0, $zero, 0x40
    /* 1E290 80157E88 95040524 */  addiu      $a1, $zero, 0x495
    /* 1E294 80157E8C 21302002 */  addu       $a2, $s1, $zero
    /* 1E298 80157E90 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E29C 80157E94 21384002 */   addu      $a3, $s2, $zero
    /* 1E2A0 80157E98 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E2A4 80157E9C 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E2A8 80157EA0 00000000 */  nop
    /* 1E2AC 80157EA4 40100300 */  sll        $v0, $v1, 1
    /* 1E2B0 80157EA8 21104300 */  addu       $v0, $v0, $v1
    /* 1E2B4 80157EAC 80100200 */  sll        $v0, $v0, 2
    /* 1E2B8 80157EB0 21104300 */  addu       $v0, $v0, $v1
    /* 1E2BC 80157EB4 00110200 */  sll        $v0, $v0, 4
    /* 1E2C0 80157EB8 23104300 */  subu       $v0, $v0, $v1
    /* 1E2C4 80157EBC 80100200 */  sll        $v0, $v0, 2
    /* 1E2C8 80157EC0 21104300 */  addu       $v0, $v0, $v1
    /* 1E2CC 80157EC4 C0200200 */  sll        $a0, $v0, 3
    /* 1E2D0 80157EC8 0E80013C */  lui        $at, %hi(plr + 0x199C)
    /* 1E2D4 80157ECC 21082400 */  addu       $at, $at, $a0
    /* 1E2D8 80157ED0 D4BE238C */  lw         $v1, %lo(plr + 0x199C)($at)
    /* 1E2DC 80157ED4 00000000 */  nop
    /* 1E2E0 80157ED8 2A100300 */  slt        $v0, $zero, $v1
    /* 1E2E4 80157EDC 02006104 */  bgez       $v1, .L80157EE8
    /* 1E2E8 80157EE0 21904000 */   addu      $s2, $v0, $zero
    /* 1E2EC 80157EE4 02001224 */  addiu      $s2, $zero, 0x2
  .L80157EE8:
    /* 1E2F0 80157EE8 0E80013C */  lui        $at, %hi(plr + 0x1990)
    /* 1E2F4 80157EEC 21082400 */  addu       $at, $at, $a0
    /* 1E2F8 80157EF0 C8BE318C */  lw         $s1, %lo(plr + 0x1990)($at)
    /* 1E2FC 80157EF4 00000000 */  nop
    /* 1E300 80157EF8 18002302 */  mult       $s1, $v1
    /* 1E304 80157EFC 12180000 */  mflo       $v1
    /* 1E308 80157F00 EB51023C */  lui        $v0, (0x51EB851F >> 16)
    /* 1E30C 80157F04 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
    /* 1E310 80157F08 18006200 */  mult       $v1, $v0
    /* 1E314 80157F0C C31F0300 */  sra        $v1, $v1, 31
    /* 1E318 80157F10 10400000 */  mfhi       $t0
    /* 1E31C 80157F14 43110800 */  sra        $v0, $t0, 5
    /* 1E320 80157F18 23104300 */  subu       $v0, $v0, $v1
    /* 1E324 80157F1C 0E80013C */  lui        $at, %hi(plr + 0x19A8)
    /* 1E328 80157F20 21082400 */  addu       $at, $at, $a0
    /* 1E32C 80157F24 E0BE238C */  lw         $v1, %lo(plr + 0x19A8)($at)
    /* 1E330 80157F28 21882202 */  addu       $s1, $s1, $v0
    /* 1E334 80157F2C 21882302 */  addu       $s1, $s1, $v1
    /* 1E338 80157F30 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 1E33C 80157F34 21082400 */  addu       $at, $at, $a0
    /* 1E340 80157F38 C4A82384 */  lh         $v1, %lo(plr + 0x38C)($at)
    /* 1E344 80157F3C 03000224 */  addiu      $v0, $zero, 0x3
    /* 1E348 80157F40 0C006214 */  bne        $v1, $v0, .L80157F74
    /* 1E34C 80157F44 01000224 */   addiu     $v0, $zero, 0x1
    /* 1E350 80157F48 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1E354 80157F4C 21082400 */  addu       $at, $at, $a0
    /* 1E358 80157F50 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1E35C 80157F54 00000000 */  nop
    /* 1E360 80157F58 06006210 */  beq        $v1, $v0, .L80157F74
    /* 1E364 80157F5C 00000000 */   nop
    /* 1E368 80157F60 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 1E36C 80157F64 21082400 */  addu       $at, $at, $a0
    /* 1E370 80157F68 44A6228C */  lw         $v0, %lo(plr + 0x10C)($at)
    /* 1E374 80157F6C E05F0508 */  j          .L80157F80
    /* 1E378 80157F70 43100200 */   sra       $v0, $v0, 1
  .L80157F74:
    /* 1E37C 80157F74 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 1E380 80157F78 21082400 */  addu       $at, $at, $a0
    /* 1E384 80157F7C 44A6228C */  lw         $v0, %lo(plr + 0x10C)($at)
  .L80157F80:
    /* 1E388 80157F80 00000000 */  nop
    /* 1E38C 80157F84 21882202 */  addu       $s1, $s1, $v0
    /* 1E390 80157F88 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E394 80157F8C 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E398 80157F90 00000000 */  nop
    /* 1E39C 80157F94 40100300 */  sll        $v0, $v1, 1
    /* 1E3A0 80157F98 21104300 */  addu       $v0, $v0, $v1
    /* 1E3A4 80157F9C 80100200 */  sll        $v0, $v0, 2
    /* 1E3A8 80157FA0 21104300 */  addu       $v0, $v0, $v1
    /* 1E3AC 80157FA4 00110200 */  sll        $v0, $v0, 4
    /* 1E3B0 80157FA8 23104300 */  subu       $v0, $v0, $v1
    /* 1E3B4 80157FAC 80100200 */  sll        $v0, $v0, 2
    /* 1E3B8 80157FB0 21104300 */  addu       $v0, $v0, $v1
    /* 1E3BC 80157FB4 C0200200 */  sll        $a0, $v0, 3
    /* 1E3C0 80157FB8 0E80013C */  lui        $at, %hi(plr + 0x1994)
    /* 1E3C4 80157FBC 21082400 */  addu       $at, $at, $a0
    /* 1E3C8 80157FC0 CCBE308C */  lw         $s0, %lo(plr + 0x1994)($at)
    /* 1E3CC 80157FC4 0E80013C */  lui        $at, %hi(plr + 0x199C)
    /* 1E3D0 80157FC8 21082400 */  addu       $at, $at, $a0
    /* 1E3D4 80157FCC D4BE228C */  lw         $v0, %lo(plr + 0x199C)($at)
    /* 1E3D8 80157FD0 00000000 */  nop
    /* 1E3DC 80157FD4 18000202 */  mult       $s0, $v0
    /* 1E3E0 80157FD8 12100000 */  mflo       $v0
    /* 1E3E4 80157FDC EB51033C */  lui        $v1, (0x51EB851F >> 16)
    /* 1E3E8 80157FE0 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 1E3EC 80157FE4 18004300 */  mult       $v0, $v1
    /* 1E3F0 80157FE8 C3170200 */  sra        $v0, $v0, 31
    /* 1E3F4 80157FEC 10400000 */  mfhi       $t0
    /* 1E3F8 80157FF0 43190800 */  sra        $v1, $t0, 5
    /* 1E3FC 80157FF4 23186200 */  subu       $v1, $v1, $v0
    /* 1E400 80157FF8 21800302 */  addu       $s0, $s0, $v1
    /* 1E404 80157FFC 0E80013C */  lui        $at, %hi(plr + 0x19A8)
    /* 1E408 80158000 21082400 */  addu       $at, $at, $a0
    /* 1E40C 80158004 E0BE228C */  lw         $v0, %lo(plr + 0x19A8)($at)
    /* 1E410 80158008 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 1E414 8015800C 21082400 */  addu       $at, $at, $a0
    /* 1E418 80158010 C4A82384 */  lh         $v1, %lo(plr + 0x38C)($at)
    /* 1E41C 80158014 21800202 */  addu       $s0, $s0, $v0
    /* 1E420 80158018 03000224 */  addiu      $v0, $zero, 0x3
    /* 1E424 8015801C 0C006214 */  bne        $v1, $v0, .L80158050
    /* 1E428 80158020 01000224 */   addiu     $v0, $zero, 0x1
    /* 1E42C 80158024 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1E430 80158028 21082400 */  addu       $at, $at, $a0
    /* 1E434 8015802C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1E438 80158030 00000000 */  nop
    /* 1E43C 80158034 06006210 */  beq        $v1, $v0, .L80158050
    /* 1E440 80158038 00000000 */   nop
    /* 1E444 8015803C 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 1E448 80158040 21082400 */  addu       $at, $at, $a0
    /* 1E44C 80158044 44A6228C */  lw         $v0, %lo(plr + 0x10C)($at)
    /* 1E450 80158048 17600508 */  j          .L8015805C
    /* 1E454 8015804C 43100200 */   sra       $v0, $v0, 1
  .L80158050:
    /* 1E458 80158050 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 1E45C 80158054 21082400 */  addu       $at, $at, $a0
    /* 1E460 80158058 44A6228C */  lw         $v0, %lo(plr + 0x10C)($at)
  .L8015805C:
    /* 1E464 8015805C 00000000 */  nop
    /* 1E468 80158060 21800202 */  addu       $s0, $s0, $v0
    /* 1E46C 80158064 4AED010C */  jal        GetStr__Fi
    /* 1E470 80158068 01050424 */   addiu     $a0, $zero, 0x501
    /* 1E474 8015806C 2800B327 */  addiu      $s3, $sp, 0x28
    /* 1E478 80158070 21206002 */  addu       $a0, $s3, $zero
    /* 1E47C 80158074 21284000 */  addu       $a1, $v0, $zero
    /* 1E480 80158078 21302002 */  addu       $a2, $s1, $zero
    /* 1E484 8015807C 9767000C */  jal        sprintf
    /* 1E488 80158080 21380002 */   addu      $a3, $s0, $zero
    /* 1E48C 80158084 4D000424 */  addiu      $a0, $zero, 0x4D
    /* 1E490 80158088 E1000524 */  addiu      $a1, $zero, 0xE1
    /* 1E494 8015808C 21306002 */  addu       $a2, $s3, $zero
    /* 1E498 80158090 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E49C 80158094 21384002 */   addu      $a3, $s2, $zero
    /* 1E4A0 80158098 1280023C */  lui        $v0, %hi(options_pad)
    /* 1E4A4 8015809C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 1E4A8 801580A0 00000000 */  nop
    /* 1E4AC 801580A4 40180200 */  sll        $v1, $v0, 1
    /* 1E4B0 801580A8 21186200 */  addu       $v1, $v1, $v0
    /* 1E4B4 801580AC 80180300 */  sll        $v1, $v1, 2
    /* 1E4B8 801580B0 21186200 */  addu       $v1, $v1, $v0
    /* 1E4BC 801580B4 00190300 */  sll        $v1, $v1, 4
    /* 1E4C0 801580B8 23186200 */  subu       $v1, $v1, $v0
    /* 1E4C4 801580BC 80180300 */  sll        $v1, $v1, 2
    /* 1E4C8 801580C0 21186200 */  addu       $v1, $v1, $v0
    /* 1E4CC 801580C4 C0180300 */  sll        $v1, $v1, 3
    /* 1E4D0 801580C8 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 1E4D4 801580CC 21082300 */  addu       $at, $at, $v1
    /* 1E4D8 801580D0 58A6278C */  lw         $a3, %lo(plr + 0x120)($at)
    /* 1E4DC 801580D4 0E80013C */  lui        $at, %hi(plr + 0x118)
    /* 1E4E0 801580D8 21082300 */  addu       $at, $at, $v1
    /* 1E4E4 801580DC 50A6228C */  lw         $v0, %lo(plr + 0x118)($at)
    /* 1E4E8 801580E0 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 1E4EC 801580E4 21082300 */  addu       $at, $at, $v1
    /* 1E4F0 801580E8 54A6268C */  lw         $a2, %lo(plr + 0x11C)($at)
    /* 1E4F4 801580EC 2A104700 */  slt        $v0, $v0, $a3
    /* 1E4F8 801580F0 0200C710 */  beq        $a2, $a3, .L801580FC
    /* 1E4FC 801580F4 21904000 */   addu      $s2, $v0, $zero
    /* 1E500 801580F8 02001224 */  addiu      $s2, $zero, 0x2
  .L801580FC:
    /* 1E504 801580FC 21206002 */  addu       $a0, $s3, $zero
    /* 1E508 80158100 1280103C */  lui        $s0, %hi(D_8011C318)
    /* 1E50C 80158104 18C31026 */  addiu      $s0, $s0, %lo(D_8011C318)
    /* 1E510 80158108 21280002 */  addu       $a1, $s0, $zero
    /* 1E514 8015810C 83310600 */  sra        $a2, $a2, 6
    /* 1E518 80158110 9767000C */  jal        sprintf
    /* 1E51C 80158114 83390700 */   sra       $a3, $a3, 6
    /* 1E520 80158118 5C000424 */  addiu      $a0, $zero, 0x5C
    /* 1E524 8015811C 4D020524 */  addiu      $a1, $zero, 0x24D
    /* 1E528 80158120 21306002 */  addu       $a2, $s3, $zero
    /* 1E52C 80158124 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E530 80158128 21384002 */   addu      $a3, $s2, $zero
    /* 1E534 8015812C 1280023C */  lui        $v0, %hi(options_pad)
    /* 1E538 80158130 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 1E53C 80158134 00000000 */  nop
    /* 1E540 80158138 40180200 */  sll        $v1, $v0, 1
    /* 1E544 8015813C 21186200 */  addu       $v1, $v1, $v0
    /* 1E548 80158140 80180300 */  sll        $v1, $v1, 2
    /* 1E54C 80158144 21186200 */  addu       $v1, $v1, $v0
    /* 1E550 80158148 00190300 */  sll        $v1, $v1, 4
    /* 1E554 8015814C 23186200 */  subu       $v1, $v1, $v0
    /* 1E558 80158150 80180300 */  sll        $v1, $v1, 2
    /* 1E55C 80158154 21186200 */  addu       $v1, $v1, $v0
    /* 1E560 80158158 C0180300 */  sll        $v1, $v1, 3
    /* 1E564 8015815C 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 1E568 80158160 21082300 */  addu       $at, $at, $v1
    /* 1E56C 80158164 6CA6278C */  lw         $a3, %lo(plr + 0x134)($at)
    /* 1E570 80158168 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 1E574 8015816C 21082300 */  addu       $at, $at, $v1
    /* 1E578 80158170 64A6228C */  lw         $v0, %lo(plr + 0x12C)($at)
    /* 1E57C 80158174 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 1E580 80158178 21082300 */  addu       $at, $at, $v1
    /* 1E584 8015817C 68A6268C */  lw         $a2, %lo(plr + 0x130)($at)
    /* 1E588 80158180 2A104700 */  slt        $v0, $v0, $a3
    /* 1E58C 80158184 0200C710 */  beq        $a2, $a3, .L80158190
    /* 1E590 80158188 21904000 */   addu      $s2, $v0, $zero
    /* 1E594 8015818C 02001224 */  addiu      $s2, $zero, 0x2
  .L80158190:
    /* 1E598 80158190 21206002 */  addu       $a0, $s3, $zero
    /* 1E59C 80158194 21280002 */  addu       $a1, $s0, $zero
    /* 1E5A0 80158198 83310600 */  sra        $a2, $a2, 6
    /* 1E5A4 8015819C 9767000C */  jal        sprintf
    /* 1E5A8 801581A0 83390700 */   sra       $a3, $a3, 6
    /* 1E5AC 801581A4 68000424 */  addiu      $a0, $zero, 0x68
    /* 1E5B0 801581A8 7A020524 */  addiu      $a1, $zero, 0x27A
    /* 1E5B4 801581AC 21306002 */  addu       $a2, $s3, $zero
    /* 1E5B8 801581B0 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E5BC 801581B4 21384002 */   addu      $a3, $s2, $zero
    /* 1E5C0 801581B8 1280023C */  lui        $v0, %hi(options_pad)
    /* 1E5C4 801581BC 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 1E5C8 801581C0 00000000 */  nop
    /* 1E5CC 801581C4 40180200 */  sll        $v1, $v0, 1
    /* 1E5D0 801581C8 21186200 */  addu       $v1, $v1, $v0
    /* 1E5D4 801581CC 80180300 */  sll        $v1, $v1, 2
    /* 1E5D8 801581D0 21186200 */  addu       $v1, $v1, $v0
    /* 1E5DC 801581D4 00190300 */  sll        $v1, $v1, 4
    /* 1E5E0 801581D8 23186200 */  subu       $v1, $v1, $v0
    /* 1E5E4 801581DC 80180300 */  sll        $v1, $v1, 2
    /* 1E5E8 801581E0 21186200 */  addu       $v1, $v1, $v0
    /* 1E5EC 801581E4 C0280300 */  sll        $a1, $v1, 3
    /* 1E5F0 801581E8 0E80013C */  lui        $at, %hi(plr + 0x19A4)
    /* 1E5F4 801581EC 21082500 */  addu       $at, $at, $a1
    /* 1E5F8 801581F0 DCBE268C */  lw         $a2, %lo(plr + 0x19A4)($at)
    /* 1E5FC 801581F4 00000000 */  nop
    /* 1E600 801581F8 2A100600 */  slt        $v0, $zero, $a2
    /* 1E604 801581FC 0200C104 */  bgez       $a2, .L80158208
    /* 1E608 80158200 21904000 */   addu      $s2, $v0, $zero
    /* 1E60C 80158204 02001224 */  addiu      $s2, $zero, 0x2
  .L80158208:
    /* 1E610 80158208 6666043C */  lui        $a0, (0x66666667 >> 16)
    /* 1E614 8015820C 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 1E618 80158210 21082500 */  addu       $at, $at, $a1
    /* 1E61C 80158214 38A62394 */  lhu        $v1, %lo(plr + 0x100)($at)
    /* 1E620 80158218 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
    /* 1E624 8015821C 001C0300 */  sll        $v1, $v1, 16
    /* 1E628 80158220 03140300 */  sra        $v0, $v1, 16
    /* 1E62C 80158224 18004400 */  mult       $v0, $a0
    /* 1E630 80158228 0E80013C */  lui        $at, %hi(plr + 0x1998)
    /* 1E634 8015822C 21082500 */  addu       $at, $at, $a1
    /* 1E638 80158230 D0BE308C */  lw         $s0, %lo(plr + 0x1998)($at)
    /* 1E63C 80158234 FD040424 */  addiu      $a0, $zero, 0x4FD
    /* 1E640 80158238 21800602 */  addu       $s0, $s0, $a2
    /* 1E644 8015823C C31F0300 */  sra        $v1, $v1, 31
    /* 1E648 80158240 10400000 */  mfhi       $t0
    /* 1E64C 80158244 43100800 */  sra        $v0, $t0, 1
    /* 1E650 80158248 23104300 */  subu       $v0, $v0, $v1
    /* 1E654 8015824C 00140200 */  sll        $v0, $v0, 16
    /* 1E658 80158250 03140200 */  sra        $v0, $v0, 16
    /* 1E65C 80158254 4AED010C */  jal        GetStr__Fi
    /* 1E660 80158258 21800202 */   addu      $s0, $s0, $v0
    /* 1E664 8015825C 21206002 */  addu       $a0, $s3, $zero
    /* 1E668 80158260 21284000 */  addu       $a1, $v0, $zero
    /* 1E66C 80158264 9767000C */  jal        sprintf
    /* 1E670 80158268 21300002 */   addu      $a2, $s0, $zero
    /* 1E674 8015826C 75000424 */  addiu      $a0, $zero, 0x75
    /* 1E678 80158270 2A000524 */  addiu      $a1, $zero, 0x2A
    /* 1E67C 80158274 21306002 */  addu       $a2, $s3, $zero
    /* 1E680 80158278 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E684 8015827C 21384002 */   addu      $a3, $s2, $zero
    /* 1E688 80158280 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E68C 80158284 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E690 80158288 00000000 */  nop
    /* 1E694 8015828C 40100300 */  sll        $v0, $v1, 1
    /* 1E698 80158290 21104300 */  addu       $v0, $v0, $v1
    /* 1E69C 80158294 80100200 */  sll        $v0, $v0, 2
    /* 1E6A0 80158298 21104300 */  addu       $v0, $v0, $v1
    /* 1E6A4 8015829C 00110200 */  sll        $v0, $v0, 4
    /* 1E6A8 801582A0 23104300 */  subu       $v0, $v0, $v1
    /* 1E6AC 801582A4 80100200 */  sll        $v0, $v0, 2
    /* 1E6B0 801582A8 21104300 */  addu       $v0, $v0, $v1
    /* 1E6B4 801582AC C0100200 */  sll        $v0, $v0, 3
    /* 1E6B8 801582B0 0E80013C */  lui        $at, %hi(plr + 0x14D)
    /* 1E6BC 801582B4 21082200 */  addu       $at, $at, $v0
    /* 1E6C0 801582B8 85A62280 */  lb         $v0, %lo(plr + 0x14D)($at)
    /* 1E6C4 801582BC 00000000 */  nop
    /* 1E6C8 801582C0 2B180200 */  sltu       $v1, $zero, $v0
    /* 1E6CC 801582C4 4B004228 */  slti       $v0, $v0, 0x4B
    /* 1E6D0 801582C8 16004010 */  beqz       $v0, .L80158324
    /* 1E6D4 801582CC 21906000 */   addu      $s2, $v1, $zero
    /* 1E6D8 801582D0 4AED010C */  jal        GetStr__Fi
    /* 1E6DC 801582D4 03050424 */   addiu     $a0, $zero, 0x503
    /* 1E6E0 801582D8 1280053C */  lui        $a1, %hi(options_pad)
    /* 1E6E4 801582DC 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1E6E8 801582E0 21206002 */  addu       $a0, $s3, $zero
    /* 1E6EC 801582E4 40180500 */  sll        $v1, $a1, 1
    /* 1E6F0 801582E8 21186500 */  addu       $v1, $v1, $a1
    /* 1E6F4 801582EC 80180300 */  sll        $v1, $v1, 2
    /* 1E6F8 801582F0 21186500 */  addu       $v1, $v1, $a1
    /* 1E6FC 801582F4 00190300 */  sll        $v1, $v1, 4
    /* 1E700 801582F8 23186500 */  subu       $v1, $v1, $a1
    /* 1E704 801582FC 80180300 */  sll        $v1, $v1, 2
    /* 1E708 80158300 21186500 */  addu       $v1, $v1, $a1
    /* 1E70C 80158304 C0180300 */  sll        $v1, $v1, 3
    /* 1E710 80158308 0E80013C */  lui        $at, %hi(plr + 0x14D)
    /* 1E714 8015830C 21082300 */  addu       $at, $at, $v1
    /* 1E718 80158310 85A62680 */  lb         $a2, %lo(plr + 0x14D)($at)
    /* 1E71C 80158314 9767000C */  jal        sprintf
    /* 1E720 80158318 21284000 */   addu      $a1, $v0, $zero
    /* 1E724 8015831C D0600508 */  j          .L80158340
    /* 1E728 80158320 84000424 */   addiu     $a0, $zero, 0x84
  .L80158324:
    /* 1E72C 80158324 03001224 */  addiu      $s2, $zero, 0x3
    /* 1E730 80158328 4AED010C */  jal        GetStr__Fi
    /* 1E734 8015832C 85020424 */   addiu     $a0, $zero, 0x285
    /* 1E738 80158330 21206002 */  addu       $a0, $s3, $zero
    /* 1E73C 80158334 9767000C */  jal        sprintf
    /* 1E740 80158338 21284000 */   addu      $a1, $v0, $zero
    /* 1E744 8015833C 84000424 */  addiu      $a0, $zero, 0x84
  .L80158340:
    /* 1E748 80158340 73020524 */  addiu      $a1, $zero, 0x273
    /* 1E74C 80158344 2800B027 */  addiu      $s0, $sp, 0x28
    /* 1E750 80158348 21300002 */  addu       $a2, $s0, $zero
    /* 1E754 8015834C 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E758 80158350 21384002 */   addu      $a3, $s2, $zero
    /* 1E75C 80158354 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E760 80158358 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E764 8015835C 00000000 */  nop
    /* 1E768 80158360 40100300 */  sll        $v0, $v1, 1
    /* 1E76C 80158364 21104300 */  addu       $v0, $v0, $v1
    /* 1E770 80158368 80100200 */  sll        $v0, $v0, 2
    /* 1E774 8015836C 21104300 */  addu       $v0, $v0, $v1
    /* 1E778 80158370 00110200 */  sll        $v0, $v0, 4
    /* 1E77C 80158374 23104300 */  subu       $v0, $v0, $v1
    /* 1E780 80158378 80100200 */  sll        $v0, $v0, 2
    /* 1E784 8015837C 21104300 */  addu       $v0, $v0, $v1
    /* 1E788 80158380 C0100200 */  sll        $v0, $v0, 3
    /* 1E78C 80158384 0E80013C */  lui        $at, %hi(plr + 0x14E)
    /* 1E790 80158388 21082200 */  addu       $at, $at, $v0
    /* 1E794 8015838C 86A62280 */  lb         $v0, %lo(plr + 0x14E)($at)
    /* 1E798 80158390 00000000 */  nop
    /* 1E79C 80158394 2B180200 */  sltu       $v1, $zero, $v0
    /* 1E7A0 80158398 4B004228 */  slti       $v0, $v0, 0x4B
    /* 1E7A4 8015839C 16004010 */  beqz       $v0, .L801583F8
    /* 1E7A8 801583A0 21906000 */   addu      $s2, $v1, $zero
    /* 1E7AC 801583A4 4AED010C */  jal        GetStr__Fi
    /* 1E7B0 801583A8 03050424 */   addiu     $a0, $zero, 0x503
    /* 1E7B4 801583AC 1280053C */  lui        $a1, %hi(options_pad)
    /* 1E7B8 801583B0 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1E7BC 801583B4 21200002 */  addu       $a0, $s0, $zero
    /* 1E7C0 801583B8 40180500 */  sll        $v1, $a1, 1
    /* 1E7C4 801583BC 21186500 */  addu       $v1, $v1, $a1
    /* 1E7C8 801583C0 80180300 */  sll        $v1, $v1, 2
    /* 1E7CC 801583C4 21186500 */  addu       $v1, $v1, $a1
    /* 1E7D0 801583C8 00190300 */  sll        $v1, $v1, 4
    /* 1E7D4 801583CC 23186500 */  subu       $v1, $v1, $a1
    /* 1E7D8 801583D0 80180300 */  sll        $v1, $v1, 2
    /* 1E7DC 801583D4 21186500 */  addu       $v1, $v1, $a1
    /* 1E7E0 801583D8 C0180300 */  sll        $v1, $v1, 3
    /* 1E7E4 801583DC 0E80013C */  lui        $at, %hi(plr + 0x14E)
    /* 1E7E8 801583E0 21082300 */  addu       $at, $at, $v1
    /* 1E7EC 801583E4 86A62680 */  lb         $a2, %lo(plr + 0x14E)($at)
    /* 1E7F0 801583E8 9767000C */  jal        sprintf
    /* 1E7F4 801583EC 21284000 */   addu      $a1, $v0, $zero
    /* 1E7F8 801583F0 05610508 */  j          .L80158414
    /* 1E7FC 801583F4 91000424 */   addiu     $a0, $zero, 0x91
  .L801583F8:
    /* 1E800 801583F8 03001224 */  addiu      $s2, $zero, 0x3
    /* 1E804 801583FC 4AED010C */  jal        GetStr__Fi
    /* 1E808 80158400 85020424 */   addiu     $a0, $zero, 0x285
    /* 1E80C 80158404 21200002 */  addu       $a0, $s0, $zero
    /* 1E810 80158408 9767000C */  jal        sprintf
    /* 1E814 8015840C 21284000 */   addu      $a1, $v0, $zero
    /* 1E818 80158410 91000424 */  addiu      $a0, $zero, 0x91
  .L80158414:
    /* 1E81C 80158414 57010524 */  addiu      $a1, $zero, 0x157
    /* 1E820 80158418 2800B027 */  addiu      $s0, $sp, 0x28
    /* 1E824 8015841C 21300002 */  addu       $a2, $s0, $zero
    /* 1E828 80158420 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E82C 80158424 21384002 */   addu      $a3, $s2, $zero
    /* 1E830 80158428 1280033C */  lui        $v1, %hi(options_pad)
    /* 1E834 8015842C 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 1E838 80158430 00000000 */  nop
    /* 1E83C 80158434 40100300 */  sll        $v0, $v1, 1
    /* 1E840 80158438 21104300 */  addu       $v0, $v0, $v1
    /* 1E844 8015843C 80100200 */  sll        $v0, $v0, 2
    /* 1E848 80158440 21104300 */  addu       $v0, $v0, $v1
    /* 1E84C 80158444 00110200 */  sll        $v0, $v0, 4
    /* 1E850 80158448 23104300 */  subu       $v0, $v0, $v1
    /* 1E854 8015844C 80100200 */  sll        $v0, $v0, 2
    /* 1E858 80158450 21104300 */  addu       $v0, $v0, $v1
    /* 1E85C 80158454 C0100200 */  sll        $v0, $v0, 3
    /* 1E860 80158458 0E80013C */  lui        $at, %hi(plr + 0x14F)
    /* 1E864 8015845C 21082200 */  addu       $at, $at, $v0
    /* 1E868 80158460 87A62280 */  lb         $v0, %lo(plr + 0x14F)($at)
    /* 1E86C 80158464 00000000 */  nop
    /* 1E870 80158468 2B180200 */  sltu       $v1, $zero, $v0
    /* 1E874 8015846C 4B004228 */  slti       $v0, $v0, 0x4B
    /* 1E878 80158470 16004010 */  beqz       $v0, .L801584CC
    /* 1E87C 80158474 21906000 */   addu      $s2, $v1, $zero
    /* 1E880 80158478 4AED010C */  jal        GetStr__Fi
    /* 1E884 8015847C 03050424 */   addiu     $a0, $zero, 0x503
    /* 1E888 80158480 1280053C */  lui        $a1, %hi(options_pad)
    /* 1E88C 80158484 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1E890 80158488 21200002 */  addu       $a0, $s0, $zero
    /* 1E894 8015848C 40180500 */  sll        $v1, $a1, 1
    /* 1E898 80158490 21186500 */  addu       $v1, $v1, $a1
    /* 1E89C 80158494 80180300 */  sll        $v1, $v1, 2
    /* 1E8A0 80158498 21186500 */  addu       $v1, $v1, $a1
    /* 1E8A4 8015849C 00190300 */  sll        $v1, $v1, 4
    /* 1E8A8 801584A0 23186500 */  subu       $v1, $v1, $a1
    /* 1E8AC 801584A4 80180300 */  sll        $v1, $v1, 2
    /* 1E8B0 801584A8 21186500 */  addu       $v1, $v1, $a1
    /* 1E8B4 801584AC C0180300 */  sll        $v1, $v1, 3
    /* 1E8B8 801584B0 0E80013C */  lui        $at, %hi(plr + 0x14F)
    /* 1E8BC 801584B4 21082300 */  addu       $at, $at, $v1
    /* 1E8C0 801584B8 87A62680 */  lb         $a2, %lo(plr + 0x14F)($at)
    /* 1E8C4 801584BC 9767000C */  jal        sprintf
    /* 1E8C8 801584C0 21284000 */   addu      $a1, $v0, $zero
    /* 1E8CC 801584C4 3A610508 */  j          .L801584E8
    /* 1E8D0 801584C8 9E000424 */   addiu     $a0, $zero, 0x9E
  .L801584CC:
    /* 1E8D4 801584CC 03001224 */  addiu      $s2, $zero, 0x3
    /* 1E8D8 801584D0 4AED010C */  jal        GetStr__Fi
    /* 1E8DC 801584D4 85020424 */   addiu     $a0, $zero, 0x285
    /* 1E8E0 801584D8 21200002 */  addu       $a0, $s0, $zero
    /* 1E8E4 801584DC 9767000C */  jal        sprintf
    /* 1E8E8 801584E0 21284000 */   addu      $a1, $v0, $zero
    /* 1E8EC 801584E4 9E000424 */  addiu      $a0, $zero, 0x9E
  .L801584E8:
    /* 1E8F0 801584E8 54020524 */  addiu      $a1, $zero, 0x254
    /* 1E8F4 801584EC 2800B027 */  addiu      $s0, $sp, 0x28
    /* 1E8F8 801584F0 21300002 */  addu       $a2, $s0, $zero
    /* 1E8FC 801584F4 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E900 801584F8 21384002 */   addu      $a3, $s2, $zero
    /* 1E904 801584FC 4AED010C */  jal        GetStr__Fi
    /* 1E908 80158500 FD040424 */   addiu     $a0, $zero, 0x4FD
    /* 1E90C 80158504 1280053C */  lui        $a1, %hi(options_pad)
    /* 1E910 80158508 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 1E914 8015850C 21200002 */  addu       $a0, $s0, $zero
    /* 1E918 80158510 40180500 */  sll        $v1, $a1, 1
    /* 1E91C 80158514 21186500 */  addu       $v1, $v1, $a1
    /* 1E920 80158518 80180300 */  sll        $v1, $v1, 2
    /* 1E924 8015851C 21186500 */  addu       $v1, $v1, $a1
    /* 1E928 80158520 00190300 */  sll        $v1, $v1, 4
    /* 1E92C 80158524 23186500 */  subu       $v1, $v1, $a1
    /* 1E930 80158528 80180300 */  sll        $v1, $v1, 2
    /* 1E934 8015852C 21186500 */  addu       $v1, $v1, $a1
    /* 1E938 80158530 C0180300 */  sll        $v1, $v1, 3
    /* 1E93C 80158534 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 1E940 80158538 21082300 */  addu       $at, $at, $v1
    /* 1E944 8015853C 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 1E948 80158540 9767000C */  jal        sprintf
    /* 1E94C 80158544 21284000 */   addu      $a1, $v0, $zero
    /* 1E950 80158548 AC000424 */  addiu      $a0, $zero, 0xAC
    /* 1E954 8015854C 91010524 */  addiu      $a1, $zero, 0x191
    /* 1E958 80158550 21300002 */  addu       $a2, $s0, $zero
    /* 1E95C 80158554 685E050C */  jal        PrintStat__FiiPcUc
    /* 1E960 80158558 21380000 */   addu      $a3, $zero, $zero
    /* 1E964 8015855C 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1E968 80158560 A087050C */  jal        ___6Dialog_80161e80
    /* 1E96C 80158564 02000524 */   addiu     $a1, $zero, 0x2
    /* 1E970 80158568 4800BF8F */  lw         $ra, 0x48($sp)
    /* 1E974 8015856C 4400B38F */  lw         $s3, 0x44($sp)
    /* 1E978 80158570 4000B28F */  lw         $s2, 0x40($sp)
    /* 1E97C 80158574 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 1E980 80158578 3800B08F */  lw         $s0, 0x38($sp)
    /* 1E984 8015857C 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 1E988 80158580 0800E003 */  jr         $ra
    /* 1E98C 80158584 00000000 */   nop
endlabel DrawInvStats__Fv
