.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching card_removed__Fi, 0x38

glabel card_removed__Fi
    /* 95690 800A5690 80200400 */  sll        $a0, $a0, 2
    /* 95694 800A5694 02000224 */  addiu      $v0, $zero, 0x2
    /* 95698 800A5698 1280013C */  lui        $at, %hi(card_status)
    /* 9569C 800A569C 21082400 */  addu       $at, $at, $a0
    /* 956A0 800A56A0 DCB322AC */  sw         $v0, %lo(card_status)($at)
    /* 956A4 800A56A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 956A8 800A56A8 1280013C */  lui        $at, %hi(card_usable)
    /* 956AC 800A56AC 21082400 */  addu       $at, $at, $a0
    /* 956B0 800A56B0 E4B320AC */  sw         $zero, %lo(card_usable)($at)
    /* 956B4 800A56B4 1280013C */  lui        $at, %hi(card_dirty)
    /* 956B8 800A56B8 21082400 */  addu       $at, $at, $a0
    /* 956BC 800A56BC E8B122AC */  sw         $v0, %lo(card_dirty)($at)
    /* 956C0 800A56C0 0800E003 */  jr         $ra
    /* 956C4 800A56C4 00000000 */   nop
endlabel card_removed__Fi
