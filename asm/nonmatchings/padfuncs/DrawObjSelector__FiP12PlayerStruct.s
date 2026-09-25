.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawObjSelector__FiP12PlayerStruct, 0x808

glabel DrawObjSelector__FiP12PlayerStruct
    /* 92B64 800A2B64 E8FEBD27 */  addiu      $sp, $sp, -0x118
    /* 92B68 800A2B68 0001B4AF */  sw         $s4, 0x100($sp)
    /* 92B6C 800A2B6C 21A08000 */  addu       $s4, $a0, $zero
    /* 92B70 800A2B70 0401B5AF */  sw         $s5, 0x104($sp)
    /* 92B74 800A2B74 21A8A000 */  addu       $s5, $a1, $zero
    /* 92B78 800A2B78 21280000 */  addu       $a1, $zero, $zero
    /* 92B7C 800A2B7C 1401BFAF */  sw         $ra, 0x114($sp)
    /* 92B80 800A2B80 1001BEAF */  sw         $fp, 0x110($sp)
    /* 92B84 800A2B84 0C01B7AF */  sw         $s7, 0x10C($sp)
    /* 92B88 800A2B88 0801B6AF */  sw         $s6, 0x108($sp)
    /* 92B8C 800A2B8C FC00B3AF */  sw         $s3, 0xFC($sp)
    /* 92B90 800A2B90 F800B2AF */  sw         $s2, 0xF8($sp)
    /* 92B94 800A2B94 F400B1AF */  sw         $s1, 0xF4($sp)
    /* 92B98 800A2B98 FD25020C */  jal        PAD_GetPad__FiUc
    /* 92B9C 800A2B9C F000B0AF */   sw        $s0, 0xF0($sp)
    /* 92BA0 800A2BA0 21804000 */  addu       $s0, $v0, $zero
    /* 92BA4 800A2BA4 CD90020C */  jal        GetDown__C4CPad_800a4334
    /* 92BA8 800A2BA8 21200002 */   addu      $a0, $s0, $zero
    /* 92BAC 800A2BAC 21200002 */  addu       $a0, $s0, $zero
    /* 92BB0 800A2BB0 D790020C */  jal        GetCur__C4CPad_800a435c
    /* 92BB4 800A2BB4 FFFF5030 */   andi      $s0, $v0, 0xFFFF
    /* 92BB8 800A2BB8 02000624 */  addiu      $a2, $zero, 0x2
    /* 92BBC 800A2BBC 1280033C */  lui        $v1, %hi(sel_data)
    /* 92BC0 800A2BC0 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 92BC4 800A2BC4 3000A486 */  lh         $a0, 0x30($s5)
    /* 92BC8 800A2BC8 3200A586 */  lh         $a1, 0x32($s5)
    /* 92BCC 800A2BCC 01000724 */  addiu      $a3, $zero, 0x1
    /* 92BD0 800A2BD0 1000B4AF */  sw         $s4, 0x10($sp)
    /* 92BD4 800A2BD4 00110300 */  sll        $v0, $v1, 4
    /* 92BD8 800A2BD8 23104300 */  subu       $v0, $v0, $v1
    /* 92BDC 800A2BDC 40100200 */  sll        $v0, $v0, 1
    /* 92BE0 800A2BE0 0E80033C */  lui        $v1, %hi(_pfind_list)
    /* 92BE4 800A2BE4 A8386324 */  addiu      $v1, $v1, %lo(_pfind_list)
    /* 92BE8 800A2BE8 21104300 */  addu       $v0, $v0, $v1
    /* 92BEC 800A2BEC A78E020C */  jal        CheckArea__FiiiUci
    /* 92BF0 800A2BF0 B800A2AF */   sw        $v0, 0xB8($sp)
    /* 92BF4 800A2BF4 1280023C */  lui        $v0, %hi(sel_data)
    /* 92BF8 800A2BF8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 92BFC 800A2BFC 1280013C */  lui        $at, %hi(_pfind_index)
    /* 92C00 800A2C00 21082200 */  addu       $at, $at, $v0
    /* 92C04 800A2C04 DCBB2280 */  lb         $v0, %lo(_pfind_index)($at)
    /* 92C08 800A2C08 00000000 */  nop
    /* 92C0C 800A2C0C 04004014 */  bnez       $v0, .L800A2C20
    /* 92C10 800A2C10 FA001624 */   addiu     $s6, $zero, 0xFA
    /* 92C14 800A2C14 9D0980A3 */  sb         $zero, %gp_rel(select_flag)($gp)
    /* 92C18 800A2C18 CE8C0208 */  j          .L800A3338
    /* 92C1C 800A2C1C 00000000 */   nop
  .L800A2C20:
    /* 92C20 800A2C20 21904000 */  addu       $s2, $v0, $zero
    /* 92C24 800A2C24 02000232 */  andi       $v0, $s0, 0x2
    /* 92C28 800A2C28 0D004010 */  beqz       $v0, .L800A2C60
    /* 92C2C 800A2C2C 01000232 */   andi      $v0, $s0, 0x1
    /* 92C30 800A2C30 C6F5000C */  jal        PlaySFX__Fi
    /* 92C34 800A2C34 32000424 */   addiu     $a0, $zero, 0x32
    /* 92C38 800A2C38 681F8293 */  lbu        $v0, %gp_rel(D_8011C6E8)($gp)
    /* 92C3C 800A2C3C 00000000 */  nop
    /* 92C40 800A2C40 01004224 */  addiu      $v0, $v0, 0x1
    /* 92C44 800A2C44 00160200 */  sll        $v0, $v0, 24
    /* 92C48 800A2C48 03160200 */  sra        $v0, $v0, 24
    /* 92C4C 800A2C4C 1A005200 */  div        $zero, $v0, $s2
    /* 92C50 800A2C50 10180000 */  mfhi       $v1
    /* 92C54 800A2C54 00000000 */  nop
    /* 92C58 800A2C58 681F83A3 */  sb         $v1, %gp_rel(D_8011C6E8)($gp)
    /* 92C5C 800A2C5C 01000232 */  andi       $v0, $s0, 0x1
  .L800A2C60:
    /* 92C60 800A2C60 0B004010 */  beqz       $v0, .L800A2C90
    /* 92C64 800A2C64 00000000 */   nop
    /* 92C68 800A2C68 C6F5000C */  jal        PlaySFX__Fi
    /* 92C6C 800A2C6C 32000424 */   addiu     $a0, $zero, 0x32
    /* 92C70 800A2C70 681F8293 */  lbu        $v0, %gp_rel(D_8011C6E8)($gp)
    /* 92C74 800A2C74 00000000 */  nop
    /* 92C78 800A2C78 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 92C7C 800A2C7C 00160300 */  sll        $v0, $v1, 24
    /* 92C80 800A2C80 681F83A3 */  sb         $v1, %gp_rel(D_8011C6E8)($gp)
    /* 92C84 800A2C84 02004104 */  bgez       $v0, .L800A2C90
    /* 92C88 800A2C88 21107200 */   addu      $v0, $v1, $s2
    /* 92C8C 800A2C8C 681F82A3 */  sb         $v0, %gp_rel(D_8011C6E8)($gp)
  .L800A2C90:
    /* 92C90 800A2C90 681F8283 */  lb         $v0, %gp_rel(D_8011C6E8)($gp)
    /* 92C94 800A2C94 1280043C */  lui        $a0, %hi(sel_data)
    /* 92C98 800A2C98 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 92C9C 800A2C9C 40180200 */  sll        $v1, $v0, 1
    /* 92CA0 800A2CA0 21186200 */  addu       $v1, $v1, $v0
    /* 92CA4 800A2CA4 00110400 */  sll        $v0, $a0, 4
    /* 92CA8 800A2CA8 23104400 */  subu       $v0, $v0, $a0
    /* 92CAC 800A2CAC 40100200 */  sll        $v0, $v0, 1
    /* 92CB0 800A2CB0 21186200 */  addu       $v1, $v1, $v0
    /* 92CB4 800A2CB4 0E80013C */  lui        $at, %hi(_pfind_list)
    /* 92CB8 800A2CB8 21082300 */  addu       $at, $at, $v1
    /* 92CBC 800A2CBC A8382290 */  lbu        $v0, %lo(_pfind_list)($at)
    /* 92CC0 800A2CC0 1280133C */  lui        $s3, %hi(_pcursitem)
    /* 92CC4 800A2CC4 64B77326 */  addiu      $s3, $s3, %lo(_pcursitem)
    /* 92CC8 800A2CC8 1280013C */  lui        $at, %hi(_pcursitem)
    /* 92CCC 800A2CCC 21082400 */  addu       $at, $at, $a0
    /* 92CD0 800A2CD0 64B722A0 */  sb         $v0, %lo(_pcursitem)($at)
    /* 92CD4 800A2CD4 00010232 */  andi       $v0, $s0, 0x100
    /* 92CD8 800A2CD8 06004010 */  beqz       $v0, .L800A2CF4
    /* 92CDC 800A2CDC 40000232 */   andi      $v0, $s0, 0x40
    /* 92CE0 800A2CE0 C6F5000C */  jal        PlaySFX__Fi
    /* 92CE4 800A2CE4 33000424 */   addiu     $a0, $zero, 0x33
    /* 92CE8 800A2CE8 9D0980A3 */  sb         $zero, %gp_rel(select_flag)($gp)
    /* 92CEC 800A2CEC CE8C0208 */  j          .L800A3338
    /* 92CF0 800A2CF0 00000000 */   nop
  .L800A2CF4:
    /* 92CF4 800A2CF4 39004010 */  beqz       $v0, .L800A2DDC
    /* 92CF8 800A2CF8 00000000 */   nop
    /* 92CFC 800A2CFC C6F5000C */  jal        PlaySFX__Fi
    /* 92D00 800A2D00 33000424 */   addiu     $a0, $zero, 0x33
    /* 92D04 800A2D04 681F8283 */  lb         $v0, %gp_rel(D_8011C6E8)($gp)
    /* 92D08 800A2D08 4200A582 */  lb         $a1, 0x42($s5)
    /* 92D0C 800A2D0C 1280063C */  lui        $a2, %hi(sel_data)
    /* 92D10 800A2D10 2CB7C68C */  lw         $a2, %lo(sel_data)($a2)
    /* 92D14 800A2D14 40180200 */  sll        $v1, $v0, 1
    /* 92D18 800A2D18 21186200 */  addu       $v1, $v1, $v0
    /* 92D1C 800A2D1C 00110600 */  sll        $v0, $a2, 4
    /* 92D20 800A2D20 23104600 */  subu       $v0, $v0, $a2
    /* 92D24 800A2D24 40100200 */  sll        $v0, $v0, 1
    /* 92D28 800A2D28 21186200 */  addu       $v1, $v1, $v0
    /* 92D2C 800A2D2C 0E80013C */  lui        $at, %hi(_pfind_list + 0x1)
    /* 92D30 800A2D30 21082300 */  addu       $at, $at, $v1
    /* 92D34 800A2D34 A9383080 */  lb         $s0, %lo(_pfind_list + 0x1)($at)
    /* 92D38 800A2D38 0E80013C */  lui        $at, %hi(_pfind_list + 0x2)
    /* 92D3C 800A2D3C 21082300 */  addu       $at, $at, $v1
    /* 92D40 800A2D40 AA383180 */  lb         $s1, %lo(_pfind_list + 0x2)($at)
    /* 92D44 800A2D44 299B010C */  jal        StartStand__Fii
    /* 92D48 800A2D48 21208002 */   addu      $a0, $s4, $zero
    /* 92D4C 800A2D4C 1280023C */  lui        $v0, %hi(sel_data)
    /* 92D50 800A2D50 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 92D54 800A2D54 00000000 */  nop
    /* 92D58 800A2D58 21105300 */  addu       $v0, $v0, $s3
    /* 92D5C 800A2D5C 00004280 */  lb         $v0, 0x0($v0)
    /* 92D60 800A2D60 2120A002 */  addu       $a0, $s5, $zero
    /* 92D64 800A2D64 C0280200 */  sll        $a1, $v0, 3
    /* 92D68 800A2D68 2328A200 */  subu       $a1, $a1, $v0
    /* 92D6C 800A2D6C 80280500 */  sll        $a1, $a1, 2
    /* 92D70 800A2D70 2328A200 */  subu       $a1, $a1, $v0
    /* 92D74 800A2D74 80280500 */  sll        $a1, $a1, 2
    /* 92D78 800A2D78 0D80023C */  lui        $v0, %hi(item)
    /* 92D7C 800A2D7C 541D4224 */  addiu      $v0, $v0, %lo(item)
    /* 92D80 800A2D80 CAFD000C */  jal        SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 92D84 800A2D84 2128A200 */   addu      $a1, $a1, $v0
    /* 92D88 800A2D88 01000424 */  addiu      $a0, $zero, 0x1
    /* 92D8C 800A2D8C 2A000524 */  addiu      $a1, $zero, 0x2A
    /* 92D90 800A2D90 1280023C */  lui        $v0, %hi(sel_data)
    /* 92D94 800A2D94 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 92D98 800A2D98 FF000632 */  andi       $a2, $s0, 0xFF
    /* 92D9C 800A2D9C 21105300 */  addu       $v0, $v0, $s3
    /* 92DA0 800A2DA0 00004290 */  lbu        $v0, 0x0($v0)
    /* 92DA4 800A2DA4 FF002732 */  andi       $a3, $s1, 0xFF
    /* 92DA8 800A2DA8 00160200 */  sll        $v0, $v0, 24
    /* 92DAC 800A2DAC 03160200 */  sra        $v0, $v0, 24
    /* 92DB0 800A2DB0 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 92DB4 800A2DB4 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 92DB8 800A2DB8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 92DBC 800A2DBC 239C010C */  jal        CheckNewPath__Fi
    /* 92DC0 800A2DC0 21208002 */   addu      $a0, $s4, $zero
    /* 92DC4 800A2DC4 681F8283 */  lb         $v0, %gp_rel(D_8011C6E8)($gp)
    /* 92DC8 800A2DC8 FFFF5226 */  addiu      $s2, $s2, -0x1
    /* 92DCC 800A2DCC 2A105200 */  slt        $v0, $v0, $s2
    /* 92DD0 800A2DD0 02004014 */  bnez       $v0, .L800A2DDC
    /* 92DD4 800A2DD4 FFFF4226 */   addiu     $v0, $s2, -0x1
    /* 92DD8 800A2DD8 681F82A3 */  sb         $v0, %gp_rel(D_8011C6E8)($gp)
  .L800A2DDC:
    /* 92DDC 800A2DDC 09004016 */  bnez       $s2, .L800A2E04
    /* 92DE0 800A2DE0 00000000 */   nop
    /* 92DE4 800A2DE4 1280023C */  lui        $v0, %hi(sel_data)
    /* 92DE8 800A2DE8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 92DEC 800A2DEC 1280013C */  lui        $at, %hi(_pfind_index)
    /* 92DF0 800A2DF0 21082200 */  addu       $at, $at, $v0
    /* 92DF4 800A2DF4 DCBB20A0 */  sb         $zero, %lo(_pfind_index)($at)
    /* 92DF8 800A2DF8 9D0980A3 */  sb         $zero, %gp_rel(select_flag)($gp)
    /* 92DFC 800A2DFC CE8C0208 */  j          .L800A3338
    /* 92E00 800A2E00 00000000 */   nop
  .L800A2E04:
    /* 92E04 800A2E04 1280103C */  lui        $s0, %hi(D_8011D040)
    /* 92E08 800A2E08 40D01026 */  addiu      $s0, $s0, %lo(D_8011D040)
    /* 92E0C 800A2E0C 21200002 */  addu       $a0, $s0, $zero
    /* 92E10 800A2E10 9A90020C */  jal        SetBack__6Dialogi_800a4268
    /* 92E14 800A2E14 94000524 */   addiu     $a1, $zero, 0x94
    /* 92E18 800A2E18 21200002 */  addu       $a0, $s0, $zero
    /* 92E1C 800A2E1C 9C90020C */  jal        SetBorder__6Dialogi_800a4270
    /* 92E20 800A2E20 12000524 */   addiu     $a1, $zero, 0x12
    /* 92E24 800A2E24 21200002 */  addu       $a0, $s0, $zero
    /* 92E28 800A2E28 21800000 */  addu       $s0, $zero, $zero
    /* 92E2C 800A2E2C 1280053C */  lui        $a1, %hi(BACKR)
    /* 92E30 800A2E30 FAABA590 */  lbu        $a1, %lo(BACKR)($a1)
    /* 92E34 800A2E34 1280063C */  lui        $a2, %hi(BACKG)
    /* 92E38 800A2E38 FBABC690 */  lbu        $a2, %lo(BACKG)($a2)
    /* 92E3C 800A2E3C 1280073C */  lui        $a3, %hi(BACKB)
    /* 92E40 800A2E40 FCABE790 */  lbu        $a3, %lo(BACKB)($a3)
    /* 92E44 800A2E44 9290020C */  jal        SetRGB__6DialogUcUcUc_800a4248
    /* 92E48 800A2E48 21A00000 */   addu      $s4, $zero, $zero
    /* 92E4C 800A2E4C 40181200 */  sll        $v1, $s2, 1
    /* 92E50 800A2E50 21187200 */  addu       $v1, $v1, $s2
    /* 92E54 800A2E54 80180300 */  sll        $v1, $v1, 2
    /* 92E58 800A2E58 A4000224 */  addiu      $v0, $zero, 0xA4
    /* 92E5C 800A2E5C 23104300 */  subu       $v0, $v0, $v1
    /* 92E60 800A2E60 43100200 */  sra        $v0, $v0, 1
    /* 92E64 800A2E64 20004224 */  addiu      $v0, $v0, 0x20
    /* 92E68 800A2E68 0C006324 */  addiu      $v1, $v1, 0xC
    /* 92E6C 800A2E6C 601F80A7 */  sh         $zero, %gp_rel(D_8011C6E0)($gp)
    /* 92E70 800A2E70 621F82A7 */  sh         $v0, %gp_rel(D_8011C6E2)($gp)
    /* 92E74 800A2E74 641F96A7 */  sh         $s6, %gp_rel(D_8011C6E4)($gp)
    /* 92E78 800A2E78 661F83A7 */  sh         $v1, %gp_rel(D_8011C6E6)($gp)
    /* 92E7C 800A2E7C 2500401A */  blez       $s2, .L800A2F14
    /* 92E80 800A2E80 00000000 */   nop
    /* 92E84 800A2E84 21880000 */  addu       $s1, $zero, $zero
  .L800A2E88:
    /* 92E88 800A2E88 1280033C */  lui        $v1, %hi(sel_data)
    /* 92E8C 800A2E8C 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 92E90 800A2E90 00000000 */  nop
    /* 92E94 800A2E94 00110300 */  sll        $v0, $v1, 4
    /* 92E98 800A2E98 23104300 */  subu       $v0, $v0, $v1
    /* 92E9C 800A2E9C 40100200 */  sll        $v0, $v0, 1
    /* 92EA0 800A2EA0 21102202 */  addu       $v0, $s1, $v0
    /* 92EA4 800A2EA4 0E80013C */  lui        $at, %hi(_pfind_list)
    /* 92EA8 800A2EA8 21082200 */  addu       $at, $at, $v0
    /* 92EAC 800A2EAC A8382480 */  lb         $a0, %lo(_pfind_list)($at)
    /* 92EB0 800A2EB0 DE16010C */  jal        GetItemStr__Fi
    /* 92EB4 800A2EB4 00000000 */   nop
    /* 92EB8 800A2EB8 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 92EBC 800A2EBC D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 92EC0 800A2EC0 1280063C */  lui        $a2, %hi(D_8011C6E0)
    /* 92EC4 800A2EC4 E0C6C624 */  addiu      $a2, $a2, %lo(D_8011C6E0)
    /* 92EC8 800A2EC8 1280023C */  lui        $v0, %hi(sel_data)
    /* 92ECC 800A2ECC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 92ED0 800A2ED0 0D80053C */  lui        $a1, %hi(_infostr)
    /* 92ED4 800A2ED4 10E8A524 */  addiu      $a1, $a1, %lo(_infostr)
    /* 92ED8 800A2ED8 00120200 */  sll        $v0, $v0, 8
    /* 92EDC 800A2EDC B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 92EE0 800A2EE0 21284500 */   addu      $a1, $v0, $a1
    /* 92EE4 800A2EE4 21184000 */  addu       $v1, $v0, $zero
    /* 92EE8 800A2EE8 05006010 */  beqz       $v1, .L800A2F00
    /* 92EEC 800A2EEC 40100300 */   sll       $v0, $v1, 1
    /* 92EF0 800A2EF0 21104300 */  addu       $v0, $v0, $v1
    /* 92EF4 800A2EF4 80100200 */  sll        $v0, $v0, 2
    /* 92EF8 800A2EF8 C18B0208 */  j          .L800A2F04
    /* 92EFC 800A2EFC 21800202 */   addu      $s0, $s0, $v0
  .L800A2F00:
    /* 92F00 800A2F00 0C001026 */  addiu      $s0, $s0, 0xC
  .L800A2F04:
    /* 92F04 800A2F04 01009426 */  addiu      $s4, $s4, 0x1
    /* 92F08 800A2F08 2A109202 */  slt        $v0, $s4, $s2
    /* 92F0C 800A2F0C DEFF4014 */  bnez       $v0, .L800A2E88
    /* 92F10 800A2F10 03003126 */   addiu     $s1, $s1, 0x3
  .L800A2F14:
    /* 92F14 800A2F14 681F8383 */  lb         $v1, %gp_rel(D_8011C6E8)($gp)
    /* 92F18 800A2F18 00000000 */  nop
    /* 92F1C 800A2F1C 2A107200 */  slt        $v0, $v1, $s2
    /* 92F20 800A2F20 04004014 */  bnez       $v0, .L800A2F34
    /* 92F24 800A2F24 FFFF4226 */   addiu     $v0, $s2, -0x1
    /* 92F28 800A2F28 681F82A3 */  sb         $v0, %gp_rel(D_8011C6E8)($gp)
    /* 92F2C 800A2F2C D08B0208 */  j          .L800A2F40
    /* 92F30 800A2F30 00000000 */   nop
  .L800A2F34:
    /* 92F34 800A2F34 02006104 */  bgez       $v1, .L800A2F40
    /* 92F38 800A2F38 00000000 */   nop
    /* 92F3C 800A2F3C 681F80A3 */  sb         $zero, %gp_rel(D_8011C6E8)($gp)
  .L800A2F40:
    /* 92F40 800A2F40 1280113C */  lui        $s1, %hi(D_8011D040)
    /* 92F44 800A2F44 40D03126 */  addiu      $s1, $s1, %lo(D_8011D040)
    /* 92F48 800A2F48 21202002 */  addu       $a0, $s1, $zero
    /* 92F4C 800A2F4C 00010224 */  addiu      $v0, $zero, 0x100
    /* 92F50 800A2F50 23105600 */  subu       $v0, $v0, $s6
    /* 92F54 800A2F54 43100200 */  sra        $v0, $v0, 1
    /* 92F58 800A2F58 20004224 */  addiu      $v0, $v0, 0x20
    /* 92F5C 800A2F5C 0C001026 */  addiu      $s0, $s0, 0xC
    /* 92F60 800A2F60 D000A2AF */  sw         $v0, 0xD0($sp)
    /* 92F64 800A2F64 B0000224 */  addiu      $v0, $zero, 0xB0
    /* 92F68 800A2F68 23105000 */  subu       $v0, $v0, $s0
    /* 92F6C 800A2F6C C21F0200 */  srl        $v1, $v0, 31
    /* 92F70 800A2F70 21104300 */  addu       $v0, $v0, $v1
    /* 92F74 800A2F74 43100200 */  sra        $v0, $v0, 1
    /* 92F78 800A2F78 0A004624 */  addiu      $a2, $v0, 0xA
    /* 92F7C 800A2F7C 10000324 */  addiu      $v1, $zero, 0x10
    /* 92F80 800A2F80 661F83A7 */  sh         $v1, %gp_rel(D_8011C6E6)($gp)
    /* 92F84 800A2F84 10000324 */  addiu      $v1, $zero, 0x10
    /* 92F88 800A2F88 D000A58F */  lw         $a1, 0xD0($sp)
    /* 92F8C 800A2F8C D000A997 */  lhu        $t1, 0xD0($sp)
    /* 92F90 800A2F90 20004224 */  addiu      $v0, $v0, 0x20
    /* 92F94 800A2F94 621F86A7 */  sh         $a2, %gp_rel(D_8011C6E2)($gp)
    /* 92F98 800A2F98 641F96A7 */  sh         $s6, %gp_rel(D_8011C6E4)($gp)
    /* 92F9C 800A2F9C 1000A3AF */  sw         $v1, 0x10($sp)
    /* 92FA0 800A2FA0 D800A2AF */  sw         $v0, 0xD8($sp)
    /* 92FA4 800A2FA4 601F89A7 */  sh         $t1, %gp_rel(D_8011C6E0)($gp)
    /* 92FA8 800A2FA8 B82F020C */  jal        Back__6Dialogiiii
    /* 92FAC 800A2FAC 2138C002 */   addu      $a3, $s6, $zero
    /* 92FB0 800A2FB0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 92FB4 800A2FB4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 92FB8 800A2FB8 21280000 */  addu       $a1, $zero, $zero
    /* 92FBC 800A2FBC 0C000624 */  addiu      $a2, $zero, 0xC
    /* 92FC0 800A2FC0 D600A726 */  addiu      $a3, $s5, 0xD6
    /* 92FC4 800A2FC4 10001524 */  addiu      $s5, $zero, 0x10
    /* 92FC8 800A2FC8 21A00000 */  addu       $s4, $zero, $zero
    /* 92FCC 800A2FCC 21F08000 */  addu       $fp, $a0, $zero
    /* 92FD0 800A2FD0 01001724 */  addiu      $s7, $zero, 0x1
    /* 92FD4 800A2FD4 01000224 */  addiu      $v0, $zero, 0x1
    /* 92FD8 800A2FD8 1280083C */  lui        $t0, %hi(WHITER)
    /* 92FDC 800A2FDC D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 92FE0 800A2FE0 1280033C */  lui        $v1, %hi(WHITEG)
    /* 92FE4 800A2FE4 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 92FE8 800A2FE8 1280093C */  lui        $t1, %hi(D_8011C6E0)
    /* 92FEC 800A2FEC E0C62925 */  addiu      $t1, $t1, %lo(D_8011C6E0)
    /* 92FF0 800A2FF0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 92FF4 800A2FF4 1400A9AF */  sw         $t1, 0x14($sp)
    /* 92FF8 800A2FF8 1800A8AF */  sw         $t0, 0x18($sp)
    /* 92FFC 800A2FFC 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 93000 800A3000 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 93004 800A3004 2000A3AF */   sw        $v1, 0x20($sp)
    /* 93008 800A3008 21202002 */  addu       $a0, $s1, $zero
    /* 9300C 800A300C D000A58F */  lw         $a1, 0xD0($sp)
    /* 93010 800A3010 D800A68F */  lw         $a2, 0xD8($sp)
    /* 93014 800A3014 D000A997 */  lhu        $t1, 0xD0($sp)
    /* 93018 800A3018 D800A297 */  lhu        $v0, 0xD8($sp)
    /* 9301C 800A301C 641F96A7 */  sh         $s6, %gp_rel(D_8011C6E4)($gp)
    /* 93020 800A3020 661F90A7 */  sh         $s0, %gp_rel(D_8011C6E6)($gp)
    /* 93024 800A3024 1000B0AF */  sw         $s0, 0x10($sp)
    /* 93028 800A3028 601F89A7 */  sh         $t1, %gp_rel(D_8011C6E0)($gp)
    /* 9302C 800A302C 621F82A7 */  sh         $v0, %gp_rel(D_8011C6E2)($gp)
    /* 93030 800A3030 B82F020C */  jal        Back__6Dialogiiii
    /* 93034 800A3034 2138C002 */   addu      $a3, $s6, $zero
  .L800A3038:
    /* 93038 800A3038 1280033C */  lui        $v1, %hi(sel_data)
    /* 9303C 800A303C 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 93040 800A3040 1280013C */  lui        $at, %hi(_pfind_index)
    /* 93044 800A3044 21082300 */  addu       $at, $at, $v1
    /* 93048 800A3048 DCBB2280 */  lb         $v0, %lo(_pfind_index)($at)
    /* 9304C 800A304C 00000000 */  nop
    /* 93050 800A3050 2A108202 */  slt        $v0, $s4, $v0
    /* 93054 800A3054 B8004010 */  beqz       $v0, .L800A3338
    /* 93058 800A3058 00000000 */   nop
    /* 9305C 800A305C 1280013C */  lui        $at, %hi(_infoclr)
    /* 93060 800A3060 21082300 */  addu       $at, $at, $v1
    /* 93064 800A3064 BCB620A0 */  sb         $zero, %lo(_infoclr)($at)
    /* 93068 800A3068 B800A98F */  lw         $t1, 0xB8($sp)
    /* 9306C 800A306C 00000000 */  nop
    /* 93070 800A3070 00002481 */  lb         $a0, 0x0($t1)
    /* 93074 800A3074 DE16010C */  jal        GetItemStr__Fi
    /* 93078 800A3078 00000000 */   nop
    /* 9307C 800A307C 3800A427 */  addiu      $a0, $sp, 0x38
    /* 93080 800A3080 1280053C */  lui        $a1, %hi(sel_data)
    /* 93084 800A3084 2CB7A58C */  lw         $a1, %lo(sel_data)($a1)
    /* 93088 800A3088 0D80093C */  lui        $t1, %hi(_infostr)
    /* 9308C 800A308C 10E82925 */  addiu      $t1, $t1, %lo(_infostr)
    /* 93090 800A3090 002A0500 */  sll        $a1, $a1, 8
    /* 93094 800A3094 F240000C */  jal        strcpy
    /* 93098 800A3098 2128A900 */   addu      $a1, $a1, $t1
    /* 9309C 800A309C 681F8283 */  lb         $v0, %gp_rel(D_8011C6E8)($gp)
    /* 930A0 800A30A0 00000000 */  nop
    /* 930A4 800A30A4 49008216 */  bne        $s4, $v0, .L800A31CC
    /* 930A8 800A30A8 2120C003 */   addu      $a0, $fp, $zero
    /* 930AC 800A30AC A92A020C */  jal        GetStrWidth__5CFontPc
    /* 930B0 800A30B0 3800A527 */   addiu     $a1, $sp, 0x38
    /* 930B4 800A30B4 10005224 */  addiu      $s2, $v0, 0x10
    /* 930B8 800A30B8 2120C003 */  addu       $a0, $fp, $zero
    /* 930BC 800A30BC 1280053C */  lui        $a1, %hi(sel_data)
    /* 930C0 800A30C0 2CB7A58C */  lw         $a1, %lo(sel_data)($a1)
    /* 930C4 800A30C4 1280063C */  lui        $a2, %hi(D_8011C6E0)
    /* 930C8 800A30C8 E0C6C624 */  addiu      $a2, $a2, %lo(D_8011C6E0)
    /* 930CC 800A30CC 0D80093C */  lui        $t1, %hi(_infostr)
    /* 930D0 800A30D0 10E82925 */  addiu      $t1, $t1, %lo(_infostr)
    /* 930D4 800A30D4 002A0500 */  sll        $a1, $a1, 8
    /* 930D8 800A30D8 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 930DC 800A30DC 2128A900 */   addu      $a1, $a1, $t1
    /* 930E0 800A30E0 0B004010 */  beqz       $v0, .L800A3110
    /* 930E4 800A30E4 2120C003 */   addu      $a0, $fp, $zero
    /* 930E8 800A30E8 1280053C */  lui        $a1, %hi(sel_data)
    /* 930EC 800A30EC 2CB7A58C */  lw         $a1, %lo(sel_data)($a1)
    /* 930F0 800A30F0 1280063C */  lui        $a2, %hi(D_8011C6E0)
    /* 930F4 800A30F4 E0C6C624 */  addiu      $a2, $a2, %lo(D_8011C6E0)
    /* 930F8 800A30F8 0D80093C */  lui        $t1, %hi(_infostr)
    /* 930FC 800A30FC 10E82925 */  addiu      $t1, $t1, %lo(_infostr)
    /* 93100 800A3100 002A0500 */  sll        $a1, $a1, 8
    /* 93104 800A3104 4E2A020C */  jal        GetWrapWidth__5CFontPcP4RECT
    /* 93108 800A3108 2128A900 */   addu      $a1, $a1, $t1
    /* 9310C 800A310C 21904000 */  addu       $s2, $v0, $zero
  .L800A3110:
    /* 93110 800A3110 42881600 */  srl        $s1, $s6, 1
    /* 93114 800A3114 C2871200 */  srl        $s0, $s2, 31
    /* 93118 800A3118 21805002 */  addu       $s0, $s2, $s0
    /* 9311C 800A311C 43801000 */  sra        $s0, $s0, 1
    /* 93120 800A3120 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 93124 800A3124 40000724 */  addiu      $a3, $zero, 0x40
    /* 93128 800A3128 D000A98F */  lw         $t1, 0xD0($sp)
    /* 9312C 800A312C 08001224 */  addiu      $s2, $zero, 0x8
    /* 93130 800A3130 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 93134 800A3134 2000B7AF */  sw         $s7, 0x20($sp)
    /* 93138 800A3138 2800B7AF */  sw         $s7, 0x28($sp)
    /* 9313C 800A313C 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 93140 800A3140 3000B2AF */  sw         $s2, 0x30($sp)
    /* 93144 800A3144 21883101 */  addu       $s1, $t1, $s1
    /* 93148 800A3148 23203002 */  subu       $a0, $s1, $s0
    /* 9314C 800A314C D800A98F */  lw         $t1, 0xD8($sp)
    /* 93150 800A3150 F5FF8424 */  addiu      $a0, $a0, -0xB
    /* 93154 800A3154 2198A902 */  addu       $s3, $s5, $t1
    /* 93158 800A3158 21286002 */  addu       $a1, $s3, $zero
    /* 9315C 800A315C F0000924 */  addiu      $t1, $zero, 0xF0
    /* 93160 800A3160 1000A9AF */  sw         $t1, 0x10($sp)
    /* 93164 800A3164 20000924 */  addiu      $t1, $zero, 0x20
    /* 93168 800A3168 1400A9AF */  sw         $t1, 0x14($sp)
    /* 9316C 800A316C 40000924 */  addiu      $t1, $zero, 0x40
    /* 93170 800A3170 1800A9AF */  sw         $t1, 0x18($sp)
    /* 93174 800A3174 FFFF0934 */  ori        $t1, $zero, 0xFFFF
    /* 93178 800A3178 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 9317C 800A317C 2400A9AF */   sw        $t1, 0x24($sp)
    /* 93180 800A3180 21883002 */  addu       $s1, $s1, $s0
    /* 93184 800A3184 03002426 */  addiu      $a0, $s1, 0x3
    /* 93188 800A3188 21286002 */  addu       $a1, $s3, $zero
    /* 9318C 800A318C A0000624 */  addiu      $a2, $zero, 0xA0
    /* 93190 800A3190 40000724 */  addiu      $a3, $zero, 0x40
    /* 93194 800A3194 F0000924 */  addiu      $t1, $zero, 0xF0
    /* 93198 800A3198 1000A9AF */  sw         $t1, 0x10($sp)
    /* 9319C 800A319C 20000924 */  addiu      $t1, $zero, 0x20
    /* 931A0 800A31A0 1400A9AF */  sw         $t1, 0x14($sp)
    /* 931A4 800A31A4 40000924 */  addiu      $t1, $zero, 0x40
    /* 931A8 800A31A8 1800A9AF */  sw         $t1, 0x18($sp)
    /* 931AC 800A31AC FFFF0934 */  ori        $t1, $zero, 0xFFFF
    /* 931B0 800A31B0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 931B4 800A31B4 2000B7AF */  sw         $s7, 0x20($sp)
    /* 931B8 800A31B8 2400A9AF */  sw         $t1, 0x24($sp)
    /* 931BC 800A31BC 2800B7AF */  sw         $s7, 0x28($sp)
    /* 931C0 800A31C0 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 931C4 800A31C4 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 931C8 800A31C8 3000B2AF */   sw        $s2, 0x30($sp)
  .L800A31CC:
    /* 931CC 800A31CC 1280023C */  lui        $v0, %hi(sel_data)
    /* 931D0 800A31D0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 931D4 800A31D4 1280013C */  lui        $at, %hi(_infoclr)
    /* 931D8 800A31D8 21082200 */  addu       $at, $at, $v0
    /* 931DC 800A31DC BCB62380 */  lb         $v1, %lo(_infoclr)($at)
    /* 931E0 800A31E0 00000000 */  nop
    /* 931E4 800A31E4 1C007710 */  beq        $v1, $s7, .L800A3258
    /* 931E8 800A31E8 02006228 */   slti      $v0, $v1, 0x2
    /* 931EC 800A31EC 05004010 */  beqz       $v0, .L800A3204
    /* 931F0 800A31F0 00000000 */   nop
    /* 931F4 800A31F4 08006010 */  beqz       $v1, .L800A3218
    /* 931F8 800A31F8 00000000 */   nop
    /* 931FC 800A31FC 9E8C0208 */  j          .L800A3278
    /* 93200 800A3200 00000000 */   nop
  .L800A3204:
    /* 93204 800A3204 02000224 */  addiu      $v0, $zero, 0x2
    /* 93208 800A3208 0B006210 */  beq        $v1, $v0, .L800A3238
    /* 9320C 800A320C 00000000 */   nop
    /* 93210 800A3210 9E8C0208 */  j          .L800A3278
    /* 93214 800A3214 00000000 */   nop
  .L800A3218:
    /* 93218 800A3218 1280083C */  lui        $t0, %hi(WHITER)
    /* 9321C 800A321C D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 93220 800A3220 1280033C */  lui        $v1, %hi(WHITEG)
    /* 93224 800A3224 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 93228 800A3228 1280023C */  lui        $v0, %hi(WHITEB)
    /* 9322C 800A322C D3AB4290 */  lbu        $v0, %lo(WHITEB)($v0)
    /* 93230 800A3230 A58C0208 */  j          .L800A3294
    /* 93234 800A3234 2120C003 */   addu      $a0, $fp, $zero
  .L800A3238:
    /* 93238 800A3238 1280083C */  lui        $t0, %hi(REDR)
    /* 9323C 800A323C D7AB0891 */  lbu        $t0, %lo(REDR)($t0)
    /* 93240 800A3240 1280033C */  lui        $v1, %hi(REDG)
    /* 93244 800A3244 D8AB6390 */  lbu        $v1, %lo(REDG)($v1)
    /* 93248 800A3248 1280023C */  lui        $v0, %hi(REDB)
    /* 9324C 800A324C D9AB4290 */  lbu        $v0, %lo(REDB)($v0)
    /* 93250 800A3250 A58C0208 */  j          .L800A3294
    /* 93254 800A3254 2120C003 */   addu      $a0, $fp, $zero
  .L800A3258:
    /* 93258 800A3258 1280083C */  lui        $t0, %hi(BLUER)
    /* 9325C 800A325C D4AB0891 */  lbu        $t0, %lo(BLUER)($t0)
    /* 93260 800A3260 1280033C */  lui        $v1, %hi(BLUEG)
    /* 93264 800A3264 D5AB6390 */  lbu        $v1, %lo(BLUEG)($v1)
    /* 93268 800A3268 1280023C */  lui        $v0, %hi(BLUEB)
    /* 9326C 800A326C D6AB4290 */  lbu        $v0, %lo(BLUEB)($v0)
    /* 93270 800A3270 A58C0208 */  j          .L800A3294
    /* 93274 800A3274 2120C003 */   addu      $a0, $fp, $zero
  .L800A3278:
    /* 93278 800A3278 1280083C */  lui        $t0, %hi(GOLDR)
    /* 9327C 800A327C DAAB0891 */  lbu        $t0, %lo(GOLDR)($t0)
    /* 93280 800A3280 1280033C */  lui        $v1, %hi(GOLDG)
    /* 93284 800A3284 DBAB6390 */  lbu        $v1, %lo(GOLDG)($v1)
    /* 93288 800A3288 1280023C */  lui        $v0, %hi(GOLDB)
    /* 9328C 800A328C DCAB4290 */  lbu        $v0, %lo(GOLDB)($v0)
    /* 93290 800A3290 2120C003 */  addu       $a0, $fp, $zero
  .L800A3294:
    /* 93294 800A3294 21280000 */  addu       $a1, $zero, $zero
    /* 93298 800A3298 2130A002 */  addu       $a2, $s5, $zero
    /* 9329C 800A329C 3800A727 */  addiu      $a3, $sp, 0x38
    /* 932A0 800A32A0 1280093C */  lui        $t1, %hi(D_8011C6E0)
    /* 932A4 800A32A4 E0C62925 */  addiu      $t1, $t1, %lo(D_8011C6E0)
    /* 932A8 800A32A8 1000B7AF */  sw         $s7, 0x10($sp)
    /* 932AC 800A32AC 1400A9AF */  sw         $t1, 0x14($sp)
    /* 932B0 800A32B0 1800A8AF */  sw         $t0, 0x18($sp)
    /* 932B4 800A32B4 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 932B8 800A32B8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 932BC 800A32BC 2000A2AF */   sw        $v0, 0x20($sp)
    /* 932C0 800A32C0 2120C003 */  addu       $a0, $fp, $zero
    /* 932C4 800A32C4 1280063C */  lui        $a2, %hi(D_8011C6E0)
    /* 932C8 800A32C8 E0C6C624 */  addiu      $a2, $a2, %lo(D_8011C6E0)
    /* 932CC 800A32CC 01009426 */  addiu      $s4, $s4, 0x1
    /* 932D0 800A32D0 B800A98F */  lw         $t1, 0xB8($sp)
    /* 932D4 800A32D4 1280053C */  lui        $a1, %hi(sel_data)
    /* 932D8 800A32D8 2CB7A58C */  lw         $a1, %lo(sel_data)($a1)
    /* 932DC 800A32DC 03002925 */  addiu      $t1, $t1, 0x3
    /* 932E0 800A32E0 002A0500 */  sll        $a1, $a1, 8
    /* 932E4 800A32E4 B800A9AF */  sw         $t1, 0xB8($sp)
    /* 932E8 800A32E8 0D80093C */  lui        $t1, %hi(_infostr)
    /* 932EC 800A32EC 10E82925 */  addiu      $t1, $t1, %lo(_infostr)
    /* 932F0 800A32F0 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 932F4 800A32F4 2128A900 */   addu      $a1, $a1, $t1
    /* 932F8 800A32F8 40180200 */  sll        $v1, $v0, 1
    /* 932FC 800A32FC 21186200 */  addu       $v1, $v1, $v0
    /* 93300 800A3300 80180300 */  sll        $v1, $v1, 2
    /* 93304 800A3304 21A8A302 */  addu       $s5, $s5, $v1
    /* 93308 800A3308 2120C003 */  addu       $a0, $fp, $zero
    /* 9330C 800A330C 1280063C */  lui        $a2, %hi(D_8011C6E0)
    /* 93310 800A3310 E0C6C624 */  addiu      $a2, $a2, %lo(D_8011C6E0)
    /* 93314 800A3314 1280053C */  lui        $a1, %hi(sel_data)
    /* 93318 800A3318 2CB7A58C */  lw         $a1, %lo(sel_data)($a1)
    /* 9331C 800A331C 0D80093C */  lui        $t1, %hi(_infostr)
    /* 93320 800A3320 10E82925 */  addiu      $t1, $t1, %lo(_infostr)
    /* 93324 800A3324 002A0500 */  sll        $a1, $a1, 8
    /* 93328 800A3328 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 9332C 800A332C 2128A900 */   addu      $a1, $a1, $t1
    /* 93330 800A3330 0E8C0208 */  j          .L800A3038
    /* 93334 800A3334 00000000 */   nop
  .L800A3338:
    /* 93338 800A3338 1401BF8F */  lw         $ra, 0x114($sp)
    /* 9333C 800A333C 1001BE8F */  lw         $fp, 0x110($sp)
    /* 93340 800A3340 0C01B78F */  lw         $s7, 0x10C($sp)
    /* 93344 800A3344 0801B68F */  lw         $s6, 0x108($sp)
    /* 93348 800A3348 0401B58F */  lw         $s5, 0x104($sp)
    /* 9334C 800A334C 0001B48F */  lw         $s4, 0x100($sp)
    /* 93350 800A3350 FC00B38F */  lw         $s3, 0xFC($sp)
    /* 93354 800A3354 F800B28F */  lw         $s2, 0xF8($sp)
    /* 93358 800A3358 F400B18F */  lw         $s1, 0xF4($sp)
    /* 9335C 800A335C F000B08F */  lw         $s0, 0xF0($sp)
    /* 93360 800A3360 1801BD27 */  addiu      $sp, $sp, 0x118
    /* 93364 800A3364 0800E003 */  jr         $ra
    /* 93368 800A3368 00000000 */   nop
endlabel DrawObjSelector__FiP12PlayerStruct
