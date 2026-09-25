.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CentrePad__Fv, 0x244

glabel CentrePad__Fv
    /* 99C68 800A9C68 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 99C6C 800A9C6C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 99C70 800A9C70 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 99C74 800A9C74 1800B2AF */  sw         $s2, 0x18($sp)
    /* 99C78 800A9C78 1400B1AF */  sw         $s1, 0x14($sp)
    /* 99C7C 800A9C7C 5B10020C */  jal        VID_GetXOff__Fv
    /* 99C80 800A9C80 1000B0AF */   sw        $s0, 0x10($sp)
    /* 99C84 800A9C84 781F82AF */  sw         $v0, %gp_rel(D_8011C6F8)($gp)
    /* 99C88 800A9C88 5E10020C */  jal        VID_GetYOff__Fv
    /* 99C8C 800A9C8C 00000000 */   nop
    /* 99C90 800A9C90 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 99C94 800A9C94 7C1F82AF */  sw         $v0, %gp_rel(D_8011C6FC)($gp)
    /* 99C98 800A9C98 FD25020C */  jal        PAD_GetPad__FiUc
    /* 99C9C 800A9C9C 21280000 */   addu      $a1, $zero, $zero
    /* 99CA0 800A9CA0 1280033C */  lui        $v1, %hi(FeFlag)
    /* 99CA4 800A9CA4 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 99CA8 800A9CA8 00000000 */  nop
    /* 99CAC 800A9CAC 04006010 */  beqz       $v1, .L800A9CC0
    /* 99CB0 800A9CB0 21804000 */   addu      $s0, $v0, $zero
    /* 99CB4 800A9CB4 21200002 */  addu       $a0, $s0, $zero
    /* 99CB8 800A9CB8 32A70208 */  j          .L800A9CC8
    /* 99CBC 800A9CBC 0A000524 */   addiu     $a1, $zero, 0xA
  .L800A9CC0:
    /* 99CC0 800A9CC0 21200002 */  addu       $a0, $s0, $zero
    /* 99CC4 800A9CC4 03000524 */  addiu      $a1, $zero, 0x3
  .L800A9CC8:
    /* 99CC8 800A9CC8 6BAD020C */  jal        SetPadTick__4CPadUs_800ab5ac
    /* 99CCC 800A9CCC 00000000 */   nop
    /* 99CD0 800A9CD0 21200002 */  addu       $a0, $s0, $zero
    /* 99CD4 800A9CD4 69AD020C */  jal        SetPadTickMask__4CPadUs_800ab5a4
    /* 99CD8 800A9CD8 0F000524 */   addiu     $a1, $zero, 0xF
    /* 99CDC 800A9CDC BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99CE0 800A9CE0 781F918F */  lw         $s1, %gp_rel(D_8011C6F8)($gp)
    /* 99CE4 800A9CE4 7C1F928F */  lw         $s2, %gp_rel(D_8011C6FC)($gp)
    /* 99CE8 800A9CE8 C0100200 */  sll        $v0, $v0, 3
    /* 99CEC 800A9CEC 0D80013C */  lui        $at, %hi(MenuList + 0x4)
    /* 99CF0 800A9CF0 21082200 */  addu       $at, $at, $v0
    /* 99CF4 800A9CF4 44D2338C */  lw         $s3, %lo(MenuList + 0x4)($at)
    /* 99CF8 800A9CF8 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 99CFC 800A9CFC 21200002 */   addu      $a0, $s0, $zero
    /* 99D00 800A9D00 01004230 */  andi       $v0, $v0, 0x1
    /* 99D04 800A9D04 07004010 */  beqz       $v0, .L800A9D24
    /* 99D08 800A9D08 00000000 */   nop
    /* 99D0C 800A9D0C 7C1F838F */  lw         $v1, %gp_rel(D_8011C6FC)($gp)
    /* 99D10 800A9D10 00000000 */  nop
    /* 99D14 800A9D14 FEFF6228 */  slti       $v0, $v1, -0x2
    /* 99D18 800A9D18 02004014 */  bnez       $v0, .L800A9D24
    /* 99D1C 800A9D1C FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 99D20 800A9D20 7C1F82AF */  sw         $v0, %gp_rel(D_8011C6FC)($gp)
  .L800A9D24:
    /* 99D24 800A9D24 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 99D28 800A9D28 21200002 */   addu      $a0, $s0, $zero
    /* 99D2C 800A9D2C 02004230 */  andi       $v0, $v0, 0x2
    /* 99D30 800A9D30 07004010 */  beqz       $v0, .L800A9D50
    /* 99D34 800A9D34 00000000 */   nop
    /* 99D38 800A9D38 7C1F838F */  lw         $v1, %gp_rel(D_8011C6FC)($gp)
    /* 99D3C 800A9D3C 00000000 */  nop
    /* 99D40 800A9D40 03006228 */  slti       $v0, $v1, 0x3
    /* 99D44 800A9D44 02004010 */  beqz       $v0, .L800A9D50
    /* 99D48 800A9D48 01006224 */   addiu     $v0, $v1, 0x1
    /* 99D4C 800A9D4C 7C1F82AF */  sw         $v0, %gp_rel(D_8011C6FC)($gp)
  .L800A9D50:
    /* 99D50 800A9D50 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 99D54 800A9D54 21200002 */   addu      $a0, $s0, $zero
    /* 99D58 800A9D58 04004230 */  andi       $v0, $v0, 0x4
    /* 99D5C 800A9D5C 07004010 */  beqz       $v0, .L800A9D7C
    /* 99D60 800A9D60 00000000 */   nop
    /* 99D64 800A9D64 781F838F */  lw         $v1, %gp_rel(D_8011C6F8)($gp)
    /* 99D68 800A9D68 00000000 */  nop
    /* 99D6C 800A9D6C FEFF6228 */  slti       $v0, $v1, -0x2
    /* 99D70 800A9D70 02004014 */  bnez       $v0, .L800A9D7C
    /* 99D74 800A9D74 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 99D78 800A9D78 781F82AF */  sw         $v0, %gp_rel(D_8011C6F8)($gp)
  .L800A9D7C:
    /* 99D7C 800A9D7C 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 99D80 800A9D80 21200002 */   addu      $a0, $s0, $zero
    /* 99D84 800A9D84 08004230 */  andi       $v0, $v0, 0x8
    /* 99D88 800A9D88 07004010 */  beqz       $v0, .L800A9DA8
    /* 99D8C 800A9D8C 00000000 */   nop
    /* 99D90 800A9D90 781F838F */  lw         $v1, %gp_rel(D_8011C6F8)($gp)
    /* 99D94 800A9D94 00000000 */  nop
    /* 99D98 800A9D98 03006228 */  slti       $v0, $v1, 0x3
    /* 99D9C 800A9D9C 02004010 */  beqz       $v0, .L800A9DA8
    /* 99DA0 800A9DA0 01006224 */   addiu     $v0, $v1, 0x1
    /* 99DA4 800A9DA4 781F82AF */  sw         $v0, %gp_rel(D_8011C6F8)($gp)
  .L800A9DA8:
    /* 99DA8 800A9DA8 781F828F */  lw         $v0, %gp_rel(D_8011C6F8)($gp)
    /* 99DAC 800A9DAC 00000000 */  nop
    /* 99DB0 800A9DB0 05005114 */  bne        $v0, $s1, .L800A9DC8
    /* 99DB4 800A9DB4 00000000 */   nop
    /* 99DB8 800A9DB8 7C1F828F */  lw         $v0, %gp_rel(D_8011C6FC)($gp)
    /* 99DBC 800A9DBC 00000000 */  nop
    /* 99DC0 800A9DC0 03005210 */  beq        $v0, $s2, .L800A9DD0
    /* 99DC4 800A9DC4 00000000 */   nop
  .L800A9DC8:
    /* 99DC8 800A9DC8 C6F5000C */  jal        PlaySFX__Fi
    /* 99DCC 800A9DCC 32000424 */   addiu     $a0, $zero, 0x32
  .L800A9DD0:
    /* 99DD0 800A9DD0 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 99DD4 800A9DD4 21200002 */   addu      $a0, $s0, $zero
    /* 99DD8 800A9DD8 80004230 */  andi       $v0, $v0, 0x80
    /* 99DDC 800A9DDC 05004010 */  beqz       $v0, .L800A9DF4
    /* 99DE0 800A9DE0 00000000 */   nop
    /* 99DE4 800A9DE4 C6F5000C */  jal        PlaySFX__Fi
    /* 99DE8 800A9DE8 33000424 */   addiu     $a0, $zero, 0x33
    /* 99DEC 800A9DEC 781F80AF */  sw         $zero, %gp_rel(D_8011C6F8)($gp)
    /* 99DF0 800A9DF0 7C1F80AF */  sw         $zero, %gp_rel(D_8011C6FC)($gp)
  .L800A9DF4:
    /* 99DF4 800A9DF4 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 99DF8 800A9DF8 21200002 */   addu      $a0, $s0, $zero
    /* 99DFC 800A9DFC 00014230 */  andi       $v0, $v0, 0x100
    /* 99E00 800A9E00 1C004010 */  beqz       $v0, .L800A9E74
    /* 99E04 800A9E04 00000000 */   nop
    /* 99E08 800A9E08 801F8293 */  lbu        $v0, %gp_rel(D_8011C700)($gp)
    /* 99E0C 800A9E0C 00000000 */  nop
    /* 99E10 800A9E10 18004014 */  bnez       $v0, .L800A9E74
    /* 99E14 800A9E14 00000000 */   nop
    /* 99E18 800A9E18 C6F5000C */  jal        PlaySFX__Fi
    /* 99E1C 800A9E1C 33000424 */   addiu     $a0, $zero, 0x33
    /* 99E20 800A9E20 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 99E24 800A9E24 00000000 */  nop
    /* 99E28 800A9E28 C0100200 */  sll        $v0, $v0, 3
    /* 99E2C 800A9E2C 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 99E30 800A9E30 21082200 */  addu       $at, $at, $v0
    /* 99E34 800A9E34 43D22390 */  lbu        $v1, %lo(MenuList + 0x3)($at)
    /* 99E38 800A9E38 00000000 */  nop
    /* 99E3C 800A9E3C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 99E40 800A9E40 40100300 */  sll        $v0, $v1, 1
    /* 99E44 800A9E44 21104300 */  addu       $v0, $v0, $v1
    /* 99E48 800A9E48 C0100200 */  sll        $v0, $v0, 3
    /* 99E4C 800A9E4C 21105300 */  addu       $v0, $v0, $s3
    /* 99E50 800A9E50 1400448C */  lw         $a0, 0x14($v0)
    /* 99E54 800A9E54 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 99E58 800A9E58 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 99E5C 800A9E5C 05008210 */  beq        $a0, $v0, .L800A9E74
    /* 99E60 800A9E60 FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 99E64 800A9E64 B40A838F */  lw         $v1, %gp_rel(D_8011B234)($gp)
    /* 99E68 800A9E68 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 99E6C 800A9E6C 801F80A3 */  sb         $zero, %gp_rel(D_8011C700)($gp)
    /* 99E70 800A9E70 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
  .L800A9E74:
    /* 99E74 800A9E74 F511020C */  jal        DaveCentreStuff__Fv
    /* 99E78 800A9E78 00000000 */   nop
    /* 99E7C 800A9E7C 781F848F */  lw         $a0, %gp_rel(D_8011C6F8)($gp)
    /* 99E80 800A9E80 7C1F858F */  lw         $a1, %gp_rel(D_8011C6FC)($gp)
    /* 99E84 800A9E84 5710020C */  jal        VID_SetXYOff__Fii
    /* 99E88 800A9E88 00000000 */   nop
    /* 99E8C 800A9E8C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 99E90 800A9E90 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 99E94 800A9E94 1800B28F */  lw         $s2, 0x18($sp)
    /* 99E98 800A9E98 1400B18F */  lw         $s1, 0x14($sp)
    /* 99E9C 800A9E9C 1000B08F */  lw         $s0, 0x10($sp)
    /* 99EA0 800A9EA0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 99EA4 800A9EA4 0800E003 */  jr         $ra
    /* 99EA8 800A9EA8 00000000 */   nop
endlabel CentrePad__Fv
