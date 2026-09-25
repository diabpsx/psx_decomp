.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __14CPauseMessages, 0x14

glabel __14CPauseMessages
    /* 793B0 800893B0 21108000 */  addu       $v0, $a0, $zero
    /* 793B4 800893B4 1180033C */  lui        $v1, %hi(D_80110428)
    /* 793B8 800893B8 28046324 */  addiu      $v1, $v1, %lo(D_80110428)
    /* 793BC 800893BC 0800E003 */  jr         $ra
    /* 793C0 800893C0 040043AC */   sw        $v1, 0x4($v0)
endlabel __14CPauseMessages
