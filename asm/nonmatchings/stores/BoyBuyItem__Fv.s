.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BoyBuyItem__Fv, 0xA0

glabel BoyBuyItem__Fv
    /* 62DD0 80072DD0 1280033C */  lui        $v1, %hi(myplr)
    /* 62DD4 80072DD4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 62DD8 80072DD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 62DDC 80072DDC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 62DE0 80072DE0 40100300 */  sll        $v0, $v1, 1
    /* 62DE4 80072DE4 21104300 */  addu       $v0, $v0, $v1
    /* 62DE8 80072DE8 80100200 */  sll        $v0, $v0, 2
    /* 62DEC 80072DEC 21104300 */  addu       $v0, $v0, $v1
    /* 62DF0 80072DF0 00110200 */  sll        $v0, $v0, 4
    /* 62DF4 80072DF4 23104300 */  subu       $v0, $v0, $v1
    /* 62DF8 80072DF8 80100200 */  sll        $v0, $v0, 2
    /* 62DFC 80072DFC 21104300 */  addu       $v0, $v0, $v1
    /* 62E00 80072E00 C0100200 */  sll        $v0, $v0, 3
    /* 62E04 80072E04 0E80013C */  lui        $at, %hi(plr + 0x1928)
    /* 62E08 80072E08 21082200 */  addu       $at, $at, $v0
    /* 62E0C 80072E0C 60BE248C */  lw         $a0, %lo(plr + 0x1928)($at)
    /* 62E10 80072E10 D2C1010C */  jal        TakePlrsMoney__Fl
    /* 62E14 80072E14 00000000 */   nop
    /* 62E18 80072E18 02A9010C */  jal        StoreAutoPlace__Fv
    /* 62E1C 80072E1C 00000000 */   nop
    /* 62E20 80072E20 0C000224 */  addiu      $v0, $zero, 0xC
    /* 62E24 80072E24 1280043C */  lui        $a0, %hi(myplr)
    /* 62E28 80072E28 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 62E2C 80072E2C 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 62E30 80072E30 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 62E34 80072E34 C0100300 */  sll        $v0, $v1, 3
    /* 62E38 80072E38 23104300 */  subu       $v0, $v0, $v1
    /* 62E3C 80072E3C 80100200 */  sll        $v0, $v0, 2
    /* 62E40 80072E40 23104300 */  subu       $v0, $v0, $v1
    /* 62E44 80072E44 80100200 */  sll        $v0, $v0, 2
    /* 62E48 80072E48 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 62E4C 80072E4C 0E80013C */  lui        $at, %hi(_boyitem + 0x2C)
    /* 62E50 80072E50 21082200 */  addu       $at, $at, $v0
    /* 62E54 80072E54 240B23A4 */  sh         $v1, %lo(_boyitem + 0x2C)($at)
    /* 62E58 80072E58 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 62E5C 80072E5C 01000524 */   addiu     $a1, $zero, 0x1
    /* 62E60 80072E60 1000BF8F */  lw         $ra, 0x10($sp)
    /* 62E64 80072E64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 62E68 80072E68 0800E003 */  jr         $ra
    /* 62E6C 80072E6C 00000000 */   nop
endlabel BoyBuyItem__Fv
