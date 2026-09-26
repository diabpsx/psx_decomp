.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Lachdanan__Fi, 0x1B0

glabel MAI_Lachdanan__Fi
    /* 1A9B0 801545A8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1A9B4 801545AC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1A9B8 801545B0 21888000 */  addu       $s1, $a0, $zero
    /* 1A9BC 801545B4 40101100 */  sll        $v0, $s1, 1
    /* 1A9C0 801545B8 21105100 */  addu       $v0, $v0, $s1
    /* 1A9C4 801545BC 80100200 */  sll        $v0, $v0, 2
    /* 1A9C8 801545C0 21105100 */  addu       $v0, $v0, $s1
    /* 1A9CC 801545C4 C0100200 */  sll        $v0, $v0, 3
    /* 1A9D0 801545C8 1080033C */  lui        $v1, %hi(monster)
    /* 1A9D4 801545CC 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1A9D8 801545D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1A9DC 801545D4 21804300 */  addu       $s0, $v0, $v1
    /* 1A9E0 801545D8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1A9E4 801545DC 34001282 */  lb         $s2, 0x34($s0)
    /* 1A9E8 801545E0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 1A9EC 801545E4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1A9F0 801545E8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1A9F4 801545EC 33000282 */  lb         $v0, 0x33($s0)
    /* 1A9F8 801545F0 35001382 */  lb         $s3, 0x35($s0)
    /* 1A9FC 801545F4 4F004014 */  bnez       $v0, .L80154734
    /* 1AA00 801545F8 00000000 */   nop
    /* 1AA04 801545FC EB2A050C */  jal        M_GetDir__Fi
    /* 1AA08 80154600 00000000 */   nop
    /* 1AA0C 80154604 21A04000 */  addu       $s4, $v0, $zero
    /* 1AA10 80154608 0000038E */  lw         $v1, 0x0($s0)
    /* 1AA14 8015460C 51000224 */  addiu      $v0, $zero, 0x51
    /* 1AA18 80154610 15006214 */  bne        $v1, $v0, .L80154668
    /* 1AA1C 80154614 C0101300 */   sll       $v0, $s3, 3
    /* 1AA20 80154618 C0181200 */  sll        $v1, $s2, 3
    /* 1AA24 8015461C 23187200 */  subu       $v1, $v1, $s2
    /* 1AA28 80154620 C0190300 */  sll        $v1, $v1, 7
    /* 1AA2C 80154624 21104300 */  addu       $v0, $v0, $v1
    /* 1AA30 80154628 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1AA34 8015462C 21082200 */  addu       $at, $at, $v0
    /* 1AA38 80154630 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1AA3C 80154634 00000000 */  nop
    /* 1AA40 80154638 04004230 */  andi       $v0, $v0, 0x4
    /* 1AA44 8015463C 15004014 */  bnez       $v0, .L80154694
    /* 1AA48 80154640 07000224 */   addiu     $v0, $zero, 0x7
    /* 1AA4C 80154644 49000392 */  lbu        $v1, 0x49($s0)
    /* 1AA50 80154648 00000000 */  nop
    /* 1AA54 8015464C 06006214 */  bne        $v1, $v0, .L80154668
    /* 1AA58 80154650 C0101300 */   sll       $v0, $s3, 3
    /* 1AA5C 80154654 52000224 */  addiu      $v0, $zero, 0x52
    /* 1AA60 80154658 000002AE */  sw         $v0, 0x0($s0)
    /* 1AA64 8015465C 06000224 */  addiu      $v0, $zero, 0x6
    /* 1AA68 80154660 490002A2 */  sb         $v0, 0x49($s0)
    /* 1AA6C 80154664 C0101300 */  sll        $v0, $s3, 3
  .L80154668:
    /* 1AA70 80154668 C0181200 */  sll        $v1, $s2, 3
    /* 1AA74 8015466C 23187200 */  subu       $v1, $v1, $s2
    /* 1AA78 80154670 C0190300 */  sll        $v1, $v1, 7
    /* 1AA7C 80154674 21104300 */  addu       $v0, $v0, $v1
    /* 1AA80 80154678 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1AA84 8015467C 21082200 */  addu       $at, $at, $v0
    /* 1AA88 80154680 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1AA8C 80154684 00000000 */  nop
    /* 1AA90 80154688 04004230 */  andi       $v0, $v0, 0x4
    /* 1AA94 8015468C 1D004010 */  beqz       $v0, .L80154704
    /* 1AA98 80154690 40101100 */   sll       $v0, $s1, 1
  .L80154694:
    /* 1AA9C 80154694 0000038E */  lw         $v1, 0x0($s0)
    /* 1AAA0 80154698 53000224 */  addiu      $v0, $zero, 0x53
    /* 1AAA4 8015469C 19006214 */  bne        $v1, $v0, .L80154704
    /* 1AAA8 801546A0 40101100 */   sll       $v0, $s1, 1
    /* 1AAAC 801546A4 CDF3000C */  jal        effect_is_playing__Fi
    /* 1AAB0 801546A8 51030424 */   addiu     $a0, $zero, 0x351
    /* 1AAB4 801546AC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1AAB8 801546B0 14004014 */  bnez       $v0, .L80154704
    /* 1AABC 801546B4 40101100 */   sll       $v0, $s1, 1
    /* 1AAC0 801546B8 49000392 */  lbu        $v1, 0x49($s0)
    /* 1AAC4 801546BC 07000224 */  addiu      $v0, $zero, 0x7
    /* 1AAC8 801546C0 10006214 */  bne        $v1, $v0, .L80154704
    /* 1AACC 801546C4 40101100 */   sll       $v0, $s1, 1
    /* 1AAD0 801546C8 1280033C */  lui        $v1, %hi(deltaload)
    /* 1AAD4 801546CC 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 1AAD8 801546D0 03000224 */  addiu      $v0, $zero, 0x3
    /* 1AADC 801546D4 000000AE */  sw         $zero, 0x0($s0)
    /* 1AAE0 801546D8 0E80013C */  lui        $at, %hi(quests + 0x52)
    /* 1AAE4 801546DC 92DA22A0 */  sb         $v0, %lo(quests + 0x52)($at)
    /* 1AAE8 801546E0 05006014 */  bnez       $v1, .L801546F8
    /* 1AAEC 801546E4 21202002 */   addu      $a0, $s1, $zero
    /* 1AAF0 801546E8 01000424 */  addiu      $a0, $zero, 0x1
    /* 1AAF4 801546EC 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 1AAF8 801546F0 04000524 */   addiu     $a1, $zero, 0x4
    /* 1AAFC 801546F4 21202002 */  addu       $a0, $s1, $zero
  .L801546F8:
    /* 1AB00 801546F8 F630050C */  jal        M_StartKill__Fii
    /* 1AB04 801546FC FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 1AB08 80154700 40101100 */  sll        $v0, $s1, 1
  .L80154704:
    /* 1AB0C 80154704 21105100 */  addu       $v0, $v0, $s1
    /* 1AB10 80154708 80100200 */  sll        $v0, $v0, 2
    /* 1AB14 8015470C 21105100 */  addu       $v0, $v0, $s1
    /* 1AB18 80154710 C0100200 */  sll        $v0, $v0, 3
    /* 1AB1C 80154714 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1AB20 80154718 21082200 */  addu       $at, $at, $v0
    /* 1AB24 8015471C D05334A0 */  sb         $s4, %lo(monster + 0x3C)($at)
    /* 1AB28 80154720 33000282 */  lb         $v0, 0x33($s0)
    /* 1AB2C 80154724 00000000 */  nop
    /* 1AB30 80154728 02004014 */  bnez       $v0, .L80154734
    /* 1AB34 8015472C 00000000 */   nop
    /* 1AB38 80154730 5A0000A2 */  sb         $zero, 0x5A($s0)
  .L80154734:
    /* 1AB3C 80154734 2400BF8F */  lw         $ra, 0x24($sp)
    /* 1AB40 80154738 2000B48F */  lw         $s4, 0x20($sp)
    /* 1AB44 8015473C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1AB48 80154740 1800B28F */  lw         $s2, 0x18($sp)
    /* 1AB4C 80154744 1400B18F */  lw         $s1, 0x14($sp)
    /* 1AB50 80154748 1000B08F */  lw         $s0, 0x10($sp)
    /* 1AB54 8015474C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1AB58 80154750 0800E003 */  jr         $ra
    /* 1AB5C 80154754 00000000 */   nop
endlabel MAI_Lachdanan__Fi
