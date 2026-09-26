.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Lightball__Fi, 0x2B8

glabel MI_Lightball__Fi
    /* A8B4 801444AC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* A8B8 801444B0 2400B1AF */  sw         $s1, 0x24($sp)
    /* A8BC 801444B4 21888000 */  addu       $s1, $a0, $zero
    /* A8C0 801444B8 80101100 */  sll        $v0, $s1, 2
    /* A8C4 801444BC 21105100 */  addu       $v0, $v0, $s1
    /* A8C8 801444C0 80100200 */  sll        $v0, $v0, 2
    /* A8CC 801444C4 23105100 */  subu       $v0, $v0, $s1
    /* A8D0 801444C8 2000B0AF */  sw         $s0, 0x20($sp)
    /* A8D4 801444CC 80800200 */  sll        $s0, $v0, 2
    /* A8D8 801444D0 3400BFAF */  sw         $ra, 0x34($sp)
    /* A8DC 801444D4 3000B4AF */  sw         $s4, 0x30($sp)
    /* A8E0 801444D8 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* A8E4 801444DC 2800B2AF */  sw         $s2, 0x28($sp)
    /* A8E8 801444E0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A8EC 801444E4 21083000 */  addu       $at, $at, $s0
    /* A8F0 801444E8 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* A8F4 801444EC 1080013C */  lui        $at, %hi(missile)
    /* A8F8 801444F0 21083000 */  addu       $at, $at, $s0
    /* A8FC 801444F4 582C258C */  lw         $a1, %lo(missile)($at)
    /* A900 801444F8 1080013C */  lui        $at, %hi(missile + 0xC)
    /* A904 801444FC 21083000 */  addu       $at, $at, $s0
    /* A908 80144500 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* A90C 80144504 1080013C */  lui        $at, %hi(missile + 0x4)
    /* A910 80144508 21083000 */  addu       $at, $at, $s0
    /* A914 8014450C 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* A918 80144510 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* A91C 80144514 21083000 */  addu       $at, $at, $s0
    /* A920 80144518 762C3284 */  lh         $s2, %lo(missile + 0x1E)($at)
    /* A924 8014451C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* A928 80144520 21083000 */  addu       $at, $at, $s0
    /* A92C 80144524 782C3384 */  lh         $s3, %lo(missile + 0x20)($at)
    /* A930 80144528 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* A934 8014452C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A938 80144530 21083000 */  addu       $at, $at, $s0
    /* A93C 80144534 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* A940 80144538 1080013C */  lui        $at, %hi(missile + 0x8)
    /* A944 8014453C 21083000 */  addu       $at, $at, $s0
    /* A948 80144540 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* A94C 80144544 21186600 */  addu       $v1, $v1, $a2
    /* A950 80144548 1080013C */  lui        $at, %hi(missile + 0xC)
    /* A954 8014454C 21083000 */  addu       $at, $at, $s0
    /* A958 80144550 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* A95C 80144554 21104500 */  addu       $v0, $v0, $a1
    /* A960 80144558 1080013C */  lui        $at, %hi(missile + 0x8)
    /* A964 8014455C 21083000 */  addu       $at, $at, $s0
    /* A968 80144560 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* A96C 80144564 68EB040C */  jal        GetMissilePos__Fi
    /* A970 80144568 00000000 */   nop
    /* A974 8014456C 21202002 */  addu       $a0, $s1, $zero
    /* A978 80144570 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A97C 80144574 21083000 */  addu       $at, $at, $s0
    /* A980 80144578 702C3494 */  lhu        $s4, %lo(missile + 0x18)($at)
    /* A984 8014457C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* A988 80144580 21083000 */  addu       $at, $at, $s0
    /* A98C 80144584 682C258C */  lw         $a1, %lo(missile + 0x10)($at)
    /* A990 80144588 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A994 8014458C 21083000 */  addu       $at, $at, $s0
    /* A998 80144590 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* A99C 80144594 21380000 */  addu       $a3, $zero, $zero
    /* A9A0 80144598 1000A2AF */  sw         $v0, 0x10($sp)
    /* A9A4 8014459C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A9A8 801445A0 21083000 */  addu       $at, $at, $s0
    /* A9AC 801445A4 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* A9B0 801445A8 2130A000 */  addu       $a2, $a1, $zero
    /* A9B4 801445AC 1800A0AF */  sw         $zero, 0x18($sp)
    /* A9B8 801445B0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* A9BC 801445B4 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* A9C0 801445B8 1400A2AF */   sw        $v0, 0x14($sp)
    /* A9C4 801445BC 1080013C */  lui        $at, %hi(missile + 0x3D)
    /* A9C8 801445C0 21083000 */  addu       $at, $at, $s0
    /* A9CC 801445C4 952C2390 */  lbu        $v1, %lo(missile + 0x3D)($at)
    /* A9D0 801445C8 01000224 */  addiu      $v0, $zero, 0x1
    /* A9D4 801445CC 04006214 */  bne        $v1, $v0, .L801445E0
    /* A9D8 801445D0 C0181300 */   sll       $v1, $s3, 3
    /* A9DC 801445D4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A9E0 801445D8 21083000 */  addu       $at, $at, $s0
    /* A9E4 801445DC 702C34A4 */  sh         $s4, %lo(missile + 0x18)($at)
  .L801445E0:
    /* A9E8 801445E0 C0101200 */  sll        $v0, $s2, 3
    /* A9EC 801445E4 23105200 */  subu       $v0, $v0, $s2
    /* A9F0 801445E8 C0110200 */  sll        $v0, $v0, 7
    /* A9F4 801445EC 21186200 */  addu       $v1, $v1, $v0
    /* A9F8 801445F0 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* A9FC 801445F4 21082300 */  addu       $at, $at, $v1
    /* AA00 801445F8 2B7A2380 */  lb         $v1, %lo(dung_map + 0x3)($at)
    /* AA04 801445FC 00000000 */  nop
    /* AA08 80144600 26006010 */  beqz       $v1, .L8014469C
    /* AA0C 80144604 00000000 */   nop
    /* AA10 80144608 1080013C */  lui        $at, %hi(missile + 0x31)
    /* AA14 8014460C 21083000 */  addu       $at, $at, $s0
    /* AA18 80144610 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* AA1C 80144614 00000000 */  nop
    /* AA20 80144618 20004216 */  bne        $s2, $v0, .L8014469C
    /* AA24 8014461C 00000000 */   nop
    /* AA28 80144620 1080013C */  lui        $at, %hi(missile + 0x32)
    /* AA2C 80144624 21083000 */  addu       $at, $at, $s0
    /* AA30 80144628 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* AA34 8014462C 00000000 */  nop
    /* AA38 80144630 1A006216 */  bne        $s3, $v0, .L8014469C
    /* AA3C 80144634 00000000 */   nop
    /* AA40 80144638 03006018 */  blez       $v1, .L80144648
    /* AA44 8014463C 00000000 */   nop
    /* AA48 80144640 93110508 */  j          .L8014464C
    /* AA4C 80144644 FFFF6324 */   addiu     $v1, $v1, -0x1
  .L80144648:
    /* AA50 80144648 27180300 */  nor        $v1, $zero, $v1
  .L8014464C:
    /* AA54 8014464C 40100300 */  sll        $v0, $v1, 1
    /* AA58 80144650 21104300 */  addu       $v0, $v0, $v1
    /* AA5C 80144654 80100200 */  sll        $v0, $v0, 2
    /* AA60 80144658 23104300 */  subu       $v0, $v0, $v1
    /* AA64 8014465C 80100200 */  sll        $v0, $v0, 2
    /* AA68 80144660 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* AA6C 80144664 21082200 */  addu       $at, $at, $v0
    /* AA70 80144668 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* AA74 8014466C 00000000 */  nop
    /* AA78 80144670 C5FF4224 */  addiu      $v0, $v0, -0x3B
    /* AA7C 80144674 0200422C */  sltiu      $v0, $v0, 0x2
    /* AA80 80144678 08004010 */  beqz       $v0, .L8014469C
    /* AA84 8014467C 80101100 */   sll       $v0, $s1, 2
    /* AA88 80144680 21105100 */  addu       $v0, $v0, $s1
    /* AA8C 80144684 80100200 */  sll        $v0, $v0, 2
    /* AA90 80144688 23105100 */  subu       $v0, $v0, $s1
    /* AA94 8014468C 80100200 */  sll        $v0, $v0, 2
    /* AA98 80144690 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AA9C 80144694 21082200 */  addu       $at, $at, $v0
    /* AAA0 80144698 702C34A4 */  sh         $s4, %lo(missile + 0x18)($at)
  .L8014469C:
    /* AAA4 8014469C 02003032 */  andi       $s0, $s1, 0x2
    /* AAA8 801446A0 10000012 */  beqz       $s0, .L801446E4
    /* AAAC 801446A4 80101100 */   sll       $v0, $s1, 2
    /* AAB0 801446A8 21105100 */  addu       $v0, $v0, $s1
    /* AAB4 801446AC 80100200 */  sll        $v0, $v0, 2
    /* AAB8 801446B0 23105100 */  subu       $v0, $v0, $s1
    /* AABC 801446B4 80100200 */  sll        $v0, $v0, 2
    /* AAC0 801446B8 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* AAC4 801446BC 21082200 */  addu       $at, $at, $v0
    /* AAC8 801446C0 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* AACC 801446C4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* AAD0 801446C8 21082200 */  addu       $at, $at, $v0
    /* AAD4 801446CC 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* AAD8 801446D0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* AADC 801446D4 21082200 */  addu       $at, $at, $v0
    /* AAE0 801446D8 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* AAE4 801446DC F834010C */  jal        ChangeLight__Fiiii
    /* AAE8 801446E0 43020724 */   addiu     $a3, $zero, 0x243
  .L801446E4:
    /* AAEC 801446E4 80101100 */  sll        $v0, $s1, 2
    /* AAF0 801446E8 21105100 */  addu       $v0, $v0, $s1
    /* AAF4 801446EC 80100200 */  sll        $v0, $v0, 2
    /* AAF8 801446F0 23105100 */  subu       $v0, $v0, $s1
    /* AAFC 801446F4 80180200 */  sll        $v1, $v0, 2
    /* AB00 801446F8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AB04 801446FC 21082300 */  addu       $at, $at, $v1
    /* AB08 80144700 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* AB0C 80144704 00000000 */  nop
    /* AB10 80144708 0B004014 */  bnez       $v0, .L80144738
    /* AB14 8014470C 01000224 */   addiu     $v0, $zero, 0x1
    /* AB18 80144710 1080013C */  lui        $at, %hi(missile + 0x38)
    /* AB1C 80144714 21082300 */  addu       $at, $at, $v1
    /* AB20 80144718 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* AB24 8014471C 06000012 */  beqz       $s0, .L80144738
    /* AB28 80144720 00000000 */   nop
    /* AB2C 80144724 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* AB30 80144728 21082300 */  addu       $at, $at, $v1
    /* AB34 8014472C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* AB38 80144730 D034010C */  jal        AddUnLight__Fi
    /* AB3C 80144734 00000000 */   nop
  .L80144738:
    /* AB40 80144738 D1EA040C */  jal        PutMissile__Fi
    /* AB44 8014473C 21202002 */   addu      $a0, $s1, $zero
    /* AB48 80144740 3400BF8F */  lw         $ra, 0x34($sp)
    /* AB4C 80144744 3000B48F */  lw         $s4, 0x30($sp)
    /* AB50 80144748 2C00B38F */  lw         $s3, 0x2C($sp)
    /* AB54 8014474C 2800B28F */  lw         $s2, 0x28($sp)
    /* AB58 80144750 2400B18F */  lw         $s1, 0x24($sp)
    /* AB5C 80144754 2000B08F */  lw         $s0, 0x20($sp)
    /* AB60 80144758 3800BD27 */  addiu      $sp, $sp, 0x38
    /* AB64 8014475C 0800E003 */  jr         $ra
    /* AB68 80144760 00000000 */   nop
endlabel MI_Lightball__Fi
