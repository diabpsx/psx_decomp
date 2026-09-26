.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeleteMissile__Fii, 0xA0

glabel DeleteMissile__Fii
    /* CF0 8013A8E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* CF4 8013A8EC 081B838F */  lw         $v1, %gp_rel(nummissiles)($gp)
    /* CF8 8013A8F0 7D000224 */  addiu      $v0, $zero, 0x7D
    /* CFC 8013A8F4 1400BFAF */  sw         $ra, 0x14($sp)
    /* D00 8013A8F8 1000B0AF */  sw         $s0, 0x10($sp)
    /* D04 8013A8FC 23104300 */  subu       $v0, $v0, $v1
    /* D08 8013A900 40100200 */  sll        $v0, $v0, 1
    /* D0C 8013A904 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* D10 8013A908 1080013C */  lui        $at, %hi(missileavail)
    /* D14 8013A90C 21082200 */  addu       $at, $at, $v0
    /* D18 8013A910 5C2B24A4 */  sh         $a0, %lo(missileavail)($at)
    /* D1C 8013A914 80100400 */  sll        $v0, $a0, 2
    /* D20 8013A918 21104400 */  addu       $v0, $v0, $a0
    /* D24 8013A91C 80100200 */  sll        $v0, $v0, 2
    /* D28 8013A920 23104400 */  subu       $v0, $v0, $a0
    /* D2C 8013A924 80100200 */  sll        $v0, $v0, 2
    /* D30 8013A928 081B83AF */  sw         $v1, %gp_rel(nummissiles)($gp)
    /* D34 8013A92C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D38 8013A930 21082200 */  addu       $at, $at, $v0
    /* D3C 8013A934 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D40 8013A938 D034010C */  jal        AddUnLight__Fi
    /* D44 8013A93C 2180A000 */   addu      $s0, $a1, $zero
    /* D48 8013A940 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* D4C 8013A944 00000000 */  nop
    /* D50 8013A948 0A004018 */  blez       $v0, .L8013A974
    /* D54 8013A94C 00000000 */   nop
    /* D58 8013A950 08000212 */  beq        $s0, $v0, .L8013A974
    /* D5C 8013A954 40181000 */   sll       $v1, $s0, 1
    /* D60 8013A958 1080043C */  lui        $a0, %hi(missileactive)
    /* D64 8013A95C 602A8424 */  addiu      $a0, $a0, %lo(missileactive)
    /* D68 8013A960 40100200 */  sll        $v0, $v0, 1
    /* D6C 8013A964 21104400 */  addu       $v0, $v0, $a0
    /* D70 8013A968 00004294 */  lhu        $v0, 0x0($v0)
    /* D74 8013A96C 21186400 */  addu       $v1, $v1, $a0
    /* D78 8013A970 000062A4 */  sh         $v0, 0x0($v1)
  .L8013A974:
    /* D7C 8013A974 1400BF8F */  lw         $ra, 0x14($sp)
    /* D80 8013A978 1000B08F */  lw         $s0, 0x10($sp)
    /* D84 8013A97C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* D88 8013A980 0800E003 */  jr         $ra
    /* D8C 8013A984 00000000 */   nop
endlabel DeleteMissile__Fii
