.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5HWallOk__Fii, 0x13C

glabel L5HWallOk__Fii
    /* 4178 8013DD70 01008824 */  addiu      $t0, $a0, 0x1
    /* 417C 8013DD74 0E800D3C */  lui        $t5, %hi(dungeon)
    /* 4180 8013DD78 C440AD25 */  addiu      $t5, $t5, %lo(dungeon)
    /* 4184 8013DD7C 40180500 */  sll        $v1, $a1, 1
    /* 4188 8013DD80 40100800 */  sll        $v0, $t0, 1
    /* 418C 8013DD84 21104800 */  addu       $v0, $v0, $t0
    /* 4190 8013DD88 40110200 */  sll        $v0, $v0, 5
    /* 4194 8013DD8C 21104D00 */  addu       $v0, $v0, $t5
    /* 4198 8013DD90 21386200 */  addu       $a3, $v1, $v0
    /* 419C 8013DD94 0D000A24 */  addiu      $t2, $zero, 0xD
    /* 41A0 8013DD98 80100500 */  sll        $v0, $a1, 2
    /* 41A4 8013DD9C 21104500 */  addu       $v0, $v0, $a1
    /* 41A8 8013DDA0 C0600200 */  sll        $t4, $v0, 3
    /* 41AC 8013DDA4 0000E294 */  lhu        $v0, 0x0($a3)
    /* 41B0 8013DDA8 12800B3C */  lui        $t3, %hi(mydflags)
    /* 41B4 8013DDAC D8C06B8D */  lw         $t3, %lo(mydflags)($t3)
    /* 41B8 8013DDB0 1D004A14 */  bne        $v0, $t2, .L8013DE28
    /* 41BC 8013DDB4 01000924 */   addiu     $t1, $zero, 0x1
    /* 41C0 8013DDB8 FEFFE694 */  lhu        $a2, -0x2($a3)
    /* 41C4 8013DDBC 00000000 */  nop
    /* 41C8 8013DDC0 1900CA14 */  bne        $a2, $t2, .L8013DE28
    /* 41CC 8013DDC4 00000000 */   nop
  .L8013DDC8:
    /* 41D0 8013DDC8 0200E294 */  lhu        $v0, 0x2($a3)
    /* 41D4 8013DDCC 00000000 */  nop
    /* 41D8 8013DDD0 15004614 */  bne        $v0, $a2, .L8013DE28
    /* 41DC 8013DDD4 21108801 */   addu      $v0, $t4, $t0
    /* 41E0 8013DDD8 21106201 */  addu       $v0, $t3, $v0
    /* 41E4 8013DDDC 00004290 */  lbu        $v0, 0x0($v0)
    /* 41E8 8013DDE0 00000000 */  nop
    /* 41EC 8013DDE4 10004014 */  bnez       $v0, .L8013DE28
    /* 41F0 8013DDE8 00000000 */   nop
    /* 41F4 8013DDEC 01002925 */  addiu      $t1, $t1, 0x1
    /* 41F8 8013DDF0 21408900 */  addu       $t0, $a0, $t1
    /* 41FC 8013DDF4 40100800 */  sll        $v0, $t0, 1
    /* 4200 8013DDF8 21104800 */  addu       $v0, $v0, $t0
    /* 4204 8013DDFC 40110200 */  sll        $v0, $v0, 5
    /* 4208 8013DE00 21104D00 */  addu       $v0, $v0, $t5
    /* 420C 8013DE04 21386200 */  addu       $a3, $v1, $v0
    /* 4210 8013DE08 0000E294 */  lhu        $v0, 0x0($a3)
    /* 4214 8013DE0C 00000000 */  nop
    /* 4218 8013DE10 05004A14 */  bne        $v0, $t2, .L8013DE28
    /* 421C 8013DE14 00000000 */   nop
    /* 4220 8013DE18 FEFFE694 */  lhu        $a2, -0x2($a3)
    /* 4224 8013DE1C 00000000 */  nop
    /* 4228 8013DE20 E9FFC210 */  beq        $a2, $v0, .L8013DDC8
    /* 422C 8013DE24 00000000 */   nop
  .L8013DE28:
    /* 4230 8013DE28 21188900 */  addu       $v1, $a0, $t1
    /* 4234 8013DE2C 0E80043C */  lui        $a0, %hi(dungeon)
    /* 4238 8013DE30 C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 423C 8013DE34 40100300 */  sll        $v0, $v1, 1
    /* 4240 8013DE38 21104300 */  addu       $v0, $v0, $v1
    /* 4244 8013DE3C 40110200 */  sll        $v0, $v0, 5
    /* 4248 8013DE40 21104400 */  addu       $v0, $v0, $a0
    /* 424C 8013DE44 40180500 */  sll        $v1, $a1, 1
    /* 4250 8013DE48 21186200 */  addu       $v1, $v1, $v0
    /* 4254 8013DE4C 00006394 */  lhu        $v1, 0x0($v1)
    /* 4258 8013DE50 00000000 */  nop
    /* 425C 8013DE54 FDFF6224 */  addiu      $v0, $v1, -0x3
    /* 4260 8013DE58 0500422C */  sltiu      $v0, $v0, 0x5
    /* 4264 8013DE5C 21204000 */  addu       $a0, $v0, $zero
    /* 4268 8013DE60 F0FF6224 */  addiu      $v0, $v1, -0x10
    /* 426C 8013DE64 0900422C */  sltiu      $v0, $v0, 0x9
    /* 4270 8013DE68 02004010 */  beqz       $v0, .L8013DE74
    /* 4274 8013DE6C 00000000 */   nop
    /* 4278 8013DE70 01000424 */  addiu      $a0, $zero, 0x1
  .L8013DE74:
    /* 427C 8013DE74 FFFF6330 */  andi       $v1, $v1, 0xFFFF
    /* 4280 8013DE78 16000224 */  addiu      $v0, $zero, 0x16
    /* 4284 8013DE7C 02006214 */  bne        $v1, $v0, .L8013DE88
    /* 4288 8013DE80 01000224 */   addiu     $v0, $zero, 0x1
    /* 428C 8013DE84 21200000 */  addu       $a0, $zero, $zero
  .L8013DE88:
    /* 4290 8013DE88 03002215 */  bne        $t1, $v0, .L8013DE98
    /* 4294 8013DE8C FF008330 */   andi      $v1, $a0, 0xFF
    /* 4298 8013DE90 21200000 */  addu       $a0, $zero, $zero
    /* 429C 8013DE94 FF008330 */  andi       $v1, $a0, 0xFF
  .L8013DE98:
    /* 42A0 8013DE98 02006014 */  bnez       $v1, .L8013DEA4
    /* 42A4 8013DE9C 21102001 */   addu      $v0, $t1, $zero
    /* 42A8 8013DEA0 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8013DEA4:
    /* 42AC 8013DEA4 0800E003 */  jr         $ra
    /* 42B0 8013DEA8 00000000 */   nop
endlabel L5HWallOk__Fii
