.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBoneSpirit__Fiiiiiicii, 0x204

glabel AddBoneSpirit__Fiiiiiicii
    /* 8998 80142590 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 899C 80142594 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 89A0 80142598 5000B58F */  lw         $s5, 0x50($sp)
    /* 89A4 8014259C 5400A28F */  lw         $v0, 0x54($sp)
    /* 89A8 801425A0 3000B6AF */  sw         $s6, 0x30($sp)
    /* 89AC 801425A4 5C00B68F */  lw         $s6, 0x5C($sp)
    /* 89B0 801425A8 3400B7AF */  sw         $s7, 0x34($sp)
    /* 89B4 801425AC 5800B793 */  lbu        $s7, 0x58($sp)
    /* 89B8 801425B0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 89BC 801425B4 21888000 */  addu       $s1, $a0, $zero
    /* 89C0 801425B8 2000B2AF */  sw         $s2, 0x20($sp)
    /* 89C4 801425BC 2190A000 */  addu       $s2, $a1, $zero
    /* 89C8 801425C0 2400B3AF */  sw         $s3, 0x24($sp)
    /* 89CC 801425C4 2198C000 */  addu       $s3, $a2, $zero
    /* 89D0 801425C8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 89D4 801425CC 21A0E000 */  addu       $s4, $a3, $zero
    /* 89D8 801425D0 3800BFAF */  sw         $ra, 0x38($sp)
    /* 89DC 801425D4 0C005416 */  bne        $s2, $s4, .L80142608
    /* 89E0 801425D8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 89E4 801425DC 0B007516 */  bne        $s3, $s5, .L8014260C
    /* 89E8 801425E0 21202002 */   addu      $a0, $s1, $zero
    /* 89EC 801425E4 80100200 */  sll        $v0, $v0, 2
    /* 89F0 801425E8 1080013C */  lui        $at, %hi(XDirAdd)
    /* 89F4 801425EC 21082200 */  addu       $at, $at, $v0
    /* 89F8 801425F0 D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 89FC 801425F4 1080013C */  lui        $at, %hi(YDirAdd)
    /* 8A00 801425F8 21082200 */  addu       $at, $at, $v0
    /* 8A04 801425FC F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 8A08 80142600 21A04302 */  addu       $s4, $s2, $v1
    /* 8A0C 80142604 21A86202 */  addu       $s5, $s3, $v0
  .L80142608:
    /* 8A10 80142608 21202002 */  addu       $a0, $s1, $zero
  .L8014260C:
    /* 8A14 8014260C 21284002 */  addu       $a1, $s2, $zero
    /* 8A18 80142610 21306002 */  addu       $a2, $s3, $zero
    /* 8A1C 80142614 21388002 */  addu       $a3, $s4, $zero
    /* 8A20 80142618 80801100 */  sll        $s0, $s1, 2
    /* 8A24 8014261C 21801102 */  addu       $s0, $s0, $s1
    /* 8A28 80142620 80801000 */  sll        $s0, $s0, 2
    /* 8A2C 80142624 23801102 */  subu       $s0, $s0, $s1
    /* 8A30 80142628 80801000 */  sll        $s0, $s0, 2
    /* 8A34 8014262C 10000224 */  addiu      $v0, $zero, 0x10
    /* 8A38 80142630 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 8A3C 80142634 21083000 */  addu       $at, $at, $s0
    /* 8A40 80142638 682C20AC */  sw         $zero, %lo(missile + 0x10)($at)
    /* 8A44 8014263C 1000B5AF */  sw         $s5, 0x10($sp)
    /* 8A48 80142640 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 8A4C 80142644 1400A2AF */   sw        $v0, 0x14($sp)
    /* 8A50 80142648 21204002 */  addu       $a0, $s2, $zero
    /* 8A54 8014264C 21286002 */  addu       $a1, $s3, $zero
    /* 8A58 80142650 21308002 */  addu       $a2, $s4, $zero
    /* 8A5C 80142654 2CE9040C */  jal        GetDirection8__Fiiii
    /* 8A60 80142658 2138A002 */   addu      $a3, $s5, $zero
    /* 8A64 8014265C 21202002 */  addu       $a0, $s1, $zero
    /* 8A68 80142660 09F5040C */  jal        SetMissDir__Fii
    /* 8A6C 80142664 21284000 */   addu      $a1, $v0, $zero
    /* 8A70 80142668 21204002 */  addu       $a0, $s2, $zero
    /* 8A74 8014266C 21286002 */  addu       $a1, $s3, $zero
    /* 8A78 80142670 00010224 */  addiu      $v0, $zero, 0x100
    /* 8A7C 80142674 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 8A80 80142678 21083000 */  addu       $at, $at, $s0
    /* 8A84 8014267C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 8A88 80142680 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 8A8C 80142684 21083000 */  addu       $at, $at, $s0
    /* 8A90 80142688 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 8A94 8014268C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 8A98 80142690 21083000 */  addu       $at, $at, $s0
    /* 8A9C 80142694 782C25A4 */  sh         $a1, %lo(missile + 0x20)($at)
    /* 8AA0 80142698 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 8AA4 8014269C 21083000 */  addu       $at, $at, $s0
    /* 8AA8 801426A0 7A2C20A4 */  sh         $zero, %lo(missile + 0x22)($at)
    /* 8AAC 801426A4 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 8AB0 801426A8 21083000 */  addu       $at, $at, $s0
    /* 8AB4 801426AC 7C2C34A4 */  sh         $s4, %lo(missile + 0x24)($at)
    /* 8AB8 801426B0 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 8ABC 801426B4 21083000 */  addu       $at, $at, $s0
    /* 8AC0 801426B8 7E2C35A4 */  sh         $s5, %lo(missile + 0x26)($at)
    /* 8AC4 801426BC BA34010C */  jal        AddLight__Fiii
    /* 8AC8 801426C0 F4030624 */   addiu     $a2, $zero, 0x3F4
    /* 8ACC 801426C4 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 8AD0 801426C8 21083000 */  addu       $at, $at, $s0
    /* 8AD4 801426CC 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 8AD8 801426D0 2400E016 */  bnez       $s7, .L80142764
    /* 8ADC 801426D4 2120C002 */   addu      $a0, $s6, $zero
    /* 8AE0 801426D8 C2DC010C */  jal        UseMana__Fii
    /* 8AE4 801426DC 24000524 */   addiu     $a1, $zero, 0x24
    /* 8AE8 801426E0 40101600 */  sll        $v0, $s6, 1
    /* 8AEC 801426E4 21105600 */  addu       $v0, $v0, $s6
    /* 8AF0 801426E8 80100200 */  sll        $v0, $v0, 2
    /* 8AF4 801426EC 21105600 */  addu       $v0, $v0, $s6
    /* 8AF8 801426F0 00110200 */  sll        $v0, $v0, 4
    /* 8AFC 801426F4 23105600 */  subu       $v0, $v0, $s6
    /* 8B00 801426F8 80100200 */  sll        $v0, $v0, 2
    /* 8B04 801426FC 21105600 */  addu       $v0, $v0, $s6
    /* 8B08 80142700 C0100200 */  sll        $v0, $v0, 3
    /* 8B0C 80142704 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 8B10 80142708 21082200 */  addu       $at, $at, $v0
    /* 8B14 8014270C 54A6238C */  lw         $v1, %lo(plr + 0x11C)($at)
    /* 8B18 80142710 01000424 */  addiu      $a0, $zero, 0x1
    /* 8B1C 80142714 1280013C */  lui        $at, %hi(drawhpflag)
    /* 8B20 80142718 BEB624A0 */  sb         $a0, %lo(drawhpflag)($at)
    /* 8B24 8014271C 80FE6324 */  addiu      $v1, $v1, -0x180
    /* 8B28 80142720 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 8B2C 80142724 21082200 */  addu       $at, $at, $v0
    /* 8B30 80142728 54A623AC */  sw         $v1, %lo(plr + 0x11C)($at)
    /* 8B34 8014272C 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 8B38 80142730 21082200 */  addu       $at, $at, $v0
    /* 8B3C 80142734 4CA6238C */  lw         $v1, %lo(plr + 0x114)($at)
    /* 8B40 80142738 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 8B44 8014273C 21082200 */  addu       $at, $at, $v0
    /* 8B48 80142740 54A6248C */  lw         $a0, %lo(plr + 0x11C)($at)
    /* 8B4C 80142744 80FE6324 */  addiu      $v1, $v1, -0x180
    /* 8B50 80142748 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 8B54 8014274C 21082200 */  addu       $at, $at, $v0
    /* 8B58 80142750 4CA623AC */  sw         $v1, %lo(plr + 0x114)($at)
    /* 8B5C 80142754 0300801C */  bgtz       $a0, .L80142764
    /* 8B60 80142758 2120C002 */   addu      $a0, $s6, $zero
    /* 8B64 8014275C 899B010C */  jal        StartPlrKill__Fii
    /* 8B68 80142760 21280000 */   addu      $a1, $zero, $zero
  .L80142764:
    /* 8B6C 80142764 3800BF8F */  lw         $ra, 0x38($sp)
    /* 8B70 80142768 3400B78F */  lw         $s7, 0x34($sp)
    /* 8B74 8014276C 3000B68F */  lw         $s6, 0x30($sp)
    /* 8B78 80142770 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 8B7C 80142774 2800B48F */  lw         $s4, 0x28($sp)
    /* 8B80 80142778 2400B38F */  lw         $s3, 0x24($sp)
    /* 8B84 8014277C 2000B28F */  lw         $s2, 0x20($sp)
    /* 8B88 80142780 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8B8C 80142784 1800B08F */  lw         $s0, 0x18($sp)
    /* 8B90 80142788 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 8B94 8014278C 0800E003 */  jr         $ra
    /* 8B98 80142790 00000000 */   nop
endlabel AddBoneSpirit__Fiiiiiicii
