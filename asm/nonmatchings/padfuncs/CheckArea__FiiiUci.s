.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckArea__FiiiUci, 0x5E4

glabel CheckArea__FiiiUci
    /* 93A9C 800A3A9C 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 93AA0 800A3AA0 4400B1AF */  sw         $s1, 0x44($sp)
    /* 93AA4 800A3AA4 2188E000 */  addu       $s1, $a3, $zero
    /* 93AA8 800A3AA8 4000B0AF */  sw         $s0, 0x40($sp)
    /* 93AAC 800A3AAC 7800B08F */  lw         $s0, 0x78($sp)
    /* 93AB0 800A3AB0 0E80033C */  lui        $v1, %hi(plr)
    /* 93AB4 800A3AB4 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 93AB8 800A3AB8 6400BFAF */  sw         $ra, 0x64($sp)
    /* 93ABC 800A3ABC 6000BEAF */  sw         $fp, 0x60($sp)
    /* 93AC0 800A3AC0 5C00B7AF */  sw         $s7, 0x5C($sp)
    /* 93AC4 800A3AC4 5800B6AF */  sw         $s6, 0x58($sp)
    /* 93AC8 800A3AC8 5400B5AF */  sw         $s5, 0x54($sp)
    /* 93ACC 800A3ACC 5000B4AF */  sw         $s4, 0x50($sp)
    /* 93AD0 800A3AD0 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 93AD4 800A3AD4 4800B2AF */  sw         $s2, 0x48($sp)
    /* 93AD8 800A3AD8 1000A4AF */  sw         $a0, 0x10($sp)
    /* 93ADC 800A3ADC 1800A5AF */  sw         $a1, 0x18($sp)
    /* 93AE0 800A3AE0 21200002 */  addu       $a0, $s0, $zero
    /* 93AE4 800A3AE4 40101000 */  sll        $v0, $s0, 1
    /* 93AE8 800A3AE8 21105000 */  addu       $v0, $v0, $s0
    /* 93AEC 800A3AEC 80100200 */  sll        $v0, $v0, 2
    /* 93AF0 800A3AF0 21105000 */  addu       $v0, $v0, $s0
    /* 93AF4 800A3AF4 00110200 */  sll        $v0, $v0, 4
    /* 93AF8 800A3AF8 23105000 */  subu       $v0, $v0, $s0
    /* 93AFC 800A3AFC 80100200 */  sll        $v0, $v0, 2
    /* 93B00 800A3B00 21105000 */  addu       $v0, $v0, $s0
    /* 93B04 800A3B04 C0100200 */  sll        $v0, $v0, 3
    /* 93B08 800A3B08 21104300 */  addu       $v0, $v0, $v1
    /* 93B0C 800A3B0C A4BF020C */  jal        GetSpellTarget__Fi
    /* 93B10 800A3B10 2000A2AF */   sw        $v0, 0x20($sp)
    /* 93B14 800A3B14 1280033C */  lui        $v1, %hi(myplr)
    /* 93B18 800A3B18 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 93B1C 800A3B1C FFFF1724 */  addiu      $s7, $zero, -0x1
    /* 93B20 800A3B20 2800A2AF */  sw         $v0, 0x28($sp)
    /* 93B24 800A3B24 27180300 */  nor        $v1, $zero, $v1
    /* 93B28 800A3B28 2B180300 */  sltu       $v1, $zero, $v1
    /* 93B2C 800A3B2C 3D001712 */  beq        $s0, $s7, .L800A3C24
    /* 93B30 800A3B30 3000A3AF */   sw        $v1, 0x30($sp)
    /* 93B34 800A3B34 FF002232 */  andi       $v0, $s1, 0xFF
    /* 93B38 800A3B38 3A004014 */  bnez       $v0, .L800A3C24
    /* 93B3C 800A3B3C 00000000 */   nop
    /* 93B40 800A3B40 1280023C */  lui        $v0, %hi(leveltype)
    /* 93B44 800A3B44 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 93B48 800A3B48 00000000 */  nop
    /* 93B4C 800A3B4C 35004010 */  beqz       $v0, .L800A3C24
    /* 93B50 800A3B50 00000000 */   nop
    /* 93B54 800A3B54 9B006010 */  beqz       $v1, .L800A3DC4
    /* 93B58 800A3B58 21A80000 */   addu      $s5, $zero, $zero
    /* 93B5C 800A3B5C 1280163C */  lui        $s6, %hi(_pcursmonst)
    /* 93B60 800A3B60 58B7D626 */  addiu      $s6, $s6, %lo(_pcursmonst)
    /* 93B64 800A3B64 2000A88F */  lw         $t0, 0x20($sp)
    /* 93B68 800A3B68 FFFF1E24 */  addiu      $fp, $zero, -0x1
    /* 93B6C 800A3B6C 42001181 */  lb         $s1, 0x42($t0)
    /* 93B70 800A3B70 1280083C */  lui        $t0, %hi(offset_x)
    /* 93B74 800A3B74 A8C20825 */  addiu      $t0, $t0, %lo(offset_x)
    /* 93B78 800A3B78 21102802 */  addu       $v0, $s1, $t0
    /* 93B7C 800A3B7C 1280083C */  lui        $t0, %hi(offset_y)
    /* 93B80 800A3B80 B0C20825 */  addiu      $t0, $t0, %lo(offset_y)
    /* 93B84 800A3B84 21182802 */  addu       $v1, $s1, $t0
    /* 93B88 800A3B88 00005280 */  lb         $s2, 0x0($v0)
    /* 93B8C 800A3B8C 2000A88F */  lw         $t0, 0x20($sp)
    /* 93B90 800A3B90 00007180 */  lb         $s1, 0x0($v1)
    /* 93B94 800A3B94 30000285 */  lh         $v0, 0x30($t0)
    /* 93B98 800A3B98 32000385 */  lh         $v1, 0x32($t0)
    /* 93B9C 800A3B9C 21A05200 */  addu       $s4, $v0, $s2
    /* 93BA0 800A3BA0 21987100 */  addu       $s3, $v1, $s1
  .L800A3BA4:
    /* 93BA4 800A3BA4 1280023C */  lui        $v0, %hi(sel_data)
    /* 93BA8 800A3BA8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93BAC 800A3BAC 00000000 */  nop
    /* 93BB0 800A3BB0 80100200 */  sll        $v0, $v0, 2
    /* 93BB4 800A3BB4 21105600 */  addu       $v0, $v0, $s6
    /* 93BB8 800A3BB8 0000508C */  lw         $s0, 0x0($v0)
    /* 93BBC 800A3BBC 00000000 */  nop
    /* 93BC0 800A3BC0 18001E16 */  bne        $s0, $fp, .L800A3C24
    /* 93BC4 800A3BC4 21208002 */   addu      $a0, $s4, $zero
    /* 93BC8 800A3BC8 21286002 */  addu       $a1, $s3, $zero
    /* 93BCC 800A3BCC C98D020C */  jal        CheckRangeObject__Fiii
    /* 93BD0 800A3BD0 21300000 */   addu      $a2, $zero, $zero
    /* 93BD4 800A3BD4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 93BD8 800A3BD8 0D004010 */  beqz       $v0, .L800A3C10
    /* 93BDC 800A3BDC 00000000 */   nop
    /* 93BE0 800A3BE0 0B00F016 */  bne        $s7, $s0, .L800A3C10
    /* 93BE4 800A3BE4 00000000 */   nop
    /* 93BE8 800A3BE8 1280023C */  lui        $v0, %hi(sel_data)
    /* 93BEC 800A3BEC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93BF0 800A3BF0 00000000 */  nop
    /* 93BF4 800A3BF4 80100200 */  sll        $v0, $v0, 2
    /* 93BF8 800A3BF8 21105600 */  addu       $v0, $v0, $s6
    /* 93BFC 800A3BFC 0000428C */  lw         $v0, 0x0($v0)
    /* 93C00 800A3C00 00000000 */  nop
    /* 93C04 800A3C04 02005710 */  beq        $v0, $s7, .L800A3C10
    /* 93C08 800A3C08 00000000 */   nop
    /* 93C0C 800A3C0C 21B84000 */  addu       $s7, $v0, $zero
  .L800A3C10:
    /* 93C10 800A3C10 21A09202 */  addu       $s4, $s4, $s2
    /* 93C14 800A3C14 0100B526 */  addiu      $s5, $s5, 0x1
    /* 93C18 800A3C18 0500A22A */  slti       $v0, $s5, 0x5
    /* 93C1C 800A3C1C E1FF4014 */  bnez       $v0, .L800A3BA4
    /* 93C20 800A3C20 21987102 */   addu      $s3, $s3, $s1
  .L800A3C24:
    /* 93C24 800A3C24 3000A88F */  lw         $t0, 0x30($sp)
    /* 93C28 800A3C28 00000000 */  nop
    /* 93C2C 800A3C2C 65000011 */  beqz       $t0, .L800A3DC4
    /* 93C30 800A3C30 00000000 */   nop
    /* 93C34 800A3C34 1280023C */  lui        $v0, %hi(sel_data)
    /* 93C38 800A3C38 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93C3C 800A3C3C 00000000 */  nop
    /* 93C40 800A3C40 80100200 */  sll        $v0, $v0, 2
    /* 93C44 800A3C44 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 93C48 800A3C48 21082200 */  addu       $at, $at, $v0
    /* 93C4C 800A3C4C 58B7238C */  lw         $v1, %lo(_pcursmonst)($at)
    /* 93C50 800A3C50 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 93C54 800A3C54 26006210 */  beq        $v1, $v0, .L800A3CF0
    /* 93C58 800A3C58 40100300 */   sll       $v0, $v1, 1
    /* 93C5C 800A3C5C 21104300 */  addu       $v0, $v0, $v1
    /* 93C60 800A3C60 80100200 */  sll        $v0, $v0, 2
    /* 93C64 800A3C64 21104300 */  addu       $v0, $v0, $v1
    /* 93C68 800A3C68 C0100200 */  sll        $v0, $v0, 3
    /* 93C6C 800A3C6C 2000A88F */  lw         $t0, 0x20($sp)
    /* 93C70 800A3C70 1080033C */  lui        $v1, %hi(monster)
    /* 93C74 800A3C74 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 93C78 800A3C78 D1000481 */  lb         $a0, 0xD1($t0)
    /* 93C7C 800A3C7C 00000000 */  nop
    /* 93C80 800A3C80 1B008014 */  bnez       $a0, .L800A3CF0
    /* 93C84 800A3C84 21804300 */   addu      $s0, $v0, $v1
    /* 93C88 800A3C88 34000482 */  lb         $a0, 0x34($s0)
    /* 93C8C 800A3C8C 1000A88F */  lw         $t0, 0x10($sp)
    /* 93C90 800A3C90 21880000 */  addu       $s1, $zero, $zero
    /* 93C94 800A3C94 6D41000C */  jal        abs
    /* 93C98 800A3C98 23200401 */   subu      $a0, $t0, $a0
    /* 93C9C 800A3C9C 02004228 */  slti       $v0, $v0, 0x2
    /* 93CA0 800A3CA0 08004010 */  beqz       $v0, .L800A3CC4
    /* 93CA4 800A3CA4 00000000 */   nop
    /* 93CA8 800A3CA8 35000482 */  lb         $a0, 0x35($s0)
    /* 93CAC 800A3CAC 1800A88F */  lw         $t0, 0x18($sp)
    /* 93CB0 800A3CB0 6D41000C */  jal        abs
    /* 93CB4 800A3CB4 23200401 */   subu      $a0, $t0, $a0
    /* 93CB8 800A3CB8 02004228 */  slti       $v0, $v0, 0x2
    /* 93CBC 800A3CBC 02004014 */  bnez       $v0, .L800A3CC8
    /* 93CC0 800A3CC0 00000000 */   nop
  .L800A3CC4:
    /* 93CC4 800A3CC4 01001124 */  addiu      $s1, $zero, 0x1
  .L800A3CC8:
    /* 93CC8 800A3CC8 09002012 */  beqz       $s1, .L800A3CF0
    /* 93CCC 800A3CCC FFFF0324 */   addiu     $v1, $zero, -0x1
    /* 93CD0 800A3CD0 FFFF1724 */  addiu      $s7, $zero, -0x1
    /* 93CD4 800A3CD4 1280023C */  lui        $v0, %hi(sel_data)
    /* 93CD8 800A3CD8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93CDC 800A3CDC 00000000 */  nop
    /* 93CE0 800A3CE0 80100200 */  sll        $v0, $v0, 2
    /* 93CE4 800A3CE4 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 93CE8 800A3CE8 21082200 */  addu       $at, $at, $v0
    /* 93CEC 800A3CEC 58B723AC */  sw         $v1, %lo(_pcursmonst)($at)
  .L800A3CF0:
    /* 93CF0 800A3CF0 1280033C */  lui        $v1, %hi(sel_data)
    /* 93CF4 800A3CF4 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 93CF8 800A3CF8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 93CFC 800A3CFC 1280013C */  lui        $at, %hi(_pcursitem)
    /* 93D00 800A3D00 21082300 */  addu       $at, $at, $v1
    /* 93D04 800A3D04 64B722A0 */  sb         $v0, %lo(_pcursitem)($at)
    /* 93D08 800A3D08 1280013C */  lui        $at, %hi(_pcursobj)
    /* 93D0C 800A3D0C 21082300 */  addu       $at, $at, $v1
    /* 93D10 800A3D10 60B722A0 */  sb         $v0, %lo(_pcursobj)($at)
    /* 93D14 800A3D14 1280023C */  lui        $v0, %hi(sel_data)
    /* 93D18 800A3D18 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93D1C 800A3D1C 1280013C */  lui        $at, %hi(_pfind_index)
    /* 93D20 800A3D20 21082200 */  addu       $at, $at, $v0
    /* 93D24 800A3D24 DCBB20A0 */  sb         $zero, %lo(_pfind_index)($at)
    /* 93D28 800A3D28 2000A88F */  lw         $t0, 0x20($sp)
    /* 93D2C 800A3D2C 00000000 */  nop
    /* 93D30 800A3D30 42001181 */  lb         $s1, 0x42($t0)
    /* 93D34 800A3D34 1800A88F */  lw         $t0, 0x18($sp)
    /* 93D38 800A3D38 00000000 */  nop
    /* 93D3C 800A3D3C C0180800 */  sll        $v1, $t0, 3
    /* 93D40 800A3D40 1000A88F */  lw         $t0, 0x10($sp)
    /* 93D44 800A3D44 00000000 */  nop
    /* 93D48 800A3D48 C0100800 */  sll        $v0, $t0, 3
    /* 93D4C 800A3D4C 23104800 */  subu       $v0, $v0, $t0
    /* 93D50 800A3D50 C0110200 */  sll        $v0, $v0, 7
    /* 93D54 800A3D54 21186200 */  addu       $v1, $v1, $v0
    /* 93D58 800A3D58 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 93D5C 800A3D5C 21082300 */  addu       $at, $at, $v1
    /* 93D60 800A3D60 2C7A2480 */  lb         $a0, %lo(dung_map + 0x4)($at)
    /* 93D64 800A3D64 1280033C */  lui        $v1, %hi(_pcursitem)
    /* 93D68 800A3D68 64B76324 */  addiu      $v1, $v1, %lo(_pcursitem)
    /* 93D6C 800A3D6C 16008010 */  beqz       $a0, .L800A3DC8
    /* 93D70 800A3D70 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 93D74 800A3D74 C0100400 */  sll        $v0, $a0, 3
    /* 93D78 800A3D78 23104400 */  subu       $v0, $v0, $a0
    /* 93D7C 800A3D7C 80100200 */  sll        $v0, $v0, 2
    /* 93D80 800A3D80 23104400 */  subu       $v0, $v0, $a0
    /* 93D84 800A3D84 80100200 */  sll        $v0, $v0, 2
    /* 93D88 800A3D88 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 93D8C 800A3D8C 21082200 */  addu       $at, $at, $v0
    /* 93D90 800A3D90 A41D2280 */  lb         $v0, %lo(item + 0x50)($at)
    /* 93D94 800A3D94 00000000 */  nop
    /* 93D98 800A3D98 0C004018 */  blez       $v0, .L800A3DCC
    /* 93D9C 800A3D9C 01002232 */   andi      $v0, $s1, 0x1
    /* 93DA0 800A3DA0 1000A58F */  lw         $a1, 0x10($sp)
    /* 93DA4 800A3DA4 1280023C */  lui        $v0, %hi(sel_data)
    /* 93DA8 800A3DA8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93DAC 800A3DAC 1800A68F */  lw         $a2, 0x18($sp)
    /* 93DB0 800A3DB0 21104300 */  addu       $v0, $v0, $v1
    /* 93DB4 800A3DB4 AD8D020C */  jal        add_area_find_object__Fiii
    /* 93DB8 800A3DB8 000044A0 */   sb        $a0, 0x0($v0)
    /* 93DBC 800A3DBC 738F0208 */  j          .L800A3DCC
    /* 93DC0 800A3DC0 01002232 */   andi      $v0, $s1, 0x1
  .L800A3DC4:
    /* 93DC4 800A3DC4 21880000 */  addu       $s1, $zero, $zero
  .L800A3DC8:
    /* 93DC8 800A3DC8 01002232 */  andi       $v0, $s1, 0x1
  .L800A3DCC:
    /* 93DCC 800A3DCC 1000B48F */  lw         $s4, 0x10($sp)
    /* 93DD0 800A3DD0 1800B38F */  lw         $s3, 0x18($sp)
    /* 93DD4 800A3DD4 02004014 */  bnez       $v0, .L800A3DE0
    /* 93DD8 800A3DD8 01001524 */   addiu     $s5, $zero, 0x1
    /* 93DDC 800A3DDC 01003126 */  addiu      $s1, $s1, 0x1
  .L800A3DE0:
    /* 93DE0 800A3DE0 FFFF1E24 */  addiu      $fp, $zero, -0x1
  .L800A3DE4:
    /* 93DE4 800A3DE4 0A00A22A */  slti       $v0, $s5, 0xA
    /* 93DE8 800A3DE8 3B004010 */  beqz       $v0, .L800A3ED8
    /* 93DEC 800A3DEC 21B00000 */   addu      $s6, $zero, $zero
  .L800A3DF0:
    /* 93DF0 800A3DF0 0200C22A */  slti       $v0, $s6, 0x2
    /* 93DF4 800A3DF4 36004010 */  beqz       $v0, .L800A3ED0
    /* 93DF8 800A3DF8 21900000 */   addu      $s2, $zero, $zero
  .L800A3DFC:
    /* 93DFC 800A3DFC 2A105502 */  slt        $v0, $s2, $s5
    /* 93E00 800A3E00 2F004010 */  beqz       $v0, .L800A3EC0
    /* 93E04 800A3E04 21800000 */   addu      $s0, $zero, $zero
    /* 93E08 800A3E08 1280083C */  lui        $t0, %hi(offset_x)
    /* 93E0C 800A3E0C A8C20825 */  addiu      $t0, $t0, %lo(offset_x)
    /* 93E10 800A3E10 21101101 */  addu       $v0, $t0, $s1
    /* 93E14 800A3E14 1280083C */  lui        $t0, %hi(offset_y)
    /* 93E18 800A3E18 B0C20825 */  addiu      $t0, $t0, %lo(offset_y)
    /* 93E1C 800A3E1C 21181101 */  addu       $v1, $t0, $s1
    /* 93E20 800A3E20 00004280 */  lb         $v0, 0x0($v0)
    /* 93E24 800A3E24 00006380 */  lb         $v1, 0x0($v1)
    /* 93E28 800A3E28 1000A88F */  lw         $t0, 0x10($sp)
    /* 93E2C 800A3E2C 21A08202 */  addu       $s4, $s4, $v0
    /* 93E30 800A3E30 21986302 */  addu       $s3, $s3, $v1
    /* 93E34 800A3E34 6D41000C */  jal        abs
    /* 93E38 800A3E38 23201401 */   subu      $a0, $t0, $s4
    /* 93E3C 800A3E3C 02004228 */  slti       $v0, $v0, 0x2
    /* 93E40 800A3E40 06004010 */  beqz       $v0, .L800A3E5C
    /* 93E44 800A3E44 21208002 */   addu      $a0, $s4, $zero
    /* 93E48 800A3E48 1800A88F */  lw         $t0, 0x18($sp)
    /* 93E4C 800A3E4C 6D41000C */  jal        abs
    /* 93E50 800A3E50 23201301 */   subu      $a0, $t0, $s3
    /* 93E54 800A3E54 02005028 */  slti       $s0, $v0, 0x2
    /* 93E58 800A3E58 21208002 */  addu       $a0, $s4, $zero
  .L800A3E5C:
    /* 93E5C 800A3E5C 21286002 */  addu       $a1, $s3, $zero
    /* 93E60 800A3E60 C98D020C */  jal        CheckRangeObject__Fiii
    /* 93E64 800A3E64 21300002 */   addu      $a2, $s0, $zero
    /* 93E68 800A3E68 FF004230 */  andi       $v0, $v0, 0xFF
    /* 93E6C 800A3E6C 12004010 */  beqz       $v0, .L800A3EB8
    /* 93E70 800A3E70 00000000 */   nop
    /* 93E74 800A3E74 1280023C */  lui        $v0, %hi(sel_data)
    /* 93E78 800A3E78 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93E7C 800A3E7C 1280083C */  lui        $t0, %hi(_pcursmonst)
    /* 93E80 800A3E80 58B70825 */  addiu      $t0, $t0, %lo(_pcursmonst)
    /* 93E84 800A3E84 80100200 */  sll        $v0, $v0, 2
    /* 93E88 800A3E88 21104800 */  addu       $v0, $v0, $t0
    /* 93E8C 800A3E8C 0000428C */  lw         $v0, 0x0($v0)
    /* 93E90 800A3E90 00000000 */  nop
    /* 93E94 800A3E94 08005E10 */  beq        $v0, $fp, .L800A3EB8
    /* 93E98 800A3E98 00000000 */   nop
    /* 93E9C 800A3E9C 3000A88F */  lw         $t0, 0x30($sp)
    /* 93EA0 800A3EA0 00000000 */  nop
    /* 93EA4 800A3EA4 68000011 */  beqz       $t0, .L800A4048
    /* 93EA8 800A3EA8 00000000 */   nop
    /* 93EAC 800A3EAC 0200FE16 */  bne        $s7, $fp, .L800A3EB8
    /* 93EB0 800A3EB0 00000000 */   nop
    /* 93EB4 800A3EB4 21B84000 */  addu       $s7, $v0, $zero
  .L800A3EB8:
    /* 93EB8 800A3EB8 7F8F0208 */  j          .L800A3DFC
    /* 93EBC 800A3EBC 01005226 */   addiu     $s2, $s2, 0x1
  .L800A3EC0:
    /* 93EC0 800A3EC0 02003126 */  addiu      $s1, $s1, 0x2
    /* 93EC4 800A3EC4 07003132 */  andi       $s1, $s1, 0x7
    /* 93EC8 800A3EC8 7C8F0208 */  j          .L800A3DF0
    /* 93ECC 800A3ECC 0100D626 */   addiu     $s6, $s6, 0x1
  .L800A3ED0:
    /* 93ED0 800A3ED0 798F0208 */  j          .L800A3DE4
    /* 93ED4 800A3ED4 0100B526 */   addiu     $s5, $s5, 0x1
  .L800A3ED8:
    /* 93ED8 800A3ED8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 93EDC 800A3EDC 5600E212 */  beq        $s7, $v0, .L800A4038
    /* 93EE0 800A3EE0 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 93EE4 800A3EE4 1280023C */  lui        $v0, %hi(leveltype)
    /* 93EE8 800A3EE8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 93EEC 800A3EEC 00000000 */  nop
    /* 93EF0 800A3EF0 26004010 */  beqz       $v0, .L800A3F8C
    /* 93EF4 800A3EF4 40101700 */   sll       $v0, $s7, 1
    /* 93EF8 800A3EF8 21105700 */  addu       $v0, $v0, $s7
    /* 93EFC 800A3EFC 80100200 */  sll        $v0, $v0, 2
    /* 93F00 800A3F00 21105700 */  addu       $v0, $v0, $s7
    /* 93F04 800A3F04 C0100200 */  sll        $v0, $v0, 3
    /* 93F08 800A3F08 1080033C */  lui        $v1, %hi(monster)
    /* 93F0C 800A3F0C 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 93F10 800A3F10 21804300 */  addu       $s0, $v0, $v1
    /* 93F14 800A3F14 2800A48F */  lw         $a0, 0x28($sp)
    /* 93F18 800A3F18 34000682 */  lb         $a2, 0x34($s0)
    /* 93F1C 800A3F1C 35000782 */  lb         $a3, 0x35($s0)
    /* 93F20 800A3F20 45BF020C */  jal        ForceTarget__11SpellTargetiii
    /* 93F24 800A3F24 2128E002 */   addu      $a1, $s7, $zero
    /* 93F28 800A3F28 2000A88F */  lw         $t0, 0x20($sp)
    /* 93F2C 800A3F2C 00000000 */  nop
    /* 93F30 800A3F30 D1000281 */  lb         $v0, 0xD1($t0)
    /* 93F34 800A3F34 00000000 */  nop
    /* 93F38 800A3F38 36004014 */  bnez       $v0, .L800A4014
    /* 93F3C 800A3F3C 21880000 */   addu      $s1, $zero, $zero
    /* 93F40 800A3F40 34000482 */  lb         $a0, 0x34($s0)
    /* 93F44 800A3F44 1000A88F */  lw         $t0, 0x10($sp)
    /* 93F48 800A3F48 6D41000C */  jal        abs
    /* 93F4C 800A3F4C 23200401 */   subu      $a0, $t0, $a0
    /* 93F50 800A3F50 02004228 */  slti       $v0, $v0, 0x2
    /* 93F54 800A3F54 08004010 */  beqz       $v0, .L800A3F78
    /* 93F58 800A3F58 00000000 */   nop
    /* 93F5C 800A3F5C 35000482 */  lb         $a0, 0x35($s0)
    /* 93F60 800A3F60 1800A88F */  lw         $t0, 0x18($sp)
    /* 93F64 800A3F64 6D41000C */  jal        abs
    /* 93F68 800A3F68 23200401 */   subu      $a0, $t0, $a0
    /* 93F6C 800A3F6C 02004228 */  slti       $v0, $v0, 0x2
    /* 93F70 800A3F70 02004014 */  bnez       $v0, .L800A3F7C
    /* 93F74 800A3F74 00000000 */   nop
  .L800A3F78:
    /* 93F78 800A3F78 01001124 */  addiu      $s1, $zero, 0x1
  .L800A3F7C:
    /* 93F7C 800A3F7C 25002012 */  beqz       $s1, .L800A4014
    /* 93F80 800A3F80 00000000 */   nop
    /* 93F84 800A3F84 FC8F0208 */  j          .L800A3FF0
    /* 93F88 800A3F88 00000000 */   nop
  .L800A3F8C:
    /* 93F8C 800A3F8C 21105700 */  addu       $v0, $v0, $s7
    /* 93F90 800A3F90 00110200 */  sll        $v0, $v0, 4
    /* 93F94 800A3F94 21105700 */  addu       $v0, $v0, $s7
    /* 93F98 800A3F98 80100200 */  sll        $v0, $v0, 2
    /* 93F9C 800A3F9C 0D80033C */  lui        $v1, %hi(towner)
    /* 93FA0 800A3FA0 80FE6324 */  addiu      $v1, $v1, %lo(towner)
    /* 93FA4 800A3FA4 21804300 */  addu       $s0, $v0, $v1
    /* 93FA8 800A3FA8 0800048E */  lw         $a0, 0x8($s0)
    /* 93FAC 800A3FAC 1000A88F */  lw         $t0, 0x10($sp)
    /* 93FB0 800A3FB0 21880000 */  addu       $s1, $zero, $zero
    /* 93FB4 800A3FB4 6D41000C */  jal        abs
    /* 93FB8 800A3FB8 23200401 */   subu      $a0, $t0, $a0
    /* 93FBC 800A3FBC 02004228 */  slti       $v0, $v0, 0x2
    /* 93FC0 800A3FC0 08004010 */  beqz       $v0, .L800A3FE4
    /* 93FC4 800A3FC4 00000000 */   nop
    /* 93FC8 800A3FC8 0C00048E */  lw         $a0, 0xC($s0)
    /* 93FCC 800A3FCC 1800A88F */  lw         $t0, 0x18($sp)
    /* 93FD0 800A3FD0 6D41000C */  jal        abs
    /* 93FD4 800A3FD4 23200401 */   subu      $a0, $t0, $a0
    /* 93FD8 800A3FD8 02004228 */  slti       $v0, $v0, 0x2
    /* 93FDC 800A3FDC 02004014 */  bnez       $v0, .L800A3FE8
    /* 93FE0 800A3FE0 00000000 */   nop
  .L800A3FE4:
    /* 93FE4 800A3FE4 01001124 */  addiu      $s1, $zero, 0x1
  .L800A3FE8:
    /* 93FE8 800A3FE8 0A002012 */  beqz       $s1, .L800A4014
    /* 93FEC 800A3FEC 00000000 */   nop
  .L800A3FF0:
    /* 93FF0 800A3FF0 1280023C */  lui        $v0, %hi(sel_data)
    /* 93FF4 800A3FF4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93FF8 800A3FF8 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 93FFC 800A3FFC 80100200 */  sll        $v0, $v0, 2
    /* 94000 800A4000 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 94004 800A4004 21082200 */  addu       $at, $at, $v0
    /* 94008 800A4008 58B723AC */  sw         $v1, %lo(_pcursmonst)($at)
    /* 9400C 800A400C 13900208 */  j          .L800A404C
    /* 94010 800A4010 01000224 */   addiu     $v0, $zero, 0x1
  .L800A4014:
    /* 94014 800A4014 1280023C */  lui        $v0, %hi(sel_data)
    /* 94018 800A4018 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 9401C 800A401C 00000000 */  nop
    /* 94020 800A4020 80100200 */  sll        $v0, $v0, 2
    /* 94024 800A4024 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 94028 800A4028 21082200 */  addu       $at, $at, $v0
    /* 9402C 800A402C 58B737AC */  sw         $s7, %lo(_pcursmonst)($at)
    /* 94030 800A4030 13900208 */  j          .L800A404C
    /* 94034 800A4034 01000224 */   addiu     $v0, $zero, 0x1
  .L800A4038:
    /* 94038 800A4038 2800A48F */  lw         $a0, 0x28($sp)
    /* 9403C 800A403C 21300000 */  addu       $a2, $zero, $zero
    /* 94040 800A4040 45BF020C */  jal        ForceTarget__11SpellTargetiii
    /* 94044 800A4044 21380000 */   addu      $a3, $zero, $zero
  .L800A4048:
    /* 94048 800A4048 01000224 */  addiu      $v0, $zero, 0x1
  .L800A404C:
    /* 9404C 800A404C 6400BF8F */  lw         $ra, 0x64($sp)
    /* 94050 800A4050 6000BE8F */  lw         $fp, 0x60($sp)
    /* 94054 800A4054 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 94058 800A4058 5800B68F */  lw         $s6, 0x58($sp)
    /* 9405C 800A405C 5400B58F */  lw         $s5, 0x54($sp)
    /* 94060 800A4060 5000B48F */  lw         $s4, 0x50($sp)
    /* 94064 800A4064 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 94068 800A4068 4800B28F */  lw         $s2, 0x48($sp)
    /* 9406C 800A406C 4400B18F */  lw         $s1, 0x44($sp)
    /* 94070 800A4070 4000B08F */  lw         $s0, 0x40($sp)
    /* 94074 800A4074 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 94078 800A4078 0800E003 */  jr         $ra
    /* 9407C 800A407C 00000000 */   nop
endlabel CheckArea__FiiiUci
