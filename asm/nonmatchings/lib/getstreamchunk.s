.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getstreamchunk, 0x1D4

glabel getstreamchunk
    /* 1F078 8002F078 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F07C 8002F07C 21288000 */  addu       $a1, $a0, $zero
    /* 1F080 8002F080 0E00A014 */  bnez       $a1, .L8002F0BC
    /* 1F084 8002F084 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1F088 8002F088 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1F08C 8002F08C F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1F090 8002F090 1280013C */  lui        $at, %hi(abortfile)
    /* 1F094 8002F094 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1F098 8002F098 880B0224 */  addiu      $v0, $zero, 0xB88
    /* 1F09C 8002F09C 1180043C */  lui        $a0, %hi(D_8010FE38)
    /* 1F0A0 8002F0A0 38FE8424 */  addiu      $a0, $a0, %lo(D_8010FE38)
    /* 1F0A4 8002F0A4 1280013C */  lui        $at, %hi(abortline)
    /* 1F0A8 8002F0A8 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1F0AC 8002F0AC 0F95000C */  jal        abortmessage
    /* 1F0B0 8002F0B0 00000000 */   nop
  .L8002F0B4:
    /* 1F0B4 8002F0B4 8FBC0008 */  j          .L8002F23C
    /* 1F0B8 8002F0B8 21100000 */   addu      $v0, $zero, $zero
  .L8002F0BC:
    /* 1F0BC 8002F0BC 7800A28C */  lw         $v0, 0x78($a1)
    /* 1F0C0 8002F0C0 00000000 */  nop
    /* 1F0C4 8002F0C4 0E004010 */  beqz       $v0, .L8002F100
    /* 1F0C8 8002F0C8 00000000 */   nop
    /* 1F0CC 8002F0CC 7800A28C */  lw         $v0, 0x78($a1)
    /* 1F0D0 8002F0D0 00000000 */  nop
    /* 1F0D4 8002F0D4 9400438C */  lw         $v1, 0x94($v0)
    /* 1F0D8 8002F0D8 0D000224 */  addiu      $v0, $zero, 0xD
    /* 1F0DC 8002F0DC F5FF6210 */  beq        $v1, $v0, .L8002F0B4
    /* 1F0E0 8002F0E0 0E006228 */   slti      $v0, $v1, 0xE
    /* 1F0E4 8002F0E4 04004014 */  bnez       $v0, .L8002F0F8
    /* 1F0E8 8002F0E8 0B000224 */   addiu     $v0, $zero, 0xB
    /* 1F0EC 8002F0EC 14000224 */  addiu      $v0, $zero, 0x14
    /* 1F0F0 8002F0F0 F0FF6210 */  beq        $v1, $v0, .L8002F0B4
    /* 1F0F4 8002F0F4 17000224 */   addiu     $v0, $zero, 0x17
  .L8002F0F8:
    /* 1F0F8 8002F0F8 50006210 */  beq        $v1, $v0, .L8002F23C
    /* 1F0FC 8002F0FC 21100000 */   addu      $v0, $zero, $zero
  .L8002F100:
    /* 1F100 8002F100 2000A38C */  lw         $v1, 0x20($a1)
    /* 1F104 8002F104 02000224 */  addiu      $v0, $zero, 0x2
    /* 1F108 8002F108 4C006210 */  beq        $v1, $v0, .L8002F23C
    /* 1F10C 8002F10C 21100000 */   addu      $v0, $zero, $zero
    /* 1F110 8002F110 2000A38C */  lw         $v1, 0x20($a1)
    /* 1F114 8002F114 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F118 8002F118 48006210 */  beq        $v1, $v0, .L8002F23C
    /* 1F11C 8002F11C 21100000 */   addu      $v0, $zero, $zero
    /* 1F120 8002F120 2000A38C */  lw         $v1, 0x20($a1)
    /* 1F124 8002F124 0E000224 */  addiu      $v0, $zero, 0xE
    /* 1F128 8002F128 44006210 */  beq        $v1, $v0, .L8002F23C
    /* 1F12C 8002F12C FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 1F130 8002F130 1000A38C */  lw         $v1, 0x10($a1)
    /* 1F134 8002F134 1400A28C */  lw         $v0, 0x14($a1)
    /* 1F138 8002F138 00000000 */  nop
    /* 1F13C 8002F13C 3F006210 */  beq        $v1, $v0, .L8002F23C
    /* 1F140 8002F140 21100000 */   addu      $v0, $zero, $zero
    /* 1F144 8002F144 1400A28C */  lw         $v0, 0x14($a1)
    /* 1F148 8002F148 00000000 */  nop
    /* 1F14C 8002F14C 0000438C */  lw         $v1, 0x0($v0)
    /* 1F150 8002F150 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1F154 8002F154 09006214 */  bne        $v1, $v0, .L8002F17C
    /* 1F158 8002F158 00000000 */   nop
    /* 1F15C 8002F15C 0400A28C */  lw         $v0, 0x4($a1)
    /* 1F160 8002F160 00000000 */  nop
    /* 1F164 8002F164 1400A2AC */  sw         $v0, 0x14($a1)
    /* 1F168 8002F168 1000A38C */  lw         $v1, 0x10($a1)
    /* 1F16C 8002F16C 1400A28C */  lw         $v0, 0x14($a1)
    /* 1F170 8002F170 00000000 */  nop
    /* 1F174 8002F174 31006210 */  beq        $v1, $v0, .L8002F23C
    /* 1F178 8002F178 21100000 */   addu      $v0, $zero, $zero
  .L8002F17C:
    /* 1F17C 8002F17C 1400A28C */  lw         $v0, 0x14($a1)
    /* 1F180 8002F180 1000A38C */  lw         $v1, 0x10($a1)
    /* 1F184 8002F184 1400A48C */  lw         $a0, 0x14($a1)
    /* 1F188 8002F188 0400468C */  lw         $a2, 0x4($v0)
    /* 1F18C 8002F18C 2B186400 */  sltu       $v1, $v1, $a0
    /* 1F190 8002F190 04006010 */  beqz       $v1, .L8002F1A4
    /* 1F194 8002F194 00000000 */   nop
    /* 1F198 8002F198 0800A28C */  lw         $v0, 0x8($a1)
    /* 1F19C 8002F19C 6ABC0008 */  j          .L8002F1A8
    /* 1F1A0 8002F1A0 00000000 */   nop
  .L8002F1A4:
    /* 1F1A4 8002F1A4 1000A28C */  lw         $v0, 0x10($a1)
  .L8002F1A8:
    /* 1F1A8 8002F1A8 1400A38C */  lw         $v1, 0x14($a1)
    /* 1F1AC 8002F1AC 00000000 */  nop
    /* 1F1B0 8002F1B0 23104300 */  subu       $v0, $v0, $v1
    /* 1F1B4 8002F1B4 2A104600 */  slt        $v0, $v0, $a2
    /* 1F1B8 8002F1B8 20004014 */  bnez       $v0, .L8002F23C
    /* 1F1BC 8002F1BC 21100000 */   addu      $v0, $zero, $zero
    /* 1F1C0 8002F1C0 1400A48C */  lw         $a0, 0x14($a1)
    /* 1F1C4 8002F1C4 9000A28C */  lw         $v0, 0x90($a1)
    /* 1F1C8 8002F1C8 00000000 */  nop
    /* 1F1CC 8002F1CC 08004224 */  addiu      $v0, $v0, 0x8
    /* 1F1D0 8002F1D0 23104600 */  subu       $v0, $v0, $a2
    /* 1F1D4 8002F1D4 9000A2AC */  sw         $v0, 0x90($a1)
    /* 1F1D8 8002F1D8 9400A28C */  lw         $v0, 0x94($a1)
    /* 1F1DC 8002F1DC 00000000 */  nop
    /* 1F1E0 8002F1E0 F8FF4224 */  addiu      $v0, $v0, -0x8
    /* 1F1E4 8002F1E4 21104600 */  addu       $v0, $v0, $a2
    /* 1F1E8 8002F1E8 9400A2AC */  sw         $v0, 0x94($a1)
    /* 1F1EC 8002F1EC 1400A28C */  lw         $v0, 0x14($a1)
    /* 1F1F0 8002F1F0 00000000 */  nop
    /* 1F1F4 8002F1F4 21104600 */  addu       $v0, $v0, $a2
    /* 1F1F8 8002F1F8 1400A2AC */  sw         $v0, 0x14($a1)
    /* 1F1FC 8002F1FC 0000838C */  lw         $v1, 0x0($a0)
    /* 1F200 8002F200 FDFF0224 */  addiu      $v0, $zero, -0x3
    /* 1F204 8002F204 0D006214 */  bne        $v1, $v0, .L8002F23C
    /* 1F208 8002F208 21108000 */   addu      $v0, $a0, $zero
    /* 1F20C 8002F20C 1800A28C */  lw         $v0, 0x18($a1)
    /* 1F210 8002F210 00000000 */  nop
    /* 1F214 8002F214 06004414 */  bne        $v0, $a0, .L8002F230
    /* 1F218 8002F218 FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 1F21C 8002F21C 1400A28C */  lw         $v0, 0x14($a1)
    /* 1F220 8002F220 00000000 */  nop
    /* 1F224 8002F224 1800A2AC */  sw         $v0, 0x18($a1)
    /* 1F228 8002F228 8EBC0008 */  j          .L8002F238
    /* 1F22C 8002F22C FFFF0424 */   addiu     $a0, $zero, -0x1
  .L8002F230:
    /* 1F230 8002F230 000082AC */  sw         $v0, 0x0($a0)
    /* 1F234 8002F234 FFFF0424 */  addiu      $a0, $zero, -0x1
  .L8002F238:
    /* 1F238 8002F238 21108000 */  addu       $v0, $a0, $zero
  .L8002F23C:
    /* 1F23C 8002F23C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1F240 8002F240 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F244 8002F244 0800E003 */  jr         $ra
    /* 1F248 8002F248 00000000 */   nop
endlabel getstreamchunk
