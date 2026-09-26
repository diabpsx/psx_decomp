.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AutoGetItem__Fii, 0xA5C

glabel AutoGetItem__Fii
    /* 24864 8015E45C 1280023C */  lui        $v0, %hi(dropGoldFlag)
    /* 24868 8015E460 B4B64290 */  lbu        $v0, %lo(dropGoldFlag)($v0)
    /* 2486C 8015E464 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 24870 8015E468 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 24874 8015E46C 21988000 */  addu       $s3, $a0, $zero
    /* 24878 8015E470 4000BEAF */  sw         $fp, 0x40($sp)
    /* 2487C 8015E474 21F0A000 */  addu       $fp, $a1, $zero
    /* 24880 8015E478 4400BFAF */  sw         $ra, 0x44($sp)
    /* 24884 8015E47C 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 24888 8015E480 3800B6AF */  sw         $s6, 0x38($sp)
    /* 2488C 8015E484 3400B5AF */  sw         $s5, 0x34($sp)
    /* 24890 8015E488 3000B4AF */  sw         $s4, 0x30($sp)
    /* 24894 8015E48C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 24898 8015E490 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2489C 8015E494 05004010 */  beqz       $v0, .L8015E4AC
    /* 248A0 8015E498 2000B0AF */   sw        $s0, 0x20($sp)
    /* 248A4 8015E49C 1280013C */  lui        $at, %hi(dropGoldFlag)
    /* 248A8 8015E4A0 B4B620A0 */  sb         $zero, %lo(dropGoldFlag)($at)
    /* 248AC 8015E4A4 1280013C */  lui        $at, %hi(dropGoldValue)
    /* 248B0 8015E4A8 C8B620AC */  sw         $zero, %lo(dropGoldValue)($at)
  .L8015E4AC:
    /* 248B4 8015E4AC 7F000224 */  addiu      $v0, $zero, 0x7F
    /* 248B8 8015E4B0 1600C213 */  beq        $fp, $v0, .L8015E50C
    /* 248BC 8015E4B4 C0101E00 */   sll       $v0, $fp, 3
    /* 248C0 8015E4B8 23105E00 */  subu       $v0, $v0, $fp
    /* 248C4 8015E4BC 80100200 */  sll        $v0, $v0, 2
    /* 248C8 8015E4C0 23105E00 */  subu       $v0, $v0, $fp
    /* 248CC 8015E4C4 80100200 */  sll        $v0, $v0, 2
    /* 248D0 8015E4C8 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 248D4 8015E4CC 21082200 */  addu       $at, $at, $v0
    /* 248D8 8015E4D0 A71D2380 */  lb         $v1, %lo(item + 0x53)($at)
    /* 248DC 8015E4D4 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 248E0 8015E4D8 21082200 */  addu       $at, $at, $v0
    /* 248E4 8015E4DC A61D2480 */  lb         $a0, %lo(item + 0x52)($at)
    /* 248E8 8015E4E0 C0180300 */  sll        $v1, $v1, 3
    /* 248EC 8015E4E4 C0100400 */  sll        $v0, $a0, 3
    /* 248F0 8015E4E8 23104400 */  subu       $v0, $v0, $a0
    /* 248F4 8015E4EC C0110200 */  sll        $v0, $v0, 7
    /* 248F8 8015E4F0 21186200 */  addu       $v1, $v1, $v0
    /* 248FC 8015E4F4 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 24900 8015E4F8 21082300 */  addu       $at, $at, $v1
    /* 24904 8015E4FC 2C7A2280 */  lb         $v0, %lo(dung_map + 0x4)($at)
    /* 24908 8015E500 00000000 */  nop
    /* 2490C 8015E504 5F024010 */  beqz       $v0, .L8015EE84
    /* 24910 8015E508 00000000 */   nop
  .L8015E50C:
    /* 24914 8015E50C 40101300 */  sll        $v0, $s3, 1
    /* 24918 8015E510 21105300 */  addu       $v0, $v0, $s3
    /* 2491C 8015E514 80100200 */  sll        $v0, $v0, 2
    /* 24920 8015E518 21105300 */  addu       $v0, $v0, $s3
    /* 24924 8015E51C 00110200 */  sll        $v0, $v0, 4
    /* 24928 8015E520 23105300 */  subu       $v0, $v0, $s3
    /* 2492C 8015E524 80100200 */  sll        $v0, $v0, 2
    /* 24930 8015E528 21105300 */  addu       $v0, $v0, $s3
    /* 24934 8015E52C C0100200 */  sll        $v0, $v0, 3
    /* 24938 8015E530 0E80033C */  lui        $v1, %hi(plr + 0x1910)
    /* 2493C 8015E534 48BE6324 */  addiu      $v1, $v1, %lo(plr + 0x1910)
    /* 24940 8015E538 21384300 */  addu       $a3, $v0, $v1
    /* 24944 8015E53C C0101E00 */  sll        $v0, $fp, 3
    /* 24948 8015E540 23105E00 */  subu       $v0, $v0, $fp
    /* 2494C 8015E544 80100200 */  sll        $v0, $v0, 2
    /* 24950 8015E548 23105E00 */  subu       $v0, $v0, $fp
    /* 24954 8015E54C 80100200 */  sll        $v0, $v0, 2
    /* 24958 8015E550 0D80033C */  lui        $v1, %hi(item)
    /* 2495C 8015E554 541D6324 */  addiu      $v1, $v1, %lo(item)
    /* 24960 8015E558 21304300 */  addu       $a2, $v0, $v1
    /* 24964 8015E55C 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 24968 8015E560 21082200 */  addu       $at, $at, $v0
    /* 2496C 8015E564 781D2394 */  lhu        $v1, %lo(item + 0x24)($at)
    /* 24970 8015E568 6000C824 */  addiu      $t0, $a2, 0x60
    /* 24974 8015E56C FF7F6330 */  andi       $v1, $v1, 0x7FFF
    /* 24978 8015E570 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 2497C 8015E574 21082200 */  addu       $at, $at, $v0
    /* 24980 8015E578 781D23A4 */  sh         $v1, %lo(item + 0x24)($at)
  .L8015E57C:
    /* 24984 8015E57C 0000C28C */  lw         $v0, 0x0($a2)
    /* 24988 8015E580 0400C38C */  lw         $v1, 0x4($a2)
    /* 2498C 8015E584 0800C48C */  lw         $a0, 0x8($a2)
    /* 24990 8015E588 0C00C58C */  lw         $a1, 0xC($a2)
    /* 24994 8015E58C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 24998 8015E590 0400E3AC */  sw         $v1, 0x4($a3)
    /* 2499C 8015E594 0800E4AC */  sw         $a0, 0x8($a3)
    /* 249A0 8015E598 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 249A4 8015E59C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 249A8 8015E5A0 F6FFC814 */  bne        $a2, $t0, .L8015E57C
    /* 249AC 8015E5A4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 249B0 8015E5A8 0000C28C */  lw         $v0, 0x0($a2)
    /* 249B4 8015E5AC 0400C38C */  lw         $v1, 0x4($a2)
    /* 249B8 8015E5B0 0800C48C */  lw         $a0, 0x8($a2)
    /* 249BC 8015E5B4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 249C0 8015E5B8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 249C4 8015E5BC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 249C8 8015E5C0 3477050C */  jal        CheckQuestItem__Fi
    /* 249CC 8015E5C4 21206002 */   addu      $a0, $s3, $zero
    /* 249D0 8015E5C8 E776050C */  jal        CheckBookLevel__Fi
    /* 249D4 8015E5CC 21206002 */   addu      $a0, $s3, $zero
    /* 249D8 8015E5D0 C676050C */  jal        CheckItemStats__Fi
    /* 249DC 8015E5D4 21206002 */   addu      $a0, $s3, $zero
    /* 249E0 8015E5D8 40101300 */  sll        $v0, $s3, 1
    /* 249E4 8015E5DC 21105300 */  addu       $v0, $v0, $s3
    /* 249E8 8015E5E0 80100200 */  sll        $v0, $v0, 2
    /* 249EC 8015E5E4 21105300 */  addu       $v0, $v0, $s3
    /* 249F0 8015E5E8 00110200 */  sll        $v0, $v0, 4
    /* 249F4 8015E5EC 23105300 */  subu       $v0, $v0, $s3
    /* 249F8 8015E5F0 80100200 */  sll        $v0, $v0, 2
    /* 249FC 8015E5F4 21105300 */  addu       $v0, $v0, $s3
    /* 24A00 8015E5F8 C0800200 */  sll        $s0, $v0, 3
    /* 24A04 8015E5FC 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 24A08 8015E600 21083000 */  addu       $at, $at, $s0
    /* 24A0C 8015E604 94BE2490 */  lbu        $a0, %lo(plr + 0x195C)($at)
    /* 24A10 8015E608 D1DD000C */  jal        SetICursor__Fi
    /* 24A14 8015E60C 0C008424 */   addiu     $a0, $a0, 0xC
    /* 24A18 8015E610 C6F5000C */  jal        PlaySFX__Fi
    /* 24A1C 8015E614 32000424 */   addiu     $a0, $zero, 0x32
    /* 24A20 8015E618 0E80013C */  lui        $at, %hi(plr + 0x193C)
    /* 24A24 8015E61C 21083000 */  addu       $at, $at, $s0
    /* 24A28 8015E620 74BE2384 */  lh         $v1, %lo(plr + 0x193C)($at)
    /* 24A2C 8015E624 0B000224 */  addiu      $v0, $zero, 0xB
    /* 24A30 8015E628 05006214 */  bne        $v1, $v0, .L8015E640
    /* 24A34 8015E62C 00000000 */   nop
    /* 24A38 8015E630 7C69050C */  jal        GoldAutoPlace__Fi
    /* 24A3C 8015E634 21206002 */   addu      $a0, $s3, $zero
    /* 24A40 8015E638 0B7B0508 */  j          .L8015EC2C
    /* 24A44 8015E63C 21884000 */   addu      $s1, $v0, $zero
  .L8015E640:
    /* 24A48 8015E640 0E80013C */  lui        $at, %hi(plr + 0x43)
    /* 24A4C 8015E644 21083000 */  addu       $at, $at, $s0
    /* 24A50 8015E648 7BA52290 */  lbu        $v0, %lo(plr + 0x43)($at)
    /* 24A54 8015E64C 00000000 */  nop
    /* 24A58 8015E650 0F004230 */  andi       $v0, $v0, 0xF
    /* 24A5C 8015E654 0200422C */  sltiu      $v0, $v0, 0x2
    /* 24A60 8015E658 1C004010 */  beqz       $v0, .L8015E6CC
    /* 24A64 8015E65C 21880000 */   addu      $s1, $zero, $zero
    /* 24A68 8015E660 0E80013C */  lui        $at, %hi(plr)
    /* 24A6C 8015E664 21083000 */  addu       $at, $at, $s0
    /* 24A70 8015E668 38A5228C */  lw         $v0, %lo(plr)($at)
    /* 24A74 8015E66C 00000000 */  nop
    /* 24A78 8015E670 04004228 */  slti       $v0, $v0, 0x4
    /* 24A7C 8015E674 16004010 */  beqz       $v0, .L8015E6D0
    /* 24A80 8015E678 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24A84 8015E67C 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 24A88 8015E680 21083000 */  addu       $at, $at, $s0
    /* 24A8C 8015E684 AEBE2280 */  lb         $v0, %lo(plr + 0x1976)($at)
    /* 24A90 8015E688 00000000 */  nop
    /* 24A94 8015E68C 0F004010 */  beqz       $v0, .L8015E6CC
    /* 24A98 8015E690 01000224 */   addiu     $v0, $zero, 0x1
    /* 24A9C 8015E694 0E80013C */  lui        $at, %hi(plr + 0x1965)
    /* 24AA0 8015E698 21083000 */  addu       $at, $at, $s0
    /* 24AA4 8015E69C 9DBE2380 */  lb         $v1, %lo(plr + 0x1965)($at)
    /* 24AA8 8015E6A0 00000000 */  nop
    /* 24AAC 8015E6A4 0A006214 */  bne        $v1, $v0, .L8015E6D0
    /* 24AB0 8015E6A8 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24AB4 8015E6AC B26A050C */  jal        WeaponAutoPlace__Fi
    /* 24AB8 8015E6B0 21206002 */   addu      $a0, $s3, $zero
    /* 24ABC 8015E6B4 21884000 */  addu       $s1, $v0, $zero
    /* 24AC0 8015E6B8 FF002232 */  andi       $v0, $s1, 0xFF
    /* 24AC4 8015E6BC 06004010 */  beqz       $v0, .L8015E6D8
    /* 24AC8 8015E6C0 21206002 */   addu      $a0, $s3, $zero
    /* 24ACC 8015E6C4 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 24AD0 8015E6C8 01000524 */   addiu     $a1, $zero, 0x1
  .L8015E6CC:
    /* 24AD4 8015E6CC FF002232 */  andi       $v0, $s1, 0xFF
  .L8015E6D0:
    /* 24AD8 8015E6D0 5A014014 */  bnez       $v0, .L8015EC3C
    /* 24ADC 8015E6D4 C0101E00 */   sll       $v0, $fp, 3
  .L8015E6D8:
    /* 24AE0 8015E6D8 01000224 */  addiu      $v0, $zero, 0x1
    /* 24AE4 8015E6DC 1280143C */  lui        $s4, %hi(icursW28)
    /* 24AE8 8015E6E0 48B7948E */  lw         $s4, %lo(icursW28)($s4)
    /* 24AEC 8015E6E4 1280153C */  lui        $s5, %hi(icursH28)
    /* 24AF0 8015E6E8 4CB7B58E */  lw         $s5, %lo(icursH28)($s5)
    /* 24AF4 8015E6EC DC008216 */  bne        $s4, $v0, .L8015EA60
    /* 24AF8 8015E6F0 00000000 */   nop
    /* 24AFC 8015E6F4 8D00B416 */  bne        $s5, $s4, .L8015E92C
    /* 24B00 8015E6F8 00000000 */   nop
    /* 24B04 8015E6FC 40101300 */  sll        $v0, $s3, 1
    /* 24B08 8015E700 21105300 */  addu       $v0, $v0, $s3
    /* 24B0C 8015E704 80100200 */  sll        $v0, $v0, 2
    /* 24B10 8015E708 21105300 */  addu       $v0, $v0, $s3
    /* 24B14 8015E70C 00110200 */  sll        $v0, $v0, 4
    /* 24B18 8015E710 23105300 */  subu       $v0, $v0, $s3
    /* 24B1C 8015E714 80100200 */  sll        $v0, $v0, 2
    /* 24B20 8015E718 21105300 */  addu       $v0, $v0, $s3
    /* 24B24 8015E71C C0180200 */  sll        $v1, $v0, 3
    /* 24B28 8015E720 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 24B2C 8015E724 21082300 */  addu       $at, $at, $v1
    /* 24B30 8015E728 AEBE2280 */  lb         $v0, %lo(plr + 0x1976)($at)
    /* 24B34 8015E72C 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 24B38 8015E730 21082300 */  addu       $at, $at, $v1
    /* 24B3C 8015E734 76BE2484 */  lh         $a0, %lo(plr + 0x193E)($at)
    /* 24B40 8015E738 38004010 */  beqz       $v0, .L8015E81C
    /* 24B44 8015E73C FF002232 */   andi      $v0, $s1, 0xFF
    /* 24B48 8015E740 0D80013C */  lui        $at, %hi(AllItemsUseable)
    /* 24B4C 8015E744 21082400 */  addu       $at, $at, $a0
    /* 24B50 8015E748 401B2290 */  lbu        $v0, %lo(AllItemsUseable)($at)
    /* 24B54 8015E74C 00000000 */  nop
    /* 24B58 8015E750 31004010 */  beqz       $v0, .L8015E818
    /* 24B5C 8015E754 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24B60 8015E758 30004014 */  bnez       $v0, .L8015E81C
    /* 24B64 8015E75C 21800000 */   addu      $s0, $zero, $zero
    /* 24B68 8015E760 21906000 */  addu       $s2, $v1, $zero
    /* 24B6C 8015E764 21B84002 */  addu       $s7, $s2, $zero
    /* 24B70 8015E768 21B00000 */  addu       $s6, $zero, $zero
  .L8015E76C:
    /* 24B74 8015E76C 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 24B78 8015E770 21083200 */  addu       $at, $at, $s2
    /* 24B7C 8015E774 14BB2384 */  lh         $v1, %lo(plr + 0x15DC)($at)
    /* 24B80 8015E778 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 24B84 8015E77C 1E006214 */  bne        $v1, $v0, .L8015E7F8
    /* 24B88 8015E780 00000000 */   nop
    /* 24B8C 8015E784 0E80033C */  lui        $v1, %hi(plr + 0x15B0)
    /* 24B90 8015E788 E8BA6324 */  addiu      $v1, $v1, %lo(plr + 0x15B0)
    /* 24B94 8015E78C 2110E302 */  addu       $v0, $s7, $v1
    /* 24B98 8015E790 2138C202 */  addu       $a3, $s6, $v0
    /* 24B9C 8015E794 60036324 */  addiu      $v1, $v1, 0x360
    /* 24BA0 8015E798 2130E302 */  addu       $a2, $s7, $v1
    /* 24BA4 8015E79C 6000C824 */  addiu      $t0, $a2, 0x60
  .L8015E7A0:
    /* 24BA8 8015E7A0 0000C28C */  lw         $v0, 0x0($a2)
    /* 24BAC 8015E7A4 0400C38C */  lw         $v1, 0x4($a2)
    /* 24BB0 8015E7A8 0800C48C */  lw         $a0, 0x8($a2)
    /* 24BB4 8015E7AC 0C00C58C */  lw         $a1, 0xC($a2)
    /* 24BB8 8015E7B0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 24BBC 8015E7B4 0400E3AC */  sw         $v1, 0x4($a3)
    /* 24BC0 8015E7B8 0800E4AC */  sw         $a0, 0x8($a3)
    /* 24BC4 8015E7BC 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 24BC8 8015E7C0 1000C624 */  addiu      $a2, $a2, 0x10
    /* 24BCC 8015E7C4 F6FFC814 */  bne        $a2, $t0, .L8015E7A0
    /* 24BD0 8015E7C8 1000E724 */   addiu     $a3, $a3, 0x10
    /* 24BD4 8015E7CC 0000C28C */  lw         $v0, 0x0($a2)
    /* 24BD8 8015E7D0 0400C38C */  lw         $v1, 0x4($a2)
    /* 24BDC 8015E7D4 0800C48C */  lw         $a0, 0x8($a2)
    /* 24BE0 8015E7D8 0000E2AC */  sw         $v0, 0x0($a3)
    /* 24BE4 8015E7DC 0400E3AC */  sw         $v1, 0x4($a3)
    /* 24BE8 8015E7E0 0800E4AC */  sw         $a0, 0x8($a3)
    /* 24BEC 8015E7E4 4CFC000C */  jal        CalcPlrScrolls__Fi
    /* 24BF0 8015E7E8 21206002 */   addu      $a0, $s3, $zero
    /* 24BF4 8015E7EC 01000224 */  addiu      $v0, $zero, 0x1
    /* 24BF8 8015E7F0 AD1B82A3 */  sb         $v0, %gp_rel(drawsbarflag)($gp)
    /* 24BFC 8015E7F4 01001124 */  addiu      $s1, $zero, 0x1
  .L8015E7F8:
    /* 24C00 8015E7F8 6C005226 */  addiu      $s2, $s2, 0x6C
    /* 24C04 8015E7FC 01001026 */  addiu      $s0, $s0, 0x1
    /* 24C08 8015E800 0800022A */  slti       $v0, $s0, 0x8
    /* 24C0C 8015E804 04004010 */  beqz       $v0, .L8015E818
    /* 24C10 8015E808 6C00D626 */   addiu     $s6, $s6, 0x6C
    /* 24C14 8015E80C FF002232 */  andi       $v0, $s1, 0xFF
    /* 24C18 8015E810 D6FF4010 */  beqz       $v0, .L8015E76C
    /* 24C1C 8015E814 00000000 */   nop
  .L8015E818:
    /* 24C20 8015E818 FF002232 */  andi       $v0, $s1, 0xFF
  .L8015E81C:
    /* 24C24 8015E81C 0F004014 */  bnez       $v0, .L8015E85C
    /* 24C28 8015E820 1E001024 */   addiu     $s0, $zero, 0x1E
    /* 24C2C 8015E824 01001224 */  addiu      $s2, $zero, 0x1
  .L8015E828:
    /* 24C30 8015E828 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24C34 8015E82C 21206002 */  addu       $a0, $s3, $zero
    /* 24C38 8015E830 21280002 */  addu       $a1, $s0, $zero
    /* 24C3C 8015E834 21308002 */  addu       $a2, $s4, $zero
    /* 24C40 8015E838 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24C44 8015E83C 2138A002 */   addu      $a3, $s5, $zero
    /* 24C48 8015E840 21884000 */  addu       $s1, $v0, $zero
    /* 24C4C 8015E844 01001026 */  addiu      $s0, $s0, 0x1
    /* 24C50 8015E848 2800022A */  slti       $v0, $s0, 0x28
    /* 24C54 8015E84C 03004010 */  beqz       $v0, .L8015E85C
    /* 24C58 8015E850 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24C5C 8015E854 F4FF4010 */  beqz       $v0, .L8015E828
    /* 24C60 8015E858 00000000 */   nop
  .L8015E85C:
    /* 24C64 8015E85C FF002232 */  andi       $v0, $s1, 0xFF
    /* 24C68 8015E860 10004014 */  bnez       $v0, .L8015E8A4
    /* 24C6C 8015E864 14001024 */   addiu     $s0, $zero, 0x14
    /* 24C70 8015E868 01001224 */  addiu      $s2, $zero, 0x1
  .L8015E86C:
    /* 24C74 8015E86C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24C78 8015E870 21206002 */  addu       $a0, $s3, $zero
    /* 24C7C 8015E874 21280002 */  addu       $a1, $s0, $zero
    /* 24C80 8015E878 21308002 */  addu       $a2, $s4, $zero
    /* 24C84 8015E87C C967050C */  jal        AutoPlace__FiiiiUc
    /* 24C88 8015E880 2138A002 */   addu      $a3, $s5, $zero
    /* 24C8C 8015E884 21884000 */  addu       $s1, $v0, $zero
    /* 24C90 8015E888 01001026 */  addiu      $s0, $s0, 0x1
    /* 24C94 8015E88C 1E00022A */  slti       $v0, $s0, 0x1E
    /* 24C98 8015E890 03004010 */  beqz       $v0, .L8015E8A0
    /* 24C9C 8015E894 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24CA0 8015E898 F4FF4010 */  beqz       $v0, .L8015E86C
    /* 24CA4 8015E89C 00000000 */   nop
  .L8015E8A0:
    /* 24CA8 8015E8A0 FF002232 */  andi       $v0, $s1, 0xFF
  .L8015E8A4:
    /* 24CAC 8015E8A4 0F004014 */  bnez       $v0, .L8015E8E4
    /* 24CB0 8015E8A8 0A001024 */   addiu     $s0, $zero, 0xA
    /* 24CB4 8015E8AC 01001224 */  addiu      $s2, $zero, 0x1
  .L8015E8B0:
    /* 24CB8 8015E8B0 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24CBC 8015E8B4 21206002 */  addu       $a0, $s3, $zero
    /* 24CC0 8015E8B8 21280002 */  addu       $a1, $s0, $zero
    /* 24CC4 8015E8BC 21308002 */  addu       $a2, $s4, $zero
    /* 24CC8 8015E8C0 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24CCC 8015E8C4 2138A002 */   addu      $a3, $s5, $zero
    /* 24CD0 8015E8C8 21884000 */  addu       $s1, $v0, $zero
    /* 24CD4 8015E8CC 01001026 */  addiu      $s0, $s0, 0x1
    /* 24CD8 8015E8D0 1400022A */  slti       $v0, $s0, 0x14
    /* 24CDC 8015E8D4 03004010 */  beqz       $v0, .L8015E8E4
    /* 24CE0 8015E8D8 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24CE4 8015E8DC F4FF4010 */  beqz       $v0, .L8015E8B0
    /* 24CE8 8015E8E0 00000000 */   nop
  .L8015E8E4:
    /* 24CEC 8015E8E4 FF002232 */  andi       $v0, $s1, 0xFF
    /* 24CF0 8015E8E8 0F004014 */  bnez       $v0, .L8015E928
    /* 24CF4 8015E8EC 21800000 */   addu      $s0, $zero, $zero
    /* 24CF8 8015E8F0 01001224 */  addiu      $s2, $zero, 0x1
  .L8015E8F4:
    /* 24CFC 8015E8F4 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24D00 8015E8F8 21206002 */  addu       $a0, $s3, $zero
    /* 24D04 8015E8FC 21280002 */  addu       $a1, $s0, $zero
    /* 24D08 8015E900 21308002 */  addu       $a2, $s4, $zero
    /* 24D0C 8015E904 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24D10 8015E908 2138A002 */   addu      $a3, $s5, $zero
    /* 24D14 8015E90C 21884000 */  addu       $s1, $v0, $zero
    /* 24D18 8015E910 01001026 */  addiu      $s0, $s0, 0x1
    /* 24D1C 8015E914 0A00022A */  slti       $v0, $s0, 0xA
    /* 24D20 8015E918 03004010 */  beqz       $v0, .L8015E928
    /* 24D24 8015E91C FF002232 */   andi      $v0, $s1, 0xFF
    /* 24D28 8015E920 F4FF4010 */  beqz       $v0, .L8015E8F4
    /* 24D2C 8015E924 00000000 */   nop
  .L8015E928:
    /* 24D30 8015E928 01000224 */  addiu      $v0, $zero, 0x1
  .L8015E92C:
    /* 24D34 8015E92C 4D008216 */  bne        $s4, $v0, .L8015EA64
    /* 24D38 8015E930 02000224 */   addiu     $v0, $zero, 0x2
    /* 24D3C 8015E934 3400A216 */  bne        $s5, $v0, .L8015EA08
    /* 24D40 8015E938 01000224 */   addiu     $v0, $zero, 0x1
    /* 24D44 8015E93C FF002232 */  andi       $v0, $s1, 0xFF
    /* 24D48 8015E940 10004014 */  bnez       $v0, .L8015E984
    /* 24D4C 8015E944 1D001024 */   addiu     $s0, $zero, 0x1D
    /* 24D50 8015E948 01001224 */  addiu      $s2, $zero, 0x1
  .L8015E94C:
    /* 24D54 8015E94C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24D58 8015E950 21206002 */  addu       $a0, $s3, $zero
    /* 24D5C 8015E954 21280002 */  addu       $a1, $s0, $zero
    /* 24D60 8015E958 21308002 */  addu       $a2, $s4, $zero
    /* 24D64 8015E95C C967050C */  jal        AutoPlace__FiiiiUc
    /* 24D68 8015E960 2138A002 */   addu      $a3, $s5, $zero
    /* 24D6C 8015E964 21884000 */  addu       $s1, $v0, $zero
    /* 24D70 8015E968 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 24D74 8015E96C 1400022A */  slti       $v0, $s0, 0x14
    /* 24D78 8015E970 03004014 */  bnez       $v0, .L8015E980
    /* 24D7C 8015E974 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24D80 8015E978 F4FF4010 */  beqz       $v0, .L8015E94C
    /* 24D84 8015E97C 00000000 */   nop
  .L8015E980:
    /* 24D88 8015E980 FF002232 */  andi       $v0, $s1, 0xFF
  .L8015E984:
    /* 24D8C 8015E984 0E004014 */  bnez       $v0, .L8015E9C0
    /* 24D90 8015E988 09001024 */   addiu     $s0, $zero, 0x9
    /* 24D94 8015E98C 01001224 */  addiu      $s2, $zero, 0x1
  .L8015E990:
    /* 24D98 8015E990 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24D9C 8015E994 21206002 */  addu       $a0, $s3, $zero
    /* 24DA0 8015E998 21280002 */  addu       $a1, $s0, $zero
    /* 24DA4 8015E99C 21308002 */  addu       $a2, $s4, $zero
    /* 24DA8 8015E9A0 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24DAC 8015E9A4 2138A002 */   addu      $a3, $s5, $zero
    /* 24DB0 8015E9A8 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 24DB4 8015E9AC 04000006 */  bltz       $s0, .L8015E9C0
    /* 24DB8 8015E9B0 21884000 */   addu      $s1, $v0, $zero
    /* 24DBC 8015E9B4 FF002232 */  andi       $v0, $s1, 0xFF
    /* 24DC0 8015E9B8 F5FF4010 */  beqz       $v0, .L8015E990
    /* 24DC4 8015E9BC 00000000 */   nop
  .L8015E9C0:
    /* 24DC8 8015E9C0 FF002232 */  andi       $v0, $s1, 0xFF
    /* 24DCC 8015E9C4 0F004014 */  bnez       $v0, .L8015EA04
    /* 24DD0 8015E9C8 13001024 */   addiu     $s0, $zero, 0x13
    /* 24DD4 8015E9CC 01001224 */  addiu      $s2, $zero, 0x1
  .L8015E9D0:
    /* 24DD8 8015E9D0 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24DDC 8015E9D4 21206002 */  addu       $a0, $s3, $zero
    /* 24DE0 8015E9D8 21280002 */  addu       $a1, $s0, $zero
    /* 24DE4 8015E9DC 21308002 */  addu       $a2, $s4, $zero
    /* 24DE8 8015E9E0 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24DEC 8015E9E4 2138A002 */   addu      $a3, $s5, $zero
    /* 24DF0 8015E9E8 21884000 */  addu       $s1, $v0, $zero
    /* 24DF4 8015E9EC FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 24DF8 8015E9F0 0A00022A */  slti       $v0, $s0, 0xA
    /* 24DFC 8015E9F4 03004014 */  bnez       $v0, .L8015EA04
    /* 24E00 8015E9F8 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24E04 8015E9FC F4FF4010 */  beqz       $v0, .L8015E9D0
    /* 24E08 8015EA00 00000000 */   nop
  .L8015EA04:
    /* 24E0C 8015EA04 01000224 */  addiu      $v0, $zero, 0x1
  .L8015EA08:
    /* 24E10 8015EA08 16008216 */  bne        $s4, $v0, .L8015EA64
    /* 24E14 8015EA0C 02000224 */   addiu     $v0, $zero, 0x2
    /* 24E18 8015EA10 03000224 */  addiu      $v0, $zero, 0x3
    /* 24E1C 8015EA14 1300A216 */  bne        $s5, $v0, .L8015EA64
    /* 24E20 8015EA18 02000224 */   addiu     $v0, $zero, 0x2
    /* 24E24 8015EA1C FF002232 */  andi       $v0, $s1, 0xFF
    /* 24E28 8015EA20 0F004014 */  bnez       $v0, .L8015EA60
    /* 24E2C 8015EA24 21800000 */   addu      $s0, $zero, $zero
    /* 24E30 8015EA28 01001224 */  addiu      $s2, $zero, 0x1
  .L8015EA2C:
    /* 24E34 8015EA2C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24E38 8015EA30 21206002 */  addu       $a0, $s3, $zero
    /* 24E3C 8015EA34 21280002 */  addu       $a1, $s0, $zero
    /* 24E40 8015EA38 21308002 */  addu       $a2, $s4, $zero
    /* 24E44 8015EA3C C967050C */  jal        AutoPlace__FiiiiUc
    /* 24E48 8015EA40 2138A002 */   addu      $a3, $s5, $zero
    /* 24E4C 8015EA44 21884000 */  addu       $s1, $v0, $zero
    /* 24E50 8015EA48 01001026 */  addiu      $s0, $s0, 0x1
    /* 24E54 8015EA4C 1400022A */  slti       $v0, $s0, 0x14
    /* 24E58 8015EA50 03004010 */  beqz       $v0, .L8015EA60
    /* 24E5C 8015EA54 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24E60 8015EA58 F4FF4010 */  beqz       $v0, .L8015EA2C
    /* 24E64 8015EA5C 00000000 */   nop
  .L8015EA60:
    /* 24E68 8015EA60 02000224 */  addiu      $v0, $zero, 0x2
  .L8015EA64:
    /* 24E6C 8015EA64 71008216 */  bne        $s4, $v0, .L8015EC2C
    /* 24E70 8015EA68 00000000 */   nop
    /* 24E74 8015EA6C 4900B416 */  bne        $s5, $s4, .L8015EB94
    /* 24E78 8015EA70 02000224 */   addiu     $v0, $zero, 0x2
    /* 24E7C 8015EA74 FF002232 */  andi       $v0, $s1, 0xFF
    /* 24E80 8015EA78 13004014 */  bnez       $v0, .L8015EAC8
    /* 24E84 8015EA7C 21800000 */   addu      $s0, $zero, $zero
    /* 24E88 8015EA80 01001624 */  addiu      $s6, $zero, 0x1
    /* 24E8C 8015EA84 1180123C */  lui        $s2, %hi(AP2x2Tbl)
    /* 24E90 8015EA88 08D05226 */  addiu      $s2, $s2, %lo(AP2x2Tbl)
    /* 24E94 8015EA8C 21206002 */  addu       $a0, $s3, $zero
  .L8015EA90:
    /* 24E98 8015EA90 21308002 */  addu       $a2, $s4, $zero
    /* 24E9C 8015EA94 2138A002 */  addu       $a3, $s5, $zero
    /* 24EA0 8015EA98 1000B6AF */  sw         $s6, 0x10($sp)
    /* 24EA4 8015EA9C 0000458E */  lw         $a1, 0x0($s2)
    /* 24EA8 8015EAA0 04005226 */  addiu      $s2, $s2, 0x4
    /* 24EAC 8015EAA4 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24EB0 8015EAA8 01001026 */   addiu     $s0, $s0, 0x1
    /* 24EB4 8015EAAC 21884000 */  addu       $s1, $v0, $zero
    /* 24EB8 8015EAB0 0A00022A */  slti       $v0, $s0, 0xA
    /* 24EBC 8015EAB4 03004010 */  beqz       $v0, .L8015EAC4
    /* 24EC0 8015EAB8 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24EC4 8015EABC F4FF4010 */  beqz       $v0, .L8015EA90
    /* 24EC8 8015EAC0 21206002 */   addu      $a0, $s3, $zero
  .L8015EAC4:
    /* 24ECC 8015EAC4 FF002232 */  andi       $v0, $s1, 0xFF
  .L8015EAC8:
    /* 24ED0 8015EAC8 0F004014 */  bnez       $v0, .L8015EB08
    /* 24ED4 8015EACC 15001024 */   addiu     $s0, $zero, 0x15
    /* 24ED8 8015EAD0 01001224 */  addiu      $s2, $zero, 0x1
  .L8015EAD4:
    /* 24EDC 8015EAD4 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24EE0 8015EAD8 21206002 */  addu       $a0, $s3, $zero
    /* 24EE4 8015EADC 21280002 */  addu       $a1, $s0, $zero
    /* 24EE8 8015EAE0 21308002 */  addu       $a2, $s4, $zero
    /* 24EEC 8015EAE4 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24EF0 8015EAE8 2138A002 */   addu      $a3, $s5, $zero
    /* 24EF4 8015EAEC 21884000 */  addu       $s1, $v0, $zero
    /* 24EF8 8015EAF0 02001026 */  addiu      $s0, $s0, 0x2
    /* 24EFC 8015EAF4 1D00022A */  slti       $v0, $s0, 0x1D
    /* 24F00 8015EAF8 03004010 */  beqz       $v0, .L8015EB08
    /* 24F04 8015EAFC FF002232 */   andi      $v0, $s1, 0xFF
    /* 24F08 8015EB00 F4FF4010 */  beqz       $v0, .L8015EAD4
    /* 24F0C 8015EB04 00000000 */   nop
  .L8015EB08:
    /* 24F10 8015EB08 FF002232 */  andi       $v0, $s1, 0xFF
    /* 24F14 8015EB0C 10004014 */  bnez       $v0, .L8015EB50
    /* 24F18 8015EB10 01001024 */   addiu     $s0, $zero, 0x1
    /* 24F1C 8015EB14 01001224 */  addiu      $s2, $zero, 0x1
  .L8015EB18:
    /* 24F20 8015EB18 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24F24 8015EB1C 21206002 */  addu       $a0, $s3, $zero
    /* 24F28 8015EB20 21280002 */  addu       $a1, $s0, $zero
    /* 24F2C 8015EB24 21308002 */  addu       $a2, $s4, $zero
    /* 24F30 8015EB28 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24F34 8015EB2C 2138A002 */   addu      $a3, $s5, $zero
    /* 24F38 8015EB30 21884000 */  addu       $s1, $v0, $zero
    /* 24F3C 8015EB34 02001026 */  addiu      $s0, $s0, 0x2
    /* 24F40 8015EB38 0900022A */  slti       $v0, $s0, 0x9
    /* 24F44 8015EB3C 03004010 */  beqz       $v0, .L8015EB4C
    /* 24F48 8015EB40 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24F4C 8015EB44 F4FF4010 */  beqz       $v0, .L8015EB18
    /* 24F50 8015EB48 00000000 */   nop
  .L8015EB4C:
    /* 24F54 8015EB4C FF002232 */  andi       $v0, $s1, 0xFF
  .L8015EB50:
    /* 24F58 8015EB50 0F004014 */  bnez       $v0, .L8015EB90
    /* 24F5C 8015EB54 0A001024 */   addiu     $s0, $zero, 0xA
    /* 24F60 8015EB58 01001224 */  addiu      $s2, $zero, 0x1
  .L8015EB5C:
    /* 24F64 8015EB5C 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24F68 8015EB60 21206002 */  addu       $a0, $s3, $zero
    /* 24F6C 8015EB64 21280002 */  addu       $a1, $s0, $zero
    /* 24F70 8015EB68 21308002 */  addu       $a2, $s4, $zero
    /* 24F74 8015EB6C C967050C */  jal        AutoPlace__FiiiiUc
    /* 24F78 8015EB70 2138A002 */   addu      $a3, $s5, $zero
    /* 24F7C 8015EB74 21884000 */  addu       $s1, $v0, $zero
    /* 24F80 8015EB78 01001026 */  addiu      $s0, $s0, 0x1
    /* 24F84 8015EB7C 1300022A */  slti       $v0, $s0, 0x13
    /* 24F88 8015EB80 03004010 */  beqz       $v0, .L8015EB90
    /* 24F8C 8015EB84 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24F90 8015EB88 F4FF4010 */  beqz       $v0, .L8015EB5C
    /* 24F94 8015EB8C 00000000 */   nop
  .L8015EB90:
    /* 24F98 8015EB90 02000224 */  addiu      $v0, $zero, 0x2
  .L8015EB94:
    /* 24F9C 8015EB94 26008216 */  bne        $s4, $v0, .L8015EC30
    /* 24FA0 8015EB98 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24FA4 8015EB9C 03000224 */  addiu      $v0, $zero, 0x3
    /* 24FA8 8015EBA0 2300A216 */  bne        $s5, $v0, .L8015EC30
    /* 24FAC 8015EBA4 FF002232 */   andi      $v0, $s1, 0xFF
    /* 24FB0 8015EBA8 10004014 */  bnez       $v0, .L8015EBEC
    /* 24FB4 8015EBAC 21800000 */   addu      $s0, $zero, $zero
    /* 24FB8 8015EBB0 01001224 */  addiu      $s2, $zero, 0x1
  .L8015EBB4:
    /* 24FBC 8015EBB4 1000B2AF */  sw         $s2, 0x10($sp)
    /* 24FC0 8015EBB8 21206002 */  addu       $a0, $s3, $zero
    /* 24FC4 8015EBBC 21280002 */  addu       $a1, $s0, $zero
    /* 24FC8 8015EBC0 21308002 */  addu       $a2, $s4, $zero
    /* 24FCC 8015EBC4 C967050C */  jal        AutoPlace__FiiiiUc
    /* 24FD0 8015EBC8 2138A002 */   addu      $a3, $s5, $zero
    /* 24FD4 8015EBCC 21884000 */  addu       $s1, $v0, $zero
    /* 24FD8 8015EBD0 01001026 */  addiu      $s0, $s0, 0x1
    /* 24FDC 8015EBD4 0900022A */  slti       $v0, $s0, 0x9
    /* 24FE0 8015EBD8 03004010 */  beqz       $v0, .L8015EBE8
    /* 24FE4 8015EBDC FF002232 */   andi      $v0, $s1, 0xFF
    /* 24FE8 8015EBE0 F4FF4010 */  beqz       $v0, .L8015EBB4
    /* 24FEC 8015EBE4 00000000 */   nop
  .L8015EBE8:
    /* 24FF0 8015EBE8 FF002232 */  andi       $v0, $s1, 0xFF
  .L8015EBEC:
    /* 24FF4 8015EBEC 12004014 */  bnez       $v0, .L8015EC38
    /* 24FF8 8015EBF0 0A001024 */   addiu     $s0, $zero, 0xA
    /* 24FFC 8015EBF4 01001224 */  addiu      $s2, $zero, 0x1
  .L8015EBF8:
    /* 25000 8015EBF8 1000B2AF */  sw         $s2, 0x10($sp)
    /* 25004 8015EBFC 21206002 */  addu       $a0, $s3, $zero
    /* 25008 8015EC00 21280002 */  addu       $a1, $s0, $zero
    /* 2500C 8015EC04 21308002 */  addu       $a2, $s4, $zero
    /* 25010 8015EC08 C967050C */  jal        AutoPlace__FiiiiUc
    /* 25014 8015EC0C 2138A002 */   addu      $a3, $s5, $zero
    /* 25018 8015EC10 21884000 */  addu       $s1, $v0, $zero
    /* 2501C 8015EC14 01001026 */  addiu      $s0, $s0, 0x1
    /* 25020 8015EC18 1300022A */  slti       $v0, $s0, 0x13
    /* 25024 8015EC1C 03004010 */  beqz       $v0, .L8015EC2C
    /* 25028 8015EC20 FF002232 */   andi      $v0, $s1, 0xFF
    /* 2502C 8015EC24 F4FF4010 */  beqz       $v0, .L8015EBF8
    /* 25030 8015EC28 00000000 */   nop
  .L8015EC2C:
    /* 25034 8015EC2C FF002232 */  andi       $v0, $s1, 0xFF
  .L8015EC30:
    /* 25038 8015EC30 2C004010 */  beqz       $v0, .L8015ECE4
    /* 2503C 8015EC34 00000000 */   nop
  .L8015EC38:
    /* 25040 8015EC38 C0101E00 */  sll        $v0, $fp, 3
  .L8015EC3C:
    /* 25044 8015EC3C 23105E00 */  subu       $v0, $v0, $fp
    /* 25048 8015EC40 80100200 */  sll        $v0, $v0, 2
    /* 2504C 8015EC44 23105E00 */  subu       $v0, $v0, $fp
    /* 25050 8015EC48 80100200 */  sll        $v0, $v0, 2
    /* 25054 8015EC4C 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 25058 8015EC50 21082200 */  addu       $at, $at, $v0
    /* 2505C 8015EC54 A71D2380 */  lb         $v1, %lo(item + 0x53)($at)
    /* 25060 8015EC58 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 25064 8015EC5C 21082200 */  addu       $at, $at, $v0
    /* 25068 8015EC60 A61D2480 */  lb         $a0, %lo(item + 0x52)($at)
    /* 2506C 8015EC64 C0180300 */  sll        $v1, $v1, 3
    /* 25070 8015EC68 C0100400 */  sll        $v0, $a0, 3
    /* 25074 8015EC6C 23104400 */  subu       $v0, $v0, $a0
    /* 25078 8015EC70 C0110200 */  sll        $v0, $v0, 7
    /* 2507C 8015EC74 21186200 */  addu       $v1, $v1, $v0
    /* 25080 8015EC78 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 25084 8015EC7C 21082300 */  addu       $at, $at, $v1
    /* 25088 8015EC80 2C7A20A0 */  sb         $zero, %lo(dung_map + 0x4)($at)
    /* 2508C 8015EC84 1280023C */  lui        $v0, %hi(numitems)
    /* 25090 8015EC88 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 25094 8015EC8C 00000000 */  nop
    /* 25098 8015EC90 7C004018 */  blez       $v0, .L8015EE84
    /* 2509C 8015EC94 21280000 */   addu      $a1, $zero, $zero
  .L8015EC98:
    /* 250A0 8015EC98 0D80013C */  lui        $at, %hi(itemactive)
    /* 250A4 8015EC9C 21082500 */  addu       $at, $at, $a1
    /* 250A8 8015ECA0 54532280 */  lb         $v0, %lo(itemactive)($at)
    /* 250AC 8015ECA4 00000000 */  nop
    /* 250B0 8015ECA8 05005E14 */  bne        $v0, $fp, .L8015ECC0
    /* 250B4 8015ECAC 00000000 */   nop
    /* 250B8 8015ECB0 EE15010C */  jal        DeleteItem__Fii
    /* 250BC 8015ECB4 2120C003 */   addu      $a0, $fp, $zero
    /* 250C0 8015ECB8 317B0508 */  j          .L8015ECC4
    /* 250C4 8015ECBC 21280000 */   addu      $a1, $zero, $zero
  .L8015ECC0:
    /* 250C8 8015ECC0 0100A524 */  addiu      $a1, $a1, 0x1
  .L8015ECC4:
    /* 250CC 8015ECC4 1280023C */  lui        $v0, %hi(numitems)
    /* 250D0 8015ECC8 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 250D4 8015ECCC 00000000 */  nop
    /* 250D8 8015ECD0 2A10A200 */  slt        $v0, $a1, $v0
    /* 250DC 8015ECD4 6B004010 */  beqz       $v0, .L8015EE84
    /* 250E0 8015ECD8 00000000 */   nop
    /* 250E4 8015ECDC 267B0508 */  j          .L8015EC98
    /* 250E8 8015ECE0 00000000 */   nop
  .L8015ECE4:
    /* 250EC 8015ECE4 1280023C */  lui        $v0, %hi(myplr)
    /* 250F0 8015ECE8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 250F4 8015ECEC 00000000 */  nop
    /* 250F8 8015ECF0 21006216 */  bne        $s3, $v0, .L8015ED78
    /* 250FC 8015ECF4 40101300 */   sll       $v0, $s3, 1
    /* 25100 8015ECF8 21105300 */  addu       $v0, $v0, $s3
    /* 25104 8015ECFC 80100200 */  sll        $v0, $v0, 2
    /* 25108 8015ED00 21105300 */  addu       $v0, $v0, $s3
    /* 2510C 8015ED04 00110200 */  sll        $v0, $v0, 4
    /* 25110 8015ED08 23105300 */  subu       $v0, $v0, $s3
    /* 25114 8015ED0C 80100200 */  sll        $v0, $v0, 2
    /* 25118 8015ED10 21105300 */  addu       $v0, $v0, $s3
    /* 2511C 8015ED14 C0100200 */  sll        $v0, $v0, 3
    /* 25120 8015ED18 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 25124 8015ED1C 21082200 */  addu       $at, $at, $v0
    /* 25128 8015ED20 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2512C 8015ED24 00000000 */  nop
    /* 25130 8015ED28 05006014 */  bnez       $v1, .L8015ED40
    /* 25134 8015ED2C 01000224 */   addiu     $v0, $zero, 0x1
    /* 25138 8015ED30 C9F6000C */  jal        ENG_random__Fl
    /* 2513C 8015ED34 03000424 */   addiu     $a0, $zero, 0x3
    /* 25140 8015ED38 5B7B0508 */  j          .L8015ED6C
    /* 25144 8015ED3C D9024424 */   addiu     $a0, $v0, 0x2D9
  .L8015ED40:
    /* 25148 8015ED40 05006214 */  bne        $v1, $v0, .L8015ED58
    /* 2514C 8015ED44 02000224 */   addiu     $v0, $zero, 0x2
    /* 25150 8015ED48 C9F6000C */  jal        ENG_random__Fl
    /* 25154 8015ED4C 03000424 */   addiu     $a0, $zero, 0x3
    /* 25158 8015ED50 5B7B0508 */  j          .L8015ED6C
    /* 2515C 8015ED54 71024424 */   addiu     $a0, $v0, 0x271
  .L8015ED58:
    /* 25160 8015ED58 07006214 */  bne        $v1, $v0, .L8015ED78
    /* 25164 8015ED5C 40101300 */   sll       $v0, $s3, 1
    /* 25168 8015ED60 C9F6000C */  jal        ENG_random__Fl
    /* 2516C 8015ED64 03000424 */   addiu     $a0, $zero, 0x3
    /* 25170 8015ED68 09024424 */  addiu      $a0, $v0, 0x209
  .L8015ED6C:
    /* 25174 8015ED6C C6F5000C */  jal        PlaySFX__Fi
    /* 25178 8015ED70 00000000 */   nop
    /* 2517C 8015ED74 40101300 */  sll        $v0, $s3, 1
  .L8015ED78:
    /* 25180 8015ED78 21105300 */  addu       $v0, $v0, $s3
    /* 25184 8015ED7C 80100200 */  sll        $v0, $v0, 2
    /* 25188 8015ED80 21105300 */  addu       $v0, $v0, $s3
    /* 2518C 8015ED84 00110200 */  sll        $v0, $v0, 4
    /* 25190 8015ED88 23105300 */  subu       $v0, $v0, $s3
    /* 25194 8015ED8C 80100200 */  sll        $v0, $v0, 2
    /* 25198 8015ED90 21105300 */  addu       $v0, $v0, $s3
    /* 2519C 8015ED94 C0100200 */  sll        $v0, $v0, 3
    /* 251A0 8015ED98 0E80033C */  lui        $v1, %hi(plr + 0x1910)
    /* 251A4 8015ED9C 48BE6324 */  addiu      $v1, $v1, %lo(plr + 0x1910)
    /* 251A8 8015EDA0 21384300 */  addu       $a3, $v0, $v1
    /* 251AC 8015EDA4 0D80033C */  lui        $v1, %hi(item)
    /* 251B0 8015EDA8 541D6324 */  addiu      $v1, $v1, %lo(item)
    /* 251B4 8015EDAC C0101E00 */  sll        $v0, $fp, 3
    /* 251B8 8015EDB0 23105E00 */  subu       $v0, $v0, $fp
    /* 251BC 8015EDB4 80100200 */  sll        $v0, $v0, 2
    /* 251C0 8015EDB8 23105E00 */  subu       $v0, $v0, $fp
    /* 251C4 8015EDBC 80100200 */  sll        $v0, $v0, 2
    /* 251C8 8015EDC0 21304300 */  addu       $a2, $v0, $v1
    /* 251CC 8015EDC4 6000C824 */  addiu      $t0, $a2, 0x60
  .L8015EDC8:
    /* 251D0 8015EDC8 0000C28C */  lw         $v0, 0x0($a2)
    /* 251D4 8015EDCC 0400C38C */  lw         $v1, 0x4($a2)
    /* 251D8 8015EDD0 0800C48C */  lw         $a0, 0x8($a2)
    /* 251DC 8015EDD4 0C00C58C */  lw         $a1, 0xC($a2)
    /* 251E0 8015EDD8 0000E2AC */  sw         $v0, 0x0($a3)
    /* 251E4 8015EDDC 0400E3AC */  sw         $v1, 0x4($a3)
    /* 251E8 8015EDE0 0800E4AC */  sw         $a0, 0x8($a3)
    /* 251EC 8015EDE4 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 251F0 8015EDE8 1000C624 */  addiu      $a2, $a2, 0x10
    /* 251F4 8015EDEC F6FFC814 */  bne        $a2, $t0, .L8015EDC8
    /* 251F8 8015EDF0 1000E724 */   addiu     $a3, $a3, 0x10
    /* 251FC 8015EDF4 0000C28C */  lw         $v0, 0x0($a2)
    /* 25200 8015EDF8 0400C38C */  lw         $v1, 0x4($a2)
    /* 25204 8015EDFC 0800C48C */  lw         $a0, 0x8($a2)
    /* 25208 8015EE00 0000E2AC */  sw         $v0, 0x0($a3)
    /* 2520C 8015EE04 0400E3AC */  sw         $v1, 0x4($a3)
    /* 25210 8015EE08 0800E4AC */  sw         $a0, 0x8($a3)
    /* 25214 8015EE0C 2120C003 */  addu       $a0, $fp, $zero
    /* 25218 8015EE10 8015010C */  jal        RespawnItem__FiUc
    /* 2521C 8015EE14 01000524 */   addiu     $a1, $zero, 0x1
    /* 25220 8015EE18 01000424 */  addiu      $a0, $zero, 0x1
    /* 25224 8015EE1C C0101E00 */  sll        $v0, $fp, 3
    /* 25228 8015EE20 23105E00 */  subu       $v0, $v0, $fp
    /* 2522C 8015EE24 80100200 */  sll        $v0, $v0, 2
    /* 25230 8015EE28 23105E00 */  subu       $v0, $v0, $fp
    /* 25234 8015EE2C 80100200 */  sll        $v0, $v0, 2
    /* 25238 8015EE30 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 2523C 8015EE34 21082200 */  addu       $at, $at, $v0
    /* 25240 8015EE38 A61D2690 */  lbu        $a2, %lo(item + 0x52)($at)
    /* 25244 8015EE3C 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 25248 8015EE40 21082200 */  addu       $at, $at, $v0
    /* 2524C 8015EE44 A71D2790 */  lbu        $a3, %lo(item + 0x53)($at)
    /* 25250 8015EE48 F63E010C */  jal        NetSendCmdPItem__FUcUcUcUc
    /* 25254 8015EE4C 0B000524 */   addiu     $a1, $zero, 0xB
    /* 25258 8015EE50 40101300 */  sll        $v0, $s3, 1
    /* 2525C 8015EE54 21105300 */  addu       $v0, $v0, $s3
    /* 25260 8015EE58 80100200 */  sll        $v0, $v0, 2
    /* 25264 8015EE5C 21105300 */  addu       $v0, $v0, $s3
    /* 25268 8015EE60 00110200 */  sll        $v0, $v0, 4
    /* 2526C 8015EE64 23105300 */  subu       $v0, $v0, $s3
    /* 25270 8015EE68 80100200 */  sll        $v0, $v0, 2
    /* 25274 8015EE6C 21105300 */  addu       $v0, $v0, $s3
    /* 25278 8015EE70 C0100200 */  sll        $v0, $v0, 3
    /* 2527C 8015EE74 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 25280 8015EE78 0E80013C */  lui        $at, %hi(plr + 0x193C)
    /* 25284 8015EE7C 21082200 */  addu       $at, $at, $v0
    /* 25288 8015EE80 74BE23A4 */  sh         $v1, %lo(plr + 0x193C)($at)
  .L8015EE84:
    /* 2528C 8015EE84 4400BF8F */  lw         $ra, 0x44($sp)
    /* 25290 8015EE88 4000BE8F */  lw         $fp, 0x40($sp)
    /* 25294 8015EE8C 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 25298 8015EE90 3800B68F */  lw         $s6, 0x38($sp)
    /* 2529C 8015EE94 3400B58F */  lw         $s5, 0x34($sp)
    /* 252A0 8015EE98 3000B48F */  lw         $s4, 0x30($sp)
    /* 252A4 8015EE9C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 252A8 8015EEA0 2800B28F */  lw         $s2, 0x28($sp)
    /* 252AC 8015EEA4 2400B18F */  lw         $s1, 0x24($sp)
    /* 252B0 8015EEA8 2000B08F */  lw         $s0, 0x20($sp)
    /* 252B4 8015EEAC 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 252B8 8015EEB0 0800E003 */  jr         $ra
    /* 252BC 8015EEB4 00000000 */   nop
endlabel AutoGetItem__Fii
