.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCur__C4CPad_800b02f4, 0x28

glabel GetCur__C4CPad_800b02f4
    /* A02F4 800B02F4 00008290 */  lbu        $v0, 0x0($a0)
    /* A02F8 800B02F8 00000000 */  nop
    /* A02FC 800B02FC 04004014 */  bnez       $v0, .L800B0310
    /* A0300 800B0300 00000000 */   nop
    /* A0304 800B0304 08008294 */  lhu        $v0, 0x8($a0)
    /* A0308 800B0308 C5C00208 */  j          .L800B0314
    /* A030C 800B030C 00000000 */   nop
  .L800B0310:
    /* A0310 800B0310 12008294 */  lhu        $v0, 0x12($a0)
  .L800B0314:
    /* A0314 800B0314 0800E003 */  jr         $ra
    /* A0318 800B0318 00000000 */   nop
endlabel GetCur__C4CPad_800b02f4
