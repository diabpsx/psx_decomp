.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitMonsterSND__Fi, 0x58

glabel InitMonsterSND__Fi
    /* 2D17C 8003D17C 1280023C */  lui        $v0, %hi(gbSndInited)
    /* 2D180 8003D180 99BB4290 */  lbu        $v0, %lo(gbSndInited)($v0)
    /* 2D184 8003D184 00000000 */  nop
    /* 2D188 8003D188 10004010 */  beqz       $v0, .L8003D1CC
    /* 2D18C 8003D18C C0180400 */   sll       $v1, $a0, 3
    /* 2D190 8003D190 23186400 */  subu       $v1, $v1, $a0
    /* 2D194 8003D194 80180300 */  sll        $v1, $v1, 2
    /* 2D198 8003D198 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 2D19C 8003D19C 21082300 */  addu       $at, $at, $v1
    /* 2D1A0 8003D1A0 CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 2D1A4 8003D1A4 00000000 */  nop
    /* 2D1A8 8003D1A8 00110400 */  sll        $v0, $a0, 4
    /* 2D1AC 8003D1AC 23104400 */  subu       $v0, $v0, $a0
    /* 2D1B0 8003D1B0 80100200 */  sll        $v0, $v0, 2
    /* 2D1B4 8003D1B4 1180013C */  lui        $at, %hi(monsterdata + 0x4)
    /* 2D1B8 8003D1B8 21082200 */  addu       $at, $at, $v0
    /* 2D1BC 8003D1BC A0AB2294 */  lhu        $v0, %lo(monsterdata + 0x4)($at)
    /* 2D1C0 8003D1C0 1180013C */  lui        $at, %hi(Monsters + 0x10)
    /* 2D1C4 8003D1C4 21082300 */  addu       $at, $at, $v1
    /* 2D1C8 8003D1C8 CCA322A4 */  sh         $v0, %lo(Monsters + 0x10)($at)
  .L8003D1CC:
    /* 2D1CC 8003D1CC 0800E003 */  jr         $ra
    /* 2D1D0 8003D1D0 00000000 */   nop
endlabel InitMonsterSND__Fi
