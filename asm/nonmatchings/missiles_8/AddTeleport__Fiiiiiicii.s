.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTeleport__Fiiiiiicii, 0x200

glabel AddTeleport__Fiiiiiicii
    /* 43F4 8013DFEC A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 43F8 8013DFF0 4C00B7AF */  sw         $s7, 0x4C($sp)
    /* 43FC 8013DFF4 21B88000 */  addu       $s7, $a0, $zero
    /* 4400 8013DFF8 5400BFAF */  sw         $ra, 0x54($sp)
    /* 4404 8013DFFC 5000BEAF */  sw         $fp, 0x50($sp)
    /* 4408 8013E000 4800B6AF */  sw         $s6, 0x48($sp)
    /* 440C 8013E004 4400B5AF */  sw         $s5, 0x44($sp)
    /* 4410 8013E008 4000B4AF */  sw         $s4, 0x40($sp)
    /* 4414 8013E00C 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 4418 8013E010 3800B2AF */  sw         $s2, 0x38($sp)
    /* 441C 8013E014 3400B1AF */  sw         $s1, 0x34($sp)
    /* 4420 8013E018 3000B0AF */  sw         $s0, 0x30($sp)
    /* 4424 8013E01C 2800A7AF */  sw         $a3, 0x28($sp)
    /* 4428 8013E020 1280053C */  lui        $a1, %hi(D_8011A030)
    /* 442C 8013E024 30A0A524 */  addiu      $a1, $a1, %lo(D_8011A030)
    /* 4430 8013E028 0000A28C */  lw         $v0, 0x0($a1)
    /* 4434 8013E02C 0400A38C */  lw         $v1, 0x4($a1)
    /* 4438 8013E030 0800A48C */  lw         $a0, 0x8($a1)
    /* 443C 8013E034 1000A2AF */  sw         $v0, 0x10($sp)
    /* 4440 8013E038 1400A3AF */  sw         $v1, 0x14($sp)
    /* 4444 8013E03C 1800A4AF */  sw         $a0, 0x18($sp)
    /* 4448 8013E040 0C00A28C */  lw         $v0, 0xC($a1)
    /* 444C 8013E044 1000A38C */  lw         $v1, 0x10($a1)
    /* 4450 8013E048 1400A48C */  lw         $a0, 0x14($a1)
    /* 4454 8013E04C 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 4458 8013E050 2000A3AF */  sw         $v1, 0x20($sp)
    /* 445C 8013E054 2400A4AF */  sw         $a0, 0x24($sp)
    /* 4460 8013E058 21B00000 */  addu       $s6, $zero, $zero
    /* 4464 8013E05C 80101700 */  sll        $v0, $s7, 2
    /* 4468 8013E060 21105700 */  addu       $v0, $v0, $s7
    /* 446C 8013E064 80100200 */  sll        $v0, $v0, 2
    /* 4470 8013E068 23105700 */  subu       $v0, $v0, $s7
    /* 4474 8013E06C 21F04000 */  addu       $fp, $v0, $zero
    /* 4478 8013E070 80181E00 */  sll        $v1, $fp, 2
    /* 447C 8013E074 01000224 */  addiu      $v0, $zero, 0x1
    /* 4480 8013E078 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 4484 8013E07C 21082300 */  addu       $at, $at, $v1
    /* 4488 8013E080 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* 448C 8013E084 80101600 */  sll        $v0, $s6, 2
  .L8013E088:
    /* 4490 8013E088 2110A203 */  addu       $v0, $sp, $v0
    /* 4494 8013E08C 1000428C */  lw         $v0, 0x10($v0)
    /* 4498 8013E090 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 449C 8013E094 21082200 */  addu       $at, $at, $v0
    /* 44A0 8013E098 54553590 */  lbu        $s5, %lo(CrawlTable)($at)
    /* 44A4 8013E09C 00000000 */  nop
    /* 44A8 8013E0A0 3E00A01A */  blez       $s5, .L8013E19C
    /* 44AC 8013E0A4 01005424 */   addiu     $s4, $v0, 0x1
    /* 44B0 8013E0A8 80981E00 */  sll        $s3, $fp, 2
  .L8013E0AC:
    /* 44B4 8013E0AC 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 44B8 8013E0B0 21083400 */  addu       $at, $at, $s4
    /* 44BC 8013E0B4 54552280 */  lb         $v0, %lo(CrawlTable)($at)
    /* 44C0 8013E0B8 2800A68F */  lw         $a2, 0x28($sp)
    /* 44C4 8013E0BC 0D80013C */  lui        $at, %hi(CrawlTable + 0x1)
    /* 44C8 8013E0C0 21083400 */  addu       $at, $at, $s4
    /* 44CC 8013E0C4 55552380 */  lb         $v1, %lo(CrawlTable + 0x1)($at)
    /* 44D0 8013E0C8 2188C200 */  addu       $s1, $a2, $v0
    /* 44D4 8013E0CC FFFF2226 */  addiu      $v0, $s1, -0x1
    /* 44D8 8013E0D0 6800A68F */  lw         $a2, 0x68($sp)
    /* 44DC 8013E0D4 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 44E0 8013E0D8 2D004010 */  beqz       $v0, .L8013E190
    /* 44E4 8013E0DC 2190C300 */   addu      $s2, $a2, $v1
    /* 44E8 8013E0E0 FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 44EC 8013E0E4 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 44F0 8013E0E8 29004010 */  beqz       $v0, .L8013E190
    /* 44F4 8013E0EC 21202002 */   addu      $a0, $s1, $zero
    /* 44F8 8013E0F0 380B020C */  jal        GetSOLID__Fii
    /* 44FC 8013E0F4 21284002 */   addu      $a1, $s2, $zero
    /* 4500 8013E0F8 21202002 */  addu       $a0, $s1, $zero
    /* 4504 8013E0FC 21284002 */  addu       $a1, $s2, $zero
    /* 4508 8013E100 447F010C */  jal        IsDplayer__Fii
    /* 450C 8013E104 21804000 */   addu      $s0, $v0, $zero
    /* 4510 8013E108 C0201200 */  sll        $a0, $s2, 3
    /* 4514 8013E10C C0181100 */  sll        $v1, $s1, 3
    /* 4518 8013E110 23187100 */  subu       $v1, $v1, $s1
    /* 451C 8013E114 C0190300 */  sll        $v1, $v1, 7
    /* 4520 8013E118 21208300 */  addu       $a0, $a0, $v1
    /* 4524 8013E11C FF004230 */  andi       $v0, $v0, 0xFF
    /* 4528 8013E120 0E80013C */  lui        $at, %hi(dung_map)
    /* 452C 8013E124 21082400 */  addu       $at, $at, $a0
    /* 4530 8013E128 287A2384 */  lh         $v1, %lo(dung_map)($at)
    /* 4534 8013E12C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 4538 8013E130 21082400 */  addu       $at, $at, $a0
    /* 453C 8013E134 2B7A2480 */  lb         $a0, %lo(dung_map + 0x3)($at)
    /* 4540 8013E138 25800302 */  or         $s0, $s0, $v1
    /* 4544 8013E13C 25800402 */  or         $s0, $s0, $a0
    /* 4548 8013E140 25800202 */  or         $s0, $s0, $v0
    /* 454C 8013E144 12000016 */  bnez       $s0, .L8013E190
    /* 4550 8013E148 00000000 */   nop
    /* 4554 8013E14C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 4558 8013E150 21083300 */  addu       $at, $at, $s3
    /* 455C 8013E154 892C31A0 */  sb         $s1, %lo(missile + 0x31)($at)
    /* 4560 8013E158 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 4564 8013E15C 21083300 */  addu       $at, $at, $s3
    /* 4568 8013E160 8A2C32A0 */  sb         $s2, %lo(missile + 0x32)($at)
    /* 456C 8013E164 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 4570 8013E168 21083300 */  addu       $at, $at, $s3
    /* 4574 8013E16C 8D2C31A0 */  sb         $s1, %lo(missile + 0x35)($at)
    /* 4578 8013E170 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 457C 8013E174 21083300 */  addu       $at, $at, $s3
    /* 4580 8013E178 8E2C32A0 */  sb         $s2, %lo(missile + 0x36)($at)
    /* 4584 8013E17C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 4588 8013E180 21083300 */  addu       $at, $at, $s3
    /* 458C 8013E184 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
    /* 4590 8013E188 67F80408 */  j          .L8013E19C
    /* 4594 8013E18C 06001624 */   addiu     $s6, $zero, 0x6
  .L8013E190:
    /* 4598 8013E190 FFFFB526 */  addiu      $s5, $s5, -0x1
    /* 459C 8013E194 C5FFA01E */  bgtz       $s5, .L8013E0AC
    /* 45A0 8013E198 02009426 */   addiu     $s4, $s4, 0x2
  .L8013E19C:
    /* 45A4 8013E19C 0100D626 */  addiu      $s6, $s6, 0x1
    /* 45A8 8013E1A0 0600C22A */  slti       $v0, $s6, 0x6
    /* 45AC 8013E1A4 B8FF4014 */  bnez       $v0, .L8013E088
    /* 45B0 8013E1A8 80101600 */   sll       $v0, $s6, 2
    /* 45B4 8013E1AC 80101700 */  sll        $v0, $s7, 2
    /* 45B8 8013E1B0 21105700 */  addu       $v0, $v0, $s7
    /* 45BC 8013E1B4 80100200 */  sll        $v0, $v0, 2
    /* 45C0 8013E1B8 23105700 */  subu       $v0, $v0, $s7
    /* 45C4 8013E1BC 80800200 */  sll        $s0, $v0, 2
    /* 45C8 8013E1C0 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 45CC 8013E1C4 21083000 */  addu       $at, $at, $s0
    /* 45D0 8013E1C8 902C2290 */  lbu        $v0, %lo(missile + 0x38)($at)
    /* 45D4 8013E1CC 00000000 */  nop
    /* 45D8 8013E1D0 08004014 */  bnez       $v0, D_8013E1F4
    /* 45DC 8013E1D4 00000000 */   nop
    /* 45E0 8013E1D8 7400A48F */  lw         $a0, 0x74($sp)
    /* 45E4 8013E1DC C2DC010C */  jal        UseMana__Fii
    /* 45E8 8013E1E0 17000524 */   addiu     $a1, $zero, 0x17
    /* 45EC 8013E1E4 02000224 */  addiu      $v0, $zero, 0x2
    /* 45F0 8013E1E8 1080013C */  lui        $at, (0x80100000 >> 16)
endlabel AddTeleport__Fiiiiiicii
