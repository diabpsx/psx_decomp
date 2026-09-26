.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFirewall__Fiiiiiicii, 0x1F8

glabel AddFirewall__Fiiiiiicii
    /* 4798 8013E390 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 479C 8013E394 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 47A0 8013E398 5000B18F */  lw         $s1, 0x50($sp)
    /* 47A4 8013E39C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 47A8 8013E3A0 21A88000 */  addu       $s5, $a0, $zero
    /* 47AC 8013E3A4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 47B0 8013E3A8 2190A000 */  addu       $s2, $a1, $zero
    /* 47B4 8013E3AC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 47B8 8013E3B0 2198C000 */  addu       $s3, $a2, $zero
    /* 47BC 8013E3B4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 47C0 8013E3B8 21A0E000 */  addu       $s4, $a3, $zero
    /* 47C4 8013E3BC 3400B7AF */  sw         $s7, 0x34($sp)
    /* 47C8 8013E3C0 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 47CC 8013E3C4 0A000424 */  addiu      $a0, $zero, 0xA
    /* 47D0 8013E3C8 3800BFAF */  sw         $ra, 0x38($sp)
    /* 47D4 8013E3CC 3000B6AF */  sw         $s6, 0x30($sp)
    /* 47D8 8013E3D0 C9F6000C */  jal        ENG_random__Fl
    /* 47DC 8013E3D4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 47E0 8013E3D8 0A000424 */  addiu      $a0, $zero, 0xA
    /* 47E4 8013E3DC C9F6000C */  jal        ENG_random__Fl
    /* 47E8 8013E3E0 21804000 */   addu      $s0, $v0, $zero
    /* 47EC 8013E3E4 2120A002 */  addu       $a0, $s5, $zero
    /* 47F0 8013E3E8 80181500 */  sll        $v1, $s5, 2
    /* 47F4 8013E3EC 21187500 */  addu       $v1, $v1, $s5
    /* 47F8 8013E3F0 80180300 */  sll        $v1, $v1, 2
    /* 47FC 8013E3F4 23187500 */  subu       $v1, $v1, $s5
    /* 4800 8013E3F8 80B00300 */  sll        $s6, $v1, 2
    /* 4804 8013E3FC 21800202 */  addu       $s0, $s0, $v0
    /* 4808 8013E400 10000224 */  addiu      $v0, $zero, 0x10
    /* 480C 8013E404 21284002 */  addu       $a1, $s2, $zero
    /* 4810 8013E408 21306002 */  addu       $a2, $s3, $zero
    /* 4814 8013E40C 40181700 */  sll        $v1, $s7, 1
    /* 4818 8013E410 21187700 */  addu       $v1, $v1, $s7
    /* 481C 8013E414 80180300 */  sll        $v1, $v1, 2
    /* 4820 8013E418 21187700 */  addu       $v1, $v1, $s7
    /* 4824 8013E41C 00190300 */  sll        $v1, $v1, 4
    /* 4828 8013E420 23187700 */  subu       $v1, $v1, $s7
    /* 482C 8013E424 80180300 */  sll        $v1, $v1, 2
    /* 4830 8013E428 21187700 */  addu       $v1, $v1, $s7
    /* 4834 8013E42C C0180300 */  sll        $v1, $v1, 3
    /* 4838 8013E430 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 483C 8013E434 21082300 */  addu       $at, $at, $v1
    /* 4840 8013E438 74A62380 */  lb         $v1, %lo(plr + 0x13C)($at)
    /* 4844 8013E43C 21388002 */  addu       $a3, $s4, $zero
    /* 4848 8013E440 02006324 */  addiu      $v1, $v1, 0x2
    /* 484C 8013E444 21800302 */  addu       $s0, $s0, $v1
    /* 4850 8013E448 00811000 */  sll        $s0, $s0, 4
    /* 4854 8013E44C 43801000 */  sra        $s0, $s0, 1
    /* 4858 8013E450 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 485C 8013E454 21083600 */  addu       $at, $at, $s6
    /* 4860 8013E458 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 4864 8013E45C 1000B1AF */  sw         $s1, 0x10($sp)
    /* 4868 8013E460 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 486C 8013E464 1400A2AF */   sw        $v0, 0x14($sp)
    /* 4870 8013E468 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 4874 8013E46C 21083600 */  addu       $at, $at, $s6
    /* 4878 8013E470 982C2480 */  lb         $a0, %lo(missile + 0x40)($at)
    /* 487C 8013E474 0A000224 */  addiu      $v0, $zero, 0xA
    /* 4880 8013E478 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4884 8013E47C 21083600 */  addu       $at, $at, $s6
    /* 4888 8013E480 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 488C 8013E484 0B008018 */  blez       $a0, .L8013E4B4
    /* 4890 8013E488 2118C002 */   addu      $v1, $s6, $zero
  .L8013E48C:
    /* 4894 8013E48C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4898 8013E490 21082300 */  addu       $at, $at, $v1
    /* 489C 8013E494 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 48A0 8013E498 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 48A4 8013E49C 0A004224 */  addiu      $v0, $v0, 0xA
    /* 48A8 8013E4A0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 48AC 8013E4A4 21082300 */  addu       $at, $at, $v1
    /* 48B0 8013E4A8 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 48B4 8013E4AC F7FF801C */  bgtz       $a0, .L8013E48C
    /* 48B8 8013E4B0 00000000 */   nop
  .L8013E4B4:
    /* 48BC 8013E4B4 80201500 */  sll        $a0, $s5, 2
    /* 48C0 8013E4B8 21209500 */  addu       $a0, $a0, $s5
    /* 48C4 8013E4BC 80200400 */  sll        $a0, $a0, 2
    /* 48C8 8013E4C0 23209500 */  subu       $a0, $a0, $s5
    /* 48CC 8013E4C4 80200400 */  sll        $a0, $a0, 2
    /* 48D0 8013E4C8 40101700 */  sll        $v0, $s7, 1
    /* 48D4 8013E4CC 21105700 */  addu       $v0, $v0, $s7
    /* 48D8 8013E4D0 80100200 */  sll        $v0, $v0, 2
    /* 48DC 8013E4D4 21105700 */  addu       $v0, $v0, $s7
    /* 48E0 8013E4D8 00110200 */  sll        $v0, $v0, 4
    /* 48E4 8013E4DC 23105700 */  subu       $v0, $v0, $s7
    /* 48E8 8013E4E0 80100200 */  sll        $v0, $v0, 2
    /* 48EC 8013E4E4 21105700 */  addu       $v0, $v0, $s7
    /* 48F0 8013E4E8 C0100200 */  sll        $v0, $v0, 3
    /* 48F4 8013E4EC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 48F8 8013E4F0 21082400 */  addu       $at, $at, $a0
    /* 48FC 8013E4F4 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* 4900 8013E4F8 0E80013C */  lui        $at, %hi(plr + 0x19C4)
    /* 4904 8013E4FC 21082200 */  addu       $at, $at, $v0
    /* 4908 8013E500 FCBE228C */  lw         $v0, %lo(plr + 0x19C4)($at)
    /* 490C 8013E504 00000000 */  nop
    /* 4910 8013E508 18006200 */  mult       $v1, $v0
    /* 4914 8013E50C 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 4918 8013E510 21082400 */  addu       $at, $at, $a0
    /* 491C 8013E514 9A2C2590 */  lbu        $a1, %lo(missile + 0x42)($at)
    /* 4920 8013E518 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 4924 8013E51C 21082400 */  addu       $at, $at, $a0
    /* 4928 8013E520 782C20A4 */  sh         $zero, %lo(missile + 0x20)($at)
    /* 492C 8013E524 002E0500 */  sll        $a1, $a1, 24
    /* 4930 8013E528 032E0500 */  sra        $a1, $a1, 24
    /* 4934 8013E52C 12400000 */  mflo       $t0
    /* 4938 8013E530 C3110800 */  sra        $v0, $t0, 7
    /* 493C 8013E534 21186200 */  addu       $v1, $v1, $v0
    /* 4940 8013E538 00190300 */  sll        $v1, $v1, 4
    /* 4944 8013E53C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4948 8013E540 21082400 */  addu       $at, $at, $a0
    /* 494C 8013E544 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 4950 8013E548 23186500 */  subu       $v1, $v1, $a1
    /* 4954 8013E54C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 4958 8013E550 21082400 */  addu       $at, $at, $a0
    /* 495C 8013E554 762C23A4 */  sh         $v1, %lo(missile + 0x1E)($at)
    /* 4960 8013E558 3800BF8F */  lw         $ra, 0x38($sp)
    /* 4964 8013E55C 3400B78F */  lw         $s7, 0x34($sp)
    /* 4968 8013E560 3000B68F */  lw         $s6, 0x30($sp)
    /* 496C 8013E564 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 4970 8013E568 2800B48F */  lw         $s4, 0x28($sp)
    /* 4974 8013E56C 2400B38F */  lw         $s3, 0x24($sp)
    /* 4978 8013E570 2000B28F */  lw         $s2, 0x20($sp)
    /* 497C 8013E574 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4980 8013E578 1800B08F */  lw         $s0, 0x18($sp)
    /* 4984 8013E57C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 4988 8013E580 0800E003 */  jr         $ra
    /* 498C 8013E584 00000000 */   nop
endlabel AddFirewall__Fiiiiiicii
