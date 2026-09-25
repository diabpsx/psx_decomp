.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitMonster__Fiiiii, 0x584

glabel InitMonster__Fiiiii
    /* 6F84C 8007F84C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6F850 8007F850 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6F854 8007F854 21908000 */  addu       $s2, $a0, $zero
    /* 6F858 8007F858 40101200 */  sll        $v0, $s2, 1
    /* 6F85C 8007F85C 21105200 */  addu       $v0, $v0, $s2
    /* 6F860 8007F860 80100200 */  sll        $v0, $v0, 2
    /* 6F864 8007F864 21105200 */  addu       $v0, $v0, $s2
    /* 6F868 8007F868 C0100200 */  sll        $v0, $v0, 3
    /* 6F86C 8007F86C 1080033C */  lui        $v1, %hi(monster)
    /* 6F870 8007F870 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 6F874 8007F874 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6F878 8007F878 21804300 */  addu       $s0, $v0, $v1
    /* 6F87C 8007F87C C0100600 */  sll        $v0, $a2, 3
    /* 6F880 8007F880 23104600 */  subu       $v0, $v0, $a2
    /* 6F884 8007F884 80100200 */  sll        $v0, $v0, 2
    /* 6F888 8007F888 3000A48F */  lw         $a0, 0x30($sp)
    /* 6F88C 8007F88C 1180033C */  lui        $v1, %hi(Monsters)
    /* 6F890 8007F890 BCA36324 */  addiu      $v1, $v1, %lo(Monsters)
    /* 6F894 8007F894 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6F898 8007F898 21884300 */  addu       $s1, $v0, $v1
    /* 6F89C 8007F89C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6F8A0 8007F8A0 3C0005A2 */  sb         $a1, 0x3C($s0)
    /* 6F8A4 8007F8A4 340007A2 */  sb         $a3, 0x34($s0)
    /* 6F8A8 8007F8A8 360007A2 */  sb         $a3, 0x36($s0)
    /* 6F8AC 8007F8AC 380007A2 */  sb         $a3, 0x38($s0)
    /* 6F8B0 8007F8B0 320006A2 */  sb         $a2, 0x32($s0)
    /* 6F8B4 8007F8B4 330000A2 */  sb         $zero, 0x33($s0)
    /* 6F8B8 8007F8B8 350004A2 */  sb         $a0, 0x35($s0)
    /* 6F8BC 8007F8BC 370004A2 */  sb         $a0, 0x37($s0)
    /* 6F8C0 8007F8C0 390004A2 */  sb         $a0, 0x39($s0)
    /* 6F8C4 8007F8C4 0000228E */  lw         $v0, 0x0($s1)
    /* 6F8C8 8007F8C8 00000000 */  nop
    /* 6F8CC 8007F8CC 1400428C */  lw         $v0, 0x14($v0)
    /* 6F8D0 8007F8D0 600011AE */  sw         $s1, 0x60($s0)
    /* 6F8D4 8007F8D4 5C0002AE */  sw         $v0, 0x5C($s0)
    /* 6F8D8 8007F8D8 0000228E */  lw         $v0, 0x0($s1)
    /* 6F8DC 8007F8DC 5A0000A2 */  sb         $zero, 0x5A($s0)
    /* 6F8E0 8007F8E0 640002AE */  sw         $v0, 0x64($s0)
    /* 6F8E4 8007F8E4 05002292 */  lbu        $v0, 0x5($s1)
    /* 6F8E8 8007F8E8 00000000 */  nop
    /* 6F8EC 8007F8EC 00260200 */  sll        $a0, $v0, 24
    /* 6F8F0 8007F8F0 03260400 */  sra        $a0, $a0, 24
    /* 6F8F4 8007F8F4 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 6F8F8 8007F8F8 C9F6000C */  jal        ENG_random__Fl
    /* 6F8FC 8007F8FC 3E0002A2 */   sb        $v0, 0x3E($s0)
    /* 6F900 8007F900 3F0002A2 */  sb         $v0, 0x3F($s0)
    /* 6F904 8007F904 04002292 */  lbu        $v0, 0x4($s1)
    /* 6F908 8007F908 00000000 */  nop
    /* 6F90C 8007F90C 00260200 */  sll        $a0, $v0, 24
    /* 6F910 8007F910 03260400 */  sra        $a0, $a0, 24
    /* 6F914 8007F914 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 6F918 8007F918 C9F6000C */  jal        ENG_random__Fl
    /* 6F91C 8007F91C 400002A2 */   sb        $v0, 0x40($s0)
    /* 6F920 8007F920 01004224 */  addiu      $v0, $v0, 0x1
    /* 6F924 8007F924 410002A2 */  sb         $v0, 0x41($s0)
    /* 6F928 8007F928 12002392 */  lbu        $v1, 0x12($s1)
    /* 6F92C 8007F92C 6E000224 */  addiu      $v0, $zero, 0x6E
    /* 6F930 8007F930 05006214 */  bne        $v1, $v0, .L8007F948
    /* 6F934 8007F934 00000000 */   nop
    /* 6F938 8007F938 C9F6000C */  jal        ENG_random__Fl
    /* 6F93C 8007F93C 01000424 */   addiu     $a0, $zero, 0x1
    /* 6F940 8007F940 5BFE0108 */  j          .L8007F96C
    /* 6F944 8007F944 82064224 */   addiu     $v0, $v0, 0x682
  .L8007F948:
    /* 6F948 8007F948 15002492 */  lbu        $a0, 0x15($s1)
    /* 6F94C 8007F94C 14002292 */  lbu        $v0, 0x14($s1)
    /* 6F950 8007F950 00000000 */  nop
    /* 6F954 8007F954 23208200 */  subu       $a0, $a0, $v0
    /* 6F958 8007F958 C9F6000C */  jal        ENG_random__Fl
    /* 6F95C 8007F95C 01008424 */   addiu     $a0, $a0, 0x1
    /* 6F960 8007F960 14002392 */  lbu        $v1, 0x14($s1)
    /* 6F964 8007F964 00000000 */  nop
    /* 6F968 8007F968 21104300 */  addu       $v0, $v0, $v1
  .L8007F96C:
    /* 6F96C 8007F96C 80110200 */  sll        $v0, $v0, 6
    /* 6F970 8007F970 140002AE */  sw         $v0, 0x14($s0)
    /* 6F974 8007F974 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 6F978 8007F978 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 6F97C 8007F97C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6F980 8007F980 09006214 */  bne        $v1, $v0, .L8007F9A8
    /* 6F984 8007F984 00000000 */   nop
    /* 6F988 8007F988 1400028E */  lw         $v0, 0x14($s0)
    /* 6F98C 8007F98C 00000000 */  nop
    /* 6F990 8007F990 43100200 */  sra        $v0, $v0, 1
    /* 6F994 8007F994 140002AE */  sw         $v0, 0x14($s0)
    /* 6F998 8007F998 40004228 */  slti       $v0, $v0, 0x40
    /* 6F99C 8007F99C 02004010 */  beqz       $v0, .L8007F9A8
    /* 6F9A0 8007F9A0 40000224 */   addiu     $v0, $zero, 0x40
    /* 6F9A4 8007F9A4 140002AE */  sw         $v0, 0x14($s0)
  .L8007F9A8:
    /* 6F9A8 8007F9A8 1400028E */  lw         $v0, 0x14($s0)
    /* 6F9AC 8007F9AC 00000000 */  nop
    /* 6F9B0 8007F9B0 100002AE */  sw         $v0, 0x10($s0)
    /* 6F9B4 8007F9B4 0000228E */  lw         $v0, 0x0($s1)
    /* 6F9B8 8007F9B8 00000000 */  nop
    /* 6F9BC 8007F9BC 20004290 */  lbu        $v0, 0x20($v0)
    /* 6F9C0 8007F9C0 00000000 */  nop
    /* 6F9C4 8007F9C4 4C0002A2 */  sb         $v0, 0x4C($s0)
    /* 6F9C8 8007F9C8 0000228E */  lw         $v0, 0x0($s1)
    /* 6F9CC 8007F9CC 00000000 */  nop
    /* 6F9D0 8007F9D0 24004390 */  lbu        $v1, 0x24($v0)
    /* 6F9D4 8007F9D4 01000224 */  addiu      $v0, $zero, 0x1
    /* 6F9D8 8007F9D8 490002A2 */  sb         $v0, 0x49($s0)
    /* 6F9DC 8007F9DC 040000AE */  sw         $zero, 0x4($s0)
    /* 6F9E0 8007F9E0 080000AE */  sw         $zero, 0x8($s0)
    /* 6F9E4 8007F9E4 0C0000AE */  sw         $zero, 0xC($s0)
    /* 6F9E8 8007F9E8 5B0000A2 */  sb         $zero, 0x5B($s0)
    /* 6F9EC 8007F9EC 4F0000A2 */  sb         $zero, 0x4F($s0)
    /* 6F9F0 8007F9F0 4E0000A2 */  sb         $zero, 0x4E($s0)
    /* 6F9F4 8007F9F4 460000A2 */  sb         $zero, 0x46($s0)
    /* 6F9F8 8007F9F8 4D0003A2 */  sb         $v1, 0x4D($s0)
    /* 6F9FC 8007F9FC 0000228E */  lw         $v0, 0x0($s1)
    /* 6FA00 8007FA00 00000000 */  nop
    /* 6FA04 8007FA04 1A004290 */  lbu        $v0, 0x1A($v0)
    /* 6FA08 8007FA08 00000000 */  nop
    /* 6FA0C 8007FA0C 470002A2 */  sb         $v0, 0x47($s0)
    /* 6FA10 8007FA10 0000228E */  lw         $v0, 0x0($s1)
    /* 6FA14 8007FA14 00000000 */  nop
    /* 6FA18 8007FA18 38004294 */  lhu        $v0, 0x38($v0)
    /* 6FA1C 8007FA1C 00000000 */  nop
    /* 6FA20 8007FA20 2E0002A6 */  sh         $v0, 0x2E($s0)
    /* 6FA24 8007FA24 0200422A */  slti       $v0, $s2, 0x2
    /* 6FA28 8007FA28 4E004010 */  beqz       $v0, .L8007FB64
    /* 6FA2C 8007FA2C 40101200 */   sll       $v0, $s2, 1
    /* 6FA30 8007FA30 21105200 */  addu       $v0, $v0, $s2
    /* 6FA34 8007FA34 80100200 */  sll        $v0, $v0, 2
    /* 6FA38 8007FA38 21285200 */  addu       $a1, $v0, $s2
    /* 6FA3C 8007FA3C 00110500 */  sll        $v0, $a1, 4
    /* 6FA40 8007FA40 23105200 */  subu       $v0, $v0, $s2
    /* 6FA44 8007FA44 80100200 */  sll        $v0, $v0, 2
    /* 6FA48 8007FA48 21105200 */  addu       $v0, $v0, $s2
    /* 6FA4C 8007FA4C C0380200 */  sll        $a3, $v0, 3
    /* 6FA50 8007FA50 0E80013C */  lui        $at, %hi(plr + 0x86)
    /* 6FA54 8007FA54 21082700 */  addu       $at, $at, $a3
    /* 6FA58 8007FA58 BEA52380 */  lb         $v1, %lo(plr + 0x86)($at)
    /* 6FA5C 8007FA5C 0E80013C */  lui        $at, %hi(plr + 0x19C0)
    /* 6FA60 8007FA60 21082700 */  addu       $at, $at, $a3
    /* 6FA64 8007FA64 F8BE2280 */  lb         $v0, %lo(plr + 0x19C0)($at)
    /* 6FA68 8007FA68 00000000 */  nop
    /* 6FA6C 8007FA6C 21306200 */  addu       $a2, $v1, $v0
    /* 6FA70 8007FA70 0200C104 */  bgez       $a2, .L8007FA7C
    /* 6FA74 8007FA74 00000000 */   nop
    /* 6FA78 8007FA78 21300000 */  addu       $a2, $zero, $zero
  .L8007FA7C:
    /* 6FA7C 8007FA7C 0000228E */  lw         $v0, 0x0($s1)
    /* 6FA80 8007FA80 00000000 */  nop
    /* 6FA84 8007FA84 25004290 */  lbu        $v0, 0x25($v0)
    /* 6FA88 8007FA88 00000000 */  nop
    /* 6FA8C 8007FA8C 500002A2 */  sb         $v0, 0x50($s0)
    /* 6FA90 8007FA90 0000228E */  lw         $v0, 0x0($s1)
    /* 6FA94 8007FA94 00000000 */  nop
    /* 6FA98 8007FA98 27004290 */  lbu        $v0, 0x27($v0)
    /* 6FA9C 8007FA9C 00000000 */  nop
    /* 6FAA0 8007FAA0 510002A2 */  sb         $v0, 0x51($s0)
    /* 6FAA4 8007FAA4 0000228E */  lw         $v0, 0x0($s1)
    /* 6FAA8 8007FAA8 00000000 */  nop
    /* 6FAAC 8007FAAC 28004290 */  lbu        $v0, 0x28($v0)
    /* 6FAB0 8007FAB0 5555043C */  lui        $a0, (0x55555556 >> 16)
    /* 6FAB4 8007FAB4 520002A2 */  sb         $v0, 0x52($s0)
    /* 6FAB8 8007FAB8 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 6FABC 8007FABC 21082700 */  addu       $at, $at, $a3
    /* 6FAC0 8007FAC0 6CA6238C */  lw         $v1, %lo(plr + 0x134)($at)
    /* 6FAC4 8007FAC4 56558434 */  ori        $a0, $a0, (0x55555556 & 0xFFFF)
    /* 6FAC8 8007FAC8 18006400 */  mult       $v1, $a0
    /* 6FACC 8007FACC C0280500 */  sll        $a1, $a1, 3
    /* 6FAD0 8007FAD0 19000224 */  addiu      $v0, $zero, 0x19
    /* 6FAD4 8007FAD4 1080013C */  lui        $at, %hi(monster + 0x48)
    /* 6FAD8 8007FAD8 21082500 */  addu       $at, $at, $a1
    /* 6FADC 8007FADC DC5322A0 */  sb         $v0, %lo(monster + 0x48)($at)
    /* 6FAE0 8007FAE0 40120600 */  sll        $v0, $a2, 9
    /* 6FAE4 8007FAE4 C31F0300 */  sra        $v1, $v1, 31
    /* 6FAE8 8007FAE8 C0210600 */  sll        $a0, $a2, 7
    /* 6FAEC 8007FAEC 21104400 */  addu       $v0, $v0, $a0
    /* 6FAF0 8007FAF0 10400000 */  mfhi       $t0
    /* 6FAF4 8007FAF4 23180301 */  subu       $v1, $t0, $v1
    /* 6FAF8 8007FAF8 40180300 */  sll        $v1, $v1, 1
    /* 6FAFC 8007FAFC 21186200 */  addu       $v1, $v1, $v0
    /* 6FB00 8007FB00 40100600 */  sll        $v0, $a2, 1
    /* 6FB04 8007FB04 08004424 */  addiu      $a0, $v0, 0x8
    /* 6FB08 8007FB08 1080013C */  lui        $at, %hi(monster + 0x14)
    /* 6FB0C 8007FB0C 21082500 */  addu       $at, $at, $a1
    /* 6FB10 8007FB10 A85323AC */  sw         $v1, %lo(monster + 0x14)($at)
    /* 6FB14 8007FB14 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 6FB18 8007FB18 21082700 */  addu       $at, $at, $a3
    /* 6FB1C 8007FB1C 74A62390 */  lbu        $v1, %lo(plr + 0x13C)($at)
    /* 6FB20 8007FB20 10004224 */  addiu      $v0, $v0, 0x10
    /* 6FB24 8007FB24 1080013C */  lui        $at, %hi(monster + 0x52)
    /* 6FB28 8007FB28 21082500 */  addu       $at, $at, $a1
    /* 6FB2C 8007FB2C E65322A0 */  sb         $v0, %lo(monster + 0x52)($at)
    /* 6FB30 8007FB30 80100600 */  sll        $v0, $a2, 2
    /* 6FB34 8007FB34 21104600 */  addu       $v0, $v0, $a2
    /* 6FB38 8007FB38 1080013C */  lui        $at, %hi(monster + 0x51)
    /* 6FB3C 8007FB3C 21082500 */  addu       $at, $at, $a1
    /* 6FB40 8007FB40 E55324A0 */  sb         $a0, %lo(monster + 0x51)($at)
    /* 6FB44 8007FB44 40180300 */  sll        $v1, $v1, 1
    /* 6FB48 8007FB48 28006324 */  addiu      $v1, $v1, 0x28
    /* 6FB4C 8007FB4C 21186200 */  addu       $v1, $v1, $v0
    /* 6FB50 8007FB50 1080013C */  lui        $at, %hi(monster + 0x50)
    /* 6FB54 8007FB54 21082500 */  addu       $at, $at, $a1
    /* 6FB58 8007FB58 E45323A0 */  sb         $v1, %lo(monster + 0x50)($at)
    /* 6FB5C 8007FB5C E8FE0108 */  j          .L8007FBA0
    /* 6FB60 8007FB60 00000000 */   nop
  .L8007FB64:
    /* 6FB64 8007FB64 0000228E */  lw         $v0, 0x0($s1)
    /* 6FB68 8007FB68 00000000 */  nop
    /* 6FB6C 8007FB6C 25004290 */  lbu        $v0, 0x25($v0)
    /* 6FB70 8007FB70 00000000 */  nop
    /* 6FB74 8007FB74 500002A2 */  sb         $v0, 0x50($s0)
    /* 6FB78 8007FB78 0000228E */  lw         $v0, 0x0($s1)
    /* 6FB7C 8007FB7C 00000000 */  nop
    /* 6FB80 8007FB80 27004290 */  lbu        $v0, 0x27($v0)
    /* 6FB84 8007FB84 00000000 */  nop
    /* 6FB88 8007FB88 510002A2 */  sb         $v0, 0x51($s0)
    /* 6FB8C 8007FB8C 0000228E */  lw         $v0, 0x0($s1)
    /* 6FB90 8007FB90 00000000 */  nop
    /* 6FB94 8007FB94 28004290 */  lbu        $v0, 0x28($v0)
    /* 6FB98 8007FB98 00000000 */  nop
    /* 6FB9C 8007FB9C 520002A2 */  sb         $v0, 0x52($s0)
  .L8007FBA0:
    /* 6FBA0 8007FBA0 0000228E */  lw         $v0, 0x0($s1)
    /* 6FBA4 8007FBA4 00000000 */  nop
    /* 6FBA8 8007FBA8 29004290 */  lbu        $v0, 0x29($v0)
    /* 6FBAC 8007FBAC 00000000 */  nop
    /* 6FBB0 8007FBB0 530002A2 */  sb         $v0, 0x53($s0)
    /* 6FBB4 8007FBB4 0000228E */  lw         $v0, 0x0($s1)
    /* 6FBB8 8007FBB8 00000000 */  nop
    /* 6FBBC 8007FBBC 2B004290 */  lbu        $v0, 0x2B($v0)
    /* 6FBC0 8007FBC0 00000000 */  nop
    /* 6FBC4 8007FBC4 540002A2 */  sb         $v0, 0x54($s0)
    /* 6FBC8 8007FBC8 0000228E */  lw         $v0, 0x0($s1)
    /* 6FBCC 8007FBCC 00000000 */  nop
    /* 6FBD0 8007FBD0 2C004290 */  lbu        $v0, 0x2C($v0)
    /* 6FBD4 8007FBD4 00000000 */  nop
    /* 6FBD8 8007FBD8 550002A2 */  sb         $v0, 0x55($s0)
    /* 6FBDC 8007FBDC 0000228E */  lw         $v0, 0x0($s1)
    /* 6FBE0 8007FBE0 00000000 */  nop
    /* 6FBE4 8007FBE4 2D004290 */  lbu        $v0, 0x2D($v0)
    /* 6FBE8 8007FBE8 00000000 */  nop
    /* 6FBEC 8007FBEC 480002A2 */  sb         $v0, 0x48($s0)
    /* 6FBF0 8007FBF0 0000228E */  lw         $v0, 0x0($s1)
    /* 6FBF4 8007FBF4 00000000 */  nop
    /* 6FBF8 8007FBF8 30004294 */  lhu        $v0, 0x30($v0)
    /* 6FBFC 8007FBFC 560000A2 */  sb         $zero, 0x56($s0)
    /* 6FC00 8007FC00 570000A2 */  sb         $zero, 0x57($s0)
    /* 6FC04 8007FC04 300002A6 */  sh         $v0, 0x30($s0)
    /* 6FC08 8007FC08 0000228E */  lw         $v0, 0x0($s1)
    /* 6FC0C 8007FC0C 4C000392 */  lbu        $v1, 0x4C($s0)
    /* 6FC10 8007FC10 22004294 */  lhu        $v0, 0x22($v0)
    /* 6FC14 8007FC14 000000AE */  sw         $zero, 0x0($s0)
    /* 6FC18 8007FC18 2C0002A6 */  sh         $v0, 0x2C($s0)
    /* 6FC1C 8007FC1C 0C000224 */  addiu      $v0, $zero, 0xC
    /* 6FC20 8007FC20 09006214 */  bne        $v1, $v0, .L8007FC48
    /* 6FC24 8007FC24 05000224 */   addiu     $v0, $zero, 0x5
    /* 6FC28 8007FC28 5A0002A2 */  sb         $v0, 0x5A($s0)
    /* 6FC2C 8007FC2C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6FC30 8007FC30 410002A2 */  sb         $v0, 0x41($s0)
    /* 6FC34 8007FC34 2C000296 */  lhu        $v0, 0x2C($s0)
    /* 6FC38 8007FC38 07000324 */  addiu      $v1, $zero, 0x7
    /* 6FC3C 8007FC3C 330003A2 */  sb         $v1, 0x33($s0)
    /* 6FC40 8007FC40 04004234 */  ori        $v0, $v0, 0x4
    /* 6FC44 8007FC44 2C0002A6 */  sh         $v0, 0x2C($s0)
  .L8007FC48:
    /* 6FC48 8007FC48 1280033C */  lui        $v1, %hi(gnDifficulty)
    /* 6FC4C 8007FC4C 08C1638C */  lw         $v1, %lo(gnDifficulty)($v1)
    /* 6FC50 8007FC50 01000224 */  addiu      $v0, $zero, 0x1
    /* 6FC54 8007FC54 2B006214 */  bne        $v1, $v0, .L8007FD04
    /* 6FC58 8007FC58 02000224 */   addiu     $v0, $zero, 0x2
    /* 6FC5C 8007FC5C 1400038E */  lw         $v1, 0x14($s0)
    /* 6FC60 8007FC60 00000000 */  nop
    /* 6FC64 8007FC64 40100300 */  sll        $v0, $v1, 1
    /* 6FC68 8007FC68 21104300 */  addu       $v0, $v0, $v1
    /* 6FC6C 8007FC6C 64004224 */  addiu      $v0, $v0, 0x64
    /* 6FC70 8007FC70 140002AE */  sw         $v0, 0x14($s0)
    /* 6FC74 8007FC74 100002AE */  sw         $v0, 0x10($s0)
    /* 6FC78 8007FC78 47000292 */  lbu        $v0, 0x47($s0)
    /* 6FC7C 8007FC7C 2E000396 */  lhu        $v1, 0x2E($s0)
    /* 6FC80 8007FC80 0F004224 */  addiu      $v0, $v0, 0xF
    /* 6FC84 8007FC84 40180300 */  sll        $v1, $v1, 1
    /* 6FC88 8007FC88 470002A2 */  sb         $v0, 0x47($s0)
    /* 6FC8C 8007FC8C 50000292 */  lbu        $v0, 0x50($s0)
    /* 6FC90 8007FC90 D0076324 */  addiu      $v1, $v1, 0x7D0
    /* 6FC94 8007FC94 2E0003A6 */  sh         $v1, 0x2E($s0)
    /* 6FC98 8007FC98 51000392 */  lbu        $v1, 0x51($s0)
    /* 6FC9C 8007FC9C 55004224 */  addiu      $v0, $v0, 0x55
    /* 6FCA0 8007FCA0 40180300 */  sll        $v1, $v1, 1
    /* 6FCA4 8007FCA4 500002A2 */  sb         $v0, 0x50($s0)
    /* 6FCA8 8007FCA8 52000292 */  lbu        $v0, 0x52($s0)
    /* 6FCAC 8007FCAC 04006324 */  addiu      $v1, $v1, 0x4
    /* 6FCB0 8007FCB0 510003A2 */  sb         $v1, 0x51($s0)
    /* 6FCB4 8007FCB4 54000392 */  lbu        $v1, 0x54($s0)
    /* 6FCB8 8007FCB8 40100200 */  sll        $v0, $v0, 1
    /* 6FCBC 8007FCBC 04004224 */  addiu      $v0, $v0, 0x4
    /* 6FCC0 8007FCC0 40180300 */  sll        $v1, $v1, 1
    /* 6FCC4 8007FCC4 520002A2 */  sb         $v0, 0x52($s0)
    /* 6FCC8 8007FCC8 53000292 */  lbu        $v0, 0x53($s0)
    /* 6FCCC 8007FCCC 04006324 */  addiu      $v1, $v1, 0x4
    /* 6FCD0 8007FCD0 540003A2 */  sb         $v1, 0x54($s0)
    /* 6FCD4 8007FCD4 48000392 */  lbu        $v1, 0x48($s0)
    /* 6FCD8 8007FCD8 55004224 */  addiu      $v0, $v0, 0x55
    /* 6FCDC 8007FCDC 530002A2 */  sb         $v0, 0x53($s0)
    /* 6FCE0 8007FCE0 55000292 */  lbu        $v0, 0x55($s0)
    /* 6FCE4 8007FCE4 32006324 */  addiu      $v1, $v1, 0x32
    /* 6FCE8 8007FCE8 480003A2 */  sb         $v1, 0x48($s0)
    /* 6FCEC 8007FCEC 40100200 */  sll        $v0, $v0, 1
    /* 6FCF0 8007FCF0 04004224 */  addiu      $v0, $v0, 0x4
    /* 6FCF4 8007FCF4 550002A2 */  sb         $v0, 0x55($s0)
    /* 6FCF8 8007FCF8 1280033C */  lui        $v1, %hi(gnDifficulty)
    /* 6FCFC 8007FCFC 08C1638C */  lw         $v1, %lo(gnDifficulty)($v1)
    /* 6FD00 8007FD00 02000224 */  addiu      $v0, $zero, 0x2
  .L8007FD04:
    /* 6FD04 8007FD04 2B006214 */  bne        $v1, $v0, .L8007FDB4
    /* 6FD08 8007FD08 00000000 */   nop
    /* 6FD0C 8007FD0C 1400028E */  lw         $v0, 0x14($s0)
    /* 6FD10 8007FD10 2E000396 */  lhu        $v1, 0x2E($s0)
    /* 6FD14 8007FD14 80100200 */  sll        $v0, $v0, 2
    /* 6FD18 8007FD18 C8004224 */  addiu      $v0, $v0, 0xC8
    /* 6FD1C 8007FD1C 80180300 */  sll        $v1, $v1, 2
    /* 6FD20 8007FD20 140002AE */  sw         $v0, 0x14($s0)
    /* 6FD24 8007FD24 100002AE */  sw         $v0, 0x10($s0)
    /* 6FD28 8007FD28 47000292 */  lbu        $v0, 0x47($s0)
    /* 6FD2C 8007FD2C A00F6324 */  addiu      $v1, $v1, 0xFA0
    /* 6FD30 8007FD30 2E0003A6 */  sh         $v1, 0x2E($s0)
    /* 6FD34 8007FD34 51000392 */  lbu        $v1, 0x51($s0)
    /* 6FD38 8007FD38 1E004224 */  addiu      $v0, $v0, 0x1E
    /* 6FD3C 8007FD3C 80180300 */  sll        $v1, $v1, 2
    /* 6FD40 8007FD40 470002A2 */  sb         $v0, 0x47($s0)
    /* 6FD44 8007FD44 50000292 */  lbu        $v0, 0x50($s0)
    /* 6FD48 8007FD48 06006324 */  addiu      $v1, $v1, 0x6
    /* 6FD4C 8007FD4C 510003A2 */  sb         $v1, 0x51($s0)
    /* 6FD50 8007FD50 54000392 */  lbu        $v1, 0x54($s0)
    /* 6FD54 8007FD54 78004224 */  addiu      $v0, $v0, 0x78
    /* 6FD58 8007FD58 80180300 */  sll        $v1, $v1, 2
    /* 6FD5C 8007FD5C 500002A2 */  sb         $v0, 0x50($s0)
    /* 6FD60 8007FD60 52000292 */  lbu        $v0, 0x52($s0)
    /* 6FD64 8007FD64 06006324 */  addiu      $v1, $v1, 0x6
    /* 6FD68 8007FD68 540003A2 */  sb         $v1, 0x54($s0)
    /* 6FD6C 8007FD6C 80100200 */  sll        $v0, $v0, 2
    /* 6FD70 8007FD70 06004224 */  addiu      $v0, $v0, 0x6
    /* 6FD74 8007FD74 520002A2 */  sb         $v0, 0x52($s0)
    /* 6FD78 8007FD78 53000292 */  lbu        $v0, 0x53($s0)
    /* 6FD7C 8007FD7C 48000392 */  lbu        $v1, 0x48($s0)
    /* 6FD80 8007FD80 78004224 */  addiu      $v0, $v0, 0x78
    /* 6FD84 8007FD84 530002A2 */  sb         $v0, 0x53($s0)
    /* 6FD88 8007FD88 55000292 */  lbu        $v0, 0x55($s0)
    /* 6FD8C 8007FD8C 50006324 */  addiu      $v1, $v1, 0x50
    /* 6FD90 8007FD90 480003A2 */  sb         $v1, 0x48($s0)
    /* 6FD94 8007FD94 80100200 */  sll        $v0, $v0, 2
    /* 6FD98 8007FD98 06004224 */  addiu      $v0, $v0, 0x6
    /* 6FD9C 8007FD9C 550002A2 */  sb         $v0, 0x55($s0)
    /* 6FDA0 8007FDA0 0000228E */  lw         $v0, 0x0($s1)
    /* 6FDA4 8007FDA4 00000000 */  nop
    /* 6FDA8 8007FDA8 32004294 */  lhu        $v0, 0x32($v0)
    /* 6FDAC 8007FDAC 00000000 */  nop
    /* 6FDB0 8007FDB0 300002A6 */  sh         $v0, 0x30($s0)
  .L8007FDB4:
    /* 6FDB4 8007FDB4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6FDB8 8007FDB8 1800B28F */  lw         $s2, 0x18($sp)
    /* 6FDBC 8007FDBC 1400B18F */  lw         $s1, 0x14($sp)
    /* 6FDC0 8007FDC0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6FDC4 8007FDC4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6FDC8 8007FDC8 0800E003 */  jr         $ra
    /* 6FDCC 8007FDCC 00000000 */   nop
endlabel InitMonster__Fiiiii
