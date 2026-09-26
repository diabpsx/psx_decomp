.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_GoatShrine__Fi, 0x134

glabel Theme_GoatShrine__Fi
    /* 243DC 8015DFD4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 243E0 8015DFD8 3400B3AF */  sw         $s3, 0x34($sp)
    /* 243E4 8015DFDC 21988000 */  addu       $s3, $a0, $zero
    /* 243E8 8015DFE0 3800BFAF */  sw         $ra, 0x38($sp)
    /* 243EC 8015DFE4 3000B2AF */  sw         $s2, 0x30($sp)
    /* 243F0 8015DFE8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 243F4 8015DFEC 5C70050C */  jal        TFit_GoatShrine__Fi
    /* 243F8 8015DFF0 2800B0AF */   sw        $s0, 0x28($sp)
    /* 243FC 8015DFF4 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 24400 8015DFF8 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 24404 8015DFFC BE4E010C */  jal        AddObject__Fiii
    /* 24408 8015E000 4F000424 */   addiu     $a0, $zero, 0x4F
    /* 2440C 8015E004 1C1A828F */  lw         $v0, %gp_rel(themey)($gp)
    /* 24410 8015E008 00000000 */  nop
    /* 24414 8015E00C FFFF5124 */  addiu      $s1, $v0, -0x1
    /* 24418 8015E010 21100000 */  addu       $v0, $zero, $zero
    /* 2441C 8015E014 34004014 */  bnez       $v0, .L8015E0E8
    /* 24420 8015E018 00000000 */   nop
  .L8015E01C:
    /* 24424 8015E01C 181A828F */  lw         $v0, %gp_rel(themex)($gp)
    /* 24428 8015E020 00000000 */  nop
    /* 2442C 8015E024 FFFF5024 */  addiu      $s0, $v0, -0x1
    /* 24430 8015E028 21100000 */  addu       $v0, $zero, $zero
    /* 24434 8015E02C 28004014 */  bnez       $v0, .L8015E0D0
    /* 24438 8015E030 C0181100 */   sll       $v1, $s1, 3
    /* 2443C 8015E034 C0101000 */  sll        $v0, $s0, 3
    /* 24440 8015E038 23105000 */  subu       $v0, $v0, $s0
    /* 24444 8015E03C C0110200 */  sll        $v0, $v0, 7
    /* 24448 8015E040 21904300 */  addu       $s2, $v0, $v1
  .L8015E044:
    /* 2444C 8015E044 C0101300 */  sll        $v0, $s3, 3
    /* 24450 8015E048 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 24454 8015E04C 21083200 */  addu       $at, $at, $s2
    /* 24458 8015E050 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 2445C 8015E054 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 24460 8015E058 21082200 */  addu       $at, $at, $v0
    /* 24464 8015E05C 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 24468 8015E060 00000000 */  nop
    /* 2446C 8015E064 14006214 */  bne        $v1, $v0, .L8015E0B8
    /* 24470 8015E068 21200002 */   addu      $a0, $s0, $zero
    /* 24474 8015E06C 380B020C */  jal        GetSOLID__Fii
    /* 24478 8015E070 21282002 */   addu      $a1, $s1, $zero
    /* 2447C 8015E074 01004238 */  xori       $v0, $v0, 0x1
    /* 24480 8015E078 0F004010 */  beqz       $v0, .L8015E0B8
    /* 24484 8015E07C 00000000 */   nop
    /* 24488 8015E080 181A828F */  lw         $v0, %gp_rel(themex)($gp)
    /* 2448C 8015E084 00000000 */  nop
    /* 24490 8015E088 05000216 */  bne        $s0, $v0, .L8015E0A0
    /* 24494 8015E08C 21200002 */   addu      $a0, $s0, $zero
    /* 24498 8015E090 1C1A828F */  lw         $v0, %gp_rel(themey)($gp)
    /* 2449C 8015E094 00000000 */  nop
    /* 244A0 8015E098 07002212 */  beq        $s1, $v0, .L8015E0B8
    /* 244A4 8015E09C 00000000 */   nop
  .L8015E0A0:
    /* 244A8 8015E0A0 21282002 */  addu       $a1, $s1, $zero
    /* 244AC 8015E0A4 01000624 */  addiu      $a2, $zero, 0x1
    /* 244B0 8015E0A8 201A878F */  lw         $a3, %gp_rel(themeVar1)($gp)
    /* 244B4 8015E0AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 244B8 8015E0B0 74FF010C */  jal        AddMonster__FiiiiUc
    /* 244BC 8015E0B4 1000A2AF */   sw        $v0, 0x10($sp)
  .L8015E0B8:
    /* 244C0 8015E0B8 181A828F */  lw         $v0, %gp_rel(themex)($gp)
    /* 244C4 8015E0BC 01001026 */  addiu      $s0, $s0, 0x1
    /* 244C8 8015E0C0 01004224 */  addiu      $v0, $v0, 0x1
    /* 244CC 8015E0C4 2A105000 */  slt        $v0, $v0, $s0
    /* 244D0 8015E0C8 DEFF4010 */  beqz       $v0, .L8015E044
    /* 244D4 8015E0CC 80035226 */   addiu     $s2, $s2, 0x380
  .L8015E0D0:
    /* 244D8 8015E0D0 1C1A828F */  lw         $v0, %gp_rel(themey)($gp)
    /* 244DC 8015E0D4 01003126 */  addiu      $s1, $s1, 0x1
    /* 244E0 8015E0D8 01004224 */  addiu      $v0, $v0, 0x1
    /* 244E4 8015E0DC 2A105100 */  slt        $v0, $v0, $s1
    /* 244E8 8015E0E0 CEFF4010 */  beqz       $v0, .L8015E01C
    /* 244EC 8015E0E4 00000000 */   nop
  .L8015E0E8:
    /* 244F0 8015E0E8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 244F4 8015E0EC 3400B38F */  lw         $s3, 0x34($sp)
    /* 244F8 8015E0F0 3000B28F */  lw         $s2, 0x30($sp)
    /* 244FC 8015E0F4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 24500 8015E0F8 2800B08F */  lw         $s0, 0x28($sp)
    /* 24504 8015E0FC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 24508 8015E100 0800E003 */  jr         $ra
    /* 2450C 8015E104 00000000 */   nop
endlabel Theme_GoatShrine__Fi
