.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdLastPos, 0xC

glabel CdLastPos
    /* ACDC 8001ACDC 0B80023C */  lui        $v0, %hi(CD_pos)
    /* ACE0 8001ACE0 0800E003 */  jr         $ra
    /* ACE4 8001ACE4 105F4224 */   addiu     $v0, $v0, %lo(CD_pos)
endlabel CdLastPos
