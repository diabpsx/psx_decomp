.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetVersionString__FPc, 0xD4

glabel GetVersionString__FPc
    /* A0A18 800B0A18 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* A0A1C 800B0A1C 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* A0A20 800B0A20 21888000 */  addu       $s1, $a0, $zero
    /* A0A24 800B0A24 4000BFAF */  sw         $ra, 0x40($sp)
    /* A0A28 800B0A28 3800B0AF */  sw         $s0, 0x38($sp)
    /* A0A2C 800B0A2C 1280023C */  lui        $v0, %hi(D_80119464)
    /* A0A30 800B0A30 64944284 */  lh         $v0, %lo(D_80119464)($v0)
    /* A0A34 800B0A34 1280033C */  lui        $v1, %hi(D_80119466)
    /* A0A38 800B0A38 66946380 */  lb         $v1, %lo(D_80119466)($v1)
    /* A0A3C 800B0A3C 1000A2A7 */  sh         $v0, 0x10($sp)
    /* A0A40 800B0A40 1200A3A3 */  sb         $v1, 0x12($sp)
    /* A0A44 800B0A44 1280023C */  lui        $v0, %hi(D_8011946D)
    /* A0A48 800B0A48 6D944280 */  lb         $v0, %lo(D_8011946D)($v0)
    /* A0A4C 800B0A4C 1280033C */  lui        $v1, %hi(D_8011946E)
    /* A0A50 800B0A50 6E946380 */  lb         $v1, %lo(D_8011946E)($v1)
    /* A0A54 800B0A54 1300A2A3 */  sb         $v0, 0x13($sp)
    /* A0A58 800B0A58 1400A3A3 */  sb         $v1, 0x14($sp)
    /* A0A5C 800B0A5C 1280023C */  lui        $v0, %hi(D_80119468)
    /* A0A60 800B0A60 68944280 */  lb         $v0, %lo(D_80119468)($v0)
    /* A0A64 800B0A64 1280033C */  lui        $v1, %hi(D_80119469)
    /* A0A68 800B0A68 69946380 */  lb         $v1, %lo(D_80119469)($v1)
    /* A0A6C 800B0A6C 1500A2A3 */  sb         $v0, 0x15($sp)
    /* A0A70 800B0A70 1600A3A3 */  sb         $v1, 0x16($sp)
    /* A0A74 800B0A74 1500A383 */  lb         $v1, 0x15($sp)
    /* A0A78 800B0A78 20000224 */  addiu      $v0, $zero, 0x20
    /* A0A7C 800B0A7C 03006214 */  bne        $v1, $v0, .L800B0A8C
    /* A0A80 800B0A80 1000B027 */   addiu     $s0, $sp, 0x10
    /* A0A84 800B0A84 30000224 */  addiu      $v0, $zero, 0x30
    /* A0A88 800B0A88 1500A2A3 */  sb         $v0, 0x15($sp)
  .L800B0A8C:
    /* A0A8C 800B0A8C 21200002 */  addu       $a0, $s0, $zero
    /* A0A90 800B0A90 1280033C */  lui        $v1, %hi(D_80119470)
    /* A0A94 800B0A94 70946394 */  lhu        $v1, %lo(D_80119470)($v1)
    /* A0A98 800B0A98 2E000224 */  addiu      $v0, $zero, 0x2E
    /* A0A9C 800B0A9C 1700A2A3 */  sb         $v0, 0x17($sp)
    /* A0AA0 800B0AA0 1800A3A7 */  sh         $v1, 0x18($sp)
    /* A0AA4 800B0AA4 1280023C */  lui        $v0, %hi(D_80119473)
    /* A0AA8 800B0AA8 73944280 */  lb         $v0, %lo(D_80119473)($v0)
    /* A0AAC 800B0AAC 1280033C */  lui        $v1, %hi(D_80119474)
    /* A0AB0 800B0AB0 74946380 */  lb         $v1, %lo(D_80119474)($v1)
    /* A0AB4 800B0AB4 1A00A2A3 */  sb         $v0, 0x1A($sp)
    /* A0AB8 800B0AB8 1B00A3A3 */  sb         $v1, 0x1B($sp)
    /* A0ABC 800B0ABC 1D21020C */  jal        strupr__FPc
    /* A0AC0 800B0AC0 1C00A0A3 */   sb        $zero, 0x1C($sp)
    /* A0AC4 800B0AC4 21202002 */  addu       $a0, $s1, $zero
    /* A0AC8 800B0AC8 F240000C */  jal        strcpy
    /* A0ACC 800B0ACC 21280002 */   addu      $a1, $s0, $zero
    /* A0AD0 800B0AD0 21102002 */  addu       $v0, $s1, $zero
    /* A0AD4 800B0AD4 4000BF8F */  lw         $ra, 0x40($sp)
    /* A0AD8 800B0AD8 3C00B18F */  lw         $s1, 0x3C($sp)
    /* A0ADC 800B0ADC 3800B08F */  lw         $s0, 0x38($sp)
    /* A0AE0 800B0AE0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* A0AE4 800B0AE4 0800E003 */  jr         $ra
    /* A0AE8 800B0AE8 00000000 */   nop
endlabel GetVersionString__FPc
