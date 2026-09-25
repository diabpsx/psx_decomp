.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateObject__FiiUc, 0x438

glabel OperateObject__FiiUc
    /* 4DA30 8005DA30 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4DA34 8005DA34 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4DA38 8005DA38 21888000 */  addu       $s1, $a0, $zero
    /* 4DA3C 8005DA3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4DA40 8005DA40 2180A000 */  addu       $s0, $a1, $zero
    /* 4DA44 8005DA44 40101000 */  sll        $v0, $s0, 1
    /* 4DA48 8005DA48 21105000 */  addu       $v0, $v0, $s0
    /* 4DA4C 8005DA4C 80100200 */  sll        $v0, $v0, 2
    /* 4DA50 8005DA50 23105000 */  subu       $v0, $v0, $s0
    /* 4DA54 8005DA54 1280033C */  lui        $v1, %hi(deltaload)
    /* 4DA58 8005DA58 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 4DA5C 8005DA5C 80100200 */  sll        $v0, $v0, 2
    /* 4DA60 8005DA60 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 4DA64 8005DA64 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4DA68 8005DA68 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DA6C 8005DA6C 21082200 */  addu       $at, $at, $v0
    /* 4DA70 8005DA70 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* 4DA74 8005DA74 00000000 */  nop
    /* 4DA78 8005DA78 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4DA7C 8005DA7C 00160200 */  sll        $v0, $v0, 24
    /* 4DA80 8005DA80 03260200 */  sra        $a0, $v0, 24
    /* 4DA84 8005DA84 6100822C */  sltiu      $v0, $a0, 0x61
    /* 4DA88 8005DA88 F0004010 */  beqz       $v0, .L8005DE4C
    /* 4DA8C 8005DA8C 0100632C */   sltiu     $v1, $v1, 0x1
    /* 4DA90 8005DA90 80100400 */  sll        $v0, $a0, 2
    /* 4DA94 8005DA94 1180013C */  lui        $at, %hi(jtbl_80116FD0)
    /* 4DA98 8005DA98 21082200 */  addu       $at, $at, $v0
    /* 4DA9C 8005DA9C D06F228C */  lw         $v0, %lo(jtbl_80116FD0)($at)
    /* 4DAA0 8005DAA0 00000000 */  nop
    /* 4DAA4 8005DAA4 08004000 */  jr         $v0
    /* 4DAA8 8005DAA8 00000000 */   nop
  jlabel .L8005DAAC
    /* 4DAAC 8005DAAC FF00C230 */  andi       $v0, $a2, 0xFF
    /* 4DAB0 8005DAB0 1A004010 */  beqz       $v0, .L8005DB1C
    /* 4DAB4 8005DAB4 40101000 */   sll       $v0, $s0, 1
    /* 4DAB8 8005DAB8 21105000 */  addu       $v0, $v0, $s0
    /* 4DABC 8005DABC 80100200 */  sll        $v0, $v0, 2
    /* 4DAC0 8005DAC0 23105000 */  subu       $v0, $v0, $s0
    /* 4DAC4 8005DAC4 80900200 */  sll        $s2, $v0, 2
    /* 4DAC8 8005DAC8 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DACC 8005DACC 21083200 */  addu       $at, $at, $s2
    /* 4DAD0 8005DAD0 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DAD4 8005DAD4 01000224 */  addiu      $v0, $zero, 0x1
    /* 4DAD8 8005DAD8 09006214 */  bne        $v1, $v0, .L8005DB00
    /* 4DADC 8005DADC 02000224 */   addiu     $v0, $zero, 0x2
    /* 4DAE0 8005DAE0 21202002 */  addu       $a0, $s1, $zero
    /* 4DAE4 8005DAE4 21280002 */  addu       $a1, $s0, $zero
    /* 4DAE8 8005DAE8 0958010C */  jal        OperateL1LDoor__FiiUc
    /* 4DAEC 8005DAEC 01000624 */   addiu     $a2, $zero, 0x1
    /* 4DAF0 8005DAF0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DAF4 8005DAF4 21083200 */  addu       $at, $at, $s2
    /* 4DAF8 8005DAF8 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DAFC 8005DAFC 02000224 */  addiu      $v0, $zero, 0x2
  .L8005DB00:
    /* 4DB00 8005DB00 D2006214 */  bne        $v1, $v0, .L8005DE4C
    /* 4DB04 8005DB04 21202002 */   addu      $a0, $s1, $zero
    /* 4DB08 8005DB08 21280002 */  addu       $a1, $s0, $zero
    /* 4DB0C 8005DB0C 3157010C */  jal        OperateL1RDoor__FiiUc
    /* 4DB10 8005DB10 01000624 */   addiu     $a2, $zero, 0x1
    /* 4DB14 8005DB14 93770108 */  j          .L8005DE4C
    /* 4DB18 8005DB18 00000000 */   nop
  .L8005DB1C:
    /* 4DB1C 8005DB1C 1280023C */  lui        $v0, %hi(myplr)
    /* 4DB20 8005DB20 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4DB24 8005DB24 00000000 */  nop
    /* 4DB28 8005DB28 C8002216 */  bne        $s1, $v0, .L8005DE4C
    /* 4DB2C 8005DB2C 21202002 */   addu      $a0, $s1, $zero
    /* 4DB30 8005DB30 21280002 */  addu       $a1, $s0, $zero
    /* 4DB34 8005DB34 BC5E010C */  jal        OperateL1Door__FiiUc
    /* 4DB38 8005DB38 21306000 */   addu      $a2, $v1, $zero
    /* 4DB3C 8005DB3C 93770108 */  j          .L8005DE4C
    /* 4DB40 8005DB40 00000000 */   nop
  jlabel .L8005DB44
    /* 4DB44 8005DB44 FF00C230 */  andi       $v0, $a2, 0xFF
    /* 4DB48 8005DB48 1A004010 */  beqz       $v0, .L8005DBB4
    /* 4DB4C 8005DB4C 40101000 */   sll       $v0, $s0, 1
    /* 4DB50 8005DB50 21105000 */  addu       $v0, $v0, $s0
    /* 4DB54 8005DB54 80100200 */  sll        $v0, $v0, 2
    /* 4DB58 8005DB58 23105000 */  subu       $v0, $v0, $s0
    /* 4DB5C 8005DB5C 80900200 */  sll        $s2, $v0, 2
    /* 4DB60 8005DB60 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DB64 8005DB64 21083200 */  addu       $at, $at, $s2
    /* 4DB68 8005DB68 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DB6C 8005DB6C 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 4DB70 8005DB70 09006214 */  bne        $v1, $v0, .L8005DB98
    /* 4DB74 8005DB74 2B000224 */   addiu     $v0, $zero, 0x2B
    /* 4DB78 8005DB78 21202002 */  addu       $a0, $s1, $zero
    /* 4DB7C 8005DB7C 21280002 */  addu       $a1, $s0, $zero
    /* 4DB80 8005DB80 CA59010C */  jal        OperateL2LDoor__FiiUc
    /* 4DB84 8005DB84 01000624 */   addiu     $a2, $zero, 0x1
    /* 4DB88 8005DB88 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DB8C 8005DB8C 21083200 */  addu       $at, $at, $s2
    /* 4DB90 8005DB90 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DB94 8005DB94 2B000224 */  addiu      $v0, $zero, 0x2B
  .L8005DB98:
    /* 4DB98 8005DB98 AC006214 */  bne        $v1, $v0, .L8005DE4C
    /* 4DB9C 8005DB9C 21202002 */   addu      $a0, $s1, $zero
    /* 4DBA0 8005DBA0 21280002 */  addu       $a1, $s0, $zero
    /* 4DBA4 8005DBA4 EF58010C */  jal        OperateL2RDoor__FiiUc
    /* 4DBA8 8005DBA8 01000624 */   addiu     $a2, $zero, 0x1
    /* 4DBAC 8005DBAC 93770108 */  j          .L8005DE4C
    /* 4DBB0 8005DBB0 00000000 */   nop
  .L8005DBB4:
    /* 4DBB4 8005DBB4 1280023C */  lui        $v0, %hi(myplr)
    /* 4DBB8 8005DBB8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4DBBC 8005DBBC 00000000 */  nop
    /* 4DBC0 8005DBC0 A2002216 */  bne        $s1, $v0, .L8005DE4C
    /* 4DBC4 8005DBC4 21202002 */   addu      $a0, $s1, $zero
    /* 4DBC8 8005DBC8 21280002 */  addu       $a1, $s0, $zero
    /* 4DBCC 8005DBCC 5566010C */  jal        OperateL2Door__FiiUc
    /* 4DBD0 8005DBD0 21306000 */   addu      $a2, $v1, $zero
    /* 4DBD4 8005DBD4 93770108 */  j          .L8005DE4C
    /* 4DBD8 8005DBD8 00000000 */   nop
  jlabel .L8005DBDC
    /* 4DBDC 8005DBDC FF00C230 */  andi       $v0, $a2, 0xFF
    /* 4DBE0 8005DBE0 1A004010 */  beqz       $v0, .L8005DC4C
    /* 4DBE4 8005DBE4 40101000 */   sll       $v0, $s0, 1
    /* 4DBE8 8005DBE8 21105000 */  addu       $v0, $v0, $s0
    /* 4DBEC 8005DBEC 80100200 */  sll        $v0, $v0, 2
    /* 4DBF0 8005DBF0 23105000 */  subu       $v0, $v0, $s0
    /* 4DBF4 8005DBF4 80900200 */  sll        $s2, $v0, 2
    /* 4DBF8 8005DBF8 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DBFC 8005DBFC 21083200 */  addu       $at, $at, $s2
    /* 4DC00 8005DC00 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DC04 8005DC04 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 4DC08 8005DC08 09006214 */  bne        $v1, $v0, .L8005DC30
    /* 4DC0C 8005DC0C 4B000224 */   addiu     $v0, $zero, 0x4B
    /* 4DC10 8005DC10 21202002 */  addu       $a0, $s1, $zero
    /* 4DC14 8005DC14 21280002 */  addu       $a1, $s0, $zero
    /* 4DC18 8005DC18 5C5B010C */  jal        OperateL3LDoor__FiiUc
    /* 4DC1C 8005DC1C 01000624 */   addiu     $a2, $zero, 0x1
    /* 4DC20 8005DC20 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DC24 8005DC24 21083200 */  addu       $at, $at, $s2
    /* 4DC28 8005DC28 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DC2C 8005DC2C 4B000224 */  addiu      $v0, $zero, 0x4B
  .L8005DC30:
    /* 4DC30 8005DC30 86006214 */  bne        $v1, $v0, .L8005DE4C
    /* 4DC34 8005DC34 21202002 */   addu      $a0, $s1, $zero
    /* 4DC38 8005DC38 21280002 */  addu       $a1, $s0, $zero
    /* 4DC3C 8005DC3C A55A010C */  jal        OperateL3RDoor__FiiUc
    /* 4DC40 8005DC40 01000624 */   addiu     $a2, $zero, 0x1
    /* 4DC44 8005DC44 93770108 */  j          .L8005DE4C
    /* 4DC48 8005DC48 00000000 */   nop
  .L8005DC4C:
    /* 4DC4C 8005DC4C 1280023C */  lui        $v0, %hi(myplr)
    /* 4DC50 8005DC50 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4DC54 8005DC54 00000000 */  nop
    /* 4DC58 8005DC58 7C002216 */  bne        $s1, $v0, .L8005DE4C
    /* 4DC5C 8005DC5C 21202002 */   addu      $a0, $s1, $zero
    /* 4DC60 8005DC60 21280002 */  addu       $a1, $s0, $zero
    /* 4DC64 8005DC64 AC66010C */  jal        OperateL3Door__FiiUc
    /* 4DC68 8005DC68 21306000 */   addu      $a2, $v1, $zero
    /* 4DC6C 8005DC6C 93770108 */  j          .L8005DE4C
    /* 4DC70 8005DC70 00000000 */   nop
  jlabel .L8005DC74
    /* 4DC74 8005DC74 21202002 */  addu       $a0, $s1, $zero
    /* 4DC78 8005DC78 135F010C */  jal        OperateLever__Fii
    /* 4DC7C 8005DC7C 21280002 */   addu      $a1, $s0, $zero
    /* 4DC80 8005DC80 93770108 */  j          .L8005DE4C
    /* 4DC84 8005DC84 00000000 */   nop
  jlabel .L8005DC88
    /* 4DC88 8005DC88 21202002 */  addu       $a0, $s1, $zero
    /* 4DC8C 8005DC8C 8C5F010C */  jal        OperateBook__Fii
    /* 4DC90 8005DC90 21280002 */   addu      $a1, $s0, $zero
    /* 4DC94 8005DC94 93770108 */  j          .L8005DE4C
    /* 4DC98 8005DC98 00000000 */   nop
  jlabel .L8005DC9C
    /* 4DC9C 8005DC9C 21202002 */  addu       $a0, $s1, $zero
    /* 4DCA0 8005DCA0 6562010C */  jal        OperateSChambBk__Fii
    /* 4DCA4 8005DCA4 21280002 */   addu      $a1, $s0, $zero
    /* 4DCA8 8005DCA8 93770108 */  j          .L8005DE4C
    /* 4DCAC 8005DCAC 00000000 */   nop
  jlabel .L8005DCB0
    /* 4DCB0 8005DCB0 21202002 */  addu       $a0, $s1, $zero
    /* 4DCB4 8005DCB4 21280002 */  addu       $a1, $s0, $zero
    /* 4DCB8 8005DCB8 F462010C */  jal        OperateChest__FiiUc
    /* 4DCBC 8005DCBC 21306000 */   addu      $a2, $v1, $zero
    /* 4DCC0 8005DCC0 93770108 */  j          .L8005DE4C
    /* 4DCC4 8005DCC4 00000000 */   nop
  jlabel .L8005DCC8
    /* 4DCC8 8005DCC8 21202002 */  addu       $a0, $s1, $zero
    /* 4DCCC 8005DCCC 21280002 */  addu       $a1, $s0, $zero
    /* 4DCD0 8005DCD0 E765010C */  jal        OperateSarc__FiiUc
    /* 4DCD4 8005DCD4 21306000 */   addu      $a2, $v1, $zero
    /* 4DCD8 8005DCD8 93770108 */  j          .L8005DE4C
    /* 4DCDC 8005DCDC 00000000 */   nop
  jlabel .L8005DCE0
    /* 4DCE0 8005DCE0 7365010C */  jal        OperateTrapLvr__Fi
    /* 4DCE4 8005DCE4 21200002 */   addu      $a0, $s0, $zero
    /* 4DCE8 8005DCE8 93770108 */  j          .L8005DE4C
    /* 4DCEC 8005DCEC 00000000 */   nop
  jlabel .L8005DCF0
    /* 4DCF0 8005DCF0 21202002 */  addu       $a0, $s1, $zero
    /* 4DCF4 8005DCF4 3F61010C */  jal        OperateBookLever__Fii
    /* 4DCF8 8005DCF8 21280002 */   addu      $a1, $s0, $zero
    /* 4DCFC 8005DCFC 93770108 */  j          .L8005DE4C
    /* 4DD00 8005DD00 00000000 */   nop
  jlabel .L8005DD04
    /* 4DD04 8005DD04 21202002 */  addu       $a0, $s1, $zero
    /* 4DD08 8005DD08 21280002 */  addu       $a1, $s0, $zero
    /* 4DD0C 8005DD0C 1E69010C */  jal        OperateShrine__Fiii
    /* 4DD10 8005DD10 2C000624 */   addiu     $a2, $zero, 0x2C
    /* 4DD14 8005DD14 93770108 */  j          .L8005DE4C
    /* 4DD18 8005DD18 00000000 */   nop
  jlabel .L8005DD1C
    /* 4DD1C 8005DD1C 21202002 */  addu       $a0, $s1, $zero
    /* 4DD20 8005DD20 21280002 */  addu       $a1, $s0, $zero
    /* 4DD24 8005DD24 1472010C */  jal        OperateSkelBook__FiiUc
    /* 4DD28 8005DD28 21306000 */   addu      $a2, $v1, $zero
    /* 4DD2C 8005DD2C 93770108 */  j          .L8005DE4C
    /* 4DD30 8005DD30 00000000 */   nop
  jlabel .L8005DD34
    /* 4DD34 8005DD34 21202002 */  addu       $a0, $s1, $zero
    /* 4DD38 8005DD38 21280002 */  addu       $a1, $s0, $zero
    /* 4DD3C 8005DD3C 7272010C */  jal        OperateBookCase__FiiUc
    /* 4DD40 8005DD40 21306000 */   addu      $a2, $v1, $zero
    /* 4DD44 8005DD44 93770108 */  j          .L8005DE4C
    /* 4DD48 8005DD48 00000000 */   nop
  jlabel .L8005DD4C
    /* 4DD4C 8005DD4C 21202002 */  addu       $a0, $s1, $zero
    /* 4DD50 8005DD50 21280002 */  addu       $a1, $s0, $zero
    /* 4DD54 8005DD54 F872010C */  jal        OperateDecap__FiiUc
    /* 4DD58 8005DD58 21306000 */   addu      $a2, $v1, $zero
    /* 4DD5C 8005DD5C 93770108 */  j          .L8005DE4C
    /* 4DD60 8005DD60 00000000 */   nop
  jlabel .L8005DD64
    /* 4DD64 8005DD64 21202002 */  addu       $a0, $s1, $zero
    /* 4DD68 8005DD68 21280002 */  addu       $a1, $s0, $zero
    /* 4DD6C 8005DD6C 3273010C */  jal        OperateArmorStand__FiiUc
    /* 4DD70 8005DD70 21306000 */   addu      $a2, $v1, $zero
    /* 4DD74 8005DD74 93770108 */  j          .L8005DE4C
    /* 4DD78 8005DD78 00000000 */   nop
  jlabel .L8005DD7C
    /* 4DD7C 8005DD7C 21202002 */  addu       $a0, $s1, $zero
    /* 4DD80 8005DD80 21280002 */  addu       $a1, $s0, $zero
    /* 4DD84 8005DD84 C873010C */  jal        OperateGoatShrine__Fiii
    /* 4DD88 8005DD88 5D000624 */   addiu     $a2, $zero, 0x5D
    /* 4DD8C 8005DD8C 93770108 */  j          .L8005DE4C
    /* 4DD90 8005DD90 00000000 */   nop
  jlabel .L8005DD94
    /* 4DD94 8005DD94 21202002 */  addu       $a0, $s1, $zero
    /* 4DD98 8005DD98 21280002 */  addu       $a1, $s0, $zero
    /* 4DD9C 8005DD9C F273010C */  jal        OperateCauldron__Fiii
    /* 4DDA0 8005DDA0 4C000624 */   addiu     $a2, $zero, 0x4C
    /* 4DDA4 8005DDA4 93770108 */  j          .L8005DE4C
    /* 4DDA8 8005DDA8 00000000 */   nop
  jlabel .L8005DDAC
    /* 4DDAC 8005DDAC 21202002 */  addu       $a0, $s1, $zero
    /* 4DDB0 8005DDB0 1B74010C */  jal        OperateFountains__Fii
    /* 4DDB4 8005DDB4 21280002 */   addu      $a1, $s0, $zero
    /* 4DDB8 8005DDB8 93770108 */  j          .L8005DE4C
    /* 4DDBC 8005DDBC 00000000 */   nop
  jlabel .L8005DDC0
    /* 4DDC0 8005DDC0 21202002 */  addu       $a0, $s1, $zero
    /* 4DDC4 8005DDC4 EE75010C */  jal        OperateStoryBook__Fii
    /* 4DDC8 8005DDC8 21280002 */   addu      $a1, $s0, $zero
    /* 4DDCC 8005DDCC 93770108 */  j          .L8005DE4C
    /* 4DDD0 8005DDD0 00000000 */   nop
  jlabel .L8005DDD4
    /* 4DDD4 8005DDD4 21202002 */  addu       $a0, $s1, $zero
    /* 4DDD8 8005DDD8 4567010C */  jal        OperatePedistal__Fii
    /* 4DDDC 8005DDDC 21280002 */   addu      $a1, $s0, $zero
    /* 4DDE0 8005DDE0 93770108 */  j          .L8005DE4C
    /* 4DDE4 8005DDE4 00000000 */   nop
  jlabel .L8005DDE8
    /* 4DDE8 8005DDE8 21202002 */  addu       $a0, $s1, $zero
    /* 4DDEC 8005DDEC 21280002 */  addu       $a1, $s0, $zero
    /* 4DDF0 8005DDF0 8475010C */  jal        OperateWeaponRack__FiiUc
    /* 4DDF4 8005DDF4 21306000 */   addu      $a2, $v1, $zero
    /* 4DDF8 8005DDF8 93770108 */  j          .L8005DE4C
    /* 4DDFC 8005DDFC 00000000 */   nop
  jlabel .L8005DE00
    /* 4DE00 8005DE00 21202002 */  addu       $a0, $s1, $zero
    /* 4DE04 8005DE04 E463010C */  jal        OperateMushPatch__Fii
    /* 4DE08 8005DE08 21280002 */   addu      $a1, $s0, $zero
    /* 4DE0C 8005DE0C 93770108 */  j          .L8005DE4C
    /* 4DE10 8005DE10 00000000 */   nop
  jlabel .L8005DE14
    /* 4DE14 8005DE14 21202002 */  addu       $a0, $s1, $zero
    /* 4DE18 8005DE18 2B76010C */  jal        OperateLazStand__Fii
    /* 4DE1C 8005DE1C 21280002 */   addu      $a1, $s0, $zero
    /* 4DE20 8005DE20 93770108 */  j          .L8005DE4C
    /* 4DE24 8005DE24 00000000 */   nop
  jlabel .L8005DE28
    /* 4DE28 8005DE28 21202002 */  addu       $a0, $s1, $zero
    /* 4DE2C 8005DE2C 21280002 */  addu       $a1, $s0, $zero
    /* 4DE30 8005DE30 DF64010C */  jal        OperateSlainHero__FiiUc
    /* 4DE34 8005DE34 21306000 */   addu      $a2, $v1, $zero
    /* 4DE38 8005DE38 93770108 */  j          .L8005DE4C
    /* 4DE3C 8005DE3C 00000000 */   nop
  jlabel .L8005DE40
    /* 4DE40 8005DE40 21202002 */  addu       $a0, $s1, $zero
    /* 4DE44 8005DE44 6964010C */  jal        OperateInnSignChest__Fii
    /* 4DE48 8005DE48 21280002 */   addu      $a1, $s0, $zero
  jlabel .L8005DE4C
    /* 4DE4C 8005DE4C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 4DE50 8005DE50 1800B28F */  lw         $s2, 0x18($sp)
    /* 4DE54 8005DE54 1400B18F */  lw         $s1, 0x14($sp)
    /* 4DE58 8005DE58 1000B08F */  lw         $s0, 0x10($sp)
    /* 4DE5C 8005DE5C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4DE60 8005DE60 0800E003 */  jr         $ra
    /* 4DE64 8005DE64 00000000 */   nop
endlabel OperateObject__FiiUc
