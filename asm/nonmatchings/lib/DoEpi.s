.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoEpi, 0x50

glabel DoEpi
    /* FEFC 8001FEFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FF00 8001FF00 1280063C */  lui        $a2, %hi(D_8011C9A8)
    /* FF04 8001FF04 A8C9C68C */  lw         $a2, %lo(D_8011C9A8)($a2)
    /* FF08 8001FF08 21288000 */  addu       $a1, $a0, $zero
    /* FF0C 8001FF0C 0B00C010 */  beqz       $a2, .L8001FF3C
    /* FF10 8001FF10 1000BFAF */   sw        $ra, 0x10($sp)
    /* FF14 8001FF14 0800A28C */  lw         $v0, 0x8($a1)
    /* FF18 8001FF18 1280033C */  lui        $v1, %hi(D_8011C9B4)
    /* FF1C 8001FF1C B4C9638C */  lw         $v1, %lo(D_8011C9B4)($v1)
    /* FF20 8001FF20 1280043C */  lui        $a0, %hi(D_8011C9B0)
    /* FF24 8001FF24 B0C9848C */  lw         $a0, %lo(D_8011C9B0)($a0)
    /* FF28 8001FF28 24104300 */  and        $v0, $v0, $v1
    /* FF2C 8001FF2C 03004414 */  bne        $v0, $a0, .L8001FF3C
    /* FF30 8001FF30 00000000 */   nop
    /* FF34 8001FF34 09F8C000 */  jalr       $a2
    /* FF38 8001FF38 2120A000 */   addu      $a0, $a1, $zero
  .L8001FF3C:
    /* FF3C 8001FF3C 1000BF8F */  lw         $ra, 0x10($sp)
    /* FF40 8001FF40 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FF44 8001FF44 0800E003 */  jr         $ra
    /* FF48 8001FF48 00000000 */   nop
endlabel DoEpi
