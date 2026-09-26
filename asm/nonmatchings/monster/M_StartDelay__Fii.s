.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartDelay__Fii, 0x50

glabel M_StartDelay__Fii
    /* 11018 8014AC10 1100A018 */  blez       $a1, .L8014AC58
    /* 1101C 8014AC14 40100400 */   sll       $v0, $a0, 1
    /* 11020 8014AC18 21104400 */  addu       $v0, $v0, $a0
    /* 11024 8014AC1C 80100200 */  sll        $v0, $v0, 2
    /* 11028 8014AC20 21104400 */  addu       $v0, $v0, $a0
    /* 1102C 8014AC24 C0200200 */  sll        $a0, $v0, 3
    /* 11030 8014AC28 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 11034 8014AC2C 21082400 */  addu       $at, $at, $a0
    /* 11038 8014AC30 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 1103C 8014AC34 1C000224 */  addiu      $v0, $zero, 0x1C
    /* 11040 8014AC38 07006210 */  beq        $v1, $v0, .L8014AC58
    /* 11044 8014AC3C 0D000224 */   addiu     $v0, $zero, 0xD
    /* 11048 8014AC40 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 1104C 8014AC44 21082400 */  addu       $at, $at, $a0
    /* 11050 8014AC48 AE5325A4 */  sh         $a1, %lo(monster + 0x1A)($at)
    /* 11054 8014AC4C 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 11058 8014AC50 21082400 */  addu       $at, $at, $a0
    /* 1105C 8014AC54 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
  .L8014AC58:
    /* 11060 8014AC58 0800E003 */  jr         $ra
    /* 11064 8014AC5C 00000000 */   nop
endlabel M_StartDelay__Fii
