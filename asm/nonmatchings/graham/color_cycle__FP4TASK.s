.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching color_cycle__FP4TASK, 0x3C0

glabel color_cycle__FP4TASK
    /* 8DCB0 8009DCB0 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 8DCB4 8009DCB4 7C00B1AF */  sw         $s1, 0x7C($sp)
    /* 8DCB8 8009DCB8 21880000 */  addu       $s1, $zero, $zero
    /* 8DCBC 8009DCBC 8800BFAF */  sw         $ra, 0x88($sp)
    /* 8DCC0 8009DCC0 8400B3AF */  sw         $s3, 0x84($sp)
    /* 8DCC4 8009DCC4 8000B2AF */  sw         $s2, 0x80($sp)
    /* 8DCC8 8009DCC8 7800B0AF */  sw         $s0, 0x78($sp)
    /* 8DCCC 8009DCCC 260980A7 */  sh         $zero, %gp_rel(penta_clut)($gp)
    /* 8DCD0 8009DCD0 240980A7 */  sh         $zero, %gp_rel(water_clut)($gp)
  .L8009DCD4:
    /* 8DCD4 8009DCD4 C16E020C */  jal        GLUE_Finished__Fv
    /* 8DCD8 8009DCD8 00000000 */   nop
    /* 8DCDC 8009DCDC DC004014 */  bnez       $v0, .L8009E050
    /* 8DCE0 8009DCE0 00000000 */   nop
    /* 8DCE4 8009DCE4 EE80000C */  jal        TSK_Sleep
    /* 8DCE8 8009DCE8 01000424 */   addiu     $a0, $zero, 0x1
    /* 8DCEC 8009DCEC 24098297 */  lhu        $v0, %gp_rel(water_clut)($gp)
    /* 8DCF0 8009DCF0 00000000 */  nop
    /* 8DCF4 8009DCF4 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 8DCF8 8009DCF8 F6FF6010 */  beqz       $v1, .L8009DCD4
    /* 8DCFC 8009DCFC 21200000 */   addu      $a0, $zero, $zero
    /* 8DD00 8009DD00 3F004230 */  andi       $v0, $v0, 0x3F
    /* 8DD04 8009DD04 00110200 */  sll        $v0, $v0, 4
    /* 8DD08 8009DD08 1000A2A7 */  sh         $v0, 0x10($sp)
    /* 8DD0C 8009DD0C 82110300 */  srl        $v0, $v1, 6
    /* 8DD10 8009DD10 1200A2A7 */  sh         $v0, 0x12($sp)
    /* 8DD14 8009DD14 10000224 */  addiu      $v0, $zero, 0x10
    /* 8DD18 8009DD18 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 8DD1C 8009DD1C 01000224 */  addiu      $v0, $zero, 0x1
    /* 8DD20 8009DD20 9E4E000C */  jal        DrawSync
    /* 8DD24 8009DD24 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 8DD28 8009DD28 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8DD2C 8009DD2C 614F000C */  jal        StoreImage
    /* 8DD30 8009DD30 1800A527 */   addiu     $a1, $sp, 0x18
    /* 8DD34 8009DD34 21480000 */  addu       $t1, $zero, $zero
    /* 8DD38 8009DD38 1000A727 */  addiu      $a3, $sp, 0x10
    /* 8DD3C 8009DD3C 3000AC27 */  addiu      $t4, $sp, 0x30
    /* 8DD40 8009DD40 12800B3C */  lui        $t3, %hi(setlevel)
    /* 8DD44 8009DD44 0EC16B91 */  lbu        $t3, %lo(setlevel)($t3)
    /* 8DD48 8009DD48 12800A3C */  lui        $t2, %hi(setlvlnum)
    /* 8DD4C 8009DD4C 0FC14A91 */  lbu        $t2, %lo(setlvlnum)($t2)
  .L8009DD50:
    /* 8DD50 8009DD50 2A10EC00 */  slt        $v0, $a3, $t4
    /* 8DD54 8009DD54 1F004010 */  beqz       $v0, .L8009DDD4
    /* 8DD58 8009DD58 01001024 */   addiu     $s0, $zero, 0x1
    /* 8DD5C 8009DD5C 0800E894 */  lhu        $t0, 0x8($a3)
    /* 8DD60 8009DD60 00000000 */  nop
    /* 8DD64 8009DD64 1F000531 */  andi       $a1, $t0, 0x1F
    /* 8DD68 8009DD68 FFFF0331 */  andi       $v1, $t0, 0xFFFF
    /* 8DD6C 8009DD6C 42110300 */  srl        $v0, $v1, 5
    /* 8DD70 8009DD70 1F004430 */  andi       $a0, $v0, 0x1F
    /* 8DD74 8009DD74 821A0300 */  srl        $v1, $v1, 10
    /* 8DD78 8009DD78 0B006011 */  beqz       $t3, .L8009DDA8
    /* 8DD7C 8009DD7C 1F006630 */   andi      $a2, $v1, 0x1F
    /* 8DD80 8009DD80 04000224 */  addiu      $v0, $zero, 0x4
    /* 8DD84 8009DD84 08004215 */  bne        $t2, $v0, .L8009DDA8
    /* 8DD88 8009DD88 08002229 */   slti      $v0, $t1, 0x8
    /* 8DD8C 8009DD8C 03004014 */  bnez       $v0, .L8009DD9C
    /* 8DD90 8009DD90 08002425 */   addiu     $a0, $t1, 0x8
    /* 8DD94 8009DD94 18000224 */  addiu      $v0, $zero, 0x18
    /* 8DD98 8009DD98 23204900 */  subu       $a0, $v0, $t1
  .L8009DD9C:
    /* 8DD9C 8009DD9C 21288000 */  addu       $a1, $a0, $zero
    /* 8DDA0 8009DDA0 21300000 */  addu       $a2, $zero, $zero
    /* 8DDA4 8009DDA4 01002925 */  addiu      $t1, $t1, 0x1
  .L8009DDA8:
    /* 8DDA8 8009DDA8 FF00A330 */  andi       $v1, $a1, 0xFF
    /* 8DDAC 8009DDAC FF008230 */  andi       $v0, $a0, 0xFF
    /* 8DDB0 8009DDB0 40110200 */  sll        $v0, $v0, 5
    /* 8DDB4 8009DDB4 25186200 */  or         $v1, $v1, $v0
    /* 8DDB8 8009DDB8 80120600 */  sll        $v0, $a2, 10
    /* 8DDBC 8009DDBC 25186200 */  or         $v1, $v1, $v0
    /* 8DDC0 8009DDC0 00800231 */  andi       $v0, $t0, 0x8000
    /* 8DDC4 8009DDC4 25186200 */  or         $v1, $v1, $v0
    /* 8DDC8 8009DDC8 2800E3A4 */  sh         $v1, 0x28($a3)
    /* 8DDCC 8009DDCC 54770208 */  j          .L8009DD50
    /* 8DDD0 8009DDD0 0200E724 */   addiu     $a3, $a3, 0x2
  .L8009DDD4:
    /* 8DDD4 8009DDD4 5A00B327 */  addiu      $s3, $sp, 0x5A
    /* 8DDD8 8009DDD8 8888123C */  lui        $s2, (0x88888889 >> 16)
    /* 8DDDC 8009DDDC 89885236 */  ori        $s2, $s2, (0x88888889 & 0xFFFF)
  .L8009DDE0:
    /* 8DDE0 8009DDE0 C16E020C */  jal        GLUE_Finished__Fv
    /* 8DDE4 8009DDE4 00000000 */   nop
    /* 8DDE8 8009DDE8 01004238 */  xori       $v0, $v0, 0x1
    /* 8DDEC 8009DDEC 98004010 */  beqz       $v0, .L8009E050
    /* 8DDF0 8009DDF0 00000000 */   nop
    /* 8DDF4 8009DDF4 24098297 */  lhu        $v0, %gp_rel(water_clut)($gp)
    /* 8DDF8 8009DDF8 00000000 */  nop
    /* 8DDFC 8009DDFC 90004010 */  beqz       $v0, .L8009E040
    /* 8DE00 8009DE00 00000000 */   nop
    /* 8DE04 8009DE04 1280023C */  lui        $v0, %hi(DoDrawBg)
    /* 8DE08 8009DE08 04B0428C */  lw         $v0, %lo(DoDrawBg)($v0)
    /* 8DE0C 8009DE0C 00000000 */  nop
    /* 8DE10 8009DE10 8B004010 */  beqz       $v0, .L8009E040
    /* 8DE14 8009DE14 00000000 */   nop
    /* 8DE18 8009DE18 1280023C */  lui        $v0, %hi(PauseMode)
    /* 8DE1C 8009DE1C A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 8DE20 8009DE20 00000000 */  nop
    /* 8DE24 8009DE24 86004014 */  bnez       $v0, .L8009E040
    /* 8DE28 8009DE28 00000000 */   nop
    /* 8DE2C 8009DE2C 1280023C */  lui        $v0, %hi(WaterDone)
    /* 8DE30 8009DE30 48BA428C */  lw         $v0, %lo(WaterDone)($v0)
    /* 8DE34 8009DE34 00000000 */  nop
    /* 8DE38 8009DE38 5F004010 */  beqz       $v0, .L8009DFB8
    /* 8DE3C 8009DE3C 21280000 */   addu      $a1, $zero, $zero
    /* 8DE40 8009DE40 5E000012 */  beqz       $s0, .L8009DFBC
    /* 8DE44 8009DE44 3A00A727 */   addiu     $a3, $sp, 0x3A
    /* 8DE48 8009DE48 1280023C */  lui        $v0, %hi(setlevel)
    /* 8DE4C 8009DE4C 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 8DE50 8009DE50 00000000 */  nop
    /* 8DE54 8009DE54 59004010 */  beqz       $v0, .L8009DFBC
    /* 8DE58 8009DE58 04000224 */   addiu     $v0, $zero, 0x4
    /* 8DE5C 8009DE5C 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 8DE60 8009DE60 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 8DE64 8009DE64 00000000 */  nop
    /* 8DE68 8009DE68 55006214 */  bne        $v1, $v0, .L8009DFC0
    /* 8DE6C 8009DE6C 21306002 */   addu      $a2, $s3, $zero
    /* 8DE70 8009DE70 21800000 */  addu       $s0, $zero, $zero
    /* 8DE74 8009DE74 01000A24 */  addiu      $t2, $zero, 0x1
  .L8009DE78:
    /* 8DE78 8009DE78 10004229 */  slti       $v0, $t2, 0x10
    /* 8DE7C 8009DE7C 4D004010 */  beqz       $v0, .L8009DFB4
    /* 8DE80 8009DE80 40180A00 */   sll       $v1, $t2, 1
    /* 8DE84 8009DE84 1000A227 */  addiu      $v0, $sp, 0x10
    /* 8DE88 8009DE88 21606200 */  addu       $t4, $v1, $v0
    /* 8DE8C 8009DE8C 08008B95 */  lhu        $t3, 0x8($t4)
    /* 8DE90 8009DE90 28008395 */  lhu        $v1, 0x28($t4)
    /* 8DE94 8009DE94 1F006E31 */  andi       $t6, $t3, 0x1F
    /* 8DE98 8009DE98 FFFF6431 */  andi       $a0, $t3, 0xFFFF
    /* 8DE9C 8009DE9C 42110400 */  srl        $v0, $a0, 5
    /* 8DEA0 8009DEA0 1F004D30 */  andi       $t5, $v0, 0x1F
    /* 8DEA4 8009DEA4 1F006630 */  andi       $a2, $v1, 0x1F
    /* 8DEA8 8009DEA8 2140C000 */  addu       $t0, $a2, $zero
    /* 8DEAC 8009DEAC FFFF6330 */  andi       $v1, $v1, 0xFFFF
    /* 8DEB0 8009DEB0 42110300 */  srl        $v0, $v1, 5
    /* 8DEB4 8009DEB4 1F004930 */  andi       $t1, $v0, 0x1F
    /* 8DEB8 8009DEB8 21382001 */  addu       $a3, $t1, $zero
    /* 8DEBC 8009DEBC 821A0300 */  srl        $v1, $v1, 10
    /* 8DEC0 8009DEC0 1F006330 */  andi       $v1, $v1, 0x1F
    /* 8DEC4 8009DEC4 82220400 */  srl        $a0, $a0, 10
    /* 8DEC8 8009DEC8 1F008430 */  andi       $a0, $a0, 0x1F
    /* 8DECC 8009DECC 2B100401 */  sltu       $v0, $t0, $a0
    /* 8DED0 8009DED0 03004010 */  beqz       $v0, .L8009DEE0
    /* 8DED4 8009DED4 21286000 */   addu      $a1, $v1, $zero
    /* 8DED8 8009DED8 0100C824 */  addiu      $t0, $a2, 0x1
    /* 8DEDC 8009DEDC 01001024 */  addiu      $s0, $zero, 0x1
  .L8009DEE0:
    /* 8DEE0 8009DEE0 FF000231 */  andi       $v0, $t0, 0xFF
    /* 8DEE4 8009DEE4 2B108200 */  sltu       $v0, $a0, $v0
    /* 8DEE8 8009DEE8 03004010 */  beqz       $v0, .L8009DEF8
    /* 8DEEC 8009DEEC FF00E230 */   andi      $v0, $a3, 0xFF
    /* 8DEF0 8009DEF0 FFFF0825 */  addiu      $t0, $t0, -0x1
    /* 8DEF4 8009DEF4 01001024 */  addiu      $s0, $zero, 0x1
  .L8009DEF8:
    /* 8DEF8 8009DEF8 FF00A431 */  andi       $a0, $t5, 0xFF
    /* 8DEFC 8009DEFC 2B104400 */  sltu       $v0, $v0, $a0
    /* 8DF00 8009DF00 04004010 */  beqz       $v0, .L8009DF14
    /* 8DF04 8009DF04 FF00E230 */   andi      $v0, $a3, 0xFF
    /* 8DF08 8009DF08 01002725 */  addiu      $a3, $t1, 0x1
    /* 8DF0C 8009DF0C 01001024 */  addiu      $s0, $zero, 0x1
    /* 8DF10 8009DF10 FF00E230 */  andi       $v0, $a3, 0xFF
  .L8009DF14:
    /* 8DF14 8009DF14 2B108200 */  sltu       $v0, $a0, $v0
    /* 8DF18 8009DF18 03004010 */  beqz       $v0, .L8009DF28
    /* 8DF1C 8009DF1C FF00A230 */   andi      $v0, $a1, 0xFF
    /* 8DF20 8009DF20 FFFFE724 */  addiu      $a3, $a3, -0x1
    /* 8DF24 8009DF24 01001024 */  addiu      $s0, $zero, 0x1
  .L8009DF28:
    /* 8DF28 8009DF28 FF00C431 */  andi       $a0, $t6, 0xFF
    /* 8DF2C 8009DF2C 2B104400 */  sltu       $v0, $v0, $a0
    /* 8DF30 8009DF30 04004010 */  beqz       $v0, .L8009DF44
    /* 8DF34 8009DF34 FF00A230 */   andi      $v0, $a1, 0xFF
    /* 8DF38 8009DF38 01006524 */  addiu      $a1, $v1, 0x1
    /* 8DF3C 8009DF3C 01001024 */  addiu      $s0, $zero, 0x1
    /* 8DF40 8009DF40 FF00A230 */  andi       $v0, $a1, 0xFF
  .L8009DF44:
    /* 8DF44 8009DF44 2B108200 */  sltu       $v0, $a0, $v0
    /* 8DF48 8009DF48 04004010 */  beqz       $v0, .L8009DF5C
    /* 8DF4C 8009DF4C FF00A230 */   andi      $v0, $a1, 0xFF
    /* 8DF50 8009DF50 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 8DF54 8009DF54 01001024 */  addiu      $s0, $zero, 0x1
    /* 8DF58 8009DF58 FF00A230 */  andi       $v0, $a1, 0xFF
  .L8009DF5C:
    /* 8DF5C 8009DF5C 2B104400 */  sltu       $v0, $v0, $a0
    /* 8DF60 8009DF60 04004010 */  beqz       $v0, .L8009DF74
    /* 8DF64 8009DF64 FF00A230 */   andi      $v0, $a1, 0xFF
    /* 8DF68 8009DF68 0100A524 */  addiu      $a1, $a1, 0x1
    /* 8DF6C 8009DF6C 01001024 */  addiu      $s0, $zero, 0x1
    /* 8DF70 8009DF70 FF00A230 */  andi       $v0, $a1, 0xFF
  .L8009DF74:
    /* 8DF74 8009DF74 2B108200 */  sltu       $v0, $a0, $v0
    /* 8DF78 8009DF78 03004010 */  beqz       $v0, .L8009DF88
    /* 8DF7C 8009DF7C FF000331 */   andi      $v1, $t0, 0xFF
    /* 8DF80 8009DF80 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 8DF84 8009DF84 01001024 */  addiu      $s0, $zero, 0x1
  .L8009DF88:
    /* 8DF88 8009DF88 FF00E230 */  andi       $v0, $a3, 0xFF
    /* 8DF8C 8009DF8C 40110200 */  sll        $v0, $v0, 5
    /* 8DF90 8009DF90 21186200 */  addu       $v1, $v1, $v0
    /* 8DF94 8009DF94 FF00A230 */  andi       $v0, $a1, 0xFF
    /* 8DF98 8009DF98 80120200 */  sll        $v0, $v0, 10
    /* 8DF9C 8009DF9C 21186200 */  addu       $v1, $v1, $v0
    /* 8DFA0 8009DFA0 00806231 */  andi       $v0, $t3, 0x8000
    /* 8DFA4 8009DFA4 21186200 */  addu       $v1, $v1, $v0
    /* 8DFA8 8009DFA8 280083A5 */  sh         $v1, 0x28($t4)
    /* 8DFAC 8009DFAC 9E770208 */  j          .L8009DE78
    /* 8DFB0 8009DFB0 01004A25 */   addiu     $t2, $t2, 0x1
  .L8009DFB4:
    /* 8DFB4 8009DFB4 21280000 */  addu       $a1, $zero, $zero
  .L8009DFB8:
    /* 8DFB8 8009DFB8 3A00A727 */  addiu      $a3, $sp, 0x3A
  .L8009DFBC:
    /* 8DFBC 8009DFBC 21306002 */  addu       $a2, $s3, $zero
  .L8009DFC0:
    /* 8DFC0 8009DFC0 21202502 */  addu       $a0, $s1, $a1
    /* 8DFC4 8009DFC4 18009200 */  mult       $a0, $s2
    /* 8DFC8 8009DFC8 C3170400 */  sra        $v0, $a0, 31
    /* 8DFCC 8009DFCC 10780000 */  mfhi       $t7
    /* 8DFD0 8009DFD0 2118E401 */  addu       $v1, $t7, $a0
    /* 8DFD4 8009DFD4 C3180300 */  sra        $v1, $v1, 3
    /* 8DFD8 8009DFD8 23186200 */  subu       $v1, $v1, $v0
    /* 8DFDC 8009DFDC 00110300 */  sll        $v0, $v1, 4
    /* 8DFE0 8009DFE0 23104300 */  subu       $v0, $v0, $v1
    /* 8DFE4 8009DFE4 23208200 */  subu       $a0, $a0, $v0
    /* 8DFE8 8009DFE8 40200400 */  sll        $a0, $a0, 1
    /* 8DFEC 8009DFEC 2120E400 */  addu       $a0, $a3, $a0
    /* 8DFF0 8009DFF0 00008294 */  lhu        $v0, 0x0($a0)
    /* 8DFF4 8009DFF4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 8DFF8 8009DFF8 0000C2A4 */  sh         $v0, 0x0($a2)
    /* 8DFFC 8009DFFC 0F00A228 */  slti       $v0, $a1, 0xF
    /* 8E000 8009E000 EFFF4014 */  bnez       $v0, .L8009DFC0
    /* 8E004 8009E004 0200C624 */   addiu     $a2, $a2, 0x2
    /* 8E008 8009E008 5800A0A7 */  sh         $zero, 0x58($sp)
    /* 8E00C 8009E00C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8E010 8009E010 494F000C */  jal        LoadImage
    /* 8E014 8009E014 5800A527 */   addiu     $a1, $sp, 0x58
    /* 8E018 8009E018 01003126 */  addiu      $s1, $s1, 0x1
    /* 8E01C 8009E01C 18003202 */  mult       $s1, $s2
    /* 8E020 8009E020 C3171100 */  sra        $v0, $s1, 31
    /* 8E024 8009E024 10780000 */  mfhi       $t7
    /* 8E028 8009E028 2118F101 */  addu       $v1, $t7, $s1
    /* 8E02C 8009E02C C3180300 */  sra        $v1, $v1, 3
    /* 8E030 8009E030 23186200 */  subu       $v1, $v1, $v0
    /* 8E034 8009E034 00110300 */  sll        $v0, $v1, 4
    /* 8E038 8009E038 23104300 */  subu       $v0, $v0, $v1
    /* 8E03C 8009E03C 23882202 */  subu       $s1, $s1, $v0
  .L8009E040:
    /* 8E040 8009E040 EE80000C */  jal        TSK_Sleep
    /* 8E044 8009E044 04000424 */   addiu     $a0, $zero, 0x4
    /* 8E048 8009E048 78770208 */  j          .L8009DDE0
    /* 8E04C 8009E04C 00000000 */   nop
  .L8009E050:
    /* 8E050 8009E050 8800BF8F */  lw         $ra, 0x88($sp)
    /* 8E054 8009E054 8400B38F */  lw         $s3, 0x84($sp)
    /* 8E058 8009E058 8000B28F */  lw         $s2, 0x80($sp)
    /* 8E05C 8009E05C 7C00B18F */  lw         $s1, 0x7C($sp)
    /* 8E060 8009E060 7800B08F */  lw         $s0, 0x78($sp)
    /* 8E064 8009E064 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 8E068 8009E068 0800E003 */  jr         $ra
    /* 8E06C 8009E06C 00000000 */   nop
endlabel color_cycle__FP4TASK
