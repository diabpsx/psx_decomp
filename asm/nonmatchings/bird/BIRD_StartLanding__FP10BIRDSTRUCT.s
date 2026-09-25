.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_StartLanding__FP10BIRDSTRUCT, 0xC

glabel BIRD_StartLanding__FP10BIRDSTRUCT
    /* 9C514 800AC514 03000224 */  addiu      $v0, $zero, 0x3
    /* 9C518 800AC518 0800E003 */  jr         $ra
    /* 9C51C 800AC51C 120082A0 */   sb        $v0, 0x12($a0)
endlabel BIRD_StartLanding__FP10BIRDSTRUCT
