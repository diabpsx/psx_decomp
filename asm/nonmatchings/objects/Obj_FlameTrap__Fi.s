.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Obj_FlameTrap__Fi, 0x2E4

glabel Obj_FlameTrap__Fi
    /* 44C6C 80054C6C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 44C70 80054C70 2400B5AF */  sw         $s5, 0x24($sp)
    /* 44C74 80054C74 21A88000 */  addu       $s5, $a0, $zero
    /* 44C78 80054C78 40101500 */  sll        $v0, $s5, 1
    /* 44C7C 80054C7C 21105500 */  addu       $v0, $v0, $s5
    /* 44C80 80054C80 80100200 */  sll        $v0, $v0, 2
    /* 44C84 80054C84 23105500 */  subu       $v0, $v0, $s5
    /* 44C88 80054C88 80300200 */  sll        $a2, $v0, 2
    /* 44C8C 80054C8C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 44C90 80054C90 2000B4AF */  sw         $s4, 0x20($sp)
    /* 44C94 80054C94 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 44C98 80054C98 1800B2AF */  sw         $s2, 0x18($sp)
    /* 44C9C 80054C9C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 44CA0 80054CA0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 44CA4 80054CA4 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 44CA8 80054CA8 21082600 */  addu       $at, $at, $a2
    /* 44CAC 80054CAC 5C8C2284 */  lh         $v0, %lo(object + 0x10)($at)
    /* 44CB0 80054CB0 00000000 */  nop
    /* 44CB4 80054CB4 1F004010 */  beqz       $v0, .L80054D34
    /* 44CB8 80054CB8 00000000 */   nop
    /* 44CBC 80054CBC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44CC0 80054CC0 21082600 */  addu       $at, $at, $a2
    /* 44CC4 80054CC4 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 44CC8 80054CC8 00000000 */  nop
    /* 44CCC 80054CCC 96004010 */  beqz       $v0, .L80054F28
    /* 44CD0 80054CD0 00000000 */   nop
    /* 44CD4 80054CD4 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 44CD8 80054CD8 21082600 */  addu       $at, $at, $a2
    /* 44CDC 80054CDC 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 44CE0 80054CE0 00000000 */  nop
    /* 44CE4 80054CE4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 44CE8 80054CE8 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 44CEC 80054CEC 21082600 */  addu       $at, $at, $a2
    /* 44CF0 80054CF0 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 44CF4 80054CF4 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 44CF8 80054CF8 21082600 */  addu       $at, $at, $a2
    /* 44CFC 80054CFC 6D8C2580 */  lb         $a1, %lo(object + 0x21)($at)
    /* 44D00 80054D00 01000224 */  addiu      $v0, $zero, 0x1
    /* 44D04 80054D04 8100A214 */  bne        $a1, $v0, .L80054F0C
    /* 44D08 80054D08 0500A228 */   slti      $v0, $a1, 0x5
    /* 44D0C 80054D0C 0E80013C */  lui        $at, %hi(object)
    /* 44D10 80054D10 21082600 */  addu       $at, $at, $a2
    /* 44D14 80054D14 4C8C2484 */  lh         $a0, %lo(object)($at)
    /* 44D18 80054D18 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44D1C 80054D1C 21082600 */  addu       $at, $at, $a2
    /* 44D20 80054D20 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 44D24 80054D24 D034010C */  jal        AddUnLight__Fi
    /* 44D28 80054D28 00000000 */   nop
    /* 44D2C 80054D2C CA530108 */  j          .L80054F28
    /* 44D30 80054D30 00000000 */   nop
  .L80054D34:
    /* 44D34 80054D34 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44D38 80054D38 21082600 */  addu       $at, $at, $a2
    /* 44D3C 80054D3C 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 44D40 80054D40 00000000 */  nop
    /* 44D44 80054D44 60004014 */  bnez       $v0, .L80054EC8
    /* 44D48 80054D48 02000224 */   addiu     $v0, $zero, 0x2
    /* 44D4C 80054D4C 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 44D50 80054D50 21082600 */  addu       $at, $at, $a2
    /* 44D54 80054D54 5E8C2384 */  lh         $v1, %lo(object + 0x12)($at)
    /* 44D58 80054D58 00000000 */  nop
    /* 44D5C 80054D5C 24006214 */  bne        $v1, $v0, .L80054DF0
    /* 44D60 80054D60 21980000 */   addu      $s3, $zero, $zero
    /* 44D64 80054D64 21A0C000 */  addu       $s4, $a2, $zero
    /* 44D68 80054D68 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 44D6C 80054D6C 21083400 */  addu       $at, $at, $s4
    /* 44D70 80054D70 6B8C2280 */  lb         $v0, %lo(object + 0x1F)($at)
    /* 44D74 80054D74 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 44D78 80054D78 21083400 */  addu       $at, $at, $s4
    /* 44D7C 80054D7C 6C8C3280 */  lb         $s2, %lo(object + 0x20)($at)
    /* 44D80 80054D80 FEFF5024 */  addiu      $s0, $v0, -0x2
    /* 44D84 80054D84 C0181200 */  sll        $v1, $s2, 3
    /* 44D88 80054D88 C0101000 */  sll        $v0, $s0, 3
    /* 44D8C 80054D8C 23105000 */  subu       $v0, $v0, $s0
    /* 44D90 80054D90 C0110200 */  sll        $v0, $v0, 7
    /* 44D94 80054D94 21884300 */  addu       $s1, $v0, $v1
  .L80054D98:
    /* 44D98 80054D98 21200002 */  addu       $a0, $s0, $zero
    /* 44D9C 80054D9C 447F010C */  jal        IsDplayer__Fii
    /* 44DA0 80054DA0 21284002 */   addu      $a1, $s2, $zero
    /* 44DA4 80054DA4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 44DA8 80054DA8 07004014 */  bnez       $v0, .L80054DC8
    /* 44DAC 80054DAC 01000224 */   addiu     $v0, $zero, 0x1
    /* 44DB0 80054DB0 0E80013C */  lui        $at, %hi(dung_map)
    /* 44DB4 80054DB4 21083100 */  addu       $at, $at, $s1
    /* 44DB8 80054DB8 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 44DBC 80054DBC 00000000 */  nop
    /* 44DC0 80054DC0 04004010 */  beqz       $v0, .L80054DD4
    /* 44DC4 80054DC4 01000224 */   addiu     $v0, $zero, 0x1
  .L80054DC8:
    /* 44DC8 80054DC8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44DCC 80054DCC 21083400 */  addu       $at, $at, $s4
    /* 44DD0 80054DD0 608C22A4 */  sh         $v0, %lo(object + 0x14)($at)
  .L80054DD4:
    /* 44DD4 80054DD4 80033126 */  addiu      $s1, $s1, 0x380
    /* 44DD8 80054DD8 01007326 */  addiu      $s3, $s3, 0x1
    /* 44DDC 80054DDC 0500622A */  slti       $v0, $s3, 0x5
    /* 44DE0 80054DE0 EDFF4014 */  bnez       $v0, .L80054D98
    /* 44DE4 80054DE4 01001026 */   addiu     $s0, $s0, 0x1
    /* 44DE8 80054DE8 9E530108 */  j          .L80054E78
    /* 44DEC 80054DEC 40101500 */   sll       $v0, $s5, 1
  .L80054DF0:
    /* 44DF0 80054DF0 21A0C000 */  addu       $s4, $a2, $zero
    /* 44DF4 80054DF4 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 44DF8 80054DF8 21083400 */  addu       $at, $at, $s4
    /* 44DFC 80054DFC 6C8C2280 */  lb         $v0, %lo(object + 0x20)($at)
    /* 44E00 80054E00 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 44E04 80054E04 21083400 */  addu       $at, $at, $s4
    /* 44E08 80054E08 6B8C3080 */  lb         $s0, %lo(object + 0x1F)($at)
    /* 44E0C 80054E0C FEFF5224 */  addiu      $s2, $v0, -0x2
    /* 44E10 80054E10 C0101000 */  sll        $v0, $s0, 3
    /* 44E14 80054E14 23105000 */  subu       $v0, $v0, $s0
    /* 44E18 80054E18 C0110200 */  sll        $v0, $v0, 7
    /* 44E1C 80054E1C C0181200 */  sll        $v1, $s2, 3
    /* 44E20 80054E20 21886200 */  addu       $s1, $v1, $v0
  .L80054E24:
    /* 44E24 80054E24 21200002 */  addu       $a0, $s0, $zero
    /* 44E28 80054E28 447F010C */  jal        IsDplayer__Fii
    /* 44E2C 80054E2C 21284002 */   addu      $a1, $s2, $zero
    /* 44E30 80054E30 FF004230 */  andi       $v0, $v0, 0xFF
    /* 44E34 80054E34 07004014 */  bnez       $v0, .L80054E54
    /* 44E38 80054E38 01000224 */   addiu     $v0, $zero, 0x1
    /* 44E3C 80054E3C 0E80013C */  lui        $at, %hi(dung_map)
    /* 44E40 80054E40 21083100 */  addu       $at, $at, $s1
    /* 44E44 80054E44 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 44E48 80054E48 00000000 */  nop
    /* 44E4C 80054E4C 04004010 */  beqz       $v0, .L80054E60
    /* 44E50 80054E50 01000224 */   addiu     $v0, $zero, 0x1
  .L80054E54:
    /* 44E54 80054E54 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44E58 80054E58 21083400 */  addu       $at, $at, $s4
    /* 44E5C 80054E5C 608C22A4 */  sh         $v0, %lo(object + 0x14)($at)
  .L80054E60:
    /* 44E60 80054E60 08003126 */  addiu      $s1, $s1, 0x8
    /* 44E64 80054E64 01007326 */  addiu      $s3, $s3, 0x1
    /* 44E68 80054E68 0500622A */  slti       $v0, $s3, 0x5
    /* 44E6C 80054E6C EDFF4014 */  bnez       $v0, .L80054E24
    /* 44E70 80054E70 01005226 */   addiu     $s2, $s2, 0x1
    /* 44E74 80054E74 40101500 */  sll        $v0, $s5, 1
  .L80054E78:
    /* 44E78 80054E78 21105500 */  addu       $v0, $v0, $s5
    /* 44E7C 80054E7C 80100200 */  sll        $v0, $v0, 2
    /* 44E80 80054E80 23105500 */  subu       $v0, $v0, $s5
    /* 44E84 80054E84 80180200 */  sll        $v1, $v0, 2
    /* 44E88 80054E88 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44E8C 80054E8C 21082300 */  addu       $at, $at, $v1
    /* 44E90 80054E90 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 44E94 80054E94 00000000 */  nop
    /* 44E98 80054E98 23004010 */  beqz       $v0, .L80054F28
    /* 44E9C 80054E9C 00000000 */   nop
    /* 44EA0 80054EA0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 44EA4 80054EA4 21082300 */  addu       $at, $at, $v1
    /* 44EA8 80054EA8 6A8C2480 */  lb         $a0, %lo(object + 0x1E)($at)
    /* 44EAC 80054EAC 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 44EB0 80054EB0 21082300 */  addu       $at, $at, $v1
    /* 44EB4 80054EB4 5A8C2584 */  lh         $a1, %lo(object + 0xE)($at)
    /* 44EB8 80054EB8 D752010C */  jal        ActivateTrapLine__Fii
    /* 44EBC 80054EBC 00000000 */   nop
    /* 44EC0 80054EC0 CA530108 */  j          .L80054F28
    /* 44EC4 80054EC4 00000000 */   nop
  .L80054EC8:
    /* 44EC8 80054EC8 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 44ECC 80054ECC 21082600 */  addu       $at, $at, $a2
    /* 44ED0 80054ED0 6D8C2380 */  lb         $v1, %lo(object + 0x21)($at)
    /* 44ED4 80054ED4 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 44ED8 80054ED8 21082600 */  addu       $at, $at, $a2
    /* 44EDC 80054EDC 588C2284 */  lh         $v0, %lo(object + 0xC)($at)
    /* 44EE0 80054EE0 00000000 */  nop
    /* 44EE4 80054EE4 04006214 */  bne        $v1, $v0, .L80054EF8
    /* 44EE8 80054EE8 0B000224 */   addiu     $v0, $zero, 0xB
    /* 44EEC 80054EEC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 44EF0 80054EF0 21082600 */  addu       $at, $at, $a2
    /* 44EF4 80054EF4 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
  .L80054EF8:
    /* 44EF8 80054EF8 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 44EFC 80054EFC 21082600 */  addu       $at, $at, $a2
    /* 44F00 80054F00 6D8C2580 */  lb         $a1, %lo(object + 0x21)($at)
    /* 44F04 80054F04 00000000 */  nop
    /* 44F08 80054F08 0600A228 */  slti       $v0, $a1, 0x6
  .L80054F0C:
    /* 44F0C 80054F0C 06004010 */  beqz       $v0, .L80054F28
    /* 44F10 80054F10 00000000 */   nop
    /* 44F14 80054F14 0E80013C */  lui        $at, %hi(object)
    /* 44F18 80054F18 21082600 */  addu       $at, $at, $a2
    /* 44F1C 80054F1C 4C8C2484 */  lh         $a0, %lo(object)($at)
    /* 44F20 80054F20 D934010C */  jal        ChangeLightRadius__Fii
    /* 44F24 80054F24 00000000 */   nop
  .L80054F28:
    /* 44F28 80054F28 2800BF8F */  lw         $ra, 0x28($sp)
    /* 44F2C 80054F2C 2400B58F */  lw         $s5, 0x24($sp)
    /* 44F30 80054F30 2000B48F */  lw         $s4, 0x20($sp)
    /* 44F34 80054F34 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 44F38 80054F38 1800B28F */  lw         $s2, 0x18($sp)
    /* 44F3C 80054F3C 1400B18F */  lw         $s1, 0x14($sp)
    /* 44F40 80054F40 1000B08F */  lw         $s0, 0x10($sp)
    /* 44F44 80054F44 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 44F48 80054F48 0800E003 */  jr         $ra
    /* 44F4C 80054F4C 00000000 */   nop
endlabel Obj_FlameTrap__Fi
