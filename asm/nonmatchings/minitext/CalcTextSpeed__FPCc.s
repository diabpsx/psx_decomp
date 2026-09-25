.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcTextSpeed__FPCc, 0x1BC

glabel CalcTextSpeed__FPCc
    /* 3D970 8004D970 1280023C */  lui        $v0, %hi(FileSYS)
    /* 3D974 8004D974 ECAA428C */  lw         $v0, %lo(FileSYS)($v0)
    /* 3D978 8004D978 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 3D97C 8004D97C 3000B0AF */  sw         $s0, 0x30($sp)
    /* 3D980 8004D980 21808000 */  addu       $s0, $a0, $zero
    /* 3D984 8004D984 3400B1AF */  sw         $s1, 0x34($sp)
    /* 3D988 8004D988 9020918F */  lw         $s1, %gp_rel(D_8011C810)($gp)
    /* 3D98C 8004D98C 02000324 */  addiu      $v1, $zero, 0x2
    /* 3D990 8004D990 5A004314 */  bne        $v0, $v1, .L8004DAFC
    /* 3D994 8004D994 3800BFAF */   sw        $ra, 0x38($sp)
    /* 3D998 8004D998 D2EC010C */  jal        LANG_GetLang__Fv
    /* 3D99C 8004D99C 00000000 */   nop
    /* 3D9A0 8004D9A0 21184000 */  addu       $v1, $v0, $zero
    /* 3D9A4 8004D9A4 0600622C */  sltiu      $v0, $v1, 0x6
    /* 3D9A8 8004D9A8 1E004010 */  beqz       $v0, .L8004DA24
    /* 3D9AC 8004D9AC 80100300 */   sll       $v0, $v1, 2
    /* 3D9B0 8004D9B0 1180013C */  lui        $at, %hi(jtbl_80116758)
    /* 3D9B4 8004D9B4 21082200 */  addu       $at, $at, $v0
    /* 3D9B8 8004D9B8 5867228C */  lw         $v0, %lo(jtbl_80116758)($at)
    /* 3D9BC 8004D9BC 00000000 */  nop
    /* 3D9C0 8004D9C0 08004000 */  jr         $v0
    /* 3D9C4 8004D9C4 00000000 */   nop
  jlabel .L8004D9C8
    /* 3D9C8 8004D9C8 45000224 */  addiu      $v0, $zero, 0x45
    /* 3D9CC 8004D9CC 89360108 */  j          .L8004DA24
    /* 3D9D0 8004D9D0 2000A2A3 */   sb        $v0, 0x20($sp)
  jlabel .L8004D9D4
    /* 3D9D4 8004D9D4 46000224 */  addiu      $v0, $zero, 0x46
    /* 3D9D8 8004D9D8 89360108 */  j          .L8004DA24
    /* 3D9DC 8004D9DC 2000A2A3 */   sb        $v0, 0x20($sp)
  jlabel .L8004D9E0
    /* 3D9E0 8004D9E0 47000224 */  addiu      $v0, $zero, 0x47
    /* 3D9E4 8004D9E4 89360108 */  j          .L8004DA24
    /* 3D9E8 8004D9E8 2000A2A3 */   sb        $v0, 0x20($sp)
  jlabel .L8004D9EC
    /* 3D9EC 8004D9EC 53000224 */  addiu      $v0, $zero, 0x53
    /* 3D9F0 8004D9F0 89360108 */  j          .L8004DA24
    /* 3D9F4 8004D9F4 2000A2A3 */   sb        $v0, 0x20($sp)
  jlabel .L8004D9F8
    /* 3D9F8 8004D9F8 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 3D9FC 8004D9FC 89360108 */  j          .L8004DA24
    /* 3DA00 8004DA00 2000A2A3 */   sb        $v0, 0x20($sp)
  jlabel .L8004DA04
    /* 3DA04 8004DA04 1180023C */  lui        $v0, %hi(D_8011671C)
    /* 3DA08 8004DA08 1C674224 */  addiu      $v0, $v0, %lo(D_8011671C)
    /* 3DA0C 8004DA0C 05004010 */  beqz       $v0, .L8004DA24
    /* 3DA10 8004DA10 21200000 */   addu      $a0, $zero, $zero
    /* 3DA14 8004DA14 1180053C */  lui        $a1, %hi(D_80116738)
    /* 3DA18 8004DA18 3867A524 */  addiu      $a1, $a1, %lo(D_80116738)
    /* 3DA1C 8004DA1C A583000C */  jal        DBG_Error
    /* 3DA20 8004DA20 A5000624 */   addiu     $a2, $zero, 0xA5
  .L8004DA24:
    /* 3DA24 8004DA24 2100A0A3 */  sb         $zero, 0x21($sp)
    /* 3DA28 8004DA28 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3DA2C 8004DA2C 1180053C */  lui        $a1, %hi(D_8011674C)
    /* 3DA30 8004DA30 4C67A524 */  addiu      $a1, $a1, %lo(D_8011674C)
    /* 3DA34 8004DA34 2000A627 */  addiu      $a2, $sp, 0x20
    /* 3DA38 8004DA38 9767000C */  jal        sprintf
    /* 3DA3C 8004DA3C 21380002 */   addu      $a3, $s0, $zero
    /* 3DA40 8004DA40 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3DA44 8004DA44 0D1F020C */  jal        BL_FileLength__FPcc
    /* 3DA48 8004DA48 21280000 */   addu      $a1, $zero, $zero
    /* 3DA4C 8004DA4C 21804000 */  addu       $s0, $v0, $zero
    /* 3DA50 8004DA50 05000016 */  bnez       $s0, .L8004DA68
    /* 3DA54 8004DA54 21200000 */   addu      $a0, $zero, $zero
    /* 3DA58 8004DA58 1180053C */  lui        $a1, %hi(D_80116738)
    /* 3DA5C 8004DA5C 3867A524 */  addiu      $a1, $a1, %lo(D_80116738)
    /* 3DA60 8004DA60 A583000C */  jal        DBG_Error
    /* 3DA64 8004DA64 AF000624 */   addiu     $a2, $zero, 0xAF
  .L8004DA68:
    /* 3DA68 8004DA68 1338033C */  lui        $v1, (0x38138139 >> 16)
    /* 3DA6C 8004DA6C 39816334 */  ori        $v1, $v1, (0x38138139 & 0xFFFF)
    /* 3DA70 8004DA70 19000302 */  multu      $s0, $v1
    /* 3DA74 8004DA74 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 3DA78 8004DA78 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 3DA7C 8004DA7C 21282002 */  addu       $a1, $s1, $zero
    /* 3DA80 8004DA80 2800A627 */  addiu      $a2, $sp, 0x28
    /* 3DA84 8004DA84 18010224 */  addiu      $v0, $zero, 0x118
    /* 3DA88 8004DA88 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 3DA8C 8004DA8C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3DA90 8004DA90 2800A0A7 */  sh         $zero, 0x28($sp)
    /* 3DA94 8004DA94 2A00A0A7 */  sh         $zero, 0x2A($sp)
    /* 3DA98 8004DA98 2E00A2A7 */  sh         $v0, 0x2E($sp)
    /* 3DA9C 8004DA9C 10180000 */  mfhi       $v1
    /* 3DAA0 8004DAA0 23100302 */  subu       $v0, $s0, $v1
    /* 3DAA4 8004DAA4 42100200 */  srl        $v0, $v0, 1
    /* 3DAA8 8004DAA8 21186200 */  addu       $v1, $v1, $v0
    /* 3DAAC 8004DAAC B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 3DAB0 8004DAB0 82810300 */   srl       $s0, $v1, 6
    /* 3DAB4 8004DAB4 00190200 */  sll        $v1, $v0, 4
    /* 3DAB8 8004DAB8 23186200 */  subu       $v1, $v1, $v0
    /* 3DABC 8004DABC 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3DAC0 8004DAC0 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3DAC4 8004DAC4 00000000 */  nop
    /* 3DAC8 8004DAC8 04004010 */  beqz       $v0, .L8004DADC
    /* 3DACC 8004DACC D7006324 */   addiu     $v1, $v1, 0xD7
    /* 3DAD0 8004DAD0 BC11828F */  lw         $v0, %gp_rel(D_8011B93C)($gp)
    /* 3DAD4 8004DAD4 BA360108 */  j          .L8004DAE8
    /* 3DAD8 8004DAD8 23186200 */   subu      $v1, $v1, $v0
  .L8004DADC:
    /* 3DADC 8004DADC B811828F */  lw         $v0, %gp_rel(D_8011B938)($gp)
    /* 3DAE0 8004DAE0 00000000 */  nop
    /* 3DAE4 8004DAE4 23186200 */  subu       $v1, $v1, $v0
  .L8004DAE8:
    /* 3DAE8 8004DAE8 00140300 */  sll        $v0, $v1, 16
    /* 3DAEC 8004DAEC 1B005000 */  divu       $zero, $v0, $s0
    /* 3DAF0 8004DAF0 12100000 */  mflo       $v0
    /* 3DAF4 8004DAF4 C0360108 */  j          .L8004DB00
    /* 3DAF8 8004DAF8 00000000 */   nop
  .L8004DAFC:
    /* 3DAFC 8004DAFC 0100023C */  lui        $v0, (0x10000 >> 16)
  .L8004DB00:
    /* 3DB00 8004DB00 E41182AF */  sw         $v0, %gp_rel(qtextSpd)($gp)
    /* 3DB04 8004DB04 9420828F */  lw         $v0, %gp_rel(D_8011C814)($gp)
    /* 3DB08 8004DB08 B41180AF */  sw         $zero, %gp_rel(D_8011B934)($gp)
    /* 3DB0C 8004DB0C 00140200 */  sll        $v0, $v0, 16
    /* 3DB10 8004DB10 A02082AF */  sw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3DB14 8004DB14 3800BF8F */  lw         $ra, 0x38($sp)
    /* 3DB18 8004DB18 3400B18F */  lw         $s1, 0x34($sp)
    /* 3DB1C 8004DB1C 3000B08F */  lw         $s0, 0x30($sp)
    /* 3DB20 8004DB20 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 3DB24 8004DB24 0800E003 */  jr         $ra
    /* 3DB28 8004DB28 00000000 */   nop
endlabel CalcTextSpeed__FPCc
