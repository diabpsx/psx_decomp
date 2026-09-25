.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateCauldron__Fiii, 0xA4

glabel OperateCauldron__Fiii
    /* 4CFC8 8005CFC8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4CFCC 8005CFCC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4CFD0 8005CFD0 21908000 */  addu       $s2, $a0, $zero
    /* 4CFD4 8005CFD4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4CFD8 8005CFD8 2188A000 */  addu       $s1, $a1, $zero
    /* 4CFDC 8005CFDC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4CFE0 8005CFE0 40801100 */  sll        $s0, $s1, 1
    /* 4CFE4 8005CFE4 21801102 */  addu       $s0, $s0, $s1
    /* 4CFE8 8005CFE8 80801000 */  sll        $s0, $s0, 2
    /* 4CFEC 8005CFEC 23801102 */  subu       $s0, $s0, $s1
    /* 4CFF0 8005CFF0 80801000 */  sll        $s0, $s0, 2
    /* 4CFF4 8005CFF4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 4CFF8 8005CFF8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4CFFC 8005CFFC 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4D000 8005D000 21083000 */  addu       $at, $at, $s0
    /* 4D004 8005D004 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4D008 8005D008 B3F6000C */  jal        SetRndSeed__Fl
    /* 4D00C 8005D00C 2198C000 */   addu      $s3, $a2, $zero
    /* 4D010 8005D010 8D73010C */  jal        FindValidShrine__Fi
    /* 4D014 8005D014 21202002 */   addu      $a0, $s1, $zero
    /* 4D018 8005D018 21204002 */  addu       $a0, $s2, $zero
    /* 4D01C 8005D01C 21282002 */  addu       $a1, $s1, $zero
    /* 4D020 8005D020 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4D024 8005D024 21083000 */  addu       $at, $at, $s0
    /* 4D028 8005D028 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 4D02C 8005D02C 1E69010C */  jal        OperateShrine__Fiii
    /* 4D030 8005D030 21306002 */   addu      $a2, $s3, $zero
    /* 4D034 8005D034 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 4D038 8005D038 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 4D03C 8005D03C 21083000 */  addu       $at, $at, $s0
    /* 4D040 8005D040 718C20A0 */  sb         $zero, %lo(object + 0x25)($at)
    /* 4D044 8005D044 1280013C */  lui        $at, %hi(force_redraw)
    /* 4D048 8005D048 90B722AC */  sw         $v0, %lo(force_redraw)($at)
    /* 4D04C 8005D04C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 4D050 8005D050 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 4D054 8005D054 1800B28F */  lw         $s2, 0x18($sp)
    /* 4D058 8005D058 1400B18F */  lw         $s1, 0x14($sp)
    /* 4D05C 8005D05C 1000B08F */  lw         $s0, 0x10($sp)
    /* 4D060 8005D060 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4D064 8005D064 0800E003 */  jr         $ra
    /* 4D068 8005D068 00000000 */   nop
endlabel OperateCauldron__Fiii
