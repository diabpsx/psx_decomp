.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BgTask__FP4TASK, 0x4AC

glabel BgTask__FP4TASK
    /* 8BCB4 8009BCB4 60FDBD27 */  addiu      $sp, $sp, -0x2A0
    /* 8BCB8 8009BCB8 8402B1AF */  sw         $s1, 0x284($sp)
    /* 8BCBC 8009BCBC FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 8BCC0 8009BCC0 8C02B3AF */  sw         $s3, 0x28C($sp)
    /* 8BCC4 8009BCC4 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 8BCC8 8009BCC8 9C02BFAF */  sw         $ra, 0x29C($sp)
    /* 8BCCC 8009BCCC 9802B6AF */  sw         $s6, 0x298($sp)
    /* 8BCD0 8009BCD0 9402B5AF */  sw         $s5, 0x294($sp)
    /* 8BCD4 8009BCD4 9002B4AF */  sw         $s4, 0x290($sp)
    /* 8BCD8 8009BCD8 8802B2AF */  sw         $s2, 0x288($sp)
    /* 8BCDC 8009BCDC 8002B0AF */  sw         $s0, 0x280($sp)
    /* 8BCE0 8009BCE0 1C00828C */  lw         $v0, 0x1C($a0)
    /* 8BCE4 8009BCE4 21200000 */  addu       $a0, $zero, $zero
    /* 8BCE8 8009BCE8 401F80AF */  sw         $zero, %gp_rel(D_8011C6C0)($gp)
    /* 8BCEC 8009BCEC 441F80AF */  sw         $zero, %gp_rel(D_8011C6C4)($gp)
    /* 8BCF0 8009BCF0 0400438C */  lw         $v1, 0x4($v0)
    /* 8BCF4 8009BCF4 0800508C */  lw         $s0, 0x8($v0)
    /* 8BCF8 8009BCF8 0000548C */  lw         $s4, 0x0($v0)
    /* 8BCFC 8009BCFC E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 8BD00 8009BD00 2B900300 */   sltu      $s2, $zero, $v1
    /* 8BD04 8009BD04 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 8BD08 8009BD08 21200000 */   addu      $a0, $zero, $zero
    /* 8BD0C 8009BD0C EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 8BD10 8009BD10 21200000 */   addu      $a0, $zero, $zero
    /* 8BD14 8009BD14 C46E020C */  jal        GLUE_SetFinished__Fb
    /* 8BD18 8009BD18 21200000 */   addu      $a0, $zero, $zero
    /* 8BD1C 8009BD1C 0E80153C */  lui        $s5, %hi(plr)
    /* 8BD20 8009BD20 38A5B526 */  addiu      $s5, $s5, %lo(plr)
    /* 8BD24 8009BD24 1280023C */  lui        $v0, %hi(currlevel)
    /* 8BD28 8009BD28 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 8BD2C 8009BD2C 00000000 */  nop
    /* 8BD30 8009BD30 F1FF4224 */  addiu      $v0, $v0, -0xF
    /* 8BD34 8009BD34 0200422C */  sltiu      $v0, $v0, 0x2
    /* 8BD38 8009BD38 07004010 */  beqz       $v0, .L8009BD58
    /* 8BD3C 8009BD3C E819B626 */   addiu     $s6, $s5, 0x19E8
    /* 8BD40 8009BD40 00800434 */  ori        $a0, $zero, 0x8000
    /* 8BD44 8009BD44 0A80053C */  lui        $a1, %hi(penta_cycle_task__FP4TASK)
    /* 8BD48 8009BD48 70E0A524 */  addiu      $a1, $a1, %lo(penta_cycle_task__FP4TASK)
    /* 8BD4C 8009BD4C 780C0624 */  addiu      $a2, $zero, 0xC78
    /* 8BD50 8009BD50 0480000C */  jal        TSK_AddTask
    /* 8BD54 8009BD54 21380000 */   addu      $a3, $zero, $zero
  .L8009BD58:
    /* 8BD58 8009BD58 00800434 */  ori        $a0, $zero, 0x8000
    /* 8BD5C 8009BD5C 0A80053C */  lui        $a1, %hi(color_cycle__FP4TASK)
    /* 8BD60 8009BD60 B0DCA524 */  addiu      $a1, $a1, %lo(color_cycle__FP4TASK)
    /* 8BD64 8009BD64 780C0624 */  addiu      $a2, $zero, 0xC78
    /* 8BD68 8009BD68 0480000C */  jal        TSK_AddTask
    /* 8BD6C 8009BD6C 21380000 */   addu      $a3, $zero, $zero
    /* 8BD70 8009BD70 02000424 */  addiu      $a0, $zero, 0x2
  .L8009BD74:
    /* 8BD74 8009BD74 EE80000C */  jal        TSK_Sleep
    /* 8BD78 8009BD78 00000000 */   nop
    /* 8BD7C 8009BD7C ABFB010C */  jal        GetFadeState__Fv
    /* 8BD80 8009BD80 00000000 */   nop
    /* 8BD84 8009BD84 FBFF4014 */  bnez       $v0, .L8009BD74
    /* 8BD88 8009BD88 01000424 */   addiu     $a0, $zero, 0x1
    /* 8BD8C 8009BD8C 03004012 */  beqz       $s2, .L8009BD9C
    /* 8BD90 8009BD90 00000000 */   nop
    /* 8BD94 8009BD94 6A6F0208 */  j          .L8009BDA8
    /* 8BD98 8009BD98 21800000 */   addu      $s0, $zero, $zero
  .L8009BD9C:
    /* 8BD9C 8009BD9C 866E020C */  jal        GLUE_GetMonsterList__Fv
    /* 8BDA0 8009BDA0 CE001124 */   addiu     $s1, $zero, 0xCE
    /* 8BDA4 8009BDA4 21984000 */  addu       $s3, $v0, $zero
  .L8009BDA8:
    /* 8BDA8 8009BDA8 1800A427 */  addiu      $a0, $sp, 0x18
    /* 8BDAC 8009BDAC 21288002 */  addu       $a1, $s4, $zero
    /* 8BDB0 8009BDB0 21302002 */  addu       $a2, $s1, $zero
    /* 8BDB4 8009BDB4 21380000 */  addu       $a3, $zero, $zero
    /* 8BDB8 8009BDB8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8BDBC 8009BDBC BF35020C */  jal        __7CBlocksiiiii
    /* 8BDC0 8009BDC0 1400B3AF */   sw        $s3, 0x14($sp)
    /* 8BDC4 8009BDC4 1800A427 */  addiu      $a0, $sp, 0x18
    /* 8BDC8 8009BDC8 4B71020C */  jal        SetTown__7CBlocksb
    /* 8BDCC 8009BDCC 21284002 */   addu      $a1, $s2, $zero
    /* 8BDD0 8009BDD0 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 8BDD4 8009BDD4 04000424 */   addiu     $a0, $zero, 0x4
    /* 8BDD8 8009BDD8 2001B027 */  addiu      $s0, $sp, 0x120
    /* 8BDDC 8009BDDC 21200002 */  addu       $a0, $s0, $zero
    /* 8BDE0 8009BDE0 21284002 */  addu       $a1, $s2, $zero
    /* 8BDE4 8009BDE4 1280073C */  lui        $a3, %hi(FePlayerNo)
    /* 8BDE8 8009BDE8 78B3E78C */  lw         $a3, %lo(FePlayerNo)($a3)
    /* 8BDEC 8009BDEC 1556020C */  jal        __7CPlayerbii
    /* 8BDF0 8009BDF0 21300000 */   addu      $a2, $zero, $zero
    /* 8BDF4 8009BDF4 B001B127 */  addiu      $s1, $sp, 0x1B0
    /* 8BDF8 8009BDF8 21202002 */  addu       $a0, $s1, $zero
    /* 8BDFC 8009BDFC 21284002 */  addu       $a1, $s2, $zero
    /* 8BE00 8009BE00 1280073C */  lui        $a3, %hi(FePlayerNo)
    /* 8BE04 8009BE04 78B3E78C */  lw         $a3, %lo(FePlayerNo)($a3)
    /* 8BE08 8009BE08 1556020C */  jal        __7CPlayerbii
    /* 8BE0C 8009BE0C 01000624 */   addiu     $a2, $zero, 0x1
    /* 8BE10 8009BE10 21200002 */  addu       $a0, $s0, $zero
    /* 8BE14 8009BE14 2128A002 */  addu       $a1, $s5, $zero
    /* 8BE18 8009BE18 21304002 */  addu       $a2, $s2, $zero
    /* 8BE1C 8009BE1C D470020C */  jal        MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2
    /* 8BE20 8009BE20 01000724 */   addiu     $a3, $zero, 0x1
    /* 8BE24 8009BE24 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 8BE28 8009BE28 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 8BE2C 8009BE2C 00000000 */  nop
    /* 8BE30 8009BE30 05004010 */  beqz       $v0, .L8009BE48
    /* 8BE34 8009BE34 21202002 */   addu      $a0, $s1, $zero
    /* 8BE38 8009BE38 2128C002 */  addu       $a1, $s6, $zero
    /* 8BE3C 8009BE3C 21304002 */  addu       $a2, $s2, $zero
    /* 8BE40 8009BE40 D470020C */  jal        MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2
    /* 8BE44 8009BE44 01000724 */   addiu     $a3, $zero, 0x1
  .L8009BE48:
    /* 8BE48 8009BE48 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 8BE4C 8009BE4C 01000424 */   addiu     $a0, $zero, 0x1
    /* 8BE50 8009BE50 7693020C */  jal        FinishProgress__Fv
    /* 8BE54 8009BE54 00000000 */   nop
    /* 8BE58 8009BE58 2A93020C */  jal        TakeDownCutScreen__Fv
    /* 8BE5C 8009BE5C 00000000 */   nop
    /* 8BE60 8009BE60 1280023C */  lui        $v0, %hi(leveltype)
    /* 8BE64 8009BE64 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 8BE68 8009BE68 00000000 */  nop
    /* 8BE6C 8009BE6C 03004010 */  beqz       $v0, .L8009BE7C
    /* 8BE70 8009BE70 00000000 */   nop
    /* 8BE74 8009BE74 A26F0208 */  j          .L8009BE88
    /* 8BE78 8009BE78 D0000424 */   addiu     $a0, $zero, 0xD0
  .L8009BE7C:
    /* 8BE7C 8009BE7C 1836020C */  jal        SetTownersGraphics__7CBlocks
    /* 8BE80 8009BE80 1800A427 */   addiu     $a0, $sp, 0x18
    /* 8BE84 8009BE84 CD000424 */  addiu      $a0, $zero, 0xCD
  .L8009BE88:
    /* 8BE88 8009BE88 044F020C */  jal        GM_UseTexData__Fi
    /* 8BE8C 8009BE8C 00000000 */   nop
    /* 8BE90 8009BE90 1280013C */  lui        $at, %hi(MissDat)
    /* 8BE94 8009BE94 28BC22AC */  sw         $v0, %lo(MissDat)($at)
    /* 8BE98 8009BE98 1280043C */  lui        $a0, %hi(leveltype)
    /* 8BE9C 8009BE9C 0DC18490 */  lbu        $a0, %lo(leveltype)($a0)
    /* 8BEA0 8009BEA0 B4DF010C */  jal        music_start__Fi
    /* 8BEA4 8009BEA4 00000000 */   nop
    /* 8BEA8 8009BEA8 7CFC010C */  jal        PaletteFadeIn__Fi
    /* 8BEAC 8009BEAC 08000424 */   addiu     $a0, $zero, 0x8
    /* 8BEB0 8009BEB0 2001B027 */  addiu      $s0, $sp, 0x120
    /* 8BEB4 8009BEB4 21200002 */  addu       $a0, $s0, $zero
    /* 8BEB8 8009BEB8 0E80053C */  lui        $a1, %hi(plr)
    /* 8BEBC 8009BEBC 38A5A524 */  addiu      $a1, $a1, %lo(plr)
    /* 8BEC0 8009BEC0 AA56020C */  jal        SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks
    /* 8BEC4 8009BEC4 1800A627 */   addiu     $a2, $sp, 0x18
    /* 8BEC8 8009BEC8 4D71020C */  jal        MoveToScrollTarget__7CBlocks_8009c534
    /* 8BECC 8009BECC 1800A427 */   addiu     $a0, $sp, 0x18
    /* 8BED0 8009BED0 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 8BED4 8009BED4 01000424 */   addiu     $a0, $zero, 0x1
    /* 8BED8 8009BED8 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 8BEDC 8009BEDC 01000424 */   addiu     $a0, $zero, 0x1
    /* 8BEE0 8009BEE0 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 8BEE4 8009BEE4 01000424 */   addiu     $a0, $zero, 0x1
    /* 8BEE8 8009BEE8 00800434 */  ori        $a0, $zero, 0x8000
    /* 8BEEC 8009BEEC 0A80053C */  lui        $a1, %hi(DaveLTask__FP4TASK)
    /* 8BEF0 8009BEF0 E406A524 */  addiu      $a1, $a1, %lo(DaveLTask__FP4TASK)
    /* 8BEF4 8009BEF4 00100624 */  addiu      $a2, $zero, 0x1000
    /* 8BEF8 8009BEF8 0480000C */  jal        TSK_AddTask
    /* 8BEFC 8009BEFC 21380000 */   addu      $a3, $zero, $zero
    /* 8BF00 8009BF00 4002A427 */  addiu      $a0, $sp, 0x240
    /* 8BF04 8009BF04 845D020C */  jal        __6GPaneli
    /* 8BF08 8009BF08 21280000 */   addu      $a1, $zero, $zero
    /* 8BF0C 8009BF0C 6002A427 */  addiu      $a0, $sp, 0x260
    /* 8BF10 8009BF10 845D020C */  jal        __6GPaneli
    /* 8BF14 8009BF14 21280000 */   addu      $a1, $zero, $zero
    /* 8BF18 8009BF18 1280013C */  lui        $at, %hi(gplayer)
    /* 8BF1C 8009BF1C 10B130AC */  sw         $s0, %lo(gplayer)($at)
    /* 8BF20 8009BF20 3E10020C */  jal        VID_GetTick__Fv
    /* 8BF24 8009BF24 00000000 */   nop
    /* 8BF28 8009BF28 1280023C */  lui        $v0, %hi(setlevel)
    /* 8BF2C 8009BF2C 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 8BF30 8009BF30 01000324 */  addiu      $v1, $zero, 0x1
    /* 8BF34 8009BF34 700880A3 */  sb         $zero, %gp_rel(D_8011AFF0)($gp)
    /* 8BF38 8009BF38 740883AF */  sw         $v1, %gp_rel(D_8011AFF4)($gp)
    /* 8BF3C 8009BF3C 0D004010 */  beqz       $v0, .L8009BF74
    /* 8BF40 8009BF40 00000000 */   nop
    /* 8BF44 8009BF44 1280023C */  lui        $v0, %hi(setlvlnum)
    /* 8BF48 8009BF48 0FC14290 */  lbu        $v0, %lo(setlvlnum)($v0)
    /* 8BF4C 8009BF4C 00000000 */  nop
    /* 8BF50 8009BF50 08004314 */  bne        $v0, $v1, .L8009BF74
    /* 8BF54 8009BF54 02000224 */   addiu     $v0, $zero, 0x2
    /* 8BF58 8009BF58 0E80033C */  lui        $v1, %hi(quests + 0xF2)
    /* 8BF5C 8009BF5C 32DB6390 */  lbu        $v1, %lo(quests + 0xF2)($v1)
    /* 8BF60 8009BF60 00000000 */  nop
    /* 8BF64 8009BF64 04006214 */  bne        $v1, $v0, .L8009BF78
    /* 8BF68 8009BF68 2001B027 */   addiu     $s0, $sp, 0x120
    /* 8BF6C 8009BF6C C6F5000C */  jal        PlaySFX__Fi
    /* 8BF70 8009BF70 54030424 */   addiu     $a0, $zero, 0x354
  .L8009BF74:
    /* 8BF74 8009BF74 2001B027 */  addiu      $s0, $sp, 0x120
  .L8009BF78:
    /* 8BF78 8009BF78 B001B127 */  addiu      $s1, $sp, 0x1B0
    /* 8BF7C 8009BF7C 0E80133C */  lui        $s3, %hi(plr)
    /* 8BF80 8009BF80 38A57326 */  addiu      $s3, $s3, %lo(plr)
    /* 8BF84 8009BF84 E8197426 */  addiu      $s4, $s3, 0x19E8
  .L8009BF88:
    /* 8BF88 8009BF88 C16E020C */  jal        GLUE_Finished__Fv
    /* 8BF8C 8009BF8C 00000000 */   nop
    /* 8BF90 8009BF90 01004238 */  xori       $v0, $v0, 0x1
    /* 8BF94 8009BF94 5E004010 */  beqz       $v0, .L8009C110
    /* 8BF98 8009BF98 B001A427 */   addiu     $a0, $sp, 0x1B0
    /* 8BF9C 8009BF9C 3E10020C */  jal        VID_GetTick__Fv
    /* 8BFA0 8009BFA0 00000000 */   nop
    /* 8BFA4 8009BFA4 3E10020C */  jal        VID_GetTick__Fv
    /* 8BFA8 8009BFA8 00000000 */   nop
    /* 8BFAC 8009BFAC 42F7010C */  jal        ResetFlames__Fv
    /* 8BFB0 8009BFB0 00000000 */   nop
    /* 8BFB4 8009BFB4 8408828F */  lw         $v0, %gp_rel(DoDrawBg)($gp)
    /* 8BFB8 8009BFB8 00000000 */  nop
    /* 8BFBC 8009BFBC 50004010 */  beqz       $v0, .L8009C100
    /* 8BFC0 8009BFC0 00000000 */   nop
    /* 8BFC4 8009BFC4 1280023C */  lui        $v0, %hi(PauseMode)
    /* 8BFC8 8009BFC8 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 8BFCC 8009BFCC 00000000 */  nop
    /* 8BFD0 8009BFD0 0C004014 */  bnez       $v0, .L8009C004
    /* 8BFD4 8009BFD4 00000000 */   nop
    /* 8BFD8 8009BFD8 401F828F */  lw         $v0, %gp_rel(D_8011C6C0)($gp)
    /* 8BFDC 8009BFDC 00000000 */  nop
    /* 8BFE0 8009BFE0 08004010 */  beqz       $v0, .L8009C004
    /* 8BFE4 8009BFE4 00000000 */   nop
    /* 8BFE8 8009BFE8 441F858F */  lw         $a1, %gp_rel(D_8011C6C4)($gp)
    /* 8BFEC 8009BFEC 3938020C */  jal        SetRandOffset__7CBlocksi
    /* 8BFF0 8009BFF0 1800A427 */   addiu     $a0, $sp, 0x18
    /* 8BFF4 8009BFF4 401F828F */  lw         $v0, %gp_rel(D_8011C6C0)($gp)
    /* 8BFF8 8009BFF8 00000000 */  nop
    /* 8BFFC 8009BFFC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 8C000 8009C000 401F82AF */  sw         $v0, %gp_rel(D_8011C6C0)($gp)
  .L8009C004:
    /* 8C004 8009C004 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 8C008 8009C008 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 8C00C 8009C00C 0E80053C */  lui        $a1, %hi(plr)
    /* 8C010 8009C010 38A5A524 */  addiu      $a1, $a1, %lo(plr)
    /* 8C014 8009C014 02004014 */  bnez       $v0, .L8009C020
    /* 8C018 8009C018 21200002 */   addu      $a0, $s0, $zero
    /* 8C01C 8009C01C E819A524 */  addiu      $a1, $a1, 0x19E8
  .L8009C020:
    /* 8C020 8009C020 AA56020C */  jal        SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks
    /* 8C024 8009C024 1800A627 */   addiu     $a2, $sp, 0x18
    /* 8C028 8009C028 341F828F */  lw         $v0, %gp_rel(D_8011C6B4)($gp)
    /* 8C02C 8009C02C 00000000 */  nop
    /* 8C030 8009C030 08004010 */  beqz       $v0, .L8009C054
    /* 8C034 8009C034 00000000 */   nop
    /* 8C038 8009C038 1280023C */  lui        $v0, %hi(deathflag)
    /* 8C03C 8009C03C 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 8C040 8009C040 00000000 */  nop
    /* 8C044 8009C044 03004014 */  bnez       $v0, .L8009C054
    /* 8C048 8009C048 00000000 */   nop
    /* 8C04C 8009C04C B445020C */  jal        DoScroll__7CBlocks
    /* 8C050 8009C050 1800A427 */   addiu     $a0, $sp, 0x18
  .L8009C054:
    /* 8C054 8009C054 5038020C */  jal        Print__7CBlocks
    /* 8C058 8009C058 1800A427 */   addiu     $a0, $sp, 0x18
    /* 8C05C 8009C05C 34A5010C */  jal        DrawAndBlit__Fv
    /* 8C060 8009C060 00000000 */   nop
    /* 8C064 8009C064 8008828F */  lw         $v0, %gp_rel(DoShowPanel)($gp)
    /* 8C068 8009C068 00000000 */  nop
    /* 8C06C 8009C06C 03004010 */  beqz       $v0, .L8009C07C
    /* 8C070 8009C070 4002A427 */   addiu     $a0, $sp, 0x240
    /* 8C074 8009C074 F36E020C */  jal        DoShowPanelGFX__FP6GPanelT0
    /* 8C078 8009C078 6002A527 */   addiu     $a1, $sp, 0x260
  .L8009C07C:
    /* 8C07C 8009C07C 21200002 */  addu       $a0, $s0, $zero
    /* 8C080 8009C080 21286002 */  addu       $a1, $s3, $zero
    /* 8C084 8009C084 21304002 */  addu       $a2, $s2, $zero
    /* 8C088 8009C088 D470020C */  jal        MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2
    /* 8C08C 8009C08C 21380000 */   addu      $a3, $zero, $zero
    /* 8C090 8009C090 21200002 */  addu       $a0, $s0, $zero
    /* 8C094 8009C094 21286002 */  addu       $a1, $s3, $zero
    /* 8C098 8009C098 A357020C */  jal        Print__7CPlayerR12PlayerStructR7CBlocks
    /* 8C09C 8009C09C 1800A627 */   addiu     $a2, $sp, 0x18
    /* 8C0A0 8009C0A0 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 8C0A4 8009C0A4 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 8C0A8 8009C0A8 00000000 */  nop
    /* 8C0AC 8009C0AC 09004010 */  beqz       $v0, .L8009C0D4
    /* 8C0B0 8009C0B0 21202002 */   addu      $a0, $s1, $zero
    /* 8C0B4 8009C0B4 21288002 */  addu       $a1, $s4, $zero
    /* 8C0B8 8009C0B8 21304002 */  addu       $a2, $s2, $zero
    /* 8C0BC 8009C0BC D470020C */  jal        MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2
    /* 8C0C0 8009C0C0 21380000 */   addu      $a3, $zero, $zero
    /* 8C0C4 8009C0C4 21202002 */  addu       $a0, $s1, $zero
    /* 8C0C8 8009C0C8 21288002 */  addu       $a1, $s4, $zero
    /* 8C0CC 8009C0CC A357020C */  jal        Print__7CPlayerR12PlayerStructR7CBlocks
    /* 8C0D0 8009C0D0 1800A627 */   addiu     $a2, $sp, 0x18
  .L8009C0D4:
    /* 8C0D4 8009C0D4 03004012 */  beqz       $s2, .L8009C0E4
    /* 8C0D8 8009C0D8 00000000 */   nop
    /* 8C0DC 8009C0DC 1BB3020C */  jal        DrawLBird__Fv
    /* 8C0E0 8009C0E0 00000000 */   nop
  .L8009C0E4:
    /* 8C0E4 8009C0E4 1280023C */  lui        $v0, %hi(deathflag)
    /* 8C0E8 8009C0E8 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 8C0EC 8009C0EC 00000000 */  nop
    /* 8C0F0 8009C0F0 03004010 */  beqz       $v0, .L8009C100
    /* 8C0F4 8009C0F4 00000000 */   nop
    /* 8C0F8 8009C0F8 8108020C */  jal        GO_DoGameOver__Fv
    /* 8C0FC 8009C0FC 00000000 */   nop
  .L8009C100:
    /* 8C100 8009C100 EE80000C */  jal        TSK_Sleep
    /* 8C104 8009C104 01000424 */   addiu     $a0, $zero, 0x1
    /* 8C108 8009C108 E26F0208 */  j          .L8009BF88
    /* 8C10C 8009C10C 00000000 */   nop
  .L8009C110:
    /* 8C110 8009C110 740880AF */  sw         $zero, %gp_rel(D_8011AFF4)($gp)
    /* 8C114 8009C114 6B56020C */  jal        ___7CPlayer
    /* 8C118 8009C118 02000524 */   addiu     $a1, $zero, 0x2
    /* 8C11C 8009C11C 2001A427 */  addiu      $a0, $sp, 0x120
    /* 8C120 8009C120 6B56020C */  jal        ___7CPlayer
    /* 8C124 8009C124 02000524 */   addiu     $a1, $zero, 0x2
    /* 8C128 8009C128 1800A427 */  addiu      $a0, $sp, 0x18
    /* 8C12C 8009C12C 5836020C */  jal        ___7CBlocks
    /* 8C130 8009C130 02000524 */   addiu     $a1, $zero, 0x2
    /* 8C134 8009C134 9C02BF8F */  lw         $ra, 0x29C($sp)
    /* 8C138 8009C138 9802B68F */  lw         $s6, 0x298($sp)
    /* 8C13C 8009C13C 9402B58F */  lw         $s5, 0x294($sp)
    /* 8C140 8009C140 9002B48F */  lw         $s4, 0x290($sp)
    /* 8C144 8009C144 8C02B38F */  lw         $s3, 0x28C($sp)
    /* 8C148 8009C148 8802B28F */  lw         $s2, 0x288($sp)
    /* 8C14C 8009C14C 8402B18F */  lw         $s1, 0x284($sp)
    /* 8C150 8009C150 8002B08F */  lw         $s0, 0x280($sp)
    /* 8C154 8009C154 A002BD27 */  addiu      $sp, $sp, 0x2A0
    /* 8C158 8009C158 0800E003 */  jr         $ra
    /* 8C15C 8009C15C 00000000 */   nop
endlabel BgTask__FP4TASK
