.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching putasyncblock, 0x90

glabel putasyncblock
    /* 150B8 800250B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 150BC 800250BC 21288000 */  addu       $a1, $a0, $zero
    /* 150C0 800250C0 0700A004 */  bltz       $a1, .L800250E0
    /* 150C4 800250C4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 150C8 800250C8 1380023C */  lui        $v0, %hi(async)
    /* 150CC 800250CC 4850428C */  lw         $v0, %lo(async)($v0)
    /* 150D0 800250D0 00000000 */  nop
    /* 150D4 800250D4 2A10A200 */  slt        $v0, $a1, $v0
    /* 150D8 800250D8 0E004014 */  bnez       $v0, .L80025114
    /* 150DC 800250DC 40180500 */   sll       $v1, $a1, 1
  .L800250E0:
    /* 150E0 800250E0 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 150E4 800250E4 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 150E8 800250E8 1280013C */  lui        $at, %hi(abortfile)
    /* 150EC 800250EC B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 150F0 800250F0 6B080224 */  addiu      $v0, $zero, 0x86B
    /* 150F4 800250F4 1180043C */  lui        $a0, %hi(D_8010EA78)
    /* 150F8 800250F8 78EA8424 */  addiu      $a0, $a0, %lo(D_8010EA78)
    /* 150FC 800250FC 1280013C */  lui        $at, %hi(abortline)
    /* 15100 80025100 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 15104 80025104 0F95000C */  jal        abortmessage
    /* 15108 80025108 00000000 */   nop
    /* 1510C 8002510C 4E940008 */  j          .L80025138
    /* 15110 80025110 00000000 */   nop
  .L80025114:
    /* 15114 80025114 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 15118 80025118 4C50848C */  lw         $a0, %lo(D_8013504C)($a0)
    /* 1511C 8002511C 21186500 */  addu       $v1, $v1, $a1
    /* 15120 80025120 00110300 */  sll        $v0, $v1, 4
    /* 15124 80025124 23104300 */  subu       $v0, $v0, $v1
    /* 15128 80025128 80100200 */  sll        $v0, $v0, 2
    /* 1512C 8002512C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 15130 80025130 21104400 */  addu       $v0, $v0, $a0
    /* 15134 80025134 9C0043AC */  sw         $v1, 0x9C($v0)
  .L80025138:
    /* 15138 80025138 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1513C 8002513C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 15140 80025140 0800E003 */  jr         $ra
    /* 15144 80025144 00000000 */   nop
endlabel putasyncblock
