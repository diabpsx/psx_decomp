.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateGoatShrine__Fiii, 0xA8

glabel OperateGoatShrine__Fiii
    /* 4CF20 8005CF20 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4CF24 8005CF24 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4CF28 8005CF28 21908000 */  addu       $s2, $a0, $zero
    /* 4CF2C 8005CF2C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4CF30 8005CF30 2188A000 */  addu       $s1, $a1, $zero
    /* 4CF34 8005CF34 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4CF38 8005CF38 40801100 */  sll        $s0, $s1, 1
    /* 4CF3C 8005CF3C 21801102 */  addu       $s0, $s0, $s1
    /* 4CF40 8005CF40 80801000 */  sll        $s0, $s0, 2
    /* 4CF44 8005CF44 23801102 */  subu       $s0, $s0, $s1
    /* 4CF48 8005CF48 80801000 */  sll        $s0, $s0, 2
    /* 4CF4C 8005CF4C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 4CF50 8005CF50 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4CF54 8005CF54 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4CF58 8005CF58 21083000 */  addu       $at, $at, $s0
    /* 4CF5C 8005CF5C 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4CF60 8005CF60 B3F6000C */  jal        SetRndSeed__Fl
    /* 4CF64 8005CF64 2198C000 */   addu      $s3, $a2, $zero
    /* 4CF68 8005CF68 8D73010C */  jal        FindValidShrine__Fi
    /* 4CF6C 8005CF6C 21202002 */   addu      $a0, $s1, $zero
    /* 4CF70 8005CF70 21204002 */  addu       $a0, $s2, $zero
    /* 4CF74 8005CF74 21282002 */  addu       $a1, $s1, $zero
    /* 4CF78 8005CF78 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4CF7C 8005CF7C 21083000 */  addu       $at, $at, $s0
    /* 4CF80 8005CF80 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 4CF84 8005CF84 1E69010C */  jal        OperateShrine__Fiii
    /* 4CF88 8005CF88 21306002 */   addu      $a2, $s3, $zero
    /* 4CF8C 8005CF8C 02000224 */  addiu      $v0, $zero, 0x2
    /* 4CF90 8005CF90 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 4CF94 8005CF94 21083000 */  addu       $at, $at, $s0
    /* 4CF98 8005CF98 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 4CF9C 8005CF9C FF000224 */  addiu      $v0, $zero, 0xFF
    /* 4CFA0 8005CFA0 1280013C */  lui        $at, %hi(force_redraw)
    /* 4CFA4 8005CFA4 90B722AC */  sw         $v0, %lo(force_redraw)($at)
    /* 4CFA8 8005CFA8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 4CFAC 8005CFAC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 4CFB0 8005CFB0 1800B28F */  lw         $s2, 0x18($sp)
    /* 4CFB4 8005CFB4 1400B18F */  lw         $s1, 0x14($sp)
    /* 4CFB8 8005CFB8 1000B08F */  lw         $s0, 0x10($sp)
    /* 4CFBC 8005CFBC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4CFC0 8005CFC0 0800E003 */  jr         $ra
    /* 4CFC4 8005CFC4 00000000 */   nop
endlabel OperateGoatShrine__Fiii
