.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3SpawnEdge__FiiPi, 0x28C

glabel DRLG_L3SpawnEdge__FiiPi
    /* 10BC4 8014A7BC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 10BC8 8014A7C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 10BCC 8014A7C4 21808000 */  addu       $s0, $a0, $zero
    /* 10BD0 8014A7C8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 10BD4 8014A7CC 2198C000 */  addu       $s3, $a2, $zero
    /* 10BD8 8014A7D0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 10BDC 8014A7D4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 10BE0 8014A7D8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 10BE4 8014A7DC 0000628E */  lw         $v0, 0x0($s3)
    /* 10BE8 8014A7E0 00000000 */  nop
    /* 10BEC 8014A7E4 29004228 */  slti       $v0, $v0, 0x29
    /* 10BF0 8014A7E8 8C004010 */  beqz       $v0, .L8014AA1C
    /* 10BF4 8014A7EC 2190A000 */   addu      $s2, $a1, $zero
    /* 10BF8 8014A7F0 8A000006 */  bltz       $s0, .L8014AA1C
    /* 10BFC 8014A7F4 00000000 */   nop
    /* 10C00 8014A7F8 88004006 */  bltz       $s2, .L8014AA1C
    /* 10C04 8014A7FC 2800022A */   slti      $v0, $s0, 0x28
    /* 10C08 8014A800 86004010 */  beqz       $v0, .L8014AA1C
    /* 10C0C 8014A804 2800422A */   slti      $v0, $s2, 0x28
    /* 10C10 8014A808 84004010 */  beqz       $v0, .L8014AA1C
    /* 10C14 8014A80C 40101000 */   sll       $v0, $s0, 1
    /* 10C18 8014A810 0E80033C */  lui        $v1, %hi(dungeon)
    /* 10C1C 8014A814 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 10C20 8014A818 21105000 */  addu       $v0, $v0, $s0
    /* 10C24 8014A81C 40110200 */  sll        $v0, $v0, 5
    /* 10C28 8014A820 21104300 */  addu       $v0, $v0, $v1
    /* 10C2C 8014A824 40181200 */  sll        $v1, $s2, 1
    /* 10C30 8014A828 21206200 */  addu       $a0, $v1, $v0
    /* 10C34 8014A82C 00008394 */  lhu        $v1, 0x0($a0)
    /* 10C38 8014A830 00000000 */  nop
    /* 10C3C 8014A834 80006230 */  andi       $v0, $v1, 0x80
    /* 10C40 8014A838 7B004014 */  bnez       $v0, .L8014AA28
    /* 10C44 8014A83C 21100000 */   addu      $v0, $zero, $zero
    /* 10C48 8014A840 1000622C */  sltiu      $v0, $v1, 0x10
    /* 10C4C 8014A844 75004010 */  beqz       $v0, .L8014AA1C
    /* 10C50 8014A848 80006234 */   ori       $v0, $v1, 0x80
    /* 10C54 8014A84C 21886000 */  addu       $s1, $v1, $zero
    /* 10C58 8014A850 FF002332 */  andi       $v1, $s1, 0xFF
    /* 10C5C 8014A854 000082A4 */  sh         $v0, 0x0($a0)
    /* 10C60 8014A858 0000628E */  lw         $v0, 0x0($s3)
    /* 10C64 8014A85C 1580013C */  lui        $at, %hi(spawntable)
    /* 10C68 8014A860 21082300 */  addu       $at, $at, $v1
    /* 10C6C 8014A864 B4862390 */  lbu        $v1, %lo(spawntable)($at)
    /* 10C70 8014A868 01004224 */  addiu      $v0, $v0, 0x1
    /* 10C74 8014A86C 08006330 */  andi       $v1, $v1, 0x8
    /* 10C78 8014A870 08006010 */  beqz       $v1, .L8014A894
    /* 10C7C 8014A874 000062AE */   sw        $v0, 0x0($s3)
    /* 10C80 8014A878 21200002 */  addu       $a0, $s0, $zero
    /* 10C84 8014A87C FFFF4526 */  addiu      $a1, $s2, -0x1
    /* 10C88 8014A880 EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10C8C 8014A884 21306002 */   addu      $a2, $s3, $zero
    /* 10C90 8014A888 01000324 */  addiu      $v1, $zero, 0x1
    /* 10C94 8014A88C 66004310 */  beq        $v0, $v1, .L8014AA28
    /* 10C98 8014A890 01000224 */   addiu     $v0, $zero, 0x1
  .L8014A894:
    /* 10C9C 8014A894 FF002232 */  andi       $v0, $s1, 0xFF
    /* 10CA0 8014A898 1580013C */  lui        $at, %hi(spawntable)
    /* 10CA4 8014A89C 21082200 */  addu       $at, $at, $v0
    /* 10CA8 8014A8A0 B4862290 */  lbu        $v0, %lo(spawntable)($at)
    /* 10CAC 8014A8A4 00000000 */  nop
    /* 10CB0 8014A8A8 04004230 */  andi       $v0, $v0, 0x4
    /* 10CB4 8014A8AC 07004010 */  beqz       $v0, .L8014A8CC
    /* 10CB8 8014A8B0 21200002 */   addu      $a0, $s0, $zero
    /* 10CBC 8014A8B4 01004526 */  addiu      $a1, $s2, 0x1
    /* 10CC0 8014A8B8 EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10CC4 8014A8BC 21306002 */   addu      $a2, $s3, $zero
    /* 10CC8 8014A8C0 01000324 */  addiu      $v1, $zero, 0x1
    /* 10CCC 8014A8C4 58004310 */  beq        $v0, $v1, .L8014AA28
    /* 10CD0 8014A8C8 01000224 */   addiu     $v0, $zero, 0x1
  .L8014A8CC:
    /* 10CD4 8014A8CC FF002232 */  andi       $v0, $s1, 0xFF
    /* 10CD8 8014A8D0 1580013C */  lui        $at, %hi(spawntable)
    /* 10CDC 8014A8D4 21082200 */  addu       $at, $at, $v0
    /* 10CE0 8014A8D8 B4862290 */  lbu        $v0, %lo(spawntable)($at)
    /* 10CE4 8014A8DC 00000000 */  nop
    /* 10CE8 8014A8E0 02004230 */  andi       $v0, $v0, 0x2
    /* 10CEC 8014A8E4 07004010 */  beqz       $v0, .L8014A904
    /* 10CF0 8014A8E8 01000426 */   addiu     $a0, $s0, 0x1
    /* 10CF4 8014A8EC 21284002 */  addu       $a1, $s2, $zero
    /* 10CF8 8014A8F0 EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10CFC 8014A8F4 21306002 */   addu      $a2, $s3, $zero
    /* 10D00 8014A8F8 01000324 */  addiu      $v1, $zero, 0x1
    /* 10D04 8014A8FC 4A004310 */  beq        $v0, $v1, .L8014AA28
    /* 10D08 8014A900 01000224 */   addiu     $v0, $zero, 0x1
  .L8014A904:
    /* 10D0C 8014A904 FF002232 */  andi       $v0, $s1, 0xFF
    /* 10D10 8014A908 1580013C */  lui        $at, %hi(spawntable)
    /* 10D14 8014A90C 21082200 */  addu       $at, $at, $v0
    /* 10D18 8014A910 B4862290 */  lbu        $v0, %lo(spawntable)($at)
    /* 10D1C 8014A914 00000000 */  nop
    /* 10D20 8014A918 01004230 */  andi       $v0, $v0, 0x1
    /* 10D24 8014A91C 07004010 */  beqz       $v0, .L8014A93C
    /* 10D28 8014A920 FFFF0426 */   addiu     $a0, $s0, -0x1
    /* 10D2C 8014A924 21284002 */  addu       $a1, $s2, $zero
    /* 10D30 8014A928 EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10D34 8014A92C 21306002 */   addu      $a2, $s3, $zero
    /* 10D38 8014A930 01000324 */  addiu      $v1, $zero, 0x1
    /* 10D3C 8014A934 3C004310 */  beq        $v0, $v1, .L8014AA28
    /* 10D40 8014A938 01000224 */   addiu     $v0, $zero, 0x1
  .L8014A93C:
    /* 10D44 8014A93C FF002232 */  andi       $v0, $s1, 0xFF
    /* 10D48 8014A940 1580013C */  lui        $at, %hi(spawntable)
    /* 10D4C 8014A944 21082200 */  addu       $at, $at, $v0
    /* 10D50 8014A948 B4862290 */  lbu        $v0, %lo(spawntable)($at)
    /* 10D54 8014A94C 00000000 */  nop
    /* 10D58 8014A950 80004230 */  andi       $v0, $v0, 0x80
    /* 10D5C 8014A954 07004010 */  beqz       $v0, .L8014A974
    /* 10D60 8014A958 21200002 */   addu      $a0, $s0, $zero
    /* 10D64 8014A95C FFFF4526 */  addiu      $a1, $s2, -0x1
    /* 10D68 8014A960 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 10D6C 8014A964 21306002 */   addu      $a2, $s3, $zero
    /* 10D70 8014A968 01000324 */  addiu      $v1, $zero, 0x1
    /* 10D74 8014A96C 2E004310 */  beq        $v0, $v1, .L8014AA28
    /* 10D78 8014A970 01000224 */   addiu     $v0, $zero, 0x1
  .L8014A974:
    /* 10D7C 8014A974 FF002232 */  andi       $v0, $s1, 0xFF
    /* 10D80 8014A978 1580013C */  lui        $at, %hi(spawntable)
    /* 10D84 8014A97C 21082200 */  addu       $at, $at, $v0
    /* 10D88 8014A980 B4862290 */  lbu        $v0, %lo(spawntable)($at)
    /* 10D8C 8014A984 00000000 */  nop
    /* 10D90 8014A988 40004230 */  andi       $v0, $v0, 0x40
    /* 10D94 8014A98C 07004010 */  beqz       $v0, .L8014A9AC
    /* 10D98 8014A990 21200002 */   addu      $a0, $s0, $zero
    /* 10D9C 8014A994 01004526 */  addiu      $a1, $s2, 0x1
    /* 10DA0 8014A998 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 10DA4 8014A99C 21306002 */   addu      $a2, $s3, $zero
    /* 10DA8 8014A9A0 01000324 */  addiu      $v1, $zero, 0x1
    /* 10DAC 8014A9A4 20004310 */  beq        $v0, $v1, .L8014AA28
    /* 10DB0 8014A9A8 01000224 */   addiu     $v0, $zero, 0x1
  .L8014A9AC:
    /* 10DB4 8014A9AC FF002232 */  andi       $v0, $s1, 0xFF
    /* 10DB8 8014A9B0 1580013C */  lui        $at, %hi(spawntable)
    /* 10DBC 8014A9B4 21082200 */  addu       $at, $at, $v0
    /* 10DC0 8014A9B8 B4862290 */  lbu        $v0, %lo(spawntable)($at)
    /* 10DC4 8014A9BC 00000000 */  nop
    /* 10DC8 8014A9C0 20004230 */  andi       $v0, $v0, 0x20
    /* 10DCC 8014A9C4 07004010 */  beqz       $v0, .L8014A9E4
    /* 10DD0 8014A9C8 01000426 */   addiu     $a0, $s0, 0x1
    /* 10DD4 8014A9CC 21284002 */  addu       $a1, $s2, $zero
    /* 10DD8 8014A9D0 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 10DDC 8014A9D4 21306002 */   addu      $a2, $s3, $zero
    /* 10DE0 8014A9D8 01000324 */  addiu      $v1, $zero, 0x1
    /* 10DE4 8014A9DC 12004310 */  beq        $v0, $v1, .L8014AA28
    /* 10DE8 8014A9E0 01000224 */   addiu     $v0, $zero, 0x1
  .L8014A9E4:
    /* 10DEC 8014A9E4 FF002232 */  andi       $v0, $s1, 0xFF
    /* 10DF0 8014A9E8 1580013C */  lui        $at, %hi(spawntable)
    /* 10DF4 8014A9EC 21082200 */  addu       $at, $at, $v0
    /* 10DF8 8014A9F0 B4862290 */  lbu        $v0, %lo(spawntable)($at)
    /* 10DFC 8014A9F4 00000000 */  nop
    /* 10E00 8014A9F8 10004230 */  andi       $v0, $v0, 0x10
    /* 10E04 8014A9FC 09004010 */  beqz       $v0, .L8014AA24
    /* 10E08 8014AA00 FFFF0426 */   addiu     $a0, $s0, -0x1
    /* 10E0C 8014AA04 21284002 */  addu       $a1, $s2, $zero
    /* 10E10 8014AA08 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 10E14 8014AA0C 21306002 */   addu      $a2, $s3, $zero
    /* 10E18 8014AA10 01000324 */  addiu      $v1, $zero, 0x1
    /* 10E1C 8014AA14 04004314 */  bne        $v0, $v1, .L8014AA28
    /* 10E20 8014AA18 21100000 */   addu      $v0, $zero, $zero
  .L8014AA1C:
    /* 10E24 8014AA1C 8A2A0508 */  j          .L8014AA28
    /* 10E28 8014AA20 01000224 */   addiu     $v0, $zero, 0x1
  .L8014AA24:
    /* 10E2C 8014AA24 21100000 */  addu       $v0, $zero, $zero
  .L8014AA28:
    /* 10E30 8014AA28 2000BF8F */  lw         $ra, 0x20($sp)
    /* 10E34 8014AA2C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 10E38 8014AA30 1800B28F */  lw         $s2, 0x18($sp)
    /* 10E3C 8014AA34 1400B18F */  lw         $s1, 0x14($sp)
    /* 10E40 8014AA38 1000B08F */  lw         $s0, 0x10($sp)
    /* 10E44 8014AA3C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 10E48 8014AA40 0800E003 */  jr         $ra
    /* 10E4C 8014AA44 00000000 */   nop
endlabel DRLG_L3SpawnEdge__FiiPi
