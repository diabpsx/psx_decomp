.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching main_ctrl_setup__Fv, 0x4DC

glabel main_ctrl_setup__Fv
    /* 8CBA8 8009CBA8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8CBAC 8009CBAC 1280043C */  lui        $a0, %hi(options_pad)
    /* 8CBB0 8009CBB0 50B2848C */  lw         $a0, %lo(options_pad)($a0)
    /* 8CBB4 8009CBB4 21280000 */  addu       $a1, $zero, $zero
    /* 8CBB8 8009CBB8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 8CBBC 8009CBBC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8CBC0 8009CBC0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8CBC4 8009CBC4 FD25020C */  jal        PAD_GetPad__FiUc
    /* 8CBC8 8009CBC8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 8CBCC 8009CBCC 1280033C */  lui        $v1, %hi(FeFlag)
    /* 8CBD0 8009CBD0 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 8CBD4 8009CBD4 00000000 */  nop
    /* 8CBD8 8009CBD8 04006010 */  beqz       $v1, .L8009CBEC
    /* 8CBDC 8009CBDC 21884000 */   addu      $s1, $v0, $zero
    /* 8CBE0 8009CBE0 21202002 */  addu       $a0, $s1, $zero
    /* 8CBE4 8009CBE4 FD720208 */  j          .L8009CBF4
    /* 8CBE8 8009CBE8 08000524 */   addiu     $a1, $zero, 0x8
  .L8009CBEC:
    /* 8CBEC 8009CBEC 21202002 */  addu       $a0, $s1, $zero
    /* 8CBF0 8009CBF0 05000524 */  addiu      $a1, $zero, 0x5
  .L8009CBF4:
    /* 8CBF4 8009CBF4 F476020C */  jal        SetPadTick__4CPadUs_8009dbd0
    /* 8CBF8 8009CBF8 00000000 */   nop
    /* 8CBFC 8009CBFC 21202002 */  addu       $a0, $s1, $zero
    /* 8CC00 8009CC00 F276020C */  jal        SetPadTickMask__4CPadUs_8009dbc8
    /* 8CC04 8009CC04 03000524 */   addiu     $a1, $zero, 0x3
    /* 8CC08 8009CC08 E876020C */  jal        GetCur__C4CPad_8009dba0
    /* 8CC0C 8009CC0C 21202002 */   addu      $a0, $s1, $zero
    /* 8CC10 8009CC10 0D80123C */  lui        $s2, %hi(txt_actions + 0x44)
    /* 8CC14 8009CC14 50C45226 */  addiu      $s2, $s2, %lo(txt_actions + 0x44)
    /* 8CC18 8009CC18 0000438E */  lw         $v1, 0x0($s2)
    /* 8CC1C 8009CC1C FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 8CC20 8009CC20 03006014 */  bnez       $v1, .L8009CC30
    /* 8CC24 8009CC24 24804300 */   and       $s0, $v0, $v1
    /* 8CC28 8009CC28 EC0880AF */  sw         $zero, %gp_rel(D_8011B06C)($gp)
    /* 8CC2C 8009CC2C 4A1F80A3 */  sb         $zero, %gp_rel(D_8011C6CA)($gp)
  .L8009CC30:
    /* 8CC30 8009CC30 04000012 */  beqz       $s0, .L8009CC44
    /* 8CC34 8009CC34 01000224 */   addiu     $v0, $zero, 0x1
    /* 8CC38 8009CC38 4A1F82A3 */  sb         $v0, %gp_rel(D_8011C6CA)($gp)
    /* 8CC3C 8009CC3C 1A730208 */  j          .L8009CC68
    /* 8CC40 8009CC40 00000000 */   nop
  .L8009CC44:
    /* 8CC44 8009CC44 DE76020C */  jal        GetUp__C4CPad_8009db78
    /* 8CC48 8009CC48 21202002 */   addu      $a0, $s1, $zero
    /* 8CC4C 8009CC4C 0000438E */  lw         $v1, 0x0($s2)
    /* 8CC50 8009CC50 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 8CC54 8009CC54 24104300 */  and        $v0, $v0, $v1
    /* 8CC58 8009CC58 03004010 */  beqz       $v0, .L8009CC68
    /* 8CC5C 8009CC5C 00000000 */   nop
    /* 8CC60 8009CC60 4A1F80A3 */  sb         $zero, %gp_rel(D_8011C6CA)($gp)
    /* 8CC64 8009CC64 EC0880AF */  sw         $zero, %gp_rel(D_8011B06C)($gp)
  .L8009CC68:
    /* 8CC68 8009CC68 CA76020C */  jal        GetTick__C4CPad_8009db28
    /* 8CC6C 8009CC6C 21202002 */   addu      $a0, $s1, $zero
    /* 8CC70 8009CC70 01004230 */  andi       $v0, $v0, 0x1
    /* 8CC74 8009CC74 29004010 */  beqz       $v0, .L8009CD1C
    /* 8CC78 8009CC78 00000000 */   nop
    /* 8CC7C 8009CC7C C6F5000C */  jal        PlaySFX__Fi
    /* 8CC80 8009CC80 32000424 */   addiu     $a0, $zero, 0x32
    /* 8CC84 8009CC84 481F8493 */  lbu        $a0, %gp_rel(D_8011C6C8)($gp)
    /* 8CC88 8009CC88 00000000 */  nop
    /* 8CC8C 8009CC8C FFFF8224 */  addiu      $v0, $a0, -0x1
    /* 8CC90 8009CC90 481F82A3 */  sb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CC94 8009CC94 00160200 */  sll        $v0, $v0, 24
    /* 8CC98 8009CC98 03150200 */  sra        $v0, $v0, 20
    /* 8CC9C 8009CC9C 0D80013C */  lui        $at, %hi(txt_actions)
    /* 8CCA0 8009CCA0 21082200 */  addu       $at, $at, $v0
    /* 8CCA4 8009CCA4 0CC4238C */  lw         $v1, %lo(txt_actions)($at)
    /* 8CCA8 8009CCA8 2C050224 */  addiu      $v0, $zero, 0x52C
    /* 8CCAC 8009CCAC 0B006214 */  bne        $v1, $v0, .L8009CCDC
    /* 8CCB0 8009CCB0 FEFF8224 */   addiu     $v0, $a0, -0x2
    /* 8CCB4 8009CCB4 481F82A3 */  sb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CCB8 8009CCB8 00160200 */  sll        $v0, $v0, 24
    /* 8CCBC 8009CCBC 03160200 */  sra        $v0, $v0, 24
    /* 8CCC0 8009CCC0 05004228 */  slti       $v0, $v0, 0x5
    /* 8CCC4 8009CCC4 05004014 */  bnez       $v0, .L8009CCDC
    /* 8CCC8 8009CCC8 00000000 */   nop
    /* 8CCCC 8009CCCC 9C08828F */  lw         $v0, %gp_rel(D_8011B01C)($gp)
    /* 8CCD0 8009CCD0 00000000 */  nop
    /* 8CCD4 8009CCD4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 8CCD8 8009CCD8 9C0882AF */  sw         $v0, %gp_rel(D_8011B01C)($gp)
  .L8009CCDC:
    /* 8CCDC 8009CCDC 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CCE0 8009CCE0 00000000 */  nop
    /* 8CCE4 8009CCE4 03004104 */  bgez       $v0, .L8009CCF4
    /* 8CCE8 8009CCE8 21184000 */   addu      $v1, $v0, $zero
    /* 8CCEC 8009CCEC 14006224 */  addiu      $v0, $v1, 0x14
    /* 8CCF0 8009CCF0 481F82A3 */  sb         $v0, %gp_rel(D_8011C6C8)($gp)
  .L8009CCF4:
    /* 8CCF4 8009CCF4 9C08828F */  lw         $v0, %gp_rel(D_8011B01C)($gp)
    /* 8CCF8 8009CCF8 00000000 */  nop
    /* 8CCFC 8009CCFC 02004010 */  beqz       $v0, .L8009CD08
    /* 8CD00 8009CD00 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 8CD04 8009CD04 9C0882AF */  sw         $v0, %gp_rel(D_8011B01C)($gp)
  .L8009CD08:
    /* 8CD08 8009CD08 481F8383 */  lb         $v1, %gp_rel(D_8011C6C8)($gp)
    /* 8CD0C 8009CD0C 13000224 */  addiu      $v0, $zero, 0x13
    /* 8CD10 8009CD10 02006214 */  bne        $v1, $v0, .L8009CD1C
    /* 8CD14 8009CD14 10000224 */   addiu     $v0, $zero, 0x10
    /* 8CD18 8009CD18 9C0882AF */  sw         $v0, %gp_rel(D_8011B01C)($gp)
  .L8009CD1C:
    /* 8CD1C 8009CD1C CA76020C */  jal        GetTick__C4CPad_8009db28
    /* 8CD20 8009CD20 21202002 */   addu      $a0, $s1, $zero
    /* 8CD24 8009CD24 02004230 */  andi       $v0, $v0, 0x2
    /* 8CD28 8009CD28 35004010 */  beqz       $v0, .L8009CE00
    /* 8CD2C 8009CD2C 00000000 */   nop
    /* 8CD30 8009CD30 C6F5000C */  jal        PlaySFX__Fi
    /* 8CD34 8009CD34 32000424 */   addiu     $a0, $zero, 0x32
    /* 8CD38 8009CD38 6666033C */  lui        $v1, (0x66666667 >> 16)
    /* 8CD3C 8009CD3C 481F8293 */  lbu        $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CD40 8009CD40 67666334 */  ori        $v1, $v1, (0x66666667 & 0xFFFF)
    /* 8CD44 8009CD44 01004224 */  addiu      $v0, $v0, 0x1
    /* 8CD48 8009CD48 00160200 */  sll        $v0, $v0, 24
    /* 8CD4C 8009CD4C 03260200 */  sra        $a0, $v0, 24
    /* 8CD50 8009CD50 18008300 */  mult       $a0, $v1
    /* 8CD54 8009CD54 C3170200 */  sra        $v0, $v0, 31
    /* 8CD58 8009CD58 10300000 */  mfhi       $a2
    /* 8CD5C 8009CD5C C3180600 */  sra        $v1, $a2, 3
    /* 8CD60 8009CD60 23186200 */  subu       $v1, $v1, $v0
    /* 8CD64 8009CD64 80100300 */  sll        $v0, $v1, 2
    /* 8CD68 8009CD68 21104300 */  addu       $v0, $v0, $v1
    /* 8CD6C 8009CD6C 80100200 */  sll        $v0, $v0, 2
    /* 8CD70 8009CD70 23208200 */  subu       $a0, $a0, $v0
    /* 8CD74 8009CD74 00160400 */  sll        $v0, $a0, 24
    /* 8CD78 8009CD78 03150200 */  sra        $v0, $v0, 20
    /* 8CD7C 8009CD7C 0D80013C */  lui        $at, %hi(txt_actions)
    /* 8CD80 8009CD80 21082200 */  addu       $at, $at, $v0
    /* 8CD84 8009CD84 0CC4238C */  lw         $v1, %lo(txt_actions)($at)
    /* 8CD88 8009CD88 2C050224 */  addiu      $v0, $zero, 0x52C
    /* 8CD8C 8009CD8C 481F84A3 */  sb         $a0, %gp_rel(D_8011C6C8)($gp)
    /* 8CD90 8009CD90 0B006214 */  bne        $v1, $v0, .L8009CDC0
    /* 8CD94 8009CD94 01008224 */   addiu     $v0, $a0, 0x1
    /* 8CD98 8009CD98 481F82A3 */  sb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CD9C 8009CD9C 00160200 */  sll        $v0, $v0, 24
    /* 8CDA0 8009CDA0 03160200 */  sra        $v0, $v0, 24
    /* 8CDA4 8009CDA4 05004228 */  slti       $v0, $v0, 0x5
    /* 8CDA8 8009CDA8 10004014 */  bnez       $v0, .L8009CDEC
    /* 8CDAC 8009CDAC 00000000 */   nop
    /* 8CDB0 8009CDB0 9C08828F */  lw         $v0, %gp_rel(D_8011B01C)($gp)
    /* 8CDB4 8009CDB4 00000000 */  nop
    /* 8CDB8 8009CDB8 01004224 */  addiu      $v0, $v0, 0x1
    /* 8CDBC 8009CDBC 9C0882AF */  sw         $v0, %gp_rel(D_8011B01C)($gp)
  .L8009CDC0:
    /* 8CDC0 8009CDC0 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CDC4 8009CDC4 00000000 */  nop
    /* 8CDC8 8009CDC8 05004228 */  slti       $v0, $v0, 0x5
    /* 8CDCC 8009CDCC 07004014 */  bnez       $v0, .L8009CDEC
    /* 8CDD0 8009CDD0 00000000 */   nop
    /* 8CDD4 8009CDD4 9C08828F */  lw         $v0, %gp_rel(D_8011B01C)($gp)
    /* 8CDD8 8009CDD8 00000000 */  nop
    /* 8CDDC 8009CDDC 01004224 */  addiu      $v0, $v0, 0x1
    /* 8CDE0 8009CDE0 9C0882AF */  sw         $v0, %gp_rel(D_8011B01C)($gp)
    /* 8CDE4 8009CDE4 80730208 */  j          .L8009CE00
    /* 8CDE8 8009CDE8 00000000 */   nop
  .L8009CDEC:
    /* 8CDEC 8009CDEC 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CDF0 8009CDF0 00000000 */  nop
    /* 8CDF4 8009CDF4 02004014 */  bnez       $v0, .L8009CE00
    /* 8CDF8 8009CDF8 00000000 */   nop
    /* 8CDFC 8009CDFC 9C0880AF */  sw         $zero, %gp_rel(D_8011B01C)($gp)
  .L8009CE00:
    /* 8CE00 8009CE00 D476020C */  jal        GetDown__C4CPad_8009db50
    /* 8CE04 8009CE04 21202002 */   addu      $a0, $s1, $zero
    /* 8CE08 8009CE08 00014230 */  andi       $v0, $v0, 0x100
    /* 8CE0C 8009CE0C 0E004010 */  beqz       $v0, .L8009CE48
    /* 8CE10 8009CE10 00000000 */   nop
    /* 8CE14 8009CE14 491F8283 */  lb         $v0, %gp_rel(D_8011C6C9)($gp)
    /* 8CE18 8009CE18 00000000 */  nop
    /* 8CE1C 8009CE1C 0A004014 */  bnez       $v0, .L8009CE48
    /* 8CE20 8009CE20 00000000 */   nop
    /* 8CE24 8009CE24 F171020C */  jal        RemoveCtrlScreen__Fv
    /* 8CE28 8009CE28 00000000 */   nop
    /* 8CE2C 8009CE2C 01004238 */  xori       $v0, $v0, 0x1
    /* 8CE30 8009CE30 8A004014 */  bnez       $v0, .L8009D05C
    /* 8CE34 8009CE34 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 8CE38 8009CE38 C6F5000C */  jal        PlaySFX__Fi
    /* 8CE3C 8009CE3C 33000424 */   addiu     $a0, $zero, 0x33
    /* 8CE40 8009CE40 1A740208 */  j          .L8009D068
    /* 8CE44 8009CE44 21100000 */   addu      $v0, $zero, $zero
  .L8009CE48:
    /* 8CE48 8009CE48 D476020C */  jal        GetDown__C4CPad_8009db50
    /* 8CE4C 8009CE4C 21202002 */   addu      $a0, $s1, $zero
    /* 8CE50 8009CE50 04004230 */  andi       $v0, $v0, 0x4
    /* 8CE54 8009CE54 21004010 */  beqz       $v0, .L8009CEDC
    /* 8CE58 8009CE58 00000000 */   nop
    /* 8CE5C 8009CE5C 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CE60 8009CE60 00000000 */  nop
    /* 8CE64 8009CE64 00290200 */  sll        $a1, $v0, 4
    /* 8CE68 8009CE68 0D80013C */  lui        $at, %hi(txt_actions)
    /* 8CE6C 8009CE6C 21082500 */  addu       $at, $at, $a1
    /* 8CE70 8009CE70 0CC4238C */  lw         $v1, %lo(txt_actions)($at)
    /* 8CE74 8009CE74 C3000224 */  addiu      $v0, $zero, 0xC3
    /* 8CE78 8009CE78 03006210 */  beq        $v1, $v0, .L8009CE88
    /* 8CE7C 8009CE7C A6020224 */   addiu     $v0, $zero, 0x2A6
    /* 8CE80 8009CE80 0B006214 */  bne        $v1, $v0, .L8009CEB0
    /* 8CE84 8009CE84 BC030224 */   addiu     $v0, $zero, 0x3BC
  .L8009CE88:
    /* 8CE88 8009CE88 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 8CE8C 8009CE8C 21082500 */  addu       $at, $at, $a1
    /* 8CE90 8009CE90 10C4228C */  lw         $v0, %lo(txt_actions + 0x4)($at)
    /* 8CE94 8009CE94 00000000 */  nop
    /* 8CE98 8009CE98 01004238 */  xori       $v0, $v0, 0x1
    /* 8CE9C 8009CE9C 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 8CEA0 8009CEA0 21082500 */  addu       $at, $at, $a1
    /* 8CEA4 8009CEA4 10C422AC */  sw         $v0, %lo(txt_actions + 0x4)($at)
    /* 8CEA8 8009CEA8 17740208 */  j          .L8009D05C
    /* 8CEAC 8009CEAC 33000424 */   addiu     $a0, $zero, 0x33
  .L8009CEB0:
    /* 8CEB0 8009CEB0 6C006210 */  beq        $v1, $v0, .L8009D064
    /* 8CEB4 8009CEB4 BD030224 */   addiu     $v0, $zero, 0x3BD
    /* 8CEB8 8009CEB8 6B006210 */  beq        $v1, $v0, .L8009D068
    /* 8CEBC 8009CEBC 01000224 */   addiu     $v0, $zero, 0x1
    /* 8CEC0 8009CEC0 C6F5000C */  jal        PlaySFX__Fi
    /* 8CEC4 8009CEC4 32000424 */   addiu     $a0, $zero, 0x32
    /* 8CEC8 8009CEC8 491F8283 */  lb         $v0, %gp_rel(D_8011C6C9)($gp)
    /* 8CECC 8009CECC 00000000 */  nop
    /* 8CED0 8009CED0 02004010 */  beqz       $v0, .L8009CEDC
    /* 8CED4 8009CED4 00000000 */   nop
    /* 8CED8 8009CED8 491F80A3 */  sb         $zero, %gp_rel(D_8011C6C9)($gp)
  .L8009CEDC:
    /* 8CEDC 8009CEDC D476020C */  jal        GetDown__C4CPad_8009db50
    /* 8CEE0 8009CEE0 21202002 */   addu      $a0, $s1, $zero
    /* 8CEE4 8009CEE4 08004230 */  andi       $v0, $v0, 0x8
    /* 8CEE8 8009CEE8 21004010 */  beqz       $v0, .L8009CF70
    /* 8CEEC 8009CEEC 00000000 */   nop
    /* 8CEF0 8009CEF0 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CEF4 8009CEF4 00000000 */  nop
    /* 8CEF8 8009CEF8 00290200 */  sll        $a1, $v0, 4
    /* 8CEFC 8009CEFC 0D80013C */  lui        $at, %hi(txt_actions)
    /* 8CF00 8009CF00 21082500 */  addu       $at, $at, $a1
    /* 8CF04 8009CF04 0CC4238C */  lw         $v1, %lo(txt_actions)($at)
    /* 8CF08 8009CF08 C3000224 */  addiu      $v0, $zero, 0xC3
    /* 8CF0C 8009CF0C 03006210 */  beq        $v1, $v0, .L8009CF1C
    /* 8CF10 8009CF10 A6020224 */   addiu     $v0, $zero, 0x2A6
    /* 8CF14 8009CF14 0B006214 */  bne        $v1, $v0, .L8009CF44
    /* 8CF18 8009CF18 BC030224 */   addiu     $v0, $zero, 0x3BC
  .L8009CF1C:
    /* 8CF1C 8009CF1C 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 8CF20 8009CF20 21082500 */  addu       $at, $at, $a1
    /* 8CF24 8009CF24 10C4228C */  lw         $v0, %lo(txt_actions + 0x4)($at)
    /* 8CF28 8009CF28 00000000 */  nop
    /* 8CF2C 8009CF2C 01004238 */  xori       $v0, $v0, 0x1
    /* 8CF30 8009CF30 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 8CF34 8009CF34 21082500 */  addu       $at, $at, $a1
    /* 8CF38 8009CF38 10C422AC */  sw         $v0, %lo(txt_actions + 0x4)($at)
    /* 8CF3C 8009CF3C 17740208 */  j          .L8009D05C
    /* 8CF40 8009CF40 33000424 */   addiu     $a0, $zero, 0x33
  .L8009CF44:
    /* 8CF44 8009CF44 47006210 */  beq        $v1, $v0, .L8009D064
    /* 8CF48 8009CF48 BD030224 */   addiu     $v0, $zero, 0x3BD
    /* 8CF4C 8009CF4C 46006210 */  beq        $v1, $v0, .L8009D068
    /* 8CF50 8009CF50 01000224 */   addiu     $v0, $zero, 0x1
    /* 8CF54 8009CF54 C6F5000C */  jal        PlaySFX__Fi
    /* 8CF58 8009CF58 32000424 */   addiu     $a0, $zero, 0x32
    /* 8CF5C 8009CF5C 491F8283 */  lb         $v0, %gp_rel(D_8011C6C9)($gp)
    /* 8CF60 8009CF60 00000000 */  nop
    /* 8CF64 8009CF64 02004014 */  bnez       $v0, .L8009CF70
    /* 8CF68 8009CF68 01000224 */   addiu     $v0, $zero, 0x1
    /* 8CF6C 8009CF6C 491F82A3 */  sb         $v0, %gp_rel(D_8011C6C9)($gp)
  .L8009CF70:
    /* 8CF70 8009CF70 D476020C */  jal        GetDown__C4CPad_8009db50
    /* 8CF74 8009CF74 21202002 */   addu      $a0, $s1, $zero
    /* 8CF78 8009CF78 40004230 */  andi       $v0, $v0, 0x40
    /* 8CF7C 8009CF7C 18004010 */  beqz       $v0, .L8009CFE0
    /* 8CF80 8009CF80 00000000 */   nop
    /* 8CF84 8009CF84 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8CF88 8009CF88 00000000 */  nop
    /* 8CF8C 8009CF8C 00110200 */  sll        $v0, $v0, 4
    /* 8CF90 8009CF90 0D80013C */  lui        $at, %hi(txt_actions)
    /* 8CF94 8009CF94 21082200 */  addu       $at, $at, $v0
    /* 8CF98 8009CF98 0CC4238C */  lw         $v1, %lo(txt_actions)($at)
    /* 8CF9C 8009CF9C BC030224 */  addiu      $v0, $zero, 0x3BC
    /* 8CFA0 8009CFA0 07006214 */  bne        $v1, $v0, .L8009CFC0
    /* 8CFA4 8009CFA4 BD030224 */   addiu     $v0, $zero, 0x3BD
    /* 8CFA8 8009CFA8 C6F5000C */  jal        PlaySFX__Fi
    /* 8CFAC 8009CFAC 33000424 */   addiu     $a0, $zero, 0x33
    /* 8CFB0 8009CFB0 B672020C */  jal        restore_controller_settings__F8CTRL_SET
    /* 8CFB4 8009CFB4 01000424 */   addiu     $a0, $zero, 0x1
    /* 8CFB8 8009CFB8 1A740208 */  j          .L8009D068
    /* 8CFBC 8009CFBC 01000224 */   addiu     $v0, $zero, 0x1
  .L8009CFC0:
    /* 8CFC0 8009CFC0 07006214 */  bne        $v1, $v0, .L8009CFE0
    /* 8CFC4 8009CFC4 00000000 */   nop
    /* 8CFC8 8009CFC8 C6F5000C */  jal        PlaySFX__Fi
    /* 8CFCC 8009CFCC 33000424 */   addiu     $a0, $zero, 0x33
    /* 8CFD0 8009CFD0 B672020C */  jal        restore_controller_settings__F8CTRL_SET
    /* 8CFD4 8009CFD4 21200000 */   addu      $a0, $zero, $zero
    /* 8CFD8 8009CFD8 1A740208 */  j          .L8009D068
    /* 8CFDC 8009CFDC 01000224 */   addiu     $v0, $zero, 0x1
  .L8009CFE0:
    /* 8CFE0 8009CFE0 481F8383 */  lb         $v1, %gp_rel(D_8011C6C8)($gp)
    /* 8CFE4 8009CFE4 00000000 */  nop
    /* 8CFE8 8009CFE8 04006228 */  slti       $v0, $v1, 0x4
    /* 8CFEC 8009CFEC 02004010 */  beqz       $v0, .L8009CFF8
    /* 8CFF0 8009CFF0 00000000 */   nop
    /* 8CFF4 8009CFF4 491F80A3 */  sb         $zero, %gp_rel(D_8011C6C9)($gp)
  .L8009CFF8:
    /* 8CFF8 8009CFF8 491F8283 */  lb         $v0, %gp_rel(D_8011C6C9)($gp)
    /* 8CFFC 8009CFFC 00000000 */  nop
    /* 8D000 8009D000 18004010 */  beqz       $v0, .L8009D064
    /* 8D004 8009D004 02006228 */   slti      $v0, $v1, 0x2
    /* 8D008 8009D008 17004014 */  bnez       $v0, .L8009D068
    /* 8D00C 8009D00C 01000224 */   addiu     $v0, $zero, 0x1
    /* 8D010 8009D010 A0088293 */  lbu        $v0, %gp_rel(ctrlflag)($gp)
    /* 8D014 8009D014 00000000 */  nop
    /* 8D018 8009D018 13004010 */  beqz       $v0, .L8009D068
    /* 8D01C 8009D01C 01000224 */   addiu     $v0, $zero, 0x1
    /* 8D020 8009D020 D476020C */  jal        GetDown__C4CPad_8009db50
    /* 8D024 8009D024 21202002 */   addu      $a0, $s1, $zero
    /* 8D028 8009D028 C03F5030 */  andi       $s0, $v0, 0x3FC0
    /* 8D02C 8009D02C 0E000012 */  beqz       $s0, .L8009D068
    /* 8D030 8009D030 01000224 */   addiu     $v0, $zero, 0x1
    /* 8D034 8009D034 DF72020C */  jal        only_one_button__Fi
    /* 8D038 8009D038 21200002 */   addu      $a0, $s0, $zero
    /* 8D03C 8009D03C 0A004010 */  beqz       $v0, .L8009D068
    /* 8D040 8009D040 01000224 */   addiu     $v0, $zero, 0x1
    /* 8D044 8009D044 481F8483 */  lb         $a0, %gp_rel(D_8011C6C8)($gp)
    /* 8D048 8009D048 5872020C */  jal        set_buttons__Fii
    /* 8D04C 8009D04C 21280002 */   addu      $a1, $s0, $zero
    /* 8D050 8009D050 FF004230 */  andi       $v0, $v0, 0xFF
    /* 8D054 8009D054 03004010 */  beqz       $v0, .L8009D064
    /* 8D058 8009D058 33000424 */   addiu     $a0, $zero, 0x33
  .L8009D05C:
    /* 8D05C 8009D05C C6F5000C */  jal        PlaySFX__Fi
    /* 8D060 8009D060 00000000 */   nop
  .L8009D064:
    /* 8D064 8009D064 01000224 */  addiu      $v0, $zero, 0x1
  .L8009D068:
    /* 8D068 8009D068 2400BF8F */  lw         $ra, 0x24($sp)
    /* 8D06C 8009D06C 2000B28F */  lw         $s2, 0x20($sp)
    /* 8D070 8009D070 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8D074 8009D074 1800B08F */  lw         $s0, 0x18($sp)
    /* 8D078 8009D078 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8D07C 8009D07C 0800E003 */  jr         $ra
    /* 8D080 8009D080 00000000 */   nop
endlabel main_ctrl_setup__Fv
