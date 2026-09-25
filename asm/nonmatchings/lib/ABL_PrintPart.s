.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching ABL_PrintPart, 0xAC

glabel ABL_PrintPart
    /* E00 80010E00 00800148 */  mfc2       $at, $16 /* handwritten instruction */
    /* E04 80010E04 00700748 */  mfc2       $a3, $14 /* handwritten instruction */
    /* E08 80010E08 04008A84 */  lh         $t2, 0x4($a0)
    /* E0C 80010E0C 06008B84 */  lh         $t3, 0x6($a0)
    /* E10 80010E10 21402A00 */  addu       $t0, $at, $t2
    /* E14 80010E14 00680148 */  mfc2       $at, $13 /* handwritten instruction */
    /* E18 80010E18 00000000 */  nop
    /* E1C 80010E1C 23482B00 */  subu       $t1, $at, $t3
    /* E20 80010E20 0700E010 */  beqz       $a3, .L80010E40
    /* E24 80010E24 3C000124 */   addiu     $at, $zero, 0x3C
    /* E28 80010E28 0F00AA90 */  lbu        $t2, 0xF($a1)
    /* E2C 80010E2C 00000000 */  nop
    /* E30 80010E30 02004A31 */  andi       $t2, $t2, 0x2
    /* E34 80010E34 02000A14 */  bne        $zero, $t2, .L80010E40
    /* E38 80010E38 00000000 */   nop
    /* E3C 80010E3C 02002134 */  ori        $at, $at, 0x2
  .L80010E40:
    /* E40 80010E40 0700C1A0 */  sb         $at, 0x7($a2)
    /* E44 80010E44 0000A18C */  lw         $at, 0x0($a1)
    /* E48 80010E48 00000000 */  nop
    /* E4C 80010E4C 0C00C1AC */  sw         $at, 0xC($a2)
    /* E50 80010E50 0400A18C */  lw         $at, 0x4($a1)
    /* E54 80010E54 00000000 */  nop
    /* E58 80010E58 1800C1AC */  sw         $at, 0x18($a2)
    /* E5C 80010E5C 0800AA84 */  lh         $t2, 0x8($a1)
    /* E60 80010E60 0A00AB84 */  lh         $t3, 0xA($a1)
    /* E64 80010E64 2400CAA4 */  sh         $t2, 0x24($a2)
    /* E68 80010E68 3000CBA4 */  sh         $t3, 0x30($a2)
    /* E6C 80010E6C 0C00A190 */  lbu        $at, 0xC($a1)
    /* E70 80010E70 0D00AA90 */  lbu        $t2, 0xD($a1)
    /* E74 80010E74 20080101 */  add        $at, $t0, $at /* handwritten instruction */
    /* E78 80010E78 20502A01 */  add        $t2, $t1, $t2 /* handwritten instruction */
    /* E7C 80010E7C 0800C8A4 */  sh         $t0, 0x8($a2)
    /* E80 80010E80 0A00C9A4 */  sh         $t1, 0xA($a2)
    /* E84 80010E84 1400C1A4 */  sh         $at, 0x14($a2)
    /* E88 80010E88 1600C9A4 */  sh         $t1, 0x16($a2)
    /* E8C 80010E8C 2000C8A4 */  sh         $t0, 0x20($a2)
    /* E90 80010E90 2200CAA4 */  sh         $t2, 0x22($a2)
    /* E94 80010E94 2C00C1A4 */  sh         $at, 0x2C($a2)
    /* E98 80010E98 2E00CAA4 */  sh         $t2, 0x2E($a2)
    /* E9C 80010E9C 0C000124 */  addiu      $at, $zero, 0xC
    /* EA0 80010EA0 0300C1A0 */  sb         $at, 0x3($a2)
    /* EA4 80010EA4 0800E003 */  jr         $ra
    /* EA8 80010EA8 00000000 */   nop
endlabel ABL_PrintPart
