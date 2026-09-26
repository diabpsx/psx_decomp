.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ProcessMonsters__Fv, 0x5C8

glabel ProcessMonsters__Fv
    /* 1ADEC 801549E4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1ADF0 801549E8 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1ADF4 801549EC 3400B7AF */  sw         $s7, 0x34($sp)
    /* 1ADF8 801549F0 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1ADFC 801549F4 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1AE00 801549F8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1AE04 801549FC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1AE08 80154A00 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1AE0C 80154A04 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1AE10 80154A08 3052050C */  jal        DeleteMonsterList__Fv
    /* 1AE14 80154A0C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1AE18 80154A10 EB51023C */  lui        $v0, (0x51EB851F >> 16)
    /* 1AE1C 80154A14 441B848F */  lw         $a0, %gp_rel(D_8011C2C4)($gp)
    /* 1AE20 80154A18 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
    /* 1AE24 80154A1C 01008424 */  addiu      $a0, $a0, 0x1
    /* 1AE28 80154A20 19008200 */  multu      $a0, $v0
    /* 1AE2C 80154A24 21B00000 */  addu       $s6, $zero, $zero
    /* 1AE30 80154A28 441B84AF */  sw         $a0, %gp_rel(D_8011C2C4)($gp)
    /* 1AE34 80154A2C 10300000 */  mfhi       $a2
    /* 1AE38 80154A30 82190600 */  srl        $v1, $a2, 6
    /* 1AE3C 80154A34 40100300 */  sll        $v0, $v1, 1
    /* 1AE40 80154A38 21104300 */  addu       $v0, $v0, $v1
    /* 1AE44 80154A3C C0100200 */  sll        $v0, $v0, 3
    /* 1AE48 80154A40 21104300 */  addu       $v0, $v0, $v1
    /* 1AE4C 80154A44 C0100200 */  sll        $v0, $v0, 3
    /* 1AE50 80154A48 23208200 */  subu       $a0, $a0, $v0
    /* 1AE54 80154A4C 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 1AE58 80154A50 00000000 */  nop
    /* 1AE5C 80154A54 47014018 */  blez       $v0, .L80154F74
    /* 1AE60 80154A58 0100972C */   sltiu     $s7, $a0, 0x1
    /* 1AE64 80154A5C 40101600 */  sll        $v0, $s6, 1
  .L80154A60:
    /* 1AE68 80154A60 1180013C */  lui        $at, %hi(monstactive)
    /* 1AE6C 80154A64 21082200 */  addu       $at, $at, $v0
    /* 1AE70 80154A68 C4A03284 */  lh         $s2, %lo(monstactive)($at)
    /* 1AE74 80154A6C 1080033C */  lui        $v1, %hi(monster)
    /* 1AE78 80154A70 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1AE7C 80154A74 40101200 */  sll        $v0, $s2, 1
    /* 1AE80 80154A78 21105200 */  addu       $v0, $v0, $s2
    /* 1AE84 80154A7C 80100200 */  sll        $v0, $v0, 2
    /* 1AE88 80154A80 21105200 */  addu       $v0, $v0, $s2
    /* 1AE8C 80154A84 C0100200 */  sll        $v0, $v0, 3
    /* 1AE90 80154A88 0800E012 */  beqz       $s7, .L80154AAC
    /* 1AE94 80154A8C 21884300 */   addu      $s1, $v0, $v1
    /* 1AE98 80154A90 0400422A */  slti       $v0, $s2, 0x4
    /* 1AE9C 80154A94 06004014 */  bnez       $v0, .L80154AB0
    /* 1AEA0 80154A98 40101200 */   sll       $v0, $s2, 1
    /* 1AEA4 80154A9C 2C002296 */  lhu        $v0, 0x2C($s1)
    /* 1AEA8 80154AA0 00000000 */  nop
    /* 1AEAC 80154AA4 EFFF4230 */  andi       $v0, $v0, 0xFFEF
    /* 1AEB0 80154AA8 2C0022A6 */  sh         $v0, 0x2C($s1)
  .L80154AAC:
    /* 1AEB4 80154AAC 40101200 */  sll        $v0, $s2, 1
  .L80154AB0:
    /* 1AEB8 80154AB0 21105200 */  addu       $v0, $v0, $s2
    /* 1AEBC 80154AB4 80100200 */  sll        $v0, $v0, 2
    /* 1AEC0 80154AB8 21105200 */  addu       $v0, $v0, $s2
    /* 1AEC4 80154ABC C0100200 */  sll        $v0, $v0, 3
    /* 1AEC8 80154AC0 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1AECC 80154AC4 21082200 */  addu       $at, $at, $v0
    /* 1AED0 80154AC8 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 1AED4 80154ACC 3D003092 */  lbu        $s0, 0x3D($s1)
    /* 1AED8 80154AD0 34003482 */  lb         $s4, 0x34($s1)
    /* 1AEDC 80154AD4 35003582 */  lb         $s5, 0x35($s1)
    /* 1AEE0 80154AD8 08004230 */  andi       $v0, $v0, 0x8
    /* 1AEE4 80154ADC 14004014 */  bnez       $v0, .L80154B30
    /* 1AEE8 80154AE0 21980000 */   addu      $s3, $zero, $zero
    /* 1AEEC 80154AE4 1000258E */  lw         $a1, 0x10($s1)
    /* 1AEF0 80154AE8 1400228E */  lw         $v0, 0x14($s1)
    /* 1AEF4 80154AEC 00000000 */  nop
    /* 1AEF8 80154AF0 2A10A200 */  slt        $v0, $a1, $v0
    /* 1AEFC 80154AF4 0E004010 */  beqz       $v0, .L80154B30
    /* 1AF00 80154AF8 83110500 */   sra       $v0, $a1, 6
    /* 1AF04 80154AFC 0D004018 */  blez       $v0, .L80154B34
    /* 1AF08 80154B00 C0101500 */   sll       $v0, $s5, 3
    /* 1AF0C 80154B04 47002292 */  lbu        $v0, 0x47($s1)
    /* 1AF10 80154B08 00000000 */  nop
    /* 1AF14 80154B0C 00260200 */  sll        $a0, $v0, 24
    /* 1AF18 80154B10 031E0400 */  sra        $v1, $a0, 24
    /* 1AF1C 80154B14 02006228 */  slti       $v0, $v1, 0x2
    /* 1AF20 80154B18 03004014 */  bnez       $v0, .L80154B28
    /* 1AF24 80154B1C 43160400 */   sra       $v0, $a0, 25
    /* 1AF28 80154B20 CB520508 */  j          .L80154B2C
    /* 1AF2C 80154B24 2110A200 */   addu      $v0, $a1, $v0
  .L80154B28:
    /* 1AF30 80154B28 2110A300 */  addu       $v0, $a1, $v1
  .L80154B2C:
    /* 1AF34 80154B2C 100022AE */  sw         $v0, 0x10($s1)
  .L80154B30:
    /* 1AF38 80154B30 C0101500 */  sll        $v0, $s5, 3
  .L80154B34:
    /* 1AF3C 80154B34 C0181400 */  sll        $v1, $s4, 3
    /* 1AF40 80154B38 23187400 */  subu       $v1, $v1, $s4
    /* 1AF44 80154B3C C0190300 */  sll        $v1, $v1, 7
    /* 1AF48 80154B40 21104300 */  addu       $v0, $v0, $v1
    /* 1AF4C 80154B44 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1AF50 80154B48 21082200 */  addu       $at, $at, $v0
    /* 1AF54 80154B4C 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 1AF58 80154B50 00000000 */  nop
    /* 1AF5C 80154B54 03006230 */  andi       $v0, $v1, 0x3
    /* 1AF60 80154B58 0F004010 */  beqz       $v0, .L80154B98
    /* 1AF64 80154B5C 04006230 */   andi      $v0, $v1, 0x4
    /* 1AF68 80154B60 0D004010 */  beqz       $v0, .L80154B98
    /* 1AF6C 80154B64 00000000 */   nop
    /* 1AF70 80154B68 4E002292 */  lbu        $v0, 0x4E($s1)
    /* 1AF74 80154B6C 00000000 */  nop
    /* 1AF78 80154B70 09004014 */  bnez       $v0, .L80154B98
    /* 1AF7C 80154B74 00000000 */   nop
    /* 1AF80 80154B78 6000228E */  lw         $v0, 0x60($s1)
    /* 1AF84 80154B7C 00000000 */  nop
    /* 1AF88 80154B80 12004390 */  lbu        $v1, 0x12($v0)
    /* 1AF8C 80154B84 33000224 */  addiu      $v0, $zero, 0x33
    /* 1AF90 80154B88 03006214 */  bne        $v1, $v0, .L80154B98
    /* 1AF94 80154B8C 00000000 */   nop
    /* 1AF98 80154B90 C6F5000C */  jal        PlaySFX__Fi
    /* 1AF9C 80154B94 49030424 */   addiu     $a0, $zero, 0x349
  .L80154B98:
    /* 1AFA0 80154B98 2C002296 */  lhu        $v0, 0x2C($s1)
    /* 1AFA4 80154B9C 00000000 */  nop
    /* 1AFA8 80154BA0 10004230 */  andi       $v0, $v0, 0x10
    /* 1AFAC 80154BA4 12004010 */  beqz       $v0, .L80154BF0
    /* 1AFB0 80154BA8 40101000 */   sll       $v0, $s0, 1
    /* 1AFB4 80154BAC 21105000 */  addu       $v0, $v0, $s0
    /* 1AFB8 80154BB0 80100200 */  sll        $v0, $v0, 2
    /* 1AFBC 80154BB4 21105000 */  addu       $v0, $v0, $s0
    /* 1AFC0 80154BB8 C0100200 */  sll        $v0, $v0, 3
    /* 1AFC4 80154BBC 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1AFC8 80154BC0 21082200 */  addu       $at, $at, $v0
    /* 1AFCC 80154BC4 CA532390 */  lbu        $v1, %lo(monster + 0x36)($at)
    /* 1AFD0 80154BC8 00000000 */  nop
    /* 1AFD4 80154BCC 430023A2 */  sb         $v1, 0x43($s1)
    /* 1AFD8 80154BD0 4A0023A2 */  sb         $v1, 0x4A($s1)
    /* 1AFDC 80154BD4 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1AFE0 80154BD8 21082200 */  addu       $at, $at, $v0
    /* 1AFE4 80154BDC CB532290 */  lbu        $v0, %lo(monster + 0x37)($at)
    /* 1AFE8 80154BE0 00000000 */  nop
    /* 1AFEC 80154BE4 440022A2 */  sb         $v0, 0x44($s1)
    /* 1AFF0 80154BE8 3E530508 */  j          .L80154CF8
    /* 1AFF4 80154BEC 4B0022A2 */   sb        $v0, 0x4B($s1)
  .L80154BF0:
    /* 1AFF8 80154BF0 21105000 */  addu       $v0, $v0, $s0
    /* 1AFFC 80154BF4 80100200 */  sll        $v0, $v0, 2
    /* 1B000 80154BF8 21105000 */  addu       $v0, $v0, $s0
    /* 1B004 80154BFC 00110200 */  sll        $v0, $v0, 4
    /* 1B008 80154C00 23105000 */  subu       $v0, $v0, $s0
    /* 1B00C 80154C04 80100200 */  sll        $v0, $v0, 2
    /* 1B010 80154C08 21105000 */  addu       $v0, $v0, $s0
    /* 1B014 80154C0C C0100200 */  sll        $v0, $v0, 3
    /* 1B018 80154C10 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 1B01C 80154C14 21082200 */  addu       $at, $at, $v0
    /* 1B020 80154C18 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 1B024 80154C1C 00000000 */  nop
    /* 1B028 80154C20 04004014 */  bnez       $v0, .L80154C34
    /* 1B02C 80154C24 40101000 */   sll       $v0, $s0, 1
    /* 1B030 80154C28 0100103A */  xori       $s0, $s0, 0x1
    /* 1B034 80154C2C 3D0030A2 */  sb         $s0, 0x3D($s1)
    /* 1B038 80154C30 40101000 */  sll        $v0, $s0, 1
  .L80154C34:
    /* 1B03C 80154C34 21105000 */  addu       $v0, $v0, $s0
    /* 1B040 80154C38 80100200 */  sll        $v0, $v0, 2
    /* 1B044 80154C3C 21105000 */  addu       $v0, $v0, $s0
    /* 1B048 80154C40 00110200 */  sll        $v0, $v0, 4
    /* 1B04C 80154C44 23105000 */  subu       $v0, $v0, $s0
    /* 1B050 80154C48 80100200 */  sll        $v0, $v0, 2
    /* 1B054 80154C4C 21105000 */  addu       $v0, $v0, $s0
    /* 1B058 80154C50 C0200200 */  sll        $a0, $v0, 3
    /* 1B05C 80154C54 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 1B060 80154C58 21082400 */  addu       $at, $at, $a0
    /* 1B064 80154C5C 68A52294 */  lhu        $v0, %lo(plr + 0x30)($at)
    /* 1B068 80154C60 00000000 */  nop
    /* 1B06C 80154C64 4A0022A2 */  sb         $v0, 0x4A($s1)
    /* 1B070 80154C68 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 1B074 80154C6C 21082400 */  addu       $at, $at, $a0
    /* 1B078 80154C70 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 1B07C 80154C74 C0181500 */  sll        $v1, $s5, 3
    /* 1B080 80154C78 4B0022A2 */  sb         $v0, 0x4B($s1)
    /* 1B084 80154C7C C0101400 */  sll        $v0, $s4, 3
    /* 1B088 80154C80 23105400 */  subu       $v0, $v0, $s4
    /* 1B08C 80154C84 C0110200 */  sll        $v0, $v0, 7
    /* 1B090 80154C88 21186200 */  addu       $v1, $v1, $v0
    /* 1B094 80154C8C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1B098 80154C90 21082300 */  addu       $at, $at, $v1
    /* 1B09C 80154C94 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1B0A0 80154C98 00000000 */  nop
    /* 1B0A4 80154C9C 03004230 */  andi       $v0, $v0, 0x3
    /* 1B0A8 80154CA0 0C004010 */  beqz       $v0, .L80154CD4
    /* 1B0AC 80154CA4 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 1B0B0 80154CA8 4E0022A2 */  sb         $v0, 0x4E($s1)
    /* 1B0B4 80154CAC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 1B0B8 80154CB0 21082400 */  addu       $at, $at, $a0
    /* 1B0BC 80154CB4 68A52294 */  lhu        $v0, %lo(plr + 0x30)($at)
    /* 1B0C0 80154CB8 00000000 */  nop
    /* 1B0C4 80154CBC 430022A2 */  sb         $v0, 0x43($s1)
    /* 1B0C8 80154CC0 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 1B0CC 80154CC4 21082400 */  addu       $at, $at, $a0
    /* 1B0D0 80154CC8 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 1B0D4 80154CCC 3E530508 */  j          .L80154CF8
    /* 1B0D8 80154CD0 440022A2 */   sb        $v0, 0x44($s1)
  .L80154CD4:
    /* 1B0DC 80154CD4 4E002492 */  lbu        $a0, 0x4E($s1)
    /* 1B0E0 80154CD8 00000000 */  nop
    /* 1B0E4 80154CDC 06008010 */  beqz       $a0, .L80154CF8
    /* 1B0E8 80154CE0 6E000224 */   addiu     $v0, $zero, 0x6E
    /* 1B0EC 80154CE4 4C002392 */  lbu        $v1, 0x4C($s1)
    /* 1B0F0 80154CE8 00000000 */  nop
    /* 1B0F4 80154CEC 02006210 */  beq        $v1, $v0, .L80154CF8
    /* 1B0F8 80154CF0 FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 1B0FC 80154CF4 4E0022A2 */  sb         $v0, 0x4E($s1)
  .L80154CF8:
    /* 1B100 80154CF8 C0101500 */  sll        $v0, $s5, 3
    /* 1B104 80154CFC C0181400 */  sll        $v1, $s4, 3
    /* 1B108 80154D00 23187400 */  subu       $v1, $v1, $s4
    /* 1B10C 80154D04 C0190300 */  sll        $v1, $v1, 7
    /* 1B110 80154D08 21104300 */  addu       $v0, $v0, $v1
    /* 1B114 80154D0C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1B118 80154D10 21082200 */  addu       $at, $at, $v0
    /* 1B11C 80154D14 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1B120 80154D18 00000000 */  nop
    /* 1B124 80154D1C 03004230 */  andi       $v0, $v0, 0x3
    /* 1B128 80154D20 07004014 */  bnez       $v0, .L80154D40
    /* 1B12C 80154D24 00000000 */   nop
    /* 1B130 80154D28 4E002292 */  lbu        $v0, 0x4E($s1)
    /* 1B134 80154D2C 00000000 */  nop
    /* 1B138 80154D30 03004014 */  bnez       $v0, .L80154D40
    /* 1B13C 80154D34 0400C22A */   slti      $v0, $s6, 0x4
    /* 1B140 80154D38 89004010 */  beqz       $v0, .L80154F60
    /* 1B144 80154D3C 00000000 */   nop
  .L80154D40:
    /* 1B148 80154D40 4C002292 */  lbu        $v0, 0x4C($s1)
    /* 1B14C 80154D44 00000000 */  nop
    /* 1B150 80154D48 80100200 */  sll        $v0, $v0, 2
    /* 1B154 80154D4C 1080013C */  lui        $at, %hi(AiProc)
    /* 1B158 80154D50 21082200 */  addu       $at, $at, $v0
    /* 1B15C 80154D54 1453228C */  lw         $v0, %lo(AiProc)($at)
    /* 1B160 80154D58 00000000 */  nop
    /* 1B164 80154D5C 09F84000 */  jalr       $v0
    /* 1B168 80154D60 21204002 */   addu      $a0, $s2, $zero
    /* 1B16C 80154D64 33002382 */  lb         $v1, 0x33($s1)
    /* 1B170 80154D68 00000000 */  nop
    /* 1B174 80154D6C 1200622C */  sltiu      $v0, $v1, 0x12
    /* 1B178 80154D70 4C004010 */  beqz       $v0, .L80154EA4
    /* 1B17C 80154D74 80100300 */   sll       $v0, $v1, 2
    /* 1B180 80154D78 1280013C */  lui        $at, %hi(jtbl_8011A330)
    /* 1B184 80154D7C 21082200 */  addu       $at, $at, $v0
    /* 1B188 80154D80 30A3228C */  lw         $v0, %lo(jtbl_8011A330)($at)
    /* 1B18C 80154D84 00000000 */  nop
    /* 1B190 80154D88 08004000 */  jr         $v0
    /* 1B194 80154D8C 00000000 */   nop
    /* 1B198 80154D90 A432050C */  jal        M_DoStand__Fi
    /* 1B19C 80154D94 21204002 */   addu      $a0, $s2, $zero
    /* 1B1A0 80154D98 A9530508 */  j          .L80154EA4
    /* 1B1A4 80154D9C 21984000 */   addu      $s3, $v0, $zero
    /* 1B1A8 80154DA0 BC32050C */  jal        M_DoWalk__Fi
    /* 1B1AC 80154DA4 21204002 */   addu      $a0, $s2, $zero
    /* 1B1B0 80154DA8 A9530508 */  j          .L80154EA4
    /* 1B1B4 80154DAC 21984000 */   addu      $s3, $v0, $zero
    /* 1B1B8 80154DB0 5833050C */  jal        M_DoWalk2__Fi
    /* 1B1BC 80154DB4 21204002 */   addu      $a0, $s2, $zero
    /* 1B1C0 80154DB8 A9530508 */  j          .L80154EA4
    /* 1B1C4 80154DBC 21984000 */   addu      $s3, $v0, $zero
    /* 1B1C8 80154DC0 D333050C */  jal        M_DoWalk3__Fi
    /* 1B1CC 80154DC4 21204002 */   addu      $a0, $s2, $zero
    /* 1B1D0 80154DC8 A9530508 */  j          .L80154EA4
    /* 1B1D4 80154DCC 21984000 */   addu      $s3, $v0, $zero
    /* 1B1D8 80154DD0 8F36050C */  jal        M_DoAttack__Fi
    /* 1B1DC 80154DD4 21204002 */   addu      $a0, $s2, $zero
    /* 1B1E0 80154DD8 A9530508 */  j          .L80154EA4
    /* 1B1E4 80154DDC 21984000 */   addu      $s3, $v0, $zero
    /* 1B1E8 80154DE0 FA36050C */  jal        M_DoRAttack__Fi
    /* 1B1EC 80154DE4 21204002 */   addu      $a0, $s2, $zero
    /* 1B1F0 80154DE8 A9530508 */  j          .L80154EA4
    /* 1B1F4 80154DEC 21984000 */   addu      $s3, $v0, $zero
    /* 1B1F8 80154DF0 AD3A050C */  jal        M_DoGotHit__Fi
    /* 1B1FC 80154DF4 21204002 */   addu      $a0, $s2, $zero
    /* 1B200 80154DF8 A9530508 */  j          .L80154EA4
    /* 1B204 80154DFC 21984000 */   addu      $s3, $v0, $zero
    /* 1B208 80154E00 433B050C */  jal        M_DoDeath__Fi
    /* 1B20C 80154E04 21204002 */   addu      $a0, $s2, $zero
    /* 1B210 80154E08 A9530508 */  j          .L80154EA4
    /* 1B214 80154E0C 21984000 */   addu      $s3, $v0, $zero
    /* 1B218 80154E10 DE37050C */  jal        M_DoSAttack__Fi
    /* 1B21C 80154E14 21204002 */   addu      $a0, $s2, $zero
    /* 1B220 80154E18 A9530508 */  j          .L80154EA4
    /* 1B224 80154E1C 21984000 */   addu      $s3, $v0, $zero
    /* 1B228 80154E20 1538050C */  jal        M_DoFadein__Fi
    /* 1B22C 80154E24 21204002 */   addu      $a0, $s2, $zero
    /* 1B230 80154E28 A9530508 */  j          .L80154EA4
    /* 1B234 80154E2C 21984000 */   addu      $s3, $v0, $zero
    /* 1B238 80154E30 4D38050C */  jal        M_DoFadeout__Fi
    /* 1B23C 80154E34 21204002 */   addu      $a0, $s2, $zero
    /* 1B240 80154E38 A9530508 */  j          .L80154EA4
    /* 1B244 80154E3C 21984000 */   addu      $s3, $v0, $zero
    /* 1B248 80154E40 B43B050C */  jal        M_DoSpStand__Fi
    /* 1B24C 80154E44 21204002 */   addu      $a0, $s2, $zero
    /* 1B250 80154E48 A9530508 */  j          .L80154EA4
    /* 1B254 80154E4C 21984000 */   addu      $s3, $v0, $zero
    /* 1B258 80154E50 5C37050C */  jal        M_DoRSpAttack__Fi
    /* 1B25C 80154E54 21204002 */   addu      $a0, $s2, $zero
    /* 1B260 80154E58 A9530508 */  j          .L80154EA4
    /* 1B264 80154E5C 21984000 */   addu      $s3, $v0, $zero
    /* 1B268 80154E60 DF3B050C */  jal        M_DoDelay__Fi
    /* 1B26C 80154E64 21204002 */   addu      $a0, $s2, $zero
    /* 1B270 80154E68 A9530508 */  j          .L80154EA4
    /* 1B274 80154E6C 21984000 */   addu      $s3, $v0, $zero
    /* 1B278 80154E70 A9530508 */  j          .L80154EA4
    /* 1B27C 80154E74 21980000 */   addu      $s3, $zero, $zero
    /* 1B280 80154E78 243C050C */  jal        M_DoStone__Fi
    /* 1B284 80154E7C 21204002 */   addu      $a0, $s2, $zero
    /* 1B288 80154E80 A9530508 */  j          .L80154EA4
    /* 1B28C 80154E84 21984000 */   addu      $s3, $v0, $zero
    /* 1B290 80154E88 9838050C */  jal        M_DoHeal__Fi
    /* 1B294 80154E8C 21204002 */   addu      $a0, $s2, $zero
    /* 1B298 80154E90 A9530508 */  j          .L80154EA4
    /* 1B29C 80154E94 21984000 */   addu      $s3, $v0, $zero
    /* 1B2A0 80154E98 BF38050C */  jal        M_DoTalk__Fi
    /* 1B2A4 80154E9C 21204002 */   addu      $a0, $s2, $zero
    /* 1B2A8 80154EA0 21984000 */  addu       $s3, $v0, $zero
  .L80154EA4:
    /* 1B2AC 80154EA4 05006012 */  beqz       $s3, .L80154EBC
    /* 1B2B0 80154EA8 0F000224 */   addiu     $v0, $zero, 0xF
    /* 1B2B4 80154EAC CF3C050C */  jal        GroupUnity__Fi
    /* 1B2B8 80154EB0 21204002 */   addu      $a0, $s2, $zero
    /* 1B2BC 80154EB4 50530508 */  j          .L80154D40
    /* 1B2C0 80154EB8 00000000 */   nop
  .L80154EBC:
    /* 1B2C4 80154EBC 33002382 */  lb         $v1, 0x33($s1)
    /* 1B2C8 80154EC0 00000000 */  nop
    /* 1B2CC 80154EC4 26006210 */  beq        $v1, $v0, .L80154F60
    /* 1B2D0 80154EC8 00000000 */   nop
    /* 1B2D4 80154ECC 3F002392 */  lbu        $v1, 0x3F($s1)
    /* 1B2D8 80154ED0 2C002296 */  lhu        $v0, 0x2C($s1)
    /* 1B2DC 80154ED4 01006324 */  addiu      $v1, $v1, 0x1
    /* 1B2E0 80154ED8 04004230 */  andi       $v0, $v0, 0x4
    /* 1B2E4 80154EDC 20004014 */  bnez       $v0, .L80154F60
    /* 1B2E8 80154EE0 3F0023A2 */   sb        $v1, 0x3F($s1)
    /* 1B2EC 80154EE4 00160300 */  sll        $v0, $v1, 24
    /* 1B2F0 80154EE8 3E002382 */  lb         $v1, 0x3E($s1)
    /* 1B2F4 80154EEC 03160200 */  sra        $v0, $v0, 24
    /* 1B2F8 80154EF0 2A104300 */  slt        $v0, $v0, $v1
    /* 1B2FC 80154EF4 1A004014 */  bnez       $v0, .L80154F60
    /* 1B300 80154EF8 00000000 */   nop
    /* 1B304 80154EFC 2C002296 */  lhu        $v0, 0x2C($s1)
    /* 1B308 80154F00 00000000 */  nop
    /* 1B30C 80154F04 02004230 */  andi       $v0, $v0, 0x2
    /* 1B310 80154F08 0B004010 */  beqz       $v0, .L80154F38
    /* 1B314 80154F0C 3F0020A2 */   sb        $zero, 0x3F($s1)
    /* 1B318 80154F10 41002292 */  lbu        $v0, 0x41($s1)
    /* 1B31C 80154F14 00000000 */  nop
    /* 1B320 80154F18 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1B324 80154F1C 410022A2 */  sb         $v0, 0x41($s1)
    /* 1B328 80154F20 00160200 */  sll        $v0, $v0, 24
    /* 1B32C 80154F24 0E004014 */  bnez       $v0, .L80154F60
    /* 1B330 80154F28 00000000 */   nop
    /* 1B334 80154F2C 40002292 */  lbu        $v0, 0x40($s1)
    /* 1B338 80154F30 D8530508 */  j          .L80154F60
    /* 1B33C 80154F34 410022A2 */   sb        $v0, 0x41($s1)
  .L80154F38:
    /* 1B340 80154F38 41002292 */  lbu        $v0, 0x41($s1)
    /* 1B344 80154F3C 40002382 */  lb         $v1, 0x40($s1)
    /* 1B348 80154F40 01004224 */  addiu      $v0, $v0, 0x1
    /* 1B34C 80154F44 410022A2 */  sb         $v0, 0x41($s1)
    /* 1B350 80154F48 00160200 */  sll        $v0, $v0, 24
    /* 1B354 80154F4C 03160200 */  sra        $v0, $v0, 24
    /* 1B358 80154F50 2A186200 */  slt        $v1, $v1, $v0
    /* 1B35C 80154F54 02006010 */  beqz       $v1, .L80154F60
    /* 1B360 80154F58 01000224 */   addiu     $v0, $zero, 0x1
    /* 1B364 80154F5C 410022A2 */  sb         $v0, 0x41($s1)
  .L80154F60:
    /* 1B368 80154F60 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 1B36C 80154F64 0100D626 */  addiu      $s6, $s6, 0x1
    /* 1B370 80154F68 2A10C202 */  slt        $v0, $s6, $v0
    /* 1B374 80154F6C BCFE4014 */  bnez       $v0, .L80154A60
    /* 1B378 80154F70 40101600 */   sll       $v0, $s6, 1
  .L80154F74:
    /* 1B37C 80154F74 3052050C */  jal        DeleteMonsterList__Fv
    /* 1B380 80154F78 00000000 */   nop
    /* 1B384 80154F7C 3800BF8F */  lw         $ra, 0x38($sp)
    /* 1B388 80154F80 3400B78F */  lw         $s7, 0x34($sp)
    /* 1B38C 80154F84 3000B68F */  lw         $s6, 0x30($sp)
    /* 1B390 80154F88 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1B394 80154F8C 2800B48F */  lw         $s4, 0x28($sp)
    /* 1B398 80154F90 2400B38F */  lw         $s3, 0x24($sp)
    /* 1B39C 80154F94 2000B28F */  lw         $s2, 0x20($sp)
    /* 1B3A0 80154F98 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1B3A4 80154F9C 1800B08F */  lw         $s0, 0x18($sp)
    /* 1B3A8 80154FA0 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1B3AC 80154FA4 0800E003 */  jr         $ra
    /* 1B3B0 80154FA8 00000000 */   nop
endlabel ProcessMonsters__Fv
