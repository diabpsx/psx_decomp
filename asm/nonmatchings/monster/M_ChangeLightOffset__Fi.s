.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_ChangeLightOffset__Fi, 0x168

glabel M_ChangeLightOffset__Fi
    /* 12D30 8014C928 21388000 */  addu       $a3, $a0, $zero
    /* 12D34 8014C92C 8D28063C */  lui        $a2, (0x288DF0CB >> 16)
    /* 12D38 8014C930 CBF0C634 */  ori        $a2, $a2, (0x288DF0CB & 0xFFFF)
    /* 12D3C 8014C934 10800A3C */  lui        $t2, %hi(monster)
    /* 12D40 8014C938 94534A25 */  addiu      $t2, $t2, %lo(monster)
    /* 12D44 8014C93C 40100700 */  sll        $v0, $a3, 1
    /* 12D48 8014C940 21104700 */  addu       $v0, $v0, $a3
    /* 12D4C 8014C944 80100200 */  sll        $v0, $v0, 2
    /* 12D50 8014C948 21104700 */  addu       $v0, $v0, $a3
    /* 12D54 8014C94C C0100200 */  sll        $v0, $v0, 3
    /* 12D58 8014C950 21404A00 */  addu       $t0, $v0, $t2
    /* 12D5C 8014C954 3B000481 */  lb         $a0, 0x3B($t0)
    /* 12D60 8014C958 3A000581 */  lb         $a1, 0x3A($t0)
    /* 12D64 8014C95C 40200400 */  sll        $a0, $a0, 1
    /* 12D68 8014C960 2110A400 */  addu       $v0, $a1, $a0
    /* 12D6C 8014C964 40180200 */  sll        $v1, $v0, 1
    /* 12D70 8014C968 21186200 */  addu       $v1, $v1, $v0
    /* 12D74 8014C96C C0180300 */  sll        $v1, $v1, 3
    /* 12D78 8014C970 21186200 */  addu       $v1, $v1, $v0
    /* 12D7C 8014C974 80180300 */  sll        $v1, $v1, 2
    /* 12D80 8014C978 18006600 */  mult       $v1, $a2
    /* 12D84 8014C97C 23208500 */  subu       $a0, $a0, $a1
    /* 12D88 8014C980 40100400 */  sll        $v0, $a0, 1
    /* 12D8C 8014C984 21104400 */  addu       $v0, $v0, $a0
    /* 12D90 8014C988 C0100200 */  sll        $v0, $v0, 3
    /* 12D94 8014C98C 10480000 */  mfhi       $t1
    /* 12D98 8014C990 21104400 */  addu       $v0, $v0, $a0
    /* 12D9C 8014C994 80100200 */  sll        $v0, $v0, 2
    /* 12DA0 8014C998 18004600 */  mult       $v0, $a2
    /* 12DA4 8014C99C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12DA8 8014C9A0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 12DAC 8014C9A4 C31F0300 */  sra        $v1, $v1, 31
    /* 12DB0 8014C9A8 43210900 */  sra        $a0, $t1, 5
    /* 12DB4 8014C9AC 23288300 */  subu       $a1, $a0, $v1
    /* 12DB8 8014C9B0 59000391 */  lbu        $v1, 0x59($t0)
    /* 12DBC 8014C9B4 C3170200 */  sra        $v0, $v0, 31
    /* 12DC0 8014C9B8 C0180300 */  sll        $v1, $v1, 3
    /* 12DC4 8014C9BC 0D80013C */  lui        $at, %hi(LightList)
    /* 12DC8 8014C9C0 21082300 */  addu       $at, $at, $v1
    /* 12DCC 8014C9C4 00632680 */  lb         $a2, %lo(LightList)($at)
    /* 12DD0 8014C9C8 0D80013C */  lui        $at, %hi(LightList + 0x1)
    /* 12DD4 8014C9CC 21082300 */  addu       $at, $at, $v1
    /* 12DD8 8014C9D0 01632980 */  lb         $t1, %lo(LightList + 0x1)($at)
    /* 12DDC 8014C9D4 10600000 */  mfhi       $t4
    /* 12DE0 8014C9D8 43210C00 */  sra        $a0, $t4, 5
    /* 12DE4 8014C9DC 0800A104 */  bgez       $a1, .L8014CA00
    /* 12DE8 8014C9E0 23208200 */   subu      $a0, $a0, $v0
    /* 12DEC 8014C9E4 08008004 */  bltz       $a0, .L8014CA08
    /* 12DF0 8014C9E8 2000A524 */   addiu     $a1, $a1, 0x20
    /* 12DF4 8014C9EC 3C000381 */  lb         $v1, 0x3C($t0)
    /* 12DF8 8014C9F0 01000224 */  addiu      $v0, $zero, 0x1
    /* 12DFC 8014C9F4 02006214 */  bne        $v1, $v0, .L8014CA00
    /* 12E00 8014C9F8 20000224 */   addiu     $v0, $zero, 0x20
    /* 12E04 8014C9FC 23284500 */  subu       $a1, $v0, $a1
  .L8014CA00:
    /* 12E08 8014CA00 03008104 */  bgez       $a0, .L8014CA10
    /* 12E0C 8014CA04 40100700 */   sll       $v0, $a3, 1
  .L8014CA08:
    /* 12E10 8014CA08 8E320508 */  j          .L8014CA38
    /* 12E14 8014CA0C 20008424 */   addiu     $a0, $a0, 0x20
  .L8014CA10:
    /* 12E18 8014CA10 21104700 */  addu       $v0, $v0, $a3
    /* 12E1C 8014CA14 80100200 */  sll        $v0, $v0, 2
    /* 12E20 8014CA18 21104700 */  addu       $v0, $v0, $a3
    /* 12E24 8014CA1C C0100200 */  sll        $v0, $v0, 3
    /* 12E28 8014CA20 21104A00 */  addu       $v0, $v0, $t2
    /* 12E2C 8014CA24 3C004380 */  lb         $v1, 0x3C($v0)
    /* 12E30 8014CA28 06000224 */  addiu      $v0, $zero, 0x6
    /* 12E34 8014CA2C 02006214 */  bne        $v1, $v0, .L8014CA38
    /* 12E38 8014CA30 1F000224 */   addiu     $v0, $zero, 0x1F
    /* 12E3C 8014CA34 23204400 */  subu       $a0, $v0, $a0
  .L8014CA38:
    /* 12E40 8014CA38 83280500 */  sra        $a1, $a1, 2
    /* 12E44 8014CA3C 0100C230 */  andi       $v0, $a2, 0x1
    /* 12E48 8014CA40 C0100200 */  sll        $v0, $v0, 3
    /* 12E4C 8014CA44 2128A200 */  addu       $a1, $a1, $v0
    /* 12E50 8014CA48 83300400 */  sra        $a2, $a0, 2
    /* 12E54 8014CA4C 01002231 */  andi       $v0, $t1, 0x1
    /* 12E58 8014CA50 C0100200 */  sll        $v0, $v0, 3
    /* 12E5C 8014CA54 2130C200 */  addu       $a2, $a2, $v0
    /* 12E60 8014CA58 40100700 */  sll        $v0, $a3, 1
    /* 12E64 8014CA5C 21104700 */  addu       $v0, $v0, $a3
    /* 12E68 8014CA60 80100200 */  sll        $v0, $v0, 2
    /* 12E6C 8014CA64 21104700 */  addu       $v0, $v0, $a3
    /* 12E70 8014CA68 C0100200 */  sll        $v0, $v0, 3
    /* 12E74 8014CA6C 21104A00 */  addu       $v0, $v0, $t2
    /* 12E78 8014CA70 59004490 */  lbu        $a0, 0x59($v0)
    /* 12E7C 8014CA74 F8FFA524 */  addiu      $a1, $a1, -0x8
    /* 12E80 8014CA78 EE34010C */  jal        ChangeLightOff__Fiii
    /* 12E84 8014CA7C F8FFC624 */   addiu     $a2, $a2, -0x8
    /* 12E88 8014CA80 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12E8C 8014CA84 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12E90 8014CA88 0800E003 */  jr         $ra
    /* 12E94 8014CA8C 00000000 */   nop
endlabel M_ChangeLightOffset__Fi
