.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001CE94, 0x2C4

glabel func_8001CE94
    /* CE94 8001CE94 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* CE98 8001CE98 01000424 */  addiu      $a0, $zero, 0x1
    /* CE9C 8001CE9C 10000524 */  addiu      $a1, $zero, 0x10
    /* CEA0 8001CEA0 2000B0AF */  sw         $s0, 0x20($sp)
    /* CEA4 8001CEA4 1380103C */  lui        $s0, %hi(D_80131D70)
    /* CEA8 8001CEA8 701D1026 */  addiu      $s0, $s0, %lo(D_80131D70)
    /* CEAC 8001CEAC 21300002 */  addu       $a2, $s0, $zero
    /* CEB0 8001CEB0 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* CEB4 8001CEB4 3800B6AF */  sw         $s6, 0x38($sp)
    /* CEB8 8001CEB8 3400B5AF */  sw         $s5, 0x34($sp)
    /* CEBC 8001CEBC 3000B4AF */  sw         $s4, 0x30($sp)
    /* CEC0 8001CEC0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* CEC4 8001CEC4 2800B2AF */  sw         $s2, 0x28($sp)
    /* CEC8 8001CEC8 2675000C */  jal        func_8001D498
    /* CECC 8001CECC 2400B1AF */   sw        $s1, 0x24($sp)
    /* CED0 8001CED0 21884000 */  addu       $s1, $v0, $zero
    /* CED4 8001CED4 01000224 */  addiu      $v0, $zero, 0x1
    /* CED8 8001CED8 0B002212 */  beq        $s1, $v0, .L8001CF08
    /* CEDC 8001CEDC 01000426 */   addiu     $a0, $s0, 0x1
    /* CEE0 8001CEE0 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CEE4 8001CEE4 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CEE8 8001CEE8 00000000 */  nop
    /* CEEC 8001CEEC 90004018 */  blez       $v0, .L8001D130
    /* CEF0 8001CEF0 21100000 */   addu      $v0, $zero, $zero
    /* CEF4 8001CEF4 1180043C */  lui        $a0, %hi(D_8010E554)
    /* CEF8 8001CEF8 9367000C */  jal        printf
    /* CEFC 8001CEFC 54E58424 */   addiu     $a0, $a0, %lo(D_8010E554)
    /* CF00 8001CF00 4C740008 */  j          .L8001D130
    /* CF04 8001CF04 21100000 */   addu      $v0, $zero, $zero
  .L8001CF08:
    /* CF08 8001CF08 1180053C */  lui        $a1, %hi(D_8010E580)
    /* CF0C 8001CF0C 80E5A524 */  addiu      $a1, $a1, %lo(D_8010E580)
    /* CF10 8001CF10 4375000C */  jal        strncmp
    /* CF14 8001CF14 05000624 */   addiu     $a2, $zero, 0x5
    /* CF18 8001CF18 0B004010 */  beqz       $v0, .L8001CF48
    /* CF1C 8001CF1C 00000000 */   nop
    /* CF20 8001CF20 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CF24 8001CF24 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CF28 8001CF28 00000000 */  nop
    /* CF2C 8001CF2C 80004018 */  blez       $v0, .L8001D130
    /* CF30 8001CF30 21100000 */   addu      $v0, $zero, $zero
    /* CF34 8001CF34 1180043C */  lui        $a0, %hi(D_8010E588)
    /* CF38 8001CF38 9367000C */  jal        printf
    /* CF3C 8001CF3C 88E58424 */   addiu     $a0, $a0, %lo(D_8010E588)
    /* CF40 8001CF40 4C740008 */  j          .L8001D130
    /* CF44 8001CF44 21100000 */   addu      $v0, $zero, $zero
  .L8001CF48:
    /* CF48 8001CF48 8F00028A */  lwl        $v0, 0x8F($s0)
    /* CF4C 8001CF4C 8C00029A */  lwr        $v0, 0x8C($s0)
    /* CF50 8001CF50 00000000 */  nop
    /* CF54 8001CF54 1B00A2AB */  swl        $v0, 0x1B($sp)
    /* CF58 8001CF58 1800A2BB */  swr        $v0, 0x18($sp)
    /* CF5C 8001CF5C 01000424 */  addiu      $a0, $zero, 0x1
    /* CF60 8001CF60 1800A58F */  lw         $a1, 0x18($sp)
    /* CF64 8001CF64 2675000C */  jal        func_8001D498
    /* CF68 8001CF68 21300002 */   addu      $a2, $s0, $zero
    /* CF6C 8001CF6C 0C005110 */  beq        $v0, $s1, .L8001CFA0
    /* CF70 8001CF70 00000000 */   nop
    /* CF74 8001CF74 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CF78 8001CF78 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CF7C 8001CF7C 00000000 */  nop
    /* CF80 8001CF80 6B004018 */  blez       $v0, .L8001D130
    /* CF84 8001CF84 21100000 */   addu      $v0, $zero, $zero
    /* CF88 8001CF88 1800A58F */  lw         $a1, 0x18($sp)
    /* CF8C 8001CF8C 1180043C */  lui        $a0, %hi(D_8010E5B8)
    /* CF90 8001CF90 9367000C */  jal        printf
    /* CF94 8001CF94 B8E58424 */   addiu     $a0, $a0, %lo(D_8010E5B8)
    /* CF98 8001CF98 4C740008 */  j          .L8001D130
    /* CF9C 8001CF9C 21100000 */   addu      $v0, $zero, $zero
  .L8001CFA0:
    /* CFA0 8001CFA0 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CFA4 8001CFA4 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CFA8 8001CFA8 00000000 */  nop
    /* CFAC 8001CFAC 02004228 */  slti       $v0, $v0, 0x2
    /* CFB0 8001CFB0 04004014 */  bnez       $v0, .L8001CFC4
    /* CFB4 8001CFB4 21880002 */   addu      $s1, $s0, $zero
    /* CFB8 8001CFB8 1180043C */  lui        $a0, %hi(D_8010E5DC)
    /* CFBC 8001CFBC 9367000C */  jal        printf
    /* CFC0 8001CFC0 DCE58424 */   addiu     $a0, $a0, %lo(D_8010E5DC)
  .L8001CFC4:
    /* CFC4 8001CFC4 00082326 */  addiu      $v1, $s1, 0x800
    /* CFC8 8001CFC8 2B102302 */  sltu       $v0, $s1, $v1
    /* CFCC 8001CFCC 42004010 */  beqz       $v0, .L8001D0D8
    /* CFD0 8001CFD0 21380000 */   addu      $a3, $zero, $zero
    /* CFD4 8001CFD4 1380143C */  lui        $s4, %hi(D_80130778)
    /* CFD8 8001CFD8 78079426 */  addiu      $s4, $s4, %lo(D_80130778)
    /* CFDC 8001CFDC 04009626 */  addiu      $s6, $s4, 0x4
    /* CFE0 8001CFE0 21A86000 */  addu       $s5, $v1, $zero
  .L8001CFE4:
    /* CFE4 8001CFE4 00002292 */  lbu        $v0, 0x0($s1)
    /* CFE8 8001CFE8 00000000 */  nop
    /* CFEC 8001CFEC 3A004010 */  beqz       $v0, .L8001D0D8
    /* CFF0 8001CFF0 40100700 */   sll       $v0, $a3, 1
    /* CFF4 8001CFF4 21104700 */  addu       $v0, $v0, $a3
    /* CFF8 8001CFF8 80100200 */  sll        $v0, $v0, 2
    /* CFFC 8001CFFC 23104700 */  subu       $v0, $v0, $a3
    /* D000 8001D000 80800200 */  sll        $s0, $v0, 2
    /* D004 8001D004 21101402 */  addu       $v0, $s0, $s4
    /* D008 8001D008 0500238A */  lwl        $v1, 0x5($s1)
    /* D00C 8001D00C 0200239A */  lwr        $v1, 0x2($s1)
    /* D010 8001D010 00000000 */  nop
    /* D014 8001D014 030043A8 */  swl        $v1, 0x3($v0)
    /* D018 8001D018 000043B8 */  swr        $v1, 0x0($v0)
    /* D01C 8001D01C 21901602 */  addu       $s2, $s0, $s6
    /* D020 8001D020 21204002 */  addu       $a0, $s2, $zero
    /* D024 8001D024 06002292 */  lbu        $v0, 0x6($s1)
    /* D028 8001D028 0100F324 */  addiu      $s3, $a3, 0x1
    /* D02C 8001D02C 1380013C */  lui        $at, %hi(D_80130770)
    /* D030 8001D030 21083000 */  addu       $at, $at, $s0
    /* D034 8001D034 700733AC */  sw         $s3, %lo(D_80130770)($at)
    /* D038 8001D038 1380013C */  lui        $at, %hi(D_80130774)
    /* D03C 8001D03C 21083000 */  addu       $at, $at, $s0
    /* D040 8001D040 740722AC */  sw         $v0, %lo(D_80130774)($at)
    /* D044 8001D044 00002692 */  lbu        $a2, 0x0($s1)
    /* D048 8001D048 8B67000C */  jal        memcpy
    /* D04C 8001D04C 08002526 */   addiu     $a1, $s1, 0x8
    /* D050 8001D050 00002292 */  lbu        $v0, 0x0($s1)
    /* D054 8001D054 00000000 */  nop
    /* D058 8001D058 21104202 */  addu       $v0, $s2, $v0
    /* D05C 8001D05C 000040A0 */  sb         $zero, 0x0($v0)
    /* D060 8001D060 00002392 */  lbu        $v1, 0x0($s1)
    /* D064 8001D064 00000000 */  nop
    /* D068 8001D068 01006230 */  andi       $v0, $v1, 0x1
    /* D06C 8001D06C 08004224 */  addiu      $v0, $v0, 0x8
    /* D070 8001D070 21186200 */  addu       $v1, $v1, $v0
    /* D074 8001D074 0B80023C */  lui        $v0, %hi(CD_debug)
    /* D078 8001D078 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* D07C 8001D07C 00000000 */  nop
    /* D080 8001D080 02004228 */  slti       $v0, $v0, 0x2
    /* D084 8001D084 0E004014 */  bnez       $v0, .L8001D0C0
    /* D088 8001D088 21882302 */   addu      $s1, $s1, $v1
    /* D08C 8001D08C 1380053C */  lui        $a1, %hi(D_80130778)
    /* D090 8001D090 2128B000 */  addu       $a1, $a1, $s0
    /* D094 8001D094 7807A58C */  lw         $a1, %lo(D_80130778)($a1)
    /* D098 8001D098 1380063C */  lui        $a2, %hi(D_80130770)
    /* D09C 8001D09C 2130D000 */  addu       $a2, $a2, $s0
    /* D0A0 8001D0A0 7007C68C */  lw         $a2, %lo(D_80130770)($a2)
    /* D0A4 8001D0A4 1380073C */  lui        $a3, %hi(D_80130774)
    /* D0A8 8001D0A8 2138F000 */  addu       $a3, $a3, $s0
    /* D0AC 8001D0AC 7407E78C */  lw         $a3, %lo(D_80130774)($a3)
    /* D0B0 8001D0B0 1180043C */  lui        $a0, %hi(D_8010E5FC)
    /* D0B4 8001D0B4 FCE58424 */  addiu      $a0, $a0, %lo(D_8010E5FC)
    /* D0B8 8001D0B8 9367000C */  jal        printf
    /* D0BC 8001D0BC 1000B2AF */   sw        $s2, 0x10($sp)
  .L8001D0C0:
    /* D0C0 8001D0C0 21386002 */  addu       $a3, $s3, $zero
    /* D0C4 8001D0C4 8000E228 */  slti       $v0, $a3, 0x80
    /* D0C8 8001D0C8 0D004010 */  beqz       $v0, .L8001D100
    /* D0CC 8001D0CC 2B103502 */   sltu      $v0, $s1, $s5
    /* D0D0 8001D0D0 C4FF4014 */  bnez       $v0, .L8001CFE4
    /* D0D4 8001D0D4 00000000 */   nop
  .L8001D0D8:
    /* D0D8 8001D0D8 8000E228 */  slti       $v0, $a3, 0x80
    /* D0DC 8001D0DC 08004010 */  beqz       $v0, .L8001D100
    /* D0E0 8001D0E0 40100700 */   sll       $v0, $a3, 1
    /* D0E4 8001D0E4 21104700 */  addu       $v0, $v0, $a3
    /* D0E8 8001D0E8 80100200 */  sll        $v0, $v0, 2
    /* D0EC 8001D0EC 23104700 */  subu       $v0, $v0, $a3
    /* D0F0 8001D0F0 80100200 */  sll        $v0, $v0, 2
    /* D0F4 8001D0F4 1380013C */  lui        $at, %hi(D_80130774)
    /* D0F8 8001D0F8 21082200 */  addu       $at, $at, $v0
    /* D0FC 8001D0FC 740720AC */  sw         $zero, %lo(D_80130774)($at)
  .L8001D100:
    /* D100 8001D100 0B80023C */  lui        $v0, %hi(CD_debug)
    /* D104 8001D104 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* D108 8001D108 0B80013C */  lui        $at, %hi(D_800B620C)
    /* D10C 8001D10C 0C6220AC */  sw         $zero, %lo(D_800B620C)($at)
    /* D110 8001D110 02004228 */  slti       $v0, $v0, 0x2
    /* D114 8001D114 06004014 */  bnez       $v0, .L8001D130
    /* D118 8001D118 01000224 */   addiu     $v0, $zero, 0x1
    /* D11C 8001D11C 1180043C */  lui        $a0, %hi(D_8010E610)
    /* D120 8001D120 10E68424 */  addiu      $a0, $a0, %lo(D_8010E610)
    /* D124 8001D124 9367000C */  jal        printf
    /* D128 8001D128 2128E000 */   addu      $a1, $a3, $zero
    /* D12C 8001D12C 01000224 */  addiu      $v0, $zero, 0x1
  .L8001D130:
    /* D130 8001D130 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* D134 8001D134 3800B68F */  lw         $s6, 0x38($sp)
    /* D138 8001D138 3400B58F */  lw         $s5, 0x34($sp)
    /* D13C 8001D13C 3000B48F */  lw         $s4, 0x30($sp)
    /* D140 8001D140 2C00B38F */  lw         $s3, 0x2C($sp)
    /* D144 8001D144 2800B28F */  lw         $s2, 0x28($sp)
    /* D148 8001D148 2400B18F */  lw         $s1, 0x24($sp)
    /* D14C 8001D14C 2000B08F */  lw         $s0, 0x20($sp)
    /* D150 8001D150 0800E003 */  jr         $ra
    /* D154 8001D154 4000BD27 */   addiu     $sp, $sp, 0x40
endlabel func_8001CE94
