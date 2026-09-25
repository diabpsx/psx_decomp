.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FadeMusicTSK__FP4TASK, 0x14C

glabel FadeMusicTSK__FP4TASK
    /* 3DB2C 8004DB2C C411828F */  lw         $v0, %gp_rel(D_8011B944)($gp)
    /* 3DB30 8004DB30 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3DB34 8004DB34 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3DB38 8004DB38 2400B1AF */  sw         $s1, 0x24($sp)
    /* 3DB3C 8004DB3C 48004014 */  bnez       $v0, .L8004DC60
    /* 3DB40 8004DB40 2000B0AF */   sw        $s0, 0x20($sp)
    /* 3DB44 8004DB44 1280103C */  lui        $s0, %hi(sglMusicVolume)
    /* 3DB48 8004DB48 A0BB108E */  lw         $s0, %lo(sglMusicVolume)($s0)
    /* 3DB4C 8004DB4C C0118593 */  lbu        $a1, %gp_rel(D_8011B940)($gp)
    /* 3DB50 8004DB50 C0118383 */  lb         $v1, %gp_rel(D_8011B940)($gp)
    /* 3DB54 8004DB54 01000224 */  addiu      $v0, $zero, 0x1
    /* 3DB58 8004DB58 C41182AF */  sw         $v0, %gp_rel(D_8011B944)($gp)
    /* 3DB5C 8004DB5C 3F006010 */  beqz       $v1, .L8004DC5C
    /* 3DB60 8004DB60 00000000 */   nop
    /* 3DB64 8004DB64 03001124 */  addiu      $s1, $zero, 0x3
  .L8004DB68:
    /* 3DB68 8004DB68 1280043C */  lui        $a0, %hi(sghMusic)
    /* 3DB6C 8004DB6C B4BB848C */  lw         $a0, %lo(sghMusic)($a0)
    /* 3DB70 8004DB70 00000000 */  nop
    /* 3DB74 8004DB74 33008010 */  beqz       $a0, .L8004DC44
    /* 3DB78 8004DB78 00160500 */   sll       $v0, $a1, 24
    /* 3DB7C 8004DB7C 031E0200 */  sra        $v1, $v0, 24
    /* 3DB80 8004DB80 02000224 */  addiu      $v0, $zero, 0x2
    /* 3DB84 8004DB84 05006210 */  beq        $v1, $v0, .L8004DB9C
    /* 3DB88 8004DB88 00000000 */   nop
    /* 3DB8C 8004DB8C 1A007110 */  beq        $v1, $s1, .L8004DBF8
    /* 3DB90 8004DB90 00000000 */   nop
    /* 3DB94 8004DB94 06370108 */  j          .L8004DC18
    /* 3DB98 8004DB98 00000000 */   nop
  .L8004DB9C:
    /* 3DB9C 8004DB9C 1280023C */  lui        $v0, %hi(sglMusicVolume)
    /* 3DBA0 8004DBA0 A0BB428C */  lw         $v0, %lo(sglMusicVolume)($v0)
    /* 3DBA4 8004DBA4 00000000 */  nop
    /* 3DBA8 8004DBA8 2A100202 */  slt        $v0, $s0, $v0
    /* 3DBAC 8004DBAC 09004010 */  beqz       $v0, .L8004DBD4
    /* 3DBB0 8004DBB0 00000000 */   nop
    /* 3DBB4 8004DBB4 03008280 */  lb         $v0, 0x3($a0)
    /* 3DBB8 8004DBB8 00000000 */  nop
    /* 3DBBC 8004DBBC 03005114 */  bne        $v0, $s1, .L8004DBCC
    /* 3DBC0 8004DBC0 00000000 */   nop
    /* 3DBC4 8004DBC4 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 3DBC8 8004DBC8 04000524 */   addiu     $a1, $zero, 0x4
  .L8004DBCC:
    /* 3DBCC 8004DBCC 06370108 */  j          .L8004DC18
    /* 3DBD0 8004DBD0 80001026 */   addiu     $s0, $s0, 0x80
  .L8004DBD4:
    /* 3DBD4 8004DBD4 03008280 */  lb         $v0, 0x3($a0)
    /* 3DBD8 8004DBD8 00000000 */  nop
    /* 3DBDC 8004DBDC 03005114 */  bne        $v0, $s1, .L8004DBEC
    /* 3DBE0 8004DBE0 00000000 */   nop
    /* 3DBE4 8004DBE4 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 3DBE8 8004DBE8 04000524 */   addiu     $a1, $zero, 0x4
  .L8004DBEC:
    /* 3DBEC 8004DBEC C01180A3 */  sb         $zero, %gp_rel(D_8011B940)($gp)
    /* 3DBF0 8004DBF0 06370108 */  j          .L8004DC18
    /* 3DBF4 8004DBF4 00000000 */   nop
  .L8004DBF8:
    /* 3DBF8 8004DBF8 0300001A */  blez       $s0, .L8004DC08
    /* 3DBFC 8004DBFC 00000000 */   nop
    /* 3DC00 8004DC00 06370108 */  j          .L8004DC18
    /* 3DC04 8004DC04 C0FF1026 */   addiu     $s0, $s0, -0x40
  .L8004DC08:
    /* 3DC08 8004DC08 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 3DC0C 8004DC0C 03000524 */   addiu     $a1, $zero, 0x3
    /* 3DC10 8004DC10 01000224 */  addiu      $v0, $zero, 0x1
    /* 3DC14 8004DC14 C01182A3 */  sb         $v0, %gp_rel(D_8011B940)($gp)
  .L8004DC18:
    /* 3DC18 8004DC18 1280023C */  lui        $v0, %hi(sglMasterVolume)
    /* 3DC1C 8004DC1C 9CBB428C */  lw         $v0, %lo(sglMasterVolume)($v0)
    /* 3DC20 8004DC20 00000000 */  nop
    /* 3DC24 8004DC24 18000202 */  mult       $s0, $v0
    /* 3DC28 8004DC28 1280043C */  lui        $a0, %hi(sghMusic)
    /* 3DC2C 8004DC2C B4BB848C */  lw         $a0, %lo(sghMusic)($a0)
    /* 3DC30 8004DC30 12300000 */  mflo       $a2
    /* 3DC34 8004DC34 03120600 */  sra        $v0, $a2, 8
    /* 3DC38 8004DC38 140082AC */  sw         $v0, 0x14($a0)
    /* 3DC3C 8004DC3C 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 3DC40 8004DC40 180082AC */   sw        $v0, 0x18($a0)
  .L8004DC44:
    /* 3DC44 8004DC44 EE80000C */  jal        TSK_Sleep
    /* 3DC48 8004DC48 01000424 */   addiu     $a0, $zero, 0x1
    /* 3DC4C 8004DC4C C0118283 */  lb         $v0, %gp_rel(D_8011B940)($gp)
    /* 3DC50 8004DC50 C0118593 */  lbu        $a1, %gp_rel(D_8011B940)($gp)
    /* 3DC54 8004DC54 C4FF4014 */  bnez       $v0, .L8004DB68
    /* 3DC58 8004DC58 00000000 */   nop
  .L8004DC5C:
    /* 3DC5C 8004DC5C C41180AF */  sw         $zero, %gp_rel(D_8011B944)($gp)
  .L8004DC60:
    /* 3DC60 8004DC60 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3DC64 8004DC64 2400B18F */  lw         $s1, 0x24($sp)
    /* 3DC68 8004DC68 2000B08F */  lw         $s0, 0x20($sp)
    /* 3DC6C 8004DC6C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3DC70 8004DC70 0800E003 */  jr         $ra
    /* 3DC74 8004DC74 00000000 */   nop
endlabel FadeMusicTSK__FP4TASK
