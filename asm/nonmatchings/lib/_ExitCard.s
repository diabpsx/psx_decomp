.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _ExitCard, 0x70

glabel _ExitCard
    /* AB2C 8001AB2C 1380013C */  lui        $at, %hi(D_80130130)
    /* AB30 8001AB30 30013FAC */  sw         $ra, %lo(D_80130130)($at)
    /* AB34 8001AB34 6346000C */  jal        EnterCriticalSection
    /* AB38 8001AB38 00000000 */   nop
    /* AB3C 8001AB3C 56000924 */  addiu      $t1, $zero, 0x56
    /* AB40 8001AB40 B0000A24 */  addiu      $t2, $zero, 0xB0
    /* AB44 8001AB44 09F84001 */  jalr       $t2
    /* AB48 8001AB48 00000000 */   nop
    /* AB4C 8001AB4C 1800428C */  lw         $v0, 0x18($v0)
    /* AB50 8001AB50 02800A3C */  lui        $t2, %hi(D_8001AB9C)
    /* AB54 8001AB54 9CAB4A25 */  addiu      $t2, $t2, %lo(D_8001AB9C)
    /* AB58 8001AB58 0280093C */  lui        $t1, %hi(D_8001ABA8)
    /* AB5C 8001AB5C A8AB2925 */  addiu      $t1, $t1, %lo(D_8001ABA8)
  .L8001AB60:
    /* AB60 8001AB60 0000438D */  lw         $v1, 0x0($t2)
    /* AB64 8001AB64 00000000 */  nop
    /* AB68 8001AB68 700043AC */  sw         $v1, 0x70($v0)
    /* AB6C 8001AB6C 04004A25 */  addiu      $t2, $t2, 0x4
    /* AB70 8001AB70 FBFF4915 */  bne        $t2, $t1, .L8001AB60
    /* AB74 8001AB74 04004224 */   addiu     $v0, $v0, 0x4
    /* AB78 8001AB78 4F46000C */  jal        FlushCache
    /* AB7C 8001AB7C 00000000 */   nop
    /* AB80 8001AB80 6746000C */  jal        ExitCriticalSection
    /* AB84 8001AB84 00000000 */   nop
    /* AB88 8001AB88 13801F3C */  lui        $ra, %hi(D_80130130)
    /* AB8C 8001AB8C 3001FF8F */  lw         $ra, %lo(D_80130130)($ra)
    /* AB90 8001AB90 00000000 */  nop
    /* AB94 8001AB94 0800E003 */  jr         $ra
    /* AB98 8001AB98 00000000 */   nop
endlabel _ExitCard
  alabel D_8001AB9C
    /* AB9C 8001AB9C 00000000 */  nop
    /* ABA0 8001ABA0 00000000 */  nop
    /* ABA4 8001ABA4 00000000 */  nop
  alabel D_8001ABA8
    /* ABA8 8001ABA8 00000000 */  nop
