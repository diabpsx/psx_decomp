.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoCredits__Fv, 0x3E8

glabel DoCredits__Fv
    /* 405C 8013DC54 40FFBD27 */  addiu      $sp, $sp, -0xC0
    /* 4060 8013DC58 1800A427 */  addiu      $a0, $sp, 0x18
    /* 4064 8013DC5C BC00BFAF */  sw         $ra, 0xBC($sp)
    /* 4068 8013DC60 B800BEAF */  sw         $fp, 0xB8($sp)
    /* 406C 8013DC64 B400B7AF */  sw         $s7, 0xB4($sp)
    /* 4070 8013DC68 B000B6AF */  sw         $s6, 0xB0($sp)
    /* 4074 8013DC6C AC00B5AF */  sw         $s5, 0xAC($sp)
    /* 4078 8013DC70 A800B4AF */  sw         $s4, 0xA8($sp)
    /* 407C 8013DC74 A400B3AF */  sw         $s3, 0xA4($sp)
    /* 4080 8013DC78 A000B2AF */  sw         $s2, 0xA0($sp)
    /* 4084 8013DC7C 9C00B1AF */  sw         $s1, 0x9C($sp)
    /* 4088 8013DC80 1752020C */  jal        __7CScreen
    /* 408C 8013DC84 9800B0AF */   sw        $s0, 0x98($sp)
    /* 4090 8013DC88 21980000 */  addu       $s3, $zero, $zero
    /* 4094 8013DC8C 21F00000 */  addu       $fp, $zero, $zero
    /* 4098 8013DC90 21A00000 */  addu       $s4, $zero, $zero
    /* 409C 8013DC94 21A80000 */  addu       $s5, $zero, $zero
    /* 40A0 8013DC98 1800A427 */  addiu      $a0, $sp, 0x18
    /* 40A4 8013DC9C 0E000524 */  addiu      $a1, $zero, 0xE
    /* 40A8 8013DCA0 0B000624 */  addiu      $a2, $zero, 0xB
    /* 40AC 8013DCA4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 40B0 8013DCA8 440C82AF */  sw         $v0, %gp_rel(CreditSubTitleNo)($gp)
    /* 40B4 8013DCAC 400C82AF */  sw         $v0, %gp_rel(CreditTitleNo)($gp)
    /* 40B8 8013DCB0 05000224 */  addiu      $v0, $zero, 0x5
    /* 40BC 8013DCB4 01000924 */  addiu      $t1, $zero, 0x1
    /* 40C0 8013DCB8 3C0C82AF */  sw         $v0, %gp_rel(InCredits)($gp)
    /* 40C4 8013DCBC 1280013C */  lui        $at, %hi(CDWAIT)
    /* 40C8 8013DCC0 ECAD29AC */  sw         $t1, %lo(CDWAIT)($at)
    /* 40CC 8013DCC4 2452020C */  jal        Load__7CScreeniii
    /* 40D0 8013DCC8 21380000 */   addu      $a3, $zero, $zero
    /* 40D4 8013DCCC 349A020C */  jal        PrintSelectBack__FUs
    /* 40D8 8013DCD0 00400424 */   addiu     $a0, $zero, 0x4000
    /* 40DC 8013DCD4 1280013C */  lui        $at, %hi(CDWAIT)
    /* 40E0 8013DCD8 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 40E4 8013DCDC 7CFC010C */  jal        PaletteFadeIn__Fi
    /* 40E8 8013DCE0 08000424 */   addiu     $a0, $zero, 0x8
  .L8013DCE4:
    /* 40EC 8013DCE4 ABFB010C */  jal        GetFadeState__Fv
    /* 40F0 8013DCE8 00000000 */   nop
    /* 40F4 8013DCEC 0C004010 */  beqz       $v0, .L8013DD20
    /* 40F8 8013DCF0 1800A427 */   addiu     $a0, $sp, 0x18
    /* 40FC 8013DCF4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 4100 8013DCF8 0E000524 */  addiu      $a1, $zero, 0xE
    /* 4104 8013DCFC 0B000624 */  addiu      $a2, $zero, 0xB
    /* 4108 8013DD00 F252020C */  jal        Display__7CScreeniiii
    /* 410C 8013DD04 21380000 */   addu      $a3, $zero, $zero
    /* 4110 8013DD08 349A020C */  jal        PrintSelectBack__FUs
    /* 4114 8013DD0C 00400424 */   addiu     $a0, $zero, 0x4000
    /* 4118 8013DD10 EE80000C */  jal        TSK_Sleep
    /* 411C 8013DD14 01000424 */   addiu     $a0, $zero, 0x1
    /* 4120 8013DD18 39F70408 */  j          .L8013DCE4
    /* 4124 8013DD1C 00000000 */   nop
  .L8013DD20:
    /* 4128 8013DD20 02001724 */  addiu      $s7, $zero, 0x2
    /* 412C 8013DD24 FF001624 */  addiu      $s6, $zero, 0xFF
  .L8013DD28:
    /* 4130 8013DD28 3C0C828F */  lw         $v0, %gp_rel(InCredits)($gp)
    /* 4134 8013DD2C 00000000 */  nop
    /* 4138 8013DD30 AE004010 */  beqz       $v0, .L8013DFEC
    /* 413C 8013DD34 00000000 */   nop
    /* 4140 8013DD38 8F11020C */  jal        ReadPad__Fi
    /* 4144 8013DD3C FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 4148 8013DD40 28000824 */  addiu      $t0, $zero, 0x28
    /* 414C 8013DD44 21286002 */  addu       $a1, $s3, $zero
    /* 4150 8013DD48 FFFFA332 */  andi       $v1, $s5, 0xFFFF
    /* 4154 8013DD4C 40100300 */  sll        $v0, $v1, 1
    /* 4158 8013DD50 21104300 */  addu       $v0, $v0, $v1
    /* 415C 8013DD54 80900200 */  sll        $s2, $v0, 2
    /* 4160 8013DD58 01006324 */  addiu      $v1, $v1, 0x1
    /* 4164 8013DD5C 40800300 */  sll        $s0, $v1, 1
    /* 4168 8013DD60 21800302 */  addu       $s0, $s0, $v1
    /* 416C 8013DD64 80801000 */  sll        $s0, $s0, 2
    /* 4170 8013DD68 1480013C */  lui        $at, %hi(CreditsText)
    /* 4174 8013DD6C 21083200 */  addu       $at, $at, $s2
    /* 4178 8013DD70 74CB248C */  lw         $a0, %lo(CreditsText)($at)
    /* 417C 8013DD74 1480013C */  lui        $at, %hi(CreditsText)
    /* 4180 8013DD78 21083000 */  addu       $at, $at, $s0
    /* 4184 8013DD7C 74CB278C */  lw         $a3, %lo(CreditsText)($at)
    /* 4188 8013DD80 21308002 */  addu       $a2, $s4, $zero
    /* 418C 8013DD84 9EF6040C */  jal        DrawCreditsTitle__Fiiiii
    /* 4190 8013DD88 1000A8AF */   sw        $t0, 0x10($sp)
    /* 4194 8013DD8C 1480013C */  lui        $at, %hi(CreditsText)
    /* 4198 8013DD90 21083200 */  addu       $at, $at, $s2
    /* 419C 8013DD94 74CB248C */  lw         $a0, %lo(CreditsText)($at)
    /* 41A0 8013DD98 FAF6040C */  jal        CredCountNL__Fi
    /* 41A4 8013DD9C 00000000 */   nop
    /* 41A8 8013DDA0 80180200 */  sll        $v1, $v0, 2
    /* 41AC 8013DDA4 21186200 */  addu       $v1, $v1, $v0
    /* 41B0 8013DDA8 80880300 */  sll        $s1, $v1, 2
    /* 41B4 8013DDAC 44002826 */  addiu      $t0, $s1, 0x44
    /* 41B8 8013DDB0 21286002 */  addu       $a1, $s3, $zero
    /* 41BC 8013DDB4 1480013C */  lui        $at, %hi(CreditsText + 0x4)
    /* 41C0 8013DDB8 21083200 */  addu       $at, $at, $s2
    /* 41C4 8013DDBC 78CB248C */  lw         $a0, %lo(CreditsText + 0x4)($at)
    /* 41C8 8013DDC0 1480013C */  lui        $at, %hi(CreditsText + 0x4)
    /* 41CC 8013DDC4 21083000 */  addu       $at, $at, $s0
    /* 41D0 8013DDC8 78CB278C */  lw         $a3, %lo(CreditsText + 0x4)($at)
    /* 41D4 8013DDCC 21308002 */  addu       $a2, $s4, $zero
    /* 41D8 8013DDD0 CCF6040C */  jal        DrawCreditsSubTitle__Fiiiii
    /* 41DC 8013DDD4 1000A8AF */   sw        $t0, 0x10($sp)
    /* 41E0 8013DDD8 1480013C */  lui        $at, %hi(CreditsText + 0x4)
    /* 41E4 8013DDDC 21083200 */  addu       $at, $at, $s2
    /* 41E8 8013DDE0 78CB248C */  lw         $a0, %lo(CreditsText + 0x4)($at)
    /* 41EC 8013DDE4 FAF6040C */  jal        CredCountNL__Fi
    /* 41F0 8013DDE8 00000000 */   nop
    /* 41F4 8013DDEC 80180200 */  sll        $v1, $v0, 2
    /* 41F8 8013DDF0 21186200 */  addu       $v1, $v1, $v0
    /* 41FC 8013DDF4 80180300 */  sll        $v1, $v1, 2
    /* 4200 8013DDF8 1480013C */  lui        $at, %hi(CreditsText)
    /* 4204 8013DDFC 21083200 */  addu       $at, $at, $s2
    /* 4208 8013DE00 74CB248C */  lw         $a0, %lo(CreditsText)($at)
    /* 420C 8013DE04 FAF6040C */  jal        CredCountNL__Fi
    /* 4210 8013DE08 21882302 */   addu      $s1, $s1, $v1
    /* 4214 8013DE0C 02004014 */  bnez       $v0, .L8013DE18
    /* 4218 8013DE10 01000224 */   addiu     $v0, $zero, 0x1
    /* 421C 8013DE14 21880000 */  addu       $s1, $zero, $zero
  .L8013DE18:
    /* 4220 8013DE18 1C008212 */  beq        $s4, $v0, .L8013DE8C
    /* 4224 8013DE1C 6E002826 */   addiu     $t0, $s1, 0x6E
    /* 4228 8013DE20 0200822A */  slti       $v0, $s4, 0x2
    /* 422C 8013DE24 05004010 */  beqz       $v0, .L8013DE3C
    /* 4230 8013DE28 00000000 */   nop
    /* 4234 8013DE2C 07008012 */  beqz       $s4, .L8013DE4C
    /* 4238 8013DE30 21280001 */   addu      $a1, $t0, $zero
    /* 423C 8013DE34 C8F70408 */  j          .L8013DF20
    /* 4240 8013DE38 1800A427 */   addiu     $a0, $sp, 0x18
  .L8013DE3C:
    /* 4244 8013DE3C 25009712 */  beq        $s4, $s7, .L8013DED4
    /* 4248 8013DE40 21280001 */   addu      $a1, $t0, $zero
    /* 424C 8013DE44 C8F70408 */  j          .L8013DF20
    /* 4250 8013DE48 1800A427 */   addiu     $a0, $sp, 0x18
  .L8013DE4C:
    /* 4254 8013DE4C 21306002 */  addu       $a2, $s3, $zero
    /* 4258 8013DE50 1480013C */  lui        $at, %hi(CreditsText + 0x8)
    /* 425C 8013DE54 21083200 */  addu       $at, $at, $s2
    /* 4260 8013DE58 7CCB248C */  lw         $a0, %lo(CreditsText + 0x8)($at)
    /* 4264 8013DE5C FF000724 */  addiu      $a3, $zero, 0xFF
    /* 4268 8013DE60 1000B6AF */  sw         $s6, 0x10($sp)
    /* 426C 8013DE64 92F4040C */  jal        PrintCredits__Fiiiiii
    /* 4270 8013DE68 1400B6AF */   sw        $s6, 0x14($sp)
    /* 4274 8013DE6C 05004010 */  beqz       $v0, .L8013DE84
    /* 4278 8013DE70 00000000 */   nop
    /* 427C 8013DE74 3E10020C */  jal        VID_GetTick__Fv
    /* 4280 8013DE78 01001424 */   addiu     $s4, $zero, 0x1
    /* 4284 8013DE7C C7F70408 */  j          .L8013DF1C
    /* 4288 8013DE80 21F04000 */   addu      $fp, $v0, $zero
  .L8013DE84:
    /* 428C 8013DE84 C7F70408 */  j          .L8013DF1C
    /* 4290 8013DE88 01007326 */   addiu     $s3, $s3, 0x1
  .L8013DE8C:
    /* 4294 8013DE8C 21280001 */  addu       $a1, $t0, $zero
    /* 4298 8013DE90 21306002 */  addu       $a2, $s3, $zero
    /* 429C 8013DE94 1480013C */  lui        $at, %hi(CreditsText + 0x8)
    /* 42A0 8013DE98 21083200 */  addu       $at, $at, $s2
    /* 42A4 8013DE9C 7CCB248C */  lw         $a0, %lo(CreditsText + 0x8)($at)
    /* 42A8 8013DEA0 FF000724 */  addiu      $a3, $zero, 0xFF
    /* 42AC 8013DEA4 1000B6AF */  sw         $s6, 0x10($sp)
    /* 42B0 8013DEA8 92F4040C */  jal        PrintCredits__Fiiiiii
    /* 42B4 8013DEAC 1400B6AF */   sw        $s6, 0x14($sp)
    /* 42B8 8013DEB0 3E10020C */  jal        VID_GetTick__Fv
    /* 42BC 8013DEB4 00000000 */   nop
    /* 42C0 8013DEB8 23105E00 */  subu       $v0, $v0, $fp
    /* 42C4 8013DEBC 1A00422C */  sltiu      $v0, $v0, 0x1A
    /* 42C8 8013DEC0 17004014 */  bnez       $v0, .L8013DF20
    /* 42CC 8013DEC4 1800A427 */   addiu     $a0, $sp, 0x18
    /* 42D0 8013DEC8 02001424 */  addiu      $s4, $zero, 0x2
    /* 42D4 8013DECC C8F70408 */  j          .L8013DF20
    /* 42D8 8013DED0 FFFF7326 */   addiu     $s3, $s3, -0x1
  .L8013DED4:
    /* 42DC 8013DED4 21306002 */  addu       $a2, $s3, $zero
    /* 42E0 8013DED8 1480013C */  lui        $at, %hi(CreditsText + 0x8)
    /* 42E4 8013DEDC 21083200 */  addu       $at, $at, $s2
    /* 42E8 8013DEE0 7CCB248C */  lw         $a0, %lo(CreditsText + 0x8)($at)
    /* 42EC 8013DEE4 FF000724 */  addiu      $a3, $zero, 0xFF
    /* 42F0 8013DEE8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 42F4 8013DEEC 92F4040C */  jal        PrintCredits__Fiiiiii
    /* 42F8 8013DEF0 1400B6AF */   sw        $s6, 0x14($sp)
    /* 42FC 8013DEF4 08004010 */  beqz       $v0, .L8013DF18
    /* 4300 8013DEF8 00000000 */   nop
    /* 4304 8013DEFC 3C0C828F */  lw         $v0, %gp_rel(InCredits)($gp)
    /* 4308 8013DF00 00000000 */  nop
    /* 430C 8013DF04 02005710 */  beq        $v0, $s7, .L8013DF10
    /* 4310 8013DF08 21A00000 */   addu      $s4, $zero, $zero
    /* 4314 8013DF0C 0100B526 */  addiu      $s5, $s5, 0x1
  .L8013DF10:
    /* 4318 8013DF10 C7F70408 */  j          .L8013DF1C
    /* 431C 8013DF14 21980000 */   addu      $s3, $zero, $zero
  .L8013DF18:
    /* 4320 8013DF18 FFFF7326 */  addiu      $s3, $s3, -0x1
  .L8013DF1C:
    /* 4324 8013DF1C 1800A427 */  addiu      $a0, $sp, 0x18
  .L8013DF20:
    /* 4328 8013DF20 0E000524 */  addiu      $a1, $zero, 0xE
    /* 432C 8013DF24 0B000624 */  addiu      $a2, $zero, 0xB
    /* 4330 8013DF28 21380000 */  addu       $a3, $zero, $zero
    /* 4334 8013DF2C F252020C */  jal        Display__7CScreeniiii
    /* 4338 8013DF30 1000A0AF */   sw        $zero, 0x10($sp)
    /* 433C 8013DF34 3C0C828F */  lw         $v0, %gp_rel(InCredits)($gp)
    /* 4340 8013DF38 00000000 */  nop
    /* 4344 8013DF3C 04004228 */  slti       $v0, $v0, 0x4
    /* 4348 8013DF40 03004014 */  bnez       $v0, .L8013DF50
    /* 434C 8013DF44 00000000 */   nop
    /* 4350 8013DF48 349A020C */  jal        PrintSelectBack__FUs
    /* 4354 8013DF4C 00400424 */   addiu     $a0, $zero, 0x4000
  .L8013DF50:
    /* 4358 8013DF50 EE80000C */  jal        TSK_Sleep
    /* 435C 8013DF54 01000424 */   addiu     $a0, $zero, 0x1
    /* 4360 8013DF58 3C0C828F */  lw         $v0, %gp_rel(InCredits)($gp)
    /* 4364 8013DF5C 00000000 */  nop
    /* 4368 8013DF60 04005714 */  bne        $v0, $s7, .L8013DF74
    /* 436C 8013DF64 03000224 */   addiu     $v0, $zero, 0x3
    /* 4370 8013DF68 3C0C82AF */  sw         $v0, %gp_rel(InCredits)($gp)
    /* 4374 8013DF6C BEFC010C */  jal        PaletteFadeOut__Fi
    /* 4378 8013DF70 08000424 */   addiu     $a0, $zero, 0x8
  .L8013DF74:
    /* 437C 8013DF74 3C0C838F */  lw         $v1, %gp_rel(InCredits)($gp)
    /* 4380 8013DF78 03000224 */  addiu      $v0, $zero, 0x3
    /* 4384 8013DF7C 07006214 */  bne        $v1, $v0, .L8013DF9C
    /* 4388 8013DF80 00000000 */   nop
    /* 438C 8013DF84 ABFB010C */  jal        GetFadeState__Fv
    /* 4390 8013DF88 00000000 */   nop
    /* 4394 8013DF8C 01004238 */  xori       $v0, $v0, 0x1
    /* 4398 8013DF90 02004010 */  beqz       $v0, .L8013DF9C
    /* 439C 8013DF94 01000224 */   addiu     $v0, $zero, 0x1
    /* 43A0 8013DF98 3C0C82AF */  sw         $v0, %gp_rel(InCredits)($gp)
  .L8013DF9C:
    /* 43A4 8013DF9C 1280023C */  lui        $v0, %hi(DavesPad)
    /* 43A8 8013DFA0 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 43AC 8013DFA4 00000000 */  nop
    /* 43B0 8013DFA8 00014230 */  andi       $v0, $v0, 0x100
    /* 43B4 8013DFAC 08004010 */  beqz       $v0, .L8013DFD0
    /* 43B8 8013DFB0 05000224 */   addiu     $v0, $zero, 0x5
    /* 43BC 8013DFB4 3C0C838F */  lw         $v1, %gp_rel(InCredits)($gp)
    /* 43C0 8013DFB8 00000000 */  nop
    /* 43C4 8013DFBC 05006214 */  bne        $v1, $v0, .L8013DFD4
    /* 43C8 8013DFC0 FFFFA232 */   andi      $v0, $s5, 0xFFFF
    /* 43CC 8013DFC4 C6F5000C */  jal        PlaySFX__Fi
    /* 43D0 8013DFC8 33000424 */   addiu     $a0, $zero, 0x33
    /* 43D4 8013DFCC 3C0C97AF */  sw         $s7, %gp_rel(InCredits)($gp)
  .L8013DFD0:
    /* 43D8 8013DFD0 FFFFA232 */  andi       $v0, $s5, 0xFFFF
  .L8013DFD4:
    /* 43DC 8013DFD4 3900422C */  sltiu      $v0, $v0, 0x39
    /* 43E0 8013DFD8 53FF4014 */  bnez       $v0, .L8013DD28
    /* 43E4 8013DFDC 00000000 */   nop
    /* 43E8 8013DFE0 3C0C97AF */  sw         $s7, %gp_rel(InCredits)($gp)
    /* 43EC 8013DFE4 4AF70408 */  j          .L8013DD28
    /* 43F0 8013DFE8 21A80000 */   addu      $s5, $zero, $zero
  .L8013DFEC:
    /* 43F4 8013DFEC 69ED010C */  jal        LANG_ReloadMainTXT__Fv
    /* 43F8 8013DFF0 00000000 */   nop
    /* 43FC 8013DFF4 E952020C */  jal        Unload__7CScreen
    /* 4400 8013DFF8 1800A427 */   addiu     $a0, $sp, 0x18
    /* 4404 8013DFFC 1800A427 */  addiu      $a0, $sp, 0x18
    /* 4408 8013E000 47F8040C */  jal        ___7CScreen_8013e11c
    /* 440C 8013E004 02000524 */   addiu     $a1, $zero, 0x2
    /* 4410 8013E008 BC00BF8F */  lw         $ra, 0xBC($sp)
    /* 4414 8013E00C B800BE8F */  lw         $fp, 0xB8($sp)
    /* 4418 8013E010 B400B78F */  lw         $s7, 0xB4($sp)
    /* 441C 8013E014 B000B68F */  lw         $s6, 0xB0($sp)
    /* 4420 8013E018 AC00B58F */  lw         $s5, 0xAC($sp)
    /* 4424 8013E01C A800B48F */  lw         $s4, 0xA8($sp)
    /* 4428 8013E020 A400B38F */  lw         $s3, 0xA4($sp)
    /* 442C 8013E024 A000B28F */  lw         $s2, 0xA0($sp)
    /* 4430 8013E028 9C00B18F */  lw         $s1, 0x9C($sp)
    /* 4434 8013E02C 9800B08F */  lw         $s0, 0x98($sp)
    /* 4438 8013E030 C000BD27 */  addiu      $sp, $sp, 0xC0
    /* 443C 8013E034 0800E003 */  jr         $ra
    /* 4440 8013E038 00000000 */   nop
endlabel DoCredits__Fv
