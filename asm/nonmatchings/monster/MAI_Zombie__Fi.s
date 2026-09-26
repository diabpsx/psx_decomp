.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Zombie__Fi, 0x200

glabel MAI_Zombie__Fi
    /* 15F90 8014FB88 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 15F94 8014FB8C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 15F98 8014FB90 21908000 */  addu       $s2, $a0, $zero
    /* 15F9C 8014FB94 40101200 */  sll        $v0, $s2, 1
    /* 15FA0 8014FB98 21105200 */  addu       $v0, $v0, $s2
    /* 15FA4 8014FB9C 80100200 */  sll        $v0, $v0, 2
    /* 15FA8 8014FBA0 21105200 */  addu       $v0, $v0, $s2
    /* 15FAC 8014FBA4 C0100200 */  sll        $v0, $v0, 3
    /* 15FB0 8014FBA8 1080033C */  lui        $v1, %hi(monster)
    /* 15FB4 8014FBAC 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 15FB8 8014FBB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 15FBC 8014FBB4 21804300 */  addu       $s0, $v0, $v1
    /* 15FC0 8014FBB8 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 15FC4 8014FBBC 2800B6AF */  sw         $s6, 0x28($sp)
    /* 15FC8 8014FBC0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 15FCC 8014FBC4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 15FD0 8014FBC8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 15FD4 8014FBCC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 15FD8 8014FBD0 33000282 */  lb         $v0, 0x33($s0)
    /* 15FDC 8014FBD4 00000000 */  nop
    /* 15FE0 8014FBD8 60004014 */  bnez       $v0, .L8014FD5C
    /* 15FE4 8014FBDC 00000000 */   nop
    /* 15FE8 8014FBE0 35001382 */  lb         $s3, 0x35($s0)
    /* 15FEC 8014FBE4 34001182 */  lb         $s1, 0x34($s0)
    /* 15FF0 8014FBE8 C0101300 */  sll        $v0, $s3, 3
    /* 15FF4 8014FBEC C0181100 */  sll        $v1, $s1, 3
    /* 15FF8 8014FBF0 23187100 */  subu       $v1, $v1, $s1
    /* 15FFC 8014FBF4 C0190300 */  sll        $v1, $v1, 7
    /* 16000 8014FBF8 21104300 */  addu       $v0, $v0, $v1
    /* 16004 8014FBFC 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 16008 8014FC00 21082200 */  addu       $at, $at, $v0
    /* 1600C 8014FC04 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 16010 8014FC08 00000000 */  nop
    /* 16014 8014FC0C 04004230 */  andi       $v0, $v0, 0x4
    /* 16018 8014FC10 52004010 */  beqz       $v0, .L8014FD5C
    /* 1601C 8014FC14 64000424 */   addiu     $a0, $zero, 0x64
    /* 16020 8014FC18 21A80000 */  addu       $s5, $zero, $zero
    /* 16024 8014FC1C 3C001482 */  lb         $s4, 0x3C($s0)
    /* 16028 8014FC20 4A000292 */  lbu        $v0, 0x4A($s0)
    /* 1602C 8014FC24 4B000392 */  lbu        $v1, 0x4B($s0)
    /* 16030 8014FC28 23882202 */  subu       $s1, $s1, $v0
    /* 16034 8014FC2C C9F6000C */  jal        ENG_random__Fl
    /* 16038 8014FC30 23986302 */   subu      $s3, $s3, $v1
    /* 1603C 8014FC34 21202002 */  addu       $a0, $s1, $zero
    /* 16040 8014FC38 6D41000C */  jal        abs
    /* 16044 8014FC3C 21B04000 */   addu      $s6, $v0, $zero
    /* 16048 8014FC40 02004228 */  slti       $v0, $v0, 0x2
    /* 1604C 8014FC44 04004010 */  beqz       $v0, .L8014FC58
    /* 16050 8014FC48 00000000 */   nop
    /* 16054 8014FC4C 6D41000C */  jal        abs
    /* 16058 8014FC50 21206002 */   addu      $a0, $s3, $zero
    /* 1605C 8014FC54 02005528 */  slti       $s5, $v0, 0x2
  .L8014FC58:
    /* 16060 8014FC58 0C00A012 */  beqz       $s5, .L8014FC8C
    /* 16064 8014FC5C 00000000 */   nop
    /* 16068 8014FC60 4D000292 */  lbu        $v0, 0x4D($s0)
    /* 1606C 8014FC64 00000000 */  nop
    /* 16070 8014FC68 40100200 */  sll        $v0, $v0, 1
    /* 16074 8014FC6C 0A004224 */  addiu      $v0, $v0, 0xA
    /* 16078 8014FC70 2A10C202 */  slt        $v0, $s6, $v0
    /* 1607C 8014FC74 34004010 */  beqz       $v0, .L8014FD48
    /* 16080 8014FC78 00000000 */   nop
    /* 16084 8014FC7C 0B5C050C */  jal        M_StartAttack__Fi
    /* 16088 8014FC80 21204002 */   addu      $a0, $s2, $zero
    /* 1608C 8014FC84 523F0508 */  j          .L8014FD48
    /* 16090 8014FC88 00000000 */   nop
  .L8014FC8C:
    /* 16094 8014FC8C 4D000292 */  lbu        $v0, 0x4D($s0)
    /* 16098 8014FC90 00000000 */  nop
    /* 1609C 8014FC94 40100200 */  sll        $v0, $v0, 1
    /* 160A0 8014FC98 0A004224 */  addiu      $v0, $v0, 0xA
    /* 160A4 8014FC9C 2A10C202 */  slt        $v0, $s6, $v0
    /* 160A8 8014FCA0 29004010 */  beqz       $v0, .L8014FD48
    /* 160AC 8014FCA4 00000000 */   nop
    /* 160B0 8014FCA8 6D41000C */  jal        abs
    /* 160B4 8014FCAC 21202002 */   addu      $a0, $s1, $zero
    /* 160B8 8014FCB0 4D000392 */  lbu        $v1, 0x4D($s0)
    /* 160BC 8014FCB4 00000000 */  nop
    /* 160C0 8014FCB8 40180300 */  sll        $v1, $v1, 1
    /* 160C4 8014FCBC 04006324 */  addiu      $v1, $v1, 0x4
    /* 160C8 8014FCC0 2A104300 */  slt        $v0, $v0, $v1
    /* 160CC 8014FCC4 08004010 */  beqz       $v0, .L8014FCE8
    /* 160D0 8014FCC8 21880000 */   addu      $s1, $zero, $zero
    /* 160D4 8014FCCC 6D41000C */  jal        abs
    /* 160D8 8014FCD0 21206002 */   addu      $a0, $s3, $zero
    /* 160DC 8014FCD4 4D000392 */  lbu        $v1, 0x4D($s0)
    /* 160E0 8014FCD8 00000000 */  nop
    /* 160E4 8014FCDC 40180300 */  sll        $v1, $v1, 1
    /* 160E8 8014FCE0 04006324 */  addiu      $v1, $v1, 0x4
    /* 160EC 8014FCE4 2A884300 */  slt        $s1, $v0, $v1
  .L8014FCE8:
    /* 160F0 8014FCE8 08002012 */  beqz       $s1, .L8014FD0C
    /* 160F4 8014FCEC 00000000 */   nop
    /* 160F8 8014FCF0 EB2A050C */  jal        M_GetDir__Fi
    /* 160FC 8014FCF4 21204002 */   addu      $a0, $s2, $zero
    /* 16100 8014FCF8 21204002 */  addu       $a0, $s2, $zero
    /* 16104 8014FCFC D43D050C */  jal        M_CallWalk__Fii
    /* 16108 8014FD00 21284000 */   addu      $a1, $v0, $zero
    /* 1610C 8014FD04 523F0508 */  j          .L8014FD48
    /* 16110 8014FD08 00000000 */   nop
  .L8014FD0C:
    /* 16114 8014FD0C C9F6000C */  jal        ENG_random__Fl
    /* 16118 8014FD10 64000424 */   addiu     $a0, $zero, 0x64
    /* 1611C 8014FD14 4D000392 */  lbu        $v1, 0x4D($s0)
    /* 16120 8014FD18 00000000 */  nop
    /* 16124 8014FD1C 40180300 */  sll        $v1, $v1, 1
    /* 16128 8014FD20 14006324 */  addiu      $v1, $v1, 0x14
    /* 1612C 8014FD24 2A104300 */  slt        $v0, $v0, $v1
    /* 16130 8014FD28 05004010 */  beqz       $v0, .L8014FD40
    /* 16134 8014FD2C 21204002 */   addu      $a0, $s2, $zero
    /* 16138 8014FD30 C9F6000C */  jal        ENG_random__Fl
    /* 1613C 8014FD34 08000424 */   addiu     $a0, $zero, 0x8
    /* 16140 8014FD38 21A04000 */  addu       $s4, $v0, $zero
    /* 16144 8014FD3C 21204002 */  addu       $a0, $s2, $zero
  .L8014FD40:
    /* 16148 8014FD40 7A3E050C */  jal        M_DumbWalk__Fii
    /* 1614C 8014FD44 21288002 */   addu      $a1, $s4, $zero
  .L8014FD48:
    /* 16150 8014FD48 33000282 */  lb         $v0, 0x33($s0)
    /* 16154 8014FD4C 00000000 */  nop
    /* 16158 8014FD50 02004014 */  bnez       $v0, .L8014FD5C
    /* 1615C 8014FD54 00000000 */   nop
    /* 16160 8014FD58 5A0000A2 */  sb         $zero, 0x5A($s0)
  .L8014FD5C:
    /* 16164 8014FD5C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 16168 8014FD60 2800B68F */  lw         $s6, 0x28($sp)
    /* 1616C 8014FD64 2400B58F */  lw         $s5, 0x24($sp)
    /* 16170 8014FD68 2000B48F */  lw         $s4, 0x20($sp)
    /* 16174 8014FD6C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 16178 8014FD70 1800B28F */  lw         $s2, 0x18($sp)
    /* 1617C 8014FD74 1400B18F */  lw         $s1, 0x14($sp)
    /* 16180 8014FD78 1000B08F */  lw         $s0, 0x10($sp)
    /* 16184 8014FD7C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 16188 8014FD80 0800E003 */  jr         $ra
    /* 1618C 8014FD84 00000000 */   nop
endlabel MAI_Zombie__Fi
