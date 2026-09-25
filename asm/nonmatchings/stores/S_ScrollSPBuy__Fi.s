.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_ScrollSPBuy__Fi, 0x260

glabel S_ScrollSPBuy__Fi
    /* 5AFB0 8006AFB0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 5AFB4 8006AFB4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5AFB8 8006AFB8 21A08000 */  addu       $s4, $a0, $zero
    /* 5AFBC 8006AFBC 05000424 */  addiu      $a0, $zero, 0x5
    /* 5AFC0 8006AFC0 15000524 */  addiu      $a1, $zero, 0x15
    /* 5AFC4 8006AFC4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 5AFC8 8006AFC8 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 5AFCC 8006AFCC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5AFD0 8006AFD0 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5AFD4 8006AFD4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5AFD8 8006AFD8 36A7010C */  jal        ClearSText__Fii
    /* 5AFDC 8006AFDC 1800B0AF */   sw        $s0, 0x18($sp)
    /* 5AFE0 8006AFE0 05000224 */  addiu      $v0, $zero, 0x5
    /* 5AFE4 8006AFE4 21208002 */  addu       $a0, $s4, $zero
    /* 5AFE8 8006AFE8 1C2182AF */  sw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 5AFEC 8006AFEC 12008010 */  beqz       $a0, .L8006B038
    /* 5AFF0 8006AFF0 21A00000 */   addu      $s4, $zero, $zero
    /* 5AFF4 8006AFF4 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5AFF8 8006AFF8 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 5AFFC 8006AFFC 80100300 */  sll        $v0, $v1, 2
    /* 5B000 8006B000 21104300 */  addu       $v0, $v0, $v1
    /* 5B004 8006B004 00110200 */  sll        $v0, $v0, 4
    /* 5B008 8006B008 21104300 */  addu       $v0, $v0, $v1
    /* 5B00C 8006B00C C0180200 */  sll        $v1, $v0, 3
  .L8006B010:
    /* 5B010 8006B010 0E80013C */  lui        $at, %hi(_premiumitem + 0x2C)
    /* 5B014 8006B014 21082300 */  addu       $at, $at, $v1
    /* 5B018 8006B018 34F52284 */  lh         $v0, %lo(_premiumitem + 0x2C)($at)
    /* 5B01C 8006B01C 00000000 */  nop
    /* 5B020 8006B020 02004510 */  beq        $v0, $a1, .L8006B02C
    /* 5B024 8006B024 00000000 */   nop
    /* 5B028 8006B028 FFFF8424 */  addiu      $a0, $a0, -0x1
  .L8006B02C:
    /* 5B02C 8006B02C 6C006324 */  addiu      $v1, $v1, 0x6C
    /* 5B030 8006B030 F7FF8014 */  bnez       $a0, .L8006B010
    /* 5B034 8006B034 01009426 */   addiu     $s4, $s4, 0x1
  .L8006B038:
    /* 5B038 8006B038 05001324 */  addiu      $s3, $zero, 0x5
    /* 5B03C 8006B03C C0101400 */  sll        $v0, $s4, 3
    /* 5B040 8006B040 23105400 */  subu       $v0, $v0, $s4
    /* 5B044 8006B044 80100200 */  sll        $v0, $v0, 2
    /* 5B048 8006B048 23105400 */  subu       $v0, $v0, $s4
    /* 5B04C 8006B04C 80A80200 */  sll        $s5, $v0, 2
  .L8006B050:
    /* 5B050 8006B050 0F00622A */  slti       $v0, $s3, 0xF
    /* 5B054 8006B054 52004010 */  beqz       $v0, .L8006B1A0
    /* 5B058 8006B058 0600822A */   slti      $v0, $s4, 0x6
    /* 5B05C 8006B05C 50004010 */  beqz       $v0, .L8006B1A0
    /* 5B060 8006B060 00000000 */   nop
    /* 5B064 8006B064 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5B068 8006B068 00000000 */  nop
    /* 5B06C 8006B06C 80100300 */  sll        $v0, $v1, 2
    /* 5B070 8006B070 21104300 */  addu       $v0, $v0, $v1
    /* 5B074 8006B074 00110200 */  sll        $v0, $v0, 4
    /* 5B078 8006B078 21104300 */  addu       $v0, $v0, $v1
    /* 5B07C 8006B07C C0200200 */  sll        $a0, $v0, 3
    /* 5B080 8006B080 2128A402 */  addu       $a1, $s5, $a0
    /* 5B084 8006B084 0E80013C */  lui        $at, %hi(_premiumitem + 0x2C)
    /* 5B088 8006B088 21082500 */  addu       $at, $at, $a1
    /* 5B08C 8006B08C 34F52384 */  lh         $v1, %lo(_premiumitem + 0x2C)($at)
    /* 5B090 8006B090 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5B094 8006B094 3D006210 */  beq        $v1, $v0, .L8006B18C
    /* 5B098 8006B098 00000000 */   nop
    /* 5B09C 8006B09C 0E80013C */  lui        $at, %hi(_premiumitem + 0x51)
    /* 5B0A0 8006B0A0 21082500 */  addu       $at, $at, $a1
    /* 5B0A4 8006B0A4 59F52280 */  lb         $v0, %lo(_premiumitem + 0x51)($at)
    /* 5B0A8 8006B0A8 0E80013C */  lui        $at, %hi(_premiumitem + 0x66)
    /* 5B0AC 8006B0AC 21082500 */  addu       $at, $at, $a1
    /* 5B0B0 8006B0B0 6EF52380 */  lb         $v1, %lo(_premiumitem + 0x66)($at)
    /* 5B0B4 8006B0B4 2B100200 */  sltu       $v0, $zero, $v0
    /* 5B0B8 8006B0B8 02006014 */  bnez       $v1, .L8006B0C4
    /* 5B0BC 8006B0BC 21904000 */   addu      $s2, $v0, $zero
    /* 5B0C0 8006B0C0 02001224 */  addiu      $s2, $zero, 0x2
  .L8006B0C4:
    /* 5B0C4 8006B0C4 0E80113C */  lui        $s1, %hi(_premiumitem)
    /* 5B0C8 8006B0C8 08F53126 */  addiu      $s1, $s1, %lo(_premiumitem)
    /* 5B0CC 8006B0CC 2188B102 */  addu       $s1, $s5, $s1
    /* 5B0D0 8006B0D0 21209100 */  addu       $a0, $a0, $s1
    /* 5B0D4 8006B0D4 0E80013C */  lui        $at, %hi(_premiumitem + 0x28)
    /* 5B0D8 8006B0D8 21082500 */  addu       $at, $at, $a1
    /* 5B0DC 8006B0DC 30F52594 */  lhu        $a1, %lo(_premiumitem + 0x28)($at)
    /* 5B0E0 8006B0E0 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5B0E4 8006B0E4 00010624 */   addiu     $a2, $zero, 0x100
    /* 5B0E8 8006B0E8 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5B0EC 8006B0EC 21286002 */  addu       $a1, $s3, $zero
    /* 5B0F0 8006B0F0 21300000 */  addu       $a2, $zero, $zero
    /* 5B0F4 8006B0F4 01000324 */  addiu      $v1, $zero, 0x1
    /* 5B0F8 8006B0F8 21804000 */  addu       $s0, $v0, $zero
    /* 5B0FC 8006B0FC 21380002 */  addu       $a3, $s0, $zero
    /* 5B100 8006B100 1000B2AF */  sw         $s2, 0x10($sp)
    /* 5B104 8006B104 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5B108 8006B108 1400A3AF */   sw        $v1, 0x14($sp)
    /* 5B10C 8006B10C 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5B110 8006B110 00000000 */  nop
    /* 5B114 8006B114 80100300 */  sll        $v0, $v1, 2
    /* 5B118 8006B118 21104300 */  addu       $v0, $v0, $v1
    /* 5B11C 8006B11C 00110200 */  sll        $v0, $v0, 4
    /* 5B120 8006B120 21104300 */  addu       $v0, $v0, $v1
    /* 5B124 8006B124 C0100200 */  sll        $v0, $v0, 3
    /* 5B128 8006B128 2110A202 */  addu       $v0, $s5, $v0
    /* 5B12C 8006B12C 0E80013C */  lui        $at, %hi(_premiumitem + 0x18)
    /* 5B130 8006B130 21082200 */  addu       $at, $at, $v0
    /* 5B134 8006B134 20F5258C */  lw         $a1, %lo(_premiumitem + 0x18)($at)
    /* 5B138 8006B138 70A7010C */  jal        AddSTextVal__Fii
    /* 5B13C 8006B13C 21206002 */   addu      $a0, $s3, $zero
    /* 5B140 8006B140 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5B144 8006B144 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5B148 8006B148 1280063C */  lui        $a2, %hi(D_8011C8BC)
    /* 5B14C 8006B14C BCC8C624 */  addiu      $a2, $a2, %lo(D_8011C8BC)
    /* 5B150 8006B150 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 5B154 8006B154 21280002 */   addu      $a1, $s0, $zero
    /* 5B158 8006B158 21286202 */  addu       $a1, $s3, $v0
    /* 5B15C 8006B15C 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5B160 8006B160 21304002 */  addu       $a2, $s2, $zero
    /* 5B164 8006B164 80200200 */  sll        $a0, $v0, 2
    /* 5B168 8006B168 21208200 */  addu       $a0, $a0, $v0
    /* 5B16C 8006B16C 00210400 */  sll        $a0, $a0, 4
    /* 5B170 8006B170 21208200 */  addu       $a0, $a0, $v0
    /* 5B174 8006B174 C0200400 */  sll        $a0, $a0, 3
    /* 5B178 8006B178 B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5B17C 8006B17C 21209100 */   addu      $a0, $a0, $s1
    /* 5B180 8006B180 202193AF */  sw         $s3, %gp_rel(D_8011C8A0)($gp)
    /* 5B184 8006B184 65AC0108 */  j          .L8006B194
    /* 5B188 8006B188 6C00B526 */   addiu     $s5, $s5, 0x6C
  .L8006B18C:
    /* 5B18C 8006B18C F8FF7326 */  addiu      $s3, $s3, -0x8
    /* 5B190 8006B190 6C00B526 */  addiu      $s5, $s5, 0x6C
  .L8006B194:
    /* 5B194 8006B194 01009426 */  addiu      $s4, $s4, 0x1
    /* 5B198 8006B198 14AC0108 */  j          .L8006B050
    /* 5B19C 8006B19C 08007326 */   addiu     $s3, $s3, 0x8
  .L8006B1A0:
    /* 5B1A0 8006B1A0 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 5B1A4 8006B1A4 00000000 */  nop
    /* 5B1A8 8006B1A8 C0100300 */  sll        $v0, $v1, 3
    /* 5B1AC 8006B1AC 21104300 */  addu       $v0, $v0, $v1
    /* 5B1B0 8006B1B0 80100200 */  sll        $v0, $v0, 2
    /* 5B1B4 8006B1B4 23104300 */  subu       $v0, $v0, $v1
    /* 5B1B8 8006B1B8 80100200 */  sll        $v0, $v0, 2
    /* 5B1BC 8006B1BC 1380013C */  lui        $at, %hi(D_8012EECD)
    /* 5B1C0 8006B1C0 21082200 */  addu       $at, $at, $v0
    /* 5B1C4 8006B1C4 CDEE2290 */  lbu        $v0, %lo(D_8012EECD)($at)
    /* 5B1C8 8006B1C8 00000000 */  nop
    /* 5B1CC 8006B1CC 06004014 */  bnez       $v0, .L8006B1E8
    /* 5B1D0 8006B1D0 16000224 */   addiu     $v0, $zero, 0x16
    /* 5B1D4 8006B1D4 04006210 */  beq        $v1, $v0, .L8006B1E8
    /* 5B1D8 8006B1D8 00000000 */   nop
    /* 5B1DC 8006B1DC 2021828F */  lw         $v0, %gp_rel(D_8011C8A0)($gp)
    /* 5B1E0 8006B1E0 00000000 */  nop
    /* 5B1E4 8006B1E4 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
  .L8006B1E8:
    /* 5B1E8 8006B1E8 3000BF8F */  lw         $ra, 0x30($sp)
    /* 5B1EC 8006B1EC 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 5B1F0 8006B1F0 2800B48F */  lw         $s4, 0x28($sp)
    /* 5B1F4 8006B1F4 2400B38F */  lw         $s3, 0x24($sp)
    /* 5B1F8 8006B1F8 2000B28F */  lw         $s2, 0x20($sp)
    /* 5B1FC 8006B1FC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5B200 8006B200 1800B08F */  lw         $s0, 0x18($sp)
    /* 5B204 8006B204 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 5B208 8006B208 0800E003 */  jr         $ra
    /* 5B20C 8006B20C 00000000 */   nop
endlabel S_ScrollSPBuy__Fi
