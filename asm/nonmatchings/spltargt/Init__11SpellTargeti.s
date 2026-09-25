.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__11SpellTargeti, 0x264

glabel Init__11SpellTargeti
    /* 9F2B4 800AF2B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9F2B8 800AF2B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9F2BC 800AF2BC 21808000 */  addu       $s0, $a0, $zero
    /* 9F2C0 800AF2C0 40100500 */  sll        $v0, $a1, 1
    /* 9F2C4 800AF2C4 21104500 */  addu       $v0, $v0, $a1
    /* 9F2C8 800AF2C8 80100200 */  sll        $v0, $v0, 2
    /* 9F2CC 800AF2CC 21104500 */  addu       $v0, $v0, $a1
    /* 9F2D0 800AF2D0 00110200 */  sll        $v0, $v0, 4
    /* 9F2D4 800AF2D4 23104500 */  subu       $v0, $v0, $a1
    /* 9F2D8 800AF2D8 80100200 */  sll        $v0, $v0, 2
    /* 9F2DC 800AF2DC 21104500 */  addu       $v0, $v0, $a1
    /* 9F2E0 800AF2E0 C0100200 */  sll        $v0, $v0, 3
    /* 9F2E4 800AF2E4 0E80033C */  lui        $v1, %hi(plr)
    /* 9F2E8 800AF2E8 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 9F2EC 800AF2EC 21184300 */  addu       $v1, $v0, $v1
    /* 9F2F0 800AF2F0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9F2F4 800AF2F4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9F2F8 800AF2F8 1C0005AE */  sw         $a1, 0x1C($s0)
    /* 9F2FC 800AF2FC 180003AE */  sw         $v1, 0x18($s0)
    /* 9F300 800AF300 5E007180 */  lb         $s1, 0x5E($v1)
    /* 9F304 800AF304 01000224 */  addiu      $v0, $zero, 0x1
    /* 9F308 800AF308 3E002216 */  bne        $s1, $v0, .L800AF404
    /* 9F30C 800AF30C 01000624 */   addiu     $a2, $zero, 0x1
    /* 9F310 800AF310 1C00048E */  lw         $a0, 0x1C($s0)
    /* 9F314 800AF314 5D006580 */  lb         $a1, 0x5D($v1)
    /* 9F318 800AF318 26DD010C */  jal        CheckSpell__FiicUc
    /* 9F31C 800AF31C 21380000 */   addu      $a3, $zero, $zero
    /* 9F320 800AF320 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9F324 800AF324 37004014 */  bnez       $v0, .L800AF404
    /* 9F328 800AF328 00000000 */   nop
    /* 9F32C 800AF32C 1800048E */  lw         $a0, 0x18($s0)
    /* 9F330 800AF330 00000000 */  nop
    /* 9F334 800AF334 5E008580 */  lb         $a1, 0x5E($a0)
    /* 9F338 800AF338 00000000 */  nop
    /* 9F33C 800AF33C 7000B114 */  bne        $a1, $s1, .L800AF500
    /* 9F340 800AF340 00000000 */   nop
    /* 9F344 800AF344 5D008280 */  lb         $v0, 0x5D($a0)
    /* 9F348 800AF348 C0198380 */  lb         $v1, 0x19C0($a0)
    /* 9F34C 800AF34C 21108200 */  addu       $v0, $a0, $v0
    /* 9F350 800AF350 71004280 */  lb         $v0, 0x71($v0)
    /* 9F354 800AF354 00000000 */  nop
    /* 9F358 800AF358 21104300 */  addu       $v0, $v0, $v1
    /* 9F35C 800AF35C 15004014 */  bnez       $v0, .L800AF3B4
    /* 9F360 800AF360 00000000 */   nop
    /* 9F364 800AF364 F6008480 */  lb         $a0, 0xF6($a0)
    /* 9F368 800AF368 00000000 */  nop
    /* 9F36C 800AF36C 05008014 */  bnez       $a0, .L800AF384
    /* 9F370 800AF370 00000000 */   nop
    /* 9F374 800AF374 C6F5000C */  jal        PlaySFX__Fi
    /* 9F378 800AF378 ED020424 */   addiu     $a0, $zero, 0x2ED
    /* 9F37C 800AF37C 40BD0208 */  j          .L800AF500
    /* 9F380 800AF380 00000000 */   nop
  .L800AF384:
    /* 9F384 800AF384 05008514 */  bne        $a0, $a1, .L800AF39C
    /* 9F388 800AF388 02000224 */   addiu     $v0, $zero, 0x2
    /* 9F38C 800AF38C C6F5000C */  jal        PlaySFX__Fi
    /* 9F390 800AF390 7F020424 */   addiu     $a0, $zero, 0x27F
    /* 9F394 800AF394 40BD0208 */  j          .L800AF500
    /* 9F398 800AF398 00000000 */   nop
  .L800AF39C:
    /* 9F39C 800AF39C 58008214 */  bne        $a0, $v0, .L800AF500
    /* 9F3A0 800AF3A0 00000000 */   nop
    /* 9F3A4 800AF3A4 C6F5000C */  jal        PlaySFX__Fi
    /* 9F3A8 800AF3A8 17020424 */   addiu     $a0, $zero, 0x217
    /* 9F3AC 800AF3AC 40BD0208 */  j          .L800AF500
    /* 9F3B0 800AF3B0 00000000 */   nop
  .L800AF3B4:
    /* 9F3B4 800AF3B4 F6008480 */  lb         $a0, 0xF6($a0)
    /* 9F3B8 800AF3B8 00000000 */  nop
    /* 9F3BC 800AF3BC 05008014 */  bnez       $a0, .L800AF3D4
    /* 9F3C0 800AF3C0 00000000 */   nop
    /* 9F3C4 800AF3C4 C6F5000C */  jal        PlaySFX__Fi
    /* 9F3C8 800AF3C8 F4020424 */   addiu     $a0, $zero, 0x2F4
    /* 9F3CC 800AF3CC 40BD0208 */  j          .L800AF500
    /* 9F3D0 800AF3D0 00000000 */   nop
  .L800AF3D4:
    /* 9F3D4 800AF3D4 05008514 */  bne        $a0, $a1, .L800AF3EC
    /* 9F3D8 800AF3D8 02000224 */   addiu     $v0, $zero, 0x2
    /* 9F3DC 800AF3DC C6F5000C */  jal        PlaySFX__Fi
    /* 9F3E0 800AF3E0 86020424 */   addiu     $a0, $zero, 0x286
    /* 9F3E4 800AF3E4 40BD0208 */  j          .L800AF500
    /* 9F3E8 800AF3E8 00000000 */   nop
  .L800AF3EC:
    /* 9F3EC 800AF3EC 44008214 */  bne        $a0, $v0, .L800AF500
    /* 9F3F0 800AF3F0 00000000 */   nop
    /* 9F3F4 800AF3F4 C6F5000C */  jal        PlaySFX__Fi
    /* 9F3F8 800AF3F8 1E020424 */   addiu     $a0, $zero, 0x21E
    /* 9F3FC 800AF3FC 40BD0208 */  j          .L800AF500
    /* 9F400 800AF400 00000000 */   nop
  .L800AF404:
    /* 9F404 800AF404 00000392 */  lbu        $v1, 0x0($s0)
    /* 9F408 800AF408 01000224 */  addiu      $v0, $zero, 0x1
    /* 9F40C 800AF40C 040002AE */  sw         $v0, 0x4($s0)
    /* 9F410 800AF410 1C006014 */  bnez       $v1, .L800AF484
    /* 9F414 800AF414 140002AE */   sw        $v0, 0x14($s0)
    /* 9F418 800AF418 1800038E */  lw         $v1, 0x18($s0)
    /* 9F41C 800AF41C 00000000 */  nop
    /* 9F420 800AF420 42006280 */  lb         $v0, 0x42($v1)
    /* 9F424 800AF424 1800058E */  lw         $a1, 0x18($s0)
    /* 9F428 800AF428 1280013C */  lui        $at, %hi(offset_x)
    /* 9F42C 800AF42C 21082200 */  addu       $at, $at, $v0
    /* 9F430 800AF430 A8C22290 */  lbu        $v0, %lo(offset_x)($at)
    /* 9F434 800AF434 30006394 */  lhu        $v1, 0x30($v1)
    /* 9F438 800AF438 00160200 */  sll        $v0, $v0, 24
    /* 9F43C 800AF43C 03160200 */  sra        $v0, $v0, 24
    /* 9F440 800AF440 21186200 */  addu       $v1, $v1, $v0
    /* 9F444 800AF444 C0180300 */  sll        $v1, $v1, 3
    /* 9F448 800AF448 0C0003A6 */  sh         $v1, 0xC($s0)
    /* 9F44C 800AF44C 080003A6 */  sh         $v1, 0x8($s0)
    /* 9F450 800AF450 4200A280 */  lb         $v0, 0x42($a1)
    /* 9F454 800AF454 21200002 */  addu       $a0, $s0, $zero
    /* 9F458 800AF458 1280013C */  lui        $at, %hi(offset_y)
    /* 9F45C 800AF45C 21082200 */  addu       $at, $at, $v0
    /* 9F460 800AF460 B0C22390 */  lbu        $v1, %lo(offset_y)($at)
    /* 9F464 800AF464 3200A294 */  lhu        $v0, 0x32($a1)
    /* 9F468 800AF468 001E0300 */  sll        $v1, $v1, 24
    /* 9F46C 800AF46C 031E0300 */  sra        $v1, $v1, 24
    /* 9F470 800AF470 21104300 */  addu       $v0, $v0, $v1
    /* 9F474 800AF474 C0100200 */  sll        $v0, $v0, 3
    /* 9F478 800AF478 0E0002A6 */  sh         $v0, 0xE($s0)
    /* 9F47C 800AF47C A3BC020C */  jal        ClearTrails__11SpellTarget
    /* 9F480 800AF480 0A0002A6 */   sh        $v0, 0xA($s0)
  .L800AF484:
    /* 9F484 800AF484 2400038E */  lw         $v1, 0x24($s0)
    /* 9F488 800AF488 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 9F48C 800AF48C 0A006214 */  bne        $v1, $v0, .L800AF4B8
    /* 9F490 800AF490 00000000 */   nop
    /* 9F494 800AF494 08000486 */  lh         $a0, 0x8($s0)
    /* 9F498 800AF498 1C00028E */  lw         $v0, 0x1C($s0)
    /* 9F49C 800AF49C 0A000586 */  lh         $a1, 0xA($s0)
    /* 9F4A0 800AF4A0 02004010 */  beqz       $v0, .L800AF4AC
    /* 9F4A4 800AF4A4 42000624 */   addiu     $a2, $zero, 0x42
    /* 9F4A8 800AF4A8 12000624 */  addiu      $a2, $zero, 0x12
  .L800AF4AC:
    /* 9F4AC 800AF4AC BA34010C */  jal        AddLight__Fiii
    /* 9F4B0 800AF4B0 00000000 */   nop
    /* 9F4B4 800AF4B4 240002AE */  sw         $v0, 0x24($s0)
  .L800AF4B8:
    /* 9F4B8 800AF4B8 08000296 */  lhu        $v0, 0x8($s0)
    /* 9F4BC 800AF4BC 00000000 */  nop
    /* 9F4C0 800AF4C0 01004230 */  andi       $v0, $v0, 0x1
    /* 9F4C4 800AF4C4 02004010 */  beqz       $v0, .L800AF4D0
    /* 9F4C8 800AF4C8 FCFF0524 */   addiu     $a1, $zero, -0x4
    /* 9F4CC 800AF4CC 04000524 */  addiu      $a1, $zero, 0x4
  .L800AF4D0:
    /* 9F4D0 800AF4D0 0A000296 */  lhu        $v0, 0xA($s0)
    /* 9F4D4 800AF4D4 00000000 */  nop
    /* 9F4D8 800AF4D8 01004230 */  andi       $v0, $v0, 0x1
    /* 9F4DC 800AF4DC 02004010 */  beqz       $v0, .L800AF4E8
    /* 9F4E0 800AF4E0 FCFF0624 */   addiu     $a2, $zero, -0x4
    /* 9F4E4 800AF4E4 04000624 */  addiu      $a2, $zero, 0x4
  .L800AF4E8:
    /* 9F4E8 800AF4E8 2400048E */  lw         $a0, 0x24($s0)
    /* 9F4EC 800AF4EC EE34010C */  jal        ChangeLightOff__Fiii
    /* 9F4F0 800AF4F0 00000000 */   nop
    /* 9F4F4 800AF4F4 01DE000C */  jal        NewCursor__Fi
    /* 9F4F8 800AF4F8 09000424 */   addiu     $a0, $zero, 0x9
    /* 9F4FC 800AF4FC 000000A2 */  sb         $zero, 0x0($s0)
  .L800AF500:
    /* 9F500 800AF500 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9F504 800AF504 1400B18F */  lw         $s1, 0x14($sp)
    /* 9F508 800AF508 1000B08F */  lw         $s0, 0x10($sp)
    /* 9F50C 800AF50C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9F510 800AF510 0800E003 */  jr         $ra
    /* 9F514 800AF514 00000000 */   nop
endlabel Init__11SpellTargeti
