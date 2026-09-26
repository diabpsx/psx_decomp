.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBookcase__Fi, 0x58

glabel AddBookcase__Fi
    /* 1CE70 80156A68 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CE74 80156A6C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CE78 80156A70 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CE7C 80156A74 B7F6000C */  jal        GetRndSeed__Fv
    /* 1CE80 80156A78 21808000 */   addu      $s0, $a0, $zero
    /* 1CE84 80156A7C 40181000 */  sll        $v1, $s0, 1
    /* 1CE88 80156A80 21187000 */  addu       $v1, $v1, $s0
    /* 1CE8C 80156A84 80180300 */  sll        $v1, $v1, 2
    /* 1CE90 80156A88 23187000 */  subu       $v1, $v1, $s0
    /* 1CE94 80156A8C 80180300 */  sll        $v1, $v1, 2
    /* 1CE98 80156A90 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1CE9C 80156A94 21082300 */  addu       $at, $at, $v1
    /* 1CEA0 80156A98 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1CEA4 80156A9C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1CEA8 80156AA0 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 1CEAC 80156AA4 21082300 */  addu       $at, $at, $v1
    /* 1CEB0 80156AA8 758C22A0 */  sb         $v0, %lo(object + 0x29)($at)
    /* 1CEB4 80156AAC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CEB8 80156AB0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CEBC 80156AB4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CEC0 80156AB8 0800E003 */  jr         $ra
    /* 1CEC4 80156ABC 00000000 */   nop
endlabel AddBookcase__Fi
