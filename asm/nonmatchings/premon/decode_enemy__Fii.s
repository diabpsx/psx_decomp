.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching decode_enemy__Fii, 0x11C

glabel decode_enemy__Fii
    /* 2829C 80161E94 0200A228 */  slti       $v0, $a1, 0x2
    /* 282A0 80161E98 23004010 */  beqz       $v0, .L80161F28
    /* 282A4 80161E9C 40180400 */   sll       $v1, $a0, 1
    /* 282A8 80161EA0 21186400 */  addu       $v1, $v1, $a0
    /* 282AC 80161EA4 80180300 */  sll        $v1, $v1, 2
    /* 282B0 80161EA8 21186400 */  addu       $v1, $v1, $a0
    /* 282B4 80161EAC C0180300 */  sll        $v1, $v1, 3
    /* 282B8 80161EB0 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 282BC 80161EB4 21082300 */  addu       $at, $at, $v1
    /* 282C0 80161EB8 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 282C4 80161EBC 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 282C8 80161EC0 21082300 */  addu       $at, $at, $v1
    /* 282CC 80161EC4 D15325A0 */  sb         $a1, %lo(monster + 0x3D)($at)
    /* 282D0 80161EC8 EFFF4230 */  andi       $v0, $v0, 0xFFEF
    /* 282D4 80161ECC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 282D8 80161ED0 21082300 */  addu       $at, $at, $v1
    /* 282DC 80161ED4 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 282E0 80161ED8 40100500 */  sll        $v0, $a1, 1
    /* 282E4 80161EDC 21104500 */  addu       $v0, $v0, $a1
    /* 282E8 80161EE0 80100200 */  sll        $v0, $v0, 2
    /* 282EC 80161EE4 21104500 */  addu       $v0, $v0, $a1
    /* 282F0 80161EE8 00110200 */  sll        $v0, $v0, 4
    /* 282F4 80161EEC 23104500 */  subu       $v0, $v0, $a1
    /* 282F8 80161EF0 80100200 */  sll        $v0, $v0, 2
    /* 282FC 80161EF4 21104500 */  addu       $v0, $v0, $a1
    /* 28300 80161EF8 C0100200 */  sll        $v0, $v0, 3
    /* 28304 80161EFC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 28308 80161F00 21082200 */  addu       $at, $at, $v0
    /* 2830C 80161F04 68A52494 */  lhu        $a0, %lo(plr + 0x30)($at)
    /* 28310 80161F08 1080013C */  lui        $at, %hi(monster + 0x4A)
    /* 28314 80161F0C 21082300 */  addu       $at, $at, $v1
    /* 28318 80161F10 DE5324A0 */  sb         $a0, %lo(monster + 0x4A)($at)
    /* 2831C 80161F14 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 28320 80161F18 21082200 */  addu       $at, $at, $v0
    /* 28324 80161F1C 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 28328 80161F20 E7870508 */  j          .L80161F9C
    /* 2832C 80161F24 00000000 */   nop
  .L80161F28:
    /* 28330 80161F28 21186400 */  addu       $v1, $v1, $a0
    /* 28334 80161F2C 80180300 */  sll        $v1, $v1, 2
    /* 28338 80161F30 21186400 */  addu       $v1, $v1, $a0
    /* 2833C 80161F34 C0180300 */  sll        $v1, $v1, 3
    /* 28340 80161F38 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 28344 80161F3C 21082300 */  addu       $at, $at, $v1
    /* 28348 80161F40 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 2834C 80161F44 FEFFA524 */  addiu      $a1, $a1, -0x2
    /* 28350 80161F48 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 28354 80161F4C 21082300 */  addu       $at, $at, $v1
    /* 28358 80161F50 D15325A0 */  sb         $a1, %lo(monster + 0x3D)($at)
    /* 2835C 80161F54 10004234 */  ori        $v0, $v0, 0x10
    /* 28360 80161F58 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 28364 80161F5C 21082300 */  addu       $at, $at, $v1
    /* 28368 80161F60 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 2836C 80161F64 40100500 */  sll        $v0, $a1, 1
    /* 28370 80161F68 21104500 */  addu       $v0, $v0, $a1
    /* 28374 80161F6C 80100200 */  sll        $v0, $v0, 2
    /* 28378 80161F70 21104500 */  addu       $v0, $v0, $a1
    /* 2837C 80161F74 C0100200 */  sll        $v0, $v0, 3
    /* 28380 80161F78 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 28384 80161F7C 21082200 */  addu       $at, $at, $v0
    /* 28388 80161F80 CA532490 */  lbu        $a0, %lo(monster + 0x36)($at)
    /* 2838C 80161F84 1080013C */  lui        $at, %hi(monster + 0x4A)
    /* 28390 80161F88 21082300 */  addu       $at, $at, $v1
    /* 28394 80161F8C DE5324A0 */  sb         $a0, %lo(monster + 0x4A)($at)
    /* 28398 80161F90 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 2839C 80161F94 21082200 */  addu       $at, $at, $v0
    /* 283A0 80161F98 CB532290 */  lbu        $v0, %lo(monster + 0x37)($at)
  .L80161F9C:
    /* 283A4 80161F9C 1080013C */  lui        $at, %hi(monster + 0x4B)
    /* 283A8 80161FA0 21082300 */  addu       $at, $at, $v1
    /* 283AC 80161FA4 DF5322A0 */  sb         $v0, %lo(monster + 0x4B)($at)
    /* 283B0 80161FA8 0800E003 */  jr         $ra
    /* 283B4 80161FAC 00000000 */   nop
endlabel decode_enemy__Fii
