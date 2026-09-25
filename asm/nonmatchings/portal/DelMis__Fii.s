.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DelMis__Fii, 0x60

glabel DelMis__Fii
    /* 71220 80081220 1280033C */  lui        $v1, %hi(nummissiles)
    /* 71224 80081224 88C2638C */  lw         $v1, %lo(nummissiles)($v1)
    /* 71228 80081228 7D000224 */  addiu      $v0, $zero, 0x7D
    /* 7122C 8008122C 23104300 */  subu       $v0, $v0, $v1
    /* 71230 80081230 40100200 */  sll        $v0, $v0, 1
    /* 71234 80081234 1080013C */  lui        $at, %hi(missileavail)
    /* 71238 80081238 21082200 */  addu       $at, $at, $v0
    /* 7123C 8008123C 5C2B24A4 */  sh         $a0, %lo(missileavail)($at)
    /* 71240 80081240 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 71244 80081244 1280013C */  lui        $at, %hi(nummissiles)
    /* 71248 80081248 88C222AC */  sw         $v0, %lo(nummissiles)($at)
    /* 7124C 8008124C 0A004018 */  blez       $v0, .L80081278
    /* 71250 80081250 00000000 */   nop
    /* 71254 80081254 0800A210 */  beq        $a1, $v0, .L80081278
    /* 71258 80081258 40180500 */   sll       $v1, $a1, 1
    /* 7125C 8008125C 1080043C */  lui        $a0, %hi(missileactive)
    /* 71260 80081260 602A8424 */  addiu      $a0, $a0, %lo(missileactive)
    /* 71264 80081264 40100200 */  sll        $v0, $v0, 1
    /* 71268 80081268 21104400 */  addu       $v0, $v0, $a0
    /* 7126C 8008126C 00004294 */  lhu        $v0, 0x0($v0)
    /* 71270 80081270 21186400 */  addu       $v1, $v1, $a0
    /* 71274 80081274 000062A4 */  sh         $v0, 0x0($v1)
  .L80081278:
    /* 71278 80081278 0800E003 */  jr         $ra
    /* 7127C 8008127C 00000000 */   nop
endlabel DelMis__Fii
