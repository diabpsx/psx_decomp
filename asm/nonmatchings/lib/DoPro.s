.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoPro, 0x50

glabel DoPro
    /* FF4C 8001FF4C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FF50 8001FF50 1280063C */  lui        $a2, %hi(D_8011C9AC)
    /* FF54 8001FF54 ACC9C68C */  lw         $a2, %lo(D_8011C9AC)($a2)
    /* FF58 8001FF58 21288000 */  addu       $a1, $a0, $zero
    /* FF5C 8001FF5C 0B00C010 */  beqz       $a2, .L8001FF8C
    /* FF60 8001FF60 1000BFAF */   sw        $ra, 0x10($sp)
    /* FF64 8001FF64 0800A28C */  lw         $v0, 0x8($a1)
    /* FF68 8001FF68 1280033C */  lui        $v1, %hi(D_8011C9B4)
    /* FF6C 8001FF6C B4C9638C */  lw         $v1, %lo(D_8011C9B4)($v1)
    /* FF70 8001FF70 1280043C */  lui        $a0, %hi(D_8011C9B0)
    /* FF74 8001FF74 B0C9848C */  lw         $a0, %lo(D_8011C9B0)($a0)
    /* FF78 8001FF78 24104300 */  and        $v0, $v0, $v1
    /* FF7C 8001FF7C 03004414 */  bne        $v0, $a0, .L8001FF8C
    /* FF80 8001FF80 00000000 */   nop
    /* FF84 8001FF84 09F8C000 */  jalr       $a2
    /* FF88 8001FF88 2120A000 */   addu      $a0, $a1, $zero
  .L8001FF8C:
    /* FF8C 8001FF8C 1000BF8F */  lw         $ra, 0x10($sp)
    /* FF90 8001FF90 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FF94 8001FF94 0800E003 */  jr         $ra
    /* FF98 8001FF98 00000000 */   nop
endlabel DoPro
