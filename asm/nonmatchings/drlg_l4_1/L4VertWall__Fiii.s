.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4VertWall__Fiii, 0x1C4

glabel L4VertWall__Fiii
    /* 16130 8014FD28 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 16134 8014FD2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 16138 8014FD30 2180A000 */  addu       $s0, $a1, $zero
    /* 1613C 8014FD34 0E80033C */  lui        $v1, %hi(dungeon)
    /* 16140 8014FD38 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 16144 8014FD3C 40100400 */  sll        $v0, $a0, 1
    /* 16148 8014FD40 21104400 */  addu       $v0, $v0, $a0
    /* 1614C 8014FD44 40110200 */  sll        $v0, $v0, 5
    /* 16150 8014FD48 21384300 */  addu       $a3, $v0, $v1
    /* 16154 8014FD4C 40101000 */  sll        $v0, $s0, 1
    /* 16158 8014FD50 21284700 */  addu       $a1, $v0, $a3
    /* 1615C 8014FD54 2000BFAF */  sw         $ra, 0x20($sp)
    /* 16160 8014FD58 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 16164 8014FD5C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 16168 8014FD60 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1616C 8014FD64 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16170 8014FD68 0E000224 */  addiu      $v0, $zero, 0xE
    /* 16174 8014FD6C 05006214 */  bne        $v1, $v0, .L8014FD84
    /* 16178 8014FD70 08000224 */   addiu     $v0, $zero, 0x8
    /* 1617C 8014FD74 11000224 */  addiu      $v0, $zero, 0x11
    /* 16180 8014FD78 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 16184 8014FD7C 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16188 8014FD80 08000224 */  addiu      $v0, $zero, 0x8
  .L8014FD84:
    /* 1618C 8014FD84 02006214 */  bne        $v1, $v0, .L8014FD90
    /* 16190 8014FD88 09000224 */   addiu     $v0, $zero, 0x9
    /* 16194 8014FD8C 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8014FD90:
    /* 16198 8014FD90 0000A394 */  lhu        $v1, 0x0($a1)
    /* 1619C 8014FD94 0F000224 */  addiu      $v0, $zero, 0xF
    /* 161A0 8014FD98 03006214 */  bne        $v1, $v0, .L8014FDA8
    /* 161A4 8014FD9C 01000324 */   addiu     $v1, $zero, 0x1
    /* 161A8 8014FDA0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 161AC 8014FDA4 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8014FDA8:
    /* 161B0 8014FDA8 2A106600 */  slt        $v0, $v1, $a2
    /* 161B4 8014FDAC 0A004010 */  beqz       $v0, .L8014FDD8
    /* 161B8 8014FDB0 2128E000 */   addu      $a1, $a3, $zero
    /* 161BC 8014FDB4 01000724 */  addiu      $a3, $zero, 0x1
    /* 161C0 8014FDB8 21100302 */  addu       $v0, $s0, $v1
  .L8014FDBC:
    /* 161C4 8014FDBC 40100200 */  sll        $v0, $v0, 1
    /* 161C8 8014FDC0 21104500 */  addu       $v0, $v0, $a1
    /* 161CC 8014FDC4 000047A4 */  sh         $a3, 0x0($v0)
    /* 161D0 8014FDC8 01006324 */  addiu      $v1, $v1, 0x1
    /* 161D4 8014FDCC 2A106600 */  slt        $v0, $v1, $a2
    /* 161D8 8014FDD0 FAFF4014 */  bnez       $v0, .L8014FDBC
    /* 161DC 8014FDD4 21100302 */   addu      $v0, $s0, $v1
  .L8014FDD8:
    /* 161E0 8014FDD8 0E80133C */  lui        $s3, %hi(dungeon)
    /* 161E4 8014FDDC C4407326 */  addiu      $s3, $s3, %lo(dungeon)
    /* 161E8 8014FDE0 40100400 */  sll        $v0, $a0, 1
    /* 161EC 8014FDE4 21104400 */  addu       $v0, $v0, $a0
    /* 161F0 8014FDE8 40910200 */  sll        $s2, $v0, 5
    /* 161F4 8014FDEC 21885302 */  addu       $s1, $s2, $s3
    /* 161F8 8014FDF0 21100602 */  addu       $v0, $s0, $a2
    /* 161FC 8014FDF4 40100200 */  sll        $v0, $v0, 1
    /* 16200 8014FDF8 21285100 */  addu       $a1, $v0, $s1
    /* 16204 8014FDFC 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16208 8014FE00 0B000224 */  addiu      $v0, $zero, 0xB
    /* 1620C 8014FE04 05006214 */  bne        $v1, $v0, .L8014FE1C
    /* 16210 8014FE08 09000224 */   addiu     $v0, $zero, 0x9
    /* 16214 8014FE0C 11000224 */  addiu      $v0, $zero, 0x11
    /* 16218 8014FE10 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 1621C 8014FE14 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16220 8014FE18 09000224 */  addiu      $v0, $zero, 0x9
  .L8014FE1C:
    /* 16224 8014FE1C 02006214 */  bne        $v1, $v0, .L8014FE28
    /* 16228 8014FE20 0A000224 */   addiu     $v0, $zero, 0xA
    /* 1622C 8014FE24 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8014FE28:
    /* 16230 8014FE28 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16234 8014FE2C 10000224 */  addiu      $v0, $zero, 0x10
    /* 16238 8014FE30 05006214 */  bne        $v1, $v0, .L8014FE48
    /* 1623C 8014FE34 15000224 */   addiu     $v0, $zero, 0x15
    /* 16240 8014FE38 0D000224 */  addiu      $v0, $zero, 0xD
    /* 16244 8014FE3C 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 16248 8014FE40 0000A394 */  lhu        $v1, 0x0($a1)
    /* 1624C 8014FE44 15000224 */  addiu      $v0, $zero, 0x15
  .L8014FE48:
    /* 16250 8014FE48 02006214 */  bne        $v1, $v0, .L8014FE54
    /* 16254 8014FE4C 16000224 */   addiu     $v0, $zero, 0x16
    /* 16258 8014FE50 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8014FE54:
    /* 1625C 8014FE54 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16260 8014FE58 17000224 */  addiu      $v0, $zero, 0x17
    /* 16264 8014FE5C 02006214 */  bne        $v1, $v0, .L8014FE68
    /* 16268 8014FE60 1D000224 */   addiu     $v0, $zero, 0x1D
    /* 1626C 8014FE64 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8014FE68:
    /* 16270 8014FE68 C9F6000C */  jal        ENG_random__Fl
    /* 16274 8014FE6C FDFFC424 */   addiu     $a0, $a2, -0x3
    /* 16278 8014FE70 01004324 */  addiu      $v1, $v0, 0x1
    /* 1627C 8014FE74 21200302 */  addu       $a0, $s0, $v1
    /* 16280 8014FE78 40200400 */  sll        $a0, $a0, 1
    /* 16284 8014FE7C 21189100 */  addu       $v1, $a0, $s1
    /* 16288 8014FE80 35000224 */  addiu      $v0, $zero, 0x35
    /* 1628C 8014FE84 000062A4 */  sh         $v0, 0x0($v1)
    /* 16290 8014FE88 34000224 */  addiu      $v0, $zero, 0x34
    /* 16294 8014FE8C 040062A4 */  sh         $v0, 0x4($v1)
    /* 16298 8014FE90 06000224 */  addiu      $v0, $zero, 0x6
    /* 1629C 8014FE94 020062A4 */  sh         $v0, 0x2($v1)
    /* 162A0 8014FE98 A0FF6226 */  addiu      $v0, $s3, -0x60
    /* 162A4 8014FE9C 21104202 */  addu       $v0, $s2, $v0
    /* 162A8 8014FEA0 21208200 */  addu       $a0, $a0, $v0
    /* 162AC 8014FEA4 00008294 */  lhu        $v0, 0x0($a0)
    /* 162B0 8014FEA8 06000324 */  addiu      $v1, $zero, 0x6
    /* 162B4 8014FEAC 02004314 */  bne        $v0, $v1, .L8014FEB8
    /* 162B8 8014FEB0 36000224 */   addiu     $v0, $zero, 0x36
    /* 162BC 8014FEB4 000082A4 */  sh         $v0, 0x0($a0)
  .L8014FEB8:
    /* 162C0 8014FEB8 FEFF8294 */  lhu        $v0, -0x2($a0)
    /* 162C4 8014FEBC 00000000 */  nop
    /* 162C8 8014FEC0 02004314 */  bne        $v0, $v1, .L8014FECC
    /* 162CC 8014FEC4 37000224 */   addiu     $v0, $zero, 0x37
    /* 162D0 8014FEC8 FEFF82A4 */  sh         $v0, -0x2($a0)
  .L8014FECC:
    /* 162D4 8014FECC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 162D8 8014FED0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 162DC 8014FED4 1800B28F */  lw         $s2, 0x18($sp)
    /* 162E0 8014FED8 1400B18F */  lw         $s1, 0x14($sp)
    /* 162E4 8014FEDC 1000B08F */  lw         $s0, 0x10($sp)
    /* 162E8 8014FEE0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 162EC 8014FEE4 0800E003 */  jr         $ra
    /* 162F0 8014FEE8 00000000 */   nop
endlabel L4VertWall__Fiii
