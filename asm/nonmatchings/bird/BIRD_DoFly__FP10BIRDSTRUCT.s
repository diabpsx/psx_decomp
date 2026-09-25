.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_DoFly__FP10BIRDSTRUCT, 0x2F8

glabel BIRD_DoFly__FP10BIRDSTRUCT
    /* 9C21C 800AC21C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9C220 800AC220 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C224 800AC224 21808000 */  addu       $s0, $a0, $zero
    /* 9C228 800AC228 2400BFAF */  sw         $ra, 0x24($sp)
    /* 9C22C 800AC22C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 9C230 800AC230 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9C234 800AC234 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9C238 800AC238 C9AE020C */  jal        GetPerch__FP10BIRDSTRUCT
    /* 9C23C 800AC23C 1400B1AF */   sw        $s1, 0x14($sp)
    /* 9C240 800AC240 0F000392 */  lbu        $v1, 0xF($s0)
    /* 9C244 800AC244 00000000 */  nop
    /* 9C248 800AC248 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 9C24C 800AC24C 0F0003A2 */  sb         $v1, 0xF($s0)
    /* 9C250 800AC250 001E0300 */  sll        $v1, $v1, 24
    /* 9C254 800AC254 6B006014 */  bnez       $v1, .L800AC404
    /* 9C258 800AC258 21A04000 */   addu      $s4, $v0, $zero
    /* 9C25C 800AC25C 280B828F */  lw         $v0, %gp_rel(D_8011B2A8)($gp)
    /* 9C260 800AC260 00000000 */  nop
    /* 9C264 800AC264 22004014 */  bnez       $v0, .L800AC2F0
    /* 9C268 800AC268 00000000 */   nop
    /* 9C26C 800AC26C C9F6000C */  jal        ENG_random__Fl
    /* 9C270 800AC270 14000424 */   addiu     $a0, $zero, 0x14
    /* 9C274 800AC274 14000392 */  lbu        $v1, 0x14($s0)
    /* 9C278 800AC278 0A004224 */  addiu      $v0, $v0, 0xA
    /* 9C27C 800AC27C 13006010 */  beqz       $v1, .L800AC2CC
    /* 9C280 800AC280 0F0002A2 */   sb        $v0, 0xF($s0)
    /* 9C284 800AC284 7EAE020C */  jal        BirdScared__FP10BIRDSTRUCT
    /* 9C288 800AC288 21200002 */   addu      $a0, $s0, $zero
    /* 9C28C 800AC28C 05004010 */  beqz       $v0, .L800AC2A4
    /* 9C290 800AC290 40101400 */   sll       $v0, $s4, 1
    /* 9C294 800AC294 C9F6000C */  jal        ENG_random__Fl
    /* 9C298 800AC298 08000424 */   addiu     $a0, $zero, 0x8
    /* 9C29C 800AC29C C9B00208 */  j          .L800AC324
    /* 9C2A0 800AC2A0 0D0002A2 */   sb        $v0, 0xD($s0)
  .L800AC2A4:
    /* 9C2A4 800AC2A4 08000482 */  lb         $a0, 0x8($s0)
    /* 9C2A8 800AC2A8 09000582 */  lb         $a1, 0x9($s0)
    /* 9C2AC 800AC2AC 1280013C */  lui        $at, %hi(D_8011B2A0)
    /* 9C2B0 800AC2B0 21082200 */  addu       $at, $at, $v0
    /* 9C2B4 800AC2B4 A0B22680 */  lb         $a2, %lo(D_8011B2A0)($at)
    /* 9C2B8 800AC2B8 1280013C */  lui        $at, %hi(D_8011B2A1)
    /* 9C2BC 800AC2BC 21082200 */  addu       $at, $at, $v0
    /* 9C2C0 800AC2C0 A1B22780 */  lb         $a3, %lo(D_8011B2A1)($at)
    /* 9C2C4 800AC2C4 B8B00208 */  j          .L800AC2E0
    /* 9C2C8 800AC2C8 00000000 */   nop
  .L800AC2CC:
    /* 9C2CC 800AC2CC 08000482 */  lb         $a0, 0x8($s0)
    /* 9C2D0 800AC2D0 0000028E */  lw         $v0, 0x0($s0)
    /* 9C2D4 800AC2D4 09000582 */  lb         $a1, 0x9($s0)
    /* 9C2D8 800AC2D8 08004680 */  lb         $a2, 0x8($v0)
    /* 9C2DC 800AC2DC 09004780 */  lb         $a3, 0x9($v0)
  .L800AC2E0:
    /* 9C2E0 800AC2E0 8AF6000C */  jal        GetDirection__Fiiii
    /* 9C2E4 800AC2E4 00000000 */   nop
    /* 9C2E8 800AC2E8 C9B00208 */  j          .L800AC324
    /* 9C2EC 800AC2EC 0D0002A2 */   sb        $v0, 0xD($s0)
  .L800AC2F0:
    /* 9C2F0 800AC2F0 08000482 */  lb         $a0, 0x8($s0)
    /* 9C2F4 800AC2F4 09000582 */  lb         $a1, 0x9($s0)
    /* 9C2F8 800AC2F8 0E80063C */  lui        $a2, %hi(plr + 0x30)
    /* 9C2FC 800AC2FC 68A5C684 */  lh         $a2, %lo(plr + 0x30)($a2)
    /* 9C300 800AC300 0E80073C */  lui        $a3, %hi(plr + 0x32)
    /* 9C304 800AC304 6AA5E784 */  lh         $a3, %lo(plr + 0x32)($a3)
    /* 9C308 800AC308 8AF6000C */  jal        GetDirection__Fiiii
    /* 9C30C 800AC30C 00000000 */   nop
    /* 9C310 800AC310 05000424 */  addiu      $a0, $zero, 0x5
    /* 9C314 800AC314 C9F6000C */  jal        ENG_random__Fl
    /* 9C318 800AC318 0D0002A2 */   sb        $v0, 0xD($s0)
    /* 9C31C 800AC31C 05004224 */  addiu      $v0, $v0, 0x5
    /* 9C320 800AC320 0F0002A2 */  sb         $v0, 0xF($s0)
  .L800AC324:
    /* 9C324 800AC324 14000292 */  lbu        $v0, 0x14($s0)
    /* 9C328 800AC328 00000000 */  nop
    /* 9C32C 800AC32C 48004010 */  beqz       $v0, .L800AC450
    /* 9C330 800AC330 00000000 */   nop
    /* 9C334 800AC334 7EAE020C */  jal        BirdScared__FP10BIRDSTRUCT
    /* 9C338 800AC338 21200002 */   addu      $a0, $s0, $zero
    /* 9C33C 800AC33C 31004014 */  bnez       $v0, .L800AC404
    /* 9C340 800AC340 00000000 */   nop
    /* 9C344 800AC344 280B828F */  lw         $v0, %gp_rel(D_8011B2A8)($gp)
    /* 9C348 800AC348 00000000 */  nop
    /* 9C34C 800AC34C 2D004014 */  bnez       $v0, .L800AC404
    /* 9C350 800AC350 21980000 */   addu      $s3, $zero, $zero
    /* 9C354 800AC354 0C000382 */  lb         $v1, 0xC($s0)
    /* 9C358 800AC358 13000282 */  lb         $v0, 0x13($s0)
    /* 9C35C 800AC35C 1280013C */  lui        $at, %hi(offset_x)
    /* 9C360 800AC360 21082300 */  addu       $at, $at, $v1
    /* 9C364 800AC364 A8C23180 */  lb         $s1, %lo(offset_x)($at)
    /* 9C368 800AC368 00000000 */  nop
    /* 9C36C 800AC36C 18002202 */  mult       $s1, $v0
    /* 9C370 800AC370 12880000 */  mflo       $s1
    /* 9C374 800AC374 1280013C */  lui        $at, %hi(offset_y)
    /* 9C378 800AC378 21082300 */  addu       $at, $at, $v1
    /* 9C37C 800AC37C B0C23280 */  lb         $s2, %lo(offset_y)($at)
    /* 9C380 800AC380 00000000 */  nop
    /* 9C384 800AC384 18004202 */  mult       $s2, $v0
    /* 9C388 800AC388 04000686 */  lh         $a2, 0x4($s0)
    /* 9C38C 800AC38C 06000786 */  lh         $a3, 0x6($s0)
    /* 9C390 800AC390 40101400 */  sll        $v0, $s4, 1
    /* 9C394 800AC394 2130D100 */  addu       $a2, $a2, $s1
    /* 9C398 800AC398 1280013C */  lui        $at, %hi(D_8011B2A0)
    /* 9C39C 800AC39C 21082200 */  addu       $at, $at, $v0
    /* 9C3A0 800AC3A0 A0B22480 */  lb         $a0, %lo(D_8011B2A0)($at)
    /* 9C3A4 800AC3A4 1280013C */  lui        $at, %hi(D_8011B2A1)
    /* 9C3A8 800AC3A8 21082200 */  addu       $at, $at, $v0
    /* 9C3AC 800AC3AC A1B22580 */  lb         $a1, %lo(D_8011B2A1)($at)
    /* 9C3B0 800AC3B0 C0200400 */  sll        $a0, $a0, 3
    /* 9C3B4 800AC3B4 C0280500 */  sll        $a1, $a1, 3
    /* 9C3B8 800AC3B8 12900000 */  mflo       $s2
    /* 9C3BC 800AC3BC B9AD020C */  jal        BirdDistanceOK__Fiiii
    /* 9C3C0 800AC3C0 2138F200 */   addu      $a3, $a3, $s2
    /* 9C3C4 800AC3C4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9C3C8 800AC3C8 0A004010 */  beqz       $v0, .L800AC3F4
    /* 9C3CC 800AC3CC 00000000 */   nop
    /* 9C3D0 800AC3D0 04000486 */  lh         $a0, 0x4($s0)
    /* 9C3D4 800AC3D4 06000586 */  lh         $a1, 0x6($s0)
    /* 9C3D8 800AC3D8 21209100 */  addu       $a0, $a0, $s1
    /* 9C3DC 800AC3DC C3200400 */  sra        $a0, $a0, 3
    /* 9C3E0 800AC3E0 2128B200 */  addu       $a1, $a1, $s2
    /* 9C3E4 800AC3E4 1383010C */  jal        SolidLoc__Fii
    /* 9C3E8 800AC3E8 C3280500 */   sra       $a1, $a1, 3
    /* 9C3EC 800AC3EC FF004230 */  andi       $v0, $v0, 0xFF
    /* 9C3F0 800AC3F0 0100532C */  sltiu      $s3, $v0, 0x1
  .L800AC3F4:
    /* 9C3F4 800AC3F4 03006012 */  beqz       $s3, .L800AC404
    /* 9C3F8 800AC3F8 00000000 */   nop
    /* 9C3FC 800AC3FC 45B1020C */  jal        BIRD_StartLanding__FP10BIRDSTRUCT
    /* 9C400 800AC400 21200002 */   addu      $a0, $s0, $zero
  .L800AC404:
    /* 9C404 800AC404 14000292 */  lbu        $v0, 0x14($s0)
    /* 9C408 800AC408 00000000 */  nop
    /* 9C40C 800AC40C 10004010 */  beqz       $v0, .L800AC450
    /* 9C410 800AC410 00000000 */   nop
    /* 9C414 800AC414 13000282 */  lb         $v0, 0x13($s0)
    /* 9C418 800AC418 00000000 */  nop
    /* 9C41C 800AC41C 32004228 */  slti       $v0, $v0, 0x32
    /* 9C420 800AC420 30004010 */  beqz       $v0, .L800AC4E4
    /* 9C424 800AC424 02000424 */   addiu     $a0, $zero, 0x2
    /* 9C428 800AC428 11000292 */  lbu        $v0, 0x11($s0)
    /* 9C42C 800AC42C 00000000 */  nop
    /* 9C430 800AC430 08004224 */  addiu      $v0, $v0, 0x8
    /* 9C434 800AC434 C9F6000C */  jal        ENG_random__Fl
    /* 9C438 800AC438 110002A2 */   sb        $v0, 0x11($s0)
    /* 9C43C 800AC43C 13000392 */  lbu        $v1, 0x13($s0)
    /* 9C440 800AC440 00000000 */  nop
    /* 9C444 800AC444 21186200 */  addu       $v1, $v1, $v0
    /* 9C448 800AC448 39B10208 */  j          .L800AC4E4
    /* 9C44C 800AC44C 130003A2 */   sb        $v1, 0x13($s0)
  .L800AC450:
    /* 9C450 800AC450 0000058E */  lw         $a1, 0x0($s0)
    /* 9C454 800AC454 00000000 */  nop
    /* 9C458 800AC458 1200A380 */  lb         $v1, 0x12($a1)
    /* 9C45C 800AC45C 03000224 */  addiu      $v0, $zero, 0x3
    /* 9C460 800AC460 21006210 */  beq        $v1, $v0, .L800AC4E8
    /* 9C464 800AC464 21200002 */   addu      $a0, $s0, $zero
    /* 9C468 800AC468 1F006010 */  beqz       $v1, .L800AC4E8
    /* 9C46C 800AC46C 00000000 */   nop
    /* 9C470 800AC470 13000482 */  lb         $a0, 0x13($s0)
    /* 9C474 800AC474 1300A380 */  lb         $v1, 0x13($a1)
    /* 9C478 800AC478 00000000 */  nop
    /* 9C47C 800AC47C 2A108300 */  slt        $v0, $a0, $v1
    /* 9C480 800AC480 06004010 */  beqz       $v0, .L800AC49C
    /* 9C484 800AC484 2A106400 */   slt       $v0, $v1, $a0
    /* 9C488 800AC488 C9F6000C */  jal        ENG_random__Fl
    /* 9C48C 800AC48C 02000424 */   addiu     $a0, $zero, 0x2
    /* 9C490 800AC490 13000392 */  lbu        $v1, 0x13($s0)
    /* 9C494 800AC494 2EB10208 */  j          .L800AC4B8
    /* 9C498 800AC498 21186200 */   addu      $v1, $v1, $v0
  .L800AC49C:
    /* 9C49C 800AC49C 07004010 */  beqz       $v0, .L800AC4BC
    /* 9C4A0 800AC4A0 00000000 */   nop
    /* 9C4A4 800AC4A4 C9F6000C */  jal        ENG_random__Fl
    /* 9C4A8 800AC4A8 02000424 */   addiu     $a0, $zero, 0x2
    /* 9C4AC 800AC4AC 13000392 */  lbu        $v1, 0x13($s0)
    /* 9C4B0 800AC4B0 00000000 */  nop
    /* 9C4B4 800AC4B4 23186200 */  subu       $v1, $v1, $v0
  .L800AC4B8:
    /* 9C4B8 800AC4B8 130003A2 */  sb         $v1, 0x13($s0)
  .L800AC4BC:
    /* 9C4BC 800AC4BC 0000028E */  lw         $v0, 0x0($s0)
    /* 9C4C0 800AC4C0 13000382 */  lb         $v1, 0x13($s0)
    /* 9C4C4 800AC4C4 13004280 */  lb         $v0, 0x13($v0)
    /* 9C4C8 800AC4C8 00000000 */  nop
    /* 9C4CC 800AC4CC 06006210 */  beq        $v1, $v0, .L800AC4E8
    /* 9C4D0 800AC4D0 21200002 */   addu      $a0, $s0, $zero
    /* 9C4D4 800AC4D4 11000292 */  lbu        $v0, 0x11($s0)
    /* 9C4D8 800AC4D8 00000000 */  nop
    /* 9C4DC 800AC4DC 08004224 */  addiu      $v0, $v0, 0x8
    /* 9C4E0 800AC4E0 110002A2 */  sb         $v0, 0x11($s0)
  .L800AC4E4:
    /* 9C4E4 800AC4E4 21200002 */  addu       $a0, $s0, $zero
  .L800AC4E8:
    /* 9C4E8 800AC4E8 CFAD020C */  jal        AlterBirdPos__FP10BIRDSTRUCTUc
    /* 9C4EC 800AC4EC 21280000 */   addu      $a1, $zero, $zero
    /* 9C4F0 800AC4F0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 9C4F4 800AC4F4 2000B48F */  lw         $s4, 0x20($sp)
    /* 9C4F8 800AC4F8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9C4FC 800AC4FC 1800B28F */  lw         $s2, 0x18($sp)
    /* 9C500 800AC500 1400B18F */  lw         $s1, 0x14($sp)
    /* 9C504 800AC504 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C508 800AC508 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9C50C 800AC50C 0800E003 */  jr         $ra
    /* 9C510 800AC510 00000000 */   nop
endlabel BIRD_DoFly__FP10BIRDSTRUCT
