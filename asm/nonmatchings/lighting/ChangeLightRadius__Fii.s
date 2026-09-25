.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeLightRadius__Fii, 0x20

glabel ChangeLightRadius__Fii
    /* 3D364 8004D364 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3D368 8004D368 04008210 */  beq        $a0, $v0, .L8004D37C
    /* 3D36C 8004D36C C0100400 */   sll       $v0, $a0, 3
    /* 3D370 8004D370 0D80013C */  lui        $at, %hi(LightList + 0x2)
    /* 3D374 8004D374 21082200 */  addu       $at, $at, $v0
    /* 3D378 8004D378 026325A4 */  sh         $a1, %lo(LightList + 0x2)($at)
  .L8004D37C:
    /* 3D37C 8004D37C 0800E003 */  jr         $ra
    /* 3D380 8004D380 00000000 */   nop
endlabel ChangeLightRadius__Fii
