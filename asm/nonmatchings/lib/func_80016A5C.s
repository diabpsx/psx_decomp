.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80016A5C, 0x1C0

glabel func_80016A5C
    /* 6A5C 80016A5C 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 6A60 80016A60 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6A64 80016A64 0B80033C */  lui        $v1, %hi(_spu_tsa)
    /* 6A68 80016A68 645A6394 */  lhu        $v1, %lo(_spu_tsa)($v1)
    /* 6A6C 80016A6C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6A70 80016A70 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6A74 80016A74 2188A000 */  addu       $s1, $a1, $zero
    /* 6A78 80016A78 2000BFAF */  sw         $ra, 0x20($sp)
    /* 6A7C 80016A7C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 6A80 80016A80 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6A84 80016A84 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6A88 80016A88 AE014594 */  lhu        $a1, 0x1AE($v0)
    /* 6A8C 80016A8C 21908000 */  addu       $s2, $a0, $zero
    /* 6A90 80016A90 A60143A4 */  sh         $v1, 0x1A6($v0)
    /* 6A94 80016A94 AD5C000C */  jal        _spu_Fw1ts
    /* 6A98 80016A98 FF07B330 */   andi      $s3, $a1, 0x7FF
    /* 6A9C 80016A9C 39002012 */  beqz       $s1, .L80016B84
    /* 6AA0 80016AA0 4100222E */   sltiu     $v0, $s1, 0x41
  .L80016AA4:
    /* 6AA4 80016AA4 02004010 */  beqz       $v0, .L80016AB0
    /* 6AA8 80016AA8 40001024 */   addiu     $s0, $zero, 0x40
    /* 6AAC 80016AAC 21802002 */  addu       $s0, $s1, $zero
  .L80016AB0:
    /* 6AB0 80016AB0 0A00001A */  blez       $s0, .L80016ADC
    /* 6AB4 80016AB4 21180000 */   addu      $v1, $zero, $zero
    /* 6AB8 80016AB8 0B80043C */  lui        $a0, %hi(_spu_RXX)
    /* 6ABC 80016ABC 4C5A848C */  lw         $a0, %lo(_spu_RXX)($a0)
  .L80016AC0:
    /* 6AC0 80016AC0 00004296 */  lhu        $v0, 0x0($s2)
    /* 6AC4 80016AC4 02005226 */  addiu      $s2, $s2, 0x2
    /* 6AC8 80016AC8 02006324 */  addiu      $v1, $v1, 0x2
    /* 6ACC 80016ACC A80182A4 */  sh         $v0, 0x1A8($a0)
    /* 6AD0 80016AD0 2A107000 */  slt        $v0, $v1, $s0
    /* 6AD4 80016AD4 FAFF4014 */  bnez       $v0, .L80016AC0
    /* 6AD8 80016AD8 00000000 */   nop
  .L80016ADC:
    /* 6ADC 80016ADC 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 6AE0 80016AE0 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 6AE4 80016AE4 00000000 */  nop
    /* 6AE8 80016AE8 AA016494 */  lhu        $a0, 0x1AA($v1)
    /* 6AEC 80016AEC 00000000 */  nop
    /* 6AF0 80016AF0 CFFF8230 */  andi       $v0, $a0, 0xFFCF
    /* 6AF4 80016AF4 10004234 */  ori        $v0, $v0, 0x10
    /* 6AF8 80016AF8 AD5C000C */  jal        _spu_Fw1ts
    /* 6AFC 80016AFC AA0162A4 */   sh        $v0, 0x1AA($v1)
    /* 6B00 80016B00 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 6B04 80016B04 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6B08 80016B08 00000000 */  nop
    /* 6B0C 80016B0C AE014294 */  lhu        $v0, 0x1AE($v0)
    /* 6B10 80016B10 00000000 */  nop
    /* 6B14 80016B14 00044230 */  andi       $v0, $v0, 0x400
    /* 6B18 80016B18 14004010 */  beqz       $v0, .L80016B6C
    /* 6B1C 80016B1C 21180000 */   addu      $v1, $zero, $zero
    /* 6B20 80016B20 01006324 */  addiu      $v1, $v1, 0x1
  .L80016B24:
    /* 6B24 80016B24 010F622C */  sltiu      $v0, $v1, 0xF01
    /* 6B28 80016B28 08004014 */  bnez       $v0, .L80016B4C
    /* 6B2C 80016B2C 00000000 */   nop
    /* 6B30 80016B30 1180043C */  lui        $a0, %hi(D_8010E098)
    /* 6B34 80016B34 98E08424 */  addiu      $a0, $a0, %lo(D_8010E098)
    /* 6B38 80016B38 1180053C */  lui        $a1, %hi(D_8010E0B8)
    /* 6B3C 80016B3C 9367000C */  jal        printf
    /* 6B40 80016B40 B8E0A524 */   addiu     $a1, $a1, %lo(D_8010E0B8)
    /* 6B44 80016B44 DB5A0008 */  j          .L80016B6C
    /* 6B48 80016B48 00000000 */   nop
  .L80016B4C:
    /* 6B4C 80016B4C 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 6B50 80016B50 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6B54 80016B54 00000000 */  nop
    /* 6B58 80016B58 AE014294 */  lhu        $v0, 0x1AE($v0)
    /* 6B5C 80016B5C 00000000 */  nop
    /* 6B60 80016B60 00044230 */  andi       $v0, $v0, 0x400
    /* 6B64 80016B64 EFFF4014 */  bnez       $v0, .L80016B24
    /* 6B68 80016B68 01006324 */   addiu     $v1, $v1, 0x1
  .L80016B6C:
    /* 6B6C 80016B6C AD5C000C */  jal        _spu_Fw1ts
    /* 6B70 80016B70 23883002 */   subu      $s1, $s1, $s0
    /* 6B74 80016B74 AD5C000C */  jal        _spu_Fw1ts
    /* 6B78 80016B78 00000000 */   nop
    /* 6B7C 80016B7C C9FF2016 */  bnez       $s1, .L80016AA4
    /* 6B80 80016B80 4100222E */   sltiu     $v0, $s1, 0x41
  .L80016B84:
    /* 6B84 80016B84 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 6B88 80016B88 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6B8C 80016B8C 00000000 */  nop
    /* 6B90 80016B90 AA014494 */  lhu        $a0, 0x1AA($v0)
    /* 6B94 80016B94 FFFF6532 */  andi       $a1, $s3, 0xFFFF
    /* 6B98 80016B98 CFFF8330 */  andi       $v1, $a0, 0xFFCF
    /* 6B9C 80016B9C AA0143A4 */  sh         $v1, 0x1AA($v0)
    /* 6BA0 80016BA0 AE014294 */  lhu        $v0, 0x1AE($v0)
    /* 6BA4 80016BA4 00000000 */  nop
    /* 6BA8 80016BA8 FF074230 */  andi       $v0, $v0, 0x7FF
    /* 6BAC 80016BAC 14004510 */  beq        $v0, $a1, .L80016C00
    /* 6BB0 80016BB0 21180000 */   addu      $v1, $zero, $zero
    /* 6BB4 80016BB4 01006324 */  addiu      $v1, $v1, 0x1
  .L80016BB8:
    /* 6BB8 80016BB8 010F622C */  sltiu      $v0, $v1, 0xF01
    /* 6BBC 80016BBC 08004014 */  bnez       $v0, .L80016BE0
    /* 6BC0 80016BC0 00000000 */   nop
    /* 6BC4 80016BC4 1180043C */  lui        $a0, %hi(D_8010E098)
    /* 6BC8 80016BC8 98E08424 */  addiu      $a0, $a0, %lo(D_8010E098)
    /* 6BCC 80016BCC 1180053C */  lui        $a1, %hi(D_8010E0CC)
    /* 6BD0 80016BD0 9367000C */  jal        printf
    /* 6BD4 80016BD4 CCE0A524 */   addiu     $a1, $a1, %lo(D_8010E0CC)
    /* 6BD8 80016BD8 005B0008 */  j          .L80016C00
    /* 6BDC 80016BDC 00000000 */   nop
  .L80016BE0:
    /* 6BE0 80016BE0 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 6BE4 80016BE4 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6BE8 80016BE8 00000000 */  nop
    /* 6BEC 80016BEC AE014294 */  lhu        $v0, 0x1AE($v0)
    /* 6BF0 80016BF0 00000000 */  nop
    /* 6BF4 80016BF4 FF074230 */  andi       $v0, $v0, 0x7FF
    /* 6BF8 80016BF8 EFFF4514 */  bne        $v0, $a1, .L80016BB8
    /* 6BFC 80016BFC 01006324 */   addiu     $v1, $v1, 0x1
  .L80016C00:
    /* 6C00 80016C00 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6C04 80016C04 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 6C08 80016C08 1800B28F */  lw         $s2, 0x18($sp)
    /* 6C0C 80016C0C 1400B18F */  lw         $s1, 0x14($sp)
    /* 6C10 80016C10 1000B08F */  lw         $s0, 0x10($sp)
    /* 6C14 80016C14 0800E003 */  jr         $ra
    /* 6C18 80016C18 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel func_80016A5C
