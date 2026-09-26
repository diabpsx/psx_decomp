.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeleteMonster__Fi, 0x38

glabel DeleteMonster__Fi
    /* 10F7C 8014AB74 1180053C */  lui        $a1, %hi(monstactive)
    /* 10F80 8014AB78 C4A0A524 */  addiu      $a1, $a1, %lo(monstactive)
    /* 10F84 8014AB7C 40200400 */  sll        $a0, $a0, 1
    /* 10F88 8014AB80 4C1B838F */  lw         $v1, %gp_rel(nummonsters)($gp)
    /* 10F8C 8014AB84 21208500 */  addu       $a0, $a0, $a1
    /* 10F90 8014AB88 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 10F94 8014AB8C 40100300 */  sll        $v0, $v1, 1
    /* 10F98 8014AB90 21104500 */  addu       $v0, $v0, $a1
    /* 10F9C 8014AB94 00004684 */  lh         $a2, 0x0($v0)
    /* 10FA0 8014AB98 00008594 */  lhu        $a1, 0x0($a0)
    /* 10FA4 8014AB9C 4C1B83AF */  sw         $v1, %gp_rel(nummonsters)($gp)
    /* 10FA8 8014ABA0 000045A4 */  sh         $a1, 0x0($v0)
    /* 10FAC 8014ABA4 0800E003 */  jr         $ra
    /* 10FB0 8014ABA8 000086A4 */   sh        $a2, 0x0($a0)
endlabel DeleteMonster__Fi
