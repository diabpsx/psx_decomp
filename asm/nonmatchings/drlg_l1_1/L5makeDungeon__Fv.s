.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5makeDungeon__Fv, 0x8C

glabel L5makeDungeon__Fv
    /* 4004 8013DBFC 21580000 */  addu       $t3, $zero, $zero
    /* 4008 8013DC00 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 400C 8013DC04 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 4010 8013DC08 14800C3C */  lui        $t4, %hi(L5dungeon)
    /* 4014 8013DC0C B0A38C25 */  addiu      $t4, $t4, %lo(L5dungeon)
    /* 4018 8013DC10 50008D25 */  addiu      $t5, $t4, 0x50
  .L8013DC14:
    /* 401C 8013DC14 21500000 */  addu       $t2, $zero, $zero
    /* 4020 8013DC18 40480B00 */  sll        $t1, $t3, 1
    /* 4024 8013DC1C 2140A001 */  addu       $t0, $t5, $zero
    /* 4028 8013DC20 2138C001 */  addu       $a3, $t6, $zero
    /* 402C 8013DC24 21308001 */  addu       $a2, $t4, $zero
  .L8013DC28:
    /* 4030 8013DC28 21280901 */  addu       $a1, $t0, $t1
    /* 4034 8013DC2C A0000825 */  addiu      $t0, $t0, 0xA0
    /* 4038 8013DC30 21202701 */  addu       $a0, $t1, $a3
    /* 403C 8013DC34 00008394 */  lhu        $v1, 0x0($a0)
    /* 4040 8013DC38 2110C900 */  addu       $v0, $a2, $t1
    /* 4044 8013DC3C 000043A0 */  sb         $v1, 0x0($v0)
    /* 4048 8013DC40 00008394 */  lhu        $v1, 0x0($a0)
    /* 404C 8013DC44 6000E724 */  addiu      $a3, $a3, 0x60
    /* 4050 8013DC48 010043A0 */  sb         $v1, 0x1($v0)
    /* 4054 8013DC4C 00008294 */  lhu        $v0, 0x0($a0)
    /* 4058 8013DC50 00000000 */  nop
    /* 405C 8013DC54 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 4060 8013DC58 00008294 */  lhu        $v0, 0x0($a0)
    /* 4064 8013DC5C 01004A25 */  addiu      $t2, $t2, 0x1
    /* 4068 8013DC60 0100A2A0 */  sb         $v0, 0x1($a1)
    /* 406C 8013DC64 28004229 */  slti       $v0, $t2, 0x28
    /* 4070 8013DC68 EFFF4014 */  bnez       $v0, .L8013DC28
    /* 4074 8013DC6C A000C624 */   addiu     $a2, $a2, 0xA0
    /* 4078 8013DC70 01006B25 */  addiu      $t3, $t3, 0x1
    /* 407C 8013DC74 28006229 */  slti       $v0, $t3, 0x28
    /* 4080 8013DC78 E6FF4014 */  bnez       $v0, .L8013DC14
    /* 4084 8013DC7C 00000000 */   nop
    /* 4088 8013DC80 0800E003 */  jr         $ra
    /* 408C 8013DC84 00000000 */   nop
endlabel L5makeDungeon__Fv
