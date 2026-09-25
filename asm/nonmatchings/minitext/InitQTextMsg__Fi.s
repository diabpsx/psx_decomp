.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitQTextMsg__Fi, 0x254

glabel InitQTextMsg__Fi
    /* 3DC78 8004DC78 E0118293 */  lbu        $v0, %gp_rel(qtextflag)($gp)
    /* 3DC7C 8004DC7C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3DC80 8004DC80 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3DC84 8004DC84 21908000 */  addu       $s2, $a0, $zero
    /* 3DC88 8004DC88 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3DC8C 8004DC8C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3DC90 8004DC90 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3DC94 8004DC94 A42092AF */  sw         $s2, %gp_rel(D_8011C824)($gp)
    /* 3DC98 8004DC98 85004014 */  bnez       $v0, .L8004DEB0
    /* 3DC9C 8004DC9C 01000224 */   addiu     $v0, $zero, 0x1
    /* 3DCA0 8004DCA0 E01182A3 */  sb         $v0, %gp_rel(qtextflag)($gp)
    /* 3DCA4 8004DCA4 1280013C */  lui        $at, %hi(gbProcessPlayers)
    /* 3DCA8 8004DCA8 00B820A0 */  sb         $zero, %lo(gbProcessPlayers)($at)
    /* 3DCAC 8004DCAC 1280013C */  lui        $at, %hi(PauseMode)
    /* 3DCB0 8004DCB0 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 3DCB4 8004DCB4 EE80000C */  jal        TSK_Sleep
    /* 3DCB8 8004DCB8 01000424 */   addiu     $a0, $zero, 0x1
    /* 3DCBC 8004DCBC 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3DCC0 8004DCC0 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3DCC4 8004DCC4 00000000 */  nop
    /* 3DCC8 8004DCC8 1E004010 */  beqz       $v0, .L8004DD44
    /* 3DCCC 8004DCCC FDFE4326 */   addiu     $v1, $s2, -0x103
    /* 3DCD0 8004DCD0 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 3DCD4 8004DCD4 1B004010 */  beqz       $v0, .L8004DD44
    /* 3DCD8 8004DCD8 80100300 */   sll       $v0, $v1, 2
    /* 3DCDC 8004DCDC 1180013C */  lui        $at, %hi(jtbl_80116770)
    /* 3DCE0 8004DCE0 21082200 */  addu       $at, $at, $v0
    /* 3DCE4 8004DCE4 7067228C */  lw         $v0, %lo(jtbl_80116770)($at)
    /* 3DCE8 8004DCE8 00000000 */  nop
    /* 3DCEC 8004DCEC 08004000 */  jr         $v0
    /* 3DCF0 8004DCF0 00000000 */   nop
  jlabel .L8004DCF4
    /* 3DCF4 8004DCF4 50370108 */  j          .L8004DD40
    /* 3DCF8 8004DCF8 01200224 */   addiu     $v0, $zero, 0x2001
  jlabel .L8004DCFC
    /* 3DCFC 8004DCFC 50370108 */  j          .L8004DD40
    /* 3DD00 8004DD00 02200224 */   addiu     $v0, $zero, 0x2002
  jlabel .L8004DD04
    /* 3DD04 8004DD04 50370108 */  j          .L8004DD40
    /* 3DD08 8004DD08 03200224 */   addiu     $v0, $zero, 0x2003
  jlabel .L8004DD0C
    /* 3DD0C 8004DD0C 50370108 */  j          .L8004DD40
    /* 3DD10 8004DD10 04200224 */   addiu     $v0, $zero, 0x2004
  jlabel .L8004DD14
    /* 3DD14 8004DD14 50370108 */  j          .L8004DD40
    /* 3DD18 8004DD18 05200224 */   addiu     $v0, $zero, 0x2005
  jlabel .L8004DD1C
    /* 3DD1C 8004DD1C 50370108 */  j          .L8004DD40
    /* 3DD20 8004DD20 06200224 */   addiu     $v0, $zero, 0x2006
  jlabel .L8004DD24
    /* 3DD24 8004DD24 50370108 */  j          .L8004DD40
    /* 3DD28 8004DD28 07200224 */   addiu     $v0, $zero, 0x2007
  jlabel .L8004DD2C
    /* 3DD2C 8004DD2C 50370108 */  j          .L8004DD40
    /* 3DD30 8004DD30 08200224 */   addiu     $v0, $zero, 0x2008
  jlabel .L8004DD34
    /* 3DD34 8004DD34 50370108 */  j          .L8004DD40
    /* 3DD38 8004DD38 09200224 */   addiu     $v0, $zero, 0x2009
  jlabel .L8004DD3C
    /* 3DD3C 8004DD3C 0A200224 */  addiu      $v0, $zero, 0x200A
  .L8004DD40:
    /* 3DD40 8004DD40 C81182AF */  sw         $v0, %gp_rel(D_8011B948)($gp)
  .L8004DD44:
    /* 3DD44 8004DD44 D7F3000C */  jal        stream_stop__Fv
    /* 3DD48 8004DD48 01001024 */   addiu     $s0, $zero, 0x1
    /* 3DD4C 8004DD4C 01001124 */  addiu      $s1, $zero, 0x1
    /* 3DD50 8004DD50 21200000 */  addu       $a0, $zero, $zero
  .L8004DD54:
    /* 3DD54 8004DD54 C362000C */  jal        SpuSetKey
    /* 3DD58 8004DD58 04281102 */   sllv      $a1, $s1, $s0
    /* 3DD5C 8004DD5C 01001026 */  addiu      $s0, $s0, 0x1
    /* 3DD60 8004DD60 1800022A */  slti       $v0, $s0, 0x18
    /* 3DD64 8004DD64 FBFF4014 */  bnez       $v0, .L8004DD54
    /* 3DD68 8004DD68 21200000 */   addu      $a0, $zero, $zero
    /* 3DD6C 8004DD6C 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 3DD70 8004DD70 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 3DD74 8004DD74 00000000 */  nop
    /* 3DD78 8004DD78 08004010 */  beqz       $v0, .L8004DD9C
    /* 3DD7C 8004DD7C 40101200 */   sll       $v0, $s2, 1
  .L8004DD80:
    /* 3DD80 8004DD80 EE80000C */  jal        TSK_Sleep
    /* 3DD84 8004DD84 01000424 */   addiu     $a0, $zero, 0x1
    /* 3DD88 8004DD88 0C80023C */  lui        $v0, %hi(SFXTab + 0x84)
    /* 3DD8C 8004DD8C 649C4280 */  lb         $v0, %lo(SFXTab + 0x84)($v0)
    /* 3DD90 8004DD90 00000000 */  nop
    /* 3DD94 8004DD94 FAFF4014 */  bnez       $v0, .L8004DD80
    /* 3DD98 8004DD98 40101200 */   sll       $v0, $s2, 1
  .L8004DD9C:
    /* 3DD9C 8004DD9C 21105200 */  addu       $v0, $v0, $s2
    /* 3DDA0 8004DDA0 80180200 */  sll        $v1, $v0, 2
    /* 3DDA4 8004DDA4 1180013C */  lui        $at, %hi(alltext + 0x4)
    /* 3DDA8 8004DDA8 21082300 */  addu       $at, $at, $v1
    /* 3DDAC 8004DDAC 247C2290 */  lbu        $v0, %lo(alltext + 0x4)($at)
    /* 3DDB0 8004DDB0 00000000 */  nop
    /* 3DDB4 8004DDB4 31004010 */  beqz       $v0, .L8004DE7C
    /* 3DDB8 8004DDB8 01000224 */   addiu     $v0, $zero, 0x1
    /* 3DDBC 8004DDBC C0118383 */  lb         $v1, %gp_rel(D_8011B940)($gp)
    /* 3DDC0 8004DDC0 1280013C */  lui        $at, %hi(CDWAIT)
    /* 3DDC4 8004DDC4 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 3DDC8 8004DDC8 06006014 */  bnez       $v1, .L8004DDE4
    /* 3DDCC 8004DDCC 21200000 */   addu      $a0, $zero, $zero
    /* 3DDD0 8004DDD0 0580053C */  lui        $a1, %hi(FadeMusicTSK__FP4TASK)
    /* 3DDD4 8004DDD4 2CDBA524 */  addiu      $a1, $a1, %lo(FadeMusicTSK__FP4TASK)
    /* 3DDD8 8004DDD8 00080624 */  addiu      $a2, $zero, 0x800
    /* 3DDDC 8004DDDC 0480000C */  jal        TSK_AddTask
    /* 3DDE0 8004DDE0 21380000 */   addu      $a3, $zero, $zero
  .L8004DDE4:
    /* 3DDE4 8004DDE4 1280033C */  lui        $v1, %hi(stextflag)
    /* 3DDE8 8004DDE8 E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 3DDEC 8004DDEC 03000224 */  addiu      $v0, $zero, 0x3
    /* 3DDF0 8004DDF0 C01182A3 */  sb         $v0, %gp_rel(D_8011B940)($gp)
    /* 3DDF4 8004DDF4 09006010 */  beqz       $v1, .L8004DE1C
    /* 3DDF8 8004DDF8 00000000 */   nop
    /* 3DDFC 8004DDFC E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 3DE00 8004DE00 21200000 */   addu      $a0, $zero, $zero
    /* 3DE04 8004DE04 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 3DE08 8004DE08 21200000 */   addu      $a0, $zero, $zero
    /* 3DE0C 8004DE0C 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 3DE10 8004DE10 00000000 */   nop
    /* 3DE14 8004DE14 EE80000C */  jal        TSK_Sleep
    /* 3DE18 8004DE18 01000424 */   addiu     $a0, $zero, 0x1
  .L8004DE1C:
    /* 3DE1C 8004DE1C 1280033C */  lui        $v1, %hi(options_pad)
    /* 3DE20 8004DE20 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 3DE24 8004DE24 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3DE28 8004DE28 05006214 */  bne        $v1, $v0, .L8004DE40
    /* 3DE2C 8004DE2C 21200000 */   addu      $a0, $zero, $zero
    /* 3DE30 8004DE30 1280023C */  lui        $v0, %hi(myplr)
    /* 3DE34 8004DE34 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 3DE38 8004DE38 1280013C */  lui        $at, %hi(options_pad)
    /* 3DE3C 8004DE3C 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L8004DE40:
    /* 3DE40 8004DE40 0580053C */  lui        $a1, %hi(DrawQTextTSK__FP4TASK)
    /* 3DE44 8004DE44 68E0A524 */  addiu      $a1, $a1, %lo(DrawQTextTSK__FP4TASK)
    /* 3DE48 8004DE48 00080624 */  addiu      $a2, $zero, 0x800
    /* 3DE4C 8004DE4C E6000224 */  addiu      $v0, $zero, 0xE6
    /* 3DE50 8004DE50 902080AF */  sw         $zero, %gp_rel(D_8011C810)($gp)
    /* 3DE54 8004DE54 942082AF */  sw         $v0, %gp_rel(D_8011C814)($gp)
    /* 3DE58 8004DE58 0480000C */  jal        TSK_AddTask
    /* 3DE5C 8004DE5C 10000724 */   addiu     $a3, $zero, 0x10
    /* 3DE60 8004DE60 1C00438C */  lw         $v1, 0x1C($v0)
    /* 3DE64 8004DE64 1280023C */  lui        $v0, %hi(options_pad)
    /* 3DE68 8004DE68 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 3DE6C 8004DE6C 00000000 */  nop
    /* 3DE70 8004DE70 000062AC */  sw         $v0, 0x0($v1)
    /* 3DE74 8004DE74 AC370108 */  j          .L8004DEB0
    /* 3DE78 8004DE78 040072AC */   sw        $s2, 0x4($v1)
  .L8004DE7C:
    /* 3DE7C 8004DE7C 1180013C */  lui        $at, %hi(alltext + 0x8)
    /* 3DE80 8004DE80 21082300 */  addu       $at, $at, $v1
    /* 3DE84 8004DE84 287C248C */  lw         $a0, %lo(alltext + 0x8)($at)
    /* 3DE88 8004DE88 E01180A3 */  sb         $zero, %gp_rel(qtextflag)($gp)
    /* 3DE8C 8004DE8C 1280013C */  lui        $at, %hi(PauseMode)
    /* 3DE90 8004DE90 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 3DE94 8004DE94 1280013C */  lui        $at, %hi(CDWAIT)
    /* 3DE98 8004DE98 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 3DE9C 8004DE9C C6F5000C */  jal        PlaySFX__Fi
    /* 3DEA0 8004DEA0 00000000 */   nop
    /* 3DEA4 8004DEA4 01000224 */  addiu      $v0, $zero, 0x1
    /* 3DEA8 8004DEA8 1280013C */  lui        $at, %hi(gbProcessPlayers)
    /* 3DEAC 8004DEAC 00B822A0 */  sb         $v0, %lo(gbProcessPlayers)($at)
  .L8004DEB0:
    /* 3DEB0 8004DEB0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3DEB4 8004DEB4 1800B28F */  lw         $s2, 0x18($sp)
    /* 3DEB8 8004DEB8 1400B18F */  lw         $s1, 0x14($sp)
    /* 3DEBC 8004DEBC 1000B08F */  lw         $s0, 0x10($sp)
    /* 3DEC0 8004DEC0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3DEC4 8004DEC4 0800E003 */  jr         $ra
    /* 3DEC8 8004DEC8 00000000 */   nop
endlabel InitQTextMsg__Fi
