.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddLight__Fiii, 0x58

glabel AddLight__Fiii
    /* 3D2E8 8004D2E8 9411838F */  lw         $v1, %gp_rel(numlights)($gp)
    /* 3D2EC 8004D2EC 00000000 */  nop
    /* 3D2F0 8004D2F0 50006228 */  slti       $v0, $v1, 0x50
    /* 3D2F4 8004D2F4 10004010 */  beqz       $v0, .L8004D338
    /* 3D2F8 8004D2F8 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 3D2FC 8004D2FC 01006224 */  addiu      $v0, $v1, 0x1
    /* 3D300 8004D300 941182AF */  sw         $v0, %gp_rel(numlights)($gp)
    /* 3D304 8004D304 0D80013C */  lui        $at, %hi(lightactive)
    /* 3D308 8004D308 21082300 */  addu       $at, $at, $v1
    /* 3D30C 8004D30C 80652790 */  lbu        $a3, %lo(lightactive)($at)
    /* 3D310 8004D310 0D80033C */  lui        $v1, %hi(LightList)
    /* 3D314 8004D314 00636324 */  addiu      $v1, $v1, %lo(LightList)
    /* 3D318 8004D318 C0100700 */  sll        $v0, $a3, 3
    /* 3D31C 8004D31C 21104300 */  addu       $v0, $v0, $v1
    /* 3D320 8004D320 000044A0 */  sb         $a0, 0x0($v0)
    /* 3D324 8004D324 010045A0 */  sb         $a1, 0x1($v0)
    /* 3D328 8004D328 020046A4 */  sh         $a2, 0x2($v0)
    /* 3D32C 8004D32C 060040A0 */  sb         $zero, 0x6($v0)
    /* 3D330 8004D330 070040A0 */  sb         $zero, 0x7($v0)
    /* 3D334 8004D334 050040A0 */  sb         $zero, 0x5($v0)
  .L8004D338:
    /* 3D338 8004D338 0800E003 */  jr         $ra
    /* 3D33C 8004D33C 2110E000 */   addu      $v0, $a3, $zero
endlabel AddLight__Fiii
