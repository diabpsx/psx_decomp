.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawQTextBack__Fv, 0x19C

glabel DrawQTextBack__Fv
    /* 3DECC 8004DECC 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 3DED0 8004DED0 8000B0AF */  sw         $s0, 0x80($sp)
    /* 3DED4 8004DED4 0D80103C */  lui        $s0, %hi(QBack)
    /* 3DED8 8004DED8 90671026 */  addiu      $s0, $s0, %lo(QBack)
    /* 3DEDC 8004DEDC 21200002 */  addu       $a0, $s0, $zero
    /* 3DEE0 8004DEE0 1A000524 */  addiu      $a1, $zero, 0x1A
    /* 3DEE4 8004DEE4 8800BFAF */  sw         $ra, 0x88($sp)
    /* 3DEE8 8004DEE8 6B3A010C */  jal        SetBorder__6Dialogi_8004e9ac
    /* 3DEEC 8004DEEC 8400B1AF */   sw        $s1, 0x84($sp)
    /* 3DEF0 8004DEF0 1280053C */  lui        $a1, %hi(BORDERR)
    /* 3DEF4 8004DEF4 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 3DEF8 8004DEF8 1280063C */  lui        $a2, %hi(BORDERG)
    /* 3DEFC 8004DEFC F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 3DF00 8004DF00 1280073C */  lui        $a3, %hi(BORDERB)
    /* 3DF04 8004DF04 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 3DF08 8004DF08 633A010C */  jal        SetRGB__6DialogUcUcUc_8004e98c
    /* 3DF0C 8004DF0C 21200002 */   addu      $a0, $s0, $zero
    /* 3DF10 8004DF10 1280023C */  lui        $v0, %hi(stextflag)
    /* 3DF14 8004DF14 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 3DF18 8004DF18 00000000 */  nop
    /* 3DF1C 8004DF1C 05004010 */  beqz       $v0, .L8004DF34
    /* 3DF20 8004DF20 00000000 */   nop
    /* 3DF24 8004DF24 E0118293 */  lbu        $v0, %gp_rel(qtextflag)($gp)
    /* 3DF28 8004DF28 00000000 */  nop
    /* 3DF2C 8004DF2C 06004010 */  beqz       $v0, .L8004DF48
    /* 3DF30 8004DF30 CD000224 */   addiu     $v0, $zero, 0xCD
  .L8004DF34:
    /* 3DF34 8004DF34 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3DF38 8004DF38 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3DF3C 8004DF3C 00000000 */  nop
    /* 3DF40 8004DF40 0A004014 */  bnez       $v0, .L8004DF6C
    /* 3DF44 8004DF44 BD000224 */   addiu     $v0, $zero, 0xBD
  .L8004DF48:
    /* 3DF48 8004DF48 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3DF4C 8004DF4C 0D80043C */  lui        $a0, %hi(QBack)
    /* 3DF50 8004DF50 90678424 */  addiu      $a0, $a0, %lo(QBack)
    /* 3DF54 8004DF54 14000524 */  addiu      $a1, $zero, 0x14
    /* 3DF58 8004DF58 14000624 */  addiu      $a2, $zero, 0x14
    /* 3DF5C 8004DF5C B82F020C */  jal        Back__6Dialogiiii
    /* 3DF60 8004DF60 18010724 */   addiu     $a3, $zero, 0x118
    /* 3DF64 8004DF64 14380108 */  j          .L8004E050
    /* 3DF68 8004DF68 00000000 */   nop
  .L8004DF6C:
    /* 3DF6C 8004DF6C C811848F */  lw         $a0, %gp_rel(D_8011B948)($gp)
    /* 3DF70 8004DF70 4AED010C */  jal        GetStr__Fi
    /* 3DF74 8004DF74 00000000 */   nop
    /* 3DF78 8004DF78 2800A427 */  addiu      $a0, $sp, 0x28
    /* 3DF7C 8004DF7C F240000C */  jal        strcpy
    /* 3DF80 8004DF80 21284000 */   addu      $a1, $v0, $zero
    /* 3DF84 8004DF84 0D80043C */  lui        $a0, %hi(QBack)
    /* 3DF88 8004DF88 90678424 */  addiu      $a0, $a0, %lo(QBack)
    /* 3DF8C 8004DF8C 14000524 */  addiu      $a1, $zero, 0x14
    /* 3DF90 8004DF90 40000624 */  addiu      $a2, $zero, 0x40
    /* 3DF94 8004DF94 18010724 */  addiu      $a3, $zero, 0x118
    /* 3DF98 8004DF98 14000224 */  addiu      $v0, $zero, 0x14
    /* 3DF9C 8004DF9C 7800A2A7 */  sh         $v0, 0x78($sp)
    /* 3DFA0 8004DFA0 18010224 */  addiu      $v0, $zero, 0x118
    /* 3DFA4 8004DFA4 7C00A2A7 */  sh         $v0, 0x7C($sp)
    /* 3DFA8 8004DFA8 B9000224 */  addiu      $v0, $zero, 0xB9
    /* 3DFAC 8004DFAC 7E00A2A7 */  sh         $v0, 0x7E($sp)
    /* 3DFB0 8004DFB0 91000224 */  addiu      $v0, $zero, 0x91
    /* 3DFB4 8004DFB4 7A00A0A7 */  sh         $zero, 0x7A($sp)
    /* 3DFB8 8004DFB8 B82F020C */  jal        Back__6Dialogiiii
    /* 3DFBC 8004DFBC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 3DFC0 8004DFC0 0C80103C */  lui        $s0, %hi(LargeFont)
    /* 3DFC4 8004DFC4 F4841026 */  addiu      $s0, $s0, %lo(LargeFont)
    /* 3DFC8 8004DFC8 21200002 */  addu       $a0, $s0, $zero
    /* 3DFCC 8004DFCC E82A020C */  jal        SetOTpos__5CFonti
    /* 3DFD0 8004DFD0 80000524 */   addiu     $a1, $zero, 0x80
    /* 3DFD4 8004DFD4 21200002 */  addu       $a0, $s0, $zero
    /* 3DFD8 8004DFD8 2800A527 */  addiu      $a1, $sp, 0x28
    /* 3DFDC 8004DFDC A92A020C */  jal        GetStrWidth__5CFontPc
    /* 3DFE0 8004DFE0 21884000 */   addu      $s1, $v0, $zero
    /* 3DFE4 8004DFE4 18014228 */  slti       $v0, $v0, 0x118
    /* 3DFE8 8004DFE8 04004010 */  beqz       $v0, .L8004DFFC
    /* 3DFEC 8004DFEC 21200002 */   addu      $a0, $s0, $zero
    /* 3DFF0 8004DFF0 21280000 */  addu       $a1, $zero, $zero
    /* 3DFF4 8004DFF4 01380108 */  j          .L8004E004
    /* 3DFF8 8004DFF8 32000624 */   addiu     $a2, $zero, 0x32
  .L8004DFFC:
    /* 3DFFC 8004DFFC 21280000 */  addu       $a1, $zero, $zero
    /* 3E000 8004E000 28000624 */  addiu      $a2, $zero, 0x28
  .L8004E004:
    /* 3E004 8004E004 2800A727 */  addiu      $a3, $sp, 0x28
    /* 3E008 8004E008 1280033C */  lui        $v1, %hi(BLUER)
    /* 3E00C 8004E00C D4AB6390 */  lbu        $v1, %lo(BLUER)($v1)
    /* 3E010 8004E010 1280083C */  lui        $t0, %hi(BLUEG)
    /* 3E014 8004E014 D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 3E018 8004E018 1280093C */  lui        $t1, %hi(BLUEB)
    /* 3E01C 8004E01C D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 3E020 8004E020 01000224 */  addiu      $v0, $zero, 0x1
    /* 3E024 8004E024 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3E028 8004E028 7800A227 */  addiu      $v0, $sp, 0x78
    /* 3E02C 8004E02C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 3E030 8004E030 1800A3AF */  sw         $v1, 0x18($sp)
    /* 3E034 8004E034 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 3E038 8004E038 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 3E03C 8004E03C 2000A9AF */   sw        $t1, 0x20($sp)
    /* 3E040 8004E040 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 3E044 8004E044 F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 3E048 8004E048 E82A020C */  jal        SetOTpos__5CFonti
    /* 3E04C 8004E04C 21282002 */   addu      $a1, $s1, $zero
  .L8004E050:
    /* 3E050 8004E050 8800BF8F */  lw         $ra, 0x88($sp)
    /* 3E054 8004E054 8400B18F */  lw         $s1, 0x84($sp)
    /* 3E058 8004E058 8000B08F */  lw         $s0, 0x80($sp)
    /* 3E05C 8004E05C 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 3E060 8004E060 0800E003 */  jr         $ra
    /* 3E064 8004E064 00000000 */   nop
endlabel DrawQTextBack__Fv
