.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawDiabloMsg__Fv, 0x134

glabel DrawDiabloMsg__Fv
    /* 2DD04 8003DD04 1280023C */  lui        $v0, %hi(stextflag)
    /* 2DD08 8003DD08 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 2DD0C 8003DD0C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 2DD10 8003DD10 05004010 */  beqz       $v0, .L8003DD28
    /* 2DD14 8003DD14 3800BFAF */   sw        $ra, 0x38($sp)
    /* 2DD18 8003DD18 01000224 */  addiu      $v0, $zero, 0x1
    /* 2DD1C 8003DD1C E91082A3 */  sb         $v0, %gp_rel(msgholdflag)($gp)
    /* 2DD20 8003DD20 8AF70008 */  j          .L8003DE28
    /* 2DD24 8003DD24 00000000 */   nop
  .L8003DD28:
    /* 2DD28 8003DD28 E9108283 */  lb         $v0, %gp_rel(msgholdflag)($gp)
    /* 2DD2C 8003DD2C 00000000 */  nop
    /* 2DD30 8003DD30 04004010 */  beqz       $v0, .L8003DD44
    /* 2DD34 8003DD34 30000224 */   addiu     $v0, $zero, 0x30
    /* 2DD38 8003DD38 E91080A3 */  sb         $zero, %gp_rel(msgholdflag)($gp)
    /* 2DD3C 8003DD3C 8AF70008 */  j          .L8003DE28
    /* 2DD40 8003DD40 00000000 */   nop
  .L8003DD44:
    /* 2DD44 8003DD44 2800A2A7 */  sh         $v0, 0x28($sp)
    /* 2DD48 8003DD48 6C000224 */  addiu      $v0, $zero, 0x6C
    /* 2DD4C 8003DD4C 2A00A2A7 */  sh         $v0, 0x2A($sp)
    /* 2DD50 8003DD50 E0000224 */  addiu      $v0, $zero, 0xE0
    /* 2DD54 8003DD54 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 2DD58 8003DD58 EB108283 */  lb         $v0, %gp_rel(msgflag)($gp)
    /* 2DD5C 8003DD5C B0000324 */  addiu      $v1, $zero, 0xB0
    /* 2DD60 8003DD60 2E00A3A7 */  sh         $v1, 0x2E($sp)
    /* 2DD64 8003DD64 80100200 */  sll        $v0, $v0, 2
    /* 2DD68 8003DD68 0D80013C */  lui        $at, %hi(MsgStrings)
    /* 2DD6C 8003DD6C 21082200 */  addu       $at, $at, $v0
    /* 2DD70 8003DD70 401A248C */  lw         $a0, %lo(MsgStrings)($at)
    /* 2DD74 8003DD74 4AED010C */  jal        GetStr__Fi
    /* 2DD78 8003DD78 00000000 */   nop
    /* 2DD7C 8003DD7C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 2DD80 8003DD80 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 2DD84 8003DD84 01000324 */  addiu      $v1, $zero, 0x1
    /* 2DD88 8003DD88 1000A3AF */  sw         $v1, 0x10($sp)
    /* 2DD8C 8003DD8C 2800A327 */  addiu      $v1, $sp, 0x28
    /* 2DD90 8003DD90 1280063C */  lui        $a2, %hi(WHITER)
    /* 2DD94 8003DD94 D1ABC690 */  lbu        $a2, %lo(WHITER)($a2)
    /* 2DD98 8003DD98 1280053C */  lui        $a1, %hi(WHITEG)
    /* 2DD9C 8003DD9C D2ABA590 */  lbu        $a1, %lo(WHITEG)($a1)
    /* 2DDA0 8003DDA0 21384000 */  addu       $a3, $v0, $zero
    /* 2DDA4 8003DDA4 1400A3AF */  sw         $v1, 0x14($sp)
    /* 2DDA8 8003DDA8 1C00A5AF */  sw         $a1, 0x1C($sp)
    /* 2DDAC 8003DDAC 2000A5AF */  sw         $a1, 0x20($sp)
    /* 2DDB0 8003DDB0 21280000 */  addu       $a1, $zero, $zero
    /* 2DDB4 8003DDB4 1800A6AF */  sw         $a2, 0x18($sp)
    /* 2DDB8 8003DDB8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 2DDBC 8003DDBC 0C000624 */   addiu     $a2, $zero, 0xC
    /* 2DDC0 8003DDC0 EC108283 */  lb         $v0, %gp_rel(msgdelay)($gp)
    /* 2DDC4 8003DDC4 00000000 */  nop
    /* 2DDC8 8003DDC8 04004018 */  blez       $v0, .L8003DDDC
    /* 2DDCC 8003DDCC 21184000 */   addu      $v1, $v0, $zero
    /* 2DDD0 8003DDD0 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 2DDD4 8003DDD4 EC1082A3 */  sb         $v0, %gp_rel(msgdelay)($gp)
    /* 2DDD8 8003DDD8 EC108283 */  lb         $v0, %gp_rel(msgdelay)($gp)
  .L8003DDDC:
    /* 2DDDC 8003DDDC 00000000 */  nop
    /* 2DDE0 8003DDE0 11004014 */  bnez       $v0, .L8003DE28
    /* 2DDE4 8003DDE4 46000324 */   addiu     $v1, $zero, 0x46
    /* 2DDE8 8003DDE8 EA108293 */  lbu        $v0, %gp_rel(msgcnt)($gp)
    /* 2DDEC 8003DDEC EC1083A3 */  sb         $v1, %gp_rel(msgdelay)($gp)
    /* 2DDF0 8003DDF0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2DDF4 8003DDF4 EA1082A3 */  sb         $v0, %gp_rel(msgcnt)($gp)
    /* 2DDF8 8003DDF8 00160200 */  sll        $v0, $v0, 24
    /* 2DDFC 8003DDFC 03160200 */  sra        $v0, $v0, 24
    /* 2DE00 8003DE00 04004014 */  bnez       $v0, .L8003DE14
    /* 2DE04 8003DE04 00000000 */   nop
    /* 2DE08 8003DE08 EB1080A3 */  sb         $zero, %gp_rel(msgflag)($gp)
    /* 2DE0C 8003DE0C 8AF70008 */  j          .L8003DE28
    /* 2DE10 8003DE10 00000000 */   nop
  .L8003DE14:
    /* 2DE14 8003DE14 0D80013C */  lui        $at, %hi(msgtable)
    /* 2DE18 8003DE18 21082200 */  addu       $at, $at, $v0
    /* 2DE1C 8003DE1C F01A2290 */  lbu        $v0, %lo(msgtable)($at)
    /* 2DE20 8003DE20 00000000 */  nop
    /* 2DE24 8003DE24 EB1082A3 */  sb         $v0, %gp_rel(msgflag)($gp)
  .L8003DE28:
    /* 2DE28 8003DE28 3800BF8F */  lw         $ra, 0x38($sp)
    /* 2DE2C 8003DE2C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 2DE30 8003DE30 0800E003 */  jr         $ra
    /* 2DE34 8003DE34 00000000 */   nop
endlabel DrawDiabloMsg__Fv
