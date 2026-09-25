.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HelpPad__Fv, 0x2A8

glabel HelpPad__Fv
    /* 9E3A0 800AE3A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9E3A4 800AE3A4 1280043C */  lui        $a0, %hi(options_pad)
    /* 9E3A8 800AE3A8 50B2848C */  lw         $a0, %lo(options_pad)($a0)
    /* 9E3AC 800AE3AC 21280000 */  addu       $a1, $zero, $zero
    /* 9E3B0 800AE3B0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9E3B4 800AE3B4 FD25020C */  jal        PAD_GetPad__FiUc
    /* 9E3B8 800AE3B8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 9E3BC 800AE3BC 1280033C */  lui        $v1, %hi(FeFlag)
    /* 9E3C0 800AE3C0 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 9E3C4 800AE3C4 00000000 */  nop
    /* 9E3C8 800AE3C8 04006010 */  beqz       $v1, .L800AE3DC
    /* 9E3CC 800AE3CC 21804000 */   addu      $s0, $v0, $zero
    /* 9E3D0 800AE3D0 21200002 */  addu       $a0, $s0, $zero
    /* 9E3D4 800AE3D4 F9B80208 */  j          .L800AE3E4
    /* 9E3D8 800AE3D8 08000524 */   addiu     $a1, $zero, 0x8
  .L800AE3DC:
    /* 9E3DC 800AE3DC 21200002 */  addu       $a0, $s0, $zero
    /* 9E3E0 800AE3E0 05000524 */  addiu      $a1, $zero, 0x5
  .L800AE3E4:
    /* 9E3E4 800AE3E4 38BC020C */  jal        SetPadTick__4CPadUs_800af0e0
    /* 9E3E8 800AE3E8 00000000 */   nop
    /* 9E3EC 800AE3EC 21200002 */  addu       $a0, $s0, $zero
    /* 9E3F0 800AE3F0 36BC020C */  jal        SetPadTickMask__4CPadUs_800af0d8
    /* 9E3F4 800AE3F4 03000524 */   addiu     $a1, $zero, 0x3
    /* 9E3F8 800AE3F8 780B828F */  lw         $v0, %gp_rel(displayinghelp)($gp)
    /* 9E3FC 800AE3FC 00000000 */  nop
    /* 9E400 800AE400 69004014 */  bnez       $v0, .L800AE5A8
    /* 9E404 800AE404 00000000 */   nop
    /* 9E408 800AE408 22BC020C */  jal        GetTick__C4CPad_800af088
    /* 9E40C 800AE40C 21200002 */   addu      $a0, $s0, $zero
    /* 9E410 800AE410 01004230 */  andi       $v0, $v0, 0x1
    /* 9E414 800AE414 27004010 */  beqz       $v0, .L800AE4B4
    /* 9E418 800AE418 00000000 */   nop
    /* 9E41C 800AE41C C51F8493 */  lbu        $a0, %gp_rel(D_8011C745)($gp)
    /* 9E420 800AE420 780B80AF */  sw         $zero, %gp_rel(displayinghelp)($gp)
    /* 9E424 800AE424 FFFF8224 */  addiu      $v0, $a0, -0x1
    /* 9E428 800AE428 C51F82A3 */  sb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9E42C 800AE42C 00160200 */  sll        $v0, $v0, 24
    /* 9E430 800AE430 03160200 */  sra        $v0, $v0, 24
    /* 9E434 800AE434 40180200 */  sll        $v1, $v0, 1
    /* 9E438 800AE438 21186200 */  addu       $v1, $v1, $v0
    /* 9E43C 800AE43C 80180300 */  sll        $v1, $v1, 2
    /* 9E440 800AE440 0D80013C */  lui        $at, %hi(D_800CD524)
    /* 9E444 800AE444 21082300 */  addu       $at, $at, $v1
    /* 9E448 800AE448 24D52380 */  lb         $v1, %lo(D_800CD524)($at)
    /* 9E44C 800AE44C 04000224 */  addiu      $v0, $zero, 0x4
    /* 9E450 800AE450 06006214 */  bne        $v1, $v0, .L800AE46C
    /* 9E454 800AE454 FEFF8224 */   addiu     $v0, $a0, -0x2
    /* 9E458 800AE458 C41F8393 */  lbu        $v1, %gp_rel(D_8011C744)($gp)
    /* 9E45C 800AE45C C51F82A3 */  sb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9E460 800AE460 07006010 */  beqz       $v1, .L800AE480
    /* 9E464 800AE464 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 9E468 800AE468 C41F82A3 */  sb         $v0, %gp_rel(D_8011C744)($gp)
  .L800AE46C:
    /* 9E46C 800AE46C C41F8293 */  lbu        $v0, %gp_rel(D_8011C744)($gp)
    /* 9E470 800AE470 00000000 */  nop
    /* 9E474 800AE474 02004010 */  beqz       $v0, .L800AE480
    /* 9E478 800AE478 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 9E47C 800AE47C C41F82A3 */  sb         $v0, %gp_rel(D_8011C744)($gp)
  .L800AE480:
    /* 9E480 800AE480 C51F8283 */  lb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9E484 800AE484 00000000 */  nop
    /* 9E488 800AE488 03004104 */  bgez       $v0, .L800AE498
    /* 9E48C 800AE48C 21184000 */   addu      $v1, $v0, $zero
    /* 9E490 800AE490 19006224 */  addiu      $v0, $v1, 0x19
    /* 9E494 800AE494 C51F82A3 */  sb         $v0, %gp_rel(D_8011C745)($gp)
  .L800AE498:
    /* 9E498 800AE498 C51F8383 */  lb         $v1, %gp_rel(D_8011C745)($gp)
    /* 9E49C 800AE49C 18000224 */  addiu      $v0, $zero, 0x18
    /* 9E4A0 800AE4A0 02006214 */  bne        $v1, $v0, .L800AE4AC
    /* 9E4A4 800AE4A4 16000224 */   addiu     $v0, $zero, 0x16
    /* 9E4A8 800AE4A8 C41F82A3 */  sb         $v0, %gp_rel(D_8011C744)($gp)
  .L800AE4AC:
    /* 9E4AC 800AE4AC C6F5000C */  jal        PlaySFX__Fi
    /* 9E4B0 800AE4B0 32000424 */   addiu     $a0, $zero, 0x32
  .L800AE4B4:
    /* 9E4B4 800AE4B4 22BC020C */  jal        GetTick__C4CPad_800af088
    /* 9E4B8 800AE4B8 21200002 */   addu      $a0, $s0, $zero
    /* 9E4BC 800AE4BC 02004230 */  andi       $v0, $v0, 0x2
    /* 9E4C0 800AE4C0 39004010 */  beqz       $v0, .L800AE5A8
    /* 9E4C4 800AE4C4 EB51033C */   lui       $v1, (0x51EB851F >> 16)
    /* 9E4C8 800AE4C8 C51F8293 */  lbu        $v0, %gp_rel(D_8011C745)($gp)
    /* 9E4CC 800AE4CC 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 9E4D0 800AE4D0 01004224 */  addiu      $v0, $v0, 0x1
    /* 9E4D4 800AE4D4 00160200 */  sll        $v0, $v0, 24
    /* 9E4D8 800AE4D8 03260200 */  sra        $a0, $v0, 24
    /* 9E4DC 800AE4DC 18008300 */  mult       $a0, $v1
    /* 9E4E0 800AE4E0 780B80AF */  sw         $zero, %gp_rel(displayinghelp)($gp)
    /* 9E4E4 800AE4E4 C3170200 */  sra        $v0, $v0, 31
    /* 9E4E8 800AE4E8 10300000 */  mfhi       $a2
    /* 9E4EC 800AE4EC C3180600 */  sra        $v1, $a2, 3
    /* 9E4F0 800AE4F0 23186200 */  subu       $v1, $v1, $v0
    /* 9E4F4 800AE4F4 40100300 */  sll        $v0, $v1, 1
    /* 9E4F8 800AE4F8 21104300 */  addu       $v0, $v0, $v1
    /* 9E4FC 800AE4FC C0100200 */  sll        $v0, $v0, 3
    /* 9E500 800AE500 21104300 */  addu       $v0, $v0, $v1
    /* 9E504 800AE504 23208200 */  subu       $a0, $a0, $v0
    /* 9E508 800AE508 001E0400 */  sll        $v1, $a0, 24
    /* 9E50C 800AE50C 031E0300 */  sra        $v1, $v1, 24
    /* 9E510 800AE510 40100300 */  sll        $v0, $v1, 1
    /* 9E514 800AE514 21104300 */  addu       $v0, $v0, $v1
    /* 9E518 800AE518 80100200 */  sll        $v0, $v0, 2
    /* 9E51C 800AE51C C51F84A3 */  sb         $a0, %gp_rel(D_8011C745)($gp)
    /* 9E520 800AE520 0D80013C */  lui        $at, %hi(D_800CD524)
    /* 9E524 800AE524 21082200 */  addu       $at, $at, $v0
    /* 9E528 800AE528 24D52380 */  lb         $v1, %lo(D_800CD524)($at)
    /* 9E52C 800AE52C 04000224 */  addiu      $v0, $zero, 0x4
    /* 9E530 800AE530 0B006214 */  bne        $v1, $v0, .L800AE560
    /* 9E534 800AE534 01008224 */   addiu     $v0, $a0, 0x1
    /* 9E538 800AE538 C51F82A3 */  sb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9E53C 800AE53C 00160200 */  sll        $v0, $v0, 24
    /* 9E540 800AE540 03160200 */  sra        $v0, $v0, 24
    /* 9E544 800AE544 03004228 */  slti       $v0, $v0, 0x3
    /* 9E548 800AE548 10004014 */  bnez       $v0, .L800AE58C
    /* 9E54C 800AE54C 00000000 */   nop
    /* 9E550 800AE550 C41F8293 */  lbu        $v0, %gp_rel(D_8011C744)($gp)
    /* 9E554 800AE554 00000000 */  nop
    /* 9E558 800AE558 01004224 */  addiu      $v0, $v0, 0x1
    /* 9E55C 800AE55C C41F82A3 */  sb         $v0, %gp_rel(D_8011C744)($gp)
  .L800AE560:
    /* 9E560 800AE560 C51F8283 */  lb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9E564 800AE564 00000000 */  nop
    /* 9E568 800AE568 03004228 */  slti       $v0, $v0, 0x3
    /* 9E56C 800AE56C 07004014 */  bnez       $v0, .L800AE58C
    /* 9E570 800AE570 00000000 */   nop
    /* 9E574 800AE574 C41F8293 */  lbu        $v0, %gp_rel(D_8011C744)($gp)
    /* 9E578 800AE578 00000000 */  nop
    /* 9E57C 800AE57C 01004224 */  addiu      $v0, $v0, 0x1
    /* 9E580 800AE580 C41F82A3 */  sb         $v0, %gp_rel(D_8011C744)($gp)
    /* 9E584 800AE584 68B90208 */  j          .L800AE5A0
    /* 9E588 800AE588 00000000 */   nop
  .L800AE58C:
    /* 9E58C 800AE58C C51F8383 */  lb         $v1, %gp_rel(D_8011C745)($gp)
    /* 9E590 800AE590 01000224 */  addiu      $v0, $zero, 0x1
    /* 9E594 800AE594 02006214 */  bne        $v1, $v0, .L800AE5A0
    /* 9E598 800AE598 00000000 */   nop
    /* 9E59C 800AE59C C41F80A3 */  sb         $zero, %gp_rel(D_8011C744)($gp)
  .L800AE5A0:
    /* 9E5A0 800AE5A0 C6F5000C */  jal        PlaySFX__Fi
    /* 9E5A4 800AE5A4 32000424 */   addiu     $a0, $zero, 0x32
  .L800AE5A8:
    /* 9E5A8 800AE5A8 2CBC020C */  jal        GetDown__C4CPad_800af0b0
    /* 9E5AC 800AE5AC 21200002 */   addu      $a0, $s0, $zero
    /* 9E5B0 800AE5B0 00014230 */  andi       $v0, $v0, 0x100
    /* 9E5B4 800AE5B4 0C004010 */  beqz       $v0, .L800AE5E8
    /* 9E5B8 800AE5B8 00000000 */   nop
    /* 9E5BC 800AE5BC C6F5000C */  jal        PlaySFX__Fi
    /* 9E5C0 800AE5C0 33000424 */   addiu     $a0, $zero, 0x33
    /* 9E5C4 800AE5C4 780B828F */  lw         $v0, %gp_rel(displayinghelp)($gp)
    /* 9E5C8 800AE5C8 00000000 */  nop
    /* 9E5CC 800AE5CC 04004010 */  beqz       $v0, .L800AE5E0
    /* 9E5D0 800AE5D0 00000000 */   nop
    /* 9E5D4 800AE5D4 780B80AF */  sw         $zero, %gp_rel(displayinghelp)($gp)
    /* 9E5D8 800AE5D8 7AB90208 */  j          .L800AE5E8
    /* 9E5DC 800AE5DC 00000000 */   nop
  .L800AE5E0:
    /* 9E5E0 800AE5E0 E3B8020C */  jal        RemoveHelp__Fv
    /* 9E5E4 800AE5E4 00000000 */   nop
  .L800AE5E8:
    /* 9E5E8 800AE5E8 2CBC020C */  jal        GetDown__C4CPad_800af0b0
    /* 9E5EC 800AE5EC 21200002 */   addu      $a0, $s0, $zero
    /* 9E5F0 800AE5F0 40004230 */  andi       $v0, $v0, 0x40
    /* 9E5F4 800AE5F4 0F004010 */  beqz       $v0, .L800AE634
    /* 9E5F8 800AE5F8 00000000 */   nop
    /* 9E5FC 800AE5FC C51F8283 */  lb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9E600 800AE600 00000000 */  nop
    /* 9E604 800AE604 40180200 */  sll        $v1, $v0, 1
    /* 9E608 800AE608 21186200 */  addu       $v1, $v1, $v0
    /* 9E60C 800AE60C 80180300 */  sll        $v1, $v1, 2
    /* 9E610 800AE610 0D80013C */  lui        $at, %hi(D_800CD524)
    /* 9E614 800AE614 21082300 */  addu       $at, $at, $v1
    /* 9E618 800AE618 24D52280 */  lb         $v0, %lo(D_800CD524)($at)
    /* 9E61C 800AE61C 01000324 */  addiu      $v1, $zero, 0x1
    /* 9E620 800AE620 04004310 */  beq        $v0, $v1, .L800AE634
    /* 9E624 800AE624 00000000 */   nop
    /* 9E628 800AE628 780B83AF */  sw         $v1, %gp_rel(displayinghelp)($gp)
    /* 9E62C 800AE62C C6F5000C */  jal        PlaySFX__Fi
    /* 9E630 800AE630 33000424 */   addiu     $a0, $zero, 0x33
  .L800AE634:
    /* 9E634 800AE634 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9E638 800AE638 1800B08F */  lw         $s0, 0x18($sp)
    /* 9E63C 800AE63C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9E640 800AE640 0800E003 */  jr         $ra
    /* 9E644 800AE644 00000000 */   nop
endlabel HelpPad__Fv
