.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnHealer__Fi, 0x5A0

glabel SpawnHealer__Fi
    /* 3AE5C 8004AE5C 60FFBD27 */  addiu      $sp, $sp, -0xA0
    /* 3AE60 8004AE60 8C00B3AF */  sw         $s3, 0x8C($sp)
    /* 3AE64 8004AE64 21988000 */  addu       $s3, $a0, $zero
    /* 3AE68 8004AE68 1000A727 */  addiu      $a3, $sp, 0x10
    /* 3AE6C 8004AE6C 0D80063C */  lui        $a2, %hi(item)
    /* 3AE70 8004AE70 541DC624 */  addiu      $a2, $a2, %lo(item)
    /* 3AE74 8004AE74 6000C824 */  addiu      $t0, $a2, 0x60
    /* 3AE78 8004AE78 9C00BFAF */  sw         $ra, 0x9C($sp)
    /* 3AE7C 8004AE7C 9800B6AF */  sw         $s6, 0x98($sp)
    /* 3AE80 8004AE80 9400B5AF */  sw         $s5, 0x94($sp)
    /* 3AE84 8004AE84 9000B4AF */  sw         $s4, 0x90($sp)
    /* 3AE88 8004AE88 8800B2AF */  sw         $s2, 0x88($sp)
    /* 3AE8C 8004AE8C 8400B1AF */  sw         $s1, 0x84($sp)
    /* 3AE90 8004AE90 8000B0AF */  sw         $s0, 0x80($sp)
  .L8004AE94:
    /* 3AE94 8004AE94 0000C28C */  lw         $v0, 0x0($a2)
    /* 3AE98 8004AE98 0400C38C */  lw         $v1, 0x4($a2)
    /* 3AE9C 8004AE9C 0800C48C */  lw         $a0, 0x8($a2)
    /* 3AEA0 8004AEA0 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3AEA4 8004AEA4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3AEA8 8004AEA8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3AEAC 8004AEAC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3AEB0 8004AEB0 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3AEB4 8004AEB4 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3AEB8 8004AEB8 F6FFC814 */  bne        $a2, $t0, .L8004AE94
    /* 3AEBC 8004AEBC 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3AEC0 8004AEC0 0000C28C */  lw         $v0, 0x0($a2)
    /* 3AEC4 8004AEC4 0400C38C */  lw         $v1, 0x4($a2)
    /* 3AEC8 8004AEC8 0800C48C */  lw         $a0, 0x8($a2)
    /* 3AECC 8004AECC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3AED0 8004AED0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3AED4 8004AED4 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3AED8 8004AED8 21200000 */  addu       $a0, $zero, $zero
    /* 3AEDC 8004AEDC 18000524 */  addiu      $a1, $zero, 0x18
    /* 3AEE0 8004AEE0 A704010C */  jal        GetItemAttrs__Fiii
    /* 3AEE4 8004AEE4 01000624 */   addiu     $a2, $zero, 0x1
    /* 3AEE8 8004AEE8 0D80073C */  lui        $a3, %hi(item)
    /* 3AEEC 8004AEEC 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3AEF0 8004AEF0 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AEF4 8004AEF4 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AEF8 8004AEF8 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3AEFC 8004AEFC 00110300 */  sll        $v0, $v1, 4
    /* 3AF00 8004AF00 21104300 */  addu       $v0, $v0, $v1
    /* 3AF04 8004AF04 C0100200 */  sll        $v0, $v0, 3
    /* 3AF08 8004AF08 23104300 */  subu       $v0, $v0, $v1
    /* 3AF0C 8004AF0C 00110200 */  sll        $v0, $v0, 4
    /* 3AF10 8004AF10 0E80033C */  lui        $v1, %hi(_healitem)
    /* 3AF14 8004AF14 D00B6324 */  addiu      $v1, $v1, %lo(_healitem)
    /* 3AF18 8004AF18 21304300 */  addu       $a2, $v0, $v1
  .L8004AF1C:
    /* 3AF1C 8004AF1C 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AF20 8004AF20 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AF24 8004AF24 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AF28 8004AF28 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3AF2C 8004AF2C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AF30 8004AF30 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AF34 8004AF34 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AF38 8004AF38 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3AF3C 8004AF3C 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3AF40 8004AF40 F6FFE814 */  bne        $a3, $t0, .L8004AF1C
    /* 3AF44 8004AF44 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3AF48 8004AF48 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AF4C 8004AF4C 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AF50 8004AF50 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AF54 8004AF54 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AF58 8004AF58 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AF5C 8004AF5C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AF60 8004AF60 21200000 */  addu       $a0, $zero, $zero
    /* 3AF64 8004AF64 1D000524 */  addiu      $a1, $zero, 0x1D
    /* 3AF68 8004AF68 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AF6C 8004AF6C B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AF70 8004AF70 00000000 */  nop
    /* 3AF74 8004AF74 00110300 */  sll        $v0, $v1, 4
    /* 3AF78 8004AF78 21104300 */  addu       $v0, $v0, $v1
    /* 3AF7C 8004AF7C C0100200 */  sll        $v0, $v0, 3
    /* 3AF80 8004AF80 23104300 */  subu       $v0, $v0, $v1
    /* 3AF84 8004AF84 00110200 */  sll        $v0, $v0, 4
    /* 3AF88 8004AF88 01000324 */  addiu      $v1, $zero, 0x1
    /* 3AF8C 8004AF8C 0E80013C */  lui        $at, %hi(_healitem + 0x24)
    /* 3AF90 8004AF90 21082200 */  addu       $at, $at, $v0
    /* 3AF94 8004AF94 F40B33A4 */  sh         $s3, %lo(_healitem + 0x24)($at)
    /* 3AF98 8004AF98 0E80013C */  lui        $at, %hi(_healitem + 0x66)
    /* 3AF9C 8004AF9C 21082200 */  addu       $at, $at, $v0
    /* 3AFA0 8004AFA0 360C23A0 */  sb         $v1, %lo(_healitem + 0x66)($at)
    /* 3AFA4 8004AFA4 A704010C */  jal        GetItemAttrs__Fiii
    /* 3AFA8 8004AFA8 01000624 */   addiu     $a2, $zero, 0x1
    /* 3AFAC 8004AFAC 0D80073C */  lui        $a3, %hi(item)
    /* 3AFB0 8004AFB0 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3AFB4 8004AFB4 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AFB8 8004AFB8 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AFBC 8004AFBC 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3AFC0 8004AFC0 00110300 */  sll        $v0, $v1, 4
    /* 3AFC4 8004AFC4 21104300 */  addu       $v0, $v0, $v1
    /* 3AFC8 8004AFC8 C0100200 */  sll        $v0, $v0, 3
    /* 3AFCC 8004AFCC 23104300 */  subu       $v0, $v0, $v1
    /* 3AFD0 8004AFD0 00110200 */  sll        $v0, $v0, 4
    /* 3AFD4 8004AFD4 0E80033C */  lui        $v1, %hi(_healitem + 0x6C)
    /* 3AFD8 8004AFD8 3C0C6324 */  addiu      $v1, $v1, %lo(_healitem + 0x6C)
    /* 3AFDC 8004AFDC 21304300 */  addu       $a2, $v0, $v1
  .L8004AFE0:
    /* 3AFE0 8004AFE0 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AFE4 8004AFE4 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AFE8 8004AFE8 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AFEC 8004AFEC 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3AFF0 8004AFF0 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AFF4 8004AFF4 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AFF8 8004AFF8 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AFFC 8004AFFC 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3B000 8004B000 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3B004 8004B004 F6FFE814 */  bne        $a3, $t0, .L8004AFE0
    /* 3B008 8004B008 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3B00C 8004B00C 0000E28C */  lw         $v0, 0x0($a3)
    /* 3B010 8004B010 0400E38C */  lw         $v1, 0x4($a3)
    /* 3B014 8004B014 0800E48C */  lw         $a0, 0x8($a3)
    /* 3B018 8004B018 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3B01C 8004B01C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3B020 8004B020 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3B024 8004B024 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B028 8004B028 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B02C 8004B02C 00000000 */  nop
    /* 3B030 8004B030 00110300 */  sll        $v0, $v1, 4
    /* 3B034 8004B034 21104300 */  addu       $v0, $v0, $v1
    /* 3B038 8004B038 C0100200 */  sll        $v0, $v0, 3
    /* 3B03C 8004B03C 23104300 */  subu       $v0, $v0, $v1
    /* 3B040 8004B040 00110200 */  sll        $v0, $v0, 4
    /* 3B044 8004B044 01000324 */  addiu      $v1, $zero, 0x1
    /* 3B048 8004B048 0E80013C */  lui        $at, %hi(_healitem + 0xD2)
    /* 3B04C 8004B04C 21082200 */  addu       $at, $at, $v0
    /* 3B050 8004B050 A20C23A0 */  sb         $v1, %lo(_healitem + 0xD2)($at)
    /* 3B054 8004B054 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3B058 8004B058 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3B05C 8004B05C 0E80013C */  lui        $at, %hi(_healitem + 0x90)
    /* 3B060 8004B060 21082200 */  addu       $at, $at, $v0
    /* 3B064 8004B064 600C33A4 */  sh         $s3, %lo(_healitem + 0x90)($at)
    /* 3B068 8004B068 33006010 */  beqz       $v1, .L8004B138
    /* 3B06C 8004B06C 21200000 */   addu      $a0, $zero, $zero
    /* 3B070 8004B070 22000524 */  addiu      $a1, $zero, 0x22
    /* 3B074 8004B074 A704010C */  jal        GetItemAttrs__Fiii
    /* 3B078 8004B078 01000624 */   addiu     $a2, $zero, 0x1
    /* 3B07C 8004B07C 0D80073C */  lui        $a3, %hi(item)
    /* 3B080 8004B080 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3B084 8004B084 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3B088 8004B088 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3B08C 8004B08C 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3B090 8004B090 00190200 */  sll        $v1, $v0, 4
    /* 3B094 8004B094 21186200 */  addu       $v1, $v1, $v0
    /* 3B098 8004B098 C0180300 */  sll        $v1, $v1, 3
    /* 3B09C 8004B09C 23186200 */  subu       $v1, $v1, $v0
    /* 3B0A0 8004B0A0 00190300 */  sll        $v1, $v1, 4
    /* 3B0A4 8004B0A4 0E80023C */  lui        $v0, %hi(_healitem + 0xD8)
    /* 3B0A8 8004B0A8 A80C4224 */  addiu      $v0, $v0, %lo(_healitem + 0xD8)
    /* 3B0AC 8004B0AC 21306200 */  addu       $a2, $v1, $v0
  .L8004B0B0:
    /* 3B0B0 8004B0B0 0000E28C */  lw         $v0, 0x0($a3)
    /* 3B0B4 8004B0B4 0400E38C */  lw         $v1, 0x4($a3)
    /* 3B0B8 8004B0B8 0800E48C */  lw         $a0, 0x8($a3)
    /* 3B0BC 8004B0BC 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3B0C0 8004B0C0 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3B0C4 8004B0C4 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3B0C8 8004B0C8 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3B0CC 8004B0CC 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3B0D0 8004B0D0 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3B0D4 8004B0D4 F6FFE814 */  bne        $a3, $t0, .L8004B0B0
    /* 3B0D8 8004B0D8 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3B0DC 8004B0DC 0000E28C */  lw         $v0, 0x0($a3)
    /* 3B0E0 8004B0E0 0400E38C */  lw         $v1, 0x4($a3)
    /* 3B0E4 8004B0E4 0800E48C */  lw         $a0, 0x8($a3)
    /* 3B0E8 8004B0E8 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3B0EC 8004B0EC 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3B0F0 8004B0F0 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3B0F4 8004B0F4 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B0F8 8004B0F8 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B0FC 8004B0FC 00000000 */  nop
    /* 3B100 8004B100 00110300 */  sll        $v0, $v1, 4
    /* 3B104 8004B104 21104300 */  addu       $v0, $v0, $v1
    /* 3B108 8004B108 C0100200 */  sll        $v0, $v0, 3
    /* 3B10C 8004B10C 23104300 */  subu       $v0, $v0, $v1
    /* 3B110 8004B110 00110200 */  sll        $v0, $v0, 4
    /* 3B114 8004B114 01000324 */  addiu      $v1, $zero, 0x1
    /* 3B118 8004B118 0E80013C */  lui        $at, %hi(_healitem + 0xFC)
    /* 3B11C 8004B11C 21082200 */  addu       $at, $at, $v0
    /* 3B120 8004B120 CC0C33A4 */  sh         $s3, %lo(_healitem + 0xFC)($at)
    /* 3B124 8004B124 0E80013C */  lui        $at, %hi(_healitem + 0x13E)
    /* 3B128 8004B128 21082200 */  addu       $at, $at, $v0
    /* 3B12C 8004B12C 0E0D23A0 */  sb         $v1, %lo(_healitem + 0x13E)($at)
    /* 3B130 8004B130 4F2C0108 */  j          .L8004B13C
    /* 3B134 8004B134 03001024 */   addiu     $s0, $zero, 0x3
  .L8004B138:
    /* 3B138 8004B138 02001024 */  addiu      $s0, $zero, 0x2
  .L8004B13C:
    /* 3B13C 8004B13C C9F6000C */  jal        ENG_random__Fl
    /* 3B140 8004B140 08000424 */   addiu     $a0, $zero, 0x8
    /* 3B144 8004B144 21200002 */  addu       $a0, $s0, $zero
    /* 3B148 8004B148 0A005124 */  addiu      $s1, $v0, 0xA
    /* 3B14C 8004B14C 2A109100 */  slt        $v0, $a0, $s1
    /* 3B150 8004B150 6F004010 */  beqz       $v0, .L8004B310
    /* 3B154 8004B154 C0100400 */   sll       $v0, $a0, 3
    /* 3B158 8004B158 0D80143C */  lui        $s4, %hi(item + 0x10)
    /* 3B15C 8004B15C 641D9426 */  addiu      $s4, $s4, %lo(item + 0x10)
    /* 3B160 8004B160 50009626 */  addiu      $s6, $s4, 0x50
    /* 3B164 8004B164 0E80153C */  lui        $s5, %hi(_healitem)
    /* 3B168 8004B168 D00BB526 */  addiu      $s5, $s5, %lo(_healitem)
    /* 3B16C 8004B16C 23104400 */  subu       $v0, $v0, $a0
    /* 3B170 8004B170 80100200 */  sll        $v0, $v0, 2
    /* 3B174 8004B174 23104400 */  subu       $v0, $v0, $a0
    /* 3B178 8004B178 80100200 */  sll        $v0, $v0, 2
    /* 3B17C 8004B17C 21905500 */  addu       $s2, $v0, $s5
    /* 3B180 8004B180 21804000 */  addu       $s0, $v0, $zero
  .L8004B184:
    /* 3B184 8004B184 B7F6000C */  jal        GetRndSeed__Fv
    /* 3B188 8004B188 00000000 */   nop
    /* 3B18C 8004B18C 21204000 */  addu       $a0, $v0, $zero
    /* 3B190 8004B190 B3F6000C */  jal        SetRndSeed__Fl
    /* 3B194 8004B194 000084AE */   sw        $a0, 0x0($s4)
    /* 3B198 8004B198 C627010C */  jal        RndHealerItem__Fi
    /* 3B19C 8004B19C 21206002 */   addu      $a0, $s3, $zero
    /* 3B1A0 8004B1A0 21200000 */  addu       $a0, $zero, $zero
    /* 3B1A4 8004B1A4 FFFF4524 */  addiu      $a1, $v0, -0x1
    /* 3B1A8 8004B1A8 A704010C */  jal        GetItemAttrs__Fiii
    /* 3B1AC 8004B1AC 21306002 */   addu      $a2, $s3, $zero
    /* 3B1B0 8004B1B0 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B1B4 8004B1B4 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B1B8 8004B1B8 F0FF8726 */  addiu      $a3, $s4, -0x10
    /* 3B1BC 8004B1BC 00110300 */  sll        $v0, $v1, 4
    /* 3B1C0 8004B1C0 21104300 */  addu       $v0, $v0, $v1
    /* 3B1C4 8004B1C4 C0100200 */  sll        $v0, $v0, 3
    /* 3B1C8 8004B1C8 23104300 */  subu       $v0, $v0, $v1
    /* 3B1CC 8004B1CC 00110200 */  sll        $v0, $v0, 4
    /* 3B1D0 8004B1D0 21105500 */  addu       $v0, $v0, $s5
    /* 3B1D4 8004B1D4 21300202 */  addu       $a2, $s0, $v0
  .L8004B1D8:
    /* 3B1D8 8004B1D8 0000E28C */  lw         $v0, 0x0($a3)
    /* 3B1DC 8004B1DC 0400E38C */  lw         $v1, 0x4($a3)
    /* 3B1E0 8004B1E0 0800E48C */  lw         $a0, 0x8($a3)
    /* 3B1E4 8004B1E4 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3B1E8 8004B1E8 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3B1EC 8004B1EC 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3B1F0 8004B1F0 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3B1F4 8004B1F4 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3B1F8 8004B1F8 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3B1FC 8004B1FC F6FFF614 */  bne        $a3, $s6, .L8004B1D8
    /* 3B200 8004B200 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3B204 8004B204 0000E28C */  lw         $v0, 0x0($a3)
    /* 3B208 8004B208 0400E38C */  lw         $v1, 0x4($a3)
    /* 3B20C 8004B20C 0800E48C */  lw         $a0, 0x8($a3)
    /* 3B210 8004B210 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3B214 8004B214 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3B218 8004B218 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3B21C 8004B21C 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B220 8004B220 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B224 8004B224 00000000 */  nop
    /* 3B228 8004B228 00110300 */  sll        $v0, $v1, 4
    /* 3B22C 8004B22C 21104300 */  addu       $v0, $v0, $v1
    /* 3B230 8004B230 C0100200 */  sll        $v0, $v0, 3
    /* 3B234 8004B234 23104300 */  subu       $v0, $v0, $v1
    /* 3B238 8004B238 00110200 */  sll        $v0, $v0, 4
    /* 3B23C 8004B23C 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3B240 8004B240 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3B244 8004B244 21100202 */  addu       $v0, $s0, $v0
    /* 3B248 8004B248 0E80013C */  lui        $at, %hi(_healitem + 0x65)
    /* 3B24C 8004B24C 21082200 */  addu       $at, $at, $v0
    /* 3B250 8004B250 350C23A0 */  sb         $v1, %lo(_healitem + 0x65)($at)
    /* 3B254 8004B254 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3B258 8004B258 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3B25C 8004B25C 00406336 */  ori        $v1, $s3, 0x4000
    /* 3B260 8004B260 0E80013C */  lui        $at, %hi(_healitem + 0x24)
    /* 3B264 8004B264 21082200 */  addu       $at, $at, $v0
    /* 3B268 8004B268 F40B23A4 */  sh         $v1, %lo(_healitem + 0x24)($at)
    /* 3B26C 8004B26C 01000324 */  addiu      $v1, $zero, 0x1
    /* 3B270 8004B270 00110400 */  sll        $v0, $a0, 4
    /* 3B274 8004B274 21104400 */  addu       $v0, $v0, $a0
    /* 3B278 8004B278 C0100200 */  sll        $v0, $v0, 3
    /* 3B27C 8004B27C 23104400 */  subu       $v0, $v0, $a0
    /* 3B280 8004B280 00110200 */  sll        $v0, $v0, 4
    /* 3B284 8004B284 21100202 */  addu       $v0, $s0, $v0
    /* 3B288 8004B288 0E80013C */  lui        $at, %hi(_healitem + 0x69)
    /* 3B28C 8004B28C 21082200 */  addu       $at, $at, $v0
    /* 3B290 8004B290 390C23A0 */  sb         $v1, %lo(_healitem + 0x69)($at)
    /* 3B294 8004B294 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3B298 8004B298 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3B29C 8004B29C 00000000 */  nop
    /* 3B2A0 8004B2A0 00210200 */  sll        $a0, $v0, 4
    /* 3B2A4 8004B2A4 21208200 */  addu       $a0, $a0, $v0
    /* 3B2A8 8004B2A8 C0200400 */  sll        $a0, $a0, 3
    /* 3B2AC 8004B2AC 23208200 */  subu       $a0, $a0, $v0
    /* 3B2B0 8004B2B0 00210400 */  sll        $a0, $a0, 4
    /* 3B2B4 8004B2B4 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 3B2B8 8004B2B8 21209200 */   addu      $a0, $a0, $s2
    /* 3B2BC 8004B2BC 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3B2C0 8004B2C0 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3B2C4 8004B2C4 00000000 */  nop
    /* 3B2C8 8004B2C8 00190400 */  sll        $v1, $a0, 4
    /* 3B2CC 8004B2CC 21186400 */  addu       $v1, $v1, $a0
    /* 3B2D0 8004B2D0 C0180300 */  sll        $v1, $v1, 3
    /* 3B2D4 8004B2D4 23186400 */  subu       $v1, $v1, $a0
    /* 3B2D8 8004B2D8 00190300 */  sll        $v1, $v1, 4
    /* 3B2DC 8004B2DC 21180302 */  addu       $v1, $s0, $v1
    /* 3B2E0 8004B2E0 6C001026 */  addiu      $s0, $s0, 0x6C
    /* 3B2E4 8004B2E4 0E80013C */  lui        $at, %hi(_healitem + 0x66)
    /* 3B2E8 8004B2E8 21082300 */  addu       $at, $at, $v1
    /* 3B2EC 8004B2EC 360C22A0 */  sb         $v0, %lo(_healitem + 0x66)($at)
    /* 3B2F0 8004B2F0 C0101100 */  sll        $v0, $s1, 3
    /* 3B2F4 8004B2F4 23105100 */  subu       $v0, $v0, $s1
    /* 3B2F8 8004B2F8 80100200 */  sll        $v0, $v0, 2
    /* 3B2FC 8004B2FC 23105100 */  subu       $v0, $v0, $s1
    /* 3B300 8004B300 80100200 */  sll        $v0, $v0, 2
    /* 3B304 8004B304 2A100202 */  slt        $v0, $s0, $v0
    /* 3B308 8004B308 9EFF4014 */  bnez       $v0, .L8004B184
    /* 3B30C 8004B30C 6C005226 */   addiu     $s2, $s2, 0x6C
  .L8004B310:
    /* 3B310 8004B310 21202002 */  addu       $a0, $s1, $zero
    /* 3B314 8004B314 14008228 */  slti       $v0, $a0, 0x14
    /* 3B318 8004B318 16004010 */  beqz       $v0, .L8004B374
    /* 3B31C 8004B31C FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 3B320 8004B320 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3B324 8004B324 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3B328 8004B328 00000000 */  nop
    /* 3B32C 8004B32C 00190200 */  sll        $v1, $v0, 4
    /* 3B330 8004B330 21186200 */  addu       $v1, $v1, $v0
    /* 3B334 8004B334 C0180300 */  sll        $v1, $v1, 3
    /* 3B338 8004B338 23186200 */  subu       $v1, $v1, $v0
    /* 3B33C 8004B33C 00190300 */  sll        $v1, $v1, 4
    /* 3B340 8004B340 C0100400 */  sll        $v0, $a0, 3
    /* 3B344 8004B344 23104400 */  subu       $v0, $v0, $a0
    /* 3B348 8004B348 80100200 */  sll        $v0, $v0, 2
    /* 3B34C 8004B34C 23104400 */  subu       $v0, $v0, $a0
    /* 3B350 8004B350 80100200 */  sll        $v0, $v0, 2
    /* 3B354 8004B354 21184300 */  addu       $v1, $v0, $v1
  .L8004B358:
    /* 3B358 8004B358 0E80013C */  lui        $at, %hi(_healitem + 0x2C)
    /* 3B35C 8004B35C 21082300 */  addu       $at, $at, $v1
    /* 3B360 8004B360 FC0B25A4 */  sh         $a1, %lo(_healitem + 0x2C)($at)
    /* 3B364 8004B364 01008424 */  addiu      $a0, $a0, 0x1
    /* 3B368 8004B368 14008228 */  slti       $v0, $a0, 0x14
    /* 3B36C 8004B36C FAFF4014 */  bnez       $v0, .L8004B358
    /* 3B370 8004B370 6C006324 */   addiu     $v1, $v1, 0x6C
  .L8004B374:
    /* 3B374 8004B374 212E010C */  jal        SortHealer__Fv
    /* 3B378 8004B378 00000000 */   nop
    /* 3B37C 8004B37C 0D80073C */  lui        $a3, %hi(item)
    /* 3B380 8004B380 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3B384 8004B384 1000A627 */  addiu      $a2, $sp, 0x10
    /* 3B388 8004B388 7000A827 */  addiu      $t0, $sp, 0x70
  .L8004B38C:
    /* 3B38C 8004B38C 0000C28C */  lw         $v0, 0x0($a2)
    /* 3B390 8004B390 0400C38C */  lw         $v1, 0x4($a2)
    /* 3B394 8004B394 0800C48C */  lw         $a0, 0x8($a2)
    /* 3B398 8004B398 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3B39C 8004B39C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3B3A0 8004B3A0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3B3A4 8004B3A4 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3B3A8 8004B3A8 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3B3AC 8004B3AC 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3B3B0 8004B3B0 F6FFC814 */  bne        $a2, $t0, .L8004B38C
    /* 3B3B4 8004B3B4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3B3B8 8004B3B8 0000C28C */  lw         $v0, 0x0($a2)
    /* 3B3BC 8004B3BC 0400C38C */  lw         $v1, 0x4($a2)
    /* 3B3C0 8004B3C0 0800C48C */  lw         $a0, 0x8($a2)
    /* 3B3C4 8004B3C4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3B3C8 8004B3C8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3B3CC 8004B3CC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3B3D0 8004B3D0 9C00BF8F */  lw         $ra, 0x9C($sp)
    /* 3B3D4 8004B3D4 9800B68F */  lw         $s6, 0x98($sp)
    /* 3B3D8 8004B3D8 9400B58F */  lw         $s5, 0x94($sp)
    /* 3B3DC 8004B3DC 9000B48F */  lw         $s4, 0x90($sp)
    /* 3B3E0 8004B3E0 8C00B38F */  lw         $s3, 0x8C($sp)
    /* 3B3E4 8004B3E4 8800B28F */  lw         $s2, 0x88($sp)
    /* 3B3E8 8004B3E8 8400B18F */  lw         $s1, 0x84($sp)
    /* 3B3EC 8004B3EC 8000B08F */  lw         $s0, 0x80($sp)
    /* 3B3F0 8004B3F0 A000BD27 */  addiu      $sp, $sp, 0xA0
    /* 3B3F4 8004B3F4 0800E003 */  jr         $ra
    /* 3B3F8 8004B3F8 00000000 */   nop
endlabel SpawnHealer__Fi
