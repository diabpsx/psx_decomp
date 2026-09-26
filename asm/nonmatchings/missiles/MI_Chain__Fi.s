.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Chain__Fi, 0x268

glabel MI_Chain__Fi
    /* CEE8 80146AE0 58FFBD27 */  addiu      $sp, $sp, -0xA8
    /* CEEC 80146AE4 80100400 */  sll        $v0, $a0, 2
    /* CEF0 80146AE8 21104400 */  addu       $v0, $v0, $a0
    /* CEF4 80146AEC 80100200 */  sll        $v0, $v0, 2
    /* CEF8 80146AF0 23104400 */  subu       $v0, $v0, $a0
    /* CEFC 80146AF4 80100200 */  sll        $v0, $v0, 2
    /* CF00 80146AF8 1080033C */  lui        $v1, %hi(missile)
    /* CF04 80146AFC 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* CF08 80146B00 9000B4AF */  sw         $s4, 0x90($sp)
    /* CF0C 80146B04 21A04300 */  addu       $s4, $v0, $v1
    /* CF10 80146B08 2800A727 */  addiu      $a3, $sp, 0x28
    /* CF14 80146B0C 1280063C */  lui        $a2, %hi(D_80119DE4)
    /* CF18 80146B10 E49DC624 */  addiu      $a2, $a2, %lo(D_80119DE4)
    /* CF1C 80146B14 4000C824 */  addiu      $t0, $a2, 0x40
    /* CF20 80146B18 A400BFAF */  sw         $ra, 0xA4($sp)
    /* CF24 80146B1C A000BEAF */  sw         $fp, 0xA0($sp)
    /* CF28 80146B20 9C00B7AF */  sw         $s7, 0x9C($sp)
    /* CF2C 80146B24 9800B6AF */  sw         $s6, 0x98($sp)
    /* CF30 80146B28 9400B5AF */  sw         $s5, 0x94($sp)
    /* CF34 80146B2C 8C00B3AF */  sw         $s3, 0x8C($sp)
    /* CF38 80146B30 8800B2AF */  sw         $s2, 0x88($sp)
    /* CF3C 80146B34 8400B1AF */  sw         $s1, 0x84($sp)
    /* CF40 80146B38 8000B0AF */  sw         $s0, 0x80($sp)
  .L80146B3C:
    /* CF44 80146B3C 0000C28C */  lw         $v0, 0x0($a2)
    /* CF48 80146B40 0400C38C */  lw         $v1, 0x4($a2)
    /* CF4C 80146B44 0800C48C */  lw         $a0, 0x8($a2)
    /* CF50 80146B48 0C00C58C */  lw         $a1, 0xC($a2)
    /* CF54 80146B4C 0000E2AC */  sw         $v0, 0x0($a3)
    /* CF58 80146B50 0400E3AC */  sw         $v1, 0x4($a3)
    /* CF5C 80146B54 0800E4AC */  sw         $a0, 0x8($a3)
    /* CF60 80146B58 0C00E5AC */  sw         $a1, 0xC($a3)
    /* CF64 80146B5C 1000C624 */  addiu      $a2, $a2, 0x10
    /* CF68 80146B60 F6FFC814 */  bne        $a2, $t0, .L80146B3C
    /* CF6C 80146B64 1000E724 */   addiu     $a3, $a3, 0x10
    /* CF70 80146B68 0000C28C */  lw         $v0, 0x0($a2)
    /* CF74 80146B6C 0400C38C */  lw         $v1, 0x4($a2)
    /* CF78 80146B70 0800C48C */  lw         $a0, 0x8($a2)
    /* CF7C 80146B74 0000E2AC */  sw         $v0, 0x0($a3)
    /* CF80 80146B78 0400E3AC */  sw         $v1, 0x4($a3)
    /* CF84 80146B7C 0800E4AC */  sw         $a0, 0x8($a3)
    /* CF88 80146B80 1E008686 */  lh         $a2, 0x1E($s4)
    /* CF8C 80146B84 20008786 */  lh         $a3, 0x20($s4)
    /* CF90 80146B88 31009782 */  lb         $s7, 0x31($s4)
    /* CF94 80146B8C 32009682 */  lb         $s6, 0x32($s4)
    /* CF98 80146B90 2E008986 */  lh         $t1, 0x2E($s4)
    /* CF9C 80146B94 2120E002 */  addu       $a0, $s7, $zero
    /* CFA0 80146B98 2128C002 */  addu       $a1, $s6, $zero
    /* CFA4 80146B9C 8AF6000C */  jal        GetDirection__Fiiii
    /* CFA8 80146BA0 7800A9AF */   sw        $t1, 0x78($sp)
    /* CFAC 80146BA4 1E008686 */  lh         $a2, 0x1E($s4)
    /* CFB0 80146BA8 20008786 */  lh         $a3, 0x20($s4)
    /* CFB4 80146BAC 7800A98F */  lw         $t1, 0x78($sp)
    /* CFB8 80146BB0 2120E002 */  addu       $a0, $s7, $zero
    /* CFBC 80146BB4 1000A2AF */  sw         $v0, 0x10($sp)
    /* CFC0 80146BB8 07000224 */  addiu      $v0, $zero, 0x7
    /* CFC4 80146BBC 1400A2AF */  sw         $v0, 0x14($sp)
    /* CFC8 80146BC0 01000224 */  addiu      $v0, $zero, 0x1
    /* CFCC 80146BC4 1800A0AF */  sw         $zero, 0x18($sp)
    /* CFD0 80146BC8 2000A2AF */  sw         $v0, 0x20($sp)
    /* CFD4 80146BCC 1C00A9AF */  sw         $t1, 0x1C($sp)
    /* CFD8 80146BD0 40008282 */  lb         $v0, 0x40($s4)
    /* CFDC 80146BD4 2128C002 */  addu       $a1, $s6, $zero
    /* CFE0 80146BD8 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* CFE4 80146BDC 2400A2AF */   sw        $v0, 0x24($sp)
    /* CFE8 80146BE0 40008282 */  lb         $v0, 0x40($s4)
    /* CFEC 80146BE4 00000000 */  nop
    /* CFF0 80146BE8 03005E24 */  addiu      $fp, $v0, 0x3
    /* CFF4 80146BEC 1400C22B */  slti       $v0, $fp, 0x14
    /* CFF8 80146BF0 02004014 */  bnez       $v0, .L80146BFC
    /* CFFC 80146BF4 01001524 */   addiu     $s5, $zero, 0x1
    /* D000 80146BF8 13001E24 */  addiu      $fp, $zero, 0x13
  .L80146BFC:
    /* D004 80146BFC 2A10BE02 */  slt        $v0, $s5, $fp
    /* D008 80146C00 3C004010 */  beqz       $v0, .L80146CF4
    /* D00C 80146C04 80101500 */   sll       $v0, $s5, 2
  .L80146C08:
    /* D010 80146C08 2110A203 */  addu       $v0, $sp, $v0
    /* D014 80146C0C 2800428C */  lw         $v0, 0x28($v0)
    /* D018 80146C10 0D80013C */  lui        $at, %hi(CrawlTable)
    /* D01C 80146C14 21082200 */  addu       $at, $at, $v0
    /* D020 80146C18 54553390 */  lbu        $s3, %lo(CrawlTable)($at)
    /* D024 80146C1C 00000000 */  nop
    /* D028 80146C20 3000601A */  blez       $s3, .L80146CE4
    /* D02C 80146C24 01005224 */   addiu     $s2, $v0, 0x1
  .L80146C28:
    /* D030 80146C28 0D80013C */  lui        $at, %hi(CrawlTable)
    /* D034 80146C2C 21083200 */  addu       $at, $at, $s2
    /* D038 80146C30 54552280 */  lb         $v0, %lo(CrawlTable)($at)
    /* D03C 80146C34 0D80013C */  lui        $at, %hi(CrawlTable + 0x1)
    /* D040 80146C38 21083200 */  addu       $at, $at, $s2
    /* D044 80146C3C 55552380 */  lb         $v1, %lo(CrawlTable + 0x1)($at)
    /* D048 80146C40 2180E202 */  addu       $s0, $s7, $v0
    /* D04C 80146C44 FFFF0226 */  addiu      $v0, $s0, -0x1
    /* D050 80146C48 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* D054 80146C4C 22004010 */  beqz       $v0, .L80146CD8
    /* D058 80146C50 2188C302 */   addu      $s1, $s6, $v1
    /* D05C 80146C54 FFFF2226 */  addiu      $v0, $s1, -0x1
    /* D060 80146C58 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* D064 80146C5C 1E004010 */  beqz       $v0, .L80146CD8
    /* D068 80146C60 C0101100 */   sll       $v0, $s1, 3
    /* D06C 80146C64 C0181000 */  sll        $v1, $s0, 3
    /* D070 80146C68 23187000 */  subu       $v1, $v1, $s0
    /* D074 80146C6C C0190300 */  sll        $v1, $v1, 7
    /* D078 80146C70 21104300 */  addu       $v0, $v0, $v1
    /* D07C 80146C74 0E80013C */  lui        $at, %hi(dung_map)
    /* D080 80146C78 21082200 */  addu       $at, $at, $v0
    /* D084 80146C7C 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* D088 80146C80 00000000 */  nop
    /* D08C 80146C84 14004018 */  blez       $v0, .L80146CD8
    /* D090 80146C88 2120E002 */   addu      $a0, $s7, $zero
    /* D094 80146C8C 2128C002 */  addu       $a1, $s6, $zero
    /* D098 80146C90 21300002 */  addu       $a2, $s0, $zero
    /* D09C 80146C94 8AF6000C */  jal        GetDirection__Fiiii
    /* D0A0 80146C98 21382002 */   addu      $a3, $s1, $zero
    /* D0A4 80146C9C 2120E002 */  addu       $a0, $s7, $zero
    /* D0A8 80146CA0 2128C002 */  addu       $a1, $s6, $zero
    /* D0AC 80146CA4 7800A98F */  lw         $t1, 0x78($sp)
    /* D0B0 80146CA8 21300002 */  addu       $a2, $s0, $zero
    /* D0B4 80146CAC 1000A2AF */  sw         $v0, 0x10($sp)
    /* D0B8 80146CB0 07000224 */  addiu      $v0, $zero, 0x7
    /* D0BC 80146CB4 1400A2AF */  sw         $v0, 0x14($sp)
    /* D0C0 80146CB8 01000224 */  addiu      $v0, $zero, 0x1
    /* D0C4 80146CBC 1800A0AF */  sw         $zero, 0x18($sp)
    /* D0C8 80146CC0 2000A2AF */  sw         $v0, 0x20($sp)
    /* D0CC 80146CC4 1C00A9AF */  sw         $t1, 0x1C($sp)
    /* D0D0 80146CC8 40008282 */  lb         $v0, 0x40($s4)
    /* D0D4 80146CCC 21382002 */  addu       $a3, $s1, $zero
    /* D0D8 80146CD0 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* D0DC 80146CD4 2400A2AF */   sw        $v0, 0x24($sp)
  .L80146CD8:
    /* D0E0 80146CD8 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* D0E4 80146CDC D2FF601E */  bgtz       $s3, .L80146C28
    /* D0E8 80146CE0 02005226 */   addiu     $s2, $s2, 0x2
  .L80146CE4:
    /* D0EC 80146CE4 0100B526 */  addiu      $s5, $s5, 0x1
    /* D0F0 80146CE8 2A10BE02 */  slt        $v0, $s5, $fp
    /* D0F4 80146CEC C6FF4014 */  bnez       $v0, .L80146C08
    /* D0F8 80146CF0 80101500 */   sll       $v0, $s5, 2
  .L80146CF4:
    /* D0FC 80146CF4 18008296 */  lhu        $v0, 0x18($s4)
    /* D100 80146CF8 00000000 */  nop
    /* D104 80146CFC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* D108 80146D00 180082A6 */  sh         $v0, 0x18($s4)
    /* D10C 80146D04 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* D110 80146D08 02004014 */  bnez       $v0, .L80146D14
    /* D114 80146D0C 01000224 */   addiu     $v0, $zero, 0x1
    /* D118 80146D10 380082A2 */  sb         $v0, 0x38($s4)
  .L80146D14:
    /* D11C 80146D14 A400BF8F */  lw         $ra, 0xA4($sp)
    /* D120 80146D18 A000BE8F */  lw         $fp, 0xA0($sp)
    /* D124 80146D1C 9C00B78F */  lw         $s7, 0x9C($sp)
    /* D128 80146D20 9800B68F */  lw         $s6, 0x98($sp)
    /* D12C 80146D24 9400B58F */  lw         $s5, 0x94($sp)
    /* D130 80146D28 9000B48F */  lw         $s4, 0x90($sp)
    /* D134 80146D2C 8C00B38F */  lw         $s3, 0x8C($sp)
    /* D138 80146D30 8800B28F */  lw         $s2, 0x88($sp)
    /* D13C 80146D34 8400B18F */  lw         $s1, 0x84($sp)
    /* D140 80146D38 8000B08F */  lw         $s0, 0x80($sp)
    /* D144 80146D3C A800BD27 */  addiu      $sp, $sp, 0xA8
    /* D148 80146D40 0800E003 */  jr         $ra
    /* D14C 80146D44 00000000 */   nop
endlabel MI_Chain__Fi
