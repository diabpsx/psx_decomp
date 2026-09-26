.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDungeon__Fv, 0x48

glabel InitDungeon__Fv
    /* A24C 80143E44 21280000 */  addu       $a1, $zero, $zero
    /* A250 80143E48 1480073C */  lui        $a3, %hi(predungeon)
    /* A254 80143E4C C82DE724 */  addiu      $a3, $a3, %lo(predungeon)
    /* A258 80143E50 20000624 */  addiu      $a2, $zero, 0x20
  .L80143E54:
    /* A25C 80143E54 21200000 */  addu       $a0, $zero, $zero
    /* A260 80143E58 2118E000 */  addu       $v1, $a3, $zero
  .L80143E5C:
    /* A264 80143E5C 21106500 */  addu       $v0, $v1, $a1
    /* A268 80143E60 000046A0 */  sb         $a2, 0x0($v0)
    /* A26C 80143E64 01008424 */  addiu      $a0, $a0, 0x1
    /* A270 80143E68 28008228 */  slti       $v0, $a0, 0x28
    /* A274 80143E6C FBFF4014 */  bnez       $v0, .L80143E5C
    /* A278 80143E70 28006324 */   addiu     $v1, $v1, 0x28
    /* A27C 80143E74 0100A524 */  addiu      $a1, $a1, 0x1
    /* A280 80143E78 2800A228 */  slti       $v0, $a1, 0x28
    /* A284 80143E7C F5FF4014 */  bnez       $v0, .L80143E54
    /* A288 80143E80 00000000 */   nop
    /* A28C 80143E84 0800E003 */  jr         $ra
    /* A290 80143E88 00000000 */   nop
endlabel InitDungeon__Fv
