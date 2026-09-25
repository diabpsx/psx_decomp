.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcItemValue__Fi, 0xB8

glabel CalcItemValue__Fi
    /* 30AC4 80040AC4 C0100400 */  sll        $v0, $a0, 3
    /* 30AC8 80040AC8 23104400 */  subu       $v0, $v0, $a0
    /* 30ACC 80040ACC 80100200 */  sll        $v0, $v0, 2
    /* 30AD0 80040AD0 23104400 */  subu       $v0, $v0, $a0
    /* 30AD4 80040AD4 80280200 */  sll        $a1, $v0, 2
    /* 30AD8 80040AD8 0D80013C */  lui        $at, %hi(item + 0x4)
    /* 30ADC 80040ADC 21082500 */  addu       $at, $at, $a1
    /* 30AE0 80040AE0 581D238C */  lw         $v1, %lo(item + 0x4)($at)
    /* 30AE4 80040AE4 0D80013C */  lui        $at, %hi(item + 0xC)
    /* 30AE8 80040AE8 21082500 */  addu       $at, $at, $a1
    /* 30AEC 80040AEC 601D228C */  lw         $v0, %lo(item + 0xC)($at)
    /* 30AF0 80040AF0 00000000 */  nop
    /* 30AF4 80040AF4 21206200 */  addu       $a0, $v1, $v0
    /* 30AF8 80040AF8 07008018 */  blez       $a0, .L80040B18
    /* 30AFC 80040AFC 00000000 */   nop
    /* 30B00 80040B00 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 30B04 80040B04 21082500 */  addu       $at, $at, $a1
    /* 30B08 80040B08 681D228C */  lw         $v0, %lo(item + 0x14)($at)
    /* 30B0C 80040B0C 00000000 */  nop
    /* 30B10 80040B10 18008200 */  mult       $a0, $v0
    /* 30B14 80040B14 12200000 */  mflo       $a0
  .L80040B18:
    /* 30B18 80040B18 07008104 */  bgez       $a0, .L80040B38
    /* 30B1C 80040B1C 00000000 */   nop
    /* 30B20 80040B20 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 30B24 80040B24 21082500 */  addu       $at, $at, $a1
    /* 30B28 80040B28 681D228C */  lw         $v0, %lo(item + 0x14)($at)
    /* 30B2C 80040B2C 00000000 */  nop
    /* 30B30 80040B30 1A004400 */  div        $zero, $v0, $a0
    /* 30B34 80040B34 12200000 */  mflo       $a0
  .L80040B38:
    /* 30B38 80040B38 0D80013C */  lui        $at, %hi(item)
    /* 30B3C 80040B3C 21082500 */  addu       $at, $at, $a1
    /* 30B40 80040B40 541D228C */  lw         $v0, %lo(item)($at)
    /* 30B44 80040B44 0D80013C */  lui        $at, %hi(item + 0x8)
    /* 30B48 80040B48 21082500 */  addu       $at, $at, $a1
    /* 30B4C 80040B4C 5C1D238C */  lw         $v1, %lo(item + 0x8)($at)
    /* 30B50 80040B50 00000000 */  nop
    /* 30B54 80040B54 21104300 */  addu       $v0, $v0, $v1
    /* 30B58 80040B58 21208200 */  addu       $a0, $a0, $v0
    /* 30B5C 80040B5C 0200801C */  bgtz       $a0, .L80040B68
    /* 30B60 80040B60 00000000 */   nop
    /* 30B64 80040B64 01000424 */  addiu      $a0, $zero, 0x1
  .L80040B68:
    /* 30B68 80040B68 0D80013C */  lui        $at, %hi(item + 0x18)
    /* 30B6C 80040B6C 21082500 */  addu       $at, $at, $a1
    /* 30B70 80040B70 6C1D24AC */  sw         $a0, %lo(item + 0x18)($at)
    /* 30B74 80040B74 0800E003 */  jr         $ra
    /* 30B78 80040B78 00000000 */   nop
endlabel CalcItemValue__Fi
