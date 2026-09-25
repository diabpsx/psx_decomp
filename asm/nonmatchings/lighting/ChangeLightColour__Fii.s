.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeLightColour__Fii, 0x28

glabel ChangeLightColour__Fii
    /* 3D40C 8004D40C C0200400 */  sll        $a0, $a0, 3
    /* 3D410 8004D410 0D80023C */  lui        $v0, %hi(LightList)
    /* 3D414 8004D414 00634224 */  addiu      $v0, $v0, %lo(LightList)
    /* 3D418 8004D418 21208200 */  addu       $a0, $a0, $v0
    /* 3D41C 8004D41C 02008294 */  lhu        $v0, 0x2($a0)
    /* 3D420 8004D420 00000000 */  nop
    /* 3D424 8004D424 0F004230 */  andi       $v0, $v0, 0xF
    /* 3D428 8004D428 25104500 */  or         $v0, $v0, $a1
    /* 3D42C 8004D42C 0800E003 */  jr         $ra
    /* 3D430 8004D430 020082A4 */   sh        $v0, 0x2($a0)
endlabel ChangeLightColour__Fii
