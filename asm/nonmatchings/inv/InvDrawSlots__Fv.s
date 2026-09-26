.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InvDrawSlots__Fv, 0x318

glabel InvDrawSlots__Fv
    /* 1DA90 80157688 901B828F */  lw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DA94 8015768C 941B838F */  lw         $v1, %gp_rel(CursGlowDx)($gp)
    /* 1DA98 80157690 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1DA9C 80157694 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1DAA0 80157698 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1DAA4 8015769C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1DAA8 801576A0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1DAAC 801576A4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1DAB0 801576A8 21104300 */  addu       $v0, $v0, $v1
    /* 1DAB4 801576AC 901B82AF */  sw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DAB8 801576B0 03004018 */  blez       $v0, .L801576C0
    /* 1DABC 801576B4 F8FF0224 */   addiu     $v0, $zero, -0x8
    /* 1DAC0 801576B8 901B80AF */  sw         $zero, %gp_rel(CursGlow)($gp)
    /* 1DAC4 801576BC 941B82AF */  sw         $v0, %gp_rel(CursGlowDx)($gp)
  .L801576C0:
    /* 1DAC8 801576C0 901B828F */  lw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DACC 801576C4 00000000 */  nop
    /* 1DAD0 801576C8 81FF4228 */  slti       $v0, $v0, -0x7F
    /* 1DAD4 801576CC 04004010 */  beqz       $v0, .L801576E0
    /* 1DAD8 801576D0 81FF0224 */   addiu     $v0, $zero, -0x7F
    /* 1DADC 801576D4 901B82AF */  sw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DAE0 801576D8 08000224 */  addiu      $v0, $zero, 0x8
    /* 1DAE4 801576DC 941B82AF */  sw         $v0, %gp_rel(CursGlowDx)($gp)
  .L801576E0:
    /* 1DAE8 801576E0 5C000624 */  addiu      $a2, $zero, 0x5C
    /* 1DAEC 801576E4 C8001224 */  addiu      $s2, $zero, 0xC8
    /* 1DAF0 801576E8 19001324 */  addiu      $s3, $zero, 0x19
    /* 1DAF4 801576EC 1180103C */  lui        $s0, %hi(InvRect)
    /* 1DAF8 801576F0 30D0108E */  lw         $s0, %lo(InvRect)($s0)
    /* 1DAFC 801576F4 1180113C */  lui        $s1, %hi(InvRect + 0x4)
    /* 1DB00 801576F8 34D0318E */  lw         $s1, %lo(InvRect + 0x4)($s1)
    /* 1DB04 801576FC 21200002 */  addu       $a0, $s0, $zero
    /* 1DB08 80157700 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DB0C 80157704 21282002 */   addu      $a1, $s1, $zero
    /* 1DB10 80157708 21200002 */  addu       $a0, $s0, $zero
    /* 1DB14 8015770C 21282002 */  addu       $a1, $s1, $zero
    /* 1DB18 80157710 20000624 */  addiu      $a2, $zero, 0x20
    /* 1DB1C 80157714 1180023C */  lui        $v0, %hi(InvSlotTable)
    /* 1DB20 80157718 80D64290 */  lbu        $v0, %lo(InvSlotTable)($v0)
    /* 1DB24 8015771C 20000724 */  addiu      $a3, $zero, 0x20
    /* 1DB28 80157720 C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DB2C 80157724 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DB30 80157728 5B000624 */  addiu      $a2, $zero, 0x5B
    /* 1DB34 8015772C 1180103C */  lui        $s0, %hi(InvRect + 0x20)
    /* 1DB38 80157730 50D0108E */  lw         $s0, %lo(InvRect + 0x20)($s0)
    /* 1DB3C 80157734 1180113C */  lui        $s1, %hi(InvRect + 0x24)
    /* 1DB40 80157738 54D0318E */  lw         $s1, %lo(InvRect + 0x24)($s1)
    /* 1DB44 8015773C 21200002 */  addu       $a0, $s0, $zero
    /* 1DB48 80157740 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DB4C 80157744 21282002 */   addu      $a1, $s1, $zero
    /* 1DB50 80157748 21200002 */  addu       $a0, $s0, $zero
    /* 1DB54 8015774C 21282002 */  addu       $a1, $s1, $zero
    /* 1DB58 80157750 10000624 */  addiu      $a2, $zero, 0x10
    /* 1DB5C 80157754 1180023C */  lui        $v0, %hi(InvSlotTable + 0x4)
    /* 1DB60 80157758 84D64290 */  lbu        $v0, %lo(InvSlotTable + 0x4)($v0)
    /* 1DB64 8015775C 10000724 */  addiu      $a3, $zero, 0x10
    /* 1DB68 80157760 C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DB6C 80157764 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DB70 80157768 5B000624 */  addiu      $a2, $zero, 0x5B
    /* 1DB74 8015776C 1180103C */  lui        $s0, %hi(InvRect + 0x28)
    /* 1DB78 80157770 58D0108E */  lw         $s0, %lo(InvRect + 0x28)($s0)
    /* 1DB7C 80157774 1180113C */  lui        $s1, %hi(InvRect + 0x2C)
    /* 1DB80 80157778 5CD0318E */  lw         $s1, %lo(InvRect + 0x2C)($s1)
    /* 1DB84 8015777C 21200002 */  addu       $a0, $s0, $zero
    /* 1DB88 80157780 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DB8C 80157784 21282002 */   addu      $a1, $s1, $zero
    /* 1DB90 80157788 21200002 */  addu       $a0, $s0, $zero
    /* 1DB94 8015778C 21282002 */  addu       $a1, $s1, $zero
    /* 1DB98 80157790 10000624 */  addiu      $a2, $zero, 0x10
    /* 1DB9C 80157794 1180023C */  lui        $v0, %hi(InvSlotTable + 0x5)
    /* 1DBA0 80157798 85D64290 */  lbu        $v0, %lo(InvSlotTable + 0x5)($v0)
    /* 1DBA4 8015779C 10000724 */  addiu      $a3, $zero, 0x10
    /* 1DBA8 801577A0 C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DBAC 801577A4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DBB0 801577A8 5B000624 */  addiu      $a2, $zero, 0x5B
    /* 1DBB4 801577AC 1180103C */  lui        $s0, %hi(InvRect + 0x30)
    /* 1DBB8 801577B0 60D0108E */  lw         $s0, %lo(InvRect + 0x30)($s0)
    /* 1DBBC 801577B4 1180113C */  lui        $s1, %hi(InvRect + 0x34)
    /* 1DBC0 801577B8 64D0318E */  lw         $s1, %lo(InvRect + 0x34)($s1)
    /* 1DBC4 801577BC 21200002 */  addu       $a0, $s0, $zero
    /* 1DBC8 801577C0 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DBCC 801577C4 21282002 */   addu      $a1, $s1, $zero
    /* 1DBD0 801577C8 21200002 */  addu       $a0, $s0, $zero
    /* 1DBD4 801577CC 21282002 */  addu       $a1, $s1, $zero
    /* 1DBD8 801577D0 10000624 */  addiu      $a2, $zero, 0x10
    /* 1DBDC 801577D4 1180023C */  lui        $v0, %hi(InvSlotTable + 0x6)
    /* 1DBE0 801577D8 86D64290 */  lbu        $v0, %lo(InvSlotTable + 0x6)($v0)
    /* 1DBE4 801577DC 10000724 */  addiu      $a3, $zero, 0x10
    /* 1DBE8 801577E0 C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DBEC 801577E4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DBF0 801577E8 5D000624 */  addiu      $a2, $zero, 0x5D
    /* 1DBF4 801577EC 1180103C */  lui        $s0, %hi(InvRect + 0x38)
    /* 1DBF8 801577F0 68D0108E */  lw         $s0, %lo(InvRect + 0x38)($s0)
    /* 1DBFC 801577F4 1180113C */  lui        $s1, %hi(InvRect + 0x3C)
    /* 1DC00 801577F8 6CD0318E */  lw         $s1, %lo(InvRect + 0x3C)($s1)
    /* 1DC04 801577FC 21200002 */  addu       $a0, $s0, $zero
    /* 1DC08 80157800 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DC0C 80157804 21282002 */   addu      $a1, $s1, $zero
    /* 1DC10 80157808 21200002 */  addu       $a0, $s0, $zero
    /* 1DC14 8015780C 21282002 */  addu       $a1, $s1, $zero
    /* 1DC18 80157810 20000624 */  addiu      $a2, $zero, 0x20
    /* 1DC1C 80157814 1180023C */  lui        $v0, %hi(InvSlotTable + 0x7)
    /* 1DC20 80157818 87D64290 */  lbu        $v0, %lo(InvSlotTable + 0x7)($v0)
    /* 1DC24 8015781C 30000724 */  addiu      $a3, $zero, 0x30
    /* 1DC28 80157820 C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DC2C 80157824 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DC30 80157828 5D000624 */  addiu      $a2, $zero, 0x5D
    /* 1DC34 8015782C 1180103C */  lui        $s0, %hi(InvRect + 0x68)
    /* 1DC38 80157830 98D0108E */  lw         $s0, %lo(InvRect + 0x68)($s0)
    /* 1DC3C 80157834 1180113C */  lui        $s1, %hi(InvRect + 0x6C)
    /* 1DC40 80157838 9CD0318E */  lw         $s1, %lo(InvRect + 0x6C)($s1)
    /* 1DC44 8015783C 21200002 */  addu       $a0, $s0, $zero
    /* 1DC48 80157840 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DC4C 80157844 21282002 */   addu      $a1, $s1, $zero
    /* 1DC50 80157848 21200002 */  addu       $a0, $s0, $zero
    /* 1DC54 8015784C 21282002 */  addu       $a1, $s1, $zero
    /* 1DC58 80157850 20000624 */  addiu      $a2, $zero, 0x20
    /* 1DC5C 80157854 1180023C */  lui        $v0, %hi(InvSlotTable + 0xD)
    /* 1DC60 80157858 8DD64290 */  lbu        $v0, %lo(InvSlotTable + 0xD)($v0)
    /* 1DC64 8015785C 30000724 */  addiu      $a3, $zero, 0x30
    /* 1DC68 80157860 C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DC6C 80157864 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DC70 80157868 5D000624 */  addiu      $a2, $zero, 0x5D
    /* 1DC74 8015786C 1180103C */  lui        $s0, %hi(InvRect + 0x98)
    /* 1DC78 80157870 C8D0108E */  lw         $s0, %lo(InvRect + 0x98)($s0)
    /* 1DC7C 80157874 1180113C */  lui        $s1, %hi(InvRect + 0x9C)
    /* 1DC80 80157878 CCD0318E */  lw         $s1, %lo(InvRect + 0x9C)($s1)
    /* 1DC84 8015787C 21200002 */  addu       $a0, $s0, $zero
    /* 1DC88 80157880 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DC8C 80157884 21282002 */   addu      $a1, $s1, $zero
    /* 1DC90 80157888 21200002 */  addu       $a0, $s0, $zero
    /* 1DC94 8015788C 21282002 */  addu       $a1, $s1, $zero
    /* 1DC98 80157890 20000624 */  addiu      $a2, $zero, 0x20
    /* 1DC9C 80157894 1180023C */  lui        $v0, %hi(InvSlotTable + 0x13)
    /* 1DCA0 80157898 93D64290 */  lbu        $v0, %lo(InvSlotTable + 0x13)($v0)
    /* 1DCA4 8015789C 30000724 */  addiu      $a3, $zero, 0x30
    /* 1DCA8 801578A0 C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DCAC 801578A4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DCB0 801578A8 1180043C */  lui        $a0, %hi(InvRect + 0xC8)
    /* 1DCB4 801578AC F8D0848C */  lw         $a0, %lo(InvRect + 0xC8)($a0)
    /* 1DCB8 801578B0 1180053C */  lui        $a1, %hi(InvRect + 0xCC)
    /* 1DCBC 801578B4 FCD0A58C */  lw         $a1, %lo(InvRect + 0xCC)($a1)
    /* 1DCC0 801578B8 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DCC4 801578BC 5F000624 */   addiu     $a2, $zero, 0x5F
    /* 1DCC8 801578C0 10000624 */  addiu      $a2, $zero, 0x10
  .L801578C4:
    /* 1DCCC 801578C4 10000724 */  addiu      $a3, $zero, 0x10
    /* 1DCD0 801578C8 1180013C */  lui        $at, %hi(InvRect)
    /* 1DCD4 801578CC 21083200 */  addu       $at, $at, $s2
    /* 1DCD8 801578D0 30D0308C */  lw         $s0, %lo(InvRect)($at)
    /* 1DCDC 801578D4 1180013C */  lui        $at, %hi(InvRect + 0x4)
    /* 1DCE0 801578D8 21083200 */  addu       $at, $at, $s2
    /* 1DCE4 801578DC 34D0318C */  lw         $s1, %lo(InvRect + 0x4)($at)
    /* 1DCE8 801578E0 08005226 */  addiu      $s2, $s2, 0x8
    /* 1DCEC 801578E4 1180013C */  lui        $at, %hi(InvSlotTable)
    /* 1DCF0 801578E8 21083300 */  addu       $at, $at, $s3
    /* 1DCF4 801578EC 80D62290 */  lbu        $v0, %lo(InvSlotTable)($at)
    /* 1DCF8 801578F0 01007326 */  addiu      $s3, $s3, 0x1
    /* 1DCFC 801578F4 21200002 */  addu       $a0, $s0, $zero
    /* 1DD00 801578F8 21282002 */  addu       $a1, $s1, $zero
    /* 1DD04 801578FC C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DD08 80157900 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DD0C 80157904 0802422A */  slti       $v0, $s2, 0x208
    /* 1DD10 80157908 EEFF4014 */  bnez       $v0, .L801578C4
    /* 1DD14 8015790C 10000624 */   addiu     $a2, $zero, 0x10
    /* 1DD18 80157910 5E000624 */  addiu      $a2, $zero, 0x5E
    /* 1DD1C 80157914 08021224 */  addiu      $s2, $zero, 0x208
    /* 1DD20 80157918 1180043C */  lui        $a0, %hi(InvRect + 0x208)
    /* 1DD24 8015791C 38D2848C */  lw         $a0, %lo(InvRect + 0x208)($a0)
    /* 1DD28 80157920 1180053C */  lui        $a1, %hi(InvRect + 0x20C)
    /* 1DD2C 80157924 3CD2A58C */  lw         $a1, %lo(InvRect + 0x20C)($a1)
    /* 1DD30 80157928 9F5C050C */  jal        InvDrawSlot__Fiii
    /* 1DD34 8015792C 41001324 */   addiu     $s3, $zero, 0x41
    /* 1DD38 80157930 10000624 */  addiu      $a2, $zero, 0x10
  .L80157934:
    /* 1DD3C 80157934 10000724 */  addiu      $a3, $zero, 0x10
    /* 1DD40 80157938 1180013C */  lui        $at, %hi(InvRect)
    /* 1DD44 8015793C 21083200 */  addu       $at, $at, $s2
    /* 1DD48 80157940 30D0308C */  lw         $s0, %lo(InvRect)($at)
    /* 1DD4C 80157944 1180013C */  lui        $at, %hi(InvRect + 0x4)
    /* 1DD50 80157948 21083200 */  addu       $at, $at, $s2
    /* 1DD54 8015794C 34D0318C */  lw         $s1, %lo(InvRect + 0x4)($at)
    /* 1DD58 80157950 08005226 */  addiu      $s2, $s2, 0x8
    /* 1DD5C 80157954 1180013C */  lui        $at, %hi(InvSlotTable)
    /* 1DD60 80157958 21083300 */  addu       $at, $at, $s3
    /* 1DD64 8015795C 80D62290 */  lbu        $v0, %lo(InvSlotTable)($at)
    /* 1DD68 80157960 01007326 */  addiu      $s3, $s3, 0x1
    /* 1DD6C 80157964 21200002 */  addu       $a0, $s0, $zero
    /* 1DD70 80157968 21282002 */  addu       $a1, $s1, $zero
    /* 1DD74 8015796C C05C050C */  jal        InvDrawSlotBack__FiiiiUc
    /* 1DD78 80157970 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DD7C 80157974 4802422A */  slti       $v0, $s2, 0x248
    /* 1DD80 80157978 EEFF4014 */  bnez       $v0, .L80157934
    /* 1DD84 8015797C 10000624 */   addiu     $a2, $zero, 0x10
    /* 1DD88 80157980 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1DD8C 80157984 2400B38F */  lw         $s3, 0x24($sp)
    /* 1DD90 80157988 2000B28F */  lw         $s2, 0x20($sp)
    /* 1DD94 8015798C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1DD98 80157990 1800B08F */  lw         $s0, 0x18($sp)
    /* 1DD9C 80157994 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1DDA0 80157998 0800E003 */  jr         $ra
    /* 1DDA4 8015799C 00000000 */   nop
endlabel InvDrawSlots__Fv
