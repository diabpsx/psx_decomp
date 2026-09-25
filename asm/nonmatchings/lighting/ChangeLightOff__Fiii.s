.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeLightOff__Fiii, 0x28

glabel ChangeLightOff__Fiii
    /* 3D3B8 8004D3B8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3D3BC 8004D3BC 06008210 */  beq        $a0, $v0, .L8004D3D8
    /* 3D3C0 8004D3C0 C0100400 */   sll       $v0, $a0, 3
    /* 3D3C4 8004D3C4 0D80033C */  lui        $v1, %hi(LightList)
    /* 3D3C8 8004D3C8 00636324 */  addiu      $v1, $v1, %lo(LightList)
    /* 3D3CC 8004D3CC 21104300 */  addu       $v0, $v0, $v1
    /* 3D3D0 8004D3D0 060045A0 */  sb         $a1, 0x6($v0)
    /* 3D3D4 8004D3D4 070046A0 */  sb         $a2, 0x7($v0)
  .L8004D3D8:
    /* 3D3D8 8004D3D8 0800E003 */  jr         $ra
    /* 3D3DC 8004D3DC 00000000 */   nop
endlabel ChangeLightOff__Fiii
