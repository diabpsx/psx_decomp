.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddHbolt__Fiiiiiicii, 0x1CC

glabel AddHbolt__Fiiiiiicii
    /* 8650 80142248 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8654 8014224C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8658 80142250 4800B28F */  lw         $s2, 0x48($sp)
    /* 865C 80142254 4C00A28F */  lw         $v0, 0x4C($sp)
    /* 8660 80142258 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 8664 8014225C 5400B58F */  lw         $s5, 0x54($sp)
    /* 8668 80142260 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 866C 80142264 21888000 */  addu       $s1, $a0, $zero
    /* 8670 80142268 2400B3AF */  sw         $s3, 0x24($sp)
    /* 8674 8014226C 2198A000 */  addu       $s3, $a1, $zero
    /* 8678 80142270 2800B4AF */  sw         $s4, 0x28($sp)
    /* 867C 80142274 21A0C000 */  addu       $s4, $a2, $zero
    /* 8680 80142278 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8684 8014227C 2180E000 */  addu       $s0, $a3, $zero
    /* 8688 80142280 0B007016 */  bne        $s3, $s0, .L801422B0
    /* 868C 80142284 3000BFAF */   sw        $ra, 0x30($sp)
    /* 8690 80142288 09009216 */  bne        $s4, $s2, .L801422B0
    /* 8694 8014228C 80100200 */   sll       $v0, $v0, 2
    /* 8698 80142290 1080013C */  lui        $at, %hi(XDirAdd)
    /* 869C 80142294 21082200 */  addu       $at, $at, $v0
    /* 86A0 80142298 D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 86A4 8014229C 1080013C */  lui        $at, %hi(YDirAdd)
    /* 86A8 801422A0 21082200 */  addu       $at, $at, $v0
    /* 86AC 801422A4 F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 86B0 801422A8 21806302 */  addu       $s0, $s3, $v1
    /* 86B4 801422AC 21908202 */  addu       $s2, $s4, $v0
  .L801422B0:
    /* 86B8 801422B0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 86BC 801422B4 1000A212 */  beq        $s5, $v0, .L801422F8
    /* 86C0 801422B8 80101100 */   sll       $v0, $s1, 2
    /* 86C4 801422BC 21105100 */  addu       $v0, $v0, $s1
    /* 86C8 801422C0 80100200 */  sll        $v0, $v0, 2
    /* 86CC 801422C4 23105100 */  subu       $v0, $v0, $s1
    /* 86D0 801422C8 80100200 */  sll        $v0, $v0, 2
    /* 86D4 801422CC 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 86D8 801422D0 21082200 */  addu       $at, $at, $v0
    /* 86DC 801422D4 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* 86E0 801422D8 00000000 */  nop
    /* 86E4 801422DC 40100200 */  sll        $v0, $v0, 1
    /* 86E8 801422E0 10004324 */  addiu      $v1, $v0, 0x10
    /* 86EC 801422E4 3F006228 */  slti       $v0, $v1, 0x3F
    /* 86F0 801422E8 04004014 */  bnez       $v0, .L801422FC
    /* 86F4 801422EC 00000000 */   nop
    /* 86F8 801422F0 BF080508 */  j          .L801422FC
    /* 86FC 801422F4 3F000324 */   addiu     $v1, $zero, 0x3F
  .L801422F8:
    /* 8700 801422F8 10000324 */  addiu      $v1, $zero, 0x10
  .L801422FC:
    /* 8704 801422FC 21202002 */  addu       $a0, $s1, $zero
    /* 8708 80142300 21286002 */  addu       $a1, $s3, $zero
    /* 870C 80142304 21308002 */  addu       $a2, $s4, $zero
    /* 8710 80142308 21380002 */  addu       $a3, $s0, $zero
    /* 8714 8014230C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 8718 80142310 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 871C 80142314 1400A3AF */   sw        $v1, 0x14($sp)
    /* 8720 80142318 21206002 */  addu       $a0, $s3, $zero
    /* 8724 8014231C 21288002 */  addu       $a1, $s4, $zero
    /* 8728 80142320 21300002 */  addu       $a2, $s0, $zero
    /* 872C 80142324 2CE9040C */  jal        GetDirection8__Fiiii
    /* 8730 80142328 21384002 */   addu      $a3, $s2, $zero
    /* 8734 8014232C 21202002 */  addu       $a0, $s1, $zero
    /* 8738 80142330 09F5040C */  jal        SetMissDir__Fii
    /* 873C 80142334 21284000 */   addu      $a1, $v0, $zero
    /* 8740 80142338 21206002 */  addu       $a0, $s3, $zero
    /* 8744 8014233C 21288002 */  addu       $a1, $s4, $zero
    /* 8748 80142340 80801100 */  sll        $s0, $s1, 2
    /* 874C 80142344 21801102 */  addu       $s0, $s0, $s1
    /* 8750 80142348 80801000 */  sll        $s0, $s0, 2
    /* 8754 8014234C 23801102 */  subu       $s0, $s0, $s1
    /* 8758 80142350 80801000 */  sll        $s0, $s0, 2
    /* 875C 80142354 00010224 */  addiu      $v0, $zero, 0x100
    /* 8760 80142358 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 8764 8014235C 21083000 */  addu       $at, $at, $s0
    /* 8768 80142360 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 876C 80142364 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 8770 80142368 21083000 */  addu       $at, $at, $s0
    /* 8774 8014236C 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 8778 80142370 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 877C 80142374 21083000 */  addu       $at, $at, $s0
    /* 8780 80142378 782C25A4 */  sh         $a1, %lo(missile + 0x20)($at)
    /* 8784 8014237C BA34010C */  jal        AddLight__Fiii
    /* 8788 80142380 62030624 */   addiu     $a2, $zero, 0x362
    /* 878C 80142384 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 8790 80142388 21083000 */  addu       $at, $at, $s0
    /* 8794 8014238C 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 8798 80142390 C9F6000C */  jal        ENG_random__Fl
    /* 879C 80142394 0A000424 */   addiu     $a0, $zero, 0xA
    /* 87A0 80142398 2120A002 */  addu       $a0, $s5, $zero
    /* 87A4 8014239C 40180400 */  sll        $v1, $a0, 1
    /* 87A8 801423A0 21186400 */  addu       $v1, $v1, $a0
    /* 87AC 801423A4 80180300 */  sll        $v1, $v1, 2
    /* 87B0 801423A8 21186400 */  addu       $v1, $v1, $a0
    /* 87B4 801423AC 00190300 */  sll        $v1, $v1, 4
    /* 87B8 801423B0 23186400 */  subu       $v1, $v1, $a0
    /* 87BC 801423B4 80180300 */  sll        $v1, $v1, 2
    /* 87C0 801423B8 21186400 */  addu       $v1, $v1, $a0
    /* 87C4 801423BC C0180300 */  sll        $v1, $v1, 3
    /* 87C8 801423C0 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 87CC 801423C4 21082300 */  addu       $at, $at, $v1
    /* 87D0 801423C8 74A62380 */  lb         $v1, %lo(plr + 0x13C)($at)
    /* 87D4 801423CC 00000000 */  nop
    /* 87D8 801423D0 09006324 */  addiu      $v1, $v1, 0x9
    /* 87DC 801423D4 21104300 */  addu       $v0, $v0, $v1
    /* 87E0 801423D8 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 87E4 801423DC 21083000 */  addu       $at, $at, $s0
    /* 87E8 801423E0 682C22AC */  sw         $v0, %lo(missile + 0x10)($at)
    /* 87EC 801423E4 C2DC010C */  jal        UseMana__Fii
    /* 87F0 801423E8 1F000524 */   addiu     $a1, $zero, 0x1F
    /* 87F4 801423EC 3000BF8F */  lw         $ra, 0x30($sp)
    /* 87F8 801423F0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 87FC 801423F4 2800B48F */  lw         $s4, 0x28($sp)
    /* 8800 801423F8 2400B38F */  lw         $s3, 0x24($sp)
    /* 8804 801423FC 2000B28F */  lw         $s2, 0x20($sp)
    /* 8808 80142400 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 880C 80142404 1800B08F */  lw         $s0, 0x18($sp)
    /* 8810 80142408 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8814 8014240C 0800E003 */  jr         $ra
    /* 8818 80142410 00000000 */   nop
endlabel AddHbolt__Fiiiiiicii
