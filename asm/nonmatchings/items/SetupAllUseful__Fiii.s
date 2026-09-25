.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetupAllUseful__Fiii, 0xE4

glabel SetupAllUseful__Fiii
    /* 34D20 80044D20 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 34D24 80044D24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 34D28 80044D28 21888000 */  addu       $s1, $a0, $zero
    /* 34D2C 80044D2C 2120A000 */  addu       $a0, $a1, $zero
    /* 34D30 80044D30 1800B2AF */  sw         $s2, 0x18($sp)
    /* 34D34 80044D34 C0101100 */  sll        $v0, $s1, 3
    /* 34D38 80044D38 23105100 */  subu       $v0, $v0, $s1
    /* 34D3C 80044D3C 80100200 */  sll        $v0, $v0, 2
    /* 34D40 80044D40 23105100 */  subu       $v0, $v0, $s1
    /* 34D44 80044D44 80100200 */  sll        $v0, $v0, 2
    /* 34D48 80044D48 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 34D4C 80044D4C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 34D50 80044D50 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 34D54 80044D54 21082200 */  addu       $at, $at, $v0
    /* 34D58 80044D58 641D24AC */  sw         $a0, %lo(item + 0x10)($at)
    /* 34D5C 80044D5C B3F6000C */  jal        SetRndSeed__Fl
    /* 34D60 80044D60 2190C000 */   addu      $s2, $a2, $zero
    /* 34D64 80044D64 C9F6000C */  jal        ENG_random__Fl
    /* 34D68 80044D68 02000424 */   addiu     $a0, $zero, 0x2
    /* 34D6C 80044D6C 02004010 */  beqz       $v0, .L80044D78
    /* 34D70 80044D70 19001024 */   addiu     $s0, $zero, 0x19
    /* 34D74 80044D74 18001024 */  addiu      $s0, $zero, 0x18
  .L80044D78:
    /* 34D78 80044D78 0200422A */  slti       $v0, $s2, 0x2
    /* 34D7C 80044D7C 06004014 */  bnez       $v0, .L80044D98
    /* 34D80 80044D80 21202002 */   addu      $a0, $s1, $zero
    /* 34D84 80044D84 C9F6000C */  jal        ENG_random__Fl
    /* 34D88 80044D88 03000424 */   addiu     $a0, $zero, 0x3
    /* 34D8C 80044D8C 02004014 */  bnez       $v0, .L80044D98
    /* 34D90 80044D90 21202002 */   addu      $a0, $s1, $zero
    /* 34D94 80044D94 1B001024 */  addiu      $s0, $zero, 0x1B
  .L80044D98:
    /* 34D98 80044D98 21280002 */  addu       $a1, $s0, $zero
    /* 34D9C 80044D9C A704010C */  jal        GetItemAttrs__Fiii
    /* 34DA0 80044DA0 21304002 */   addu      $a2, $s2, $zero
    /* 34DA4 80044DA4 21202002 */  addu       $a0, $s1, $zero
    /* 34DA8 80044DA8 C0100400 */  sll        $v0, $a0, 3
    /* 34DAC 80044DAC 23104400 */  subu       $v0, $v0, $a0
    /* 34DB0 80044DB0 80100200 */  sll        $v0, $v0, 2
    /* 34DB4 80044DB4 23104400 */  subu       $v0, $v0, $a0
    /* 34DB8 80044DB8 80100200 */  sll        $v0, $v0, 2
    /* 34DBC 80044DBC 1280053C */  lui        $a1, %hi(FePlayerNo)
    /* 34DC0 80044DC0 78B3A58C */  lw         $a1, %lo(FePlayerNo)($a1)
    /* 34DC4 80044DC4 80014326 */  addiu      $v1, $s2, 0x180
    /* 34DC8 80044DC8 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 34DCC 80044DCC 21082200 */  addu       $at, $at, $v0
    /* 34DD0 80044DD0 781D23A4 */  sh         $v1, %lo(item + 0x24)($at)
    /* 34DD4 80044DD4 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 34DD8 80044DD8 21082200 */  addu       $at, $at, $v0
    /* 34DDC 80044DDC B91D25A0 */  sb         $a1, %lo(item + 0x65)($at)
    /* 34DE0 80044DE0 4C0D010C */  jal        SetupItem__Fi
    /* 34DE4 80044DE4 00000000 */   nop
    /* 34DE8 80044DE8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 34DEC 80044DEC 1800B28F */  lw         $s2, 0x18($sp)
    /* 34DF0 80044DF0 1400B18F */  lw         $s1, 0x14($sp)
    /* 34DF4 80044DF4 1000B08F */  lw         $s0, 0x10($sp)
    /* 34DF8 80044DF8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 34DFC 80044DFC 0800E003 */  jr         $ra
    /* 34E00 80044E00 00000000 */   nop
endlabel SetupAllUseful__Fiii
