.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_sync_object__FiUcUc, 0x60

glabel delta_sync_object__FiUcUc
    /* 3EF38 8004EF38 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3EF3C 8004EF3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3EF40 8004EF40 21808000 */  addu       $s0, $a0, $zero
    /* 3EF44 8004EF44 01000224 */  addiu      $v0, $zero, 0x1
    /* 3EF48 8004EF48 B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3EF4C 8004EF4C 1280023C */  lui        $v0, %hi(setlevel)
    /* 3EF50 8004EF50 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 3EF54 8004EF54 FF00C430 */  andi       $a0, $a2, 0xFF
    /* 3EF58 8004EF58 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3EF5C 8004EF5C 2188A000 */  addu       $s1, $a1, $zero
    /* 3EF60 8004EF60 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3EF64 8004EF64 224A010C */  jal        GetDLevel__Fib
    /* 3EF68 8004EF68 2B280200 */   sltu      $a1, $zero, $v0
    /* 3EF6C 8004EF6C 21204000 */  addu       $a0, $v0, $zero
    /* 3EF70 8004EF70 E80B1026 */  addiu      $s0, $s0, 0xBE8
    /* 3EF74 8004EF74 21109000 */  addu       $v0, $a0, $s0
    /* 3EF78 8004EF78 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3EF7C 8004EF7C 000051A0 */   sb        $s1, 0x0($v0)
    /* 3EF80 8004EF80 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3EF84 8004EF84 1400B18F */  lw         $s1, 0x14($sp)
    /* 3EF88 8004EF88 1000B08F */  lw         $s0, 0x10($sp)
    /* 3EF8C 8004EF8C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3EF90 8004EF90 0800E003 */  jr         $ra
    /* 3EF94 8004EF94 00000000 */   nop
endlabel delta_sync_object__FiUcUc
