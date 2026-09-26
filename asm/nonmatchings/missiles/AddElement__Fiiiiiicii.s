.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddElement__Fiiiiiicii, 0x230

glabel AddElement__Fiiiiiicii
    /* 738C 80140F84 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 7390 80140F88 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 7394 80140F8C 4800B58F */  lw         $s5, 0x48($sp)
    /* 7398 80140F90 4C00A28F */  lw         $v0, 0x4C($sp)
    /* 739C 80140F94 3000B6AF */  sw         $s6, 0x30($sp)
    /* 73A0 80140F98 5400B68F */  lw         $s6, 0x54($sp)
    /* 73A4 80140F9C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 73A8 80140FA0 21888000 */  addu       $s1, $a0, $zero
    /* 73AC 80140FA4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 73B0 80140FA8 2190A000 */  addu       $s2, $a1, $zero
    /* 73B4 80140FAC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 73B8 80140FB0 2198C000 */  addu       $s3, $a2, $zero
    /* 73BC 80140FB4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 73C0 80140FB8 21A0E000 */  addu       $s4, $a3, $zero
    /* 73C4 80140FBC 3400BFAF */  sw         $ra, 0x34($sp)
    /* 73C8 80140FC0 0B005416 */  bne        $s2, $s4, .L80140FF0
    /* 73CC 80140FC4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 73D0 80140FC8 09007516 */  bne        $s3, $s5, .L80140FF0
    /* 73D4 80140FCC 80100200 */   sll       $v0, $v0, 2
    /* 73D8 80140FD0 1080013C */  lui        $at, %hi(XDirAdd)
    /* 73DC 80140FD4 21082200 */  addu       $at, $at, $v0
    /* 73E0 80140FD8 D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 73E4 80140FDC 1080013C */  lui        $at, %hi(YDirAdd)
    /* 73E8 80140FE0 21082200 */  addu       $at, $at, $v0
    /* 73EC 80140FE4 F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 73F0 80140FE8 21A04302 */  addu       $s4, $s2, $v1
    /* 73F4 80140FEC 21A86202 */  addu       $s5, $s3, $v0
  .L80140FF0:
    /* 73F8 80140FF0 C9F6000C */  jal        ENG_random__Fl
    /* 73FC 80140FF4 0A000424 */   addiu     $a0, $zero, 0xA
    /* 7400 80140FF8 0A000424 */  addiu      $a0, $zero, 0xA
    /* 7404 80140FFC C9F6000C */  jal        ENG_random__Fl
    /* 7408 80141000 21804000 */   addu      $s0, $v0, $zero
    /* 740C 80141004 80181100 */  sll        $v1, $s1, 2
    /* 7410 80141008 21187100 */  addu       $v1, $v1, $s1
    /* 7414 8014100C 80180300 */  sll        $v1, $v1, 2
    /* 7418 80141010 23187100 */  subu       $v1, $v1, $s1
    /* 741C 80141014 80200300 */  sll        $a0, $v1, 2
    /* 7420 80141018 40181600 */  sll        $v1, $s6, 1
    /* 7424 8014101C 21187600 */  addu       $v1, $v1, $s6
    /* 7428 80141020 80180300 */  sll        $v1, $v1, 2
    /* 742C 80141024 21187600 */  addu       $v1, $v1, $s6
    /* 7430 80141028 00190300 */  sll        $v1, $v1, 4
    /* 7434 8014102C 23187600 */  subu       $v1, $v1, $s6
    /* 7438 80141030 80180300 */  sll        $v1, $v1, 2
    /* 743C 80141034 21187600 */  addu       $v1, $v1, $s6
    /* 7440 80141038 C0180300 */  sll        $v1, $v1, 3
    /* 7444 8014103C 21800202 */  addu       $s0, $s0, $v0
    /* 7448 80141040 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 744C 80141044 21082300 */  addu       $at, $at, $v1
    /* 7450 80141048 74A62380 */  lb         $v1, %lo(plr + 0x13C)($at)
    /* 7454 8014104C 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 7458 80141050 21082400 */  addu       $at, $at, $a0
    /* 745C 80141054 982C2580 */  lb         $a1, %lo(missile + 0x40)($at)
    /* 7460 80141058 02006324 */  addiu      $v1, $v1, 0x2
    /* 7464 8014105C 21800302 */  addu       $s0, $s0, $v1
    /* 7468 80141060 40801000 */  sll        $s0, $s0, 1
    /* 746C 80141064 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7470 80141068 21082400 */  addu       $at, $at, $a0
    /* 7474 8014106C 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 7478 80141070 0C00A018 */  blez       $a1, .L801410A4
    /* 747C 80141074 00000000 */   nop
  .L80141078:
    /* 7480 80141078 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 7484 8014107C 21082400 */  addu       $at, $at, $a0
    /* 7488 80141080 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 748C 80141084 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 7490 80141088 C3100300 */  sra        $v0, $v1, 3
    /* 7494 8014108C 21186200 */  addu       $v1, $v1, $v0
    /* 7498 80141090 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 749C 80141094 21082400 */  addu       $at, $at, $a0
    /* 74A0 80141098 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 74A4 8014109C F6FFA01C */  bgtz       $a1, .L80141078
    /* 74A8 801410A0 00000000 */   nop
  .L801410A4:
    /* 74AC 801410A4 21202002 */  addu       $a0, $s1, $zero
    /* 74B0 801410A8 21284002 */  addu       $a1, $s2, $zero
    /* 74B4 801410AC 21306002 */  addu       $a2, $s3, $zero
    /* 74B8 801410B0 80801100 */  sll        $s0, $s1, 2
    /* 74BC 801410B4 21801102 */  addu       $s0, $s0, $s1
    /* 74C0 801410B8 80801000 */  sll        $s0, $s0, 2
    /* 74C4 801410BC 23801102 */  subu       $s0, $s0, $s1
    /* 74C8 801410C0 80801000 */  sll        $s0, $s0, 2
    /* 74CC 801410C4 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 74D0 801410C8 21083000 */  addu       $at, $at, $s0
    /* 74D4 801410CC 682C228C */  lw         $v0, %lo(missile + 0x10)($at)
    /* 74D8 801410D0 21388002 */  addu       $a3, $s4, $zero
    /* 74DC 801410D4 43100200 */  sra        $v0, $v0, 1
    /* 74E0 801410D8 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 74E4 801410DC 21083000 */  addu       $at, $at, $s0
    /* 74E8 801410E0 682C22AC */  sw         $v0, %lo(missile + 0x10)($at)
    /* 74EC 801410E4 10000224 */  addiu      $v0, $zero, 0x10
    /* 74F0 801410E8 1000B5AF */  sw         $s5, 0x10($sp)
    /* 74F4 801410EC 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 74F8 801410F0 1400A2AF */   sw        $v0, 0x14($sp)
    /* 74FC 801410F4 21204002 */  addu       $a0, $s2, $zero
    /* 7500 801410F8 21286002 */  addu       $a1, $s3, $zero
    /* 7504 801410FC 21308002 */  addu       $a2, $s4, $zero
    /* 7508 80141100 2CE9040C */  jal        GetDirection8__Fiiii
    /* 750C 80141104 2138A002 */   addu      $a3, $s5, $zero
    /* 7510 80141108 21202002 */  addu       $a0, $s1, $zero
    /* 7514 8014110C 09F5040C */  jal        SetMissDir__Fii
    /* 7518 80141110 21284000 */   addu      $a1, $v0, $zero
    /* 751C 80141114 21204002 */  addu       $a0, $s2, $zero
    /* 7520 80141118 21286002 */  addu       $a1, $s3, $zero
    /* 7524 8014111C 00010224 */  addiu      $v0, $zero, 0x100
    /* 7528 80141120 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 752C 80141124 21083000 */  addu       $at, $at, $s0
    /* 7530 80141128 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 7534 8014112C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 7538 80141130 21083000 */  addu       $at, $at, $s0
    /* 753C 80141134 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 7540 80141138 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 7544 8014113C 21083000 */  addu       $at, $at, $s0
    /* 7548 80141140 782C25A4 */  sh         $a1, %lo(missile + 0x20)($at)
    /* 754C 80141144 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 7550 80141148 21083000 */  addu       $at, $at, $s0
    /* 7554 8014114C 7A2C20A4 */  sh         $zero, %lo(missile + 0x22)($at)
    /* 7558 80141150 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 755C 80141154 21083000 */  addu       $at, $at, $s0
    /* 7560 80141158 7C2C34A4 */  sh         $s4, %lo(missile + 0x24)($at)
    /* 7564 8014115C 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 7568 80141160 21083000 */  addu       $at, $at, $s0
    /* 756C 80141164 7E2C35A4 */  sh         $s5, %lo(missile + 0x26)($at)
    /* 7570 80141168 BA34010C */  jal        AddLight__Fiii
    /* 7574 8014116C B6010624 */   addiu     $a2, $zero, 0x1B6
    /* 7578 80141170 2120C002 */  addu       $a0, $s6, $zero
    /* 757C 80141174 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 7580 80141178 21083000 */  addu       $at, $at, $s0
    /* 7584 8014117C 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 7588 80141180 C2DC010C */  jal        UseMana__Fii
    /* 758C 80141184 1D000524 */   addiu     $a1, $zero, 0x1D
    /* 7590 80141188 3400BF8F */  lw         $ra, 0x34($sp)
    /* 7594 8014118C 3000B68F */  lw         $s6, 0x30($sp)
    /* 7598 80141190 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 759C 80141194 2800B48F */  lw         $s4, 0x28($sp)
    /* 75A0 80141198 2400B38F */  lw         $s3, 0x24($sp)
    /* 75A4 8014119C 2000B28F */  lw         $s2, 0x20($sp)
    /* 75A8 801411A0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 75AC 801411A4 1800B08F */  lw         $s0, 0x18($sp)
    /* 75B0 801411A8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 75B4 801411AC 0800E003 */  jr         $ra
    /* 75B8 801411B0 00000000 */   nop
endlabel AddElement__Fiiiiiicii
