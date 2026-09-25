.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeLightXY__Fiii, 0x2C

glabel ChangeLightXY__Fiii
    /* 3D384 8004D384 C0180400 */  sll        $v1, $a0, 3
    /* 3D388 8004D388 0D80023C */  lui        $v0, %hi(LightList)
    /* 3D38C 8004D38C 00634224 */  addiu      $v0, $v0, %lo(LightList)
    /* 3D390 8004D390 21186200 */  addu       $v1, $v1, $v0
    /* 3D394 8004D394 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3D398 8004D398 03008210 */  beq        $a0, $v0, .L8004D3A8
    /* 3D39C 8004D39C 00000000 */   nop
    /* 3D3A0 8004D3A0 000065A0 */  sb         $a1, 0x0($v1)
    /* 3D3A4 8004D3A4 010066A0 */  sb         $a2, 0x1($v1)
  .L8004D3A8:
    /* 3D3A8 8004D3A8 0800E003 */  jr         $ra
    /* 3D3AC 8004D3AC 00000000 */   nop
endlabel ChangeLightXY__Fiii
