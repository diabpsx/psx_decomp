.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delalltimers, 0x24

glabel delalltimers
    /* 1FCA4 8002FCA4 07000324 */  addiu      $v1, $zero, 0x7
    /* 1FCA8 8002FCA8 0B80023C */  lui        $v0, %hi(D_800B7060)
    /* 1FCAC 8002FCAC 60704224 */  addiu      $v0, $v0, %lo(D_800B7060)
  .L8002FCB0:
    /* 1FCB0 8002FCB0 000040AC */  sw         $zero, 0x0($v0)
    /* 1FCB4 8002FCB4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1FCB8 8002FCB8 FDFF6104 */  bgez       $v1, .L8002FCB0
    /* 1FCBC 8002FCBC FCFF4224 */   addiu     $v0, $v0, -0x4
    /* 1FCC0 8002FCC0 0800E003 */  jr         $ra
    /* 1FCC4 8002FCC4 00000000 */   nop
endlabel delalltimers
