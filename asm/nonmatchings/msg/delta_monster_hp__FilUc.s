.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_monster_hp__FilUc, 0x7C

glabel delta_monster_hp__FilUc
    /* 3EB90 8004EB90 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3EB94 8004EB94 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3EB98 8004EB98 21808000 */  addu       $s0, $a0, $zero
    /* 3EB9C 8004EB9C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3EBA0 8004EBA0 2188A000 */  addu       $s1, $a1, $zero
    /* 3EBA4 8004EBA4 FF00C430 */  andi       $a0, $a2, 0xFF
    /* 3EBA8 8004EBA8 1280053C */  lui        $a1, %hi(setlevel)
    /* 3EBAC 8004EBAC 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3EBB0 8004EBB0 01000224 */  addiu      $v0, $zero, 0x1
    /* 3EBB4 8004EBB4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3EBB8 8004EBB8 B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3EBBC 8004EBBC 224A010C */  jal        GetDLevel__Fib
    /* 3EBC0 8004EBC0 2B280500 */   sltu      $a1, $zero, $a1
    /* 3EBC4 8004EBC4 21204000 */  addu       $a0, $v0, $zero
    /* 3EBC8 8004EBC8 C0801000 */  sll        $s0, $s0, 3
    /* 3EBCC 8004EBCC 680C1026 */  addiu      $s0, $s0, 0xC68
    /* 3EBD0 8004EBD0 21189000 */  addu       $v1, $a0, $s0
    /* 3EBD4 8004EBD4 0400628C */  lw         $v0, 0x4($v1)
    /* 3EBD8 8004EBD8 00000000 */  nop
    /* 3EBDC 8004EBDC 2A102202 */  slt        $v0, $s1, $v0
    /* 3EBE0 8004EBE0 02004010 */  beqz       $v0, .L8004EBEC
    /* 3EBE4 8004EBE4 00000000 */   nop
    /* 3EBE8 8004EBE8 040071AC */  sw         $s1, 0x4($v1)
  .L8004EBEC:
    /* 3EBEC 8004EBEC 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3EBF0 8004EBF0 00000000 */   nop
    /* 3EBF4 8004EBF4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3EBF8 8004EBF8 1400B18F */  lw         $s1, 0x14($sp)
    /* 3EBFC 8004EBFC 1000B08F */  lw         $s0, 0x10($sp)
    /* 3EC00 8004EC00 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3EC04 8004EC04 0800E003 */  jr         $ra
    /* 3EC08 8004EC08 00000000 */   nop
endlabel delta_monster_hp__FilUc
