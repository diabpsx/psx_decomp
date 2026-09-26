.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GM_Open__Fv, 0x24

glabel GM_Open__Fv
    /* A0760 800B0760 73010324 */  addiu      $v1, $zero, 0x173
    /* A0764 800B0764 0C80023C */  lui        $v0, %hi(AllDats + 0x5CC)
    /* A0768 800B0768 209A4224 */  addiu      $v0, $v0, %lo(AllDats + 0x5CC)
  .L800B076C:
    /* A076C 800B076C 000040AC */  sw         $zero, 0x0($v0)
    /* A0770 800B0770 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* A0774 800B0774 FDFF6104 */  bgez       $v1, .L800B076C
    /* A0778 800B0778 FCFF4224 */   addiu     $v0, $v0, -0x4
    /* A077C 800B077C 0800E003 */  jr         $ra
    /* A0780 800B0780 00000000 */   nop
endlabel GM_Open__Fv
