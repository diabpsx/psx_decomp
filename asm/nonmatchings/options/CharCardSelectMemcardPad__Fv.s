.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CharCardSelectMemcardPad__Fv, 0x248

glabel CharCardSelectMemcardPad__Fv
    /* 9B0B8 800AB0B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9B0BC 800AB0BC BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9B0C0 800AB0C0 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9B0C4 800AB0C4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9B0C8 800AB0C8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9B0CC 800AB0CC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9B0D0 800AB0D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9B0D4 800AB0D4 C0100200 */  sll        $v0, $v0, 3
    /* 9B0D8 800AB0D8 0D80013C */  lui        $at, %hi(MenuList + 0x4)
    /* 9B0DC 800AB0DC 21082200 */  addu       $at, $at, $v0
    /* 9B0E0 800AB0E0 44D2328C */  lw         $s2, %lo(MenuList + 0x4)($at)
    /* 9B0E4 800AB0E4 FD25020C */  jal        PAD_GetPad__FiUc
    /* 9B0E8 800AB0E8 21280000 */   addu      $a1, $zero, $zero
    /* 9B0EC 800AB0EC 1280033C */  lui        $v1, %hi(cardondelay)
    /* 9B0F0 800AB0F0 FCB1638C */  lw         $v1, %lo(cardondelay)($v1)
    /* 9B0F4 800AB0F4 00000000 */  nop
    /* 9B0F8 800AB0F8 08006018 */  blez       $v1, .L800AB11C
    /* 9B0FC 800AB0FC 21804000 */   addu      $s0, $v0, $zero
    /* 9B100 800AB100 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 9B104 800AB104 1280013C */  lui        $at, %hi(cardondelay)
    /* 9B108 800AB108 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 9B10C 800AB10C 9797020C */  jal        ShowLoadingBox__Fi
    /* 9B110 800AB110 48030424 */   addiu     $a0, $zero, 0x348
    /* 9B114 800AB114 B9AC0208 */  j          .L800AB2E4
    /* 9B118 800AB118 00000000 */   nop
  .L800AB11C:
    /* 9B11C 800AB11C 01000424 */  addiu      $a0, $zero, 0x1
    /* 9B120 800AB120 E495020C */  jal        ActivateMemcard__Fii
    /* 9B124 800AB124 01000524 */   addiu     $a1, $zero, 0x1
    /* 9B128 800AB128 1280023C */  lui        $v0, %hi(AlertTxt)
    /* 9B12C 800AB12C 58B4428C */  lw         $v0, %lo(AlertTxt)($v0)
    /* 9B130 800AB130 00000000 */  nop
    /* 9B134 800AB134 16004010 */  beqz       $v0, .L800AB190
    /* 9B138 800AB138 00000000 */   nop
    /* 9B13C 800AB13C EF68050C */  jal        func_8015A3BC
    /* 9B140 800AB140 21880000 */   addu      $s1, $zero, $zero
    /* 9B144 800AB144 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9B148 800AB148 21200002 */   addu      $a0, $s0, $zero
    /* 9B14C 800AB14C 40004230 */  andi       $v0, $v0, 0x40
    /* 9B150 800AB150 06004014 */  bnez       $v0, .L800AB16C
    /* 9B154 800AB154 00000000 */   nop
    /* 9B158 800AB158 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9B15C 800AB15C 21200002 */   addu      $a0, $s0, $zero
    /* 9B160 800AB160 10004230 */  andi       $v0, $v0, 0x10
    /* 9B164 800AB164 02004010 */  beqz       $v0, .L800AB170
    /* 9B168 800AB168 00000000 */   nop
  .L800AB16C:
    /* 9B16C 800AB16C 01001124 */  addiu      $s1, $zero, 0x1
  .L800AB170:
    /* 9B170 800AB170 5C002012 */  beqz       $s1, .L800AB2E4
    /* 9B174 800AB174 00000000 */   nop
    /* 9B178 800AB178 C6F5000C */  jal        PlaySFX__Fi
    /* 9B17C 800AB17C 33000424 */   addiu     $a0, $zero, 0x33
    /* 9B180 800AB180 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9B184 800AB184 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
    /* 9B188 800AB188 B9AC0208 */  j          .L800AB2E4
    /* 9B18C 800AB18C 00000000 */   nop
  .L800AB190:
    /* 9B190 800AB190 2296020C */  jal        ShowCardActionText__Fv
    /* 9B194 800AB194 21880000 */   addu      $s1, $zero, $zero
    /* 9B198 800AB198 C0AC020C */  jal        LAMBO_MovePad__FP4CPad
    /* 9B19C 800AB19C 21200002 */   addu      $a0, $s0, $zero
    /* 9B1A0 800AB1A0 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9B1A4 800AB1A4 21200002 */   addu      $a0, $s0, $zero
    /* 9B1A8 800AB1A8 40004230 */  andi       $v0, $v0, 0x40
    /* 9B1AC 800AB1AC 06004014 */  bnez       $v0, .L800AB1C8
    /* 9B1B0 800AB1B0 00000000 */   nop
    /* 9B1B4 800AB1B4 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9B1B8 800AB1B8 21200002 */   addu      $a0, $s0, $zero
    /* 9B1BC 800AB1BC 10004230 */  andi       $v0, $v0, 0x10
    /* 9B1C0 800AB1C0 02004010 */  beqz       $v0, .L800AB1CC
    /* 9B1C4 800AB1C4 00000000 */   nop
  .L800AB1C8:
    /* 9B1C8 800AB1C8 01001124 */  addiu      $s1, $zero, 0x1
  .L800AB1CC:
    /* 9B1CC 800AB1CC 2A002012 */  beqz       $s1, .L800AB278
    /* 9B1D0 800AB1D0 00000000 */   nop
    /* 9B1D4 800AB1D4 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9B1D8 800AB1D8 00000000 */  nop
    /* 9B1DC 800AB1DC 80100200 */  sll        $v0, $v0, 2
    /* 9B1E0 800AB1E0 1280013C */  lui        $at, %hi(D_8011B3D8)
    /* 9B1E4 800AB1E4 21082200 */  addu       $at, $at, $v0
    /* 9B1E8 800AB1E8 D8B3238C */  lw         $v1, %lo(D_8011B3D8)($at)
    /* 9B1EC 800AB1EC 02000224 */  addiu      $v0, $zero, 0x2
    /* 9B1F0 800AB1F0 17006210 */  beq        $v1, $v0, .L800AB250
    /* 9B1F4 800AB1F4 05000224 */   addiu     $v0, $zero, 0x5
    /* 9B1F8 800AB1F8 01001024 */  addiu      $s0, $zero, 0x1
    /* 9B1FC 800AB1FC 1280013C */  lui        $at, %hi(countdownloadcharblock)
    /* 9B200 800AB200 6CB130AC */  sw         $s0, %lo(countdownloadcharblock)($at)
    /* 9B204 800AB204 1280013C */  lui        $at, %hi(cardondelay)
    /* 9B208 800AB208 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 9B20C 800AB20C C6F5000C */  jal        PlaySFX__Fi
    /* 9B210 800AB210 33000424 */   addiu     $a0, $zero, 0x33
    /* 9B214 800AB214 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9B218 800AB218 00000000 */  nop
    /* 9B21C 800AB21C 40100300 */  sll        $v0, $v1, 1
    /* 9B220 800AB220 21104300 */  addu       $v0, $v0, $v1
    /* 9B224 800AB224 C0100200 */  sll        $v0, $v0, 3
    /* 9B228 800AB228 21105200 */  addu       $v0, $v0, $s2
    /* 9B22C 800AB22C 1400428C */  lw         $v0, 0x14($v0)
    /* 9B230 800AB230 B00A90AF */  sw         $s0, %gp_rel(D_8011B230)($gp)
    /* 9B234 800AB234 B40A90AF */  sw         $s0, %gp_rel(D_8011B234)($gp)
    /* 9B238 800AB238 1280013C */  lui        $at, %hi(current_card)
    /* 9B23C 800AB23C 60B420AC */  sw         $zero, %lo(current_card)($at)
    /* 9B240 800AB240 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9B244 800AB244 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 9B248 800AB248 B9AC0208 */  j          .L800AB2E4
    /* 9B24C 800AB24C 00000000 */   nop
  .L800AB250:
    /* 9B250 800AB250 C6F5000C */  jal        PlaySFX__Fi
    /* 9B254 800AB254 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 9B258 800AB258 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9B25C 800AB25C 00000000 */  nop
    /* 9B260 800AB260 80100200 */  sll        $v0, $v0, 2
    /* 9B264 800AB264 1280013C */  lui        $at, %hi(DoLoadedGame)
    /* 9B268 800AB268 21082200 */  addu       $at, $at, $v0
    /* 9B26C 800AB26C 84B1228C */  lw         $v0, %lo(DoLoadedGame)($at)
    /* 9B270 800AB270 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9B274 800AB274 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
  .L800AB278:
    /* 9B278 800AB278 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9B27C 800AB27C 21200002 */   addu      $a0, $s0, $zero
    /* 9B280 800AB280 00014230 */  andi       $v0, $v0, 0x100
    /* 9B284 800AB284 17004010 */  beqz       $v0, .L800AB2E4
    /* 9B288 800AB288 00000000 */   nop
    /* 9B28C 800AB28C C6F5000C */  jal        PlaySFX__Fi
    /* 9B290 800AB290 33000424 */   addiu     $a0, $zero, 0x33
    /* 9B294 800AB294 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9B298 800AB298 00000000 */  nop
    /* 9B29C 800AB29C C0100200 */  sll        $v0, $v0, 3
    /* 9B2A0 800AB2A0 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 9B2A4 800AB2A4 21082200 */  addu       $at, $at, $v0
    /* 9B2A8 800AB2A8 43D22390 */  lbu        $v1, %lo(MenuList + 0x3)($at)
    /* 9B2AC 800AB2AC 00000000 */  nop
    /* 9B2B0 800AB2B0 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 9B2B4 800AB2B4 40100300 */  sll        $v0, $v1, 1
    /* 9B2B8 800AB2B8 21104300 */  addu       $v0, $v0, $v1
    /* 9B2BC 800AB2BC C0100200 */  sll        $v0, $v0, 3
    /* 9B2C0 800AB2C0 21105200 */  addu       $v0, $v0, $s2
    /* 9B2C4 800AB2C4 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9B2C8 800AB2C8 1400438C */  lw         $v1, 0x14($v0)
    /* 9B2CC 800AB2CC FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 9B2D0 800AB2D0 04006210 */  beq        $v1, $v0, .L800AB2E4
    /* 9B2D4 800AB2D4 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 9B2D8 800AB2D8 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 9B2DC 800AB2DC 03000224 */  addiu      $v0, $zero, 0x3
    /* 9B2E0 800AB2E0 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800AB2E4:
    /* 9B2E4 800AB2E4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9B2E8 800AB2E8 1800B28F */  lw         $s2, 0x18($sp)
    /* 9B2EC 800AB2EC 1400B18F */  lw         $s1, 0x14($sp)
    /* 9B2F0 800AB2F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 9B2F4 800AB2F4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9B2F8 800AB2F8 0800E003 */  jr         $ra
    /* 9B2FC 800AB2FC 00000000 */   nop
endlabel CharCardSelectMemcardPad__Fv
