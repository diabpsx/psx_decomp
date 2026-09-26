.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddLightball__Fiiiiiicii, 0x168

glabel AddLightball__Fiiiiiicii
    /* 4630 8013E228 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 4634 8013E22C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 4638 8013E230 21908000 */  addu       $s2, $a0, $zero
    /* 463C 8013E234 2800B4AF */  sw         $s4, 0x28($sp)
    /* 4640 8013E238 21A0A000 */  addu       $s4, $a1, $zero
    /* 4644 8013E23C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 4648 8013E240 21A8C000 */  addu       $s5, $a2, $zero
    /* 464C 8013E244 4800A38F */  lw         $v1, 0x48($sp)
    /* 4650 8013E248 2400B3AF */  sw         $s3, 0x24($sp)
    /* 4654 8013E24C 5400B38F */  lw         $s3, 0x54($sp)
    /* 4658 8013E250 1800B0AF */  sw         $s0, 0x18($sp)
    /* 465C 8013E254 5800B08F */  lw         $s0, 0x58($sp)
    /* 4660 8013E258 10000224 */  addiu      $v0, $zero, 0x10
    /* 4664 8013E25C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 4668 8013E260 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 466C 8013E264 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4670 8013E268 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 4674 8013E26C 1000A3AF */   sw        $v1, 0x10($sp)
    /* 4678 8013E270 80101200 */  sll        $v0, $s2, 2
    /* 467C 8013E274 21105200 */  addu       $v0, $v0, $s2
    /* 4680 8013E278 80100200 */  sll        $v0, $v0, 2
    /* 4684 8013E27C 23105200 */  subu       $v0, $v0, $s2
    /* 4688 8013E280 80880200 */  sll        $s1, $v0, 2
    /* 468C 8013E284 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 4690 8013E288 21083100 */  addu       $at, $at, $s1
    /* 4694 8013E28C 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 4698 8013E290 C9F6000C */  jal        ENG_random__Fl
    /* 469C 8013E294 08000424 */   addiu     $a0, $zero, 0x8
    /* 46A0 8013E298 01004224 */  addiu      $v0, $v0, 0x1
    /* 46A4 8013E29C 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 46A8 8013E2A0 21083100 */  addu       $at, $at, $s1
    /* 46AC 8013E2A4 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
    /* 46B0 8013E2A8 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 46B4 8013E2AC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 46B8 8013E2B0 21083100 */  addu       $at, $at, $s1
    /* 46BC 8013E2B4 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 46C0 8013E2B8 09006106 */  bgez       $s3, .L8013E2E0
    /* 46C4 8013E2BC 40101300 */   sll       $v0, $s3, 1
    /* 46C8 8013E2C0 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 46CC 8013E2C4 21083100 */  addu       $at, $at, $s1
    /* 46D0 8013E2C8 762C34A4 */  sh         $s4, %lo(missile + 0x1E)($at)
    /* 46D4 8013E2CC 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 46D8 8013E2D0 21083100 */  addu       $at, $at, $s1
    /* 46DC 8013E2D4 782C35A4 */  sh         $s5, %lo(missile + 0x20)($at)
    /* 46E0 8013E2D8 CDF80408 */  j          .L8013E334
    /* 46E4 8013E2DC 02004232 */   andi      $v0, $s2, 0x2
  .L8013E2E0:
    /* 46E8 8013E2E0 21105300 */  addu       $v0, $v0, $s3
    /* 46EC 8013E2E4 80100200 */  sll        $v0, $v0, 2
    /* 46F0 8013E2E8 21105300 */  addu       $v0, $v0, $s3
    /* 46F4 8013E2EC 00110200 */  sll        $v0, $v0, 4
    /* 46F8 8013E2F0 23105300 */  subu       $v0, $v0, $s3
    /* 46FC 8013E2F4 80100200 */  sll        $v0, $v0, 2
    /* 4700 8013E2F8 21105300 */  addu       $v0, $v0, $s3
    /* 4704 8013E2FC C0100200 */  sll        $v0, $v0, 3
    /* 4708 8013E300 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 470C 8013E304 21082200 */  addu       $at, $at, $v0
    /* 4710 8013E308 68A52394 */  lhu        $v1, %lo(plr + 0x30)($at)
    /* 4714 8013E30C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 4718 8013E310 21083100 */  addu       $at, $at, $s1
    /* 471C 8013E314 762C23A4 */  sh         $v1, %lo(missile + 0x1E)($at)
    /* 4720 8013E318 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 4724 8013E31C 21082200 */  addu       $at, $at, $v0
    /* 4728 8013E320 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 472C 8013E324 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 4730 8013E328 21083100 */  addu       $at, $at, $s1
    /* 4734 8013E32C 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
    /* 4738 8013E330 02004232 */  andi       $v0, $s2, 0x2
  .L8013E334:
    /* 473C 8013E334 0C004010 */  beqz       $v0, .L8013E368
    /* 4740 8013E338 21208002 */   addu      $a0, $s4, $zero
    /* 4744 8013E33C 2128A002 */  addu       $a1, $s5, $zero
    /* 4748 8013E340 BA34010C */  jal        AddLight__Fiii
    /* 474C 8013E344 43020624 */   addiu     $a2, $zero, 0x243
    /* 4750 8013E348 80181200 */  sll        $v1, $s2, 2
    /* 4754 8013E34C 21187200 */  addu       $v1, $v1, $s2
    /* 4758 8013E350 80180300 */  sll        $v1, $v1, 2
    /* 475C 8013E354 23187200 */  subu       $v1, $v1, $s2
    /* 4760 8013E358 80180300 */  sll        $v1, $v1, 2
    /* 4764 8013E35C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 4768 8013E360 21082300 */  addu       $at, $at, $v1
    /* 476C 8013E364 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
  .L8013E368:
    /* 4770 8013E368 3000BF8F */  lw         $ra, 0x30($sp)
    /* 4774 8013E36C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 4778 8013E370 2800B48F */  lw         $s4, 0x28($sp)
    /* 477C 8013E374 2400B38F */  lw         $s3, 0x24($sp)
    /* 4780 8013E378 2000B28F */  lw         $s2, 0x20($sp)
    /* 4784 8013E37C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4788 8013E380 1800B08F */  lw         $s0, 0x18($sp)
    /* 478C 8013E384 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 4790 8013E388 0800E003 */  jr         $ra
    /* 4794 8013E38C 00000000 */   nop
endlabel AddLightball__Fiiiiiicii
