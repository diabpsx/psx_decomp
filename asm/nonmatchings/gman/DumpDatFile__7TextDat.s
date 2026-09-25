.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpDatFile__7TextDat, 0x74

glabel DumpDatFile__7TextDat
    /* 85224 80095224 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 85228 80095228 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8522C 8009522C 21808000 */  addu       $s0, $a0, $zero
    /* 85230 80095230 1800BFAF */  sw         $ra, 0x18($sp)
    /* 85234 80095234 1400B1AF */  sw         $s1, 0x14($sp)
    /* 85238 80095238 1000048E */  lw         $a0, 0x10($s0)
    /* 8523C 8009523C FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 85240 80095240 0F009110 */  beq        $a0, $s1, .L80095280
    /* 85244 80095244 00000000 */   nop
    /* 85248 80095248 0000028E */  lw         $v0, 0x0($s0)
    /* 8524C 8009524C 00000000 */  nop
    /* 85250 80095250 0B004010 */  beqz       $v0, .L80095280
    /* 85254 80095254 00000000 */   nop
    /* 85258 80095258 1886000C */  jal        GAL_Free
    /* 8525C 8009525C 00000000 */   nop
    /* 85260 80095260 FF004230 */  andi       $v0, $v0, 0xFF
    /* 85264 80095264 05004014 */  bnez       $v0, .L8009527C
    /* 85268 80095268 21200000 */   addu      $a0, $zero, $zero
    /* 8526C 8009526C 1180053C */  lui        $a1, %hi(D_80110588)
    /* 85270 80095270 8805A524 */  addiu      $a1, $a1, %lo(D_80110588)
    /* 85274 80095274 A583000C */  jal        DBG_Error
    /* 85278 80095278 27010624 */   addiu     $a2, $zero, 0x127
  .L8009527C:
    /* 8527C 8009527C 100011AE */  sw         $s1, 0x10($s0)
  .L80095280:
    /* 85280 80095280 1800BF8F */  lw         $ra, 0x18($sp)
    /* 85284 80095284 1400B18F */  lw         $s1, 0x14($sp)
    /* 85288 80095288 1000B08F */  lw         $s0, 0x10($sp)
    /* 8528C 8009528C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 85290 80095290 0800E003 */  jr         $ra
    /* 85294 80095294 00000000 */   nop
endlabel DumpDatFile__7TextDat
