.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _patch_card, 0x94

glabel _patch_card
    /* A9F4 8001A9F4 1380013C */  lui        $at, %hi(D_80130120)
    /* A9F8 8001A9F8 20013FAC */  sw         $ra, %lo(D_80130120)($at)
    /* A9FC 8001A9FC 6346000C */  jal        EnterCriticalSection
    /* AA00 8001AA00 00000000 */   nop
    /* AA04 8001AA04 56000924 */  addiu      $t1, $zero, 0x56
    /* AA08 8001AA08 B0000A24 */  addiu      $t2, $zero, 0xB0
    /* AA0C 8001AA0C 09F84001 */  jalr       $t2
    /* AA10 8001AA10 00000000 */   nop
    /* AA14 8001AA14 1800428C */  lw         $v0, 0x18($v0)
    /* AA18 8001AA18 00000000 */  nop
    /* AA1C 8001AA1C 7000438C */  lw         $v1, 0x70($v0)
    /* AA20 8001AA20 00000000 */  nop
    /* AA24 8001AA24 FFFF6930 */  andi       $t1, $v1, 0xFFFF
    /* AA28 8001AA28 004C0900 */  sll        $t1, $t1, 16
    /* AA2C 8001AA2C 7400438C */  lw         $v1, 0x74($v0)
    /* AA30 8001AA30 00000000 */  nop
    /* AA34 8001AA34 FFFF6A30 */  andi       $t2, $v1, 0xFFFF
    /* AA38 8001AA38 21182A01 */  addu       $v1, $t1, $t2
    /* AA3C 8001AA3C 28006224 */  addiu      $v0, $v1, 0x28
    /* AA40 8001AA40 02800A3C */  lui        $t2, %hi(D_8001A9CC)
    /* AA44 8001AA44 CCA94A25 */  addiu      $t2, $t2, %lo(D_8001A9CC)
    /* AA48 8001AA48 0280093C */  lui        $t1, %hi(D_8001A9E0)
    /* AA4C 8001AA4C E0A92925 */  addiu      $t1, $t1, %lo(D_8001A9E0)
  .L8001AA50:
    /* AA50 8001AA50 0000438D */  lw         $v1, 0x0($t2)
    /* AA54 8001AA54 00000000 */  nop
    /* AA58 8001AA58 000043AC */  sw         $v1, 0x0($v0)
    /* AA5C 8001AA5C 04004A25 */  addiu      $t2, $t2, 0x4
    /* AA60 8001AA60 FBFF4915 */  bne        $t2, $t1, .L8001AA50
    /* AA64 8001AA64 04004224 */   addiu     $v0, $v0, 0x4
    /* AA68 8001AA68 0100013C */  lui        $at, (0x10000 >> 16)
    /* AA6C 8001AA6C 4F46000C */  jal        FlushCache
    /* AA70 8001AA70 FCDF22AC */   sw        $v0, -0x2004($at)
    /* AA74 8001AA74 13801F3C */  lui        $ra, %hi(D_80130120)
    /* AA78 8001AA78 2001FF8F */  lw         $ra, %lo(D_80130120)($ra)
    /* AA7C 8001AA7C 00000000 */  nop
    /* AA80 8001AA80 0800E003 */  jr         $ra
    /* AA84 8001AA84 00000000 */   nop
endlabel _patch_card
