.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DEC_Open__Fv, 0x24

glabel DEC_Open__Fv
    /* A07A4 800B07A4 09000324 */  addiu      $v1, $zero, 0x9
    /* A07A8 800B07A8 1280023C */  lui        $v0, %hi(D_8011D074)
    /* A07AC 800B07AC 74D04224 */  addiu      $v0, $v0, %lo(D_8011D074)
  .L800B07B0:
    /* A07B0 800B07B0 000040AC */  sw         $zero, 0x0($v0)
    /* A07B4 800B07B4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* A07B8 800B07B8 FDFF6104 */  bgez       $v1, .L800B07B0
    /* A07BC 800B07BC FCFF4224 */   addiu     $v0, $v0, -0x4
    /* A07C0 800B07C0 0800E003 */  jr         $ra
    /* A07C4 800B07C4 00000000 */   nop
endlabel DEC_Open__Fv
