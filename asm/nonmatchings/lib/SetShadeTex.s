.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetShadeTex, 0x28

glabel SetShadeTex
    /* 3224 80013224 0400A010 */  beqz       $a1, .L80013238
    /* 3228 80013228 00000000 */   nop
    /* 322C 8001322C 07008290 */  lbu        $v0, 0x7($a0)
    /* 3230 80013230 914C0008 */  j          .L80013244
    /* 3234 80013234 01004234 */   ori       $v0, $v0, 0x1
  .L80013238:
    /* 3238 80013238 07008290 */  lbu        $v0, 0x7($a0)
    /* 323C 8001323C 00000000 */  nop
    /* 3240 80013240 FE004230 */  andi       $v0, $v0, 0xFE
  .L80013244:
    /* 3244 80013244 0800E003 */  jr         $ra
    /* 3248 80013248 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetShadeTex
