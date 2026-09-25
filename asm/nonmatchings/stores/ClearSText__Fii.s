.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearSText__Fii, 0x98

glabel ClearSText__Fii
    /* 59CD8 80069CD8 2A108500 */  slt        $v0, $a0, $a1
    /* 59CDC 80069CDC 22004010 */  beqz       $v0, .L80069D68
    /* 59CE0 80069CE0 C0100400 */   sll       $v0, $a0, 3
    /* 59CE4 80069CE4 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 59CE8 80069CE8 21104400 */  addu       $v0, $v0, $a0
    /* 59CEC 80069CEC 80100200 */  sll        $v0, $v0, 2
    /* 59CF0 80069CF0 23104400 */  subu       $v0, $v0, $a0
    /* 59CF4 80069CF4 80180200 */  sll        $v1, $v0, 2
  .L80069CF8:
    /* 59CF8 80069CF8 1380013C */  lui        $at, %hi(D_8012EE48)
    /* 59CFC 80069CFC 21082300 */  addu       $at, $at, $v1
    /* 59D00 80069D00 48EE20A0 */  sb         $zero, %lo(D_8012EE48)($at)
    /* 59D04 80069D04 1380013C */  lui        $at, %hi(D_8012EE49)
    /* 59D08 80069D08 21082300 */  addu       $at, $at, $v1
    /* 59D0C 80069D0C 49EE20A0 */  sb         $zero, %lo(D_8012EE49)($at)
    /* 59D10 80069D10 1380013C */  lui        $at, %hi(D_8012EE4A)
    /* 59D14 80069D14 21082300 */  addu       $at, $at, $v1
    /* 59D18 80069D18 4AEE20A0 */  sb         $zero, %lo(D_8012EE4A)($at)
    /* 59D1C 80069D1C 1380013C */  lui        $at, %hi(D_8012EECA)
    /* 59D20 80069D20 21082300 */  addu       $at, $at, $v1
    /* 59D24 80069D24 CAEE20A0 */  sb         $zero, %lo(D_8012EECA)($at)
    /* 59D28 80069D28 1380013C */  lui        $at, %hi(D_8012EECB)
    /* 59D2C 80069D2C 21082300 */  addu       $at, $at, $v1
    /* 59D30 80069D30 CBEE20A0 */  sb         $zero, %lo(D_8012EECB)($at)
    /* 59D34 80069D34 1380013C */  lui        $at, %hi(D_8012EECC)
    /* 59D38 80069D38 21082300 */  addu       $at, $at, $v1
    /* 59D3C 80069D3C CCEE20A0 */  sb         $zero, %lo(D_8012EECC)($at)
    /* 59D40 80069D40 1380013C */  lui        $at, %hi(D_8012EECD)
    /* 59D44 80069D44 21082300 */  addu       $at, $at, $v1
    /* 59D48 80069D48 CDEE20A0 */  sb         $zero, %lo(D_8012EECD)($at)
    /* 59D4C 80069D4C 1380013C */  lui        $at, %hi(D_8012EED0)
    /* 59D50 80069D50 21082300 */  addu       $at, $at, $v1
    /* 59D54 80069D54 D0EE26AC */  sw         $a2, %lo(D_8012EED0)($at)
    /* 59D58 80069D58 01008424 */  addiu      $a0, $a0, 0x1
    /* 59D5C 80069D5C 2A108500 */  slt        $v0, $a0, $a1
    /* 59D60 80069D60 E5FF4014 */  bnez       $v0, .L80069CF8
    /* 59D64 80069D64 8C006324 */   addiu     $v1, $v1, 0x8C
  .L80069D68:
    /* 59D68 80069D68 0800E003 */  jr         $ra
    /* 59D6C 80069D6C 00000000 */   nop
endlabel ClearSText__Fii
