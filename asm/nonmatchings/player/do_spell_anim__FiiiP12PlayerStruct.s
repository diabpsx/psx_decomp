.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching do_spell_anim__FiiiP12PlayerStruct, 0x4E0

glabel do_spell_anim__FiiiP12PlayerStruct
    /* 53A74 80063A74 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 53A78 80063A78 3000B2AF */  sw         $s2, 0x30($sp)
    /* 53A7C 80063A7C 21908000 */  addu       $s2, $a0, $zero
    /* 53A80 80063A80 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 53A84 80063A84 2188A000 */  addu       $s1, $a1, $zero
    /* 53A88 80063A88 4400B7AF */  sw         $s7, 0x44($sp)
    /* 53A8C 80063A8C 21B8E000 */  addu       $s7, $a3, $zero
    /* 53A90 80063A90 0E80043C */  lui        $a0, %hi(plr)
    /* 53A94 80063A94 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 53A98 80063A98 2620E402 */  xor        $a0, $s7, $a0
    /* 53A9C 80063A9C 2B200400 */  sltu       $a0, $zero, $a0
    /* 53AA0 80063AA0 4800BFAF */  sw         $ra, 0x48($sp)
    /* 53AA4 80063AA4 4000B6AF */  sw         $s6, 0x40($sp)
    /* 53AA8 80063AA8 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 53AAC 80063AAC 3800B4AF */  sw         $s4, 0x38($sp)
    /* 53AB0 80063AB0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 53AB4 80063AB4 109D010C */  jal        GetPlayer__7CPlayeri
    /* 53AB8 80063AB8 2800B0AF */   sw        $s0, 0x28($sp)
    /* 53ABC 80063ABC 21804000 */  addu       $s0, $v0, $zero
    /* 53AC0 80063AC0 249D010C */  jal        GetLastOtPos__C7CPlayer
    /* 53AC4 80063AC4 21200002 */   addu      $a0, $s0, $zero
    /* 53AC8 80063AC8 21200002 */  addu       $a0, $s0, $zero
    /* 53ACC 80063ACC 2A9D010C */  jal        GetLastScrX__C7CPlayer
    /* 53AD0 80063AD0 21B04000 */   addu      $s6, $v0, $zero
    /* 53AD4 80063AD4 21200002 */  addu       $a0, $s0, $zero
    /* 53AD8 80063AD8 279D010C */  jal        GetLastScrY__C7CPlayer
    /* 53ADC 80063ADC 10005524 */   addiu     $s5, $v0, 0x10
    /* 53AE0 80063AE0 FEFF5424 */  addiu      $s4, $v0, -0x2
    /* 53AE4 80063AE4 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 53AE8 80063AE8 2400222E */  sltiu      $v0, $s1, 0x24
    /* 53AEC 80063AEC 1280133C */  lui        $s3, %hi(MissDat)
    /* 53AF0 80063AF0 28BC738E */  lw         $s3, %lo(MissDat)($s3)
    /* 53AF4 80063AF4 03014010 */  beqz       $v0, .L80063F04
    /* 53AF8 80063AF8 80101100 */   sll       $v0, $s1, 2
    /* 53AFC 80063AFC 1180013C */  lui        $at, %hi(jtbl_801177DC)
    /* 53B00 80063B00 21082200 */  addu       $at, $at, $v0
    /* 53B04 80063B04 DC77228C */  lw         $v0, %lo(jtbl_801177DC)($at)
    /* 53B08 80063B08 00000000 */  nop
    /* 53B0C 80063B0C 08004000 */  jr         $v0
    /* 53B10 80063B10 00000000 */   nop
  jlabel .L80063B14
    /* 53B14 80063B14 044F020C */  jal        GM_UseTexData__Fi
    /* 53B18 80063B18 CE000424 */   addiu     $a0, $zero, 0xCE
    /* 53B1C 80063B1C 21884000 */  addu       $s1, $v0, $zero
    /* 53B20 80063B20 1E005026 */  addiu      $s0, $s2, 0x1E
    /* 53B24 80063B24 EE9C010C */  jal        PRIM_GetPrim__FPP8POLY_FT4
    /* 53B28 80063B28 2000A427 */   addiu     $a0, $sp, 0x20
    /* 53B2C 80063B2C 21202002 */  addu       $a0, $s1, $zero
    /* 53B30 80063B30 21300002 */  addu       $a2, $s0, $zero
    /* 53B34 80063B34 48008226 */  addiu      $v0, $s4, 0x48
    /* 53B38 80063B38 1000A2AF */  sw         $v0, 0x10($sp)
    /* 53B3C 80063B3C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 53B40 80063B40 1800A0AF */  sw         $zero, 0x18($sp)
    /* 53B44 80063B44 2000A58F */  lw         $a1, 0x20($sp)
    /* 53B48 80063B48 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 53B4C 80063B4C 3800A726 */   addiu     $a3, $s5, 0x38
    /* 53B50 80063B50 2000A28F */  lw         $v0, 0x20($sp)
    /* 53B54 80063B54 80000324 */  addiu      $v1, $zero, 0x80
    /* 53B58 80063B58 040043A0 */  sb         $v1, 0x4($v0)
    /* 53B5C 80063B5C 2000A28F */  lw         $v0, 0x20($sp)
    /* 53B60 80063B60 00000000 */  nop
    /* 53B64 80063B64 050043A0 */  sb         $v1, 0x5($v0)
    /* 53B68 80063B68 2000A28F */  lw         $v0, 0x20($sp)
    /* 53B6C 80063B6C FF00073C */  lui        $a3, (0xFFFFFF >> 16)
    /* 53B70 80063B70 060043A0 */  sb         $v1, 0x6($v0)
    /* 53B74 80063B74 2000A38F */  lw         $v1, 0x20($sp)
    /* 53B78 80063B78 FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
    /* 53B7C 80063B7C 07006290 */  lbu        $v0, 0x7($v1)
    /* 53B80 80063B80 80281600 */  sll        $a1, $s6, 2
    /* 53B84 80063B84 FD004230 */  andi       $v0, $v0, 0xFD
    /* 53B88 80063B88 070062A0 */  sb         $v0, 0x7($v1)
    /* 53B8C 80063B8C 2000A38F */  lw         $v1, 0x20($sp)
    /* 53B90 80063B90 00FF083C */  lui        $t0, (0xFF000000 >> 16)
    /* 53B94 80063B94 07006290 */  lbu        $v0, 0x7($v1)
    /* 53B98 80063B98 21202002 */  addu       $a0, $s1, $zero
    /* 53B9C 80063B9C FE004230 */  andi       $v0, $v0, 0xFE
    /* 53BA0 80063BA0 070062A0 */  sb         $v0, 0x7($v1)
    /* 53BA4 80063BA4 1280023C */  lui        $v0, %hi(ThisOt)
    /* 53BA8 80063BA8 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 53BAC 80063BAC 2000A68F */  lw         $a2, 0x20($sp)
    /* 53BB0 80063BB0 2128A200 */  addu       $a1, $a1, $v0
    /* 53BB4 80063BB4 0000C38C */  lw         $v1, 0x0($a2)
    /* 53BB8 80063BB8 0000A28C */  lw         $v0, 0x0($a1)
    /* 53BBC 80063BBC 24186800 */  and        $v1, $v1, $t0
    /* 53BC0 80063BC0 24104700 */  and        $v0, $v0, $a3
    /* 53BC4 80063BC4 25186200 */  or         $v1, $v1, $v0
    /* 53BC8 80063BC8 0000C3AC */  sw         $v1, 0x0($a2)
    /* 53BCC 80063BCC 0000A28C */  lw         $v0, 0x0($a1)
    /* 53BD0 80063BD0 2430C700 */  and        $a2, $a2, $a3
    /* 53BD4 80063BD4 24104800 */  and        $v0, $v0, $t0
    /* 53BD8 80063BD8 25104600 */  or         $v0, $v0, $a2
    /* 53BDC 80063BDC 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 53BE0 80063BE0 0000A2AC */   sw        $v0, 0x0($a1)
    /* 53BE4 80063BE4 5B00E482 */  lb         $a0, 0x5B($s7)
    /* 53BE8 80063BE8 0335010C */  jal        ChangeLightColour__Fii
    /* 53BEC 80063BEC 90000524 */   addiu     $a1, $zero, 0x90
    /* 53BF0 80063BF0 C98F0108 */  j          .L80063F24
    /* 53BF4 80063BF4 00000000 */   nop
  jlabel .L80063BF8
    /* 53BF8 80063BF8 1280023C */  lui        $v0, %hi(leveltype)
    /* 53BFC 80063BFC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 53C00 80063C00 00000000 */  nop
    /* 53C04 80063C04 05004010 */  beqz       $v0, .L80063C1C
    /* 53C08 80063C08 10009426 */   addiu     $s4, $s4, 0x10
    /* 53C0C 80063C0C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 53C10 80063C10 21206002 */  addu       $a0, $s3, $zero
    /* 53C14 80063C14 0A8F0108 */  j          .L80063C28
    /* 53C18 80063C18 11000524 */   addiu     $a1, $zero, 0x11
  .L80063C1C:
    /* 53C1C 80063C1C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 53C20 80063C20 21206002 */  addu       $a0, $s3, $zero
    /* 53C24 80063C24 21280000 */  addu       $a1, $zero, $zero
  .L80063C28:
    /* 53C28 80063C28 21300000 */  addu       $a2, $zero, $zero
    /* 53C2C 80063C2C A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 53C30 80063C30 21380000 */   addu      $a3, $zero, $zero
    /* 53C34 80063C34 21804000 */  addu       $s0, $v0, $zero
    /* 53C38 80063C38 FFFF1032 */  andi       $s0, $s0, 0xFFFF
    /* 53C3C 80063C3C EE9C010C */  jal        PRIM_GetPrim__FPP8POLY_FT4
    /* 53C40 80063C40 2000A427 */   addiu     $a0, $sp, 0x20
    /* 53C44 80063C44 21206002 */  addu       $a0, $s3, $zero
    /* 53C48 80063C48 21300002 */  addu       $a2, $s0, $zero
    /* 53C4C 80063C4C 40101200 */  sll        $v0, $s2, 1
    /* 53C50 80063C50 23108202 */  subu       $v0, $s4, $v0
    /* 53C54 80063C54 1000A2AF */  sw         $v0, 0x10($sp)
    /* 53C58 80063C58 1400A0AF */  sw         $zero, 0x14($sp)
    /* 53C5C 80063C5C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 53C60 80063C60 2000A58F */  lw         $a1, 0x20($sp)
    /* 53C64 80063C64 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 53C68 80063C68 F0FFA726 */   addiu     $a3, $s5, -0x10
    /* 53C6C 80063C6C 1280023C */  lui        $v0, %hi(leveltype)
    /* 53C70 80063C70 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 53C74 80063C74 00000000 */  nop
    /* 53C78 80063C78 04004010 */  beqz       $v0, .L80063C8C
    /* 53C7C 80063C7C 21206002 */   addu      $a0, $s3, $zero
    /* 53C80 80063C80 1000B2AF */  sw         $s2, 0x10($sp)
    /* 53C84 80063C84 258F0108 */  j          .L80063C94
    /* 53C88 80063C88 12000524 */   addiu     $a1, $zero, 0x12
  .L80063C8C:
    /* 53C8C 80063C8C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 53C90 80063C90 01000524 */  addiu      $a1, $zero, 0x1
  .L80063C94:
    /* 53C94 80063C94 21300000 */  addu       $a2, $zero, $zero
    /* 53C98 80063C98 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 53C9C 80063C9C 21380000 */   addu      $a3, $zero, $zero
    /* 53CA0 80063CA0 21804000 */  addu       $s0, $v0, $zero
    /* 53CA4 80063CA4 FFFF1032 */  andi       $s0, $s0, 0xFFFF
    /* 53CA8 80063CA8 EE9C010C */  jal        PRIM_GetPrim__FPP8POLY_FT4
    /* 53CAC 80063CAC 2400A427 */   addiu     $a0, $sp, 0x24
    /* 53CB0 80063CB0 21206002 */  addu       $a0, $s3, $zero
    /* 53CB4 80063CB4 21300002 */  addu       $a2, $s0, $zero
    /* 53CB8 80063CB8 40101200 */  sll        $v0, $s2, 1
    /* 53CBC 80063CBC 23108202 */  subu       $v0, $s4, $v0
    /* 53CC0 80063CC0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 53CC4 80063CC4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 53CC8 80063CC8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 53CCC 80063CCC 2400A58F */  lw         $a1, 0x24($sp)
    /* 53CD0 80063CD0 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 53CD4 80063CD4 F0FFA726 */   addiu     $a3, $s5, -0x10
    /* 53CD8 80063CD8 2000A28F */  lw         $v0, 0x20($sp)
    /* 53CDC 80063CDC 40000324 */  addiu      $v1, $zero, 0x40
    /* 53CE0 80063CE0 040043A0 */  sb         $v1, 0x4($v0)
    /* 53CE4 80063CE4 2000A28F */  lw         $v0, 0x20($sp)
    /* 53CE8 80063CE8 00000000 */  nop
    /* 53CEC 80063CEC 050043A0 */  sb         $v1, 0x5($v0)
    /* 53CF0 80063CF0 2000A28F */  lw         $v0, 0x20($sp)
    /* 53CF4 80063CF4 F0000424 */  addiu      $a0, $zero, 0xF0
    /* 53CF8 80063CF8 060044A0 */  sb         $a0, 0x6($v0)
    /* 53CFC 80063CFC 2400A28F */  lw         $v0, 0x24($sp)
    /* 53D00 80063D00 00000000 */  nop
    /* 53D04 80063D04 040043A0 */  sb         $v1, 0x4($v0)
    /* 53D08 80063D08 2400A28F */  lw         $v0, 0x24($sp)
    /* 53D0C 80063D0C 00000000 */  nop
    /* 53D10 80063D10 050043A0 */  sb         $v1, 0x5($v0)
    /* 53D14 80063D14 2400A28F */  lw         $v0, 0x24($sp)
    /* 53D18 80063D18 00000000 */  nop
    /* 53D1C 80063D1C 060044A0 */  sb         $a0, 0x6($v0)
    /* 53D20 80063D20 2000A38F */  lw         $v1, 0x20($sp)
    /* 53D24 80063D24 00000000 */  nop
    /* 53D28 80063D28 07006290 */  lbu        $v0, 0x7($v1)
    /* 53D2C 80063D2C 00000000 */  nop
    /* 53D30 80063D30 02004234 */  ori        $v0, $v0, 0x2
    /* 53D34 80063D34 070062A0 */  sb         $v0, 0x7($v1)
    /* 53D38 80063D38 2400A38F */  lw         $v1, 0x24($sp)
    /* 53D3C 80063D3C 00000000 */  nop
    /* 53D40 80063D40 07006290 */  lbu        $v0, 0x7($v1)
    /* 53D44 80063D44 00000000 */  nop
    /* 53D48 80063D48 02004234 */  ori        $v0, $v0, 0x2
    /* 53D4C 80063D4C 070062A0 */  sb         $v0, 0x7($v1)
    /* 53D50 80063D50 2000A38F */  lw         $v1, 0x20($sp)
    /* 53D54 80063D54 FF00083C */  lui        $t0, (0xFFFFFF >> 16)
    /* 53D58 80063D58 07006290 */  lbu        $v0, 0x7($v1)
    /* 53D5C 80063D5C FFFF0835 */  ori        $t0, $t0, (0xFFFFFF & 0xFFFF)
    /* 53D60 80063D60 FE004230 */  andi       $v0, $v0, 0xFE
    /* 53D64 80063D64 070062A0 */  sb         $v0, 0x7($v1)
    /* 53D68 80063D68 2400A38F */  lw         $v1, 0x24($sp)
    /* 53D6C 80063D6C 00FF073C */  lui        $a3, (0xFF000000 >> 16)
    /* 53D70 80063D70 07006290 */  lbu        $v0, 0x7($v1)
    /* 53D74 80063D74 80201600 */  sll        $a0, $s6, 2
    /* 53D78 80063D78 FE004230 */  andi       $v0, $v0, 0xFE
    /* 53D7C 80063D7C 070062A0 */  sb         $v0, 0x7($v1)
    /* 53D80 80063D80 1280023C */  lui        $v0, %hi(ThisOt)
    /* 53D84 80063D84 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 53D88 80063D88 2000A68F */  lw         $a2, 0x20($sp)
    /* 53D8C 80063D8C 21208200 */  addu       $a0, $a0, $v0
    /* 53D90 80063D90 0000C38C */  lw         $v1, 0x0($a2)
    /* 53D94 80063D94 0000828C */  lw         $v0, 0x0($a0)
    /* 53D98 80063D98 24186700 */  and        $v1, $v1, $a3
    /* 53D9C 80063D9C 24104800 */  and        $v0, $v0, $t0
    /* 53DA0 80063DA0 25186200 */  or         $v1, $v1, $v0
    /* 53DA4 80063DA4 0000C3AC */  sw         $v1, 0x0($a2)
    /* 53DA8 80063DA8 2430C800 */  and        $a2, $a2, $t0
    /* 53DAC 80063DAC 0000828C */  lw         $v0, 0x0($a0)
    /* 53DB0 80063DB0 2400A58F */  lw         $a1, 0x24($sp)
    /* 53DB4 80063DB4 24104700 */  and        $v0, $v0, $a3
    /* 53DB8 80063DB8 25104600 */  or         $v0, $v0, $a2
    /* 53DBC 80063DBC 000082AC */  sw         $v0, 0x0($a0)
    /* 53DC0 80063DC0 0000A38C */  lw         $v1, 0x0($a1)
    /* 53DC4 80063DC4 FCFF828C */  lw         $v0, -0x4($a0)
    /* 53DC8 80063DC8 24186700 */  and        $v1, $v1, $a3
    /* 53DCC 80063DCC 24104800 */  and        $v0, $v0, $t0
    /* 53DD0 80063DD0 25186200 */  or         $v1, $v1, $v0
    /* 53DD4 80063DD4 0000A3AC */  sw         $v1, 0x0($a1)
    /* 53DD8 80063DD8 FCFF828C */  lw         $v0, -0x4($a0)
    /* 53DDC 80063DDC 2428A800 */  and        $a1, $a1, $t0
    /* 53DE0 80063DE0 24104700 */  and        $v0, $v0, $a3
    /* 53DE4 80063DE4 25104500 */  or         $v0, $v0, $a1
    /* 53DE8 80063DE8 FCFF82AC */  sw         $v0, -0x4($a0)
    /* 53DEC 80063DEC 5B00E482 */  lb         $a0, 0x5B($s7)
    /* 53DF0 80063DF0 0335010C */  jal        ChangeLightColour__Fii
    /* 53DF4 80063DF4 C0030524 */   addiu     $a1, $zero, 0x3C0
    /* 53DF8 80063DF8 C98F0108 */  j          .L80063F24
    /* 53DFC 80063DFC 00000000 */   nop
  jlabel .L80063E00
    /* 53E00 80063E00 044F020C */  jal        GM_UseTexData__Fi
    /* 53E04 80063E04 CE000424 */   addiu     $a0, $zero, 0xCE
    /* 53E08 80063E08 6666043C */  lui        $a0, (0x66666667 >> 16)
    /* 53E0C 80063E0C 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
    /* 53E10 80063E10 40181200 */  sll        $v1, $s2, 1
    /* 53E14 80063E14 18006400 */  mult       $v1, $a0
    /* 53E18 80063E18 21884000 */  addu       $s1, $v0, $zero
    /* 53E1C 80063E1C 2000A427 */  addiu      $a0, $sp, 0x20
    /* 53E20 80063E20 C31F0300 */  sra        $v1, $v1, 31
    /* 53E24 80063E24 10480000 */  mfhi       $t1
    /* 53E28 80063E28 43100900 */  sra        $v0, $t1, 1
    /* 53E2C 80063E2C 23104300 */  subu       $v0, $v0, $v1
    /* 53E30 80063E30 EE9C010C */  jal        PRIM_GetPrim__FPP8POLY_FT4
    /* 53E34 80063E34 18005024 */   addiu     $s0, $v0, 0x18
    /* 53E38 80063E38 21202002 */  addu       $a0, $s1, $zero
    /* 53E3C 80063E3C 21300002 */  addu       $a2, $s0, $zero
    /* 53E40 80063E40 04008226 */  addiu      $v0, $s4, 0x4
    /* 53E44 80063E44 1000A2AF */  sw         $v0, 0x10($sp)
    /* 53E48 80063E48 1400A0AF */  sw         $zero, 0x14($sp)
    /* 53E4C 80063E4C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 53E50 80063E50 2000A58F */  lw         $a1, 0x20($sp)
    /* 53E54 80063E54 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 53E58 80063E58 F0FFA726 */   addiu     $a3, $s5, -0x10
    /* 53E5C 80063E5C 2000A28F */  lw         $v0, 0x20($sp)
    /* 53E60 80063E60 80000324 */  addiu      $v1, $zero, 0x80
    /* 53E64 80063E64 040043A0 */  sb         $v1, 0x4($v0)
    /* 53E68 80063E68 2000A28F */  lw         $v0, 0x20($sp)
    /* 53E6C 80063E6C FF00073C */  lui        $a3, (0xFFFFFF >> 16)
    /* 53E70 80063E70 050043A0 */  sb         $v1, 0x5($v0)
    /* 53E74 80063E74 2000A38F */  lw         $v1, 0x20($sp)
    /* 53E78 80063E78 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 53E7C 80063E7C 060062A0 */  sb         $v0, 0x6($v1)
    /* 53E80 80063E80 2000A38F */  lw         $v1, 0x20($sp)
    /* 53E84 80063E84 FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
    /* 53E88 80063E88 07006290 */  lbu        $v0, 0x7($v1)
    /* 53E8C 80063E8C 80281600 */  sll        $a1, $s6, 2
    /* 53E90 80063E90 FD004230 */  andi       $v0, $v0, 0xFD
    /* 53E94 80063E94 070062A0 */  sb         $v0, 0x7($v1)
    /* 53E98 80063E98 2000A38F */  lw         $v1, 0x20($sp)
    /* 53E9C 80063E9C 00FF083C */  lui        $t0, (0xFF000000 >> 16)
    /* 53EA0 80063EA0 07006290 */  lbu        $v0, 0x7($v1)
    /* 53EA4 80063EA4 21202002 */  addu       $a0, $s1, $zero
    /* 53EA8 80063EA8 FE004230 */  andi       $v0, $v0, 0xFE
    /* 53EAC 80063EAC 070062A0 */  sb         $v0, 0x7($v1)
    /* 53EB0 80063EB0 1280023C */  lui        $v0, %hi(ThisOt)
    /* 53EB4 80063EB4 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 53EB8 80063EB8 2000A68F */  lw         $a2, 0x20($sp)
    /* 53EBC 80063EBC 2128A200 */  addu       $a1, $a1, $v0
    /* 53EC0 80063EC0 0000C38C */  lw         $v1, 0x0($a2)
    /* 53EC4 80063EC4 0000A28C */  lw         $v0, 0x0($a1)
    /* 53EC8 80063EC8 24186800 */  and        $v1, $v1, $t0
    /* 53ECC 80063ECC 24104700 */  and        $v0, $v0, $a3
    /* 53ED0 80063ED0 25186200 */  or         $v1, $v1, $v0
    /* 53ED4 80063ED4 0000C3AC */  sw         $v1, 0x0($a2)
    /* 53ED8 80063ED8 0000A28C */  lw         $v0, 0x0($a1)
    /* 53EDC 80063EDC 2430C700 */  and        $a2, $a2, $a3
    /* 53EE0 80063EE0 24104800 */  and        $v0, $v0, $t0
    /* 53EE4 80063EE4 25104600 */  or         $v0, $v0, $a2
    /* 53EE8 80063EE8 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 53EEC 80063EEC 0000A2AC */   sw        $v0, 0x0($a1)
    /* 53EF0 80063EF0 5B00E482 */  lb         $a0, 0x5B($s7)
    /* 53EF4 80063EF4 0335010C */  jal        ChangeLightColour__Fii
    /* 53EF8 80063EF8 40000524 */   addiu     $a1, $zero, 0x40
    /* 53EFC 80063EFC C98F0108 */  j          .L80063F24
    /* 53F00 80063F00 00000000 */   nop
  jlabel .L80063F04
    /* 53F04 80063F04 1180023C */  lui        $v0, %hi(D_80117770)
    /* 53F08 80063F08 70774224 */  addiu      $v0, $v0, %lo(D_80117770)
    /* 53F0C 80063F0C 05004010 */  beqz       $v0, .L80063F24
    /* 53F10 80063F10 21200000 */   addu      $a0, $zero, $zero
    /* 53F14 80063F14 1180053C */  lui        $a1, %hi(D_80117780)
    /* 53F18 80063F18 8077A524 */  addiu      $a1, $a1, %lo(D_80117780)
    /* 53F1C 80063F1C A583000C */  jal        DBG_Error
    /* 53F20 80063F20 B10C0624 */   addiu     $a2, $zero, 0xCB1
  .L80063F24:
    /* 53F24 80063F24 4800BF8F */  lw         $ra, 0x48($sp)
    /* 53F28 80063F28 4400B78F */  lw         $s7, 0x44($sp)
    /* 53F2C 80063F2C 4000B68F */  lw         $s6, 0x40($sp)
    /* 53F30 80063F30 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 53F34 80063F34 3800B48F */  lw         $s4, 0x38($sp)
    /* 53F38 80063F38 3400B38F */  lw         $s3, 0x34($sp)
    /* 53F3C 80063F3C 3000B28F */  lw         $s2, 0x30($sp)
    /* 53F40 80063F40 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 53F44 80063F44 2800B08F */  lw         $s0, 0x28($sp)
    /* 53F48 80063F48 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 53F4C 80063F4C 0800E003 */  jr         $ra
    /* 53F50 80063F50 00000000 */   nop
endlabel do_spell_anim__FiiiP12PlayerStruct
