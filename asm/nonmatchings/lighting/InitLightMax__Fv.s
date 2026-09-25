.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLightMax__Fv, 0x24

glabel InitLightMax__Fv
    /* 3D280 8004D280 1280023C */  lui        $v0, %hi(light4flag)
    /* 3D284 8004D284 97B74290 */  lbu        $v0, %lo(light4flag)($v0)
    /* 3D288 8004D288 00000000 */  nop
    /* 3D28C 8004D28C 02004014 */  bnez       $v0, .L8004D298
    /* 3D290 8004D290 03000224 */   addiu     $v0, $zero, 0x3
    /* 3D294 8004D294 80FF0224 */  addiu      $v0, $zero, -0x80
  .L8004D298:
    /* 3D298 8004D298 981182A3 */  sb         $v0, %gp_rel(lightmax)($gp)
    /* 3D29C 8004D29C 0800E003 */  jr         $ra
    /* 3D2A0 8004D2A0 00000000 */   nop
endlabel InitLightMax__Fv
