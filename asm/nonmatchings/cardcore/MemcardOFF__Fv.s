.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MemcardOFF__Fv, 0x38

glabel MemcardOFF__Fv
    /* 95558 800A5558 700A848F */  lw         $a0, %gp_rel(MemcardTask)($gp)
    /* 9555C 800A555C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 95560 800A5560 1000BFAF */  sw         $ra, 0x10($sp)
    /* 95564 800A5564 5281000C */  jal        TSK_Kill
    /* 95568 800A5568 00000000 */   nop
    /* 9556C 800A556C 840A80AF */  sw         $zero, %gp_rel(card_active + 0x4)($gp)
    /* 95570 800A5570 800A80AF */  sw         $zero, %gp_rel(card_active)($gp)
    /* 95574 800A5574 E00980AF */  sw         $zero, %gp_rel(MemCardActive)($gp)
    /* 95578 800A5578 AA64020C */  jal        STR_resumeall__Fv
    /* 9557C 800A557C 00000000 */   nop
    /* 95580 800A5580 1000BF8F */  lw         $ra, 0x10($sp)
    /* 95584 800A5584 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 95588 800A5588 0800E003 */  jr         $ra
    /* 9558C 800A558C 00000000 */   nop
endlabel MemcardOFF__Fv
