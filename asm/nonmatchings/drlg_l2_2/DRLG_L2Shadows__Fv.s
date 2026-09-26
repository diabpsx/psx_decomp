.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2Shadows__Fv, 0x1C4

glabel DRLG_L2Shadows__Fv
    /* A088 80143C80 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* A08C 80143C84 01000C24 */  addiu      $t4, $zero, 0x1
    /* A090 80143C88 0E800E3C */  lui        $t6, %hi(dungeon)
    /* A094 80143C8C C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* A098 80143C90 A0FFCF25 */  addiu      $t7, $t6, -0x60
    /* A09C 80143C94 01000924 */  addiu      $t1, $zero, 0x1
  .L80143C98:
    /* A0A0 80143C98 40680C00 */  sll        $t5, $t4, 1
    /* A0A4 80143C9C 6000CB25 */  addiu      $t3, $t6, 0x60
    /* A0A8 80143CA0 6000EA25 */  addiu      $t2, $t7, 0x60
  .L80143CA4:
    /* A0AC 80143CA4 2120AB01 */  addu       $a0, $t5, $t3
    /* A0B0 80143CA8 00008294 */  lhu        $v0, 0x0($a0)
    /* A0B4 80143CAC 1480013C */  lui        $at, %hi(BSTYPESL2)
    /* A0B8 80143CB0 21082200 */  addu       $at, $at, $v0
    /* A0BC 80143CB4 E00F2290 */  lbu        $v0, %lo(BSTYPESL2)($at)
    /* A0C0 80143CB8 2118AA01 */  addu       $v1, $t5, $t2
    /* A0C4 80143CBC 0000A2A3 */  sb         $v0, 0x0($sp)
    /* A0C8 80143CC0 00006294 */  lhu        $v0, 0x0($v1)
    /* A0CC 80143CC4 1480013C */  lui        $at, %hi(BSTYPESL2)
    /* A0D0 80143CC8 21082200 */  addu       $at, $at, $v0
    /* A0D4 80143CCC E00F2290 */  lbu        $v0, %lo(BSTYPESL2)($at)
    /* A0D8 80143CD0 00000000 */  nop
    /* A0DC 80143CD4 0200A2A3 */  sb         $v0, 0x2($sp)
    /* A0E0 80143CD8 FEFF8294 */  lhu        $v0, -0x2($a0)
    /* A0E4 80143CDC 1480013C */  lui        $at, %hi(BSTYPESL2)
    /* A0E8 80143CE0 21082200 */  addu       $at, $at, $v0
    /* A0EC 80143CE4 E00F2290 */  lbu        $v0, %lo(BSTYPESL2)($at)
    /* A0F0 80143CE8 21406000 */  addu       $t0, $v1, $zero
    /* A0F4 80143CEC 0100A2A3 */  sb         $v0, 0x1($sp)
    /* A0F8 80143CF0 FEFF0295 */  lhu        $v0, -0x2($t0)
    /* A0FC 80143CF4 21380000 */  addu       $a3, $zero, $zero
    /* A100 80143CF8 1480013C */  lui        $at, %hi(BSTYPESL2)
    /* A104 80143CFC 21082200 */  addu       $at, $at, $v0
    /* A108 80143D00 E00F2290 */  lbu        $v0, %lo(BSTYPESL2)($at)
    /* A10C 80143D04 21280000 */  addu       $a1, $zero, $zero
    /* A110 80143D08 0300A2A3 */  sb         $v0, 0x3($sp)
  .L80143D0C:
    /* A114 80143D0C 1480013C */  lui        $at, %hi(SPATSL2)
    /* A118 80143D10 21082500 */  addu       $at, $at, $a1
    /* A11C 80143D14 2C0F2390 */  lbu        $v1, %lo(SPATSL2)($at)
    /* A120 80143D18 0000A293 */  lbu        $v0, 0x0($sp)
    /* A124 80143D1C 00000000 */  nop
    /* A128 80143D20 38006214 */  bne        $v1, $v0, .L80143E04
    /* A12C 80143D24 00000000 */   nop
    /* A130 80143D28 1480013C */  lui        $at, %hi(SPATSL2 + 0x1)
    /* A134 80143D2C 21082500 */  addu       $at, $at, $a1
    /* A138 80143D30 2D0F2390 */  lbu        $v1, %lo(SPATSL2 + 0x1)($at)
    /* A13C 80143D34 00000000 */  nop
    /* A140 80143D38 05006010 */  beqz       $v1, .L80143D50
    /* A144 80143D3C 01000624 */   addiu     $a2, $zero, 0x1
    /* A148 80143D40 0300A293 */  lbu        $v0, 0x3($sp)
    /* A14C 80143D44 00000000 */  nop
    /* A150 80143D48 26106200 */  xor        $v0, $v1, $v0
    /* A154 80143D4C 0100462C */  sltiu      $a2, $v0, 0x1
  .L80143D50:
    /* A158 80143D50 1480013C */  lui        $at, %hi(SPATSL2 + 0x2)
    /* A15C 80143D54 21082500 */  addu       $at, $at, $a1
    /* A160 80143D58 2E0F2390 */  lbu        $v1, %lo(SPATSL2 + 0x2)($at)
    /* A164 80143D5C 00000000 */  nop
    /* A168 80143D60 06006010 */  beqz       $v1, .L80143D7C
    /* A16C 80143D64 00000000 */   nop
    /* A170 80143D68 0100A293 */  lbu        $v0, 0x1($sp)
    /* A174 80143D6C 00000000 */  nop
    /* A178 80143D70 02006210 */  beq        $v1, $v0, .L80143D7C
    /* A17C 80143D74 00000000 */   nop
    /* A180 80143D78 21300000 */  addu       $a2, $zero, $zero
  .L80143D7C:
    /* A184 80143D7C 1480013C */  lui        $at, %hi(SPATSL2 + 0x3)
    /* A188 80143D80 21082500 */  addu       $at, $at, $a1
    /* A18C 80143D84 2F0F2390 */  lbu        $v1, %lo(SPATSL2 + 0x3)($at)
    /* A190 80143D88 00000000 */  nop
    /* A194 80143D8C 06006010 */  beqz       $v1, .L80143DA8
    /* A198 80143D90 01000224 */   addiu     $v0, $zero, 0x1
    /* A19C 80143D94 0200A293 */  lbu        $v0, 0x2($sp)
    /* A1A0 80143D98 00000000 */  nop
    /* A1A4 80143D9C 02006210 */  beq        $v1, $v0, .L80143DA8
    /* A1A8 80143DA0 01000224 */   addiu     $v0, $zero, 0x1
    /* A1AC 80143DA4 21300000 */  addu       $a2, $zero, $zero
  .L80143DA8:
    /* A1B0 80143DA8 1600C214 */  bne        $a2, $v0, .L80143E04
    /* A1B4 80143DAC 00000000 */   nop
    /* A1B8 80143DB0 1480013C */  lui        $at, %hi(SPATSL2 + 0x4)
    /* A1BC 80143DB4 21082500 */  addu       $at, $at, $a1
    /* A1C0 80143DB8 300F2290 */  lbu        $v0, %lo(SPATSL2 + 0x4)($at)
    /* A1C4 80143DBC 00000000 */  nop
    /* A1C8 80143DC0 02004010 */  beqz       $v0, .L80143DCC
    /* A1CC 80143DC4 00000000 */   nop
    /* A1D0 80143DC8 FEFF02A5 */  sh         $v0, -0x2($t0)
  .L80143DCC:
    /* A1D4 80143DCC 1480013C */  lui        $at, %hi(SPATSL2 + 0x5)
    /* A1D8 80143DD0 21082500 */  addu       $at, $at, $a1
    /* A1DC 80143DD4 310F2290 */  lbu        $v0, %lo(SPATSL2 + 0x5)($at)
    /* A1E0 80143DD8 00000000 */  nop
    /* A1E4 80143DDC 02004010 */  beqz       $v0, .L80143DE8
    /* A1E8 80143DE0 00000000 */   nop
    /* A1EC 80143DE4 FEFF82A4 */  sh         $v0, -0x2($a0)
  .L80143DE8:
    /* A1F0 80143DE8 1480013C */  lui        $at, %hi(SPATSL2 + 0x6)
    /* A1F4 80143DEC 21082500 */  addu       $at, $at, $a1
    /* A1F8 80143DF0 320F2290 */  lbu        $v0, %lo(SPATSL2 + 0x6)($at)
    /* A1FC 80143DF4 00000000 */  nop
    /* A200 80143DF8 02004010 */  beqz       $v0, .L80143E04
    /* A204 80143DFC 00000000 */   nop
    /* A208 80143E00 000002A5 */  sh         $v0, 0x0($t0)
  .L80143E04:
    /* A20C 80143E04 0100E724 */  addiu      $a3, $a3, 0x1
    /* A210 80143E08 0200E228 */  slti       $v0, $a3, 0x2
    /* A214 80143E0C BFFF4014 */  bnez       $v0, .L80143D0C
    /* A218 80143E10 0700A524 */   addiu     $a1, $a1, 0x7
    /* A21C 80143E14 60006B25 */  addiu      $t3, $t3, 0x60
    /* A220 80143E18 01002925 */  addiu      $t1, $t1, 0x1
    /* A224 80143E1C 28002229 */  slti       $v0, $t1, 0x28
    /* A228 80143E20 A0FF4014 */  bnez       $v0, .L80143CA4
    /* A22C 80143E24 60004A25 */   addiu     $t2, $t2, 0x60
    /* A230 80143E28 01008C25 */  addiu      $t4, $t4, 0x1
    /* A234 80143E2C 28008229 */  slti       $v0, $t4, 0x28
    /* A238 80143E30 99FF4014 */  bnez       $v0, .L80143C98
    /* A23C 80143E34 01000924 */   addiu     $t1, $zero, 0x1
    /* A240 80143E38 0800BD27 */  addiu      $sp, $sp, 0x8
    /* A244 80143E3C 0800E003 */  jr         $ra
    /* A248 80143E40 00000000 */   nop
endlabel DRLG_L2Shadows__Fv
