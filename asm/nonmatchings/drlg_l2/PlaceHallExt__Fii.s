.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaceHallExt__Fii, 0x38

glabel PlaceHallExt__Fii
    /* A74C 80144344 1480033C */  lui        $v1, %hi(predungeon)
    /* A750 80144348 C82D6324 */  addiu      $v1, $v1, %lo(predungeon)
    /* A754 8014434C 80100400 */  sll        $v0, $a0, 2
    /* A758 80144350 21104400 */  addu       $v0, $v0, $a0
    /* A75C 80144354 C0100200 */  sll        $v0, $v0, 3
    /* A760 80144358 21104300 */  addu       $v0, $v0, $v1
    /* A764 8014435C 21204500 */  addu       $a0, $v0, $a1
    /* A768 80144360 00008390 */  lbu        $v1, 0x0($a0)
    /* A76C 80144364 20000224 */  addiu      $v0, $zero, 0x20
    /* A770 80144368 02006214 */  bne        $v1, $v0, .L80144374
    /* A774 8014436C 2C000224 */   addiu     $v0, $zero, 0x2C
    /* A778 80144370 000082A0 */  sb         $v0, 0x0($a0)
  .L80144374:
    /* A77C 80144374 0800E003 */  jr         $ra
    /* A780 80144378 00000000 */   nop
endlabel PlaceHallExt__Fii
