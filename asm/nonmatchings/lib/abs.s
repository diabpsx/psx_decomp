.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching abs, 0x20

glabel abs
    /* 5B4 800105B4 0080093C */  lui        $t1, (0x80000000 >> 16)
    /* 5B8 800105B8 24488900 */  and        $t1, $a0, $t1
    /* 5BC 800105BC 03002011 */  beqz       $t1, .L800105CC
    /* 5C0 800105C0 22400400 */   neg       $t0, $a0 /* handwritten instruction */
    /* 5C4 800105C4 0800E003 */  jr         $ra
    /* 5C8 800105C8 21100001 */   addu      $v0, $t0, $zero
  .L800105CC:
    /* 5CC 800105CC 0800E003 */  jr         $ra
    /* 5D0 800105D0 21108000 */   addu      $v0, $a0, $zero
endlabel abs
