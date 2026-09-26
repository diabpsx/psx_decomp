.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Garbud__Fi, 0x210

glabel MAI_Garbud__Fi
    /* 19F78 80153B70 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 19F7C 80153B74 1400B1AF */  sw         $s1, 0x14($sp)
    /* 19F80 80153B78 21888000 */  addu       $s1, $a0, $zero
    /* 19F84 80153B7C 40101100 */  sll        $v0, $s1, 1
    /* 19F88 80153B80 21105100 */  addu       $v0, $v0, $s1
    /* 19F8C 80153B84 80100200 */  sll        $v0, $v0, 2
    /* 19F90 80153B88 21105100 */  addu       $v0, $v0, $s1
    /* 19F94 80153B8C C0100200 */  sll        $v0, $v0, 3
    /* 19F98 80153B90 1080033C */  lui        $v1, %hi(monster)
    /* 19F9C 80153B94 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 19FA0 80153B98 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19FA4 80153B9C 21804300 */  addu       $s0, $v0, $v1
    /* 19FA8 80153BA0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 19FAC 80153BA4 34001282 */  lb         $s2, 0x34($s0)
    /* 19FB0 80153BA8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 19FB4 80153BAC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 19FB8 80153BB0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 19FBC 80153BB4 33000282 */  lb         $v0, 0x33($s0)
    /* 19FC0 80153BB8 35001382 */  lb         $s3, 0x35($s0)
    /* 19FC4 80153BBC 67004014 */  bnez       $v0, .L80153D5C
    /* 19FC8 80153BC0 00000000 */   nop
    /* 19FCC 80153BC4 EB2A050C */  jal        M_GetDir__Fi
    /* 19FD0 80153BC8 00000000 */   nop
    /* 19FD4 80153BCC 0000048E */  lw         $a0, 0x0($s0)
    /* 19FD8 80153BD0 21A04000 */  addu       $s4, $v0, $zero
    /* 19FDC 80153BD4 70FF8224 */  addiu      $v0, $a0, -0x90
    /* 19FE0 80153BD8 0300422C */  sltiu      $v0, $v0, 0x3
    /* 19FE4 80153BDC 21004010 */  beqz       $v0, .L80153C64
    /* 19FE8 80153BE0 C0101300 */   sll       $v0, $s3, 3
    /* 19FEC 80153BE4 C0181200 */  sll        $v1, $s2, 3
    /* 19FF0 80153BE8 23187200 */  subu       $v1, $v1, $s2
    /* 19FF4 80153BEC C0190300 */  sll        $v1, $v1, 7
    /* 19FF8 80153BF0 21104300 */  addu       $v0, $v0, $v1
    /* 19FFC 80153BF4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1A000 80153BF8 21082200 */  addu       $at, $at, $v0
    /* 1A004 80153BFC 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1A008 80153C00 00000000 */  nop
    /* 1A00C 80153C04 04004230 */  andi       $v0, $v0, 0x4
    /* 1A010 80153C08 22004014 */  bnez       $v0, .L80153C94
    /* 1A014 80153C0C 07000224 */   addiu     $v0, $zero, 0x7
    /* 1A018 80153C10 49000392 */  lbu        $v1, 0x49($s0)
    /* 1A01C 80153C14 00000000 */  nop
    /* 1A020 80153C18 13006214 */  bne        $v1, $v0, .L80153C68
    /* 1A024 80153C1C C0101300 */   sll       $v0, $s3, 3
    /* 1A028 80153C20 01008224 */  addiu      $v0, $a0, 0x1
    /* 1A02C 80153C24 000002AE */  sw         $v0, 0x0($s0)
    /* 1A030 80153C28 06000224 */  addiu      $v0, $zero, 0x6
    /* 1A034 80153C2C 490002A2 */  sb         $v0, 0x49($s0)
    /* 1A038 80153C30 05000224 */  addiu      $v0, $zero, 0x5
    /* 1A03C 80153C34 0E80013C */  lui        $at, %hi(quests + 0x37)
    /* 1A040 80153C38 77DA22A0 */  sb         $v0, %lo(quests + 0x37)($at)
    /* 1A044 80153C3C 0000028E */  lw         $v0, 0x0($s0)
    /* 1A048 80153C40 1280033C */  lui        $v1, %hi(deltaload)
    /* 1A04C 80153C44 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 1A050 80153C48 0E80013C */  lui        $at, %hi(quests + 0x38)
    /* 1A054 80153C4C 78DA22A0 */  sb         $v0, %lo(quests + 0x38)($at)
    /* 1A058 80153C50 05006014 */  bnez       $v1, .L80153C68
    /* 1A05C 80153C54 C0101300 */   sll       $v0, $s3, 3
    /* 1A060 80153C58 01000424 */  addiu      $a0, $zero, 0x1
    /* 1A064 80153C5C 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 1A068 80153C60 02000524 */   addiu     $a1, $zero, 0x2
  .L80153C64:
    /* 1A06C 80153C64 C0101300 */  sll        $v0, $s3, 3
  .L80153C68:
    /* 1A070 80153C68 C0181200 */  sll        $v1, $s2, 3
    /* 1A074 80153C6C 23187200 */  subu       $v1, $v1, $s2
    /* 1A078 80153C70 C0190300 */  sll        $v1, $v1, 7
    /* 1A07C 80153C74 21104300 */  addu       $v0, $v0, $v1
    /* 1A080 80153C78 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1A084 80153C7C 21082200 */  addu       $at, $at, $v0
    /* 1A088 80153C80 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1A08C 80153C84 00000000 */  nop
    /* 1A090 80153C88 04004230 */  andi       $v0, $v0, 0x4
    /* 1A094 80153C8C 1C004010 */  beqz       $v0, .L80153D00
    /* 1A098 80153C90 00000000 */   nop
  .L80153C94:
    /* 1A09C 80153C94 0000038E */  lw         $v1, 0x0($s0)
    /* 1A0A0 80153C98 93000224 */  addiu      $v0, $zero, 0x93
    /* 1A0A4 80153C9C 18006214 */  bne        $v1, $v0, .L80153D00
    /* 1A0A8 80153CA0 00000000 */   nop
    /* 1A0AC 80153CA4 CDF3000C */  jal        effect_is_playing__Fi
    /* 1A0B0 80153CA8 4D030424 */   addiu     $a0, $zero, 0x34D
    /* 1A0B4 80153CAC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1A0B8 80153CB0 13004014 */  bnez       $v0, .L80153D00
    /* 1A0BC 80153CB4 07000224 */   addiu     $v0, $zero, 0x7
    /* 1A0C0 80153CB8 49000392 */  lbu        $v1, 0x49($s0)
    /* 1A0C4 80153CBC 00000000 */  nop
    /* 1A0C8 80153CC0 11006214 */  bne        $v1, $v0, .L80153D08
    /* 1A0CC 80153CC4 01000224 */   addiu     $v0, $zero, 0x1
    /* 1A0D0 80153CC8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1A0D4 80153CCC 490002A2 */  sb         $v0, 0x49($s0)
    /* 1A0D8 80153CD0 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 1A0DC 80153CD4 4E0002A2 */  sb         $v0, 0x4E($s0)
    /* 1A0E0 80153CD8 1280033C */  lui        $v1, %hi(deltaload)
    /* 1A0E4 80153CDC 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 1A0E8 80153CE0 04000224 */  addiu      $v0, $zero, 0x4
    /* 1A0EC 80153CE4 000000AE */  sw         $zero, 0x0($s0)
    /* 1A0F0 80153CE8 0E80013C */  lui        $at, %hi(quests + 0x37)
    /* 1A0F4 80153CEC 77DA22A0 */  sb         $v0, %lo(quests + 0x37)($at)
    /* 1A0F8 80153CF0 03006014 */  bnez       $v1, .L80153D00
    /* 1A0FC 80153CF4 01000424 */   addiu     $a0, $zero, 0x1
    /* 1A100 80153CF8 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 1A104 80153CFC 02000524 */   addiu     $a1, $zero, 0x2
  .L80153D00:
    /* 1A108 80153D00 49000392 */  lbu        $v1, 0x49($s0)
    /* 1A10C 80153D04 01000224 */  addiu      $v0, $zero, 0x1
  .L80153D08:
    /* 1A110 80153D08 03006210 */  beq        $v1, $v0, .L80153D18
    /* 1A114 80153D0C 04000224 */   addiu     $v0, $zero, 0x4
    /* 1A118 80153D10 06006214 */  bne        $v1, $v0, .L80153D2C
    /* 1A11C 80153D14 40101100 */   sll       $v0, $s1, 1
  .L80153D18:
    /* 1A120 80153D18 21202002 */  addu       $a0, $s1, $zero
    /* 1A124 80153D1C 6745050C */  jal        MAI_Round__FiUc
    /* 1A128 80153D20 01000524 */   addiu     $a1, $zero, 0x1
    /* 1A12C 80153D24 524F0508 */  j          .L80153D48
    /* 1A130 80153D28 00000000 */   nop
  .L80153D2C:
    /* 1A134 80153D2C 21105100 */  addu       $v0, $v0, $s1
    /* 1A138 80153D30 80100200 */  sll        $v0, $v0, 2
    /* 1A13C 80153D34 21105100 */  addu       $v0, $v0, $s1
    /* 1A140 80153D38 C0100200 */  sll        $v0, $v0, 3
    /* 1A144 80153D3C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1A148 80153D40 21082200 */  addu       $at, $at, $v0
    /* 1A14C 80153D44 D05334A0 */  sb         $s4, %lo(monster + 0x3C)($at)
  .L80153D48:
    /* 1A150 80153D48 33000282 */  lb         $v0, 0x33($s0)
    /* 1A154 80153D4C 00000000 */  nop
    /* 1A158 80153D50 02004014 */  bnez       $v0, .L80153D5C
    /* 1A15C 80153D54 00000000 */   nop
    /* 1A160 80153D58 5A0000A2 */  sb         $zero, 0x5A($s0)
  .L80153D5C:
    /* 1A164 80153D5C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 1A168 80153D60 2000B48F */  lw         $s4, 0x20($sp)
    /* 1A16C 80153D64 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1A170 80153D68 1800B28F */  lw         $s2, 0x18($sp)
    /* 1A174 80153D6C 1400B18F */  lw         $s1, 0x14($sp)
    /* 1A178 80153D70 1000B08F */  lw         $s0, 0x10($sp)
    /* 1A17C 80153D74 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1A180 80153D78 0800E003 */  jr         $ra
    /* 1A184 80153D7C 00000000 */   nop
endlabel MAI_Garbud__Fi
