.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartConfirm__Fv, 0x368

glabel S_StartConfirm__Fv
    /* 5D9EC 8006D9EC 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 5D9F0 8006D9F0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5D9F4 8006D9F4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 5D9F8 8006D9F8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5D9FC 8006D9FC 5BBE010C */  jal        StartStore__Fc
    /* 5DA00 8006DA00 1800B0AF */   sw        $s0, 0x18($sp)
    /* 5DA04 8006DA04 05000424 */  addiu      $a0, $zero, 0x5
    /* 5DA08 8006DA08 02000224 */  addiu      $v0, $zero, 0x2
    /* 5DA0C 8006DA0C 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5DA10 8006DA10 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5DA14 8006DA14 36A7010C */  jal        ClearSText__Fii
    /* 5DA18 8006DA18 17000524 */   addiu     $a1, $zero, 0x17
    /* 5DA1C 8006DA1C 1280033C */  lui        $v1, %hi(myplr)
    /* 5DA20 8006DA20 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5DA24 8006DA24 00000000 */  nop
    /* 5DA28 8006DA28 40100300 */  sll        $v0, $v1, 1
    /* 5DA2C 8006DA2C 21104300 */  addu       $v0, $v0, $v1
    /* 5DA30 8006DA30 80100200 */  sll        $v0, $v0, 2
    /* 5DA34 8006DA34 21104300 */  addu       $v0, $v0, $v1
    /* 5DA38 8006DA38 00110200 */  sll        $v0, $v0, 4
    /* 5DA3C 8006DA3C 23104300 */  subu       $v0, $v0, $v1
    /* 5DA40 8006DA40 80100200 */  sll        $v0, $v0, 2
    /* 5DA44 8006DA44 21104300 */  addu       $v0, $v0, $v1
    /* 5DA48 8006DA48 C0300200 */  sll        $a2, $v0, 3
    /* 5DA4C 8006DA4C 0E80013C */  lui        $at, %hi(plr + 0x1961)
    /* 5DA50 8006DA50 21082600 */  addu       $at, $at, $a2
    /* 5DA54 8006DA54 99BE2580 */  lb         $a1, %lo(plr + 0x1961)($at)
    /* 5DA58 8006DA58 00000000 */  nop
    /* 5DA5C 8006DA5C 2B100500 */  sltu       $v0, $zero, $a1
    /* 5DA60 8006DA60 21804000 */  addu       $s0, $v0, $zero
    /* 5DA64 8006DA64 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 5DA68 8006DA68 21082600 */  addu       $at, $at, $a2
    /* 5DA6C 8006DA6C AEBE2280 */  lb         $v0, %lo(plr + 0x1976)($at)
    /* 5DA70 8006DA70 00000000 */  nop
    /* 5DA74 8006DA74 02004014 */  bnez       $v0, .L8006DA80
    /* 5DA78 8006DA78 21180002 */   addu      $v1, $s0, $zero
    /* 5DA7C 8006DA7C 02001024 */  addiu      $s0, $zero, 0x2
  .L8006DA80:
    /* 5DA80 8006DA80 02000224 */  addiu      $v0, $zero, 0x2
    /* 5DA84 8006DA84 0200A214 */  bne        $a1, $v0, .L8006DA90
    /* 5DA88 8006DA88 00000000 */   nop
    /* 5DA8C 8006DA8C 03001024 */  addiu      $s0, $zero, 0x3
  .L8006DA90:
    /* 5DA90 8006DA90 0C21848F */  lw         $a0, %gp_rel(D_8011C88C)($gp)
    /* 5DA94 8006DA94 11000224 */  addiu      $v0, $zero, 0x11
    /* 5DA98 8006DA98 02008214 */  bne        $a0, $v0, .L8006DAA4
    /* 5DA9C 8006DA9C 00000000 */   nop
    /* 5DAA0 8006DAA0 21180000 */  addu       $v1, $zero, $zero
  .L8006DAA4:
    /* 5DAA4 8006DAA4 1500A010 */  beqz       $a1, .L8006DAFC
    /* 5DAA8 8006DAA8 FF006230 */   andi      $v0, $v1, 0xFF
    /* 5DAAC 8006DAAC 0E80013C */  lui        $at, %hi(plr + 0x1979)
    /* 5DAB0 8006DAB0 21082600 */  addu       $at, $at, $a2
    /* 5DAB4 8006DAB4 B1BE2280 */  lb         $v0, %lo(plr + 0x1979)($at)
    /* 5DAB8 8006DAB8 00000000 */  nop
    /* 5DABC 8006DABC 0F004014 */  bnez       $v0, .L8006DAFC
    /* 5DAC0 8006DAC0 FF006230 */   andi      $v0, $v1, 0xFF
    /* 5DAC4 8006DAC4 03000224 */  addiu      $v0, $zero, 0x3
    /* 5DAC8 8006DAC8 02008214 */  bne        $a0, $v0, .L8006DAD4
    /* 5DACC 8006DACC 07000224 */   addiu     $v0, $zero, 0x7
    /* 5DAD0 8006DAD0 21180000 */  addu       $v1, $zero, $zero
  .L8006DAD4:
    /* 5DAD4 8006DAD4 02008214 */  bne        $a0, $v0, .L8006DAE0
    /* 5DAD8 8006DAD8 04000224 */   addiu     $v0, $zero, 0x4
    /* 5DADC 8006DADC 21180000 */  addu       $v1, $zero, $zero
  .L8006DAE0:
    /* 5DAE0 8006DAE0 02008214 */  bne        $a0, $v0, .L8006DAEC
    /* 5DAE4 8006DAE4 08000224 */   addiu     $v0, $zero, 0x8
    /* 5DAE8 8006DAE8 21180000 */  addu       $v1, $zero, $zero
  .L8006DAEC:
    /* 5DAEC 8006DAEC 03008214 */  bne        $a0, $v0, .L8006DAFC
    /* 5DAF0 8006DAF0 FF006230 */   andi      $v0, $v1, 0xFF
    /* 5DAF4 8006DAF4 21180000 */  addu       $v1, $zero, $zero
    /* 5DAF8 8006DAF8 FF006230 */  andi       $v0, $v1, 0xFF
  .L8006DAFC:
    /* 5DAFC 8006DAFC 14004010 */  beqz       $v0, .L8006DB50
    /* 5DB00 8006DB00 00010624 */   addiu     $a2, $zero, 0x100
    /* 5DB04 8006DB04 1280023C */  lui        $v0, %hi(myplr)
    /* 5DB08 8006DB08 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5DB0C 8006DB0C 00000000 */  nop
    /* 5DB10 8006DB10 40200200 */  sll        $a0, $v0, 1
    /* 5DB14 8006DB14 21208200 */  addu       $a0, $a0, $v0
    /* 5DB18 8006DB18 80200400 */  sll        $a0, $a0, 2
    /* 5DB1C 8006DB1C 21208200 */  addu       $a0, $a0, $v0
    /* 5DB20 8006DB20 00210400 */  sll        $a0, $a0, 4
    /* 5DB24 8006DB24 23208200 */  subu       $a0, $a0, $v0
    /* 5DB28 8006DB28 80200400 */  sll        $a0, $a0, 2
    /* 5DB2C 8006DB2C 21208200 */  addu       $a0, $a0, $v0
    /* 5DB30 8006DB30 C0200400 */  sll        $a0, $a0, 3
    /* 5DB34 8006DB34 0E80023C */  lui        $v0, %hi(plr + 0x1910)
    /* 5DB38 8006DB38 48BE4224 */  addiu      $v0, $v0, %lo(plr + 0x1910)
    /* 5DB3C 8006DB3C 0E80013C */  lui        $at, %hi(plr + 0x1938)
    /* 5DB40 8006DB40 21082400 */  addu       $at, $at, $a0
    /* 5DB44 8006DB44 70BE2594 */  lhu        $a1, %lo(plr + 0x1938)($at)
    /* 5DB48 8006DB48 E5B60108 */  j          .L8006DB94
    /* 5DB4C 8006DB4C 00000000 */   nop
  .L8006DB50:
    /* 5DB50 8006DB50 1280023C */  lui        $v0, %hi(myplr)
    /* 5DB54 8006DB54 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5DB58 8006DB58 00000000 */  nop
    /* 5DB5C 8006DB5C 40200200 */  sll        $a0, $v0, 1
    /* 5DB60 8006DB60 21208200 */  addu       $a0, $a0, $v0
    /* 5DB64 8006DB64 80200400 */  sll        $a0, $a0, 2
    /* 5DB68 8006DB68 21208200 */  addu       $a0, $a0, $v0
    /* 5DB6C 8006DB6C 00210400 */  sll        $a0, $a0, 4
    /* 5DB70 8006DB70 23208200 */  subu       $a0, $a0, $v0
    /* 5DB74 8006DB74 80200400 */  sll        $a0, $a0, 2
    /* 5DB78 8006DB78 21208200 */  addu       $a0, $a0, $v0
    /* 5DB7C 8006DB7C C0200400 */  sll        $a0, $a0, 3
    /* 5DB80 8006DB80 0E80023C */  lui        $v0, %hi(plr + 0x1910)
    /* 5DB84 8006DB84 48BE4224 */  addiu      $v0, $v0, %lo(plr + 0x1910)
    /* 5DB88 8006DB88 0E80013C */  lui        $at, %hi(plr + 0x1936)
    /* 5DB8C 8006DB8C 21082400 */  addu       $at, $at, $a0
    /* 5DB90 8006DB90 6EBE2594 */  lhu        $a1, %lo(plr + 0x1936)($at)
  .L8006DB94:
    /* 5DB94 8006DB94 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5DB98 8006DB98 21208200 */   addu      $a0, $a0, $v0
    /* 5DB9C 8006DB9C 21884000 */  addu       $s1, $v0, $zero
    /* 5DBA0 8006DBA0 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5DBA4 8006DBA4 05000524 */  addiu      $a1, $zero, 0x5
    /* 5DBA8 8006DBA8 21300000 */  addu       $a2, $zero, $zero
    /* 5DBAC 8006DBAC 21382002 */  addu       $a3, $s1, $zero
    /* 5DBB0 8006DBB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5DBB4 8006DBB4 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DBB8 8006DBB8 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5DBBC 8006DBBC 1280033C */  lui        $v1, %hi(myplr)
    /* 5DBC0 8006DBC0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5DBC4 8006DBC4 00000000 */  nop
    /* 5DBC8 8006DBC8 40100300 */  sll        $v0, $v1, 1
    /* 5DBCC 8006DBCC 21104300 */  addu       $v0, $v0, $v1
    /* 5DBD0 8006DBD0 80100200 */  sll        $v0, $v0, 2
    /* 5DBD4 8006DBD4 21104300 */  addu       $v0, $v0, $v1
    /* 5DBD8 8006DBD8 00110200 */  sll        $v0, $v0, 4
    /* 5DBDC 8006DBDC 23104300 */  subu       $v0, $v0, $v1
    /* 5DBE0 8006DBE0 80100200 */  sll        $v0, $v0, 2
    /* 5DBE4 8006DBE4 21104300 */  addu       $v0, $v0, $v1
    /* 5DBE8 8006DBE8 C0100200 */  sll        $v0, $v0, 3
    /* 5DBEC 8006DBEC 0E80013C */  lui        $at, %hi(plr + 0x1928)
    /* 5DBF0 8006DBF0 21082200 */  addu       $at, $at, $v0
    /* 5DBF4 8006DBF4 60BE258C */  lw         $a1, %lo(plr + 0x1928)($at)
    /* 5DBF8 8006DBF8 70A7010C */  jal        AddSTextVal__Fii
    /* 5DBFC 8006DBFC 05000424 */   addiu     $a0, $zero, 0x5
    /* 5DC00 8006DC00 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5DC04 8006DC04 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5DC08 8006DC08 1280063C */  lui        $a2, %hi(D_8011C8BC)
    /* 5DC0C 8006DC0C BCC8C624 */  addiu      $a2, $a2, %lo(D_8011C8BC)
    /* 5DC10 8006DC10 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 5DC14 8006DC14 21282002 */   addu      $a1, $s1, $zero
    /* 5DC18 8006DC18 05004524 */  addiu      $a1, $v0, 0x5
    /* 5DC1C 8006DC1C 1280023C */  lui        $v0, %hi(myplr)
    /* 5DC20 8006DC20 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5DC24 8006DC24 21300002 */  addu       $a2, $s0, $zero
    /* 5DC28 8006DC28 40200200 */  sll        $a0, $v0, 1
    /* 5DC2C 8006DC2C 21208200 */  addu       $a0, $a0, $v0
    /* 5DC30 8006DC30 80200400 */  sll        $a0, $a0, 2
    /* 5DC34 8006DC34 21208200 */  addu       $a0, $a0, $v0
    /* 5DC38 8006DC38 00210400 */  sll        $a0, $a0, 4
    /* 5DC3C 8006DC3C 23208200 */  subu       $a0, $a0, $v0
    /* 5DC40 8006DC40 80200400 */  sll        $a0, $a0, 2
    /* 5DC44 8006DC44 21208200 */  addu       $a0, $a0, $v0
    /* 5DC48 8006DC48 C0200400 */  sll        $a0, $a0, 3
    /* 5DC4C 8006DC4C 0E80023C */  lui        $v0, %hi(plr + 0x1910)
    /* 5DC50 8006DC50 48BE4224 */  addiu      $v0, $v0, %lo(plr + 0x1910)
    /* 5DC54 8006DC54 B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5DC58 8006DC58 21208200 */   addu      $a0, $a0, $v0
    /* 5DC5C 8006DC5C 0C21828F */  lw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 5DC60 8006DC60 00000000 */  nop
    /* 5DC64 8006DC64 FEFF4324 */  addiu      $v1, $v0, -0x2
    /* 5DC68 8006DC68 1100622C */  sltiu      $v0, $v1, 0x11
    /* 5DC6C 8006DC6C 18004010 */  beqz       $v0, .L8006DCD0
    /* 5DC70 8006DC70 80100300 */   sll       $v0, $v1, 2
    /* 5DC74 8006DC74 1180013C */  lui        $at, %hi(jtbl_80117980)
    /* 5DC78 8006DC78 21082200 */  addu       $at, $at, $v0
    /* 5DC7C 8006DC7C 8079228C */  lw         $v0, %lo(jtbl_80117980)($at)
    /* 5DC80 8006DC80 00000000 */  nop
    /* 5DC84 8006DC84 08004000 */  jr         $v0
    /* 5DC88 8006DC88 00000000 */   nop
  jlabel .L8006DC8C
    /* 5DC8C 8006DC8C 2EB70108 */  j          .L8006DCB8
    /* 5DC90 8006DC90 21000424 */   addiu     $a0, $zero, 0x21
  jlabel .L8006DC94
    /* 5DC94 8006DC94 2EB70108 */  j          .L8006DCB8
    /* 5DC98 8006DC98 25000424 */   addiu     $a0, $zero, 0x25
  jlabel .L8006DC9C
    /* 5DC9C 8006DC9C 2EB70108 */  j          .L8006DCB8
    /* 5DCA0 8006DCA0 24000424 */   addiu     $a0, $zero, 0x24
  jlabel .L8006DCA4
    /* 5DCA4 8006DCA4 2EB70108 */  j          .L8006DCB8
    /* 5DCA8 8006DCA8 23000424 */   addiu     $a0, $zero, 0x23
  jlabel .L8006DCAC
    /* 5DCAC 8006DCAC 2EB70108 */  j          .L8006DCB8
    /* 5DCB0 8006DCB0 16010424 */   addiu     $a0, $zero, 0x116
  jlabel .L8006DCB4
    /* 5DCB4 8006DCB4 22000424 */  addiu      $a0, $zero, 0x22
  .L8006DCB8:
    /* 5DCB8 8006DCB8 4AED010C */  jal        GetStr__Fi
    /* 5DCBC 8006DCBC 00000000 */   nop
    /* 5DCC0 8006DCC0 0D80043C */  lui        $a0, %hi(tempstr)
    /* 5DCC4 8006DCC4 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 5DCC8 8006DCC8 F240000C */  jal        strcpy
    /* 5DCCC 8006DCCC 21284000 */   addu      $a1, $v0, $zero
  jlabel .L8006DCD0
    /* 5DCD0 8006DCD0 21200000 */  addu       $a0, $zero, $zero
    /* 5DCD4 8006DCD4 0E000524 */  addiu      $a1, $zero, 0xE
    /* 5DCD8 8006DCD8 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DCDC 8006DCDC 0D80073C */  lui        $a3, %hi(tempstr)
    /* 5DCE0 8006DCE0 10EAE724 */  addiu      $a3, $a3, %lo(tempstr)
    /* 5DCE4 8006DCE4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DCE8 8006DCE8 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DCEC 8006DCEC 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5DCF0 8006DCF0 4AED010C */  jal        GetStr__Fi
    /* 5DCF4 8006DCF4 E7040424 */   addiu     $a0, $zero, 0x4E7
    /* 5DCF8 8006DCF8 21200000 */  addu       $a0, $zero, $zero
    /* 5DCFC 8006DCFC 11000524 */  addiu      $a1, $zero, 0x11
    /* 5DD00 8006DD00 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DD04 8006DD04 21384000 */  addu       $a3, $v0, $zero
    /* 5DD08 8006DD08 01001024 */  addiu      $s0, $zero, 0x1
    /* 5DD0C 8006DD0C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DD10 8006DD10 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DD14 8006DD14 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5DD18 8006DD18 4AED010C */  jal        GetStr__Fi
    /* 5DD1C 8006DD1C C9020424 */   addiu     $a0, $zero, 0x2C9
    /* 5DD20 8006DD20 21200000 */  addu       $a0, $zero, $zero
    /* 5DD24 8006DD24 12000524 */  addiu      $a1, $zero, 0x12
    /* 5DD28 8006DD28 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DD2C 8006DD2C 21384000 */  addu       $a3, $v0, $zero
    /* 5DD30 8006DD30 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5DD34 8006DD34 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DD38 8006DD38 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5DD3C 8006DD3C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 5DD40 8006DD40 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5DD44 8006DD44 1800B08F */  lw         $s0, 0x18($sp)
    /* 5DD48 8006DD48 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 5DD4C 8006DD4C 0800E003 */  jr         $ra
    /* 5DD50 8006DD50 00000000 */   nop
endlabel S_StartConfirm__Fv
