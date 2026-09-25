.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _patch_card2, 0x70

glabel _patch_card2
    /* AA88 8001AA88 1380013C */  lui        $at, %hi(D_80130120)
    /* AA8C 8001AA8C 20013FAC */  sw         $ra, %lo(D_80130120)($at)
    /* AA90 8001AA90 6346000C */  jal        EnterCriticalSection
    /* AA94 8001AA94 00000000 */   nop
    /* AA98 8001AA98 57000924 */  addiu      $t1, $zero, 0x57
    /* AA9C 8001AA9C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* AAA0 8001AAA0 09F84001 */  jalr       $t2
    /* AAA4 8001AAA4 00000000 */   nop
    /* AAA8 8001AAA8 6C01428C */  lw         $v0, 0x16C($v0)
    /* AAAC 8001AAAC 00000000 */  nop
    /* AAB0 8001AAB0 C809438C */  lw         $v1, 0x9C8($v0)
    /* AAB4 8001AAB4 02800A3C */  lui        $t2, %hi(D_8001A9E0)
    /* AAB8 8001AAB8 E0A94A25 */  addiu      $t2, $t2, %lo(D_8001A9E0)
    /* AABC 8001AABC 0280093C */  lui        $t1, %hi(_patch_card)
    /* AAC0 8001AAC0 F4A92925 */  addiu      $t1, $t1, %lo(_patch_card)
  .L8001AAC4:
    /* AAC4 8001AAC4 0000488D */  lw         $t0, 0x0($t2)
    /* AAC8 8001AAC8 00000000 */  nop
    /* AACC 8001AACC C80948AC */  sw         $t0, 0x9C8($v0)
    /* AAD0 8001AAD0 04004A25 */  addiu      $t2, $t2, 0x4
    /* AAD4 8001AAD4 FBFF4915 */  bne        $t2, $t1, .L8001AAC4
    /* AAD8 8001AAD8 04004224 */   addiu     $v0, $v0, 0x4
    /* AADC 8001AADC 4F46000C */  jal        FlushCache
    /* AAE0 8001AAE0 00000000 */   nop
    /* AAE4 8001AAE4 13801F3C */  lui        $ra, %hi(D_80130120)
    /* AAE8 8001AAE8 2001FF8F */  lw         $ra, %lo(D_80130120)($ra)
    /* AAEC 8001AAEC 00000000 */  nop
    /* AAF0 8001AAF0 0800E003 */  jr         $ra
    /* AAF4 8001AAF4 00000000 */   nop
endlabel _patch_card2
