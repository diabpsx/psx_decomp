.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreateWitchItem__Fiiii, 0x168

glabel RecreateWitchItem__Fiiii
    /* 3A0F0 8004A0F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3A0F4 8004A0F4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 3A0F8 8004A0F8 21808000 */  addu       $s0, $a0, $zero
    /* 3A0FC 8004A0FC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 3A100 8004A100 2190C000 */  addu       $s2, $a2, $zero
    /* 3A104 8004A104 2800B4AF */  sw         $s4, 0x28($sp)
    /* 3A108 8004A108 21A0E000 */  addu       $s4, $a3, $zero
    /* 3A10C 8004A10C 19000224 */  addiu      $v0, $zero, 0x19
    /* 3A110 8004A110 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 3A114 8004A114 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3A118 8004A118 0600A210 */  beq        $a1, $v0, .L8004A134
    /* 3A11C 8004A11C 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 3A120 8004A120 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 3A124 8004A124 0300A210 */  beq        $a1, $v0, .L8004A134
    /* 3A128 8004A128 1B000224 */   addiu     $v0, $zero, 0x1B
    /* 3A12C 8004A12C 0600A214 */  bne        $a1, $v0, .L8004A148
    /* 3A130 8004A130 00000000 */   nop
  .L8004A134:
    /* 3A134 8004A134 21200002 */  addu       $a0, $s0, $zero
    /* 3A138 8004A138 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A13C 8004A13C 21304002 */   addu      $a2, $s2, $zero
    /* 3A140 8004A140 79280108 */  j          .L8004A1E4
    /* 3A144 8004A144 C0101000 */   sll       $v0, $s0, 3
  .L8004A148:
    /* 3A148 8004A148 B3F6000C */  jal        SetRndSeed__Fl
    /* 3A14C 8004A14C 21208002 */   addu      $a0, $s4, $zero
    /* 3A150 8004A150 0126010C */  jal        RndWitchItem__Fi
    /* 3A154 8004A154 21204002 */   addu      $a0, $s2, $zero
    /* 3A158 8004A158 21200002 */  addu       $a0, $s0, $zero
    /* 3A15C 8004A15C FFFF5324 */  addiu      $s3, $v0, -0x1
    /* 3A160 8004A160 21286002 */  addu       $a1, $s3, $zero
    /* 3A164 8004A164 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A168 8004A168 21304002 */   addu      $a2, $s2, $zero
    /* 3A16C 8004A16C FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 3A170 8004A170 C9F6000C */  jal        ENG_random__Fl
    /* 3A174 8004A174 64000424 */   addiu     $a0, $zero, 0x64
    /* 3A178 8004A178 06004228 */  slti       $v0, $v0, 0x6
    /* 3A17C 8004A17C 02004010 */  beqz       $v0, .L8004A188
    /* 3A180 8004A180 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 3A184 8004A184 40881200 */  sll        $s1, $s2, 1
  .L8004A188:
    /* 3A188 8004A188 0F002416 */  bne        $s1, $a0, .L8004A1C8
    /* 3A18C 8004A18C 01000224 */   addiu     $v0, $zero, 0x1
    /* 3A190 8004A190 C0101000 */  sll        $v0, $s0, 3
    /* 3A194 8004A194 23105000 */  subu       $v0, $v0, $s0
    /* 3A198 8004A198 80100200 */  sll        $v0, $v0, 2
    /* 3A19C 8004A19C 23105000 */  subu       $v0, $v0, $s0
    /* 3A1A0 8004A1A0 80100200 */  sll        $v0, $v0, 2
    /* 3A1A4 8004A1A4 0D80013C */  lui        $at, %hi(item + 0x4D)
    /* 3A1A8 8004A1A8 21082200 */  addu       $at, $at, $v0
    /* 3A1AC 8004A1AC A11D2390 */  lbu        $v1, %lo(item + 0x4D)($at)
    /* 3A1B0 8004A1B0 17000224 */  addiu      $v0, $zero, 0x17
    /* 3A1B4 8004A1B4 02006214 */  bne        $v1, $v0, .L8004A1C0
    /* 3A1B8 8004A1B8 00000000 */   nop
    /* 3A1BC 8004A1BC 40881200 */  sll        $s1, $s2, 1
  .L8004A1C0:
    /* 3A1C0 8004A1C0 07002412 */  beq        $s1, $a0, .L8004A1E0
    /* 3A1C4 8004A1C4 01000224 */   addiu     $v0, $zero, 0x1
  .L8004A1C8:
    /* 3A1C8 8004A1C8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3A1CC 8004A1CC 21200002 */  addu       $a0, $s0, $zero
    /* 3A1D0 8004A1D0 21286002 */  addu       $a1, $s3, $zero
    /* 3A1D4 8004A1D4 43301100 */  sra        $a2, $s1, 1
    /* 3A1D8 8004A1D8 0D0D010C */  jal        GetItemBonus__FiiiiUc
    /* 3A1DC 8004A1DC 21382002 */   addu      $a3, $s1, $zero
  .L8004A1E0:
    /* 3A1E0 8004A1E0 C0101000 */  sll        $v0, $s0, 3
  .L8004A1E4:
    /* 3A1E4 8004A1E4 23105000 */  subu       $v0, $v0, $s0
    /* 3A1E8 8004A1E8 80100200 */  sll        $v0, $v0, 2
    /* 3A1EC 8004A1EC 23105000 */  subu       $v0, $v0, $s0
    /* 3A1F0 8004A1F0 80100200 */  sll        $v0, $v0, 2
    /* 3A1F4 8004A1F4 01000324 */  addiu      $v1, $zero, 0x1
    /* 3A1F8 8004A1F8 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3A1FC 8004A1FC 21082200 */  addu       $at, $at, $v0
    /* 3A200 8004A200 BD1D23A0 */  sb         $v1, %lo(item + 0x69)($at)
    /* 3A204 8004A204 1280043C */  lui        $a0, %hi(FePlayerNo)
    /* 3A208 8004A208 78B3848C */  lw         $a0, %lo(FePlayerNo)($a0)
    /* 3A20C 8004A20C 00204336 */  ori        $v1, $s2, 0x2000
    /* 3A210 8004A210 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3A214 8004A214 21082200 */  addu       $at, $at, $v0
    /* 3A218 8004A218 641D34AC */  sw         $s4, %lo(item + 0x10)($at)
    /* 3A21C 8004A21C 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3A220 8004A220 21082200 */  addu       $at, $at, $v0
    /* 3A224 8004A224 781D23A4 */  sh         $v1, %lo(item + 0x24)($at)
    /* 3A228 8004A228 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3A22C 8004A22C 21082200 */  addu       $at, $at, $v0
    /* 3A230 8004A230 B91D24A0 */  sb         $a0, %lo(item + 0x65)($at)
    /* 3A234 8004A234 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 3A238 8004A238 2800B48F */  lw         $s4, 0x28($sp)
    /* 3A23C 8004A23C 2400B38F */  lw         $s3, 0x24($sp)
    /* 3A240 8004A240 2000B28F */  lw         $s2, 0x20($sp)
    /* 3A244 8004A244 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3A248 8004A248 1800B08F */  lw         $s0, 0x18($sp)
    /* 3A24C 8004A24C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3A250 8004A250 0800E003 */  jr         $ra
    /* 3A254 8004A254 00000000 */   nop
endlabel RecreateWitchItem__Fiiii
