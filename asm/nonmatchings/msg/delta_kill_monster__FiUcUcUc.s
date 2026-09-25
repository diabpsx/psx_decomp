.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_kill_monster__FiUcUcUc, 0x9C

glabel delta_kill_monster__FiUcUcUc
    /* 3EAF4 8004EAF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3EAF8 8004EAF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3EAFC 8004EAFC 21808000 */  addu       $s0, $a0, $zero
    /* 3EB00 8004EB00 FF00E430 */  andi       $a0, $a3, 0xFF
    /* 3EB04 8004EB04 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3EB08 8004EB08 2190A000 */  addu       $s2, $a1, $zero
    /* 3EB0C 8004EB0C 1280053C */  lui        $a1, %hi(setlevel)
    /* 3EB10 8004EB10 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3EB14 8004EB14 01000224 */  addiu      $v0, $zero, 0x1
    /* 3EB18 8004EB18 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3EB1C 8004EB1C 2188C000 */  addu       $s1, $a2, $zero
    /* 3EB20 8004EB20 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3EB24 8004EB24 B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3EB28 8004EB28 224A010C */  jal        GetDLevel__Fib
    /* 3EB2C 8004EB2C 2B280500 */   sltu      $a1, $zero, $a1
    /* 3EB30 8004EB30 C0281000 */  sll        $a1, $s0, 3
    /* 3EB34 8004EB34 680CA524 */  addiu      $a1, $a1, 0xC68
    /* 3EB38 8004EB38 21284500 */  addu       $a1, $v0, $a1
    /* 3EB3C 8004EB3C 40181000 */  sll        $v1, $s0, 1
    /* 3EB40 8004EB40 21187000 */  addu       $v1, $v1, $s0
    /* 3EB44 8004EB44 80180300 */  sll        $v1, $v1, 2
    /* 3EB48 8004EB48 21187000 */  addu       $v1, $v1, $s0
    /* 3EB4C 8004EB4C C0180300 */  sll        $v1, $v1, 3
    /* 3EB50 8004EB50 0000B2A0 */  sb         $s2, 0x0($a1)
    /* 3EB54 8004EB54 0100B1A0 */  sb         $s1, 0x1($a1)
    /* 3EB58 8004EB58 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 3EB5C 8004EB5C 21082300 */  addu       $at, $at, $v1
    /* 3EB60 8004EB60 D0532390 */  lbu        $v1, %lo(monster + 0x3C)($at)
    /* 3EB64 8004EB64 21204000 */  addu       $a0, $v0, $zero
    /* 3EB68 8004EB68 0400A0AC */  sw         $zero, 0x4($a1)
    /* 3EB6C 8004EB6C 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3EB70 8004EB70 0200A3A0 */   sb        $v1, 0x2($a1)
    /* 3EB74 8004EB74 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3EB78 8004EB78 1800B28F */  lw         $s2, 0x18($sp)
    /* 3EB7C 8004EB7C 1400B18F */  lw         $s1, 0x14($sp)
    /* 3EB80 8004EB80 1000B08F */  lw         $s0, 0x10($sp)
    /* 3EB84 8004EB84 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3EB88 8004EB88 0800E003 */  jr         $ra
    /* 3EB8C 8004EB8C 00000000 */   nop
endlabel delta_kill_monster__FiUcUcUc
